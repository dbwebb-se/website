---
author:
    - mos
category:
    - mysql
    - sql
    - sql index
    - kurs databas
revision:
    "2019-02-25": "(E, mos) Genomgången inför våren 2019, mindre justeringar i text."
    "2018-01-15": "(D, mos) Wrong name drop fulltext index."
    "2018-01-15": "(C, mos) Tillagd i kurs databas."
    "2017-05-02": "(B, mos) Genomgång, inkl främmande nycklar och stödjer oophp."
    "2017-03-28": "(A, mos) Första versionen."
...
Index och prestanda i MySQL
===================================

[FIGURE src=/image/snapvt17/mysql-show-profile.png?w=c5&a=0,60,60,0 class="right"]

Vi skall titta på index och hur de hjälper dig att optimera din databas. Vi ser hur olika index påverkar antalet rader som måste besökas för att producera resultatet och vi lär oss innebörden av frågeoptimerarens jobb och vad termen _full table scan_ innebär.


<!--more-->



Förutsättning {#pre}
-------------------------------

Du har goda kunskaper i SQL och i MySQL/MariaDB.

En del av underlaget till denna artikel har utgått från [delen Optimization i manualen för MySQL](https://dev.mysql.com/doc/refman/8.0/en/optimization.html).

Motsvarande information för MariaDB finner du i "[Optimization and Tuning](https://mariadb.com/kb/en/optimization-and-tuning/)".

I ditt kursrepo för databas under `example/sql/index.sql` finns grunden till de exempel som används i artikeln.



Skapa egen tabell för tester {#testabell}
------------------------------

Gör så här för att skapa en egen tabell i din testdatabas 'dbwebb', men dubbelkolla först i SQL-filen så du ser vad den gör.

```text
mysql --table dbwebb < example/sql/index.sql
```

Koden ser ut ungefär så här.

```sql
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`
(
    `code` CHAR(6),
    `nick` CHAR(12),
    `points` DECIMAL(3, 1),
    `name` VARCHAR(60)
);

DELETE FROM course;
INSERT INTO course
VALUES
    ('DV1531', 'python',     7.5, 'Programmering och Problemlösning med Python'),
    ('PA1439', 'htmlphp',    7.5, 'Webbteknologier'),
    ('DV1561', 'javascript', 7.5, 'Programmering med JavaScript'),
    ('PA1436', 'design',     7.5, 'Teknisk webbdesign och användbarhet'),
    ('DV1547', 'linux',      7.5, 'Programmera webbtjänster i Linux'),
    ('PA1437', 'oopython',   7.5, 'Objektorienterad design och programmering med Python'),
    ('DV1546', 'webapp',     7.5, 'Webbapplikationer för mobila enheter'),
    ('DV1506', 'webgl',      7.5, 'Spelteknik för webben'),
    ('PA1444', 'dbjs',      10.0, 'Webbprogrammering och databaser')
;
```

Tabellen ser ut så här.

```text
mysql> SELECT * FROM course;
+--------+------------+--------+------------------------------------------------------+
| code   | nick       | points | name                                                 |
+--------+------------+--------+------------------------------------------------------+
| DV1531 | python     |    7.5 | Programmering och Problemlösning med Python          |
| PA1439 | htmlphp    |    7.5 | Webbteknologier                                      |
| DV1561 | javascript |    7.5 | Programmering med JavaScript                         |
| PA1436 | design     |    7.5 | Teknisk webbdesign och användbarhet                  |
| DV1547 | linux      |    7.5 | Programmera webbtjänster i Linux                     |
| PA1437 | oopython   |    7.5 | Objektorienterad design och programmering med Python |
| DV1546 | webapp     |    7.5 | Webbapplikationer för mobila enheter                 |
| DV1506 | webgl      |    7.5 | Spelteknik för webben                                |
| PA1444 | dbjs       |   10.0 | Webbprogrammering och databaser                      |
+--------+------------+--------+------------------------------------------------------+
9 rows in set (0.00 sec)
```

Du kan även köra allt i Workbench. 

För att du på bästa sätt skall lära dig de delar som artikeln behandlar, så bör du köra dem själv och på egen hand. Nu har du möjlighet till det.

Ett bra tips är att du sparar undan all kod du skriver och lägger kommentarer kring den, du kan ha nytta av sådana kodexempel framöver när du behöver skapa egna index till dina tabeller.



Prestandaoptimering av databaser {#generell}
------------------------------

Det finns många olika sätt att optimera en databas på. Det kan röra sig om tabellstrukturen, hur vi ställer SQL-frågor och hur uppdateringar görs, det rör sig om den fysiska lagringen på disk, det rör sig om hur mycket resurser databasmotorn har tillgång till i form av minne och CPU, det kan röra antalet samtidiga kopplingar till databasen eller hur databasinstallationen är utförd avseende backuper och om databasen är kopplad till replikering och/eller high availability eller så rör det prestandan på själva värdmaskinen som kör databasen.

Det finns många aspekter att beakta.

Låt oss undvika delen med hårdvaran och hur MySQL är installerad och konfigurerad. Vi väljer istället att fokusera på vilken optimering som kan göras på databasnivå med SQL-frågor och tabeller.

Här handlar det om grundläggande saker som om databasen har en hälsosam struktur där tabeller och kolumner matchar den typen av applikation man vill ha. De frågor man ställer mot databasen bör vara optimerade och endast hämta/använda de resurser som krävs.

Vår generella regel är enkel och lyder enligt följande.

> "Använd inte mer resurser än du behöver och krångla inte till det."

Låt oss se vilka tips vi kan föreslå, för att jobba med optimering av databasen på databas- och SQL-nivå.



Frågeoptimeraren {#qoptimiser}
------------------------------

Frågeoptimeraren, eller _query optimizer_, har till uppgift att optimera utförandet av de frågor du ställer mot databasen. Den försöker finna en optimal plan för exekvering av frågan, en _execution plan_. Skillnaden mellan en bra och dålig plan kan vara mycket stor (sekunder, timmar, dagar) så frågeoptimerarens arbete är mycket viktigt.

Man kan konfigurera vissa förutsättningarna för frågeoptimerarens arbete, men det kategoriserar vi definitivt som överkurs och vi nöjer oss med att veta om att det finns en frågeoptimerare inuti databasmotorn som analyserar alla våra SQL frågor och försöker hitta den optimala planen för att exekvera dem.

När vi skriver vår SQL-fråga så är det frågeoptimeraren som tar hand om den. Vi behöver ge frågeoptimeraren de bästa förutsättningarna möjliga, för att underlätta dess jobb. Hur kan vi göra det?

Ingen vill vänta extra sekunder, timmar, dagar på ett resultat, iallafall inte om det inte krävs.



Använd index {#index}
------------------------------

Den enklaste regeln, för att underlätta för frågeoptimeraren, må vara att alla dina sökningar i databasen skall göras på kolumner som har ett index kopplat till sig. Låt se vad det innebär i praktiken och hur vi kan försäkra oss om att så sker.



### Full table scan {#tablescan}

Det vi vill undvika är en [full table scan](https://en.wikipedia.org/wiki/Full_table_scan). En full table scan är när frågeoptimeraren måste gå igenom samtliga rader i tabellen för att finna det vi söker efter.

Utan index så har frågeoptimeraren ingen möjlighet att finna genvägar till svaret, genvägar som gör att endast en delmängd av tabellens rader behöver besökas.

När vi tittar på en fråga så bör vi alltså minimera möjligheten att det sker en full table scan, vi kan göra det genom att tillföra index på relevanta kolumner. Relevanta kolumner är de som testas och används, till exempel i WHERE-villkoret.

Att ha för många onödiga index är en kostnad i sig då det tar upp plats på hårddisken och det tar tid för frågeoptimeraren att upprätthålla strukturen för index och välja vilket/vilka index den skall använda. Det är alltså ingen hållbar lösning att lägga till index på samtliga kolumner. Man lägger rätt index där de behövs.



### Tabellens grundstruktur {#grunden}

Det bästa sättet att optimera en SELECT-fråga är att de kolumner som _testas_ i frågan, är indexerade.

Låt säga att vi har en tabell enligt följande.

```sql
CREATE TABLE `course`
(
	`code` CHAR(6),
	`nick` CHAR(12),
    `points` DECIMAL(3, 1),
	`name` VARCHAR(60)
);
```

Det finns ännu inget index i tabellen. Vi fyller tabellen med rader och gör en `SELECT *`. Det är naturligt att den frågan innebär en full table scan, alla rader måste hanteras för att producera ett resultat.

Så här blir resultatet, table scan eller ej.

```sql
mysql> SELECT * FROM course;
+--------+----------+--------+-------------------------------------------+
| code   | nick     | points | name                                      |
+--------+----------+--------+-------------------------------------------+
| DV1531 | python   |    7.5 | Programmering och Problemlösning med Pyt  |
| PA1439 | htmlphp  |    7.5 | Webbteknologier                           |
| DV1561 | javascri |    7.5 | Programmering med JavaScript              |
| PA1436 | design   |    7.5 | Teknisk webbdesign och användbarhet       |
| DV1547 | linux    |    7.5 | Programmera webbtjänster i Linux          |
| PA1437 | oopython |    7.5 | Objektorienterad design och programmerin  |
| DV1546 | webapp   |    7.5 | Webbapplikationer för mobila enheter      |
| DV1506 | webgl    |    7.5 | Spelteknik för webben                     |
| PA1444 | dbjs     |   10.0 | Webbprogrammering och databaser           |
+--------+----------+--------+-------------------------------------------+
9 rows in set (0.00 sec)
```

Vi kan använda [EXPLAIN](https://dev.mysql.com/doc/refman/8.0/en/explain.html) mot tabellen, för att se hur tabellen är strukturerad. Utskriften ger oss tabellens struktur och information om datatyper, NULL, nycklar med mera. 

```sql
mysql> EXPLAIN course;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| code   | char(6)      | YES  |     | NULL    |       |
| nick   | char(8)      | YES  |     | NULL    |       |
| points | decimal(3,1) | YES  |     | NULL    |       |
| name   | varchar(40)  | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
4 rows in set (0.01 sec)
```

Det vi ser är alltså tabellens grundstruktur och hur kolumnerna är definierade.

Vi kan även använda EXPLAIN mot frågor som SELECT, UPDATE, INSERT eller DELETE. Det ger oss information om hur frågeoptimeraren tolkar frågan och vilken exekveringsplan vi kan förvänta oss.

```sql
mysql> EXPLAIN SELECT * FROM course;
+----+-------------+--------+------+---------------+------+---------+------+------+-------+
| id | select_type | table  | type | possible_keys | key  | key_len | ref  | rows | Extra |
+----+-------------+--------+------+---------------+------+---------+------+------+-------+
|  1 | SIMPLE      | course | ALL  | NULL          | NULL | NULL    | NULL |    9 | NULL  |
+----+-------------+--------+------+---------------+------+---------+------+------+-------+
1 row in set (0.00 sec)
```

Ovan använder vi `EXPLAIN` för att visa information om hur frågeoptimeraren tolkar SELECT-frågan och vilka ledtrådar som finns när den bestämmer exekveringsplanen.

Vår SELECT-fråga berör bara en tabell (`SIMPLE`), det finns ingen join eller subquery, det finns inga möjliga nycklar (`possible_keys`) att använda och ingen nyckel är heller vald (`key`). Vi ser att frågan kommer att gå igenom 9 rader (`rows`) vilket är samtliga rader, det vill säga en full table scan.



### Skapa index via primärnyckel {#primary}

Låt oss pröva en ny fråga där vi endast letar efter en rad.

```sql
mysql> SELECT * FROM course WHERE code = 'PA1444';
+--------+------+--------+---------------------------------+
| code   | nick | points | name                            |
+--------+------+--------+---------------------------------+
| PA1444 | dbjs |   10.0 | Webbprogrammering och databaser |
+--------+------+--------+---------------------------------+
1 row in set (0.00 sec)
```

Sökningen sker på kolumnen `code` som är en kandidatnyckel (potentiell primärnyckel) i tabellen. Vi vet att det bara finns en rad som kan matcha frågan.

```sql
mysql> EXPLAIN SELECT * FROM course WHERE code = 'PA1444';
+----+-------------+--------+------+---------------+------+---------+------+------+-------------+
| id | select_type | table  | type | possible_keys | key  | key_len | ref  | rows | Extra       |
+----+-------------+--------+------+---------------+------+---------+------+------+-------------+
|  1 | SIMPLE      | course | ALL  | NULL          | NULL | NULL    | NULL |    9 | Using where |
+----+-------------+--------+------+---------------+------+---------+------+------+-------------+
1 row in set (0.00 sec)
```

Det  visar en full table scan om 9 rader. Vi vet att det endast är en rad som kan matcha, men det vet inte frågeoptimeraren. Vi kan lösa det med ett index, så att frågeoptimeraren får bättre ledtrådar till sin exekveringsplan.

I detta fallet har vi ännu ingen primärnyckel och eftersom kolumnen `code` är en kandidatnyckel så får det bli den som blir primärnyckel. En primärnyckel bidrar automatiskt med ett index.

Här väljer jag att lägga till primärnyckeln på den befintliga tabellen via ALTER TABLE.

```sql
mysql> ALTER TABLE course ADD PRIMARY KEY(code);
Query OK, 9 rows affected (0.10 sec)
Records: 9  Duplicates: 0  Warnings: 0
```

Nu kan jag se hur EXPLAIN tolkar resultatet, nu med primärnyckel som ger ett index.

```sql
mysql> EXPLAIN SELECT * FROM course WHERE code = "PA1444";
+----+-------------+--------+-------+---------------+---------+---------+-------+------+-------+
| id | select_type | table  | type  | possible_keys | key     | key_len | ref   | rows | Extra |
+----+-------------+--------+-------+---------------+---------+---------+-------+------+-------+
|  1 | SIMPLE      | course | const | PRIMARY       | PRIMARY | 6       | const |    1 | NULL  |
+----+-------------+--------+-------+---------------+---------+---------+-------+------+-------+
1 row in set (0.00 sec)
```

Nu börjar det bli ordning. Nu behöver endast en rad gås igenom (`rows`) vi ser också av `const` i `type` att frågeoptimeraren vet att det finns som mest en matchande rad i tabellen och den läses in i början av frågan. Tabeller med `const` är mycket snabba eftersom de endast behöver läsas en gång.

Hur kan jag veta var `const` betyder i `type`? Jag läser dokumentationen för MySQL och EXPLAIN. Den är bra att ha tillhanda för att förstå vad EXPLAIN försöker berätta för mig.

När vi gör EXPLAIN på tabellen så ser vi nu att det finns en primärnyckel (`PRI`) för kolumnen `code`.

```sql
mysql> EXPLAIN course;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| code   | char(6)      | NO   | PRI |         |       |
| nick   | char(8)      | YES  |     | NULL    |       |
| points | decimal(3,1) | YES  |     | NULL    |       |
| name   | varchar(40)  | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)
```

Det var vårt första index och vi förändrade en table scan till att bara beröra en rad. 



### Nytt index med Unique {#unique}

Vi vill nu ställa en ny fråga på kursens smeknamn och finna en matchande rad.

```sql
mysql> EXPLAIN SELECT * FROM course WHERE nick = 'dbjs';
+----+-------------+--------+------+---------------+------+---------+------+------+-------------+
| id | select_type | table  | type | possible_keys | key  | key_len | ref  | rows | Extra       |
+----+-------------+--------+------+---------------+------+---------+------+------+-------------+
|  1 | SIMPLE      | course | ALL  | NULL          | NULL | NULL    | NULL |    9 | Using where |
+----+-------------+--------+------+---------------+------+---------+------+------+-------------+
1 row in set (0.00 sec)
```

Här får vi inget stöd av primärnyckeln, eftersom vi söker baserat på en annan kolumn. Vi är tillbaka i en full table scan.

Det löser vi med att sätta kolumnen som UNIQUE vilket innebär att varje värde i kolumnen är unikt, på samma sätt som primärnyckeln. UNIQUE ger oss ett index på kolumnen och tänker vi efter så är kursens smeknamn unikt (kandidatnyckel), så det passar bra ihop.

Först lägger vi till indexet via ALTER TABLE.

```sql
mysql> ALTER TABLE course ADD CONSTRAINT nick_unique UNIQUE (nick);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

Nu prövar vi med EXPLAIN igen och denna gången ser vi att endast en rad behöver besökas.

```sql
mysql> EXPLAIN SELECT * FROM course WHERE nick = 'dbjs';
+----+-------------+--------+-------+---------------+-------------+---------+-------+------+-------+
| id | select_type | table  | type  | possible_keys | key         | key_len | ref   | rows | Extra |
+----+-------------+--------+-------+---------------+-------------+---------+-------+------+-------+
|  1 | SIMPLE      | course | const | nick_unique   | nick_unique | 9       | const |    1 | NULL  |
+----+-------------+--------+-------+---------------+-------------+---------+-------+------+-------+
1 row in set (0.00 sec)
```

Vi kan köra EXPLAIN på tabellen och ser nu att indexet `UNI` finns på plats.

```sql
mysql> EXPLAIN course;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| code   | char(6)      | NO   | PRI |         |       |
| nick   | char(8)      | YES  | UNI | NULL    |       |
| points | decimal(3,1) | YES  |     | NULL    |       |
| name   | varchar(40)  | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)
```

Bra, då är vi tillbaka i ett läge där frågan kommer hitta svaret direkt, en rad behövs gås igenom och tittar vi på tabellens struktur så ser vi att det nu är en UNIQUE nyckel (`UNI`) på nick-kolumnen.

För varje fråga vi ställer så kan vi alltså analysera hur många rader den kommer behöva titta på. En rad är bra, en full table scan är mindre bra.

Nåväl, man måste alltid sätta saker i perspektiv, om vi bara har 9 rader och en tabell, då spelar prestanda och optimering inte så stor roll. Det behövs större och komplexare databaser och mer krävande användning för att vi skall se skillnaden. Men det behovet kan komma tidigare än du tror. Det är bra att vara förberedd och göra rätt i grunden.



### Visa och ta bort index {#dropindex}

Låt oss kika vilka index som nu finns på tabellen (SHOW) och hur vi kan ta bort ett av dem (DROP) för att sedan återskapa det (CREATE).

SHOW INDEX visar vilka index som finns.

```sql
mysql> SHOW INDEX FROM course;
+--------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table  | Non_unique | Key_name    | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+--------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| course |          0 | PRIMARY     |            1 | code        | A         |           9 |     NULL | NULL   |      | BTREE      |         |               |
| course |          0 | nick_unique |            1 | nick        | A         |           9 |     NULL | NULL   | YES  | BTREE      |         |               |
+--------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
2 rows in set (0.00 sec)
```

Här får vi en lista med detaljer om de index som finns på tabellen. Vill vi ta bort ett index kan vi göra det med DROP INDEX via dess namn.

```sql
mysql> DROP INDEX nick_unique ON course;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

Nu är vårt index borta, du kan verifiera med SHOW eller EXPLAIN.

Det finns andra sätt än ALTER TABLE att skapa ett index, du kan skapa nya index med CREATE INDEX.

```sql
mysql> CREATE UNIQUE INDEX nick_unique ON course (nick);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

Du kan nu verifiera (SHOW/EXPLAIN) att indexet är tillbaka.



### Skapa index vid CREATE TABLE {#crtabindex}

Normalt skapar du dina index tillsammans med din CREATE TABLE. Det ger oss ytterligare en syntax för att skapa våra index. Om vi använder SHOW CREATE TABLE så får vi en ledtråd till hur tabellen kan skapas.

```sql
mysql> SHOW CREATE TABLE course\G
*************************** 1. row ***************************
       Table: course
Create Table: CREATE TABLE `course` (
  `code` char(6) NOT NULL DEFAULT '',
  `nick` char(12) DEFAULT NULL,
  `points` decimal(3,1) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `nick_unique` (`nick`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
1 row in set (0.00 sec)
```

Varianten med `\G` ger oss en radvis utskrift istället för kolumnvis.

Om vi återskapar vår egen tabell, nu med index från början, skulle koden kunna se ut så här.

```sql
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`
(
	`code` CHAR(6),
	`nick` CHAR(12),
    `points` DECIMAL(3, 1),
	`name` VARCHAR(60),
    
    PRIMARY KEY (`code`),
    UNIQUE KEY `nick_unique` (`nick`)
);
```

Resultatet i form av tabellstruktur och index blir exakt det samma som vi har sedan tidigare. Du kan dubbelkolla via EXPLAIN och SHOW INDEX.



### Index för delsökning av sträng {#strinindex}

Då tar vi nästa fråga och nu vill vi göra delsökningar på kursens namn.

Först en fråga med `name LIKE 'Webb%'`.

```sql
mysql> SELECT * FROM course WHERE name LIKE 'Webb%';
+--------+---------+--------+---------------------------------------+
| code   | nick    | points | name                                  |
+--------+---------+--------+---------------------------------------+
| DV1546 | webapp  |    7.5 | Webbapplikationer för mobila enheter  |
| PA1439 | htmlphp |    7.5 | Webbteknologier                       |
| PA1444 | dbjs    |   10.0 | Webbprogrammering och databaser       |
+--------+---------+--------+---------------------------------------+
3 rows in set (0.00 sec)
```

Tre rader som träffade men man undrar hur många rader som behöver besökas. EXPLAIN ger oss svaret.

```sql
mysql> EXPLAIN SELECT * FROM course WHERE name LIKE 'Webb%';
+----+-------------+--------+------+---------------+------+---------+------+------+-------------+
| id | select_type | table  | type | possible_keys | key  | key_len | ref  | rows | Extra       |
+----+-------------+--------+------+---------------+------+---------+------+------+-------------+
|  1 | SIMPLE      | course | ALL  | NULL          | NULL | NULL    | NULL |    9 | Using where |
+----+-------------+--------+------+---------------+------+---------+------+------+-------------+
1 row in set (0.00 sec)
```

Det finns tre träffar på `LIKE 'Webb%'` men det krävs en full table scan för att hitta dem. Låt se hur bra ett index kan lösa detta.

```sql
mysql> CREATE INDEX index_name ON course(name);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

Vi skapar ett vanligt index som databasen kan använda för att indexera värden i kolumnen `name`.

Sedan låter vi EXPLAIN visa om det indexet kan göra någon skillnad.

```sql
mysql> EXPLAIN SELECT * FROM course WHERE name LIKE 'Webb%';
+----+-------------+--------+-------+---------------+------------+---------+------+------+-----------------------+
| id | select_type | table  | type  | possible_keys | key        | key_len | ref  | rows | Extra                 |
+----+-------------+--------+-------+---------------+------------+---------+------+------+-----------------------+
|  1 | SIMPLE      | course | range | index_name    | index_name | 43      | NULL |    3 | Using index condition |
+----+-------------+--------+-------+---------------+------------+---------+------+------+-----------------------+
1 row in set (0.00 sec)
```

Det kunde det. Det blev till och med så bra att enbart 3 rader behövde besökas för att komma fram till resultatet. Det var ett bra index.

Vi kan se hur tabellen ser ut, med EXPLAIN.

```sql
mysql> EXPLAIN course;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| code   | char(6)      | NO   | PRI |         |       |
| nick   | char(8)      | YES  | UNI | NULL    |       |
| points | decimal(3,1) | YES  |     | NULL    |       |
| name   | varchar(40)  | YES  | MUL | NULL    |       |
+--------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)
```

Jag tackar och tar emot när EXPLAIN visar att det nu är tre rader som behöver finnas, kunde inte varit bättre ju. Ett index på en varchar-kolumn som används i sökningar verkar vara en bra sak. Vi ser också att tabellen har fått en `MUL` nyckel på kolumnen name.

Man undrar om det även löser frågor likt `LIKE '%prog%'` eller `LIKE '%Python'`? Följande tester säger dock nej.

Först kollar vi `LIKE '%prog%'`.


```sql
mysql> EXPLAIN SELECT * FROM course WHERE name LIKE '%prog%';
+----+-------------+--------+------+---------------+------+---------+------+------+-------------+
| id | select_type | table  | type | possible_keys | key  | key_len | ref  | rows | Extra       |
+----+-------------+--------+------+---------------+------+---------+------+------+-------------+
|  1 | SIMPLE      | course | ALL  | NULL          | NULL | NULL    | NULL |    9 | Using where |
+----+-------------+--------+------+---------------+------+---------+------+------+-------------+
1 row in set (0.00 sec)
```

Det blev en table scan. Då kollar vi `LIKE '%Python'`.

```sql
mysql> EXPLAIN SELECT * FROM course WHERE name LIKE '%Python';
+----+-------------+--------+------+---------------+------+---------+------+------+-------------+
| id | select_type | table  | type | possible_keys | key  | key_len | ref  | rows | Extra       |
+----+-------------+--------+------+---------------+------+---------+------+------+-------------+
|  1 | SIMPLE      | course | ALL  | NULL          | NULL | NULL    | NULL |    9 | Using where |
+----+-------------+--------+------+---------------+------+---------+------+------+-------------+
1 row in set (0.00 sec)
```

Samma sak, en table scan. I dessa båda fall så kan vårt index inte hjälpa till. Vårt index verkar fungera bäst tillsammans delsträngar där man vet vänster-delen av strängen. Det kan hänga ihop med hur indexet byggs upp.

Nåväl det finns andra typer av index om jag nu vill envisas att utföra sökningar av delsträng.



### Full text index {#fulltext}

Detta är egentligen ett sidospår från optimeringen, men det handlar trots allt om ett index.

MySQL stödjer något som heter FULLTEXT index vilket tillåter mer avancerad sökning än `LIKE` på större textdokument eller strängar.

Vi skall inte dyka in i detta men tar ändå ett litet exempel, bara för att visa hur det fungerar.

Vi skapar ett FULLTEXT index och använder sedan MATCH och AGAINST för att utföra en fulltext-sökning som returnerar en poäng för hur väl söksträngen matchade texten.

Först skapar vi indexet.

```sql
mysql> CREATE FULLTEXT INDEX full_name ON course(name);
Query OK, 0 rows affected (0.19 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

Sedan kör vi en fråga med MATCH och AGAINST. Svaret `score` visar hur bra söksträngarna matchade.

```sql
mysql> SELECT name, MATCH(name) AGAINST ('Program* web*' IN BOOLEAN MODE) AS score FROM course ORDER BY score DESC;
+-------------------------------------------+----------------------+
| name                                      | score                |
+-------------------------------------------+----------------------+
| Programmera webbtjänster i Linux          |   0.1550406515598297 |
| Programmering och Problemlösning med Pyt  |  0.12403252720832825 |
| Programmering med JavaScript              |  0.12403252720832825 |
| Objektorienterad design och programmerin  |  0.12403252720832825 |
| Spelteknik för webben                     | 0.031008131802082062 |
| Webbapplikationer för mobila enheter      | 0.031008131802082062 |
| Teknisk webbdesign och användbarhet       | 0.031008131802082062 |
| Webbteknologier                           | 0.031008131802082062 |
| Webbprogrammering och databaser           | 0.031008131802082062 |
+-------------------------------------------+----------------------+
9 rows in set (0.00 sec)
```

Som sagt, detta handlar inte om optimering, det handlar mer om möjligheten att bygga upp ett fulltext index som tillåter en en fritextsökning i en eller flera kolumner. Index kommer i olika former, men i grunden hjälper de databasen och frågeoptimeraren att vara effektiv i sitt jobb.



### Index för numeriska värden {#larger}

Låt oss pröva en variant av SELECT och index där jag vill ha fram alla rader som är större än ettt numeriskt värde, säg `points > 7.5` för alla kurser som är större än 7.5hp.

Förs kontrollerar vi frågan utan index.

```sql
mysql> SELECT * FROM course WHERE points > 7.5;
+--------+------+--------+---------------------------------+
| code   | nick | points | name                            |
+--------+------+--------+---------------------------------+
| PA1444 | dbjs |   10.0 | Webbprogrammering och databaser |
+--------+------+--------+---------------------------------+
1 row in set (0.00 sec)
```

Det blir en träff. Låt se hur EXPLAIN ser på det.

```sql
mysql> EXPLAIN SELECT * FROM course WHERE points > 7.5;
+----+-------------+--------+------+---------------+------+---------+------+------+-------------+
| id | select_type | table  | type | possible_keys | key  | key_len | ref  | rows | Extra       |
+----+-------------+--------+------+---------------+------+---------+------+------+-------------+
|  1 | SIMPLE      | course | ALL  | NULL          | NULL | NULL    | NULL |    9 | Using where |
+----+-------------+--------+------+---------------+------+---------+------+------+-------------+
1 row in set (0.00 sec)
```

Det blev en table scan. Vi prövar att optimera med ett vanligt index.

```sql
mysql> CREATE INDEX index_points ON course(points);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

Indexet är på plats, låt se om EXPLAIN kan dra nytta av det.

```sql
mysql> EXPLAIN SELECT * FROM course WHERE points > 7.5;
+----+-------------+--------+-------+---------------+--------------+---------+------+------+-----------------------+
| id | select_type | table  | type  | possible_keys | key          | key_len | ref  | rows | Extra                 |
+----+-------------+--------+-------+---------------+--------------+---------+------+------+-----------------------+
|  1 | SIMPLE      | course | range | index_points  | index_points | 3       | NULL |    1 | Using index condition |
+----+-------------+--------+-------+---------------+--------------+---------+------+------+-----------------------+
1 row in set (0.00 sec)
```

Här ser vi att det gick bra igen, indexet av typen `range` lyckas minimera antalet rader till 1 rad. Det är bra gjort.

Vi ser att index verkligen kan hjälpa frågeoptimeraren att ta bra beslut.



Visa och ta bort index {#drop}
------------------------------

Vi tittade på detta tidigare, men låt oss se nu igen när alla index är på plats.

Du kan visa alla index som finns på en tabell med `SHOW INDEX`. Då kan du även se vilket namn ett index har.

```sql
mysql> SHOW INDEX FROM course;
+--------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table  | Non_unique | Key_name     | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+--------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| course |          0 | PRIMARY      |            1 | code        | A         |           9 |     NULL | NULL   |      | BTREE      |         |               |
| course |          0 | nick_unique  |            1 | nick        | A         |           9 |     NULL | NULL   | YES  | BTREE      |         |               |
| course |          1 | index_name   |            1 | name        | A         |           9 |     NULL | NULL   | YES  | BTREE      |         |               |
| course |          1 | index_points |            1 | points      | A         |           4 |     NULL | NULL   | YES  | BTREE      |         |               |
| course |          1 | full_name    |            1 | name        | NULL      |           9 |     NULL | NULL   | YES  | FULLTEXT   |         |               |
+--------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
5 rows in set (0.00 sec)
```

Vill du ta bort ett index så går det bra att droppa det via dess namn.

```text
mysql> DROP INDEX full_name ON course;
```

När man väl går in och tittar mer noggrant på tabellernas struktur så vill man gärna se mer och mer detaljer för att förstå vad som händer.

Vill du ha en enkel översikt över en tabells olika index så kan du också använda EXPLAIN.

```sql
mysql> EXPLAIN course;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| code   | char(6)      | NO   | PRI |         |       |
| nick   | char(12)     | YES  | UNI | NULL    |       |
| points | decimal(3,1) | YES  | MUL | NULL    |       |
| name   | varchar(60)  | YES  | MUL | NULL    |       |
+--------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)
```

Nu börjar vi få koll på hur vi kan hantera index.



Visa CREATE TABLE {#createtable}
------------------------------

Vi har nu lagt till ett antal nycklar och index till tabellen och det hade varit trevligt att se SQL-koden för att göra `CREATE TABLE course`.

Vi löser detta med kommandot `SHOW CREATE TABLE course;`.

```sql
mysql> SHOW CREATE TABLE course\G
*************************** 1. row ***************************
       Table: course
Create Table: CREATE TABLE `course` (
  `code` char(6) NOT NULL DEFAULT '',
  `nick` char(12) DEFAULT NULL,
  `points` decimal(3,1) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `nick_unique` (`nick`),
  KEY `index_points` (`points`),
  KEY `index_name` (`name`),
  FULLTEXT KEY `full_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
1 row in set (0.00 sec)
```

Resultatet vi får fram kan användas för att uppdatera din SQL som skapar tabellen. Det kan se ut så här.

```sql
CREATE TABLE `course` (
    `code` char(6) NOT NULL DEFAULT '',
    `nick` char(12) DEFAULT NULL,
    `points` decimal(3,1) DEFAULT NULL,
    `name` varchar(60) DEFAULT NULL,

    PRIMARY KEY (`code`),
    UNIQUE KEY `nick_unique` (`nick`),
    KEY `index_name` (`name`),
    KEY `index_points` (`points`),
    FULLTEXT KEY `full_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 
```

Där har vi resultatet av hela övningen, en tabell med primärnyckel, en unique kolumn, ett par index varav ett är fulltext.

Det är alltså på detta viset som vi bör skapa våra tabeller från början.

Dock, innan man väljer index så bör man tänka igenom vilka frågor som kommer att ske mot databasen, det underlättar att se vilka kolumner som behöver indexeras.



Index och främmande nycklar {#foreign}
------------------------------

Det vi behöver veta är att en FOREIGN KEY inte är ett index, det är ett constraint, ett villkor som databasen lovar att upprätthålla.

Däremot försöker MySQL att skapa ett index för varje FOREIGN KEY som vi lägger till. MySQL har bestämt sig för att vi troligen kommer vilja joina tabeller på en främmande nyckel och därför väljer den att automatiskt försöka lägga till ett matchande index.

Detta kan dock skifta mellan versioner och databashanterare, så räkna inte med att dina främmande nycklar alltid blir ett index per automatik.

Principen är att en join behöver göras på en kolumn som har ett index, annars kan man få en full table scan på sin join och det vill man undvika.

Minns att kontrollera vilka index du har via SHOW INDEX, SHOW CREATE TABLE och använd EXPLAIN på både tabeller och frågor för att ha koll på att det ser bra ut. Då kommer du långt.


<!--
Låt oss skapa en tabell `Program` som visar de program som finns och en kopplingstabell `ProgramPlan` som länkar ett program till dess kurser.

I ditt kursrepo finns en SQL-fil `example/sql/index_fk.sql` som skapar tabellerna som behövs.

```bash
$ mysql -uuser -ppass anyDatabase < index_fk.sql
```

-->



Storage Engine MEMORY {#memory}
------------------------------

Valet av storage engine (lagringsmotor) kan påverka prestandan. Den vanligaste lagringsmotorn är numer InnoDB som har ersatt MyISAM. De olika lagringsmotorerna har olika karaktäristik som gör att de passar bättre och sämre under olika förhållanden. Man bör således bekanta sig med deras för- och nackdelar och välja noga då det kan påverka prestanda liksom andra aspekter.

Ibland kan man dra nytta av att lagra tabeller i minnet, till det finns lagringsmotorn MEMORY. Har man möjligheten att samla en viss datamängd som man avser ställa många frågor mot, så kan det vara gynnsamt att först samla datamängden i en MEMORY-tabell och därefter ställa frågorna mot den.

Val av storage engine kan alltså vara en viktig faktor.



Logga långsamma frågor {#logga}
------------------------------

När man väl kör en databas i drift så kan man be den att logga långsamma och potentiellt problematiska frågor till. Det är ett sätt att jobba med det man har och finslipa efterhand som man blir uppmärksam på problemen.

En databas är ett levande ting och beteer sig olika över tiden, så det är bra att ha koll på denna möjligheten.

Man kan också sätta på loggning i en session man jobbar med, man kan utföra ett antal frågor och sedan visa hur lång tid de tog och hur mycker resurser de använde. Detta styr man med [`SHOW PROFILE`](https://dev.mysql.com/doc/refman/8.0/en/show-profile.html).

Här är ett exempel i ett flöde där jag sätter på profileringen, ställer ett par frågor och därefter visar status för de frågor som gjorts.

Först sätter vi på loggning för profiliering.

```sql
mysql> SET profiling = 1;
Query OK, 0 rows affected, 1 warning (0.00 sec)
```

Vi ställer en enkel fråga.

```sql
mysql> SELECT * FROM course WHERE nick = 'dbjs';
+--------+------+--------+---------------------------------+
| code   | nick | points | name                            |
+--------+------+--------+---------------------------------+
| PA1444 | dbjs |   10.0 | Webbprogrammering och databaser |
+--------+------+--------+---------------------------------+
1 row in set (0.00 sec)
```

Vi ställer ytterligare en enkel fråga.


```sql
mysql> SELECT * FROM course WHERE name LIKE 'Webb%';
+--------+---------+--------+---------------------------------------+
| code   | nick    | points | name                                  |
+--------+---------+--------+---------------------------------------+
| DV1546 | webapp  |    7.5 | Webbapplikationer för mobila enheter  |
| PA1444 | dbjs    |   10.0 | Webbprogrammering och databaser       |
| PA1439 | htmlphp |    7.5 | Webbteknologier                       |
+--------+---------+--------+---------------------------------------+
3 rows in set (0.00 sec)
```

Vi ställer en fråga som är aningen mer komplex.

```sql
mysql> SELECT name, MATCH(name) AGAINST ('Program* web*' IN BOOLEAN MODE) AS score FROM course ORDER BY score DESC;
+-------------------------------------------+----------------------+
| name                                      | score                |
+-------------------------------------------+----------------------+
| Programmera webbtjänster i Linux          |   0.1550406515598297 |
| Programmering och Problemlösning med Pyt  |  0.12403252720832825 |
| Programmering med JavaScript              |  0.12403252720832825 |
| Objektorienterad design och programmerin  |  0.12403252720832825 |
| Spelteknik för webben                     | 0.031008131802082062 |
| Webbapplikationer för mobila enheter      | 0.031008131802082062 |
| Teknisk webbdesign och användbarhet       | 0.031008131802082062 |
| Webbteknologier                           | 0.031008131802082062 |
| Webbprogrammering och databaser           | 0.031008131802082062 |
+-------------------------------------------+----------------------+
9 rows in set (0.00 sec)
```

Vi kan nu titta på resultatet och jämföra exekveringshastigheten för de olika frågorna. 

```sql
mysql> SHOW PROFILES;
+----------+------------+-------------------------------------------------------------------------------------------------------------+
| Query_ID | Duration   | Query                                                                                                       |
+----------+------------+-------------------------------------------------------------------------------------------------------------+
|        1 | 0.00014100 | SELECT * FROM course WHERE nick = 'dbjs'                                                                    |
|        2 | 0.00016350 | SELECT * FROM course WHERE name LIKE 'Webb%'                                                                |
|        3 | 0.00028875 | SELECT name, MATCH(name) AGAINST ('Program* web*' IN BOOLEAN MODE) AS score FROM course ORDER BY score DESC |
+----------+------------+-------------------------------------------------------------------------------------------------------------+
5 rows in set, 1 warning (0.00 sec)
```

Här ser vi att de två inledande frågorna är dubbelt så snabba som fritextsökningen.

Vill man fortsätta att studera så kan man se vilken del i fritextfrågan som var mest krävande. Det ser ut som initialiseringen av FULLTEXT tog längst tid, jämfört med övriga delar.

```sql
mysql> SHOW PROFILE FOR QUERY 3;
+-------------------------+----------+
| Status                  | Duration |
+-------------------------+----------+
| starting                | 0.000042 |
| checking permissions    | 0.000004 |
| Opening tables          | 0.000010 |
| init                    | 0.000013 |
| System lock             | 0.000004 |
| optimizing              | 0.000004 |
| statistics              | 0.000008 |
| preparing               | 0.000004 |
| FULLTEXT initialization | 0.000120 |
| Sorting result          | 0.000003 |
| executing               | 0.000001 |
| Sending data            | 0.000004 |
| Creating sort index     | 0.000052 |
| end                     | 0.000003 |
| query end               | 0.000003 |
| closing tables          | 0.000004 |
| freeing items           | 0.000007 |
| cleaning up             | 0.000005 |
+-------------------------+----------+
18 rows in set, 1 warning (0.00 sec)
```

I utskriften från `SHOW PROFILES` kan man utläsa vilken fråga som tar mest tid, och analyserar man en sådan fråga vidare med `SHOW PROFILE` så kan man vidare analysera vilka delar i frågan som är mest krävande.

Med SHOW PROFILE kan man också se vilka delar av frågan som kräver mest resurser i form av CPU eller minne.

Det kan vara intressant att finna problemfyllda frågor via SHOW PROFILES, för att sedan vidare undersöka dem med EXPLAIN.



Läs mer {#lasmer}
------------------------------

Om du har fått blodad tand på optimering så kan jag rekommendera följande ingångar in i manualen.

* [Optimizing SQL Statements](https://dev.mysql.com/doc/refman/8.0/en/statement-optimization.html)
* [Optimization and Indexes](https://dev.mysql.com/doc/refman/8.0/en/optimization-indexes.html)
* [Understanding the Query Execution Plan](https://dev.mysql.com/doc/refman/8.0/en/execution-plan-information.html)

Läs på och samla på dig små tips och trix till hur sakerna fungerar.

<!--

Bästa sättet att skapa nycklar/index?

* Använd NOT NULL på index.
* UNSIGNED/SIGNED
* Liten datatyp

ANALYZE TABLE

Partition your tables.
-->



Avslutningsvis {#avslutning}
------------------------------

Du har nu fått en allmän genomgång av aspekter som kan påverka prestandan av din databas och fokus har varit på index. Vill du läsa mer så är manualen för MySQL och den delen som handlar om Optimization, en god punkt att fortsätta.

<!--
Artikeln har en [egen forumtråd](t/6375) där du kan ställa frågor eller bidra med tips och trix.
-->
