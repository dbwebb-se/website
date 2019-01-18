---
author: mos
revision:
    "2019-01-15": "(B, mos) Manuallänkar till 8.0 och bytte namn på vyerna."
    "2017-12-28": "(A, mos) Första versionen, uppdelad av större dokument."
...
Vyer
==================================

Vyer är smidiga när SELECT-satserna blir lite väl stora. Vi kan se på vyer som ett alias eller kortkommando för en SELECT-sats.

I referensmanualen kan du läsa [om vyer](https://dev.mysql.com/doc/refman/8.0/en/create-view.html).

Spara dina konstruktioner i filen `dml_view.sql`.



Vy med Namn  och Ålder {#vy-alder}
----------------------------------

Låt se på ett exempel där vi jobbar med en vy. Vi vill ha en översikt av lärarnas namn, deras avdelning och deras ålder. Vi gör en SELECT som ger oss svaret.

```sql
mysql> SELECT
    -> CONCAT(fornamn, ' ', efternamn, ' (', LOWER(avdelning), ')') AS Namn,
    ->     TIMESTAMPDIFF(YEAR, fodd, CURDATE()) AS Ålder
    -> FROM larare;
+---------------------------+--------+
| Namn                      | Ålder  |
+---------------------------+--------+
| Alastor Moody (dipt)      |     74 |
| Albus Dumbledore (adm)    |     76 |
| Argus Filch (adm)         |     71 |
| Gyllenroy Lockman (dipt)  |     65 |
| Hagrid Rubeus (adm)       |     61 |
| Madam Hooch (didd)        |     69 |
| Minerva McGonagall (didd) |     62 |
| Severus Snape (dipt)      |     66 |
+---------------------------+--------+
8 rows in set (0.00 sec)
```

Nu skapar vi en vy av samma SELECT.

```sql
-- Skapa vyn
CREATE VIEW v_name_alder
AS
SELECT
	CONCAT(fornamn, ' ', efternamn, ' (', LOWER(avdelning), ')') AS Namn,
    TIMESTAMPDIFF(YEAR, fodd, CURDATE()) AS Ålder
FROM larare;

-- Använd vyn
SELECT * FROM v_name_alder;
```

Jag använder `v_` som prefix för mina vyer. Jag använder små bokstäver för vy-namnet separerar med underscore.

Man kan diskutera om det är rimligt att ha ett prefix likt `v_`, men jag tänker att vi gör utbildning och kanske är det lättare att hålla isär vad som är tabell och vad som är vy med ett prefix. Så undviker vi att blanda ihop dem så här i inledningen.

När jag gör en SELECT mot vyn så blir det samma sak som att göra en SELECT direkt mot tabellen. Vi kan säga att vyn blir som ett alias eller kortkommando till en mer komplex konstruktion.

Som vanligt kan vi begränsa urvalet med WHERE, ORDER BY och LIMIT.

```sql
mysql> SELECT * FROM v_name_alder
    -> WHERE Namn LIKE '%di%'
    -> ORDER BY Ålder DESC
    -> LIMIT 3;
+----------------------+--------+
| Namn                 | Ålder  |
+----------------------+--------+
| Alastor Moody (dipt) |     74 |
| Madam Hooch (didd)   |     69 |
| Severus Snape (dipt) |     66 |
+----------------------+--------+
3 rows in set (0.01 sec)
```

Vyer är kraftfullt och gör databasen mer lättanvänd.

Radera vyn med `DROP VIEW`, vill du ändra en befintlig vy kan du använda `ALTER VIEW`.



Vy med Larare.* och Ålder {#vy-larare}
----------------------------------

1. Skapa en vy "v_larare" som innehåller samtliga kolumner från tabellen Lärare inklusive en ny kolumn med lärarens ålder.
2. Gör en SELECT-sats mot vyn som beräknar medelåldern på respektive avdelning. Visa avdelningens namn och medelålder sorterad på medelåldern.

Resultatet kan se ut så här.

```sql
+-----------+-------------+
| avdelning | Snittålder  |
+-----------+-------------+
| ADM       |          69 |
| DIPT      |          68 |
| DIDD      |          66 |
+-----------+-------------+
3 rows in set (0.00 sec)
```



Kontrollera filen {#filen}
----------------------------------

Innan du är helt klar så kontrollerar du att du kan köra samtliga SQL-satser, i en och samma sekvens, i filen du jobbar i.

Se till att du har ordning på CREATE/DROP och IF EXISTS så att filen går att köra oavsett om vyn från början finns eller inte.

Tänk också på att vi nu har ett par DDL-konstruktioner i denna filen som vi döpt med prefixet `dml_`. Vi behöver alltså köra denna filen när vi återskapar databasen. Normalt hade vi troligen lagt samtliga DDL i en egen fil, men för att guiden skall flyta på så fortsätter vi att ha konstruktionerna uppdelade i olika filer.
