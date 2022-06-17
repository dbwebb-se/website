---
views:
    flash:
        region: flash
        template: default/image
        data:
            src: "image/kurs/mvc/kmom01-symfony.png?w=1100&h=300&cf"
author:
    - mos
revision:
    "2022-03-23": "(C, mos) Nytt kmom inför mvc-v2 och vt22."
    "2021-03-29": "(B, mos) Lade till läsresurs om Templating."
    "2021-03-25": "(A, mos) Första versionen släppt för mvc-v1."
...
Kmom01: Ramverk
==================================

I denna kursen skall vi lära oss programmera webbapplikationer på ett objektorienterat sätt med fokus på det arkitekturella designmönstret MVC. För att komma igång behöver vi en bas och där har vi valt ramverket Symfony som är ett av de mer kända ramverken inom PHP.

Vi börjar med att installera Symfony och bygger en webbplats med en kontroller (C:et i MVC) som ger oss grunden för kursens me-sida som skall innehålla detaljer om dig själv, kursen och dina redovisningstexter. Du använder vyer för att rendera webbsidorna (V:et i MVC). Vi provar även att skapa en sida som genererats med JSON, det blir ett embryo till att se hur man kan bygga en webbtjänst med ett så kallat RESTful API.

Vi skall också börja lära oss om grunderna med objektorientering och dess konstruktioner i PHP.

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>

<!-- more -->



