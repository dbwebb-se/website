---
author: mos
revision:
    "2019-01-15": "(B, mos) Manuallänken går nu till 8.0."
    "2017-12-28": "(A, mos) Första versionen, uppdelad av större dokument."
...
Inbyggda funktioner
==================================

Vi tittar på en del av de inbyggda funktioner som finns och hur vi kan använda dem när vi skapar rapporter från databasen.

I referensmanualen finns en sektion som bland annat hanterar de [inbyggda funktionerna](https://dev.mysql.com/doc/refman/8.0/en/functions.html).

Spara dina konstruktioner i filen `dml_func.sql`.



Strängfunktioner {#string}
----------------------------------

Leta reda på stycket som hanterar [strängfunktioner](http://dev.mysql.com/doc/refman/8.0/en/string-functions.html).

1. Skriv en SELECT-sats som skriver ut förnamn + efternamn + avdelning i samma kolumn enligt följande struktur: `förnamn efternamn (avdelning)`. (Tips: Att slå ihop strängar kallas att konkatenera/concatenate).
2. Gör om samma sak men skriv ut avdelningens namn med små bokstäver och begränsa utskriften till 3 rader.

I sista steget kan det se ut så här.

```sql
+------------------------+
| NamnAvdelning          |
+------------------------+
| Alastor Moody (dipt)   |
| Albus Dumbledore (adm) |
| Argus Filch (adm)      |
+------------------------+
3 rows in set (0.00 sec)
```



Datum och tid {#datum}
----------------------------------

Titta i stycket med funktioner för [datum och tid](http://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html).

1. Skriv en SELECT-sats som endast visar dagens datum.
3. Gör en SELECT-sats som visar samtliga lärare, deras födelseår samt dagens datum och klockslag.

Det kan se ut så här i sista uppgiften.

```sql
+-----------+------------+--------------+-----------+
| fornamn   | fodd       | Dagens datum | Klockslag |
+-----------+------------+--------------+-----------+
| Alastor   | 1943-04-03 | 2017-12-28   | 14:37:37  |
| Albus     | 1941-04-01 | 2017-12-28   | 14:37:37  |
| Argus     | 1946-04-06 | 2017-12-28   | 14:37:37  |
| Gyllenroy | 1952-05-02 | 2017-12-28   | 14:37:37  |
| Hagrid    | 1956-05-06 | 2017-12-28   | 14:37:37  |
| Madam     | 1948-04-08 | 2017-12-28   | 14:37:37  |
| Minerva   | 1955-05-05 | 2017-12-28   | 14:37:37  |
| Severus   | 1951-05-01 | 2017-12-28   | 14:37:37  |
+-----------+------------+--------------+-----------+
8 rows in set (0.00 sec)
```



Beräkna ålder {#alder}
----------------------------------

Vi vill nu beräkna och visa lärarnas ålder, kan du hitta en inbyggd funktion som hjälper oss med det?

1. Skriv en SELECT-sats som beräknar lärarens ålder, sortera rapporten för att visa vem som är äldst och yngst.

Så här kan svaret se ut.

```sql
+-----------+------------+--------+
| fornamn   | fodd       | Ålder  |
+-----------+------------+--------+
| Albus     | 1941-04-01 |     76 |
| Alastor   | 1943-04-03 |     74 |
| Argus     | 1946-04-06 |     71 |
| Madam     | 1948-04-08 |     69 |
| Severus   | 1951-05-01 |     66 |
| Gyllenroy | 1952-05-02 |     65 |
| Minerva   | 1955-05-05 |     62 |
| Hagrid    | 1956-05-06 |     61 |
+-----------+------------+--------+
```



Filtrera per del av datum {#manad}
----------------------------------

Man kan visa delar av datum, till exempel vilken månad alla lärare är födda.

```sql
mysql> SELECT
    ->     fornamn,
    ->     fodd,
    ->     MONTHNAME(fodd) AS 'Månad'
    -> FROM larare;
+-----------+------------+--------+
| fornamn   | fodd       | Månad  |
+-----------+------------+--------+
| Alastor   | 1943-04-03 | April  |
| Albus     | 1941-04-01 | April  |
| Argus     | 1946-04-06 | April  |
| Gyllenroy | 1952-05-02 | May    |
| Hagrid    | 1956-05-06 | May    |
| Madam     | 1948-04-08 | April  |
| Minerva   | 1955-05-05 | May    |
| Severus   | 1951-05-01 | May    |
+-----------+------------+--------+
8 rows in set (0.00 sec)
```

Om man vill filtrera och bara visa de som är födda i maj månad kan man göra funktionsanrop i WHERE-delen.

```sql
mysql> SELECT
    ->     fornamn,
    ->     fodd,
    ->     MONTHNAME(fodd) AS 'Månad'
    -> FROM larare
    -> WHERE MONTH(fodd) = 5;
+-----------+------------+--------+
| fornamn   | fodd       | Månad  |
+-----------+------------+--------+
| Gyllenroy | 1952-05-02 | May    |
| Hagrid    | 1956-05-06 | May    |
| Minerva   | 1955-05-05 | May    |
| Severus   | 1951-05-01 | May    |
+-----------+------------+--------+
4 rows in set (0.00 sec)
```

Gör en egen rapport för att pröva på hur du skriver funktionsanropet i WHERE-delen.

1. Visa de lärare som är födda på 40-talet.



Kontrollera filen {#filen}
----------------------------------

Innan du är helt klar så kontrollerar du att du kan köra samtliga SQL-satser, i en och samma sekvens, i filen du jobbar i.
