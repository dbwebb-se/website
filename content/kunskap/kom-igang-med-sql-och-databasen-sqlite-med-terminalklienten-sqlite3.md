---
author: mos
category:
    - databas
    - sql
revision:
    "2022-09-19": "(E, mos) Utökad med bilder och UPDATE/DELETE."
    "2021-09-25": "(D, mos) Ny utgåva, genomgången, förkortad och använder terminalklienten sqlite3."
    "2018-09-24": "(C, mos) Ny utgåva, genomgången och bytte ut Firefox SQLite Manager mot DB Browser for SQLite."
    "2017-01-09": "(B, mos) Stödjer både webtec och dbjs."
    "2015-06-05": "(A, mos) Första utgåvan för webtec version 2 av kursen."
...
Kom igång med SQL och databasen SQLite med terminalklienten sqlite3
==================================

[FIGURE src=/image/sqlite20/sqlite-logo.gif class="right"]

En guide för att stegvis komma igång med databasen SQLite och SQL. Guiden hanterar grunderna i SQLite och SQL. Vi skapar en enkel databas i SQLite och använder SQL för att jobba mot databasen.

<!--more-->

Bästa sättet att gå igenom guiden är att genomföra varje övning på egen hand. Gör precis som jag gjort, fast på egen hand. Kopiera eller skriv om kodexemplen, det viktiga är att du återskapar koden i din egna miljö. Läsa är bra men ibland man måste göra det själv, "kan själv", för att lära sig.



