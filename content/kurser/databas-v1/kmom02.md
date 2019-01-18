---
views:
    flash:
        region: flash
        template: default/image
        data:
            src: "image/snapvt18/nodejs-mysql-search.png?w=1100&h=300&cf&a=0,0,55,0&f=grayscale"
author: mos
revision:
    "2018-12-19": "(prel, mos) Gulmarkerat inför vt18."
    "2018-12-19": "(B, mos) Uppdaterat läsanvisning utgåva 2 av kursbok."
    "2018-01-02": "(A, mos) Första utgåvan."
...
Kmom02: SQL
====================================

[WARNING]

**Översikt pågår**

Kursmomentet är under översyn inför vårterminen 2019.

[/WARNING]

Vi jobbar vidare med SQL och tränar på enklare konstruktionerna och mer utmanande saker som vyer, subqueries, UNION och JOIN.

Du kommer även börja jobba med JavaScript och Node.js för att se hur du kan koppla dig till en MySQL databas via ett applikationsspråk. Det innebär att du behöver installera en labbmiljö med Node.js och pakethanteraren npm samt att du kommer igång med grunderna i programmeringsspråket JavaScript och specifikt hur JavaScript används tillsammans med Node.js.

<!--more-->

[FIGURE src=image/snapvt18/guide-skolan-select.png?w=w3 caption="Guiden hjälper oss med mer avancerade konstruktioner i SQL."]

[FIGURE src=image/snapvt18/nodejs-mysql-search.png?w=w3 caption="Med JavaScript och Node.js bygger du ett skript som kopplar sig till din databas."]


<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Labbmiljön  {#labbmiljo}
---------------------------------

*(ca: 2-4 studietimmar)*

Installera följande.

1. Installera labbmiljön för Node.js och npm via "[Installera nodejs och npm](labbmiljo/node-och-npm)".




Läs &amp; Studera  {#lasanvisningar}
---------------------------------

*(ca: 6-8 studietimmar)*



### Databasteknik {#dbteknik}

Läs följande som är relaterat till databaser och SQL.

1. [Databasteknik](kunskap/boken-databasteknik) om mer SQL.
    * Kap 8: Mer om SQL: Aggregatfunktioner, null-värden, yttre join
    * Kap 21: SQL inuti ett program

Vissa av kapitlen finns i [bokens webbkurs](http://www.databasteknik.se/webbkursen/), del 2.

Det finns ytterligare ett kapitel i boken som är relaterat till SQL, det går utanför kursens ram men läs vid intresse.

1. [Databasteknik](kunskap/boken-databasteknik)
    * Kap 11: Relationsalgebra



### JavaScript {#javascript}

Läs följande som är relaterat till programmeringsspråket JavaScript och Node.js.

1. Bekanta dig med boken "[Boken: JavaScript for impatient programmers](https://dbwebb.se/kunskap/boken-javascript-for-impatient-programmers)" och se den som en resurs och uppslagsverk för programmeringsspråket JavaScript. Använd dina kunskaper om programmeringsspråk i allmänhet och se hur det relaterar till programmeringsspråket JavaScript.

1. Webbplatsen "Mozilla Developers Network (MDN)" är en allmän resurs för webbutveckling och där finns en referensmanual för språket JavaScript. För en snabb introduktion till konstruktionerna i språket JavaScript kan jag rekommendera dokumentet "[MDN JavaScript Guide](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide)" och följande inledande kapitel.
    * Introduction
    * Grammar and types
    * Expressions and operators

1. Node.js låter dig köra JavaScript utan en webbläsare. Via webbplatsen för Node.js finner du [referensdokumentationen](https://nodejs.org/en/docs/) till de delar och moduler som är specifika för Node.js/JavaScript. Node.js innehåller ett API som bland annat ger dig tillgång till operativsystemets resurser och låter dig skriva terminalprogram.

1. Som ett alternativ kan du kika på guiden "[Programmering med grunderna i JavaScript](https://dbwebb.se/guide/javascript1/introduktion)". Guiden är på svenska och främst skriven för JavaScript i webbläsaren, men den kan ge dig viss grundläggande kunskap i språket JavaScript som hjälper dig att komma igång med språkets byggstenar.



### Artiklar {#artiklar}

Läs följande:

1. I kursen används validatorer och en kodstandard för att testa att du skriver kod på ett, enligt kodstandarden, acceptabelt sätt. Du kan läsa kort om dbwebb-kodstandarden på [npm javascript-code-style](https://www.npmjs.com/package/javascript-style-guide). Du kan diskutera [kodstandarden i forumet](t/6327).



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 8-10 studietimmar)*



### Övningar {#ovningar}

Genomför följande övning för att förbereda inför uppgifterna.

1. Jobba igenom artikeln "[JavaScript och Node.js](kunskap/javascript-och-nodejs)" som visar hur du kommer igång med programmeringsspråket JavaScript i miljön Node.js. Spara dina exempelprogram under `me/kmom02/js`.

1. Jobba igenom artikeln "[JavaScript och Node.js med async och await](kunskap/javascript-och-nodejs-med-async-och-await)" som presenterar begrepp kring den asynkrona programmeringsmodell som är grunden i Node.js. Spara dina exempelprogram under `me/kmom02/js`.

1. Jobba igenom artikeln "[MySQL och Node.js (v2)](kunskap/mysql-och-nodejs-v2)" som visar hur du kommer igång med programmeringsspråket JavaScript i miljön Node.js och hur du kopplar ett program till databasen MySQL. Spara dina exempelprogram under `me/kmom02/search`.



### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

Båda uppgifterna bygger på att du klarat av första delen av SQL-guiden från kmom01. Du kan välja i vilken ordning du gör uppgifterna, de är inte beroende av varandra.

1. Lös uppgiften "[Node.js terminalprogram mot MySQL (v2)](uppgift/nodejs-terminalprogram-mot-mysql-v2)". Spara alla filer i `me/kmom02/terminal1`.

1. Jobba igenom delen "Mer SQL" av guiden "[Kom igång med SQL i MySQL (Mer SQL)](guide/kom-igang-med-sql-i-mysql/mer-sql)". Fortsätt spara all SQL-kod i filer i katalogen `me/skolan`.


<!--
Enkel SQL laboration som visar att studenten kan göra joins/subquery.

1. Gör laborationen "[SQL lab, fortsättning med SQL (sql2)](uppgift/sql-lab-fortsattning-med-sql)" som låter dig fortsätta träna på SQL med SQLite. Spara koden i `me/kmom03/sql2`.

1. Gör laborationen "[Introduktion till nodejs (node1)](uppgift/introduktion-till-nodejs)" för att öva på grunderna i nodejs. Spara koden i `me/kmom03/node1`.

-->



### Extra {#extra}

Gör följande extrauppgifter om du har tid och lust.

1. Jobba igenom guiden "[Kom igång med tmux och terminalen](kunskap/kom-igang-med-tmux-och-terminalen)" för att lära dig hur du jobbar mer effektivt i terminalen med tmux. Tmux ger dig möjlighet att dela in din terminal i olika flikar och varje flik i olika delar.



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

* Du har nu använt både UNION och JOIN för att slå samman tabeller i SQL, vilken är din uppfattning om databaser och SQL så här långt?
* Är detta den första bekantskap med JavaScript på serversidan och Node.js, hur känns det och vilken uppfattning, eller förutfattade meningar, har du om detta?
* Hur kändes konceptet med async och await och asynkron programmering?
* Hur gick det att koppla ihop JavaScript, Node.js med SQL och databasen?
* Vilken är din TIL för detta kmom?
