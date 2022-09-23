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

[WARNING]

**Kursutveckling pågår inför hösten 2022. Använd inte materialet innan denna rutan är borttagen.**

[/WARNING]

<!--
[WARNING]

**Om du är en early adopter så går det nu bra att börja jobba igenom detta kursmomentet, det saknas dock ännu en övning och själva uppgiften. Men det finns en övning och föreläsningar som man kan börja att jobba med.**

[/WARNING]
-->

PHP PDO, CRUD

När vi kan vår SQL så använder vi den kunskapen till att koppla samman PHP och databasen för att bygga en databasdriven webbplats. Via webbplatsen skall du kunna lägga till, uppdatera och ta bort innehåll. Detta är de vanliga funktionerna för create, read, update, delete och kallas även CRUD.


<!--
[FIGURE src="image/webtec/pdo/insert-filled.png?w=w3" caption="Formuläret är ifyllt med värden."]

[FIGURE src="image/webtec/pdo/search-delete.png?w=w3" caption="Klicka på ett id för att se mer, eller update/delete för att modifiera raden."]
-->


<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>

<!--stop-->



Läs & Studera  {#lasanvisningar}
---------------------------------

*(ca: 2-4 studietimmar)*

Här kan du på egen hand studera och förbereda dig inför övningar och uppgifter.



### Föreläsning {#flas}

Titta på följande föreläsningar. Föreläsningarna kan innehålla tips om läsanvisningar.

* [PHP PDO och databaser](./../forelasning/php-pdo-och-databaser). Vi tittar på PHP PDO som är ett sätt att koppla sig mot olika databaser via PHPs gränssnitt som heter PDO. Vi ser olika sätt att ställa frågor till databasen och hur man hanterar resultatet.

<!--
* <s>[Databasdriven webbplats med CRUD](./../forelasning/webbplats-med-crud)</s> utgår.
-->



### Litteratur  {#litteratur}

Läs enligt följande.

1. På sidan för föreläsningarna ovan så finns läsanvisningar som hjälper dig att studera SQL och databaser. Välj bland dem för att läsa på mer om begreppen.


<!--
### W3Schools SQL {#w3sphp}

Webbplatsen W3Schools har en guide som är lättilgänglig när man vill komma igång med grunderna i SQL.

1. [PHP MySQL Database](https://www.w3schools.com/php/php_mysql_intro.asp). Även om guiden handlar om MySQL så är det samma interface i PHP, PHP PDO, och det används även till SQLite.


### PHP {#php}

Följande delar är relevanta för PHP.

1. [PHP Data Objects (PDO)](http://php.net/manual/en/intro.pdo.php). Kika översiktligt på det. Det handlar om ett gemensamt gränssnitt för att koppla sig mot flera olika databaser.
-->



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

* [Kom igång med SQLite och PHP PDO (v2)](kunskap/kom-igang-med-sqlite-och-php-pdo-v2) <!-- OBS EJ INSPELAD -->

<!--
* PHP PDO med SQLite del II?
* En föreläsning om CRUD? Kanske kopplad till admin för användare?

* I lektionen "[Bygg en databasdriven webbplats med PHP och SQL](./../forelasning/bygg-en-databasdriven-webbplats-med-php-och-sql)" får du hjälp att komma igång med uppgiften. Lektionen spelas in.
-->



### Uppgifter {#uppgifter}

Följande uppgifter skall utföras och resultatet skall redovisas.

* Gör uppgiften "[Bygg en databasdriven webbplats med PHP och SQL](uppgift/bygg-en-databasdriven-webbplats-med-php-och-sql)".

<!--
Hantera användare i en databas? Inloggning. Session.

Användaren kan logga in, SELECT, färdig databas/tabell med admin/admin & doe/doe.

Användaren kan byta sitt eget lösenord med UPDATE?

Användaren kan radera sig själv från systemet DELETE?

Användaren kan registrera sig själv INSERT?


Vänta med CR UD till databaskursen kanske.

Lägg till notiser till kalendern (CRUD)

Reset

Extrauppgift inloggning, skapa användare?

1. Lägg till en inloggning på din mesida och styr så att man måste vara inloggad för att kunna redigera (lägga till, uppdatera, radera) i databasen. Kursrepot innehåller ett exempel på login i `example/login` som du kan utgå ifrån. Använd doe:doe och admin:admin som användare och lösenord.

-->



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i din redovisningstext.

* Hur kändes det att bygga en databasdriven webbplats?
* Var det svårt att komma in i hur du jobbar med SQL mot databasen och sedan SQL mot databasen via PHP eller kändes det som logiskt? Fanns det något som gav dig bekymmer?
* Vilken är din TIL för detta kmom?

Glöm inte att testa din inlämning med `dbwebb test kmom06`.
