---
author:
    - mos
category:
    - databas
    - sql
    - kurs databas
revision:
    "2019-02-12": "(D, mos) Uppdaterad inför kursen databas."
    "2018-01-09": "(C, mos) Genomgången inför kursen databas."
    "2017-04-25": "(B, mos) Nu även i kursen oophp."
    "2017-03-06": "(A, mos) Första utgåvan inför kursen dbjs."
...
Triggers i databas
==================================

[FIGURE src=/image/snapvt17/triggers.png?w=c5&a=0,50,0,0 class="right"]

Ibland vill man att en händelse skall trigga en annan. Säg att man flyttar pengar mellan konton (i en bank) och man vill att varje sådan flytt skall loggas i en loggtabell.

En flytt av pengarna, eller en UPDATE av kontotabellen, skall trigga igång en händelse som loggar information till loggtabellen.

Till vår hjälp kommer triggers.

<!--more-->



Förutsättning {#pre}
--------------------------------------

Artiklen bygger löst vidare på det exemplet som beskrevs i artikeln "[Lagrade procedurer i databas](kunskap/lagrade-procedurer-i-databas)".

Artikeln visar grunderna i [triggers i MySQL](https://dev.mysql.com/doc/refman/5.7/en/triggers.html) och MariaDB.

Om du jobbar i [SQLite så fungerar triggers](https://www.sqlite.org/lang_createtrigger.html) även där.

[SQL-koden som visas i exemplet](https://github.com/dbwebb-se/databas/blob/master/example/sql/triggers.sql) finner du på GitHub eller i ditt kursrepo databas under `example/sql/triggers.sql`.



Nuvarande exempel {#ex}
--------------------------------------

Låt oss kika på vårt nuvarande exempel som är en lagrad procedur som flyttar pengar mellan två konton, förutsatt att det finns pengar.

Följande kod skapar tabell och innehåll.

```sql
--
-- Example
-- 
DROP TABLE IF EXISTS account;
CREATE TABLE account
(
    `id` CHAR(4) PRIMARY KEY,
    `name` VARCHAR(8),
    `balance` DECIMAL(4, 2)
);

DELETE FROM account;
INSERT INTO account
VALUES
    ('1111', 'Adam', 10.0),
    ('2222', 'Eva', 7.0)
;

SELECT * FROM account;
```

Sedan har vi den lagrade proceduren som utför flytten mellan två konton, i skydd av en transaktion. Proceduren är aningen uppdaterad med ett `MAIN:BEGIN` och `LEAVE MAIN` för att undvika användandet av en ELSE-sats. När man ser att det inte finns pengar på kontot kan man direkt avsluta proceduren, [LEAVE](https://dev.mysql.com/doc/refman/8.0/en/leave.html) kan hjälpa till med det.

```sql
--
-- Procedure move_money()
--
DROP PROCEDURE IF EXISTS move_money;

DELIMITER ;;

CREATE PROCEDURE move_money(
    from_account CHAR(4),
    to_account CHAR(4),
    amount NUMERIC(4, 2)
)
MAIN:BEGIN
    DECLARE current_balance NUMERIC(4, 2);

    START TRANSACTION;

    SELECT balance INTO current_balance FROM account WHERE id = from_account;
    SELECT current_balance;

    IF current_balance - amount < 0 THEN
        ROLLBACK;
        SELECT 'Amount on the account is not enough to make transaction.' AS message;
        LEAVE MAIN;
    END IF;

    UPDATE account 
        SET
            balance = balance + amount
        WHERE
            id = to_account;

    UPDATE account 
        SET
            balance = balance - amount
        WHERE
            id = from_account;

    COMMIT;
    SELECT * FROM account;
END
;;

DELIMITER ;

CALL move_money('1111', '2222', 1.5);
-- SELECT * FROM account;
```

Låt det vara vår startpunkt när vi nu går vidare och bygger ut exemplet med en loggtabell.



En tabell för loggar {#logg}
--------------------------------------

Tanken är att vi har en tabell som loggar alla förändringar i tabellen account. På det viset kan man se samtliga förändringar i balansen och återskapa alla transaktioner som skett.

Det kan vara bra att ha om något går snett. Som felsökning och extra kontroll. Det låter som en bra grej, speciellt när pengar eller liknande känslig data är inblandad.

Vi skapar en loggtabell.

```sql
--
-- Log table
--
DROP TABLE IF EXISTS account_log;
CREATE TABLE account_log
(
    `id` INTEGER PRIMARY KEY AUTO_INCREMENT,
    `when` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `what` VARCHAR(20),
    `account` CHAR(4),
    `balance` DECIMAL(4, 2),
    `amount` DECIMAL(4, 2)
);

-- DELETE FROM account_log;
SELECT * FROM account_log;
```

Det blir en tabell med autoincrementerande id och en kolumn som automatiskt, via [`DEFAULT CURRENT_TIMESTAMP`](https://dev.mysql.com/doc/refman/8.0/en/timestamp-initialization.html), loggar en tidsstämpel för när en rad läggs till i tabellen. I övrigt så loggar vi en anledning till förändringen tillsammans med kontot och det belopp som förändras.

Bra, då är det bara att börja logga.



Logga med SQL i den lagrade proceduren {#loggasp}
--------------------------------------

Bara som ett exempel, innan jag visar triggern, så visar jag hur jag kan utföra loggningen i den lagrade proceduren, med en sedvanlig INSERT sats.

Det handlar om att utföra följande INSERT inom ramen för den lyckade transaktionen.

```sql
INSERT INTO
    account_log (what, account, amount)
    VALUES
        ('move_money from', from_account, -amount),
        ('move_money to', to_account, amount);
```

Det är en enkel INSERT-sats som lägger till två rader, en rad för varje förändring som gjorts. En rad för kontot som minskar och en rad för kontot som ökra. I den lagrade proceduren kan jag förslagsvis lägga koden direkt innan COMMIT.

Här väljer jag att inte logga nuvarande balans för respektive konton, det hade krävt att jag läste av balansen på kontona i en SELECT-sats.

Jag vill logga saker, men inte krångla alltför mycket.

Uppdatera din procedur och provkör den för att se om du får något som loggas.

Så här ser det ut för mig när jag tittar i loggtabellen.

```text
+----+---------------------+-----------------+---------+---------+--------+
| id | when                | what            | account | balance | amount |
+----+---------------------+-----------------+---------+---------+--------+
|  1 | 2019-02-12 10:42:06 | move_money from | 1111    |    NULL |  -1.50 |
|  2 | 2019-02-12 10:42:06 | move_money to   | 2222    |    NULL |   1.50 |
+----+---------------------+-----------------+---------+---------+--------+
2 rows in set (0.01 sec)
```

Då kikar vi på hur man gör med en trigger.



Logga med triggers {#loggatri}
--------------------------------------

Låt oss nu se hur vi kan göra samma sak med en databastrigger. Vi kopplar en trigger till account-tabellen och vid varje UPDATE på account så lägger vi till en ny rad i accountLog-tabellen.

En [trigger](https://dev.mysql.com/doc/refman/8.0/en/create-trigger.html) alltså. En trigger är likt en lagrad procedur ett objekt som sparas i databasen och skapas, redigeras och raderas med CREATE, DROP och ALTER.

```sql
--
-- Trigger for logging updating balance
--
DROP TRIGGER IF EXISTS log_balance_update;

CREATE TRIGGER log_balance_update
AFTER UPDATE
ON account FOR EACH ROW
    INSERT INTO account_log (`what`, `account`, `balance`, `amount`)
        VALUES ('trigger', NEW.id, NEW.balance, NEW.balance - OLD.balance);
```

När du har skapat din trigger enligt ovan så kan du se att den körs, genom att anropa din procedur.

```sql
CALL move_money('1111', '2222', 1.5);
```

Utskriften från loggtabellen kan se ut så här.

```text
+----+---------------------+-----------------+---------+---------+--------+
| id | when                | what            | account | balance | amount |
+----+---------------------+-----------------+---------+---------+--------+
|  1 | 2019-02-12 10:42:06 | move_money from | 1111    |    NULL |  -1.50 |
|  2 | 2019-02-12 10:42:06 | move_money to   | 2222    |    NULL |   1.50 |
|  3 | 2019-02-12 11:13:12 | trigger         | 2222    |   13.00 |   1.50 |
|  4 | 2019-02-12 11:13:12 | trigger         | 1111    |    4.00 |  -1.50 |
|  5 | 2019-02-12 11:13:12 | move_money from | 1111    |    NULL |  -1.50 |
|  6 | 2019-02-12 11:13:12 | move_money to   | 2222    |    NULL |   1.50 |
+----+---------------------+-----------------+---------+---------+--------+
6 rows in set (0.23 sec)
```

Vi kan se de två raderna som är införda av triggern och där finns även balansen införd.

Du bör nu uppdatera din procedur och kommentera bort dess `INSERT INTO account_log` så att du undviker dubbla rader i loggtabellen. Det räcker att triggern sköter loggningen.



Om triggers {#omtri}
--------------------------------------

Låt oss studera koden för den trigger vi nyss skapat.

```sql
CREATE TRIGGER log_balance_update
AFTER UPDATE
ON account FOR EACH ROW
    INSERT INTO account_log (`what`, `account`, `balance`, `amount`)
        VALUES ('trigger', NEW.id, NEW.balance, NEW.balance - OLD.balance);
```

Vad vi ser är en trigger som kommer utföras varje gång någon gör UPDATE på tabellen account, se konstruktionen `UPDATE ON account`. Triggern "ligger i bakgrunden" och databashanterraren sköter själv om kopplingen mellan triggern `log_balance_update` och tabellen `account`.

När det sker en UPDATE på tabellen `account` så kommer triggern att anropas, i bakgrunden, internt av databashanteraren. I vårt fall anropas triggern `AFTER UPDATE`. Man kan också konstruera en trigger som anropas `BEFORE UPDATE` vilket kan vara bra om man vill kontrollera värden innan själva uppdateringen sker.

Förutom `UPDATE` så kan man även skapa triggers som är kopplade till `INSERT` och `DELETE` mot en tabell. I samtliga fall väljer du om du vill göra `BEFORE` eller `AFTER`.

Triggern får indata som är samtliga rader som är på gång att uppdateras, det kan vara en eller flera rader som uppdateras på en gång. Triggern hanterar samliga rader, det är innebörden av `FOR EACH ROW`. Du kan se det som en loop som loopar genom varje rad som håller på att uppdateras.

När man är inne i triggern, inuti loopen, så har man tillgång till den nya raden `NEW` som är den som skall bli, man har också tillgång till den gamla raden `OLD`, den befintliga raden som är på väg att uppdateras.

Du kan se `OLD` som raden innan UPDATE utförs och `NEW` som raden efter att UPDATE är utförd.

I en INSERT trigger har man enbart tillgång till `NEW` och i en DELETE trigger når man endast `OLD`. Men det kanske säger sig självt, om man funderar lite på det. Vad skulle `OLD` innehålla i en INSERT trigger liksom vad skulle `NEW` innehålla i en DELETE trigger. 





Trigger med compound statement {#trigger-compound}
--------------------------------------

I vår trigger ovan utförde vi enbart en INSERT sats. Vi kan också använda compound statements för att bygga kod likt vi gjorde i den lagrade proceduren. Det kan vara bra om vi behöver en mer avancerad konstruktion för triggern.

Det kan se ut så här.

```sql
--
-- Trigger with compound statement
--
DROP TRIGGER IF EXISTS trigger_test1;

DELIMITER ;;

CREATE TRIGGER trigger_test1
AFTER UPDATE
ON account FOR EACH ROW
BEGIN
    -- Some compound statements
END
;;

DELIMITER ;
```

Som du ser så behöver vi göra DELIMITER när vi konstruerar dessa compound statements.



Felhantering med trigger {#felhantering}
--------------------------------------

En trigger kan inte skriva ut saker med SELECT, eller returnera ett resultset. Ett relaterat felmeddelande är då följande.

```text
ERROR 1415 (0A000): Not allowed to return a result set from a trigger
```

Behöver man debugga en trigger på det sättet så kan man skapa en extra tabell som man skriver till.



En trigger som misslyckas {#miss}
--------------------------------------

Du kan ha en BEFORE trigger och låta den misslyckas genom att signalera ett felmeddelande. Den motsvarande operationen INSERT, UPDATE, DELETE kommer då inte att utföras.

Här är ett exempel, vi skapar en trigger som utförs BEFORE UPDATE, men vi låter den signalera ett fel, ett [user defined error](https://dev.mysql.com/doc/refman/8.0/en/signal.html).

```sql
--
-- Trigger with compound statement and user defined errors
--
DROP TRIGGER IF EXISTS trigger_test2;

DELIMITER ;;

CREATE TRIGGER trigger_test2
BEFORE UPDATE
ON account FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000' SET message_text = 'My Error Message';
END
;;

DELIMITER ;
```

Om vi nu prövar att uppdatera tabellen `account` så kommer vi att få ett felmeddelande.

Det kan se ut så här.

```text
mysql> UPDATE account 
    -> SET
    ->     balance = 10.0
    -> ;
ERROR 1644 (45000): My Error Message
```



SHOW TRIGGERS {#show}
--------------------------------------

När man vill se vilka triggers som finns i databasen, och hur de är definierade, så kan man visa dem med [SHOW TRIGGERS](https://dev.mysql.com/doc/refman/8.0/en/show-triggers.html).

```sql
SHOW TRIGGERS;
SHOW TRIGGERS LIKE 'account' \G;
SHOW TRIGGERS FROM dbwebb \G;
```

Det kan vara tydligare att visa de triggers som är kopplade till en viss tabell via `LIKE 'account'` eller visa alla triggers som är kopplade till en viss databas via `FROM dbwebb`.

Svaret blir en lista med triggers och definitionerna för dem.

Eftersom triggers inte "syns" utan de bara verkställer i bakgrunden, så kan det ibland vara lätt att glömma bort att de finns där, i bakgrunden, och utför ett jobb.

Glöm inte bort `SHOW TRIGGERS` för att se vilken eventuell magi som kan dölja sig bakom den vanliga SQL-koden. Om något är skumt, dubbelkolla att du inte glömt kvar en trigger.

Innan du går vidare så bör du ta bort dina två triggers, som du eventuellt skapade för att testa.

```sql
DROP TRIGGER IF EXISTS trigger_test1;
DROP TRIGGER IF EXISTS trigger_test2;
```

Du bör nu enbart ha kvar en trigger.

Det finns möjligheten att se vilken kod som användes för att skapa en trigger.

```sql
SHOW CREATE TRIGGER <trigger-name>;
SHOW CREATE TRIGGER log_balance_update \G;
```

Det visar SQL-koden som skapade triggern, så kan du inspektera om det är "rätt" kod. Ibland är det bra teknik att använda vid felsökning.



Bra att veta {#bra}
--------------------------------------

När du gör DROP på en tabell, så försvinner de trigger som är kopplade till tabellen. Det kan vara bra att veta om det.

I en INSERT trigger är värdet på NEW, för en AUTO_INCREMENT satt till 0 och inte det värdet som nyckeln får när raden är inlagd i tabellen.

Om en BEFORE trigger misslyckas så utförs inte den tänkta operationen.

EN AFTER trigger utförs enbart efter att samtliga BEFORE triggers har utförts och efter att raderna processats med INSERT, UPDATE eller DELETE.



Avslutningsvis {#avslutning}
--------------------------------------

Detta var grunderna i hur triggers fungerar och hur du skapar dem. Kanske kan triggers vara ett sätt att hålla konsistens i din databas och ett sätt att få saker att hända utan att exekvera SQL-kod från klientprogrammen.

Liksom lagrade procedurer erbjuder även triggers ett sätt att tänka i form av API mot en databas. Triggern kan ju utföra flera uppdateringar som användaren inte behöver fundera på.

Det kan vara en nackdel när en databas blir alltför magisk och automatisk. Saker händer utan att man har koll på vad som sker. Felsökningen blir mer utmanande när man behöver ha koll på alla triggers som ligger i bakgrunden.
