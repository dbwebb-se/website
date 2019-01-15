---
author: mos
category:
    - kurs databas
    - labbmiljo
    - databas
    - mysql
    - mariadb
    - mysql workbench
revision:
    "2019-01-10": "(A, mos) Ersätter tidigare variant av artikel, installationen flyttad till egna dokument."
...
Introduktion till databasen MySQL/MariaDB, dess klienter och SQL
==================================

[FIGURE src=image/snapvt19/client-mysql-copy.png?w=c5&a=0,70,60,0&cf class="right"]

Databasen MySQL/MariaDB är en av de mer populära databaserna när man börjar lära sig om databaser. Vi skall titta på några av de vanligaste klienterna man använder för att koppla sig mot databasen.

Samtidigt tittar vi på grunderna i hur man skapar sin första databasanvändare och hur man skapar en databas med tabell och innehåll via SQL samt sparar all kod i filer som går att exekvera i olika klienter.

Det blir en snabb överblick av hur saker hänger ihop, för att ge dig ett övergripande sammanhang av databasen MySQL/MariaDB, dess klienter och grunden i SQL via ett större exempel.

<!--more-->



Förutsättning {#pre}
------------------------------

Du har gjort en installation av MySQL/MariaDB och du har tillgång till klienter i terminalen och MySQL Workbench. Du har troligen jobbat igenom installationen som beskrivs i "[MySQL / MariaDB och MySQL Workbench](kurser/databas-v1/labbmiljo/mysql-med-workbench)".

Du kan starta klienterna och koppla dem mot en databas.

Du har grundläggande kännedom om SQL.



Databasen MySQL versus MariaDB {#mysql}
------------------------------

Låt oss ta kort om bakgrunden kring databasen MySQL och databasen MariaDB.

Databasen MySQL är öppen källkod och finns att ladda ned och installera till ett flertal operativsystem. Det finns numer en variant av databasen som heter MariaDB. Både MySQL och MariaDB fungerar i stort på samma sett och kan ersätta varandra.

MySQL ägdes från början av ett svenskt företag som köptes upp och numer ägs den av databasföretaget Oracle. Många entusiaster i opensource-världen var inte riktigt nöjda med att MySQL numer ägs av ett kommersiellt företag såsom Oracle och det har gjort att ett ökat stöd för alternativa databaser har växt fram, bland annat rena kloner av MySQL. MariaDB är en sådan klon och kan vara ett alternativ för en rätttroende opensource:are. De klienter som visas i denna artikel fungerar mot både MySQL och MariaDB.



Server, klient och DMBS {#dbms}
------------------------------

När man pratar om databasen så delar man upp den i server och klient. Servern kan köras lokalt på samma maskin man sitter, eller på en annan maskin någonstans ute på nätet. Klienten kan man köra på godtycklig maskin och koppla sig till godtycklig databasserver, förutsatt att man har tillgång till servern och kan logga in på den med en användare och ett lösenord.

DBMS, Database Management System, är benämningen på den samling av kod, servrar och tjänster som gör det möjligt att jobba med databasen. Vi kan säga att programvaran MySQL Community Server är ett DBMS för databasen mysql.

Via klienterna kan vi koppla oss mot ett DBMS. Vissa klienter är hårt kopplade mot ett specifikt DBMS medans andra klienter kan koppla sig mot flera DBMS.



SQL {#sql}
------------------------------

SQL (Structured Query Language) är ett standardiserat frågespråk för relationsdatabaser. Det finns olika standarder och de benämns SQL-87, SQL-92, SQL:1999 och så vidare.

Med hjälp av SQL skapar vi databasens schema (dess tabeller), vi skapar innehåll i tabellerna och vi skapar frågor mot databasen för att visa dess innehåll i rapporter.

Varje leverantör av ett DBMS har ofta specifika tillägg till SQL. Det finns alltså standardiserat SQL och en flora av extra tillägg. Vad som är specifikt för ett DBMS och vad som är standard SQL är något som databasprogrammeraren behöver ha koll på.

Det som är standardiserat SQL är ofta relaterat till grundkommandon som CREATE, DROP, ALTER samt INSERT, UPDATE, DELETE och SELECT.



Spara SQL-kod i fil {#fil}
------------------------------

När man jobbar mot databasen med SQL-kod så bör man spara undan all kod i en fil och döpa med filändelsen `.sql`. Det ger en möjlighet att lagra undan och spara koden man gjort och det ger i sin tur möjligheten att snabbt återskapa en struktur och innehåll i databasen.

I en fil kan man också kommentera vad man gör, det kan göra det enklare att minnas vad man gjort, när man tittar tillbaka på koden. Kommentarer inleds med två bindesstreck `--`.

Vissa SQL-kommandon skapar användare och rättigheter för att jobba i databasen. Detta är administrativa åtgärder som måste köras av användare som har priviligier, till exempel root-användare.

Andra SQL-kommandon skapar databasens struktur med tabeller. Detta kallas också databasens schema. Ett samlingsnamn för dessa operationer är DDL, Data Definition Language. Dessa SQL-kommanandon är främst CREATE, ALTER och DROP.

De vanligaste SQL-kommandona kallas DML, Data Manipulation Language. De handlar om att fylla databasens struktur med innehåll och söka information och visa upp rapporter. Dessa SQL-kommandon är till exempel SELECT, INSERT, UPDATE och DELETE.

Jag väljer att skapa olika filer för dessa (`setup.sql`, `ddl.sql`, `dml.sql`), det blir enklare att separera koden och hålla ordning på vad som är vad.

För att få ett exempel som vi kan jobba med i olika klienter så skapar jag en testanvändare, en testdatabas och en testtabell som jag fyller med innehåll. 

Här följer SQL-koden, separerad i filer. Du hittar alla filerna i kursrepot för databas-kursen, under [`example/intro`](https://github.com/dbwebb-se/databas/tree/master/example/intro).



### Skapa användare och databas {#setup}

Jag skapar en användare, en databas och ger användaren fulla rättigheter mot denna databas. Jag lägger allt i filen `01_setup.sql`. Siffran är mest till för att visa vilken ordning filerna kan köras i.

```sql
--
-- Setup a user, create a database and grant access for the user
-- to the database.
--

-- Create the user 'user' with a backward compatible password algorithm
-- and the password 'pass'
CREATE USER IF NOT EXISTS 'user'@'%'
    IDENTIFIED WITH mysql_native_password
    BY 'pass'
;

-- Grant the user all privilegies on the database.
GRANT ALL PRIVILEGES
    ON dbwebb.*
    TO 'user'@'%'
;

-- Create the database 'dbwebb', but only if it does not exists.
CREATE DATABASE IF NOT EXISTS dbwebb;
```

Om du kör MariaDB kan du se varianter av hur du kan skapa användaren, se de bortkommenterade sektionerna i filen [`example/intro/01_setup.sql`](https://github.com/dbwebb-se/databas/blob/master/example/intro/01_setup.sql).



### Skapa databasens schema (DDL) {#ddl}

I filen `02_ddl.sql` skapar jag tre tabeller, det handlar om studenter som går kurser och får betyg på kurserna. I koden ser du exempel på hur tabeller skapas, hur kolumner anges med sin datatyp och hur man anger primärnyckel och främmande nyckel.

Primärnyckeln är det som gör en rad unik i tabellen. Främmande nyckel är det som kopplar samman två tabeller.

Om man skulle beskriva databasen och tabellerna i ren text, så skulle det kunna se ut så här.

> Studenter deltar i kurser. När studenter deltar i en kurs kan de få betyg i kursen.

När man jobbar med modellering av databaser så är denna typen av text en viktig utgångspunkt. I vårt exempel har ovan text nu representerats i följande SQL-kod.

```sql
--
-- Create the database schema.
--
USE dbwebb;

--
-- Start by dropping all tables, order may matter.
--
DROP TABLE IF EXISTS student2course;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS course;

--
-- Table for student.
--
CREATE TABLE student
(
    acronym CHAR(6) NOT NULL,
    name VARCHAR(40) NOT NULL,

    PRIMARY KEY (acronym)
);

--
-- Table for course.
--
CREATE TABLE course
(
    code CHAR(6) NOT NULL,
    name VARCHAR(40) NOT NULL,
    nick CHAR(10) NOT NULL,
    points DECIMAL(2,1),

    PRIMARY KEY (code)
);

--
-- Table for student2course, connecting students taking a course
-- and eventually getting a grade.
--
CREATE TABLE student2course
(
    acronym CHAR(6) NOT NULL,
    code CHAR(6) NOT NULL,
    grade CHAR(1) NULL,

    FOREIGN KEY (acronym) REFERENCES student(acronym),
    FOREIGN KEY (code) REFERENCES course(code),

    PRIMARY KEY (acronym, code)
);
```

Tanken är att denna filen skall kunna exekveras, om och om igen, förutsatt att `01_setup.sql` är körd. Det kan då kräva att det finns en viss ordning i filen så att eventuella befintliga tabeller raderas först (DROP), i ordning med tanke på deras eventuella kopplingar till andra tabeller. På samma sätt måste tabellerna skapas (CREATE) i en viss ordning, om det finns kopplingar mellan tabellerna.

De tabeller som har kopplingar till andra, de måste raderas först. De som inte har kopplingar kan raderas sist.

De tabeller som inte har kopplingar till andra, de skapas först. De tabeller som är kopplade till andra (de har en FOREIGN KEY), de måste skapas när de andra tabellerna finns, de tabeller som den är beroende av.

Det är viktigt med ordning och reda i sina SQL-filer. Det kan underlätta enormt om det finns en ordning där filerna kan exekveras för att återställa en databas. Speciellt när man jobbar med utveckling av databasen.

När man har en aktiv databas kan man skapa en backup av databasen som är en stor fil med SQL-kommandon som utför dessa setup, ddl och dml för att återskapa databasen. Den backup-filen ser ut ungefär som de filerna som här visas.



### Skapa innehåll i databasen (DML) {#dml}

Då lägger vi till innehåll i tabellerna enligt följande.

| Student  | htmlphp | design  | databas | oophp   |
|----------|:-------:|:-------:|:-------:|:-------:|
| Mikael Roos (mos) | F | - | F | |
| Kenneth Lewenhagen (lew) | A | | E | |
| Andreas Arnesson (zeldah) | B | D | | |
| Emil Folino (efo) | | C | C | |
| John/Jane Doe (doe) | | | | |

Tabellen kan utläsas som att mos har deltagit i tre kurser och fått betyget F i två av kurserna och ännu inte betyg i en av kurserna. Studenten doe har inte deltagit i någon av kurserna och kursen oophp har ännu inga deltagare.

Vi lägger in datat i databasen med följande SQL-kod som vi placerar i filen `03_dml.sql`.

```sql
--
-- Insert content into the database.
--
USE dbwebb;

--
-- Delete from all tables.
--
DELETE FROM student2course; 
DELETE FROM student; 
DELETE FROM course; 

--
-- Add some students.
--
INSERT INTO student
    (acronym, name)
VALUES
    ('mos', 'Mikael Roos'),
    ('lew', 'Kenneth Lewenhagen'),
    ('zeldah', 'Andreas Arnesson'),
    ('efo', 'Emil Folino'),
    ('doe', 'John/Jane Doe')
;

--
-- Add some courses.
--
INSERT INTO course 
    (code, name, nick, points)
VALUES
    ('PA1439', 'Webbteknologier', 'htmlphp', 7.5),
    ('PA1436', 'Teknisk webbdesign', 'design', 7.5),
    ('DV1606', 'Databasteknologier', 'databas', 7.5),
    ('DV1608', 'Objektorienterade webbteknologier', 'oophp', 7.5)
;

--
-- Adding students to courses, with grades if there exists such.
--
INSERT INTO student2course
    (acronym, code, grade)
VALUES
    ('mos', 'PA1439', 'F'),
    ('mos', 'PA1436', NULL),
    ('mos', 'DV1606', 'F'),
    ('lew', 'PA1439', 'A'),
    ('lew', 'DV1606', 'E'),
    ('zeldah', 'PA1439', 'B'),
    ('zeldah', 'PA1436', 'D'),
    ('efo', 'PA1436', 'C'),
    ('efo', 'DV1606', 'C')
;
```

Jag väljer att radera innehållet i tabellerna, med DELETE, innan jag lägger till innehåll. Det är för att jag skall kunna köra denna filen (exekvera alla kommandon i filen) om och om igen, utan att vara beroende av någon annan fil. Ja, jag är ju fortfarande beroende av att filerna 01 och 02 har körts så att databasen finns och databasens schema är skapat.

Även här är ordningen viktig, jag måste först radera de tabeller som är kopplade till andra tabeller. Jag kan inte radera en tabell om dess innehåll är refererat via en FOREIGN KEY i en annan tabell. Därför måste jag först göra DELETE på innehållet i tabellen student2course.



### Rapporter från databasen {#rapporter}

När databasen är skapad och tabellerna har sitt innehåll så kan jag ställa frågor mot databasen och skapa rapporter av dess innehåll. För att visa hur det kan ske så skapar jag ytterligare en fil `04_report.sql` som visar delar av innehållet från databasen.

```sql
--
-- Samples to show reports from the database.
--
USE dbwebb;

--
-- Show all tables in the database.
--
SHOW TABLES;

--
-- Show content of tables.
--
SELECT * FROM student;
SELECT * FROM course;
SELECT * FROM student2course;

--
-- A report joining all tables.
--
SELECT
    CONCAT(s.name, ' (', s.acronym, ')') AS "student",
    CONCAT(c.name, ' (', c.nick, ')') AS "course",
    sc.grade
FROM student AS s
    INNER JOIN student2course AS sc
        ON s.acronym = sc.acronym
    INNER JOIN course AS c
        ON c.code = sc.code
ORDER BY s.name
;
```

Om jag kör sista rapporten, som slår ihop informationen från alla tre tabellerna i databasen, så kan det se ut så här i terminalklienten.

```text
mysql> SELECT
    ->     CONCAT(s.name, ' (', s.acronym, ')') AS "student",
    ->     CONCAT(c.name, ' (', c.nick, ')') AS "course",
    ->     sc.grade
    -> FROM student AS s
    ->     INNER JOIN student2course AS sc
    ->         ON s.acronym = sc.acronym
    ->     INNER JOIN course AS c
    ->         ON c.code = sc.code
    -> ORDER BY s.name
    -> ;
+---------------------------+------------------------------+-------+
| student                   | course                       | grade |
+---------------------------+------------------------------+-------+
| Andreas Arnesson (zeldah) | Teknisk webbdesign (design)  | D     |
| Andreas Arnesson (zeldah) | Webbteknologier (htmlphp)    | B     |
| Emil Folino (efo)         | Databasteknologier (databas) | C     |
| Emil Folino (efo)         | Teknisk webbdesign (design)  | C     |
| Kenneth Lewenhagen (lew)  | Databasteknologier (databas) | E     |
| Kenneth Lewenhagen (lew)  | Webbteknologier (htmlphp)    | A     |
| Mikael Roos (mos)         | Databasteknologier (databas) | F     |
| Mikael Roos (mos)         | Teknisk webbdesign (design)  | NULL  |
| Mikael Roos (mos)         | Webbteknologier (htmlphp)    | F     |
+---------------------------+------------------------------+-------+
9 rows in set (0.00 sec)
```

Nu har vi en fungerande databas. Låt då se hur det kan se ut när vi jobbar med den i olika klienter.



Koppla programmeringsspråk till databasen {#prog}
------------------------------

Låt oss nämna något om kopplingen mellan databasen och ett vanligt programmeringsspråk. Ofta bygger man egna applikationer i något godtyckligt programmeringsspråk som kopplar sig till databasen, det blir en applikation, eller klient.

Programmeringsspråk som PHP, Python, JavaScript, C++, Java och så vidare har alla möjligheter att koppla sig mot olika databaser. De använder sig av olika interface och libb för att göra kopplingen. Vissa interface tillhandahålls av DBMS-leverantören och andra sköts fristående.

På det sättet kan man göra sin egen klient, eller applikation, som kopplar sig mot en databas.



MySQL/MariaDB klienter {#klienter}
------------------------------

Det finns tre olika typer av klienter, om vi gör en grov indelning. Det är webbaserade klienter som körs via webbläsare, desktopklienter som har ett grafiskt användargränssnitt och körs i ett fönstersystem lokalt hos användaren och det finns terminalklienter som är textbaserade och körs i terminalen.

Oavsett val av klient som kan man normalt utföra samma saker mot databasen. Att välja klient handlar mer om vilket arbetssätt man känner sig hemma med.

I vissa fall kan det vara så att man inte har möjlighet att använda olika klienter utan man måste förhålla sig till någon som erbjuds. Därför bör man bekanta sig med de olika klienterna och lära känna dess för- och nackdelar.

I resten av denna artikel skall vi titta på två klienter.

* Terminalklienten mysql
* Desktopklienten MySQL Workbench

Vi kommer även nämna en webbklient.

* Webbklienten PHPMyAdmin



Förbered för att jobba i klienterna {#forbered}
------------------------------

Jag tänker jobba i kursrepot för kursen databas och de SQL-filer som visats ovan kan jag finna i katalogen [`example/intro`](https://github.com/dbwebb-se/databas/tree/master/example/intro).

Jag öppnar terminalen, går till mitt kursrepo och börjar med att kopiera de filerna till katalogen `me/kmom01/klient`. Sedan flyttar jag till den katalogen och fortsätter jobba i där.

```text
# Stå i rooten av kursrepot
rsync -av example/intro/ me/kmom01/klient/
cd me/kmom01/klient/
ls -l
```

Då börjar vi med klienterna.



Terminalklienten, MySQL CLU (command line utility) {#clu}
------------------------------

Den första klienten vi bekantar oss med är en textbaserad klient, ett "command line interface (CLI)" eller "command line utility (CLU)". Låt oss kalla den för terminalklienten och den startas med kommandot `mysql` i en terminal.

Normalt anger man vilken användare man vill koppla upp sig med, samt att man vill ange lösenordet för den användaren. Man kan även ange vilken host man vill koppla upp sig mot och eventuellt portnummer.

Här är ett par varianter av hur du kan starta programmet med olika optioner.

```text
mysql -uroot -p
mysql -uuser -ppass -h127.0.0.1
mysql -uuser -ppass -h127.0.0.1 -P13306
mysql --user=user --password=pass --host=127.0.0.1 --port=13306 dbwebb
```

Optionen `-h` eller `--host=` anger en ipadress eller hostnamn där databasservern finns. Ipadressen `127.0.0.1` är en referens till din lokala maskin.

Standardporten för MySQl/MariaDB är 3306, men man kan välja att koppla sig till en annan port via optionen `-P` eller `--port=`.



### Initiera databasen (setup.sql) {#setup}

Det första vi vill göra är att skapa databasen och dess användare, det handlar om att köra kommandona i filen `01_setup.sql`. För att göra detta måste vi vara en root-användare eller en annan användare som har rättigheter att skapa databaser och nya användare. Du får välja den root-användare som du har tillgång till.

Vi kan köra alla kommandon i filen med följande konstruktion. Det handlar om att köra kommandot och ta all dess input från en fil.

```text
mysql -uroot -p < 01_setup.sql
```

Om kommandot fungerade så kan du nu öppna terminalklienten och logga in med user:pass.

```text
mysql -uuser -ppass
```

Det kan se ut så här när du är uppkopplad. I mitt exempel använde jag även `-h` och `-P` för att koppla mig mot min databasserver.

[FIGURE src=image/snapvt19/client-mysql-connected.png?w=w3 caption="Du är nu uppkopplad med terminalklienten mysql."]



### Skapa tabellerna (ddl.sql) {#ddl}

Vi kan nu skapa tabellerna. De SQL-kommandon vi behöver ligger i filen `02_ddl.sql` och vi kan köra alla kommandon direkt från den filen.

Vi skriver följande.

```text
mysql> source 02_ddl.sql
```

Vi kan dubbelkolla att tabellerna finns på plats.

```text
mysql> SHOW TABLES;
```

Det kan se ut så här.

[FIGURE src=image/snapvt19/client-mysql-ddl.png?w=w3 caption="Nu är tabellerna skapade och på plats."]



### Skapa innehåll i tabellerna (dml.sql) {#dml}

Då gör vi på samma sätt med filen som innehåller SQL för att fylla tabellerna med innehåll, filen `03_dml.sql`.

Vi skriver följande.

```text
mysql> source 03_dml.sql
```

Vi kan dubbelkolla att det finns innehåll i tabellerna.

```text
mysql> SELECT * FROM student;
mysql> SELECT * FROM course;
mysql> SELECT * FROM student2course;
```

Det kan se ut så här.

[FIGURE src=image/snapvt19/client-mysql-dml.png?w=w3 caption="Nu finns det innehåll i tabellerna."]



### Jobba med databasen (report.sql) {#report}

Nu kan vi jobba med databasen och visa dess innehåll eller plocka fram rapporter. Vi har filen `04_report.sql` som plockar fram viss information ur databasen. Vi kan köra den, bara för att se hur det kan fungera.

Vi skriver följande.

```text
mysql> source 04_report.sql
```

Svaret på rapporten kommer fram.

[FIGURE src=image/snapvt19/client-mysql-report.png?w=w3 caption="Nu kan vi jobba med databasen."]

Om du likt mig, får många utskrifter, så kan du skrolla upp i terminalen för att se resterande information. Eller så väljer du att skapa en fil för varje rapport.

Man kan också kopiera en SQL-sats och pasta in den i verktyget. Terminalklienten är ju lite svår att skriva långa SQL-kommandon i, så man vill troligen ha dem sparade i en annan textfil.

Så här kan det se ut när man kopierar in en större SQL-sats och kör i terminalen.

[FIGURE src=image/snapvt19/client-mysql-copy.png?w=w3 caption="Ha din SQL-kod i en textfil och kopiera in i terminalklienten vid behov."]



Desktopklienten, MySQL Workbench {#wb}
------------------------------

Desktopklienten MySQL Workbench låter oss jobba i en fönsterbaserad grafisk applikation, med de fördelar som det innebär.

För att förbereda oss så skapar vi, om den inte redan finns, en koppling mot databasen med dess root-användare och en koppling som har användaren user:pass och kopplar sig direkt mot databasen "dbwebb".

Först skapar jag en koppling för root-användaren.

[FIGURE src=image/snapvt19/wb-connection-root.png caption="Min root-användare kopplar sig mot databasen."]

Sedan skapar jag en koppling för användaren user:pass och använder databasen dbwebb som default databas/schema.

[FIGURE src=image/snapvt19/wb-connection-user.png caption="Min user-användare kopplar sig direkt till databasen dbwebb."]

Då kan vi börja jobba. Vi gör samma sak som vi gjorde i terminalklienten, det innebär att vi skapar om hela databasen på nytt.



### Initiera databasen (setup.sql) {#setup}

Börja med att använda uppkopplingen för root-användaren. Vi skall initiera databasen via filen `01_setup.sql`.

Via menyvalet "File -> Open SQL Script..." kan du öppna en ny flik och öppna filen i.

[FIGURE src=image/snapvt19/wb-setup.png?w=w3 caption="Nu är filen 01_setup.sql öppnad i klienten."]

Via menyvalet "Query -> Execute All or Selection..." kan du nu exekvera samtliga kommandon i filen.

Längst ned kommer en del utskrifter från varje kommando. Om något går fel så syns det där.

[FIGURE src=image/snapvt19/wb-setup-execute.png?w=w3 caption="Status på körningen visas längst ned i fönstret."]

Varningar visas och det är bra att vara uppmärksam på dem. Ibland kan man ignorera dem och ibland är de allvarliga och måste hanteras.



### Skapa tabellerna (ddl.sql) {#ddl}

Nu kan vi öppna kopplingen för user:pass och öppna filen `02_ddl.sql` som hjälper oss att skapa databasens schema. Man kan ha flera kopplingar uppe samtidigt, så det är bara att öppna en ny koppling.

När filen är öppnad så är det bara att exekvera alla kommandon i filen och förhoppningsvis blir det grönt längst ned i status-fältet.

[FIGURE src=image/snapvt19/wb-ddl-execute.png?w=w3 caption="Nu är alla tabeller skapade."]

Vi kan öppna en ny flik med `ctrl-t` och därefter kan vi skriva in ett kommando för att kontrollera att tabellerna är skapade.

[FIGURE src=image/snapvt19/wb-ddl-check.png?w=w3 caption="I en ny flik kan vi fritt skriva SQL-kommandon för att kommunicera med databasen."]



### Skapa innehåll i tabellerna (dml.sql) {#dml}

Vi fortsätter i kopplingen för user:pass och öppnar en ny flik med filen `03_dml.sql`. Vi exekverar alla kommandon.

Vi kan öppna ytterligare en flik med `ctrl-t` och skriva in några SELECT-satser för att dubbelkolla att det finns innehåll i tabellerna.

```text
SELECT * FROM student;
SELECT * FROM course;
SELECT * FROM student2course;
```

Man kan ställa markören på en rad och enbart exekvera den raden med "Query -> Execute Current Statement", eller så kan man exekvera samtliga rader som tidigare.

Notera att det finns snabbtangenter för respektive kommando.

* "Query -> Execute Current Statement": `ctrl return`
* "Query -> Execute (All or Selection)": `shift ctrl return`

På macOS används cmd/command-tangenten `⌘` istället för `ctrl`-tangenten.

"Selection" innebär att du kan markera en viss sektion av SQL-kommandona och enbart köra den markerade sektionen.

Det kan se ut så här.

[FIGURE src=image/snapvt19/wb-dml-check.png?w=w3 caption="Nu finns det innehåll i databasen."]

Att markera ett visst avsnitt är ofta hjälpfullt om det är ett antal SQL-kommandon som man vill utföra.



### Jobba med databasen (report.sql) {#report}

Det sista vi gör i Workbench är att öppna filen `04_report.sql` och exekverar samtliga kommandon i den.

Sedan markera vi endast en SQL-satsen som gör en JOIN och exekverar den via menyn eller tangentkombinationen.

Det kan se ut så här.

[FIGURE src=image/snapvt19/wb-report.png?w=w3 caption="Nu kan vi även köra delar av de SQL-kommandon som finns i en fil."]



Webbklienten PHPMyAdmin {#phpmyadmin}
------------------------------

Vi skall även nämna webbklienten PHPMyAdmin som är en webbaserad klient för MySQL/MariaDB. Det är en vanlig klient i webbsammanhang och många börjar sin databas-bana via denna klienten då klienten är enkel att använda och är vanlig i till exempel webbhotell.

Låt oss kort se hur klienten ser ut.

Man loggar in via webbläsaren.

[FIGURE src=image/snapvt19/phpmyadmin-login.png?w=w3 caption="Inloggning sker via webbläsaren, det är en webbaserad applikation, byggd i PHP."]

Därefter får man tillgång till alla delar i gränssnittet via webbläsaren. Det går i princip att utföra samma saker som vi nyss gjort med de andra klienterna.

[FIGURE src=image/snapvt19/phpmyadmin-home.png?w=w3 caption="Hemsidan i phpmyadmin."]

Klienten kommer ofta med när man installerar paket för webbutveckling likt XAMPP. Det är troligen en anledning till att det är en vanlig bekantskap för webbutvecklare. Det blir enkelt att komma åt databasen, som också distribueras via XAMPP, utan att behöva installera fler klienter eller behöva fundera på konfigurationer och att skapa användare.



Avslutningsvis {#avslutning}
------------------------------

Du har nu fått en översyn av olika klienter till MySQL/MariaDB och via en komplett databas som vi skapat med SQL-kommandon så har du fått en insyn i hur det är att jobba med databaser, med SQL, via olika klienter.

Frågor och kommentarer tar vi i forumet där det finns en [specifik tråd för MySQL och dess klienter](t/8179).