Förutsättning {#pre}
--------------------------------------

Du har installerat kommandoradsklienten `sqlite3`.

Du har grundläggande kunskaper i SQLite och SQL.

Det förutsätts att du har tillgång till en kursmiljö som motsvarar kursen webtec. I artikeln refereras till kodexempel som finns med som en del i kursrepot webtec. Du hittar dessa filer under [`example/sqlite/course`](https://github.com/dbwebb-se/webtec/tree/main/example/sqlite/course).



Om SQLite {#om}
--------------------------------------

SQLite är ett programvarubibliotek i programspråket C som implementerar en filbaserad SQL-databas. SQLite är opensource. Enligt deras webbplats är SQLite är den mest spridda databasen i världen. Bekanta dig med informationen på [deras hemsida](http://www.sqlite.org/).

SQLite är filbaserad vilket innebär att hela databasen finns lagrad i en enda fil på disk. Vill man flytta databasen så räcker det att flytta filen, eller kopiera filen eller skicka hela filen via ett mail eller spara på ett usb-minne. Det behövs ingen särskild konfiguration av användare och lösenord. Enkelheten är en av fördelarna med en filbaserad databas.

SQLite stödjer de vanliga SQL-konstruktionerna. Ta en titt på vilka [SQL-konstruktioner som stöds i SQLite](http://www.sqlite.org/lang.html). Om du redan är bekant med SQL-språket så kommer du att känna igen dig, om inte så kommer vi till detta lite längre ned i guiden.

SQL står för "Structured Query Language" och är ett standardiserad sätt att ställa frågor till en relationsdatabas. Läs kort om [SQL på Wikipedia](http://sv.wikipedia.org/wiki/SQL).

Webbplatsen W3Schools har en enklare [SQL-guide](https://www.w3schools.com/sql/default.Asp) som kan vara bra att kika i för att lära sig grunderna i SQL.



Terminalklienten sqlite3 {#sqlite3}
--------------------------------------

Terminalklienten `sqlite3` är ett terminalbaserat program som låter dig koppla dig mot SQLite databaser.

Du kan se artikeln "[En kommandoradsklient för SQLite](labbmiljo/sqlite3)" som visar hur du installerar och kommer igång med `sqlite3`.



Skapa en ny databas {#createdb}
--------------------------------------

Börja med att öppna en ny databas och spara den i filen `course.sqlite`. Vi skall bygga en databas för att hålla koll på de kurser vi skall gå på högskolan.

```text
$ sqlite3 course.sqlite
SQLite version 3.24.0 2018-06-04 14:10:15
Enter ".help" for usage hints.
sqlite> 
```

[FIGURE src=image/webtec/sqlite/01-skapa-ny-databas.png?w=w3 caption="Då är vi redo att börja skapa databasen."]

Än så länge har det inte skapats en fil, vi måste först fylla på med en struktur för databasen, innan filen skapas.

Nästa steg är att skapa en tabell i din databas.



Skapa en ny tabell {#createtable}
--------------------------------------

Vi skapar en tabell för kurser. Tabellen döper vi till till "course" och vi placerar ett antal kolumner i tabellen.

Tanken är att vi sparar de kurserna vi skall gå samt detaljer om dem och status för hur det går för oss. I tabellen är det en kurs per rad och varje rad innehåller kolumner med detaljer om respektive kurs.

Kör vi följande kod i programmet `sqlite3` så skapas tabellen.

```text
--
-- CREATE TABLE
--
DROP TABLE IF EXISTS course;
CREATE TABLE course
(
    code TEXT,
    name TEXT NOT NULL,
    points REAL DEFAULT 7.5,
    term INTEGER,
    kmom INTEGER,
    done DATETIME,
    
    PRIMARY KEY (code)
);
```

De tre översta raderna är kommentarer, en kommentar inleds med `-- ` i SQL.

Varje kolumn har en datatyp som säger vilket typ av data som kolumnen lagrar. I databas-sammanhang är det viktigt att ange rätt typ från början. Vår typ av databaser, relationsdatabasen, jobbar med hård typning. Vill du lära dig mer om datatyperna så kan du läsa hur [SQLite stöder datatyperna NULL, INTEGER, REAL, TEXT och BLOB](https://www.sqlite.org/datatype3.html).

Jag väljer att göra kolumnen "code" till primärnyckel i tabellen. Det säger att det inte kan ligga flera rader i tabellen där "kursens kod" är densamma. Det får bara ligga en rad med en specifik kurskod i tabellen, kurskoden är alltså unik.

[FIGURE src=image/webtec/sqlite/02-skapa-tabell.png?w=w3 caption="Nu har vi skapat strukturen för en tabell, ännu finns inget innehåll i tabellen."]



Databasens schema {#schema}
--------------------------------------

När vi är klara så kan vi se en översikt av den struktur som finns i vår databas. Denna struktur kallas även databasens "schema". Schemat visar hur vi har tänkt oss att strukturera vår information i databasen.

Vi kan du kontrollera vilka tabeller som finns i databasens schema genom att skriva kommandot `.schema`.

```text
sqlite> .schema
CREATE TABLE course
(
    code TEXT,
    name TEXT NOT NULL,
    points REAL DEFAULT 7.5,
    term INTEGER,
    kmom INTEGER,
    done DATETIME,
    
    PRIMARY KEY (code)
);
```

Vill du veta vilka mer kommandon som finns i applikationen `sqlite3` så skriver du `.help`.

[FIGURE src=image/webtec/sqlite/03-shema.png?w=w3 caption="Databasens struktur kallas också databasens schema."]



Spara SQL koden i filer {#save-in-file}
--------------------------------------

När du jobbar med SQL bör du normalt spara undan din kod i en fil. Det blir enklare att jobba med koden, modifiera den och köra den.

Koden för att skapa databasens schema kan du lägga i en fil `ddl.sql`.

Du kan sedan köra den filen antingen genom att kopiera dess innehåll direkt in till applikationen `sqlite3` eller så använder du kommandot `.read ddl.sql` för att exekvera alla kommandon i filen.

[FIGURE src=image/webtec/sqlite/04-code-med-ddl-sql.png?w=w3 caption="Vi skriver SQL och sparar i filer."]

[FIGURE src=image/webtec/sqlite/04-read-ddl-sql.png?w=w3 caption="Vi kan exekvera filen med SQL genom att läsa in den i terminalklienten."]

Om allt gick bra så visas inga felmeddelanden.



Tabell, kolumn, rad och nyckel {#oversikt}
--------------------------------------

En databas består av tabeller, varje tabell har en struktur med ett antal definerade kolumner. Varje kolumn är av en viss datatyp.

Tabellens innehåll består av rader vars värden representerar en sammanhängande enhet i tabellen. I vårt fall representerar en rad en kurs och dess egenskaper.

Varje rad innehåller värden för varje kolumn. Vi kan säga att radens värden placeras i celler i respektive kolumn.

Så här kan innehållet i en tabellen "course" se ut, fördelat på fyra rader, fyra kurser.

```text
code        name        points      term
----------  ----------  ----------  ----------
PA1439      webtec      7.5         1
DV1531      python      7.5         1
PA1436      design      7.5         2
DV1561      javascript  7.5         2
```

Innehållet i en tabell består alltså av rader med värden i kolumner/celler.

Oftast har varje rad något som gör att raden blir unik. Ett värde eller en kod, i fallet ovan är det kurskoden som gör att varje rad blir unik. Ett annat sätt att göra raden unik är att tillföra ett automatiskt id, en siffra, vars enda syfte är att göra raden unik. Ett tredje sätt är att kombinera flera kolumners värden för att göra raden unik. Vi valde tidigare att göra "code" till primärnyckel i vår tabell.

Detta var några bakomliggande termer i databasvärlden. I sin enkelhet går strukturen att jämföra med ett välorganiserat excelark, eller med matematikens mängdlära.

Låt se hur vi kan skapa innehåll i vår tabell.



Lägg till värden i en tabell {#kurs-insert}
--------------------------------------

För att lägga till rader i en tabell använder vi `INSERT`. Följande kod lägger till de raderna vi ser ovan. Här kan det för övningens skull vara bra att skapa en ny fil `insert.sql`.

```text
INSERT INTO course
    (code, name, term)
VALUES
    ('PA1439', 'webtec', 1),
    ('DV1531', 'python', 1),
    ('PA1436', 'design', 2),
    ('DV1561', 'javascript', 2)
;
```

[FIGURE src=image/webtec/sqlite/05-insert-sql.png?w=w3 caption="Det är smidigt att skriva SQL-koden i en fil för att sedan exekvera filen."]

Nu kan vi ställa en SQL-fråga mot tabellen.



Välj värden ur en tabell {#select-kurs}
--------------------------------------

Vi prövar att skriva en SQL-sats som väljer ut samtliga rader ur tabellen. 

Innan vi börjar sätter vi  på en snyggare utskrift i verktyget `sqlite3`.

```text
sqlite> .headers on
sqlite> .mode columns
```

SQL-satsen kan se ut så här tillsammans med resultatet.

```text
sqlite> SELECT * FROM course;
code        name        points      term        kmom        done      
----------  ----------  ----------  ----------  ----------  ----------
PA1439      webtec      7.5         1                                 
DV1531      python      7.5         1                                 
PA1436      design      7.5         2                                 
DV1561      javascript  7.5         2                                 
```

Vi ser nu att tabellen innehåller fyra rader med 6 kolumner men värden finns endast i fyra av kolumnerna. I vår INSERT sats lade vi endast till tre värden, men den fjärde kolumnen `points` var definierad med ett default värde som används om inget annat värde definieras.

[FIGURE src=image/webtec/sqlite/06-select.png?w=w3 caption="Nu kan vi ställa frågor mot databasen."]

Du kan nu prova att variera din fråga mot databasen för att se hur olika rapporter kan se ut, prova följande.

```text
--- Show all courses in the first study period
SELECT * FROM course WHERE term = 1;

-- Show only the name and the code
SELECT name, code FROM course;

-- Order by name 
SELECT * FROM course ORDER BY name;

-- Show all courses containing a "a" in the name
SELECT * FROM course WHERE name LIKE '%a%';
```


Uppdatera värden i en rad med UPDATE {#update}
--------------------------------------

Låt oss göra ett exempel med en UPDATE-sats för att uppdatera värden i en rad.

Om vi nu säger att vi vill uppdatera tabellen i databasen så att det blir tydligt att vi för tillfället jobbar med kmom05 i kursen webtec och att vi är helt klara med kursen python, så skulle vi kunna göra så här.

Först sätter vi att det är kmom05 vi nu jobbar med i kursen webtec.

```text
UPDATE course SET
    kmom = 'kmom05'
WHERE
    name = 'webtec';
```

Ofta är det tydligare att skriva en större SQL-sats på flera rader, det blir lättare att läsa koden för att se vad som händer.

Sedan sätter vi att vi är helt klara med kursen python genom att sätta ett datum när vi blev klara.


```text
UPDATE course SET
    done = datetime('now')
WHERE 
    code = 'DV1531';
```

Så här kan det se ut om vi gör det direkt i klienten.

[FIGURE src=image/webtec/sqlite/07-update.png?w=w3 caption="Nu är databasen uppdaterad."]

Men kom ihåg att det är nästan alltid en bra idé att spara undan sin kod i filer, då blir det enklare att komma ihåg hur man gjorde och man kan gå tillbaka till sin exempelkod och se hur man skrev.



Ta bort rader i tabellen med DELETE {#delete}
--------------------------------------

Man kan ta bort rader från tabellen med DELETE.

```text
-- Remove a specific course
DELETE FROM course WHERE name = 'design';

-- Remove all rows in the table
DELETE FROM course;
```

Nu är tabellen tom.

[FIGURE src=image/webtec/sqlite/08-delete.png?w=w3 caption="Nu kan vi ställa frågor mot databasen."]

Som tur är så kan vi enkelt återställa tabellens innehåll genom att läsa in filerna igen.

```text
-- Add the initial rows to the table
.read insert.sql

-- And if you saved your updates...
.read update.sql 
```



Avslutningsvis {#avslutning}
--------------------------------------

Det var en introduktion till verktyget `sqlite3`, via verktyget kan du skriva SQL och jobba med databasen SQLite.
