---
author: mos
revision:
    "2019-01-21": "(C, mos) Förtydligande om hur användaren skapas med kompabilitet."
    "2019-01-11": "(B, mos) Genomgången MySQL 8.0 och uppdaterade asciinemas."
    "2017-12-27": "(A, mos) Första versionen, uppdelad av större dokument."
...
Skapa en databas
==================================

Vi skapar en databas för detta exemplet och vi lägger till en användare som kan använda databasen.

Spara SQL-koden du gör i en fil och döp den till `setup.sql`.



Skapa databas {#create-db}
----------------------------------

Öppna din klient med en databasanvändare som har högsta behörighet (tex root) och skapa en ny databas "skolan" och välj att använda den.

```sql
-- Skapa databas
CREATE DATABASE skolan;

-- Välj vilken databas du vill använda
USE skolan;
```

För att ta bort och radera en hel databas med hela dess innehåll använder du kommandot DROP.

```sql
-- Radera en databas med allt innehåll
DROP DATABASE skolan;
```

Testa att radera din nyskapade databas och skapa sedan om den.

Man kan också skriva så att databasen skapas, men bara om den inte redan finns. Det är en konstruktion med IF NOT EXISTS som vi återfinner även i andra sammanhang.

```sql
-- CREATE DATABASE skolan;
CREATE DATABASE IF NOT EXISTS skolan;
```

För att se vilka databaser som finns använder vi kommandot SHOW.

```sql
-- Visa vilka databaser som finns
SHOW DATABASES;

-- Visa vilka databaser som finns
-- som heter något i stil med *skolan*
SHOW DATABASES LIKE "%skolan%";
```

Nu kan du se vilka databaser som finns skapade.



Skapa användare till databasen {#user}
----------------------------------

Det finns ett behörighetssystem som kan koppla en användare med lösenord till en viss databas, inklusive behörigheter. För vårt syfte skapar vi en ny användare som kan göra allt mot vår nyskapade databas.

Exakt hur man skapar en användare och hur dess lösenord krypteras kan skilja aningen mellan olika DBMS.

Här är ett vanligt sätt som fungerar de flesta sammanhang.

Du kan ta bort en användare med DROP.

```sql
-- Ta bort en användare
DROP USER 'user'@'%';
DROP USER IF EXISTS 'user'@'%';
```

Konstruktionen nedan skapar användaren "user" med lösenordet "pass" och användaren kan logga in från godtycklig host "@'%'"

```sql
-- Skapa en användare user med lösenordet pass och ge tillgång oavsett
-- hostnamn. 
CREATE USER IF NOT EXISTS 'user'@'%'
IDENTIFIED
BY 'pass'
;
```

Att lägga till IF EXISTS ger dig en felkontroll så att kommandot enbart körs om användaren finns. Det första kommandot ger felmeddelande om det körs när användaren inte finns.

Om du får problem att koppla dig med godtycklig klient mot databasen MySQL 8.0.4 eller högre så kan det bero på implementationsdetaljer som rör hur lösenordet krypteras. Du kan då behöva skapa användaren på följande sätt.

```sql
-- Skapa användaren med en bakåtkompatibel lösenordsalgoritm.
CREATE USER IF NOT EXISTS 'user'@'%'
IDENTIFIED
WITH mysql_native_password -- MySQL with version > 8.0.4
BY 'pass'
;
```

Det finns en forumtråd, "[Kompabilitet mellan MySQL och MariaDB, CREATE USER](t/8177)", som förklarar i mer detalj.

Utgångsläget är att du skapar användaren med `WITH mysql_native_password`.

När du väl har skapat användaren behöver du ge den behörigheter. Vi väljer att ge användaren fulla behörigheter till databasen "skolan".

```sql
-- Ge användaren alla rättigheter på en specifk databas.
GRANT ALL PRIVILEGES
    ON skolan.*
    TO 'user'@'%'
;
```

Du kan se vilken GRANT du givit en användare.

```sql
-- Visa vad en användare kan göra mot vilken databas.
SHOW GRANTS FOR 'user'@'%';

-- Visa för nuvarande användare
SHOW GRANTS FOR CURRENT_USER;
```

Det kan se ut så här (Debian/Linux).

```sql
mysql> SHOW GRANTS FOR 'user'@'%';
+--------------------------------------------------+
| Grants for user@%                                |
+--------------------------------------------------+
| GRANT USAGE ON *.* TO `user`@`%`                 |
| GRANT ALL PRIVILEGES ON `skolan`.* TO `user`@`%` |
+--------------------------------------------------+
2 rows in set (0.00 sec)
```

Om du får en annorlunda utskrift i din klient så kan du bara låta det vara.

Du kan nu använda din klient för att logga in med den nya användaren och kontrollera att den kommer åt databasen.

Jag testar genom att starta kommandoradsklienten och ange användare, lösenord och databas.

```text
$ mysql -uuser -ppass skolan

... utskrifter från inloggningen

mysql>
```

Det kan se ut så här.

[ASCIINEMA src=220805 caption="Logga in mot en databas med angiven användare och lösenord."]

Om inget felmeddelande visas och prompten för kommandoradsklienten visas så gick det bra att logga in med vald användare och lösenord.



Spara i fil {#fil}
----------------------------------

Glöm nu inte att du skulle spara alla SQL-kommandon du skriver i filen `setup.sql`.

Det som är bra med att spara all sin SQL kod är att det är enkelt att skapa om hela databasen från början om det blir något fel.

Tänk tanken att du skall kunna köra hela denna övningen på en ny dator som du tidigare inte använt. Du behöver skapa databasen och användaren, kanske vill du droppa databasen om den finns, kanske inte, där kan du välja väg. I mitt exempel nedan har jag kommenterat ut den raden som droppar databasen och jag skapar bara databasen om den inte redan finns.

Jag väljer att ta med alla kommandon jag jobbat med. Jag ser det som en möjlighet att göra anteckningar. Jag kommenterar bort de kommandon som inte skall köras.

Så här kan filen se ut. Se till att du har den och dubbelkolla att du kan köra alla kommandon i filen i en sekvens (på en gång), om och om igen.

```sql
-- Skapa databas
-- CREATE DATABASE skolan;
CREATE DATABASE IF NOT EXISTS skolan;

-- Välj vilken databas du vill använda
USE skolan;

-- -- Radera en databas med allt innehåll
-- DROP DATABASE skolan;
-- 
-- -- Visa vilka databaser som finns
-- SHOW DATABASES;

-- Visa vilka databaser som finns
-- som heter något i stil med *skolan*
SHOW DATABASES LIKE "%skolan%";

-- Skapa en användare user med lösenordet pass och ge tillgång oavsett
-- hostnamn. 
CREATE USER IF NOT EXISTS 'user'@'%'
    IDENTIFIED BY 'pass'
;

-- -- Skapa användaren med en bakåtkompatibel lösenordsalgoritm.
-- CREATE USER IF NOT EXISTS 'user'@'%'
--     IDENTIFIED WITH mysql_native_password
--     BY 'pass'
-- ;

-- -- Ta bort en användare
-- DROP USER 'user'@'%';
-- DROP USER IF EXISTS 'user'@'%';

-- Ge användaren alla rättigheter på en specifk databas.
GRANT ALL PRIVILEGES
    ON skolan.*
    TO 'user'@'%'
;

-- -- Skapa användaren "user" med
-- -- lösenordet "pass" och ge
-- -- fulla rättigheter till databasen "skolan"
-- -- när användaren loggar in från maskinen "localhost"
-- GRANT ALL ON skolan.* TO user@localhost IDENTIFIED BY 'pass';

-- Visa vad en användare kan göra mot vilken databas.
SHOW GRANTS FOR 'user'@'%';

-- -- Visa för nuvarande användare
-- SHOW GRANTS FOR CURRENT_USER;
```

Nu är trixet att du inte kan återskapa databasen när du är inloggad som användaren "user", den användaren har inte rättigheter att skapa en databas. För att köra hela skriptet på en gång måste du alltså vara inloggad som en användare (root) som har behörighet att skapa en databas.

Så här kan jag återskapa databasen, genom att köra SQL-filen med kommandoradsklienten.

```text
$ mysql --table -uroot -p < setup.sql
```

Kommandot fungerar när inga felmeddelanden visas. Switchen `--table` ger en tydligare utskrift. Det kan se ut så här.

[ASCIINEMA src=220807 caption="Skapa om databasen via SQL-kommandon i filen `setup.sql`."]

Se till att din fil fungerar likt ovan och använd kommentarer för att beskriva vad du gör. Rätt använd blir dessa filer en värdefull tillgång efter kursen, eller inför kursens examination.
