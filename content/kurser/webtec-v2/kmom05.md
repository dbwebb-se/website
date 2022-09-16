---
views:
    flash:
        region: flash
        template: default/image
        data:
            src: "image/webtec/logo-sql.png"
author:
    - mos
revision:
    "2022-06-28": "(A, mos) Första utgåvan."
...
Kmom05: SQL och SQLite
==================================

[WARNING]

**Kursutveckling pågår inför hösten 2022. Använd inte materialet innan denna rutan är borttagen.**

[/WARNING]

Databas, SQL.


<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>

<!--stop-->

[WARNING]

**Om du är en early adopter så går det nu bra att jobba igenom detta kursmomentet, det sista som uppdaterades var att uppgiften bytte namn och skalades ned i omfattning.**

[/WARNING]




Labbmiljö  {#labbmiljo}
---------------------------------

*(ca: 2-4 studietimmar)*

Komplettera din labbmiljö med följande.

* [En kommandoradsklient för SQLite](labbmiljo/sqlite3).



Läs & Studera  {#lasanvisningar}
---------------------------------

*(ca: 2-4 studietimmar)*

Här kan du på egen hand studera och förbereda dig inför övningar och uppgifter.



### Föreläsning {#flas}

Titta på följande föreläsningar. Föreläsningarna kan innehålla tips om läsanvisningar.

* [SQLite, en filbaserad databas](./../forelasning/sqlite-en-filbaserad-databas)
* [SQL med SQLite](./../forelasning/sql-med-sqlite)

<!--
Ta bort fokus från responsiv webbplats.
In med PHP, något enklare.
-->



### Litteratur  {#litteratur}

Läs enligt följande.

1. ...



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 8-12 studietimmar)*

Övningar är träning inför uppgifterna, det är ofta klokt att jobba igenom övningarna. Uppgifter skall utföras och redovisas.

Jobba gärna i grupp med dina studiekompisar, men skriv alltid din egen kod för hand. Även om du tjuvkikar för att hitta bra lösningar så är det en stor skillnad att skriva koden själv jämfört med att kopiera från någon.



### Övningar {#ovningar}

Jobba igenom övningarna, de förbereder dig inför uppgifterna.

* [Kom igång med SQL och databasen SQLite med terminalklienten sqlite3](kunskap/kom-igang-med-sql-och-databasen-sqlite-med-terminalklienten-sqlite3)

<!--
* I lektionen "[Bygg en databas med SQL](./../forelasning/bygg-en-databas-med-sql)" får du hjälp att komma igång med uppgiften. Lektionen spelas in.

Sökformulär mot databasen?
-->



### Uppgifter {#uppgifter}

Följande uppgifter skall utföras och resultatet skall redovisas.

* Gör uppgiften "[Bygg en databas med SQL](uppgift/bygg-en-databas-med-sql)".

<!--
Byt uppgift, kalender ish? med GET

* Lägg tillbaka PHP-guiden och lägg till stycke om databas/PDO för att komplettera artikeln.

* Använd funktioner för att bygga på kmom04.

Inför labbarna (kmom04-06) om det känns som det behövs och om det känns att det finns utrymme (koppla till guiden?)

1. Gör uppgiften "[PHP lab 5: utforska inbyggda funktioner](uppgift/php-lab5-utforska-inbyggda-funktioner)". Spara filerna i katalogen `me/kmom05/lab5`.

-->


Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i din redovisningstext.

* Hur kändes det att bygga en databasdriven webbplats?
* Var det svårt att komma in i hur du jobbar med SQL mot databasen och sedan SQL mot databasen via PHP eller kändes det som logiskt? Fanns det något som gav dig bekymmer?
* Vilken är din TIL för detta kmom?

Glöm inte att testa din inlämning med `dbwebb test kmom05`.



<!--stop-->

Låt oss börja med databaser. Vi skall titta på databasen SQLite som är en filbaserad databas. En filbaserad databas förenklar hanteringen eftersom databasen ligger i en enda fil och det finns inga användare eller behörigheter att konfigurera.

Till databasen SQLite behövs klientprogram som kan användas för att prata med databasen. Vi prövar olika klienter, en variant för desktop och en terminalbaserad.

I en databas, en relationsdatabas som SQLite, så pratar vi SQL med databasen. Vi skriver SQL uttryck för att skapa tabeller och för att lägga till, uppdatera, visa och radera data från databasen.

När vi kan vår SQL så använder vi den kunskapen till att koppla samman PHP och databasen för att bygga en databasdriven webbplats. Via webbplatsen skall du kunna lägga till, uppdatera och ta bort innehåll. Detta är de vanliga funktionerna för create, read, update, delete och kallas även CRUD.

<!--more-->

Så här kan det se ut när du är klar med kursmomentet.

[FIGURE src="image/webtec/pdo/search-result.png?w=w3" caption="Resultatet från sökningen presenteras."]

[FIGURE src="image/webtec/pdo/insert-filled.png?w=w3" caption="Formuläret är ifyllt med värden."]

[FIGURE src="image/webtec/pdo/search-delete.png?w=w3" caption="Klicka på ett id för att se mer, eller update/delete för att modifiera raden."]

<small><i>Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.</i></small>


<!--
Namndatabasen, en "sökmotor".
Månens faser?
Helgdagar?
Koppla till kalendern och lägg in namnsdag på varje dag.

Extrauppgift minnessaker från fil till databasen.
-->


Studieplan & Upplägg {#studieplan}
---------------------------------

Följande är förslag till en grov och övergripande studieplan för att genomföra kursmomentet. Läs igenom hela dokumentet, innan du bestämmer din plan, det kan finnas mer aktiviteter och lärmoment som är relevanta att utföra inom ramen för kursmomentet.

<small><i>Kursmomentet omfattar cirka **20 + 20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke.</i></small>



### Vecka 1: SQL och SQLite {#v1}

Börja med att installera terminalklienten `sqlite3` som låter dig jobba mot en SQLite databas.

* Labbmiljö: [En kommandoradsklient för SQLite](labbmiljo/sqlite3)

Titta på följande föreläsningar. Föreläsningarna kan innehålla ytterligare läsanvisningar.

* [SQLite, en filbaserad databas](./../forelasning/sqlite-en-filbaserad-databas)
* [SQL med SQLite](./../forelasning/sql-med-sqlite)

Jobba på egen hand igenom följande artikel/övning.

* [Kom igång med SQL och databasen SQLite med terminalklienten sqlite3](kunskap/kom-igang-med-sql-och-databasen-sqlite-med-terminalklienten-sqlite3)

Delta i lektionen som förbereder dig för veckans uppgift.

* I lektionen "[Bygg en databas med SQL](./../forelasning/bygg-en-databas-med-sql)" får du hjälp att komma igång med uppgiften. Lektionen spelas in.

Genomför veckans uppgift.

* Gör uppgiften "[Bygg en databas med SQL](uppgift/bygg-en-databas-med-sql)".

<!--

1. Gör laborationen "[SQL lab 1, introduktion till SQL](uppgift/sql-lab-1-introduktion-till-sql)" som låter dig träna på SQL kommandon.

-->



### Vecka 2: Terminalprogram och webbplats med PHP PDO, SQL och SQLite {#v2}

[WARNING]

**Uppgiften och övningsartikeln är på plats och man kan börja jobba med det.**

**Lektionen hålls på tisdag och kommer utgå från övningen och därefter introducera uppgiften**

**Föreläsningen om PHP PDO är ännu inte släppt, den skall ge en introduktion till PHP PDO (men det gör också övningen så man kan gå direkt till övningen och titta på föreläsningen senare).**

[/WARNING]

Titta på följande föreläsning. Föreläsningarna kan innehålla ytterligare läsanvisningar.

* [PHP PDO och databaser](./../forelasning/php-pdo-och-databaser)
<!--
* <s>[Databasdriven webbplats med CRUD](./../forelasning/webbplats-med-crud)</s> utgår.
-->

Jobba på egen hand igenom följande övning, den förbereder dig för uppgiften.

* [Kom igång med SQLite och PHP PDO (v2)](kunskap/kom-igang-med-sqlite-och-php-pdo-v2)

Delta i lektionen som förbereder dig för veckans uppgift.

* I lektionen "[Bygg en databasdriven webbplats med PHP och SQL](./../forelasning/bygg-en-databasdriven-webbplats-med-php-och-sql)" får du hjälp att komma igång med uppgiften. Lektionen spelas in.

Genomför veckans uppgift.

* Gör uppgiften "[Bygg en databasdriven webbplats med PHP och SQL](uppgift/bygg-en-databasdriven-webbplats-med-php-och-sql)".


<!--
Det är två uppgifter som skall utföras och det finns en lektion som förbereder dig inför varje uppgift.

1. Gör uppgiften "[Bygg en databasdriven terminalklient med PHP och SQL](uppgift/bygg-en-databasdriven-terminalklient-med-php-och-sql)".
    * I lektionen "[Bygg en databasdriven terminalklient med PHP och SQL](./../forelasning/bygg-en-databasdriven-terminalklient-med-php-och-sql)" får du hjälp att komma igång med uppgiften. Lektionen spelas in.

1. Gör uppgiften "[Bygg en databasdriven webbplats med PHP och SQL](uppgift/bygg-en-databasdriven-webbplats-med-php-och-sql)".
    * I lektionen "[Bygg en databasdriven webbplats med PHP och SQL](./../forelasning/bygg-en-databasdriven-webbplats-med-php-och-sql)" får du hjälp att komma igång med uppgiften. Lektionen spelas in.
-->


<!--
1. Gör uppgiften "[Gör en multisida för att söka i en databas](uppgift/bygg-en-multisida-for-att-soka-i-en-databas)". Spara filerna under `me/kmom05/jetty`.

1. Gör uppgiften "[Lab 6: PHP PDO och databasen SQLite](uppgift/php-lab6-php-pdo-och-databasen-sqlite)". Spara filerna i katalogen `me/kmom06/lab6`.

1. Gör uppgiften "[Bygg ut din htmlphp me-sida till version 5](uppgift/htmlphp-projekt-5)". Spara filerna i katalogen `me/kmom05/me5`.

1. Gör uppgiften "[Bygg ut din me-sida till version 6](uppgift/bygg-ut-din-htmlphp-me-sida-till-version-6)". Spara filerna i katalogen `me/kmom06/me6`.

1. Lägg till en inloggning på din mesida och styr så att man måste vara inloggad för att kunna redigera (lägga till, uppdatera, radera) i databasen. Kursrepot innehåller ett exempel på login i `example/login` som du kan utgå ifrån. Använd doe:doe och admin:admin som användare och lösenord.

1. Flytta användare och lösenord från din `config.php` och lägg in dem i en ny tabell i databasen.

-->



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

Läs instruktionen om [hur du skall redovisa](./../redovisa).

För att avrunda detta kmom, se till att följande frågor besvaras i redovisningstexten.

* Hur kändes det att bygga en databasdriven webbplats?
* Var det svårt att komma in i hur du jobbar med SQL mot databasen och sedan SQL mot databasen via PHP eller kändes det som logiskt? Fanns det något som gav dig bekymmer?
* Vilken är din TIL för detta kmom?

Glöm inte att testa din inlämning med `dbwebb test kmom05`.

<!--
* Var det lätt att förstå SQL eller kändes det som en helt ny teknik?
* Var detta din första bekantskap med databaser och SQL, eller har du tidigare kunskaper som du kan relatera till?
* Hur gick det att utföra övningarna med enbart SQLite, var det något du fastnade på?
* Hur gick det med övningarna i PDO och SQLite, var det något som tog extra mycket tid?
* Gjorde du något extra, utöver det vanliga, i ditt arbete? Berätta gärna om det.

* Fick du hjälp av PHP PDO-artikeln och dess kod, eller skrev du mycket kod själv?
* Var det något som var extra svårt eller utmanande i kursmomentet?
* Nu när kursen närmar sig slutet, känns det som du har kommit in i HTML, CSS, PHP och SQL?
* Berätta kort om din syn på din me-sida, är du nöjd med den, eller ser du förbättringspotential?
* Gjorde du något extra, utöver det vanliga, i ditt arbete? Berätta gärna om det.
-->



Resurser & Referenser {#resurser}
---------------------------------

Här anges referenser och övriga resurser som kan användas för vidare studier i det som kursmomentet omfattar.



### SQLite {#sql}

Grundläggande resurser för SQLite äro följande.

* [SQLite](https://www.sqlite.org/index.html)
* [Exempel från SQL-manualen, SELECT](https://www.sqlite.org/lang_select.html)

Det finns flera klienter som man kan använda till SQLite.

* Desktop: [Kom igång med databasen SQLite med DB Browser för SQLite](kunskap/kom-igang-med-databasen-sqlite-med-db-browser-for-sqlite)
* Webb: [En webbaserad klient för SQLite, phpliteadmin](kunskap/en-webbaserad-klient-for-sqlite-phpliteadmin)



### W3Schools SQL {#w3sphp}

Webbplatsen W3Schools har en guide som är lättilgänglig när man vill komma igång med grunderna i SQL.

1. [SQL Tutorial](https://www.w3schools.com/sql/)
1. [PHP MySQL Database](https://www.w3schools.com/php/php_mysql_intro.asp). Även om guiden handlar om MySQL så är det samma interface i PHP, PHP PDO, och det används även till SQLite.



### PHP {#php}

Följande delar är relevanta för PHP.

1. [PHP Data Objects (PDO)](http://php.net/manual/en/intro.pdo.php). Kika översiktligt på det. Det handlar om ett gemensamt gränssnitt för att koppla sig mot flera olika databaser.



### Video för orientering {#video}

Titta på följande videor/filmer. Filmerna är tänkta att ge dig en liten orientering i det område som behandlas i kursmomentet.

* [Richard Hipp, SQLite main author - Two Weeks of Databases #DB2W](https://www.youtube.com/watch?v=2eaQzahCeh4) (57 min)
* [An Introduction to SQLite (by Richard Hipp)](https://www.youtube.com/watch?v=giAMt8Tj-84) (51 min)

Videorna ovan finner du även i spellistan "[ Om webbutveckling (HTML, CSS, PHP, SQL)](https://www.youtube.com/playlist?list=PLKtP9l5q3ce-Qp6DTS_2s6q-Br66ufoWc)".
