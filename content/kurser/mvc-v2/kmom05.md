---
author:
    - mos
revision:
    "2022-04-25": "(C, mos) Genomgången inför vt22 mvc-v2."
    "2021-04-30": "(B, mos) Lade till ORM föreläsning från Zoom och övningar."
    "2021-04-26": "(A, mos) Första utgåvan."
...
Kmom05: ORM / Databas
==================================

Det finns olika taktiker att integrera applikationskod med databasen när man jobbar med ramverk. Ett sätt är att jobba med PHP PDO och SQL direkt mot databasen eller via ett databas API som är uppbyggt av lagrade procedurer (jämför med databas-kursen). Ett annat sätt som är vanligt i sammnhanget ramverk är att använda sig av ett ORM lager (Object Relational Mapping) vars syfte är att objektifiera relationsdatabasen och accessen till databasen. Det handlar alltså om att göra relationsdatabasen mer objektorienterad.

Tanken med ORM är att ge programmeraren möjlighet att jobba mot databasen med vanlig objektorienterad PHP kod via metoder, klasser och objekt. Det gränssnitt som ORM erbjuder döljer själva databasen och programmeraren behöver inte vara speciellt bevandrad i varken SQL eller hur en relationsdatabas fungerar. Programmeraren behöver dock lära sig hur ORM modulen fungerar.

Relationsmodellen och den objektorienterade modellen är två olika modeller och de har olika sätt att strukturera upp sitt innehåll. I relationsmodellen pratar vi om tabeller, kolumner och rader samt kopplingar mellan tabeller. När databasen döljs bakom ett ORM så erbjuds ett mer komplett objektorienterat synsätt mot databasens innehåll, i princip fritt från SQL.

Vi skall nu använda ORM för att koppla oss från ramverket till en databas.

<!-- more -->

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Labbmiljö  {#labbmiljo}
---------------------------------

*(ca: 1-2 studietimmar)*

Du kan använda databaserna MySQL, MariaDB eller SQLite för att genomföra uppgiften. När du publicerar din applikation till studentservern så skall applikationen fungera med sin databaskoppling.

1. Väljer du MySQL/MariaDB så kan du använda BTHs databasserver för studenter enligt följande.

    * [MySQL / MariaDB i BTH’s labbmiljö](labbmiljo/mysql-bth-labbmiljo)

1. Väljer du SQLite så fungerar den på samma sätt som du jobbade med den i webtec-kursen.

En möjlighet är att i övningarna nedan börja jobba med SQLite och när man är bekväm med att det fungerar så kan man byta över till MySQL/MariaDB då de databaserna kräver lite mer administration och hantering för att komma igång.

<!--
* Fixa video om labbmiljön?
-->



Läs & Studera  {#lasanvisningar}
---------------------------------

*(ca: 2-8 studietimmar)*



### Föreläsning {#flas}

Titta igenom följande föreläsningar.

1. [Database ORM - Object Relational Mapping](./../forelasning/orm) en introduktion till området och generella designmönster för datalagning och hantering av databaser.

<!--
* Gör om ovan zoom till en vanlig inspelad föreläsning.
* Föreläs och visa strukturen i Doctrine & Symfony.
-->



### Litteratur  {#litteratur}

Läs enligt följande.

1. I dokumentet [PHP The Right Way](http://www.phptherightway.com/), finns en sektion som berör databaser i PHP. Läs igenom den översiktligt.

    * [PHP The Right Way: Databases](https://phptherightway.com/#databases)

1. Symfony använder sig av ramverket Doctrine för att få en ORM implementation. Titta igenom följande översiktligt för att få en introduktion.

    * [Symfony doc: Databases and the Doctrine ORM](https://symfony.com/doc/current/doctrine.html)

1. Om du gillar video tutorials så finns det en serie "[Doctrine, Symfony & the Database](https://symfonycasts.com/screencast/symfony-doctrine)" som kan ge dig en introduktion till hur man jobbar med Symfony och Doctrine.

1. Doctrine är ett eget projekt, fristående från Symfony. Bekanta dig med Doctrine enligt följande.

    * [Wikipedia om Doctrine](https://en.wikipedia.org/wiki/Doctrine_(PHP))
    * [Doctrine webbplats](https://www.doctrine-project.org/)



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 10-14 studietimmar)*

Övningar är träning inför uppgifterna, det är ofta klokt att jobba igenom övningarna. Uppgifter skall utföras och redovisas.

Jobba gärna i grupp med dina studiekompisar, men skriv alltid din egen kod för hand. Även om du tjuvkikar för att hitta bra lösningar så är det en stor skillnad att skriva koden själv jämfört med att kopiera från någon.



### Övningar {#ovningar}

Jobba igenom övningarna, de förbereder dig inför uppgifterna.

1. I kursrepot under [`example/symfony-doctrine`](https://github.com/dbwebb-se/mvc/tree/main/example/symfony-doctrine) finns en övning med exempelkod som visar hur du kommer igång med Doctrine i Symfony.



### Uppgifter {#uppgifter}

Följande uppgifter skall utföras och resultatet skall redovisas.

1. Lös uppgiften "[Kom igång med Doctrine ORM i Symfony](uppgift/kom-igang-med-doctrine-orm-i-symfony)". Alla filer sparar du i `me/report`.

<!--

* Re-init databasen i uppgiften.

* How to unit test database

* How to link to other tables, one-to-one, one-to-many, many-to-many

Search engine
https://symfony.com/blog/the-new-symfony-documentation-search-engine
-->



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i din redovisningstext.

* Gick det bra att jobba igenom övningen med Symfony och Doctrine. Något särskilt du tänkte/reagerade på under övningen?

* Berätta om din applikation och hur du tänkte när du byggde upp den. Tänkte du något speciellt på användargränssnittet? Gick det bra att jobba med ORM i CRUD eller vad anser du om det?

* Berätta om du gjorde (delar av) extrauppgiften med användare och login.

* Vad är din uppfattning om ORM så här långt och relatera gärna till andra sätt att jobba med applikationskod mot databaser?

* Vilken är din TIL för detta kmom?
