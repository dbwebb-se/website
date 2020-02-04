---
author: mos
revision:
    "2019-02-03": "(D, mos) Två rader bör bli svaret på 2)."
    "2019-02-01": "(C, mos) Omskriven för att bli tydligare."
    "2019-01-15": "(B, mos) Uppdelad i två delar då HAVING fick mer material."
    "2017-12-28": "(A, mos) Första versionen, uppdelad av större dokument."
...
Aggregerande funktioner HAVING
==================================

Vi jobbar med inbyggda aggregerande funktioner som kan beräkna värdet över många rader och vi ser hur vi kan göra urval av de rader som beräknas (WHERE) och urval av de rader som visas i rapporten (HAVING).

Fortsätt spara dina konstruktioner i filen `dml_agg.sql`.



Om HAVING {#omhaving}
----------------------------------

HAVING är för att begränsa vilka aggregerade värden som visas i rapporten.

WHERE jobbar på radnivå när kolumnens värde jämförs, de individuella raderna i tabellen.

HAVING jobbar på de aggregerade värdena, de som räknats fram med SUM, COUNT mm.

Med HAVING kan man begränsa urvalet, genom att jämföra med värden som är aggregerade.

Låt oss jobba igenom ett exempel. Vi börjar med att plocka fram snittlönen per avdelning.

```sql
SELECT
    avdelning,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare
GROUP BY
    avdelning
ORDER BY
    avdelning
;
```

Det ser ut så här.

```text
MySQL [skolan]> SELECT
    ->     avdelning,
    ->     ROUND(AVG(lon)) AS Snittlon,
    ->     COUNT(lon) AS Antal
    -> FROM larare
    -> GROUP BY
    ->     avdelning
    -> ORDER BY
    ->     avdelning
    -> ;
+-----------+----------+-------+
| avdelning | Snittlon | Antal |
+-----------+----------+-------+
| ADM       |    47531 |     3 |
| DIDD      |    43730 |     2 |
| DIPT      |    33396 |     3 |
+-----------+----------+-------+
3 rows in set (0.00 sec)
```

Vi har nu beräknat snittlönen per avdelning, vi kan se hur många lärare det är i respektive avdelning under "Antal". Det är deras löner som nu är snittlönen per rad.

När vi sorterar tabellen så kan vi använda vårt alias "Snittlon" (jag väljer att inte använda ö med flit) för att sortera på snittlönen.

Pröva med `ORDER BY Snittlon DESC` så får du rapporten sorterad per snittlön.

Om det av någon anledning inte fungerar, så kan man sortera per den aggregerande funktionen som man använder via `ORDER BY ROUND(AVG(lon)) DESC`. Du kan se den konstruktionen i exempel som visas, när du googlar, så pröva den också så att du vet att det fungerar.

Så, låt då se hur HAVING kan hjälpa oss.

1. Vi vill se snittlön per avdelning (och antal), men bara om snittlönen är större än 35000.
2. Vi vill se snittlönen per avdelning (och antal), men bara om det är 3 eller fler personer på den avdelningen.

Ovan begränsningar jobbar båda på de aggregerade värdena så här använder vi HAVING då WHERE inte kan hjälpa oss.

Jag visar lösningen på 1) så kan du själv lösa 2).

HAVING skriver du direkt efter GROUP BY.

```sql
SELECT
    avdelning,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare
GROUP BY
    avdelning
HAVING
    Snittlon > 35000
ORDER BY
    Snittlon DESC
;
```

Resultatet blir nu att alla snittlöner över 35 000 visas.

```text
MySQL [skolan]> SELECT
    ->     avdelning,
    ->     ROUND(AVG(lon)) AS Snittlon,
    ->     COUNT(lon) AS Antal
    -> FROM larare
    -> GROUP BY
    ->     avdelning
    -> HAVING
    ->     Snittlon > 35000
    -> ORDER BY
    ->     Snittlon DESC
    -> ;
+-----------+----------+-------+
| avdelning | Snittlon | Antal |
+-----------+----------+-------+
| ADM       |    47531 |     3 |
| DIDD      |    43730 |     2 |
+-----------+----------+-------+
2 rows in set (0.00 sec)
```

Nu får du lösa 2). Du bör få två rader som svar.



