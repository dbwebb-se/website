---
author:
    - mos
revision:
    "2018-09-24": (F, mos) Nytt dokument inför v3.
    "2017-06-15": (E, mos) Uppdaterad labbserie.
    "2016-11-04": (D, mos) Lade till extrauppgift om login.
    "2016-08-31": (C, mos) Lade till rätt videoserie från youtube.
    "2016-02-22": (B, mos) Bort med not om kursutveckling och länk till version 1.
    "2015-08-27": (A, mos) Första utgåvan för htmlphp version 2 av kursen.
...
Kmom06: PHP, PDO och SQL
==================================

Detta moment handlar om att bygga en databasdriven webbplats med hjälp av databasen SQLite och och PHP. Du skall skapa en enklare webbplats där du har en databas som grund för att spara information. Via webbplatsen kan du lägga till saker till databasen, du kan redigera dem och du kan ta bort dem samt visa dem.

Det är de vanliga funktionerna för create, read, update, delete och kallas även CRUD.

Momentet bygger vidare på det du gjorde i föregående kursmoment.


<!--more-->

[FIGURE src=/image/snapht15/htmlphp-kmom05-search.png?w=w3 caption="Bygg vidare på din sökmotor för dinosaurier (eller vad du nu valde)."]

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Läs & Studera  {#lasanvisningar}
---------------------------------

*(ca: 0-2 studietimmar)*


### HTML & CSS {#htmlcss}

Det finns inga läsanvisningar.



### PHP {#php}

Läs följande för att bekanta dig med teknikerna.

1. I PHP-manualen finns ett stycke om [PHP Data Objects (PDO)](http://php.net/manual/en/intro.pdo.php). Kika översiktligt på det.



### Video  {#video}

Det finns en samling videor som används i olika omfattning under kursens gång, [du finner dem på Youtube](https://www.youtube.com/channel/UCxX3bcidovf5MDLeXMcbDyg/playlists?view=50&shelf_id=9&sort=dd).



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 12-16 studietimmar)*



### Övningar {#ovningar}

Genomför följande övningar.

1. Jobba igenom artikeln "[Kom igång med SQLite och PHP PDO](kunskap/kom-igang-med-sqlite-och-php-pdo)". Du påbörjade artikeln i förra kursmomentet, nu kan du repetera och avsluta den.



### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[Lab 6: PHP PDO och databasen SQLite](uppgift/php-lab6-php-pdo-och-databasen-sqlite)". Spara filerna i katalogen `me/kmom06/lab6`.

1. Gör uppgiften "[Bygg ut din me-sida till version 6](uppgift/bygg-ut-din-htmlphp-me-sida-till-version-6)". Spara filerna i katalogen `me/kmom06/me6`.



### Extra {#extra}

Gör följande extrauppgifter om du har tid och lust.

1. Lägg till en inloggning på din mesida och styr så att man måste vara inloggad för att kunna redigera (lägga till, uppdatera, radera) i databasen. Kursrepot innehåller ett exempel på login i `example/login` som du kan utgå ifrån. Använd doe:doe och admin:admin som användare och lösenord.

1. Flytta användare och lösenord från din `config.php` och lägg in dem i en ny tabell i databasen.



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

* Fick du hjälp av PHP PDO-artikeln och dess kod, eller skrev du mycket kod själv?
* Var det något som var extra svårt eller utmanande i kursmomentet?
* Nu när kursen närmar sig slutet, känns det som du har kommit in i HTML, CSS, PHP och SQL?
* Berätta kort om din syn på din me-sida, är du nöjd med den, eller ser du förbättringspotential?
* Gjorde du något extra, utöver det vanliga, i ditt arbete? Berätta gärna om det.
* Vilken är din TIL för detta kmom?
