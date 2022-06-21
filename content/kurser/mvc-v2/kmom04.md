---
author:
    - mos
revision:
    "2021-04-19": "(A, mos) Första utgåvan i mvc-v1."
...
Kmom04: Enhetstestning
==================================

Vi jobbar vidare med klasser och objekt och nu tittar vi på hur klasser kan enhetstestas med verktyget PHPUnit. PHPUnit är ett av de verktyg som vanligen används inom PHP för att utföra enhetstestning av kod.

Vi har tidigare pratat om begreppet inkapsling och att klasserna skall erbjuda ett publikt API, ett gränssnitt för användaren av klassen. Samtidigt vill vi skydda den interna implementationen inuti klassen. Vi vill låta användaren av vår klass ha ett tydligt gränssnitt, men inuti klassen vill vi själva bestämma hur vi implementerar klassens detaljer, utan att påverka/påverkas av det publika gränssnittet.

Liknande begrepp använder vi i enhetstestning. Vi ser varje klass som en enhet som skall testas och vi testar klassen via dess publika gränssnitt vilket är de metoder vi når som användare av klassen, klassens publika metoder. När vi testar så är vi fullt medvetna om hur klassen är uppbyggd. Vi kallar det för _white box testing_, vi har tillgång till klassens källkod när vi skriver testfallen och vi vet exakt den källkod vi skall testa. Målet är att testa alla varianter av användning mot klassen, även felfall.

Vi försöker även nå en så kod kodtäckning som möjligt och rimligt. 100% kodtäckning handlar om att testfallen exekverar samtliga kodrader minst en gång. Ibland är det inte möjligt att nå 100% och man kan nöja sig med en siffra som kanske når 70%. Det är något man får "känna efter" och se hur testbar ens kod är.

Som ett litet sidospår tittar vi även på hur man kan automatisera dokumentationen av sin kod.

<!-- more -->

[FIGURE src=image/snapvt18/phpunit-terminal.png?w=w3 caption="Enhetstestning med PHPUnit via en Makefile."]

[FIGURE src=image/snapvt18/code-coverage-overview.png?w=w3 caption="Kodtäckning vid enhetstestning, en översikt av enheterna (klasserna)."]

