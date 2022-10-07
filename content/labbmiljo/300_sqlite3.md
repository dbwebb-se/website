---
author: mos
category: sql
revision:
    "2022-09-16": "(E, mos) Förtydliga vad som gäller för wsl."
    "2021-06-28": "(D, mos) Flyttad till labbmiljö och omskriven inför webtec-kursen."
    "2018-10-01": "(C, mos) Hur man avslutar programmet med ctrl-d."
    "2018-09-30": "(B, mos) Changed name of sqlite frile from jetty to boatclub."
    "2015-06-05": "(A, mos) Första utgåvan för htmlphp version 2 av kursen."
...
En kommandoradsklient för SQLite
==================================

[FIGURE src=/image/snapvt15/sqlite3.png?w=c5&a=10,50,50,0 class="right"]

Programmet `sqlite3` är en kommandoradsklient för databsen SQLite. Med programmet kan du titta på databasens innehåll och skriva SQL-satser för att skapa tabeller och redigera innehållet i databasen.

En kommandoradsklient är behändig för den som jobbar i terminalen.

<!--more-->




Förutsättningar {#pre}
--------------------------------------

Du har en terminal där du kan köra en pakethanterare för att installera program.



Installera kommandoradsklient `sqlite3` {#sqlite3}
--------------------------------------

Till databasen SQLite finns det en kommandoradsklient som heter `sqlite3`.

På Mac OS finns den förinstallerad.

På Linux och Windows/Cygwin installerar du den med pakethantering.

```text
# Linux och Windows/WSL/Ubuntu
apt install sqlite3

# Windows/Cygwin
apt-cyg install sqlite3
```

Nu finns kommandot installerat. Dubbelkolla att det fungerar genom att visa upp hjälptexten.

```text
sqlite3 -help
```

Kontrollera vilken version du har.

```text
sqlite3 -version
```



Koppla upp sig mot en databas {#koppla}
--------------------------------------

Låt oss skapa en testkatalog som vi kan jobba i.

```text
mkdir dbtest
cd dbtest
```

SQLite är en filbaserad databas så man anger den filen som databasen finns i. För att testa kan du använde en exempeldatabas. Hämta databasfilen `boatclub.sqlite` så här.

```text
wget -O boatclub.sqlite https://github.com/dbwebb-se/webtec/raw/main/example/sqlite/boatclub.sqlite

$ ls -l boatclub.sqlite
-rw-r--r-- 1 mos mos 16K Sep 30 23:48 boatclub.sqlite
```

Nu kan du öppna databasen.

```text
sqlite3 boatclub.sqlite
```

Du avslutar programmet genom att skriva `.exit` eller trycka `ctrl-d`.



Inspektera och fråga databasen {#inspekt}
--------------------------------------

Pröva följande kommandon för att bekanta dig med hanteringen.

```text
.help
.tables
.schema
```

Nu kan du ställa en SQL-fråga mot tabellen `Jetty`.

```text
SELECT * from jetty;
```

Du får en finare utskrift om du sätter på kolumnbaserad utskrift och lägger till rubriker.

```text
.mode column
SELECT * from jetty;

.headers on
SELECT * from jetty;
```

Så här kan det se ut när du jobbar med `sqlite3`.

[ASCIINEMA src=422660]



Avslutningsvis {#avslutning}
--------------------------------------

Det var ett par korta steg för att komma igång med kommandoradsklienten för SQLite. Ibland kan det vara det snabbaste och enklaste sättet att tillgå och prata med en SQLite-databas.

Det finns fler typer av klienter som du kan använda till SQLite. Här följer två exempel som du kan kika på som eventuell överskurs.

* Desktop: [Kom igång med databasen SQLite med DB Browser för SQLite](kunskap/kom-igang-med-databasen-sqlite-med-db-browser-for-sqlite)
* Webb: [En webbaserad klient för SQLite, phpliteadmin](kunskap/en-webbaserad-klient-for-sqlite-phpliteadmin)

<!--
Dubbelkolla att de båda klienterna ovan fortfarande fungerar med tex win/wsl.
-->