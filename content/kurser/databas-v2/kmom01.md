---
views:
    flash:
        region: flash
        template: default/image
        data:
            src: "image/kunskap/kokbok-databasmodellering/image00.jpg?w=1100&h=300&cf&a=20,0,0,0&f=grayscale"
author: mos
revision:
    "2022-01-15": "(K, mos) Uppdaterad inför version 2 och vt22."
    "2021-01-14": "(J, mos) Lade till länkar till föreläsningar."
    "2021-01-13": "(I, mos) Uppdaterade länk till streams vt21."
    "2020-01-29": "(H, mos) Uppdaterade länk till streams vt20."
    "2020-01-21": "(G, mos) Notera hur inlämningen sker."
    "2019-01-16": "(F, mos) Bort referens BTH labbmiljö."
    "2019-01-11": "(E, mos) Uppdaterat inför vt19."
    "2018-12-19": "(D, mos) Uppdaterat läsanvisning utgåva 2 av kursbok."
    "2018-03-22": "(C, mos) Bort 404 länk till labbmiljön."
    "2018-03-20": "(B, mos) Bort med kopplingar till XAMPP och BTHs labbmiljö är enbart extra."
    "2017-12-28": "(A, mos) Första utgåvan."
...
Kmom01: Databas
====================================

Vi börjar med att installera en labbmiljö som består av en databas och ett par databas-klienter. Vi skall jobba med databasen MySQL/MariaDB som är en relationsdatabas. Som klienter använder vi en terminalbaserad klient och en fönsterbaserad grafisk klient. Klienterna har båda sin plats i vår verktygslåda och de är bra att använda vid olika typer av tillfällen.

I en relationsdatabas pratar vi SQL med databasen. Vi skriver SQL för att skapa tabeller och för att lägga till, uppdatera, visa och radera data från databasen. När databasen är på plats så kikar vi på en del grundkonstruktioner för SQL.

<!--more-->

[FIGURE src=/image/snapshot/mamp-mysql-clu-test.jpg?w=w3&q=60 caption="SQL i en textbaserad klient."]

