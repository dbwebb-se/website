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

Form, Post, Session.


<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>

<!--stop-->


Läs & Studera  {#lasanvisningar}
---------------------------------

*(ca: 2-4 studietimmar)*

Här kan du på egen hand studera och förbereda dig inför övningar och uppgifter.



### Föreläsning {#flas}

Titta på följande föreläsningar. Föreläsningarna kan innehålla tips om läsanvisningar.

* [PHP PDO och databaser](./../forelasning/php-pdo-och-databaser)
<!--
* <s>[Databasdriven webbplats med CRUD](./../forelasning/webbplats-med-crud)</s> utgår.
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

* [Kom igång med SQLite och PHP PDO (v2)](kunskap/kom-igang-med-sqlite-och-php-pdo-v2)

<!--
* I lektionen "[Bygg en databasdriven webbplats med PHP och SQL](./../forelasning/bygg-en-databasdriven-webbplats-med-php-och-sql)" får du hjälp att komma igång med uppgiften. Lektionen spelas in.
-->



### Uppgifter {#uppgifter}

Följande uppgifter skall utföras och resultatet skall redovisas.

* Gör uppgiften "[Bygg en databasdriven webbplats med PHP och SQL](uppgift/bygg-en-databasdriven-webbplats-med-php-och-sql)".

<!--
Byt uppgift, kalender ish? med GET

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
