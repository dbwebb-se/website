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
    "2022-09-16": "(A, mos) Första utgåvan."
...
kmom04: PHP datastrukturer
==================================

Vi fördjupar oss mer i programmering med PHP och vi tittar på datastrukturer med arrayer för att se skillnader och likheter mellan numeriska arrayer och associativa arrayer.

Vi tittar vidare på HTML formulär och använder POST tillsammans med processing- och resultat-sidor.

Vi kikar på sessionen och lär oss hur man kan spara värden i sessions-arrayen och få en lagring av värden mellan användarens sidanrop.

Vi tittar också på hur funktioner kan användas för att förbättra vår kodstruktur så att koden blir enkel att utveckla, underhålla och felsöka i. 

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>


<!--sto p-->

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

Tankar om utveckling?

* PHP läsa från lokala filer, prepare för databas
* Om innehåll i webbplatsen? (markdown kanske, som en filbaserad databas)
-->



### Litteratur  {#litteratur}

Läs enligt följande.

1. På sidan för föreläsningarna ovan så finns läsanvisningar som hjälper dig att studera datastrukturer i programmeringsspråket PHP. Välj bland dem för att läsa på mer om begreppen.

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



### Uppgifter {#uppgifter}

Följande uppgifter skall utföras och resultatet skall redovisas.

1. Gör uppgiften "[Bygg en månadskalender och ett gissningsspel med PHP datastrukturer](uppgift/bygg-en-manadskalender-och-ett-gissningsspel-med-php-datastrukturer)" och spara alla filer under `me/report`.

<!--
* Lägg till cheat i uppgiften om gissa namnet.
-->

<!--

* Galleri med bilder, klicka runt, läsa av filer i katalog. (next/prev)
* glob
* PHP läsa från lokala filer, prepare för databas

-->

<!--
TANKAR FRAMÖVER.

* Inför labbar (kmom04-06) om det känns som det behövs och om det känns att det finns utrymme (koppla till guiden?)

* Gör uppgiften "[PHP lab 3: Arrayer](uppgift/php-lab3-arrayer)". Spara alla filerna i katalogen `me/kmom03/lab3`.

* Gör uppgiften "[PHP lab 4: skapa egna funktioner](uppgift/php-lab4-skapa-egna-funktioner)". Spara alla filerna i katalogen `me/kmom04/lab4`.
-->


<!--
### Överkurs och extra uppgifter {#extra}

Här följer extra uppgifter som du kan utföra för att lära dig mer, om du har tid, lust och energi.

-->

<!--
* Lägg till detaljer om dagens namn och namnsdagar i din sidkontroller `today.php`.
* Skapa fler funktioner som hämtar data om namn och liknande.
* Login, gör ett komplett loginskript/hantering
* Extra övning som visa inloggninig, eller lägg som extrauppgift
* Inloggning av användare med lösenord.

* Markdown, läs in fil och konvertera, kräver composer och PHP i pathen (låt vara tills design-kursen)
-->



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i din redovisningstext.

* Hur kändes det att jobba med datastrukturer i arrayer?
* Hur tänker du kring funktionern och hittade du mer kod som du valde att strukturera i funktioner?
* Kan du se skillnaden på HTML formulär med GET och POST?
* Gick det bra när du jobbade med SESSION?
* Berätta om hur du löste uppgiften och hur nöjd du är med resultatet. Berätta även om du försökte på någon av extrauppgifterna.
* Vilken är din TIL för detta kmom?

Glöm inte att testa din inlämning med `dbwebb test kmom04`.
