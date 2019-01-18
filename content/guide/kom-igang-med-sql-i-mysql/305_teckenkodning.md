---
author: mos
revision:
    "2019-01-15": "(B, mos) Manuallänk till 8.0 samt flyttad från 'Mer SQL'."
    "2018-01-02": "(A, mos) Första versionen, uppdelad av större dokument."
...
Teckenkodning
==================================

Låt oss dyka ned i teckenkodning med character set och collation. Det handlar om hur en sträng lagras och hur strängen tolkas när den används vid sortering.

Spara den SQL-kod du skriver i filen `test_encoding.sql`.

En installation av databasen MySQL har (kan ha) en förvald teckenkodning på systemnivå, databasnivå, tabell och kolumnnivå. Den förvalda teckenkodningen kan skilja sig mellan olika miljöer. Det är därför att rekommendera, om det så krävs, att man skapar sina tabeller och explicit anger vilken teckenkodning som skall användas per tabell och/eller per kolumn.

Låt oss se ett fall där det är absolut nödvändigt att ange teckenkodningen.

Innan du börjar kan du ta en kort titt i [manualen om teckenkodning](https://dev.mysql.com/doc/refman/8.0/en/charset-mysql.html).



Character set och Collation {#explain}
----------------------------------

Ett character set, charset, är en mängd av tecken, symboler. Till exempel det svenska alfabetet. Varje tecken är kodad enligt en siffra. Du har säkert hört talas om ASCII-värdet på ett tecken där ASCII-värdet på `A` är 65.

Så, ett charset består av symboler och symbolernas kodade värde.

En collation är en samling regler för att jämföra tecken i ett charset. En collation ger oss regelverket för att sortera namn i svensk bokstavsordning, eller norsk, om vi så väljer.



Använd koppling enligt UTF8 {#setnames}
----------------------------------

Innan vi börjar ser vi till att alla tecken överförs enligt UTF8 mellan klienten och databasservern.

```sql
SET NAMES 'utf8';
```

Nu kan klienten och servern kommunicera och båda vet om att det som skickas är kodat enligt UTF-8. Missförstånd och gissningar kan undvikas.



Tabell med svenska tecken {#svtecken}
----------------------------------

Låt oss skapa en tabell som innehåller svenska och norska tecken i en kolumn.

```sql
DROP TABLE IF EXISTS person;
CREATE TABLE person
(
	fornamn VARCHAR(10)
);

INSERT INTO person VALUES
("Örjan"), ("Börje"), ("Bo"), ("Øjvind"),
("Åke"), ("Åkesson"), ("Arne"), ("Ängla"),
("Ægir")
;
```

Du kan nu visa alla raderna i tabellen och sedan visa dem och sortera per namnet.

Så här ser det ut för mig.

```sql
mysql> SELECT * FROM person;
+----------+
| fornamn  |
+----------+
| Örjan    |
| Börje    |
| Bo       |
| Øjvind   |
| Åke      |
| Åkesson  |
| Arne     |
| Ängla    |
| Ægir     |
+----------+
9 rows in set (0.00 sec)

mysql>
mysql> SELECT * FROM person
    -> ORDER BY fornamn;
+----------+
| fornamn  |
+----------+
| Arne     |
| Bo       |
| Börje    |
| Åke      |
| Åkesson  |
| Ægir     |
| Ängla    |
| Örjan    |
| Øjvind   |
+----------+
9 rows in set (0.00 sec)
```

I första SELECT visas raderna i den ordning de är inlagda. I den andra sorteras de enligt namnet och det ser rätt ut för mig, även de norska bokstäverna. Men varför blir det rätt sortering?

Låt oss undersöka saken.



Visa collation {#collation}
----------------------------------

Via SHOW CREATE TABLE kan vi se hur tabellen är skapad. Så här ser det ut för mig.

```sql
mysql> SHOW CREATE TABLE person;
+--------+-------------------------------
| Table  | Create Table                  
+--------+-------------------------------
| person | CREATE TABLE `person` (
  `fornamn` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
+--------+-------------------------------
1 row in set (0.00 sec)
```

Vi ser att min installation av databasen har valt `latin1` som character set. Det beror på hur min installation är konfigurerad. Det kan se annorlunda ut för dig.

Vi tittar noggrannare på vad character set latin1 innebär för collation.

```sql
mysql> SHOW CHARSET LIKE 'latin1';
+---------+----------------------+-------------------+--------+
| Charset | Description          | Default collation | Maxlen |
+---------+----------------------+-------------------+--------+
| latin1  | cp1252 West European | latin1_swedish_ci |      1 |
+---------+----------------------+-------------------+--------+
1 row in set (0.00 sec)
```

För mig är default collation `latin1_swedish_ci` för tabellen och den hanterar svenska tecken som kan man förvänta sig. Den sista kolumnen säger att varje tecken tar 1 plats.

Låt oss kika på vilka andra collations som finns i charset latin1.

```sql
mysql> SHOW COLLATION WHERE Charset = 'latin1';
+-------------------+---------+----+---------+----------+---------+
| Collation         | Charset | Id | Default | Compiled | Sortlen |
+-------------------+---------+----+---------+----------+---------+
| latin1_german1_ci | latin1  |  5 |         | Yes      |       1 |
| latin1_swedish_ci | latin1  |  8 | Yes     | Yes      |       1 |
| latin1_danish_ci  | latin1  | 15 |         | Yes      |       1 |
| latin1_german2_ci | latin1  | 31 |         | Yes      |       2 |
| latin1_bin        | latin1  | 47 |         | Yes      |       1 |
| latin1_general_ci | latin1  | 48 |         | Yes      |       1 |
| latin1_general_cs | latin1  | 49 |         | Yes      |       1 |
| latin1_spanish_ci | latin1  | 94 |         | Yes      |       1 |
+-------------------+---------+----+---------+----------+---------+
8 rows in set (0.00 sec)
```

Det verkar finnas flera olika collations att välja, beroende på vilka språkregler man vill använda vid sorteringen. Jag antar att det är min installation som själv har valt att göra `latin1_swedish_ci` till default.

Så, om tecknen sparas som character set latin1 så finns det olika varianter hur varje tecken kan tolkas vid sortering där tecken för tecken jämförs. Det är, som vi tidigare sa, collation som bestämmer hur ett charset sorteras.



Ändra till UTF8 {#utf8}
----------------------------------

Säg nu att jag skulle vilja spara tecken som UTF-8, bara för vårt exempels skull. Med UTF-8 kan jag spara specialtecken som normalt inte finns i ASCII-tabellen. Samtidigt försöker jag finna en collation som löser sorteringen.

Jag tänkte använda mig av charset `utf8` och jag tittar vilken default collation den har.

```sql
mysql> SHOW CHARSET LIKE 'utf8';
+---------+---------------+-------------------+--------+
| Charset | Description   | Default collation | Maxlen |
+---------+---------------+-------------------+--------+
| utf8    | UTF-8 Unicode | utf8_general_ci   |      3 |
+---------+---------------+-------------------+--------+
1 row in set (0.00 sec)
```

Du kan se att här kan varje tecken ta upp till tre teckens plats (`Maxlen`). Det är så UTF-8 kodar vissa av tecknen. Till exempel så kodas tecknet © enligt `C2A9` med två tecken. Låt oss se hur databasen hanterar detta.

```sql
mysql> SELECT HEX("©");
+-----------+
| HEX("©")  |
+-----------+
| C2A9      |
+-----------+
1 row in set (0.00 sec)
```

Nåväl, åter på spåret och för att testa mitt nya charset och collation så uppdaterar jag min tabell till `utf8` och `utf8_general_ci`.

```sql
ALTER TABLE person CONVERT TO CHARSET utf8 COLLATE utf8_unicode_ci;
```

Jag prövar att sortera innehållet i tabellen.

```sql
mysql> SELECT * FROM person
    -> ORDER BY fornamn;
+----------+
| fornamn  |
+----------+
| Åke      |
| Åkesson  |
| Ängla    |
| Arne     |
| Ægir     |
| Bo       |
| Börje    |
| Örjan    |
| Øjvind   |
+----------+
9 rows in set (0.00 sec)
```

Ajdå. Det blev inte riktigt rätt i sorteringen. Låt se vilka collations jag har att välja på.

```sql
SHOW COLLATION WHERE Charset = 'utf8';
```

Det blev en lång lista i svaret men jag letar och hittar collation `utf8_swedish_ci` som känns rätt. Jag byter teckenkodning på tabellen igen.

```sql
ALTER TABLE person CONVERT TO CHARSET utf8 COLLATE utf8_swedish_ci;
```

Då kollar vi sorteringen.

```sql
mysql> SELECT * FROM person
    -> ORDER BY fornamn;
+----------+
| fornamn  |
+----------+
| Arne     |
| Bo       |
| Börje    |
| Åke      |
| Åkesson  |
| Ægir     |
| Ängla    |
| Øjvind   |
| Örjan    |
+----------+
9 rows in set (0.00 sec)
```

Nu ser det bra ut igen. Om du är uppmärksam ser du att Øjvind och Örjan har bytt plats. Uppenbarligen hanteras denna collation bokstaven Ø och Ö något annorlunda än den collation jag först använda. Vilket sätt är mest rätt? Det överlåter vi åt ett språkråd att bedömma. Det vi kan göra är att studera hur MySQL har lagt upp reglerna för respektive collation.

Det finns en webbplats där vi kan jämföra collations och se hur de jämför symbolerna i respektive charset.

* [latin1_swedish_ci](http://collation-charts.org/mysql60/mysql604.latin1_swedish_ci.html)
* [utf8_general_ci](http://collation-charts.org/mysql60/mysql604.utf8_general_ci.european.html)
* [utf8_swedish_ci](http://collation-charts.org/mysql60/mysql604.utf8_swedish_ci.html)

Låt hoppas att detta ger dig en förståelse för hur character set och collations påverkar din databas.



Kontrollera filen {#filen}
----------------------------------

Innan du är helt klar så kontrollerar du att du kan köra samtliga SQL-satser, i en och samma sekvens, i filen du jobbar i.
