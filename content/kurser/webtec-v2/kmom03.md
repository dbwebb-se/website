---
views:
    flash:
        region: flash
        template: default/image
        data:
            src: "image/webtec/logo-php.png"
author:
    - mos
revision:
    "2022-06-28": "(A, mos) Första utgåvan."
...
Kmom03: PHP
==================================

[WARNING]

**Kursutveckling pågår inför hösten 2022. Använd inte materialet innan denna rutan är borttagen.**

[/WARNING]

Bygg fler sidor till webbplatsen och kom igång med enklare konstruktioner i PHP.


<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



<!--
Labbmiljö  {#labbmiljo}
---------------------------------

*(ca: 2-4 studietimmar)*

Komplettera din labbmiljö med följande.

* [Lägg till PHP i din PATH](labbmiljo/php-i-pathen).
* [Installera Composer för pakethantering med PHP](labbmiljo/composer).

-->



Läs & Studera  {#lasanvisningar}
---------------------------------

*(ca: 2-4 studietimmar)*

Här kan du på egen hand studera och förbereda dig inför övningar och uppgifter.



### Föreläsning {#flas}

Titta på följande föreläsningar. Föreläsningarna kan innehålla tips om läsanvisningar.

* [PHP introduktion](./../forelasning/php-introduktion)
* PHP grundläggande konstruktioner och variabler
* [PHP sidkontroller och vyer](./../forelasning/php-sidkontroller-vyer)?

<!--
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


<!--
* Programmera något med PHP, som en övningssida i report?

table


 Låt artikeln innehålla ett par övningar där man också kan se ett facit.

Olika varianter på kalender

* Övning om olika formulärelement.

* I lektionen "[Programmera med PHP](./../forelasning/programmera-med-php)" får du hjälp att komma igång med uppgiften. Lektionen spelas in.
-->



### Uppgifter {#uppgifter}

Följande uppgifter skall utföras och resultatet skall redovisas.

* Gör uppgiften "[Programmera med PHP](uppgift/programmera-med-php)".

<!--
Byt uppgift, kalender ish? med GET

Formulär, till kalender, GET?
-->



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i din redovisningstext.

* Hur är din uppfattning om programmeringsspråket PHP så här långt?
* Är du bekväm med att använda GET, POST, SESSION och COOKIE i din webbutveckling?
* Hur kändes det att bygga webbplatsen med sidkontroller och vyer?
* Vilken är din TIL för detta kmom?

Glöm inte att testa din inlämning med `dbwebb test kmom03`.



<!--stop-->

Vi lär oss programmeringsspråket PHP och hur man programmerar i det via vanliga programmeringskonstruktioner som variabler, if-satser, loopar, datastrukturer som arrayer och vi organiserar koden i filer och funktioner.

När vi kan grunderna går vi vidare och använder PHP för att bygga en webbplats. PHP är ett server-side språk och det är på webbserverns sida som PHP hjälper oss att skapa dynamik när vi genererar webbsidorna. Vi berör olika koncept som HTML formulär, GET/POST och SESSION/COOKIE som ofta används när man utvecklar webbplatser.

Vi försöker skapa en god katalogstruktur som är stödjande när vi utvecklar allt större webbplatser. Vi försöker återanvända kodsegment så att vi inte behöver duplicera koden.

<!--more-->

<!--
[FIGURE src=image/snapht18/multipage.png?w=w3 caption="En multisida i PHP, navigeringsmeny i vänsterkanten och färgad i pastellfärger."]
-->

När du är klar med detta kursmoment så har du grundläggande kunskap i hur man programmerar med PHP och grunderna för hur man bygger och driftsätter en dynamisk webbplats med PHP.

<small><i>Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.</i></small>

<!--
Kalender, månadens babe
-->

Studieplan & Upplägg {#studieplan}
---------------------------------

Följande är förslag till en grov och övergripande studieplan för att genomföra kursmomentet. Läs igenom hela dokumentet, innan du bestämmer din plan, det kan finnas mer aktiviteter och lärmoment som är relevanta att utföra inom ramen för kursmomentet.

<small><i>Kursmomentet omfattar cirka **20 + 20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke.</i></small>



### Vecka 1: PHP {#v1}

Börja med att komplettera din labbmiljön för PHP. Dubbelkolla även att du kör version 8.0 (eller högre) av PHP.

* [Lägg till PHP i din PATH](labbmiljo/php-i-pathen).
* [Installera Composer för pakethantering med PHP](labbmiljo/composer).

Titta på följande föreläsningar. Föreläsningarna kan innehålla ytterligare läsanvisningar.

* [PHP introduktion](./../forelasning/php-introduktion)
* [PHP och arrayer](./../forelasning/php-arrayer)
* [PHP och funktioner](./../forelasning/php-funktioner)

Delta i lektionen som förbereder dig för veckans uppgift.

* I lektionen "[Programmera med PHP](./../forelasning/programmera-med-php)" får du hjälp att komma igång med uppgiften. Lektionen spelas in.

Genomför veckans uppgift.

* Gör uppgiften "[Programmera med PHP](uppgift/programmera-med-php)".

<!--
Artikel om utvecklingsmiljö med phpcs, phpcbf, phpmd?

Debugbar
http://phpdebugbar.com/

Validator:
https://github.com/phan/phan/

1. Läs igenom följande sektioner i guiden "[Kom igång med programmering i PHP](guide/kom-igang-med-programmering-i-php)".
    * [Egenskapade funktioner](guide/kom-igang-med-programmering-i-php/egenskapade-funktioner)

1. Gör uppgiften "[PHP lab 1: uttryck, datatyper och variabler](uppgift/php-lab1-uttryck-datatyper-och-variabler)". Spara alla filerna i katalogen `me/kmom01/lab1`.

1. Gör uppgiften "[PHP lab 2: villkor, loopar och inbyggda funktioner](uppgift/php-lab2-villkor-loopar-och-inbyggda-funktioner)". Spara alla filerna i katalogen `me/kmom02/lab2`.

1. Gör uppgiften "[PHP lab 3: Arrayer](uppgift/php-lab3-arrayer)". Spara alla filerna i katalogen `me/kmom03/lab3`.

1. Gör uppgiften "[PHP lab 4: skapa egna funktioner](uppgift/php-lab4-skapa-egna-funktioner)". Spara alla filerna i katalogen `me/kmom04/lab4`.

1. Gör uppgiften "[PHP lab 5: utforska inbyggda funktioner](uppgift/php-lab5-utforska-inbyggda-funktioner)". Spara filerna i katalogen `me/kmom05/lab5`.

-->



### Vecka 2: Webbplats med PHP {#v2}

<s>Titta på följande föreläsningar. Föreläsningarna kan innehålla ytterligare läsanvisningar.</s>

* <s>[PHP sidkontroller och vyer](./../forelasning/php-sidkontroller-vyer)</s>
* <s>[PHP och HTML formulär](./../forelasning/php-html-formular)</s>
* <s>[PHP, cookies och sessioner](./../forelasning/php-cookie-session)</s>

Ovan föreläsningar ersätts av en längre lektion.

Delta i lektionen som förbereder dig för veckans uppgift. Lektionen kommer även täcka det som ovan föreläsningar var tänkta att täcka.

* I lektionen "[Bygg en webbplats med PHP](./../forelasning/bygg-en-webbplats-med-php)" får du hjälp att komma igång med uppgiften. Lektionen spelas in.

Genomför veckans uppgift.

* Gör uppgiften "[Bygg en webbplats med PHP](uppgift/bygg-en-webbplats-med-php)".


<!--
1. Läs igenom följande sektioner i guiden "[Kom igång med programmering i PHP](guide/kom-igang-med-programmering-i-php)".
    * [HTML formulär](guide/kom-igang-med-programmering-i-php/html-formular)
    * [Sessioner](guide/kom-igang-med-programmering-i-php/sessioner)

1. Läs igenom följande sektion i guiden "[Kom igång med HTML och CSS](guide/kom-igang-med-html-och-css)".
    * [Formular](guide/kom-igang-med-html-och-css/formular)

1. Se en [översikt av olika formulärelement](forms), det räcker att du bekantar dig med hur de ser ut. Du kan även testa dem hur de fungerar.

1. Gör uppgiften "[Bygg en multisida och testa arrayer (v2)](uppgift/bygg-en-multisida-och-testa-arrayer-v2)". Spara filerna i katalogen `me/kmom03/multi`.

1. Gör uppgiften "[Bygg ut din me-sida till version 3 (v2)](uppgift/bygg-ut-din-htmlphp-me-sida-till-version-3-v2)". Spara filerna i katalogen `me/kmom03/me3`.

Bygg formulär.
https://jonkopingenergi.se/privat/fiber/serviceavgift (använd även till databasen)

1. Jobba igenom övningen "[Gör en me-sida med HTML, CSS och PHP](kunskap/skapa-en-webbsida-med-html-css-och-php)". Övningen innehåller grunderna i HTML, CSS och PHP och visar hur du bygger upp en enkel webbplats. Filerna du jobbar med kan du spara i `me/kmom01/me`.

1. Jobba igenom övningen "[Gör en me-sida med HTML, CSS och PHP - steg 2](kunskap/skapa-en-webbsida-med-html-css-och-php-steg-2)". Övningen bygger vidare på grunderna i HTML, CSS och PHP och visar hur du bygger ut din webbplats med några vanliga bra-att-ha konstruktioner.

1. Jobba igenom övningen "[Bygg en multisida med PHP (v2)](kunskap/bygg-en-multisida-med-php-v2)". Spara filerna i katalogen `me/kmom03/multi`, så kan du använda dem i den kommande uppgiften.

1. Jobba igenom övningen "[Att bygga en styleväljare till sin webbplats](kunskap/att-bygga-en-stylevaljare-till-sin-webbplats)".

https://arkiv.dbwebb.se/kod-exempel/business-card-generator/

1. Gör uppgiften "[Bygg ut din me-sida till version 4 (v2)](uppgift/bygg-ut-din-me-sida-till-version-4-v2)". Spara filerna i katalogen `me/kmom04/me4`.

1. Läs igenom följande sektion i guiden "[Kom igång med HTML och CSS](guide/kom-igang-med-html-och-css)".
    * [Tabeller](guide/kom-igang-med-html-och-css/tabeller)

-->



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

Läs instruktionen om [hur du skall redovisa](./../redovisa).

För att avrunda detta kmom, se till att följande frågor besvaras i redovisningstexten.

* Hur är din uppfattning om programmeringsspråket PHP så här långt?
* Är du bekväm med att använda GET, POST, SESSION och COOKIE i din webbutveckling?
* Hur kändes det att bygga webbplatsen med sidkontroller och vyer?
* Vilken är din TIL för detta kmom?

Glöm inte att testa din inlämning med `dbwebb test kmom03`.



Resurser & Referenser {#resurser}
---------------------------------

Här anges referenser och övriga resurser som kan användas för vidare studier i det som kursmomentet omfattar.



### PHP {#php}

Grundläggande resurser för PHP äro följande.

* [Webbplatsen för PHP](http://php.net/)
* [Manualen för PHP](http://php.net/manual/en/)

Det fungerar bra att googla sig fram till relevant sida/funktion i manualen, pröva "php echo" och min rekommendation är att du väljer PHP referensmanualen som landningssida, det blir bäst i längden.



### W3Schools PHP {#w3sphp}

Webbplatsen W3Schools har en guide som är lättilgänglig när man vill komma igång med grunderna i PHP.

* [PHP Tutorial](https://www.w3schools.com/php/)



### Video för orientering {#video}

Titta på följande videor/filmer. Filmerna är tänkta att ge dig en liten orientering i det område som behandlas i kursmomentet.

* [The GAMECHANGING features of PHP 8!](https://www.youtube.com/watch?v=f_cwnwaEwaY) (13 min)
* [Rasmus Lerdorf – 25 years of PHP](https://www.youtube.com/watch?v=Qa_xVjTiOUw) (55 min)

Videorna ovan finner du även i spellistan "[ Om webbutveckling (HTML, CSS, PHP, SQL)](https://www.youtube.com/playlist?list=PLKtP9l5q3ce-Qp6DTS_2s6q-Br66ufoWc)".



<!--
### PHP Guide {#phpguide}

Läs igenom följande sektion i guiden "[Kom igång med programmering i PHP](guide/kom-igang-med-programmering-i-php)". Det ger dig en grundläggande introduktion i att hantera PHP och hjälper dig inför de uppgifter du skall göra.

* [Grunder och struktur](guide/kom-igang-med-programmering-i-php/grunder-och-struktur)
* [Datastrukturer](guide/kom-igang-med-programmering-i-php/datastrukturer)
* [Värden, variabler och typer](guide/kom-igang-med-programmering-i-php/varden-variabler-och-typer)
* [Kontrollstrukturer](guide/kom-igang-med-programmering-i-php/kontrollstrukturer)
* [Sidkontroller](guide/kom-igang-med-programmering-i-php/sidkontroller)



### PHP videoserie {#phpvideo}

Det finns en videoserie som bygger på innehållet i guiden, kika gärna på den som ett komplement till guiden.

* [Kom igång med programmering i PHP (2019)](https://www.youtube.com/playlist?list=PLKtP9l5q3ce-oIvGdREyAH-Oq_DQdqYW1)

-->