Labbmiljö  {#labbmiljo}
---------------------------------

*(ca: 2-4 studietimmar)*

Se till att du har kursens labbmiljö installerad.

1. En översikt av [labbmiljön som krävs för att genomföra första kursmomentet](./../installera-labbmiljo).



Läs & Studera  {#lasanvisningar}
---------------------------------

*(ca: 2-4 studietimmar)*



### Föreläsning {#flas}

Titta igenom följande föreläsningar.

1. [Kursintro](./../forelasning/kursintroduktion) som ger en introduktion till kursens struktur och upplägg samt en översikt av kursens innehåll.

<!-- Går det förklara kursens syfte på ett tydligt sätt? Så att stud upplever en rödare tråd? -->

1. [Introduktion till klasser och objekt i PHP](./../forelasning/klasser-och-objekt-i-php), för att komma igång med grunderna i hur man skapar en klass och instansierar ett objekt. Koncept som objekt i sessioner, namespace och autoloader hanteras.



### Litteratur  {#litteratur}

Läs enligt följande.

1. Bekanta dig översiktligt med dokumentet [PHP The Right Way](http://www.phptherightway.com/). Det är skrivet av PHP communityn och ger en översikt över PHP som språk och de verktyg och processer man normalt arbetar med. Vi kommer att återkomma till dokumentet under kursens gång. Du kan se dokumentet som en innehållsförteckning till vad en god PHP-programmerare bör ha koll på.

1. Kika kort på webbplatsen för [PHP ramverket Symfony](https://symfony.com/). Fortsätt sedan att snabbt skapa dig en uppfattning om hur man installerar och kommer igång med ramverket (det finns även tips om videor som lärresurs).

    * [Installing & Setting up the Symfony Framework](https://symfony.com/doc/current/setup.html)

1. Titta i guiden "[Kom igång med Objektorienterad programmering i PHP](guide/kom-igang-med-objektorienterad-programmering-i-php)" och se om den kan hjälpa dig med att förstå grunderna till klassbegreppet i PHP. Välj själv om du enbart använder guiden som läsresurs eller om du kodar dess övningsprogram.

    * [Intro till guiden](guide/kom-igang-med-objektorienterad-programmering-i-php/intro-till-guiden)
    * [Objekt och Klass](guide/kom-igang-med-objektorienterad-programmering-i-php/objekt-och-klass)


<!--
About design patterns.
https://www.youtube.com/watch?v=tv-_1er1mWI
-->



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 8-12 studietimmar)*

Övningar är träning inför uppgifterna, det är ofta klokt att jobba igenom övningarna. Uppgifter skall utföras och redovisas.

Jobba gärna i grupp med dina studiekompisar, men skriv alltid din egen kod för hand. Även om du tjuvkikar för att hitta bra lösningar så är det en stor skillnad att skriva koden själv jämfört med att kopiera från någon.



### Övningar {#ovningar}

Jobba igenom övningarna, de förbereder dig inför uppgifterna.

1. Kom igång med att "[Installera och bygga en webbapplikation i Symfony](https://github.com/dbwebb-se/mvc/tree/main/example/symfony)". Spara din kod i `me/kmom01/symfony`.

<!--
* Visa hur man jobbar med Markdown.
* Visa hur man gör en enhetlig stylesheet (header, footer, navbar).
* Versionshantering
-->



### Uppgifter {#uppgifter}

Följande uppgifter skall utföras och resultatet skall redovisas.

1. Utför uppgiften "[Bygg en me-sida till mvc-kursen](uppgift/bygg-en-me-sida-till-mvc)". Spara din kod i `me/report`.



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i din redovisningstext.

* Berätta kort om dina förkunskaper och tidigare erfarenheter kring objektorientering.

* Berätta kort om PHPs modell för klasser och objekt. Vilka är de grunder man behöver veta/förstå för att kunna komma igång och skapa sina första klasser?

* Reflektera kort över den kodbas, koden, strukturen som användes till uppgiften `me/report`, hur uppfattar du den?

* Med tanke på artikeln "PHP The Right Way", vilka delar in den finner du extra intressanta och värdefulla? Är det några särskilda områden som du känner att du vill veta mer om? Lyft fram några delar av artikeln som du känner mer värdefulla.

* Vilken är din TIL för detta kmom?

TIL är en akronym för "Today I Learned" vilket leksamt anspelar på att det finns alltid nya saker att lära sig, varje dag. Man brukar lyfta upp saker man lärt sig och där man kanske hajade till lite extra över dess nyttighet eller enkelhet, eller så var det bara en ny lärdom för dagen som man vill notera.



<!--stop-->



Resurser bra-att-ha {#resurser}
---------------------------------

Här anges övriga resurser som kan användas för vidare studier i det som kursmomentet omfattar.



### Git & GitHub {#git}

Git är ett versionshanteringssystem för kod och GitHub/GitLab är en webbplats där man kan ladda upp sitt Git-repo och använda extra tjänster.

Om Git.

* [Git documentation](https://git-scm.com/doc)

Om GitHub.

* [GitHub](https://github.com/)
* [GitHub Docs](https://docs.github.com/en)

Om GitLab.

* [GitLab](https://gitlab.com/)
* [GitLab Docs](https://docs.gitlab.com/)



### Make {#make}

[Manualen för GNU Make](https://www.gnu.org/software/make/manual/).



### Repetera PHP {#repphp}

Om du känner behov av att repetera PHP så kan följande resurser vara relevant.

1. Guiden från kursen htmlphp, "[Kom igång med programmering i PHP](guide/kom-igang-med-programmering-i-php)".

1. Kursboken som användes i kursen htmlphp, [Webbutveckling med PHP och MySQL](kunskap/boken-webbutveckling-med-php-och-mysql).

1. En relativt ny online-bok "[PHP Apprentice - An online book for learning PHP](https://phpapprentice.com/)" som håller på att utvecklas.



### Kodstandard {#kodstandard}

Vi använder verktyget [`phpcs` (och `phpcbf`)](https://github.com/squizlabs/PHP_CodeSniffer/wiki) för att validera koden enligt kodstandarden [PSR-12: Extended Coding Style](https://www.php-fig.org/psr/psr-12/).

Kodstandarden är överenskommen inom PHP communityn och hanteras av organisationen [PHP-FIG](https://www.php-fig.org/) vars syfte är att standardisera komponenter så att de går att använda mellan olika ramverk.  

PSR-12 har numer ersatt tidigare kodstandarder [PSR-1: Basic Coding Standard](http://www.php-fig.org/psr/psr-1/) och [PSR-2: Coding Style Guide](http://www.php-fig.org/psr/psr-2/).

Verktyget `phpcbf` är en kodstil-fixer som automatiskt kan laga en del av de fel som du får av `phpcs`.



### Linter och validatorer {#validering}

Följande linters och validatorer används i olika omfattning.

* [PHP Mess Detector (phpmd)](https://phpmd.org/), look for several potential problems within the code.
* [PHPStan (phpstan)](https://phpstan.org/), finds bugs in your code without writing tests.
* [PHPLOC (phploc)](https://github.com/sebastianbergmann/phploc), a tool for quickly measuring the size and analyzing the structure of a PHP project.
* [PHP Copy/Paste Detector (phpcpd)](https://github.com/sebastianbergmann/phpcpd), a Copy/Paste Detector (CPD) for PHP code.



### Plugin i Atom/Vscode {#plugin}

Vertyg likt phpcs och phpmd går bra att installera i din texteditor som plugins. Det underlättar att få information om dessa fel medan du skriver din kod.

Första gången man installerar kan det dock vara lite klurigt så vi lägger denna delen på överkurs. Pröva gärna när du får tid och kraft.



### Om templatefiler och vyer, V i MVC {#twig}

I artikeln "[PHP The Right Way](http://www.phptherightway.com/)" finns det ett eget kapitel om vyer och templatefiler som heter "Templating". Det är bra att läsa igenom det för att få en överblick hur termen vyer och templatfiler hör ihop med V:et i MVC.



### Twig med vyer {#twig}

I uppgiften används PHP som vymotor, eller _template engine_. Du kan installera vymotorn Twig och använda den för dina vyer, om du så önskar.

* Läs om [vymotorn Twig](https://twig.symfony.com/).
<!--* Exempel på hur du kommer igång med vymotorn Twig i uppgiften. -->



<!--
### Vyer och templatemotorer i ramverk {#vyer}

Hur vyer implementeras och konfigureras i ramverk kan skilja åt i detaljer men grundprincipen med en controller-klass är densamma.

Här är ett par olika implementationer i PHP ramverk.

* [Symfony Controller](https://symfony.com/doc/current/controller.html)
* [Laravel Controller](https://laravel.com/docs/8.x/controllers)
* [Yii Controller](https://www.yiiframework.com/doc/guide/2.0/en/structure-controllers)

-->
