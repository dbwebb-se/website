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

<!--


[WARNING]

**Om du är en early adopter så går det nu bra att jobba igenom detta kursmomentet, det sista som uppdaterades var att uppgiften bytte namn och skalades ned i omfattning.**

[/WARNING]

-->

Låt oss titta på databaser. Vi skall använda databasen SQLite som är en filbaserad databas. En filbaserad databas förenklar hanteringen eftersom databasen ligger i en enda fil och det finns inga användare eller behörigheter att konfigurera.

Till databasen SQLite behövs klientprogram som kan användas för att prata med databasen. <!-- Vi prövar olika klienter, en variant för desktop och en terminalbaserad. -->

I en databas, en relationsdatabas som SQLite, så pratar vi SQL med databasen. Vi skriver SQL uttryck för att skapa tabeller och för att lägga till, uppdatera, visa och radera data från databasen.

<!--more-->

<!--
Så här kan det se ut när du är klar med kursmomentet.

[FIGURE src="image/webtec/pdo/search-result.png?w=w3" caption="Resultatet från sökningen presenteras."]

[FIGURE src="image/webtec/pdo/insert-filled.png?w=w3" caption="Formuläret är ifyllt med värden."]

[FIGURE src="image/webtec/pdo/search-delete.png?w=w3" caption="Klicka på ett id för att se mer, eller update/delete för att modifiera raden."]
-->




<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>

<!--stop-->



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

* [SQLite, en filbaserad databas](./../forelasning/sqlite-en-filbaserad-databas), en introduktion till databasen SQLite, dess användningsområden, features och några av dess klienter som går att använda för att jobba mot databasen.
* [SQL med SQLite](./../forelasning/sql-med-sqlite), grunderna i SQL med databasen SQLite, hur man skapar databasens schema och hur man manipulerar innehållet i tabellerna samt hur man skapar rapporter från databasen.



### Litteratur  {#litteratur}

Läs enligt följande.

1. På sidan för föreläsningarna ovan så finns läsanvisningar som hjälper dig att studera SQL och databaser. Välj bland dem för att läsa på mer om begreppen.

1. I kursboken Webbutveckling med PHP och MySQL är följande kapitel relevanta att läsa igenom översiktligt.
    * Kap 8 Databaser. Kapitlet handlar om databasen MySQL men är ändå relevant och ger en god introduktion till databaser och SQL.



### Video för orientering {#video}

Titta på följande videor/filmer. Filmerna är tänkta att ge dig en liten orientering i det område som behandlas i kursmomentet.

* [Richard Hipp, SQLite main author - Two Weeks of Databases #DB2W](https://www.youtube.com/watch?v=2eaQzahCeh4) (57 min)
* [An Introduction to SQLite (by Richard Hipp)](https://www.youtube.com/watch?v=giAMt8Tj-84) (51 min)

Videorna ovan finner du även i spellistan "[ Om webbutveckling (HTML, CSS, PHP, SQL)](https://www.youtube.com/playlist?list=PLKtP9l5q3ce-Qp6DTS_2s6q-Br66ufoWc)".



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 8-12 studietimmar)*

Övningar är träning inför uppgifterna, det är ofta klokt att jobba igenom övningarna. Uppgifter skall utföras och redovisas.

Jobba gärna i grupp med dina studiekompisar, men skriv alltid din egen kod för hand. Även om du tjuvkikar för att hitta bra lösningar så är det en stor skillnad att skriva koden själv jämfört med att kopiera från någon.



### Övningar {#ovningar}

Jobba igenom övningarna, de förbereder dig inför uppgifterna.

* [Kom igång med SQL och databasen SQLite med terminalklienten sqlite3](kunskap/kom-igang-med-sql-och-databasen-sqlite-med-terminalklienten-sqlite3). När du jobbar igenom guiden kan du spara din kod i katalogen `me/kmom05/sqlite`.

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

Namndatabasen, en "sökmotor".
Månens faser?
Helgdagar?
Koppla till kalendern och lägg in namnsdag på varje dag.

Extrauppgift minnessaker från fil till databasen.

1. Gör laborationen "[SQL lab 1, introduktion till SQL](uppgift/sql-lab-1-introduktion-till-sql)" som låter dig träna på SQL kommandon.




1. Gör uppgiften "[Gör en multisida för att söka i en databas](uppgift/bygg-en-multisida-for-att-soka-i-en-databas)". Spara filerna under `me/kmom05/jetty`.

1. Gör uppgiften "[Lab 6: PHP PDO och databasen SQLite](uppgift/php-lab6-php-pdo-och-databasen-sqlite)". Spara filerna i katalogen `me/kmom06/lab6`.

1. Gör uppgiften "[Bygg ut din htmlphp me-sida till version 5](uppgift/htmlphp-projekt-5)". Spara filerna i katalogen `me/kmom05/me5`.

1. Gör uppgiften "[Bygg ut din me-sida till version 6](uppgift/bygg-ut-din-htmlphp-me-sida-till-version-6)". Spara filerna i katalogen `me/kmom06/me6`.

1. Lägg till en inloggning på din mesida och styr så att man måste vara inloggad för att kunna redigera (lägga till, uppdatera, radera) i databasen. Kursrepot innehåller ett exempel på login i `example/login` som du kan utgå ifrån. Använd doe:doe och admin:admin som användare och lösenord.

1. Flytta användare och lösenord från din `config.php` och lägg in dem i en ny tabell i databasen.

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



<!--
* Var det lätt att förstå SQL eller kändes det som en helt ny teknik?
* Var detta din första bekantskap med databaser och SQL, eller har du tidigare kunskaper som du kan relatera till?
* Hur gick det att utföra övningarna med enbart SQLite, var det något du fastnade på?
* Hur gick det med övningarna i PDO och SQLite, var det något som tog extra mycket tid?
* Var det något som var extra svårt eller utmanande i kursmomentet?
-->
