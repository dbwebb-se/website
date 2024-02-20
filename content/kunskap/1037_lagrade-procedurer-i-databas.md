---
author:
    - mos
category:
    - databas
    - sql
    - kurs databas
revision:
    "2024-02-20": "(G, mos) Lade tll stycke om variabler."
    "2022-03-09": "(F, mos) Delvis länka till manual i MariaDb om comp stat."
    "2019-02-11": "(E, mos) Genomgången, fler exempel och ny kodstandard."
    "2018-01-11": "(D, mos) Nytt stycke SHOW WARNINGS."
    "2018-01-09": "(C, mos) Genomgången inför kursen databas."
    "2017-04-25": "(B, mos) Nu även i kursen oophp, la till stycke om parametrar och variabler."
    "2017-03-06": "(A, mos) Första utgåvan inför kursen dbjs."
...
Lagrade procedurer i databas
==================================

[FIGURE src=/image/snapvt17/lagrad-procedur.png?w=c5&a=0,20,70,0 class="right"]

Ibland räcker det inte till med enbart SQL utan man behöver någon form av ytterligare programmeringsmässig hantering av informationen. För att ta ett exempel, säg att man vill flytta pengar från ett konto till ett annat, men bara om det finns tillräckligt mycket pengar på kontot.

Man kan naturligtvis koda detta i godtyckligt externt programmeringsspråk. Men kan det finnas en möjlighet att koda sådant direkt i databasen?

Här kommer lagrade procedurer kommer till vår hjälp.

<!--more-->



