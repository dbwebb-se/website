---
author: mos
revision:
    "2019-01-15": "(B, mos) Uppdelad i två delar då HAVING fick mer material."
    "2017-12-28": "(A, mos) Första versionen, uppdelad av större dokument."
...
Aggregerande funktioner
==================================

Vi jobbar med inbyggda aggregerande funktioner som kan beräkna värdet över många rader.

Spara dina konstruktioner i filen `dml_agg.sql`.



Om aggregerande funktioner {#om}
----------------------------------

Vi kan se vilken lärare som har högst eller minst lön. För att göra det behöver vi gå igenom alla rader i tabellen och se vilken rad som innehåller det minsta respektive det högsta värdet.

Med aggregerande funktioner kan vi lösa detta. Du har tidigare summerat lönesumman med den aggregerande funktionen `SUM()` som summerar lönesumman för alla rader.

```sql
mysql> SELECT SUM(lon) FROM larare;
+----------+
| SUM(lon) |
+----------+
|   330242 |
+----------+
1 row in set (0.00 sec)
```

Du kan läsa om [aggregerande funktioner i MySQL manualen](https://dev.mysql.com/doc/refman/8.0/en/group-by-functions.html).



Uppgifter MIN och MAX {#minmax}
----------------------------------

Använd nu `MIN()` och `MAX()` för att besvara följande.

1. Hur mycket är den högsta lönen som en lärare har?
2. Hur mycket är den lägsta lönen som en lärare har?



Om GROUP BY {#omgroupby}
----------------------------------

När man använder aggregerande funktioner så arbetar de på samtliga rader. Vi kan till exempel räkna ut medelkompetensen på skolan.

```sql
mysql> SELECT AVG(kompetens) FROM larare;
+----------------+
| AVG(kompetens) |
+----------------+
|         2.3750 |
+----------------+
1 row in set (0.00 sec)
```

Men, om vi vill se kompetensen per avdelning, så behöver vi gruppera den aggregerande funktionen per avdelning. Det gör vi med GROUP BY.

```sql
SELECT
    avdelning,
    AVG(kompetens)
FROM larare
GROUP BY avdelning
;
```

Det kan då se ut så här.

```text
mysql> SELECT
    ->     avdelning,
    ->     AVG(kompetens)
    -> FROM larare
    -> GROUP BY avdelning
    -> ;
+-----------+----------------+
| avdelning | AVG(kompetens) |
+-----------+----------------+
| DIPT      |         1.3333 |
| ADM       |         4.0000 |
| DIDD      |         1.5000 |
+-----------+----------------+
3 rows in set (0.00 sec)
```

Nu ser vi medelkompetensen per avdelning och kan till exempel se vilken avdelning där vi främst behöver höja kompetensen.



Uppgifter GROUP BY {#groupby}
----------------------------------

Använd de inbyggda aggregerande funktionerna `SUM()`, `COUNT()`, och `AVG()` tillsammans med `GROUP BY`, för att räkna ut  följande:

1. Hur många lärare jobbar på de olika avdelningarna?
2. Hur mycket betalar respektive avdelning ut i lön varje månad?
3. Hur mycket är medellönen för de olika avdelningarna?
3. Hur mycket är medellönen för kvinnor kontra män?


Aggregerande betyder att de räknar samman värden baserat på många rader i tabellen. Dubbelkolla alltid mot din värdemängd, innehållet i tabellerna, om dina svar känns rimliga.

Gör nu följande rapport.

1. Visa snittet på kompetensen för alla avdelningar, sortera på kompetens i sjunkande ordning och visa enbart den avdelning som har högst kompetens.

Ditt svar kan se ut så här.

```sql
+-----------+-----------+
| avdelning | Kompetens |
+-----------+-----------+
| ADM       |    4.0000 |
+-----------+-----------+
1 row in set (0.00 sec)
```

Gör ytterligare en rapport.

1. Visa den avrundade snittlönen (`ROUND()`) grupperad per avdelning och per kompetens, sortera enligt avdelning och snittlön. Ditt svar skall se ut så här.

```sql
+-----------+-----------+-----------+
| avdelning | kompetens | Snittlön  |
+-----------+-----------+-----------+
| ADM       |         7 |     85000 |
| ADM       |         2 |     30000 |
| ADM       |         3 |     27594 |
| DIDD      |         2 |     49880 |
| DIDD      |         1 |     37580 |
| DIPT      |         2 |     45000 |
| DIPT      |         1 |     27594 |
+-----------+-----------+-----------+
7 rows in set (0.00 sec)
```



Kontrollera filen {#filen}
----------------------------------

Innan du är helt klar så kontrollerar du att du kan köra samtliga SQL-satser, i en och samma sekvens, i filen du jobbar i.