Om WHERE kontra HAVING {#wherehaving}
----------------------------------

Låt oss nu beräkna snittlönen igen, denna gången vill vi se snittlönen per avdelning, för alla som har kompetens 1. Kanske vill vi göra en extra insats på lönen för de som har låg kompetens. Nåja.

Vi lägger till `WHERE kompetens = 1` för att avgränsa vilka rader som används i rapporten.

```sql
SELECT
    avdelning,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare
WHERE
    kompetens = 1
GROUP BY
    avdelning
ORDER BY
    avdelning
;
```

Det ser ut så här. Alla på avdelningen ADM har större kompetens än 1, så de kommer vi inte att se i rapporten.

```text
MySQL [skolan]> SELECT
    ->     avdelning,
    ->     ROUND(AVG(lon)) AS Snittlon,
    ->     COUNT(lon) AS Antal
    -> FROM larare
    -> WHERE
    ->     kompetens = 1
    -> GROUP BY
    ->     avdelning
    -> ORDER BY
    ->     avdelning
    -> ;
+-----------+----------+-------+
| avdelning | Snittlon | Antal |
+-----------+----------+-------+
| DIDD      |    37580 |     1 |
| DIPT      |    27594 |     2 |
+-----------+----------+-------+
2 rows in set (0.00 sec)
```

WHERE väljer ut raderna innan den aggregerande funktionen börjar räkna ut snittlönen. Dessa rader finns alltså inte med i underlaget som skickas till de aggregerade funktionerna.

Du kan se på SELECT-satsen att WHERE klausulen ligger innan GROUP BY, det kan vara en minnesregel som påminner dig om hur SQL-satsen fungerar.

Vi kan nu kombinera detta med HAVING.

Säg att vi vill göra en insats på de avdelningar som har låga löner och vi fokuserar på de lärare som har kompetensen 1.

Vi har redan snittlönen på avdelningarna, för de som har kompetensen 1. Nu behöver vi bara lägga till så att rapporten begränsar och enbart visa de avdelningar där snittlönen är under, låt säga 30 000.

Det kan bli så här, vi lägger till en HAVING.

```sql
SELECT
    avdelning,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare
WHERE
    kompetens = 1
GROUP BY
    avdelning
HAVING
    Snittlon < 30000
ORDER BY
    avdelning
;
```

Resultatet blir så här.

```text
MySQL [skolan]> SELECT
    ->     avdelning,
    ->     ROUND(AVG(lon)) AS Snittlon,
    ->     COUNT(lon) AS Antal
    -> FROM larare
    -> WHERE
    ->     kompetens = 1
    -> GROUP BY
    ->     avdelning
    -> HAVING
    ->     Snittlon < 30000
    -> ORDER BY
    ->     avdelning
    -> ;
+-----------+----------+-------+
| avdelning | Snittlon | Antal |
+-----------+----------+-------+
| DIPT      |    27594 |     2 |
+-----------+----------+-------+
1 row in set (0.00 sec)
```

Det är alltså avdelningen DIPT som har en snittlön på mindre än 30 000 där två lärare har en kompetens av 1.

För att dubbelkolla vilka det är så tjuvkikar vi med en SELECT-sats.

```text
MySQL [skolan]> SELECT
    ->     akronym,
    ->     avdelning,
    ->     lon
    -> FROM larare
    -> WHERE
    ->     kompetens = 1
    ->     AND avdelning = 'DIPT'
    -> ;
+---------+-----------+-------+
| akronym | avdelning | lon   |
+---------+-----------+-------+
| ala     | DIPT      | 27594 |
| gyl     | DIPT      | 27594 |
+---------+-----------+-------+
2 rows in set (0.00 sec)
```

Ah, där har vi de två lärarna som vi kanske borde fokusera på, eller inte.



Uppgifter HAVING {#having}
----------------------------------

Gör nu en egen rapport med GROUP BY och HAVING.

1. Visa per avdelning hur många anställda det finns, gruppens snittlön, sortera per avdelning och snittlön.
2. Visa samma sak som i 1), men visa nu även de kompetenser som finns. Du behöver gruppera på avdelning och per kompetens, sortera per avdelning och per kompetens.
3. Visa samma sak som i 2), men ignorera de kompetenser som är större än 3.
4. Visa samma sak som i 3), men exkludera de grupper som har fler än 1 i Antal och snittlön mellan 30 000 - 45 000. Sortera per snittlön.

Ditt svar bör se ut så här.

Svar på 1).

```text
+-----------+----------+-------+
| avdelning | Snittlon | Antal |
+-----------+----------+-------+
| ADM       |    47531 |     3 |
| DIDD      |    43730 |     2 |
| DIPT      |    33396 |     3 |
+-----------+----------+-------+
3 rows in set (0.00 sec)
```

Svar på 2).

```text
+-----------+-----------+----------+-------+
| avdelning | kompetens | Snittlon | Antal |
+-----------+-----------+----------+-------+
| ADM       |         7 |    85000 |     1 |
| ADM       |         3 |    27594 |     1 |
| ADM       |         2 |    30000 |     1 |
| DIDD      |         2 |    49880 |     1 |
| DIDD      |         1 |    37580 |     1 |
| DIPT      |         2 |    45000 |     1 |
| DIPT      |         1 |    27594 |     2 |
+-----------+-----------+----------+-------+
7 rows in set (0.00 sec)
```

Svar på 3).

```text
+-----------+-----------+----------+-------+
| avdelning | kompetens | Snittlon | Antal |
+-----------+-----------+----------+-------+
| ADM       |         3 |    27594 |     1 |
| ADM       |         2 |    30000 |     1 |
| DIDD      |         2 |    49880 |     1 |
| DIDD      |         1 |    37580 |     1 |
| DIPT      |         2 |    45000 |     1 |
| DIPT      |         1 |    27594 |     2 |
+-----------+-----------+----------+-------+
6 rows in set (0.00 sec)
```

Svar på 4).

```text
+-----------+-----------+----------+-------+
| avdelning | kompetens | Snittlon | Antal |
+-----------+-----------+----------+-------+
| DIPT      |         2 |    45000 |     1 |
| DIDD      |         1 |    37580 |     1 |
| ADM       |         2 |    30000 |     1 |
+-----------+-----------+----------+-------+
3 rows in set (0.00 sec)
```

Dubbelkolla att dina SQL-satser får samma svar som jag visar ovan.

Alltså, HAVING är till för att göra urval på aggregerad data och enbart visa de rader som matchar villkoret.

WHERE gör urvalet innan det aggregerade datat beräknas.

Här är ett par minnesregler.

> "WHERE kommer innan GROUP BY och HAVING kommer efter".

> "HAVING är för aggregerade värde.".



Kontrollera filen {#filen}
----------------------------------

Innan du är helt klar så kontrollerar du att du kan köra samtliga SQL-satser, i en och samma sekvens, i filen du jobbar i.