Förutsättning {#pre}
--------------------------------------

Artiklen bygger löst vidare på det exemplet som beskrevs i artikeln "[Transaktioner i databas](kunskap/transaktioner-i-databas)".

Exemplet visar hur du jobbar med lagrade procedurer i MySQL/MariaDB.

SQLite stödjer inte lagrade procedurer.

[SQL-koden som visas i exemplet](https://github.com/dbwebb-se/databas/blob/master/example/sql/stored_procedure.sql) finner du på GitHub eller i ditt kursrepo databas under `example/sql/stored_procedure.sql`.



Att skriva små program i databasen {#prog}
--------------------------------------

Databasen MariaDB stödjer något de kallar [Compound Statements](https://mariadb.com/kb/en/programmatic-compound-statements/) som är det "programmeringsspråk" som används för att skriva lagrade procedurer och liknande konstruktioner (egen-definierade funktioner och trigger). Compound statements kan liknas med traditionell programmeringskod med variabler och loopar som kan interagera med ren SQL-kod.

Detta ger oss en möjlighet att skriva små program i databasen. Dessa program lagras i databasen, de blir till en del av själva databasen.

Låt oss kika på hur en lagrad procedur kan se ut, skriven med SQL och compound statements.



Exampel {#exempel}
--------------------------------------

Vi tar samma exempel vi använde i "[Transaktioner i databas](kunskap/transaktioner-i-databas)". Adam och Eva skall flytta pengar mellan varandra. SQL-koden för exemplet ser ut så här.

```sql
--
-- Example transactions
--
DROP TABLE IF EXISTS account;
CREATE TABLE account
(
    `id` CHAR(4) PRIMARY KEY,
    `name` VARCHAR(8),
    `balance` DECIMAL(4, 2)
);

INSERT INTO account
VALUES
    ('1111', 'Adam', 10.0),
    ('2222', 'Eva', 7.0)
;

SELECT * FROM account;
```

Det kan se ut så här när tabellen är på plats.

```text
+------+------+---------+
| id   | name | balance |
+------+------+---------+
| 1111 | Adam |   10.00 |
| 2222 | Eva  |    7.00 |
+------+------+---------+
2 rows in set (0.00 sec)
```

Sen är det själva flytten av pengarna, från ett konto till ett annat, som är omslutet av en transaktion.

Adam skall ge 1.5 pengar till Eva.

```sql
--
-- Move the money, within a transaction
--
START TRANSACTION;

UPDATE account
SET
    balance = balance + 1.5
WHERE
    id = '2222';

UPDATE account
SET
    balance = balance - 1.5
WHERE
    id = '1111';

COMMIT;

SELECT * FROM account;
```

Det finns hårdkodade värde i skriptet ova, kan man göra något för att förbättra "kodens struktur"?



Variabler i SQL skript {#var}
--------------------------------------

När man jobbar i ett SQL skript kan man skapa variabler som lever under tiden som skriptet exekveras. Man kan fylla variablerna med värden genom att läsa in data från databasen.

Här är ett exempel på hur man kan flytta pengarna med hjälp av variabler. Kodens struktur blir lite bättre.

```sql
--
-- Move using variables
--
SET @amount = 1.5;
SET @from   = '1111';
SET @to     = '2222';

START TRANSACTION;

SET @balance = (SELECT balance FROM account WHERE id = @from);

UPDATE account SET balance = balance + @amount WHERE id = @to;
UPDATE account SET balance = balance - @amount WHERE id = @from;

COMMIT;

SELECT * FROM account;
```

Vi har dock fortfarande inte en möjlighet att kontroller att balansen inte blir 0 på ett konto. Något i stil med följande IF-sats.

```sql
IF @balance < @amount THEN ROLLBACK;
```

Vad kan en lagrad procedur göra för oss här?



En lagrad procedur för att flytta pengar {#sp}
--------------------------------------

Vi kan egentligen bara flytta pengar om det finns några pengar på kontot. Vi behöver kontrollera om Adam har så mycket pengar på kontot som han nu är benägen att flytta till Eva.

Detta är inget vi direkt kan skriva i SQL, iallafall inte utan att skriva en mer komplex SQL-sats.

Istället gör vi en lagrad procedur som flyttar pengarna, förutsatt att de finns. Principen blir följande:

1. Kolla om pengar finns på kontot
    1. Läs hur mycket pengar som finns på kontot
    1. Gör en IF-sats för att kolla att det är tillräckligt med pengar
1. Flytta pengarna
1. Allt måste ske inom en och samma transaktion



### Delimiter {#delimiter}

För att skapa en lagrad procedur så omsluter vi dess kod på följande sätt, med en [`CREATE PROCEDURE`](https://dev.mysql.com/doc/refman/5.7/en/create-procedure.html).

```sql
--
-- Procedure move_money()
--
DROP PROCEDURE IF EXISTS move_money;

DELIMITER ;;

CREATE PROCEDURE move_money(
    -- Here comes the definition of the parameters
)
    -- Here comes SQL and compund statements
;;

DELIMITER ;
```

Koden ändrar *delimiter* för att koden inuti den lagrade proceduren inte skall krocka med det semikolon som avslutar själva proceduren. Det finns även [beskrivet i manualen](https://dev.mysql.com/doc/refman/8.0/en/stored-programs-defining.html) om varför man gör så här.

Det ar viktig att se hur du först gör `DELIMITER ;;` innan du påbörjar skapandet av proceduren, sedan avslutas proceduren med `;;` och därefter går du direkt tillbaka till `DELIMITER ;` (som vanligt).

De dessa DELIMITER som en naturlig del av skapandet av din procedur.



### Parametrar och body {#create}

Proceduren tar tre parametrar som säger från-konto, till-konto och summan som skall flyttas.


Låt oss göra en minimal procedur för att anropa den, som ett litet test.

```sql
DROP PROCEDURE IF EXISTS move_money;

DELIMITER ;;

CREATE PROCEDURE move_money(
    from_account CHAR(4),
    to_account CHAR(4),
    amount NUMERIC(4, 2)
)
BEGIN
    SELECT from_account, to_account, amount;
END
;;

DELIMITER ;
```

Du kan skapa proceduren, den skall fungera. Glöm inte DELIMITER, jag kommer inte att visa dem i kommande exempel.

Se att procedurens parameterlista har samma datatyper som vi är vana vid från kolumner i tabeller.

Procedurens body är nu på plats, inom ramen av `BEGIN` och `END`. I detta fallet är det en SELECT-sats som kommer att "skriva ut", eller producera, det resultset som blir resultatet från SELECT-satsen.

Då anropar vi proceduren.

```sql
CALL move_money('1111', '2222', 1.5);
```

Så här kan det se ut i terminalen.

```text
mysql> CALL move_money("1111", "2222", 1.5);
+--------------+------------+--------+
| from_account | to_account | amount |
+--------------+------------+--------+
| 1111         | 2222       |   1.50 |
+--------------+------------+--------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)
```

Resultatet blir att parametrarna skrivs ut i SQL-satsen, som en form av resultat från proceduren. En enkel procedur kan alltså vara att samla en eller flera SELECT-satser och skriva ut dem.

Bra, då kan vi skapa och anropa en lagrad procedur, och även skicka parametrar till den. Det är en god start.



### Procedur för move_money {#move}

Då plockar vi in koden som flyttar pengarna, in i proceduren. Det kan se ut så här.

```sql
CREATE PROCEDURE move_money(
    from_account CHAR(4),
    to_account CHAR(4),
    amount NUMERIC(4, 2)
)
BEGIN
    START TRANSACTION;

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
```

Ovan SQL-kod flyttar pengar från ett konto till ett annat, inom ramen för en transaktion.

Nu kan jag anropa proceduren, om och om igen. Om jag kör den tillräckligt många gånger så kommer Eva att bli riktigt rik och Adam motsvarande fattig.

```sql
CALL move_money('1111', '2222', 1.5);
```

Att jag väljer att skriva ut behållningen i slutet med SELECT-satsen är (för tillfället) bara för att det skall vara enklare att utveckla, det blir lite som en `console.log()` eller `echo`. Det är alltså en variant av hur man kan debugga sin lagrade procedur.

Så här långt har vi skapat en lagrad procedur som omsluter en större kodsekvens som jag troligen vill utföra många gånger. Det blir som ett API mot min databas. Om man vill flytta pengar mellan konton så är det rätta sättet att göra det via den lagrade proceduren, inte att skriva egen SQL-kod. Lagrade procedurer kan alltså vara ett sätt att bygga API mot databasen.

Kom ihåg att koden för lagrade procedurer inte nödvändigtvis är kompatibel mellan olika databasmotorer. Det kan vara en nackdel, eller inte.



Kolla om pengar finns {#kolla}
--------------------------------------

Då skall vi se om vi kan uppdatera den lagrade proceduren för att kontrollera att det verkligen finns pengar på kontot, innan flyttan av pengar utförs.

Det första jag vill ha är en lokal variabel som jag tänker fylla med nuvarande balans på kontot. Om balansen inte är tillräcklig så kommer jag att avbryta transaktionen med en ROLLBACK.



### Lokal variabel {#lokal}

Låt oss börja kika på den lokala variabeln `current_balance` och hur den får sitt värde.

```sql
BEGIN
    DECLARE current_balance NUMERIC(4, 2);

    START TRANSACTION;

    SET current_balance = (SELECT balance FROM account WHERE id = from_account);
    SELECT current_balance;

    -- Some code omitted
END
;;
```

Notera att den får sitt värde inuti transaktionen, all kod, även testet om det finns pengar från kontot, måste dra nytta av transaktionens atomära princip och att transaktioner är isolerade från varandra.



### IF-sats {#if}

Då kan vi skapa en if-sats `IF.. ELSE.. END IF`, med compound statement, som kontrollerar om nuvarande balansen är tillräcklig för att flytta pengarna.

```sql
BEGIN
    -- Some code omitted

    IF current_balance - amount < 0 THEN
        ROLLBACK;
        SELECT 'Amount on the account is not enough to make transaction.' AS message;
    ELSE
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
    END IF;

    SELECT * FROM account;
END
;;
```

Jag valde att omsluta koden i IF-satsen, det finns nämligen ingen `RETURN` i en lagrad procedur, vilket hade varit ett alternativ när man väl förstod att transaktionen inte kunde utföras. Men, om man läser manualen noga så finner man [`LEAVE`](https://dev.mysql.com/doc/refman/8.0/en/leave.html) vilket skulle kunna göra koden för den lagrade proceduren, aningen snyggare genom att undvika ELSE delen. Pröva gärna det på egen hand.



Compount statement {#compstat}
--------------------------------------

Ovan är DECLARE och IF-sats är exempel på kod som är ett compound statement. För att se fler konstruktioner som går att använda så har manualen ett stycke om [Compount-Statement Synax](https://dev.mysql.com/doc/refman/8.0/en/sql-syntax-compound-statements.html).

Du kan läsa om variabler, hur de kan deklareas, sättas med ett hårdkodat värde eller få ett värde från en SQL-sats.

Du kan läsa om loop-konstruktioner, if-satser och case.

Det är helt enkelt ett eget programmeringsspråk, inuti databasen.



Lokala variabler {#lokvar}
--------------------------------------

Innan vi går vidare så vill jag visa konceptet med lokala variabler och hur man även kan använda det för att mellanlagra information i ett SQL-skript. Detta handlar alltså inte enbart om compound statements, utan även om hantering av variabler i traditionell SQL-kod.

Man kan sätta värdet på en lokal variabel, inuti ett SQL-skript, och använda det på följande sätt.

```sql
--
-- Define and use local variable
--
SET @answer = 42;
SELECT @answer;
```

Kör man koden ovan så ser det ut så här.

```
mysql> SET @answer = 42;
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT @answer;
+---------+
| @answer |
+---------+
|      42 |
+---------+
1 row in set (0.00 sec)
```

Man kan också tilldela en variabel ett resultat från en SELECT-fråga.

```sql
--
-- Set local variable from a resultset
--
SET @answer = (SELECT 42);
SELECT @answer;
```

Det kan se ut så här.

```text
mysql> SET @answer = (SELECT 42);
Query OK, 0 rows affected (0.01 sec)

mysql> SELECT @answer;
+---------+
| @answer |
+---------+
|      42 |
+---------+
1 row in set (0.00 sec)
```

Man kan också köra en `SELECT...INTO` som kan lagra information från flera kolumner in i variabler.

```sql
--
-- Select mutiple into variables
--
SELECT 1, 2 INTO @a, @b;
SELECT @a, @b;
```

Det kan se ut så här när man kör det.

```text
mysql> SELECT 1, 2 INTO @a, @b;
Query OK, 1 row affected (0.00 sec)

mysql> SELECT @a, @b;
+------+------+
| @a   | @b   |
+------+------+
|    1 |    2 |
+------+------+
1 row in set (0.00 sec)
```

Denna hantering av variabler kallas i manualen för "[User-Defined Variables](https://dev.mysql.com/doc/refman/8.0/en/user-variables.html)".

Du kan använda detta sättet för att hantera variabler även inuti en lagrad procedur, detta sättet och DECLARE är två sätt du kan välja att använda för variabler.



IN och UT parametrar {#inout}
--------------------------------------

En lagrad procedur kan ta IN, OUT och INOUT parametrar. Låt oss se ett exempel på hur det ser ut.

Här är ett exempel på en lagrad procedur `get_money` som tar `IN account` för att kontrollera hur mycket pengar som finns på kontot och det resulterande värdet sätts i parametern `OUT total`. Den som anropar proceduren kan alltså använda värdet på `total` utanför proceduren.

```sql
CREATE PROCEDURE get_money(
    IN account CHAR(4),
    OUT total NUMERIC(4, 2)
)
BEGIN
    SELECT balance INTO total FROM account WHERE id = account;
END
;;
```

Proceduren tar två argument, det ena är IN och det andra är OUT.

I SELECT-satsen hämtas ett värde från databasen och lagras i variabeln `total`.

Så här kan det se ut när vi anropar proceduren och bifogar en variabel att spara totalen i.

```sql
CALL get_money('1111', @sum);
SELECT @sum;
```

När anropet sker med CALL så bifogas en variabel som efter anropet kan läsas av och användas vidare.

Det kan se ut så här när vi kör anropen ovan.

```text
mysql> CALL get_money('1111', @sum);
Query OK, 1 row affected (0.00 sec)

mysql> SELECT @sum;
+------+
| @sum |
+------+
| 7.00 |
+------+
1 row in set (0.00 sec)
```

Här ser vi alltså hur en lagrad procedur kan samverka med en variabel.

En lagrad procedur kan även ta ett argument som är INOUT, det betyder både IN och OUT. Proceduren tar värdet som IN parameter och kan sedan uppdatera innehållet i variabeln. Den som anropar proceduren kan sedan använda det uppdaterade värdet.



Tips om namngivning av parametrar {#paranamn}
--------------------------------------

Som ett tips kan du tänka på att namnge dina parametrar med till exempel prefixet `a_` för att skilja dem från namnen på dina kolumner.

Tanken är att det blir lättare att läsa koden, se följande kod som ett exempel där parametrarna börjar på `a_` och blir då tydligare att se.

```sql
CREATE PROCEDURE get_money(
    IN a_account CHAR(4),
    OUT a_total NUMERIC(4, 2)
)
BEGIN
    SELECT balance INTO a_total FROM account WHERE id = a_account;
END
```

Detta kan vara ett sätt att undvika krockar med namngivning på parametrar och kolumner.



SHOW WARNINGS {#warnings}
--------------------------------------

Ibland kan man se att man får en varning av ett anrop till en lagrad procedur. I följande exempel anger jag ett värde på en variabeln som är utanför variabelens range.

```sql
mysql> CALL edit_account('1337', 'Mega', 4200000);
Query OK, 1 row affected, 1 warning (0.00 sec)
```

För att se vad varningen säger så kan jag läsa av den.

```sql
mysql> SHOW WARNINGS;
+---------+------+---------------------------------------------------+
| Level   | Code | Message                                           |
+---------+------+---------------------------------------------------+
| Warning | 1264 | Out of range value for column 'a_balance' at row 1 |
+---------+------+---------------------------------------------------+
1 row in set (0.00 sec)
```

Det kan vara bra att ha koll på detta, det är en felkälla och ett bra verktyg för felsökning och utveckling.



SHOW PROCEDURE {#show}
--------------------------------------

När man vill se vilka procedurer som finns i databasen så kan man visa dem. Här visar jag de procedurer som slutar på delsträngen `%money`.

```sql
SHOW PROCEDURE STATUS LIKE '%money';
```

Svaret blir en lista med alla de procedurer som finns och till vilken databas de är kopplade samt vilken användare som skapade dem.

Vill du sedan titta på koden som ligger bakom den lagrade proceduren så frågar du efter den.

```sql
SHOW CREATE PROCEDURE move_money \G;
```

Fram kommer källkoden för proceduren och man kan kontrollera/felsöka att det är "rätt version" som man använder.

Tänk på att du kan använda `ALTER PROCEDURE`, som ett alternativ till `DROP/CREATE`. Det kan vara smidigt, till exempel när man utvecklar och hela tiden skapar om proceduren och testar små ändringar.



Avslutningsvis {#avslutning}
--------------------------------------

Detta var grunderna i hur du kan jobba med lagrade procedurer som ett sätt att programmera i en databas. Kanske kan detta även vara ett sätt att bygga ett API mot en databas.

Vill du se fler sätt att skapa API:er för databasen, och utföra programmering inuti databasen, så läser du om "[Triggers i databas](kunskap/triggers-i-databas)" som är en fristående fortsättning på denna artikeln.

Har du [tips, förslag eller frågor om artikeln](t/6292) så finns det en specifik forumtråd för det.