[FIGURE src=/image/snapshot/sql-ovning-alter-table.jpg?w=w3&q=60 caption="SQL som det ser ut i desktop-klienten MySQL WorkBench."]

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Labbmiljön  {#labbmiljo}
---------------------------------

*(ca: 2-4 studietimmar)*

Börja med att installera kursens labbmiljö som behövs för att komma igång med kmom01.

* [Installera labbmiljön](./../labbmiljo)

Därefter kan du uppdatera dig och clona kursrepot. Läs mer om [dbwebb-cli](dbwebb-cli) vid behov.

```text
# Gå till din katalog för dbwebb-kurser
dbwebb selfupdate
dbwebb clone databas
cd databas
dbwebb init
```

Kursrepot kan du även se på GitHub.

* [https://github.com/dbwebb-se/databas](https://github.com/dbwebb-se/databas)

PS. Om du är osäker på något steg så kan du läsa en [längre beskrivning om kursens labbmiljö](./../installera-labbmiljo).



Läs &amp; Studera  {#lasanvisningar}
---------------------------------

*(ca: 8-10 studietimmar)*



### Föreläsningar {#flas}

Titta på följande inspelade föreläsningar.

1. [Kursintro](./../forelasning/kursintro) som ger en introduktion till kursens struktur och upplägg samt en översikt av kursens innehåll.

1. [Databaser och relationsdatabaser, introduktion](./../forelasning/databas-relationsdatabas-introduktion) ger dig en introduktion till begrepp som databas och relationsdatabas.

1. [SQL introduktion och exempel](./../forelasning/sql-introduktion-och-exempel) ger dig en introduktion till frågespråket SQL.

<!--
* Emils introföreläsning i HTML, CSS, JavaScript.

* Kenneths genomgång där han jobbar igenom "[Introduktion till databasen MySQL/MariaDB, dess klienter och SQL](kunskap/introduktion-till-mysql-mariadb-dess-klienter-och-sql)". Denna kan spelas in som små videor in i en spellista. Alternativt ser man om detta går att väva in i guiden och spela in korta videor för varje artikel.

-->



### Kurslitteratur  {#kurslitteratur}

Läs följande:

1. [Databasteknik](kunskap/boken-databasteknik) om MySQL.
    * Kap 1: Databaser och databashanterare
    * Kap 7: Introduktion till frågespråket SQL
    * Kap 29: Introduktion till MySQL (om du har tid och lust)

2. [Boken har även en webbplats](http://www.databasteknik.se/webbkursen/) och vissa utdrag från boken finns där. Relevant för detta kmom är följande:

    * [Introduktion till databaser och databashanterare](http://www.databasteknik.se/webbkursen/databaser/index.html)
    * [Introduktion till frågespråket SQL](http://www.databasteknik.se/webbkursen/sql/index.html)
    * [Introduktion till MySQL](http://www.databasteknik.se/webbkursen/mysql/index.html) (om du har tid och lust)



### Artiklar {#artiklar}

Kika igenom följande artiklar.

1. Kika igenom referensmanualen för MariaDB, kort och översiktligt så att du kan navigera i den. Referensmanualen är ett viktigt verktyg för att bli bra på databaser och SQL. Se till att du kan hitta till den delen som visar hur SQL med SELECT skall skrivas i MySQL.
    * [MariaDB Server Documentation](https://mariadb.com/kb/en/documentation/)

1. Under kursen kommer vi att ponera vikten av att hålla sig till en kodstil för SQL-koden. Det kommer inte vara absolut strikt, men det är en rimlig rekommendation att följa en kodstil. För kursen har vi valt "[SQL Style Guide by Simon Holywell](https://www.sqlstyle.guide/)". Ha detta i bakhuvudet när du funderar på hur man skriver sin SQL-kod. Om du har funderingar kring kodstilen så kan du läsa "[SQL style guide misconceptions](https://www.simonholywell.com/post/2016/12/sql-style-guide-misconceptions/)".



### Video {#video}

Kika igenom följande videor för att få grepp om grunderna i Databaser och SQL. Ibland kan man hitta bra resurser på nätet och detta är ett litet försök att visa upp det.

1. För att få en snabb översikt om databaser och SQL så kikar du igenom videon "[What is Database & SQL?](https://www.youtube.com/watch?v=FR4QIeZaPeM)". Videon ger dig en snabb översikt av termer med förklaringar.

1. Videon "[Learn Basic SQL in 10 Minutes](https://www.youtube.com/watch?v=bEtnYWuo2Bw)" ger dig en snabb förklaring till grunderna i SQL. Videon hanterar även översikt av mer avancerade begrepp som JOIN, UNION och GROUP. Dessa kommer senare i kursen.



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 8-10 studietimmar)*

Jobba gärna i grupp med dina studiekompisar, men skriv alltid din egen kod för hand. Även om du tjuvkikar för att hitta bra lösningar så är det en stor skillnad att skriva koden själv jämfört med att kopiera från någon.


<!--
Borttagen från v1.

Gör om till övning? Nja, guiden kan utökas istället. Kanske använda som bas för en lektion i vecka 1?

1. Jobba igenom artikeln "[Introduktion till databasen MySQL/MariaDB, dess klienter och SQL](kunskap/introduktion-till-mysql-mariadb-dess-klienter-och-sql)". I artikeln får du träna på att använda klienterna och du får träna på ett arbetssätt som du kan ha under kursen. Det finns SQL-kod som du skall köra för att konfigurera upp din databas med en användare. Spara de filerna du använder i katalogen `me/kmom01/klient`, filerna är bra att ha om du senare behöver återskapa databasen.
-->



### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[Skapa en me-sida för redovisning i dbwebb-kurs](uppgift/skapa-en-me-sida-for-redovisning-i-dbwebb-kurs)". Spara resultatet i `me/redovisa`.

1. Jobba igenom första delarna av guiden "[Kom igång med SQL i MySQL](guide/kom-igang-med-sql-i-mysql-v2)". I guiden ombeds du göra övningar och spara din SQL-kod i filer. Lägg dem i katalogen `me/skolan` som din redovisning. I nästa kmom fortsätter du med nästa del i guiden.
    * [Delen: Installation](guide/kom-igang-med-sql-i-mysql-v2/installation)
    * [Delen: Bygg en databas](guide/kom-igang-med-sql-i-mysql-v2/bygg-en-databas)

<!--
När du är klar med uppgifterna kan du lämna in.

1. När du är klar med allt så lämnar du in via `dbwebb publish me` och du kontrollerar att du laddat upp rätt saker via `dbwebb inspect kmom01`.
-->



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

* Hur känns det att komma igång med databaser, klienter och SQL - är det något du ser fram emot eller fasar inför?
* Har du jobbat med databaser eller liknande tekniker tidigare?
* Berätta lite om ditt arbetet med SQL i guiden, hur gick det?
* Jämför SQL med andra sätt att programmera, relatera till några av de programmeringsspråk du kan.
* Vilken är din TIL för detta kmom?

TIL är en akronym för "Today I Learned" vilket leksamt anspelar på att det finns alltid nya saker att lära sig, varje dag. Man brukar lyfta upp saker man lärt sig och där man kanske hajade till lite extra över dess nyttighet eller enkelhet, eller så var det bara en ny lärdom för dagen som man vill notera.

<!-- Poängtera dbwebb test. -->