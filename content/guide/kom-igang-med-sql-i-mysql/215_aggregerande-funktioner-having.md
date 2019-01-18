---
author: mos
revision:
    "2019-01-15": "(B, mos) Uppdelad i två delar då HAVING fick mer material."
    "2017-12-28": "(A, mos) Första versionen, uppdelad av större dokument."
...
Aggregerande funktioner HAVING
==================================

Vi jobbar med inbyggda aggregerande funktioner som kan beräkna värdet över många rader och vi ser hur vi kan göra urval av de rader som beräknas (WHERE) och urval av de rader som visas i rapporten (HAVING).

Fortsätt spara dina konstruktioner i filen `dml_agg.sql`.



Om HAVING {#omhaving}
----------------------------------

HAVING är för GROUP BY, likt WHERE är för SELECT.

Med HAVING kan man begränsa urvalet, genom att jämföra med värden som är aggregerade. Låt oss jobba igenom ett exempel.

Låt oss se snittlönen grupperad per avdelning och per kompetens. Vi börjar med att plocka fram snittlönen per avdelning.

```sql
SELECT
    avdelning,
    ROUND(AVG(lon)) AS Snittlön,
    COUNT(lon) AS Antal
FROM larare
GROUP BY avdelning
ORDER BY avdelning
;
```

Det ser ut så här.

```text
mysql> SELECT
    ->     avdelning,
    ->     ROUND(AVG(lon)) AS Snittlön,
    ->     COUNT(lon) AS Antal
    -> FROM larare
    -> GROUP BY avdelning
    -> ORDER BY avdelning
    -> ;
+-----------+-----------+-------+
| avdelning | Snittlön  | Antal |
+-----------+-----------+-------+
| ADM       |     47531 |     3 |
| DIDD      |     43730 |     2 |
| DIPT      |     33396 |     3 |
+-----------+-----------+-------+
3 rows in set (0.00 sec)
```

Vi har nu beräknat snittlönen per avdelning, vi kan se hur många lärare det är per avdelning under "Antal".

Låt oss nu beräkna snittlönen igen, denna gången vill vi se snittlönen per avdelning, för alla som har kompetens 1. Kanske vill vi göra en extra insats på lönen för de som har låg kompetens. Nåja.

Vi lägger till `WHERE kompetens = 1`.

```sql
SELECT
    avdelning,
    ROUND(AVG(lon)) AS Snittlön,
    COUNT(lon) AS Antal
FROM larare
WHERE kompetens = 1
GROUP BY avdelning
ORDER BY avdelning
;
```

Det ser ut så här.

```text
mysql> SELECT
    ->     avdelning,
    ->     ROUND(AVG(lon)) AS Snittlön,
    ->     COUNT(lon) AS Antal
    -> FROM larare
    -> WHERE kompetens = 1
    -> GROUP BY avdelning
    -> ORDER BY avdelning
    -> ;
+-----------+-----------+-------+
| avdelning | Snittlön  | Antal |
+-----------+-----------+-------+
| DIDD      |     37580 |     1 |
| DIPT      |     27594 |     2 |
+-----------+-----------+-------+
2 rows in set (0.00 sec)
```

WHERE väljer ut raderna innan den aggregerande funktionen börjar räkna ut snittlönen. Det kan vi använda till _alla kompetenser som är 1_. WHERE avgränsar alltså de raderna som är underlaget för den aggregerade funktionen ROUND och COUNT.

Låt oss då se på HAVING. HAVING kan jobba på det resulterande aggregerade värdet. Det gör ett urval i rapporten efter att snittlönen räknats ut. Det kan vi använda till visa enbart de raderna där _snittlön större än 40 000_.

Vi vill visa de avdelningar som har snittlön över 40 000. Snittlönen är ett aggregerat värde och då använder vi HAVING för att bara visa de rader i rapporten som innehåller snittlöner över 40 000.

```sql
SELECT
    avdelning,
    ROUND(AVG(lon)) AS Snittlön,
    COUNT(lon) AS Antal
FROM larare
GROUP BY avdelning
HAVING Snittlön > 40000
ORDER BY avdelning
;
```

Det ser ut så här.

```text
mysql> SELECT
    ->     avdelning,
    ->     ROUND(AVG(lon)) AS Snittlön,
    ->     COUNT(lon) AS Antal
    -> FROM larare
    -> GROUP BY avdelning
    -> HAVING Snittlön > 40000
    -> ORDER BY avdelning
    -> ;
+-----------+-----------+-------+
| avdelning | Snittlön  | Antal |
+-----------+-----------+-------+
| ADM       |     47531 |     3 |
| DIDD      |     43730 |     2 |
+-----------+-----------+-------+
2 rows in set (0.00 sec)
```

Rapporten är nu avgränsad och visar endast de avdelningar där snittlönen är större än ett valt belopp.

Vi kan också kombinera WHERE och HAVING. Så här ser det ut om vi vill se vilka avdelningar som har snittlön över 30 000, men enbart inräknad de som har en kompetens = 1.

```sql
SELECT
    avdelning,
    ROUND(AVG(lon)) AS Snittlön,
    COUNT(lon) AS Antal
FROM larare
WHERE kompetens = 1
GROUP BY avdelning
HAVING Snittlön > 30000
ORDER BY avdelning
;
```

Resultatet blir så här.

```text
mysql> SELECT
    ->     avdelning,
    ->     ROUND(AVG(lon)) AS Snittlön,
    ->     COUNT(lon) AS Antal
    -> FROM larare
    -> WHERE kompetens = 1
    -> GROUP BY avdelning
    -> HAVING Snittlön > 30000
    -> ORDER BY avdelning
    -> ;
+-----------+-----------+-------+
| avdelning | Snittlön  | Antal |
+-----------+-----------+-------+
| DIDD      |     37580 |     1 |
+-----------+-----------+-------+
1 row in set (0.00 sec)
```

Det fanns en avdelning som hade en snittlön över 30 000 när man räknade de lärare som hade kompetensen 1.

Kom ihåg att WHERE avgränsar urvalet av rader _innan_ den aggregerande funktionen börjar sitt jobb och HAVING avgränsar antalet rader _efter_ att den aggregerande funktionen är klar.

Som minnesregel så kan du så SQL-satsen där WHERE står innan GROUP BY och HAVING kommer efter.



Uppgifter HAVING {#having}
----------------------------------

Gör nu en egen rapport med GROUP BY och HAVING.

1. Visa per avdelning de kompetenser som finns och hur många anställda det finns per kompetens samt gruppens snittlön, men visa bara för kompetenser som är lägre än 7 och bara om gruppens snittlön är mellan 30 000 - 45 000. Sortera per kompetens i sjunkande ordning.

Ditt svar bör se ut så här.

```sql
+-----------+-----------+-------+-----------+
| avdelning | kompetens | Antal | Snittlön  |
+-----------+-----------+-------+-----------+
| ADM       |         2 |     1 |     30000 |
| DIPT      |         2 |     1 |     45000 |
| DIDD      |         1 |     1 |     37580 |
+-----------+-----------+-------+-----------+
3 rows in set (0.00 sec)
```

Alltså, HAVING är till för att göra urval på aggregerad data och enbart visa de rader som matchar villkoret. WHERE gör urvalet innan det aggregerade datat beräknas.

Minnesregeln "WHERE kommer innan GROUP BY och HAVING kommer efter".



Kontrollera filen {#filen}
----------------------------------

Innan du är helt klar så kontrollerar du att du kan köra samtliga SQL-satser, i en och samma sekvens, i filen du jobbar i.
