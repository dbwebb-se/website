---
author: mos
revision:
    "2019-01-10": "(B, mos) Lade till referensmanual för MariaDB."
    "2017-12-27": "(A, mos) Första versionen, uppdelad av större dokument."
...
SQL uttryck
==================================

Vi tittar kort på varianter av SQL uttryck och hur man jobbar med dem.



SQL statements {#sql}
----------------------------------

Här följer en snabb översikt över de vanligaste SQL-kommandona.

För att välja och presentera data:

```sql
SELECT
  FROM
  [WHERE]
  [GROUP BY]
  [ORDER BY]
```

För att skapa, uppdatera och radera data:

```sql
INSERT INTO VALUES
UPDATE SET
DELETE
```

Man brukar benämna SELECT, INSERT och UPDATE som SQL Data Manipulation Language (DML), eller SQL DML, då de manipulerar en data i en befintlig databas.

För att skapa objekt (databaser, tabeller, vyer, etc) i en databas:

```sql
CREATE
ALTER
DROP
```

Konstruktionerna CREATE, ALTER, DROP brukar benämnas SQL Data Definition Language (DDL), eller SQL DDL, då de definierar databasens schema och struktur.

Pröva att finna informationen om dessa SQL-kommandon i refmanualen. Ju bättre du blir på det desto enklare och snabbare kommer du igenom övningen.



Spara din SQL kod i fil {#spara}
----------------------------------

Spara din SQL-kod från alla övningar i en textfil som du döper med ändelsen `.sql`. En sådan fil är perfekt att ha som minne och bra att använda när du framöver vill gå tillbaka och se hur du löste en viss uppgift eller problemställning. Ett eget litet facit för framtida SQL-konstruktioner.

Använd SQL-kommentarer (2 minustecken följt av ett mellanslag eller ny rad) för att skriva vilken övning du jobbar med, det gör det enkelt att läsa filen i efterhand och se vad du försöker lösa.

```sql
--
-- This is an comment in SQL.
--
```

Skriv kommentarerna på engelska om din databasmodell har engelska namn. Om din databasmodell har svenska namn så kan du skriva kommentarerna på svenska.

Du skall se till att du kan köra samtliga SQL-kommandon från filen på en gång. Då vet du att du har en god grundstruktur i filen.

De första övningarna är enkla för att sedan bli svårare och svårare. Ju längre du kommer desto bättre kompis måste du bli med referensmanualen.



Referensmanualen {#ref}
----------------------------------

I referensmanualen för MySQL finns ett stycke som beskriver syntax för de grundläggande SQL-uttrycken, "[SQL Statement Syntax](https://dev.mysql.com/doc/refman/8.0/en/sql-syntax.html)". Det är en riktigt god idé att bekanta sig med den delen av referensmanualen.

Motsvarande referensmanual för MariaDB finns under "[SQL Statements & Structure](https://mariadb.com/kb/en/library/sql-statements-structure/)".
