---
author: mos
revision:
    "2018-02-09": "(B, mos) Mer text om hur återskapa."
    "2017-12-28": "(A, mos) Första versionen, uppdelad av större dokument."
...
Uppdatera tabellens struktur
==================================

_Oops_, vi glömde ett fält i tabellen lärare. Vi vill nämligen lagra lärarens kompetens som en siffra mellan 1-10.

Spara det du nu gör i filen `ddl_migrate.sql`.



ALTER TABLE {#alter}
---------------------------------

Ofta vill man kunna ändra befintlig tabellstruktur och ta bort, modifiera eller lägga till nya kolumner i en tabell. Man vill göra detta när databasen redan innehåller rader som man inte vill ta bort. Detta görs med kommandot `ALTER TABLE`.

```sql
-- Add column to table
ALTER TABLE larare ADD COLUMN kompetens INT;
```

Gör nu följande steg på egen hand, läs refmanualen vid behov.

1. Lägg till kolumnen `kompetens` (integer) i tabellen lärare med hjälp av kommandot `ALTER TABLE`.
2. Ta bort samma kolumn med kommandot `ALTER TABLE DROP COLUMN`.
3. Lägg till samma kolumn igen, modifiera så att kolumnen definieras med default-värdet 1 (`DEFAULT`) och att den inte kan innehålla `NULL`-värden (`NOT NULL`).

Ledtråd till 3:an är att titta i refman för `ALTER TABLE` och för `CREATE TABLE`.

När du lyckas så kommer samtliga lärare ha en kompetens av 1, vilket är defaultvärdet.

Det skall nu se ut så här.

```sql
mysql> SELECT akronym, fornamn, kompetens FROM larare;
+---------+------------+-----------+
| akronym | fornamn    | kompetens |
+---------+------------+-----------+
| ala     | Alastor    |         1 |
| dum     | Albus      |         1 |
| fil     | Argus      |         1 |
| gyl     | Gyllenroy  |         1 |
| hag     | Hagrid     |         1 |
| hoc     | Madam      |         1 |
| min     | McGonagall |         1 |
| sna     | Severus    |         1 |
+---------+------------+-----------+
8 rows in set (0.00 sec)
```

Vi kan studera tabellens struktur med kommandot `SHOW COLUMNS`, det ger oss en översikt av de datatyper och förutsättningar som tabellen har.

```sql
mysql> SHOW COLUMNS FROM larare;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| akronym   | char(3)     | NO   | PRI |         |       |
| avdelning | char(4)     | YES  |     | NULL    |       |
| fornamn   | varchar(20) | YES  |     | NULL    |       |
| efternamn | varchar(20) | YES  |     | NULL    |       |
| kon       | char(1)     | YES  |     | NULL    |       |
| lon       | int(11)     | YES  |     | NULL    |       |
| fodd      | date        | YES  |     | NULL    |       |
| kompetens | int(11)     | NO   |     | 1       |       |
+-----------+-------------+------+-----+---------+-------+
8 rows in set (0.00 sec)
```

Vi kan se vår nya kolumn kompetens längst ned där det står att den inte får vara NULL och defaultvärdet är 1.



Kontrollera att filerna fungerar {#filer}
-----------------------------------

Som en sista åtgärd så kontrollerar du att du kan återskapa din struktur genom att först köra `ddl.sql` för att återskapa tabellen, följt av `dml_insert.sql` för att lägga in raderna och till slut `ddl_migrate.sql` som lägger till kompetensen. Du skall därefter ha en tabell med samtliga lärare som har kompetensen 1.

Det är alltså följande kommandon du skall köra.

```text
mysql -uuser -ppass skolan < ddl.sql
mysql -uuser -ppass skolan < dml_insert.sql
mysql -uuser -ppass skolan < ddl_migrate.sql
```

Du kan dubbelkolla att du har rätt innehåll genom att summera lönesumman och kompetensen med följande kommando.

```text
mysql -uuser -ppass skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare;"
```

Det kan se ut så här när du kör det.

```text
$ mysql -uuser -ppass skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare;"
+------------+-----------+
| Lönesumma  | Kompetens |
+------------+-----------+
|     245000 |         8 |
+------------+-----------+
```

Bra, nu kan du återställa databasen till detta läget. Det är bra inför nästa steg då du skall börja göra uppdateringar i databasen.
