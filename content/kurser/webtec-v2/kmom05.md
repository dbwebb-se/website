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
    "2022-09-23": "(A, mos) Släppt till early adopter."
...
Kmom05: SQL och SQLite
==================================

Låt oss titta på databaser och hur de kan kopplas till en webbplats för att göra ett embryo till en sökmotor.

Vi skall använda databasen SQLite som är en filbaserad databas. En filbaserad databas förenklar hanteringen då allt är samlat i en fil och det finns inget behov av att konfigurera användare eller behörigheter.

Till databasen SQLite installerar vi ett klientprogram som kan användas för att prata med databasen och vi installerar PHP PDO som gör att vi kan koppla PHP-kod till databasen. <!-- Vi prövar olika klienter, en variant för desktop och en terminalbaserad. -->

I en relationsdatabas som SQLite pratar vi SQL med databasen. Vi skriver SQL uttryck för att skapa tabeller som utgör databasens schema (struktur). Vi använder även SQL för att skapa rapporter från databasens innehåll samt redigera databasens innehåll.

Slutligen skapar vi en sökmotor som kan söka i en befintlig databas och presentera resultatet i en webbsida.

<!--more-->

Så här kan det se ut när du är klar med kursmomentet.

[FIGURE src="image/webtec/pdo/search-result.png?w=w3" caption="Resultatet från sökningen presenteras."]



<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>

<!--st op-->



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

<!--
* Del I av PHP PDO föreläsning, grunderna samt rapporter till sökformulär
* PHP PDO med SQLite del I?
-->



### Litteratur  {#litteratur}

Läs enligt följande.

1. På sidan för föreläsningarna ovan så finns läsanvisningar som hjälper dig att studera SQL och databaser. Välj bland dem för att läsa på mer om begreppen.

1. I kursboken Webbutveckling med PHP och MySQL är följande kapitel relevanta att läsa igenom översiktligt.
    * Kap 8 Databaser. Kapitlet handlar om databasen MySQL men är ändå relevant och ger en viss introduktion till databaser och SQL tillsammans med PHP.



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

* [Kom igång med SQL och databasen SQLite med terminalklienten sqlite3](kunskap/kom-igang-med-sql-och-databasen-sqlite-med-terminalklienten-sqlite3). I övningen får du lära dig grunderna i databasen SQLite tillsammans med terminalklienten sqlite3 och du får skriva grundläggande SQL-konstruktioner för att jobba mot en databas. Spara din övningskod i katalogen `me/kmom05/sqlite`.

* [Kom igång med PHP PDO och databasen SQLite](kunskap/kom-igang-med-php-pdo-och-databasen-sqlite) visar hur PHP PDO används för att koppla sig till databasen SQLite och ställa frågor och visa upp resultatet i en webbsida. Spara din övningskod i katalogen `me/kmom05/pdo` eller jobba direkt under din `me/report`.

<!--
* Mer fokus på att använda befintlig databas och mindre på att bygga en egen databas?

* Sökformulär mot databasen?

    * Dels visa sökresultatet likt Google
    * Visa namn i en tabell
    * Visa detaljer om ett namn ?name=Mikael
    * Detaljer om datum ?date=29/9
-->



### Uppgifter {#uppgifter}

Följande uppgifter skall utföras och resultatet skall redovisas.

* Gör uppgiften "[Bygg en sökmotor med databasen SQLite och PHP PDO](uppgift/bygg-en-sokmotor-med-databasen-sqlite-och-php-pdo)". Spara din kod i `me/report`.

<!--
Sök på namn.
Sök på datum.
Sök mot flera tabeller.

Namndatabasen, en "sökmotor".
Månens faser?
Helgdagar?
Koppla till kalendern och lägg in namnsdag på varje dag.

* Lägg tillbaka PHP-guiden och lägg till stycke om databas/PDO för att komplettera artikeln.

* Använd funktioner för att bygga på kmom04.

Inför labbarna (kmom04-06) om det känns som det behövs och om det känns att det finns utrymme (koppla till guiden?)

1. Gör uppgiften "[PHP lab 5: utforska inbyggda funktioner](uppgift/php-lab5-utforska-inbyggda-funktioner)". Spara filerna i katalogen `me/kmom05/lab5`.


Extrauppgift minnessaker från fil till databasen.

1. Gör laborationen "[SQL lab 1, introduktion till SQL](uppgift/sql-lab-1-introduktion-till-sql)" som låter dig träna på SQL kommandon.

1. Gör uppgiften "[Gör en multisida för att söka i en databas](uppgift/bygg-en-multisida-for-att-soka-i-en-databas)". Spara filerna under `me/kmom05/jetty`.

1. Gör uppgiften "[Lab 6: PHP PDO och databasen SQLite](uppgift/php-lab6-php-pdo-och-databasen-sqlite)". Spara filerna i katalogen `me/kmom06/lab6`.

1. Gör uppgiften "[Bygg ut din htmlphp me-sida till version 5](uppgift/htmlphp-projekt-5)". Spara filerna i katalogen `me/kmom05/me5`.

1. Gör uppgiften "[Bygg ut din me-sida till version 6](uppgift/bygg-ut-din-htmlphp-me-sida-till-version-6)". Spara filerna i katalogen `me/kmom06/me6`.

1. Lägg till en inloggning på din mesida och styr så att man måste vara inloggad för att kunna redigera (lägga till, uppdatera, radera) i databasen. Kursrepot innehåller ett exempel på login i `example/login` som du kan utgå ifrån. Använd doe:doe och admin:admin som användare och lösenord.

1. Flytta användare och lösenord från din `config.php` och lägg in dem i en ny tabell i databasen.

-->



<!--
### Överkurs och extra uppgifter {#extra}

Här följer extra uppgifter som du kan utföra för att lära dig mer, om du har tid, lust och energi.

-->

<!--
* Koppla kalender till todo, troligen för svårt?

* Sök namn

* Login, gör ett komplett loginskript/hantering
* Extra övning som visa inloggninig, eller lägg som extrauppgift
* Inloggning av användare med lösenord.
-->




Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i din redovisningstext.

* Var det lätt att förstå SQL eller kändes det som en helt ny teknik?
* Var detta din första bekantskap med databaser och SQL, eller har du tidigare kunskaper som du kan relatera till?
* Hur gick det att utföra övningen med SQLite och SQL, var det något du fastnade på?
* Hur gick det med övningarna i PHP PDO och SQLite/SQL, var det något som kändes utmanade?
* Berätta om hur du löste uppgiften och hur nöjd du är med resultatet. Berätta även om du försökte på någon av extrauppgifterna.
* Vilken är din TIL för detta kmom?

Glöm inte att testa din inlämning med `dbwebb test kmom05`.
