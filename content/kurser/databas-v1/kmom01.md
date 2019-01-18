---
views:
    flash:
        region: flash
        template: default/image
        data:
            src: "image/snapvt19/client-mysql-copy.png?w=1100&h=300&cf&a=0,0,66,0"
author: mos
revision:
    "2019-01-16": "(F, mos) Bort referens BTH labbmiljö."
    "2019-01-11": "(E, mos) Uppdaterat inför vt19."
    "2018-12-19": "(D, mos) Uppdaterat läsanvisning utgåva 2 av kursbok."
    "2018-03-22": "(C, mos) Bort 404 länk till labbmiljön."
    "2018-03-20": "(B, mos) Bort med kopplingar till XAMPP och BTHs labbmiljö är enbart extra."
    "2017-12-28": "(A, mos) Första utgåvan."
...
Kmom01: Databas
====================================

Vi börjar med att installera en labbmiljö som består av en databas och ett par databas-klienter. Vi kommer jobba med relationsdatabaser och där har vi valt MySQL/MariaDB. Som klienter så använder vi både terminalbaserade klienter och en fönsterbaserad grafisk klient MySQL WorkBench. Klienterna har båda sin plats och användningsområde vid olika tillfällen.

I en relationsdatabas pratar vi SQL med databasen. Vi skriver SQL för att skapa tabeller och för att lägga till, uppdatera, visa och radera data från databasen. Låt oss börja med att kika på grundkonstruktioner för SQL.

<!--more-->

[FIGURE src=/image/snapshot/mamp-mysql-clu-test.jpg?w=w3&q=60 caption="SQL i en textbaserad klient."]

