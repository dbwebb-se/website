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
    "2022-09-09": "(A, mos) Första utgåvan."
...
Kmom03: Programmera en webbplats
==================================

Vi lär oss grunderna i programmeringsspråket PHP om hur man kan skapa dynamiska webbsidor via programmeringskonstruktioner som variabler, if-satser, och loopar. Vi använder inbyggda variabler som $_GET och $_SERVER tillsammans med querysträng och HTML formulär där vi provar att skicka argument till en webbsida.

Vi jobbar vidare med den katalogstruktur vi har byggt upp och det handlar främst om att placera koden i sidkontrollers och vyer. Strukturen är viktig då den hjälper oss att hålla ordning i koden vilket gör det enklare att felsöka och utveckla webbsidorna.

När du är klar med detta kursmoment så har du grundläggande kunskap i hur man programmerar med PHP och du har grunderna för hur man bygger och driftsätter en dynamisk webbplats med PHP.

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



<!--
Labbmiljö  {#labbmiljo}
---------------------------------

*(ca: 2-4 studietimmar)*

Komplettera din labbmiljö med följande.

* Dubbelkolla även att du kör version 8.0 (eller högre) av PHP.
* [Lägg till PHP i din PATH](labbmiljo/php-i-pathen).
* [Installera Composer för pakethantering med PHP](labbmiljo/composer).

-->



Läs & Studera  {#lasanvisningar}
---------------------------------

*(ca: 4-8 studietimmar)*

Här kan du på egen hand studera och förbereda dig inför övningar och uppgifter.



### Föreläsning {#flas}

Titta på följande föreläsningar. Föreläsningarna kan innehålla tips om läsanvisningar.

1. [PHP introduktion](./../forelasning/php-introduktion) som ger dig en introduktion till programmeringsspråket PHP och lär dig vissa av de grundkonstruktioner som finns i språket. Det finns extra läsanvisningar tillsammans med föreläsningen.

<!--
1. [PHP sidkontroller och vyer](./../forelasning/php-sidkontroller-vyer) för att beskriva flödet när en websida produceras med PHP och koppla till MVC?

1. Föreläsning som visar flödet i hur en PHP-sida processas, så man får en mental bild som hjälper till vid felsökning?

1. Någon mer handfast föreläsning i PHP, som hjälper dem att programemra de allra första stapplande konstruktionerna? Eller gör det till en övning som kan spelas in på video.

-->



### Litteratur  {#litteratur}

Läs enligt följande.

1. På sidan för föreläsningen ovan så finns läsanvisningar som hjälper dig att studera grunderna i programmeringsspråket PHP. Välj bland dem för att läsa på mer om begreppen.

<!--
* Jobba igenom PHP-guiden och börja använda den igen? Komplettera korta artiklar med videor och exempelprogram.

1. Läs igenom följande sektion i guiden "[Kom igång med HTML och CSS](guide/kom-igang-med-html-och-css)".
    * [Tabeller](guide/kom-igang-med-html-och-css/tabeller)
-->



### Video för orientering {#video}

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

1. Jobba igenom övningen "[Programmera din webbplats med PHP](kunskap/programmera-din-webbplats-med-php)" som hjälper dig att komma igång med PHP och dess olika konstruktioner och begrepp för att införa dynamiskt beteende i dina webbsidor. Spara koden du skriver under `me/report`, om du skriver extra test- och exempelprogram kan du spara dem under `me/kmom03`.



### Uppgifter {#uppgifter}

Följande uppgifter skall utföras och resultatet skall redovisas.

1. Gör uppgiften "[Programmera din rapportsida till webtec-kursen](uppgift/programmera-din-rapport-sida-till-webtec-kursen)" och spara alla filer under `me/report`.

<!--
* Uppgift från webtec-v1, kan innehålla exempel som går att återanvända "[Programmera med PHP](uppgift/programmera-med-php)".

* Gör några små videor som visar hur man problemlöser och kodar små lösningar i PHP-program. För att hjälpa dem igång med små konstruktioner.

* Inför labbarna om det känns som det behövs och om det känns att det finns utrymme.

1. Gör uppgiften "[PHP lab 1: uttryck, datatyper och variabler](uppgift/php-lab1-uttryck-datatyper-och-variabler)". Spara alla filerna i katalogen `me/kmom01/lab1`.

1. Gör uppgiften "[PHP lab 2: villkor, loopar och inbyggda funktioner](uppgift/php-lab2-villkor-loopar-och-inbyggda-funktioner)". Spara alla filerna i katalogen `me/kmom02/lab2`.

Kanske uppdatera guiden med video och övningsuppgifter samt skapa labbar som tränar på det som guiden tar upp.

-->



### Överkurs och extra uppgifter {#extra}

Här följer extra uppgifter som du kan utföra för att lära dig mer, om du har tid, lust och energi.



#### Markera valt värde i navbaren {#navbarcurrent}

Markera valt värde i navbaren för att visa på vilket menyval du är för närvarande. Trixet är att hämta namnet på nuvarande sidkontroller från `$_SERVER` och jämföra det med de sidkontroller som du har i din navbar, när de är lika så lägger du till en css-klass som du stylar så att navbaren visar nuvarande aktuella val.

Det kan till exempel se ut så här.

[FIGURE src=image/webtec/programmera/navbar_current.png?w=w3 caption="Nu visas aktuellt val i navbaren med en annan style."]

Du kan få vissa tips om du går till sidan "[Styla nuvarande länk i en navbar](https://dbwebb.se/guide/kom-igang-med-programmering-i-php/styla-nuvarande-lank-i-en-navbar)".



#### Statistik om resurser som används {#stats}

Längst ned i din footer kan du lägga till detaljer om sidans prestanda såsom laddningstid, antal filer som inkluderats och hur mycket minne som processingen av sidan använder.

Det kan till exempel se ut så här.

[FIGURE src=image/webtec/programmera/stats.png?w=w3 caption="Statistik om resurser som krävs för att processa sidan."]

Du kan få vissa tips om du går till sidan "[Mäta en sidas beteende](https://dbwebb.se/guide/kom-igang-med-programmering-i-php/mata-en-sidas-beteende)".



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i din redovisningstext.

* Hur är din uppfattning om programmeringsspråket PHP så här långt?
* Hur känns det att bygga webbplatsen med strukturen av sidkontroller och vyer?
* Kan du säga hur bekväm du är med att använda grundkonstruktionerna i PHP med variabler, if, loopar och formulär med GET och querysträngen samt SERVER med mera, eller var ser du de svåra passagerna?
* Berätta om hur du löste uppgiften och hur nöjd du är med resultatet. Berätta även om du försökte på någon av extrauppgifterna.
* Vilken är din TIL för detta kmom?

Glöm inte att testa din inlämning med `dbwebb test kmom03`.
