---
author: mos
revision:
    "2022-01-17": "(F, mos) Filen heter insert-larare.sql."
    "2022-01-03": "(E, mos) Genomgången inför v2 och MariaDB."
    "2019-01-11": "(D, mos) Uppdaterade om återställning av databasen."
    "2018-03-22": "(C, mos) Delade i två delar och flyttade lönerevision till egen del."
    "2018-02-09": "(B, mos) Flyttade bash-återskapa till eget dokument, utskrift av sum kompetens."
    "2017-12-28": "(A, mos) Första versionen, uppdelad av större dokument."
...
Uppdatera värden, lönerevision
==================================

Vi skall använda `UPDATE` för att uppdatera värden i rader och kolumner. Vi gör en lönerevision för lärarna.

Spara det du nu gör i filen `dml-update-lonerevision.sql`.

Vi skall göra en lönerevision för lärarna och höja deras löner.



Återställ databasen {#aterstall}
----------------------------------

Innan vi gör denna övningen så prövar vi att återställa databasen genom att köra skriptfilerna. Vi kör filerna i samma ordning som vi jobbat med dem i guiden.

```text
mariadb --table skolan < ddl-larare.sql
mariadb --table skolan < insert-larare.sql
mariadb --table skolan < ddl-alter.sql
mariadb --table skolan < dml-update.sql
mariadb skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare;"
```

Att börja om från början är alltid en god idé, så det är bra att veta hur man återställer sin data.

Dubbelkolla att du inte får några felmeddelanden när du kör skripten. Om du tycker att du har för mycket utskrifter så kan du alltid kommentera bort dem i respektive skript.

Du kan kontrollera att du har samma innehåll i databasen som jag har, med följande SELECT.

```sql
SELECT
    SUM(lon) AS Lönesumma,
    SUM(kompetens) AS Kompetens
FROM larare
;
```

Det kan se ut så här.

```text
+------------+-----------+
| Lönesumma  | Kompetens |
+------------+-----------+
|     305000 |         8 |
+------------+-----------+
```

Bra, då gör vi en lönerevision.



Årlig lönerevision {#revision}
----------------------------------

Det har skett en årlig lönerevision för lärarna, det har varit ett bra år på skolan och lärarna som länge varit underbetalda, enligt deras egen uppfattning.

Det finns en planerad lönepott om totalt 6.4% som skall fördelas över samtliga lärare.

1. Skriv en SELECT-sats som räknar ut hur mycket pengar som ligger i lönepotten och skall fördelas ut.

Svaret kan se ut så här.

```text
+-----------+----------+
| Lonesumma | Lonepott |
+-----------+----------+
|    305000 |    19520 |
+-----------+----------+
```

Tanken är också att ingen lärare skall få lägre löneökning än 3%. Det får vi kontrollera i slutet.

Skriv SQL för att genomföra följande ändringar:

1. Albus kompetens är nu 7 och lönen har ökat till 85 000.
2. Minervas lön har ökat med 4 000.
3. Argus har fått ett risktillägg om 2 000 och kompetensen är satt till 3.
4. Gyllenroy och Alastor har hög frånvaro och har fått ett löneavdrag med 3 000.
5. Alla lärare på avdelningen DIDD fick en extra lönebonus om 2%.
6. Alla låglönade kvinnliga lärare, de som tjänar färre än 40 000, fick en lönejustering om extra 3%.
7. Ge Severus, Minerva och Hagrid ett extra lönetillägg om 5 000 för extra arbete de utför åt Albus och öka deras kompetens med +1.
8. Ge alla lärare en ökning om 2.2% men exkludera Albus, Severus, Minerva och Hagrid som redan fått tillräckligt.

Kontrollera nu den nya lönesumman och hur mycket % som lönesumman har ökat genom att göra rapporter med SELECT.

1. Vilken är numer den totala lönesumman?
1. Hur många % har lönesumman ökat från föregående lönesumma? Du kan hårdkoda den ursprungliga lönesumman.
1. Vilken är numer den totala kompetensen?

Så här ser det ut för mig och har du gjort rätt så skall du ha samma resultat.

```text
+------------+
| Lönesumma  |
+------------+
|     330242 |
+------------+

+--------------------+
| Lönesumma ökning % |
+--------------------+
|             8.2761 |
+--------------------+

+-----------+
| Kompetens |
+-----------+
|        19 |
+-----------+
```

Nåväl, det blev lite högre löneökning än planerat, men så må det vara, vi bokför det som löneglidning.



### Frågor som ej kan besvaras {#ej}

Fundera nu över hur du kan, eller inte kan, besvara följande frågor genom att göra rapporter till skolans ledning via SELECT.

1. Visa de lärare som inte har fått en löneökning om minst 3%.
1. Gör en rapport som visar hur många % respektive lärare fick i löneökning.

Om du inte kan besvara frågorna, fundera kort över vad du tror hade krävts för att besvara dem. Vi skall besvara dem i en kommande övning, men det kräver lite mer jobb och vi är inte redo för det än.



Kontrollera att det blev rätt {#kontroll}
-----------------------------------------

Se till att du har samma värden på lönerna som jag har, det underlättar i kommande övningar om du får samma svar som jag fått.

```sql
SELECT akronym, avdelning, fornamn, kon, lon, kompetens
FROM larare
ORDER BY lon DESC
;
```

Det skall se ut så här.

```text
mysql> SELECT akronym, avdelning, fornamn, kon, lon, kompetens
    -> FROM larare
    -> ORDER BY lon DESC
    -> ;
+---------+-----------+-----------+------+-------+-----------+
| akronym | avdelning | fornamn   | kon  | lon   | kompetens |
+---------+-----------+-----------+------+-------+-----------+
| dum     | ADM       | Albus     | M    | 85000 |         7 |
| min     | DIDD      | Minerva   | K    | 49880 |         2 |
| sna     | DIPT      | Severus   | M    | 45000 |         2 |
| hoc     | DIDD      | Madam     | K    | 37580 |         1 |
| hag     | ADM       | Hagrid    | M    | 30000 |         2 |
| ala     | DIPT      | Alastor   | M    | 27594 |         1 |
| fil     | ADM       | Argus     | M    | 27594 |         3 |
| gyl     | DIPT      | Gyllenroy | M    | 27594 |         1 |
+---------+-----------+-----------+------+-------+-----------+
8 rows in set (0.00 sec)
```

Du kan även summera lönesumman och kompetensen för att få en snabb överblick att det blivit rätt.

```sql
SELECT
    SUM(lon) AS Lönesumma,
    SUM(kompetens) AS Kompetens
FROM larare
;
```

Det skall se ut så här.

```text
mysql> SELECT
    ->     SUM(lon) AS Lönesumma,
    ->     SUM(kompetens) AS Kompetens
    -> FROM larare
    -> ;
+------------+-----------+
| Lönesumma  | Kompetens |
+------------+-----------+
|     330242 |        19 |
+------------+-----------+
```