[FIGURE src=image/snapvt18/code-coverage-detail.png?w=w3 caption="Detaljerad kodtäckning rad för rad i en enhet (klass)."]

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Labbmiljö  {#labbmiljo}
---------------------------------

*(ca: 1-2 studietimmar)*

Installera följande som en del av din labbmiljö.

1. Installera [Xdebug](labbmiljo/xdebug) för att kunna köra enhetstester med kodtäckning på din lokala maskin.

    1. Om du är på Mac kan du vara behjälpt av att installera "PHP i terminalen" och "Xdebug" via pakethanterare Brew, för detaljer se "[Installera Xdebug på Mac OS med XAMPP/brew](t/8514)".

<!--
Fixa installationsinstruktionen på Mac
https://xdebug.org/docs/install#pecl
-->



Läs & Studera  {#lasanvisningar}
---------------------------------

*(ca: 2-4 studietimmar)*

För att lösa uppgifterna och redovisningen bör du studera enligt följande.



### Föreläsning {#flas}

Titta igenom följande föreläsningar.

1. [Introduktion till området "Software Testing"](./../forelasning/software-testing) om ingenjörsprocessen att utföra testning med mjukvara.

1. [Introduktion till området "Software Unit Testing"](./../forelasning/software-unit-testing) och rollen för enhetstestning i testprocessen av mjukvara.

<!--
Föreläsning om phpunit? Eller räcker med övningen? Kanske en kort föreläsning som bara visar projektet?

När det gäller phpunit så är bland annat följande resurser intressanta att ha koll på.

* [PHPUnits hemsida](https://phpunit.de/)
* [Manualen](https://phpunit.readthedocs.io) (dubbelkolla så att du läser rätt version av manualen som mappas mot den version av phpunit du använder).
* [PHPUnit och PHP supportade versioner](https://phpunit.de/supported-versions.html), se vilka versioner som är aktiva för tillfället.
* [PHPUnit på GitHub](https://github.com/sebastianbergmann/phpunit), följ utvecklingen och läs om vilka issues som finns.

För att kodtäckningen skall fungera behöver du installera Xdebug.

* [Hemsidan för Xdebug](https://xdebug.org/)
-->



### Litteratur  {#litteratur}

Läs enligt följande.

1. I dokumentet [PHP The Right Way](http://www.phptherightway.com/), finns en sektion som berör testning i PHP. Läs igenom den.

    * [PHP The Right Way: Testing](https://phptherightway.com/#testing)

1. Bekanta dig med [PHPUnits dokumentation](https://phpunit.readthedocs.io/). Kika över innehållsförteckningen och skumläs snabbt följande kapitel (för att bekanta dig med manualens struktur och innehåll. Du kommer behöva gå tillbaka till manualen, senare när du skriver dina testprogram. Det är via manualen du kan lära dig allt som du behöver veta om enhetstester med phpunit.

    * 2. Writing Tests for PHPUnit
    * 3. The Command-Line Test Runner
    * 4. Fixtures
    * 5. Organizing Tests
    * 9. Code Coverage Analysis
    * Appendix 1. Assertions



<!--
Kanske bra när man kan lite mer om enhetstestning och vill elaborera om det.

1. På StackOverflow/StackExchange finns följande funderingar och frågor om enhetstestning besvarade, läs frågorna och de olika svaren för att skapa dig en bild av vad programmerare generellt anser om enhetstestning.
    * "[Is Unit Testing worth the effort?](https://stackoverflow.com/questions/67299/is-unit-testing-worth-the-effort)"
    * "[Why would you write unit-tests for controllers?](https://softwareengineering.stackexchange.com/questions/338420/why-would-you-write-unit-tests-for-controllers)"
-->



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 10-14 studietimmar)*

Övningar är träning inför uppgifterna, det är ofta klokt att jobba igenom övningarna. Uppgifter skall utföras och redovisas.

Jobba gärna i grupp med dina studiekompisar, men skriv alltid din egen kod för hand. Även om du tjuvkikar för att hitta bra lösningar så är det en stor skillnad att skriva koden själv jämfört med att kopiera från någon.



### Övningar {#ovningar}

Jobba igenom övningarna, de förbereder dig inför uppgifterna.

1. Det finns en övning "[Get going with phpunit](https://github.com/dbwebb-se/mvc/tree/main/example/phpunit)" i ditt kursrepo under `example/phpunit` som hjälper dig att komma igång med phpunit och enhetstestning. Jobba igenom den och försök nå 100% kodtäckning samtidigt som du lär dig grunderna i enhetstestning.

<!--
how to mock session & request

how to test controller
-->



### Uppgifter {#uppgifter}

Följande uppgifter skall utföras och resultatet skall redovisas.

1. Det finns en övning "[Document your PHP code](https://github.com/dbwebb-se/mvc/tree/main/example/phpdoc)" i ditt kursrepo under `example/example/phpdoc` som hjälper dig att komma igång med att automatiskt skapa dokumentation för din kod. Jobba igenom den och integrera `composer phpdoc` i ditt `me/report`.

1. Lös uppgiften "[Enhetstesta dina klasser med PHPUnit i Symfony](uppgift/enhetstesta-dina-klasser-med-phpunit-i-symfony)".

<!--
generera dokumentation, phpdoc, uml  hur fixa uml klassdiagram?
Kanske flytta det till kmom03 i fortsättningen?
Samt kräva att det läggs till i Git-repot, tex doc/coverage
-->



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i din redovisningstext.

* Berätta hur du upplevde att skriva kod som testar annan kod med PHPUnit och hur du upplever phpunit rent allmänt.

* Hur väl lyckades du med kodtäckningen av din kod, lyckades du nå mer än 90% kodtäckning?

* Upplever du din egen kod som "testbar kod" eller finns det delar i koden som är mer eller mindre testbar och finns det saker som kan göras för att förbättra kodens testbarhet?

* Valde du att skriva om delar av din kod för att förbättra den eller göra den mer testbar, om så berätta lite hur du tänkte.

* Fundera över om du anser att testbar kod är något som kan identifiera "snygg och ren kod".

* Vilken är din TIL för detta kmom?


<!--
* Berätta om din implementation från uppgiften. Hur löste du uppgiften, är du nöjd/missnöjd, vilken förbättringspotential ser du i din koden/spelet, var uppgiften svårt/enkelt/utmanande, håller din kod god/hög kvalitet?
-->
