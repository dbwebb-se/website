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
Kmom06: PHP, PDO och SQL
==================================

Vi jobbar vidare med PHP PDO för att träna på begreppet CRUD som är Create, Read, Update och Delete av information i databasen via ett webbaserat gränssnitt med formulär.

Samtidigt som vi tränar på hanteringen med CRUD så implementerar vi en inloggning till vår webbplats. Vi skapar en användardatabas och en möjlighet att logga in på webbplatsen och redigera detaljer om sitt eget konto.

[FIGURE src=image/webtec/crud/navbar_login.png?w=w3 caption="Inloggning på en webbplats."]

<!--
[FIGURE src="image/webtec/pdo/insert-filled.png?w=w3" caption="Formuläret är ifyllt med värden."]

[FIGURE src="image/webtec/pdo/search-delete.png?w=w3" caption="Klicka på ett id för att se mer, eller update/delete för att modifiera raden."]
-->


<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>

<!--stop -->



Läs & Studera  {#lasanvisningar}
---------------------------------

*(ca: 2-4 studietimmar)*

Här kan du på egen hand studera och förbereda dig inför övningar och uppgifter.



### Föreläsning {#flas}

Det finns inga föreläsningar till detta kursmoment.

<!--
Titta på följande föreläsningar. Föreläsningarna kan innehålla tips om läsanvisningar.

* [PHP PDO och databaser](./../forelasning/php-pdo-och-databaser). Vi tittar på PHP PDO som är ett sätt att koppla sig mot olika databaser via PHPs gränssnitt som heter PDO. Vi ser olika sätt att ställa frågor till databasen och hur man hanterar resultatet.

* Dela upp PHP PDO i två föreläsningar, en kortare som kan ligga på kmom05 och en som kan ligga på 06.
* [Databasdriven webbplats med CRUD](./../forelasning/webbplats-med-crud).
* Eventuellt en extra föreläsning om säkerhet och prestanda i PHP
* Eventuellt föreläsning om vilka tekniker som används när man gör webbutveckling rent generellt
-->



### Litteratur  {#litteratur}

Läs enligt följande.

1. I övningen använder vi PHPs hantering för att skapa och verifiera lösenord. Du kan läsa översiktligt om "[Password Hashing](https://www.php.net/manual/en/book.password.php)" i manualen. 

1. Vill du studera med om PHP PDO så är manualen en bra källa, kika snabbt och översiktligt igenom stycket om "[PHP Data Objects (PDO)](http://php.net/manual/en/intro.pdo.php)".

1. Webbplatsen W3Schools har en guide som är lättilgänglig när man vill komma igång med grunderna i SQL.

    * [PHP MySQL Database](https://www.w3schools.com/php/php_mysql_intro.asp). Även om guiden handlar om MySQL så är det samma interface i PHP, PHP PDO, och det används även till SQLite.



### Video för orientering {#video}

_(Detta är samma videor som föreslogs i kmom05, du får en ny möjlighet att kika på dem om du inte gjorde det då...)_

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

* [Kom igång med CRUD i databasen SQLite med PHP PDO](kunskap/kom-igang-med-crud-i-databasen-sqlite-med-php-pdo) visar hur PHP PDO kan användas för att jobba med INSERT, UPDATE och DELETE mot en SQLite -databas. Spara din övningskod i katalogen `me/kmom06/crud` eller jobba direkt under din `me/report`. Som ett tips så är det nog enklast att jobba mot koden i `me/report` då du redan har stöd för databasen där samt ytterligare stöd för flash-meddelanden och sessioner.



### Uppgifter {#uppgifter}

Följande uppgifter skall utföras och resultatet skall redovisas.

* Gör uppgiften "[Bygg inloggning till webbplatsen med PHP PDO och CRUD mot SQLite](uppgift/bygg-inloggning-till-webbplatsen-med-php-pdo-och-crud-mot-sqlite)". Spara din kod i `me/report`.

<!--
* Bestäm sidor som måste finnas, bra för validering och rättning.
* Tydlig att inloggning skall vara i den befintliga wbbplatsen layout.
-->

Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i din redovisningstext.

* Berätta hur det var att jobba med konceptet kring CRUD.
* Berätta hur det var att jobba med inloggning i webbplatsen, vad tänker du om det?
* Berätta om hur nöjd du är med den koden du skapat i din `me/report` och ser du någon förbättringspotential?
* Vilken är din TIL för detta kmom?

Glöm inte att testa din inlämning med `dbwebb test kmom06`.