[FIGURE src=/image/snapshot/sql-ovning-alter-table.jpg?w=w3&q=60 caption="SQL som det ser ut i desktop-klienten MySQL WorkBench."]

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Labbmiljön  {#labbmiljo}
---------------------------------

*(ca: 2-4 studietimmar)*

Det finns en [längre beskrivning om kursens labbmiljö](./../installera-labbmiljo). Läs den om du är osäker på vad som skall göras, eller om detta är din första dbwebb-kurs.

Den korta varianten är att du behöver [installera labbmiljön](./../labbmiljo), uppdatera [dbwebb-cli](dbwebb-cli) samt klona och initiera kursrepot.

```text
# Gå till din katalog för dbwebb-kurser
dbwebb selfupdate
dbwebb clone databas
cd databas
dbwebb init
```



Läs &amp; Studera  {#lasanvisningar}
---------------------------------

*(ca: 8-10 studietimmar)*


### Kurslitteratur  {#kurslitteratur}

Läs följande:

1. [Databasteknik](kunskap/boken-databasteknik) om MySQL.
    * Kap 1: Databaser och databashanterare
    * Kap 7: Introduktion till frågespråket SQL
    * Kap 29: Introduktion till MySQL

Viss information finns även i [bokens webbkurs](http://www.databasteknik.se/webbkursen/), del 1 och 3.



### Artiklar {#artiklar}

Kika igenom följande artiklar.

1. Kika igenom referensmanualen för MySQL, kort och översiktligt. Se till att du kan hitta till den delen som visar hur SQL skall skrivas i MySQL.
    * [SQL Statement Syntax](https://dev.mysql.com/doc/refman/8.0/en/sql-syntax.html)

1. Under kursen kommer vi att ponera vikten av att hålla sig till en kodstil för SQL-koden. Det kommer inte vara absolut strikt, men det är en rimlig rekommendation att följa en kodstil. För kursen har vi valt "[SQL Style Guide by Simon Holywell](https://www.sqlstyle.guide/)". Ha detta i bakhuvudet när du funderar på hur man skriver sin SQL-kod. Om du har funderingar kring kodstilen så kan du läsa "[SQL style guide misconceptions](https://www.simonholywell.com/post/2016/12/sql-style-guide-misconceptions/)".



### Video {#video}

Kika igenom följande videor för att få grepp om grunderna i Databaser och SQL.

1. För att få en snabb översikt om databaser och SQL så kikar du igenom videon "[What is Database & SQL?](https://www.youtube.com/watch?v=FR4QIeZaPeM)". Videon ger dig en snabb översikt av termer med förklaringar.

1. Videon "[Learn Basic SQL in 10 Minutes](https://www.youtube.com/watch?v=bEtnYWuo2Bw)" ger dig en snabb förklaring till grunderna i SQL. Videon hanterar även översikt av mer avancerade begrepp som JOIN, UNION och GROUP. Dessa kommer senare i kursen.

1. Kursen innehåller föreläsningar som streamas och därefter läggs i en spellista. Du kan nå spellistan på "[databas streams vt19](https://www.youtube.com/playlist?list=PLKtP9l5q3ce8JaLBnz0TszCXc_eCVpmOh)".


<!--
### Läsvärt {#lastips}

Följande kan du studera om du har tid, intresse och kraft över.

1. Vi kommer inte att använda BTH's labbmiljö för MySQL i denna kursen, men om du vill så kan du bekanta dig med den via dokumentet "[MySQL / MariaDB i BTH’s labbmiljö](labbmiljo/mysql-bth-labbmiljo)". Se hur du kan använda BTH's databasserver för MySQL och hur du kan använda de olika klienterna för att koppla upp dig inifrån skolans nätverk och utanför skolans nätverk. Spara dina eventuella testfiler i `me/kmom01/klient`.
-->



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 8-10 studietimmar)*


<!--
### Övningar {#ovningar}

Jobba igenom följande övningar, de förbereder dig inför uppgifterna.

1. Jobba översiktligt igenom guiden "[Kom igång med databasen MySQL och dess klienter](kunskap/kom-igang-med-databasen-mysql-och-dess-klienter)". Som databasutvecklare är det bra att du ha koll på olika varianter av klienter, testa de du har tillgång till och se till att din lokala utvecklingsmiljö fungerar. Artikeln bygger egentligen på att man installerat MySQL med XAMPP, men du kan säkert läsa igenom artikeln och få viss behållning av den, annars får du skumläsa den. I artikeln finns till exempel enklare SQL-kommandon du kan använda för att komma igång med dina klienter. Spara dina eventuella testfiler i `me/kmom01/klient`.
-->



### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[Skapa en me-sida för redovisning i dbwebb-kurs](uppgift/skapa-en-me-sida-for-redovisning-i-dbwebb-kurs)". Spara resultatet i `me/redovisa`.

1. Jobba igenom artikeln "[Introduktion till databasen MySQL/MariaDB, dess klienter och SQL](kunskap/introduktion-till-mysql-mariadb-dess-klienter-och-sql)". I artikeln får du träna på att använda klienterna och du får träna på ett arbetssätt som du kan ha under kursen. Det finn SQL-kod som du skall köra för att konfigurera upp din databas med en användare. Spara de filerna du använder i katalogen `me/kmom01/klient`, filerna är bra att ha om du senare behöver återskapa databasen.

1. Jobba igenom första delen av guiden "[Kom igång med SQL i MySQL](guide/kom-igang-med-sql-i-mysql)". I guiden ombeds du göra övningar och spara din SQL-kod i filer. Lägg dem i katalogen `me/skolan` som din redovisning. I nästa kmom fortsätter du med nästa del i guiden.
    * [Första delen: Grunderna](guide/kom-igang-med-sql-i-mysql/grunderna)

Jobba gärna i grupp med dina studiekompisar, men skriv alltid din egen kod för hand. Även om du tjuvkikar för att hitta bra lösningar så är det en stor skillnad att skriva koden själv jämfört med att kopiera från någon.

<!--
IMPROVE: Gör någon enkel labb som kontrollerar att studenten har koll på vad guiden går igenom. Använd databasen som finns i guiden.

1. Gör laborationen "[SQL lab, introduktion till SQL](uppgift/sql-lab-introduktion-till-sql-dbjs)" som låter dig träna på grunderna i SQL kommandon.
-->



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

* Berätta kort om den utvecklingsmiljö du sitter i och vilka databaser/klienter du installerat och vilka versioner de har.
* Hur känns det att komma igång med databaser, klienter och SQL?
* Har du jobbat med databaser eller liknande tidigare?
* Hur gick det att jobba med SQL i guiden?
* Jämför SQL med andra sätt att programmera.

TIL är en akronym för "Today I Learned" vilket leksamt anspelar på att det finns alltid nya saker att lära sig, varje dag. Man brukar lyfta upp saker man lärt sig och där man kanske hajade till lite extra över dess nyttighet eller enkelhet, eller så var det bara en ny lärdom för dagen som man vill notera.

* Vilken är din TIL för detta kmom?
