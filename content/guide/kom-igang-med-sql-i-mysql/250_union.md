---
author: mos
revision:
    "2019-01-15": "(C, mos) Uppdaterade SQL-koden med namngivning."
    "2018-02-09": "(B, mos) Genomgången, mindre typo."
    "2017-12-29": "(A, mos) Första versionen, uppdelad av större dokument."
...
UNION och slå samman tabeller
==================================

Vi skall slå samman raderna från två tabeller i ett resultset.

Spara den SQL-kod du skriver i filen `dml_union.sql`.

Vi jobbar vidare med lönerevisionen och vi vill granska utfallet.

Som en inledningen så kikar du i [refmanualen om UNION](https://dev.mysql.com/doc/refman/8.0/en/union.html).



Visa alla rader med UNION {#union}
----------------------------------

Säg vi vill jämföra värdet i två tabeller som har samma struktur. Det kan vi göra genom att slå ihop alla rader från respektive tabell, in i en rapport. Vi gör det med UNION.

UNION kan slå samman två olika tabeller, eller resultset, förutsatt att de delar samma struktur på kolumnerna.

Här slår vi samman raderna från tabellerna som innehåller lönerna före och efter lönerevisionen.

```sql
--
-- UNION
--
SELECT
	*,
	'after' AS origin FROM larare
UNION
SELECT
	*,
	'before' AS origin FROM larare_pre
ORDER BY akronym
;
```

Fråga mig inte varför jag nu använder engelska benämningar ovan. Troligen är det enklast som programmerare att hålla sig till engelska. Låt det vara så och skyll på att läraren kör lite svengelska.

I ovan så slår jag samman resultatet från två källor, med källans namn som extra kolumn, och sorterar per akronym. Jag behöver källans namn som en extra kolumn för att kunna skapa rapporter som jämför ny och gammal lön, jag behöver veta vilken lön som är gammal och vilken som är ny.

Säg att jag bara vill skriva ut delar av resultatet, och kanske begränsa vilka rader som skrivs ut, då kan jag omringa frågan med `()` och använda resultatet som ett implicit resultset, eller [_derived table_](https://dev.mysql.com/doc/refman/8.0/en/derived-tables.html) som är en form av _subquery_, en fråga i en fråga.

Jag kan då skapa en fråga som ser ut så här. I mitt fall blir min UNION ett resultset, ett derived table, som jag omringar med `()` och ger namnet `lon` och då kan använda som en vanlig tabell.

```sql
SELECT
	lon.origin,
    akronym,
    fornamn,
    efternamn,
    kon,
    kompetens,
    lon
FROM
(
	SELECT
		*,
		'after' AS origin FROM larare
	UNION
	SELECT
		*,
		'before' AS origin FROM larare_pre
	ORDER BY akronym
) AS lon
WHERE
	akronym IN ('ala', 'dum')
ORDER BY akronym, origin
;
```

En variant hade varit att göra en view av UNION-delen. Se det som ett alternativ.

När jag först gjorde bekantskap med databaser så föll jag för vyer och använde dem i tid och otid. Numer föredrar jag att se hela SQL-frågan utan att "dölja" den i vy på vy. Men var sak har sin tid och användningsområde.

Så här ser det ut om vi kör frågan.

```text
mysql> SELECT
    ->     lon.origin,
    ->     akronym,
    ->     fornamn,
    ->     efternamn,
    ->     kon,
    ->     kompetens,
    ->     lon
    -> FROM
    -> (
    ->     SELECT
    ->         *,
    ->         'after' AS origin FROM larare
    ->     UNION
    ->     SELECT
    ->         *,
    ->         'before' AS origin FROM larare_pre
    ->     ORDER BY akronym
    -> ) AS lon
    -> WHERE
    ->     akronym IN ('ala', 'dum')
    -> ORDER BY akronym, origin
    -> ;
+--------+---------+---------+------------+------+-----------+-------+
| origin | akronym | fornamn | efternamn  | kon  | kompetens | lon   |
+--------+---------+---------+------------+------+-----------+-------+
| after  | ala     | Alastor | Moody      | M    |         1 | 27594 |
| before | ala     | Alastor | Moody      | M    |         1 | 30000 |
| after  | dum     | Albus   | Dumbledore | M    |         7 | 85000 |
| before | dum     | Albus   | Dumbledore | M    |         1 | 80000 |
+--------+---------+---------+------------+------+-----------+-------+
4 rows in set (0.00 sec)
```

Vi kan nu se och jämföra rad för rad och se hur lönerevisionen har påverkat respektive individ.

Vi kan dock inte besvara frågorna vi hade ännu. För att göra det behöver vi lägga informationen på samma rad, inte på två olika rader som nu.

Vi tar det i nästa stycke.



Kontrollera filen {#filen}
----------------------------------

Innan du är helt klar så kontrollerar du att du kan köra samtliga SQL-satser, i en och samma sekvens, i filen du jobbar i.
