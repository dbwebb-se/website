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
kmom04: PHP datastrukturer
==================================

[WARNING]

**Kursutveckling pågår inför hösten 2022. Använd inte materialet innan denna rutan är borttagen.**

[/WARNING]

Array, Form, Post, Session.

Bygg ett galleri och en månadskalender.


<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>


<!--stop-->

Läs & Studera  {#lasanvisningar}
---------------------------------

*(ca: 2-4 studietimmar)*

Här kan du på egen hand studera och förbereda dig inför övningar och uppgifter.



### Föreläsning {#flas}

Titta på följande föreläsningar. Föreläsningarna kan innehålla tips om läsanvisningar.

* [PHP och arrayer](./../forelasning/php-arrayer). Lär dig hantera datastrukturen arrayer i PHP.

* [PHP och funktioner](./../forelasning/php-funktioner). Lär dig strukturera din kod genom att dela upp i olika filer och funktioner. Föreläsningen går igenom hur man skapar sina egna funktioner.


<!--
Finns ej

* Superglobals
* [PHP och HTML formulär](./../forelasning/php-html-formular)
* [PHP, cookies och sessioner](./../forelasning/php-cookie-session)

Ovan föreläsningar ersätts av en längre lektion.

* Om innehåll i webbplatsen? (markdown kanske, som en filbaserad databas)
* PHP läsa från lokala filer, prepare för databas
-->



### Litteratur  {#litteratur}

Läs enligt följande.

1. På sidan för föreläsningarna ovan så finns läsanvisningar som hjälper dig att studera datastrukturer i programmeringsspråket PHP. Välj bland dem för att läsa på med om begreppen.

<!--
* Jobba igenom PHP-guiden och börja använda den igen?

    * Arrayer
    * Superglobals
    * HTML form
    * Funktioner

1. Läs igenom följande sektioner i guiden "[Kom igång med programmering i PHP](guide/kom-igang-med-programmering-i-php)".
    * [Egenskapade funktioner](guide/kom-igang-med-programmering-i-php/egenskapade-funktioner)
-->



### Video för orientering {#video}

_(Detta är samma videor som föreslogs i kmom03, du får en ny möjlighet att kika på dem om du inte gjorde det då...)_

Titta på följande videor/filmer, om du finner dem intressanta. Filmerna är tänkta att ge dig en liten orientering i det område som behandlas i kursmomentet.

* [The GAMECHANGING features of PHP 8!](https://www.youtube.com/watch?v=f_cwnwaEwaY) (13 min)
* [Rasmus Lerdorf – 25 years of PHP](https://www.youtube.com/watch?v=Qa_xVjTiOUw) (55 min)

Videorna ovan finner du även i spellistan "[ Om webbutveckling (HTML, CSS, PHP, SQL)](https://www.youtube.com/playlist?list=PLKtP9l5q3ce-Qp6DTS_2s6q-Br66ufoWc)".



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 8-12 studietimmar)*

Övningar är träning inför uppgifterna, det är ofta klokt att jobba igenom övningarna. Uppgifter skall utföras och redovisas.

Jobba gärna i grupp med dina studiekompisar, men skriv alltid din egen kod för hand. Även om du tjuvkikar för att hitta bra lösningar så är det en stor skillnad att skriva koden själv jämfört med att kopiera från någon.



### Övningar {#ovningar}

Jobba igenom övningarna, de förbereder dig inför uppgifterna.

1. Jobba igenom övningen "[Programmera din webbsida med PHP datastrukturer](kunskap/programmera-din-webbsida-med-php-datastrukturer)" som hjälper dig att komma igång med PHP och datastrukturer som arrayer, funktioner och superglobala arrayer som POST och SESSION. Spara koden du skriver under `me/report`, om du skriver extra test- och exempelprogram kan du spara dem under `me/kmom04`.

<!--
* Arrayer
* (Funktioner)
* POST med processingsida
* Session
* galleri, next, prev
* delar av inloggning

* Bygg formulär. (som övning?)
https://jonkopingenergi.se/privat/fiber/serviceavgift (använd även till databasen)


* Programmera något med PHP, som en övningssida i report?

* I lektionen "[Bygg en webbplats med PHP](./../forelasning/bygg-en-webbplats-med-php)" får du hjälp att komma igång med uppgiften. Lektionen spelas in.
-->



### Uppgifter {#uppgifter}

Följande uppgifter skall utföras och resultatet skall redovisas.

Bygg ett galleri och en månadskalender med PHP datastrukturer

1. Gör uppgiften "[Bygg ett galleri och en månadskalender med PHP datastrukturer](uppgift/bygg-ett-galleri-och-en-manadskalender-med-php-datastrukturer)" och spara alla filer under `me/report`.

<!--
Kalender, månadens babe

Kalender samt bytta månad med länk.

Galleri med bilder, klicka runt, läsa av filer i katalog. Next

Session, formulär med POST

Inloggning av användare med lösenord.

Som uppgift?
https://arkiv.dbwebb.se/kod-exempel/business-card-generator/

1. Jobba igenom övningen "[Att bygga en styleväljare till sin webbplats](kunskap/att-bygga-en-stylevaljare-till-sin-webbplats)".


Inför labbarna (kmom04-06) om det känns som det behövs och om det känns att det finns utrymme (koppla till guiden?)

1. Gör uppgiften "[PHP lab 3: Arrayer](uppgift/php-lab3-arrayer)". Spara alla filerna i katalogen `me/kmom03/lab3`.

1. Gör uppgiften "[PHP lab 4: skapa egna funktioner](uppgift/php-lab4-skapa-egna-funktioner)". Spara alla filerna i katalogen `me/kmom04/lab4`.

-->


### Överkurs och extra uppgifter {#extra}

Här följer extra uppgifter som du kan utföra för att lära dig mer, om du har tid, lust och energi.

<!--
* Login, gör ett komplett loginskript/hantering

* Markdown, läs in fil och konvertera, kräver composer och PHP i pathen (låt vara tills design-kursen)
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

Glöm inte att testa din inlämning med `dbwebb test kmom04`.
