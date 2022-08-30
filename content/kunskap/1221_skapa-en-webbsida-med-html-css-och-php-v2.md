---
author: mos
category:
    - webbprogrammering
    - html
    - css
    - php
    - kurs webtec
revision:
    "2022-06-28": "(D, mos) Genomgången och större uppdatering inför webtec-v2."
    "2018-06-19": "(C, mos) Uppdaterad inför htmlphp v3, kompletterad med video."
    "2016-02-03": "(B, mos) Blå ruta om status för Unicorn."
    "2015-04-29": "(A, mos) Första utgåvan inför htmlphp version 2."
...
Skapa en webbsida med HTML, CSS och PHP (v2)
==================================

[FIGURE src=image/webtec/html-css-php/style_php_me.png?w=c5 class="right" caption="En webbplats, en me-sida."]

Vill man bli webbprogrammerare så behöver man lära sig flera tekniker och hur de samverkar. Låt oss därför, steg för steg, skapa en liten webbplats med HTML, CSS och PHP.

Webbplatsen får innehålla ett par sidor med header och footer, några bilder, länkar och en meny för att navigera mellan sidorna. Det blir en bra start. Dessutom lär vi oss att validera sidorna så att de stämmer med de standarder vi använder.

<!--more-->



Förutsättningar {#pre}
---------------------------------

Du har installerat en labbmiljö likt den som beskrivs i dokumentet om [labbmiljö för kursen webtec](kurser/webtec-v2/installera-labbmiljo). Det innefattar bland annat en webbserver med stöd för PHP.

Du kan hitta koden som används i denna artikel, i ditt kursrepo under `example/me/kmom01`, använd den som referens om du fastnar.



<!--
Översikt av artikeln {#video}
---------------------------------

Det finns en videoserie som visar hur jag själv jobbar igenom artikeln. Du kan titta igenom videoserien samtidigt som du själv jobbar igenom artikeln.

Du hittar spellistan för videoserien under "[Skapa en webbsida med HTML, CSS och PHP](https://www.youtube.com/playlist?list=PLKtP9l5q3ce8WodX3eGvV1CO8wQEuI85C)".

[YOUTUBE src="XXX" list="PLKtP9l5q3ce8WodX3eGvV1CO8wQEuI85C" width=700 caption="Videoserie som ger dig en översikt och genomgång av artikeln."]
-->



Webbplatsens innehåll {#innehall}
---------------------------------

Låt oss skapa en webbplats med ett par webbsidor. Vi tar enklaste möjliga struktur men vi försöker ändå täcka in hur teknikerna HTML, CSS och PHP samverkar för skapa webbsidorna. Vi försöker också skapa en god katalogstruktur till webbplatsen.

Vi skapar tre sidor och sidorna får innehålla en presentation om mig (dig), en sida för redovisningar (bra att ha i kursen) och en om-sida som berättar om själva webbplatsen och kursen.

Det kan se ut så här när det är klart.

[FIGURE src=image/webtec/html-css-php/style_php_me.png?w=w3 caption="Nu är jag klar och stylade till min egen webbplats med inspiration från PHPs webbplats."]

Det är kanske inte en jättesnygg webbplats, men denna artikel handlar mest om hur man bygger upp koden bakom webbsidan med hjälp av HTML, CSS och PHP.



Katalogstruktur {#struktur}
---------------------------------

Vi sparar allt vårt arbete i kursrepot i katalogen `me/kmom01`. Låt mig visa hur du kan göra för att skapa grundstrukturen för webbplatsen.

Öppna din terminal och gå till ditt kursrepo.

```text
# Ställ dig i rooten av kursrepot

# Gå till arbetskatalogen
cd me/kmom01

# Visa de filer som finns i katalogen (det bör vara tomt inledningsvis)
ls -al
```

Nus skapar jag ett par kataloger för att ge en grundstruktur till webbplatsen. Tanken är att katalogen `public/` innehåller allt som behöver vara publikt och tillgängligt på webbplatsen och övriga kataloger är sådant som inte behöver vara tillgängligt via webbservern. Det är en bra start.

```text
# Skapa kataloger för den publika delen
mkdir public/img
mkdir public/css

# Skapa övriga kataloger
mkdir config
mkdir view
```

Nu tänker jag skapa ett par tomma filer, det är dessa filer som vi senare skall fylla med innehåll.

```text
# Skapa tomma filer som är blivande webbsidor, sidkontroller
touch public/me.php
touch public/about.php
touch public/report.php

# Skapa en tom stylesheet
touch public/css/style.css

# Skapa en tom konfigurationsfil som sidkontrollers kan inkludera
touch config/config.php

# Skapa tomma vyer (byggstenar till webbsidan)
touch view/header.php
touch view/byline.php
touch view/footer.php
```

Bra, då är vi nästan klara. Jag tänkte ladda hem ett par bilder först. För din egen del så kan du använda dessa bilder först, senare kan du själv ersätta dem med andra bilder.

```text
# Hämta hem bilder från nätet via en webblänk och spara lokalt
wget -O public/img/favicon.png https://dbwebb.se/img/bth-leaf.png
wget -O public/img/me.png https://dbwebb.se/img/prata-med-ankan.png
wget -O public/img/me_small.jpg https://dbwebb.se/img/mikael-roos/mos-tjaro-square.jpg
wget -O public/img/background.jpg https://dbwebb.se/img/mos-desktop-kaprifolen.jpg
```

Kommandot `mkdir` skapar nya kataloger, kommandot `touch` skapar nya tomma filer och kommandot `wget` laddar hem filer från nätet.

När vi är klara så ser strukturen ut så här. Du kan själv kolla din egen struktur via kommandot `ls -lR` eller om du installerar kommandot `tree` med din pakethanterare, tex `apt install tree` eller `brew install tree`.

```text
.                           
├── config                  
│   └── config.php          
├── public                  
│   ├── about.php           
│   ├── css                 
│   │   └── style.css       
│   ├── img                 
│   │   ├── background.jpg  
│   │   ├── favicon.png     
│   │   ├── me.png          
│   │   └── me_small.jpg    
│   ├── me.php              
│   └── report.php          
└── view                    
    ├── byline.php          
    ├── footer.php          
    └── header.php          

5 directories, 12 files     
```

Vi har nu en grundstruktur i vår webbplats. Du kan prova att öppna filerna via din webbläsare och din lokala webbserver. De flesta filerna är ännu tomma, men du bör kunna se bilderna om du klickar på dem.

Starta din texteditor och öppna katalogen så den syns. Jag använder Visual Studio Code som jag kan starta direkt från terminalen och punkten säger att editorn skall visa innehållet i den katalog där jag befinner mig.

```text
code .
```

Så här ser det ut för mig.

[FIGURE src=image/webtec/html-css-php/step1-code.png?w=w3 caption="Strukturen för min webbplats som den ser ut i texteditorn Code."]

Vi fortsätter raskt att skapa en första webbsida.



En första ansats till en webbsida {#ansats1}
--------------------------------------

Då börjar vi med att göra vår första webbsida. Här kan du se standardstrukturen på en webbsida med lite innehåll.

```html
<!doctype html>
<html lang="sv">
<head>
    <meta charset="utf-8">
    <title>En sida om mig | Me-sidan</title>
</head>
<body>
    <header>
        <p>Här kan jag placera en fin header till webbsidan.</p>
    </header>

    <main>
        <h1>Om Mig Själv</h1>
        <p>Här kommer snart min egen fina me-sida.</p>
        <img src="img/me.png" width="300" class="me" alt="Bild på mig">
    </main>

    <footer>
        <hr>
        <p>Denna sidan är Copyright &copy; av mig.</p>
    </footer>
</body>
</html>
```

Titta nu på koden ovan och skriv om den i din fil `public/me.php`. Öppna den sedan i en webbläsare via din webbserver. Det kan se ut så här.

[FIGURE src=image/webtec/html-css-php/webbsida1.png?w=w3 caption="Första ansatsen till en webbsida."]

Webbsidan är enbart HTML-kod, det finns ännu inget inslag av PHP i koden.



Källkoden för en webbsida {#kallkod}
--------------------------------------

När webbläsaren hämtar webbsidan från webbservern så levereras den som källkod, den kod som skall användas av webbläsaren för att rendera och visa själva webbsidan.

Vi kan hitta källkoden till webbsidan genom att högerklicka på musen i webbläsarens fönster och välja menyvalet "View Page Source", eller "Visa källkod".

Du får då upp en sida som visar källkoden för sidan.

[FIGURE src=image/webtec/html-css-php/webbsida1_src.png?w=w3 caption="Källkoden för sidan finns alltid tillgänglig."]

I detta fallet är källkoden som ligger i filen `me.php` exakt samma som webbläsaren ser. Men mer om detta när vi snart börjar med PHP.


När vi senare börjar använda PHP så kommer källkoden att skilja sig åt, den filen som ligger på servern ser annorlunda ut än den som webbläsaren ser. Det är alltså en viktig skillnad på källkoden i servern och källkoden i webbläsaren. Denna skillnad vill du bemästra när du senare ska felsöka i dina webbsidor. Men, vi kan ta mer om det senare.



Developer tools och inspect {#inspect}
--------------------------------------

När webbläsaren hämtar webbsidan från webbservern så kommer den som källkod. Därefter tar webbläsaren och "parsar" (läser igenom) källkoden och renderar webbsidan för att slutligen visa upp den.

Vid renderingen kan källkoden till sidan ibland modifieras av webbläsaren. Detta händer till exempel om källkoden inte stämmer överens med givna riktlinjer och standarder. Vi kan säga att webbläsaren "patchar" (försöker laga) källkoden så att den fungerar.

Den patchade varianten av källkod kan man se via "devtools" eller "inspect". Om du tar musen över webbsidan och högerklickar så brukar menyvalet ligga längst ned och heter "Inspect". Du kan också öppna verktyget via funktionstangenten F12.

[FIGURE src=image/webtec/html-css-php/webbsida1_inspect.png?w=w3 caption="Källkoden för sidan finns alltid tillgänglig."]

Vi har alltså följande steg för att visa upp en webbsida.

1. Källkoden som ligger i filen `me.php` på webbservern.
1. Källkoden som webbläsaren hämtar från webbservern, den data som skickas över nätet från webbservern till webbläsaren. Se den genom att "högerklicka och visa källkod".
1. Den parsade och eventuellt patchade källkoden. Se den via "inspect" och "devtools".



Validera enligt HTML {#validera-html}
--------------------------------------

För att kontrollera att det verkligen är korrekt HTML-kod som webbläsaren får så kör vi koden genom [W3C’s Markup Validation Service](http://validator.w3.org/). Välj fliken "Validate by direct input" och kopiera in koden för din webbsida.

Bäst är att kopiera in koden som den kommer i webbläsaren, via högerklicka och "View Page Source".

[FIGURE src=image/webtec/html-css-php/webbsida1_validate.png?w=w3 caption="Kopiera in källkoden för webbsidan för att validera den."]

Klicka på knappen för att validera webbsidan.

Så här ska det se ut när du validerar, grönt är bra och säger att webbsidan klarar valideringen och därmed uppfyller kraven på strukturen för HTML elementen.

[FIGURE src=image/webtec/html-css-php/webbsida1_validerar.png?w=w3 caption="Min webbsida validerar och visar grönt."]

Om du fick fel så försöker du rätta till felen. Läs även vad varningarna betyder. Det är bra att ha lite koll.

Valideringsverktyg är viktiga för den som utvecklar webbplatser. Din webbsida behöver följa de standarder som finns, annars kan webbsidan visas upp på ett felaktigt sätt i webbläsaren.



Länka till valideringsverktyget {#linkval}
--------------------------------------

För att förenkla framtida kontroller så lägger vi till en länk till validatorn, direkt i me-sidan. Det gör att vi hela tiden kan validera dokumentet med ett litet klick.

I din footer, mellan `<footer>` och `</footer>`, kan du lägga in en länk till valideringsverktyget. När du senare visar upp din webbsida på en publikt webbplats (ej localhost) kan du klicka på den länken och valideringsverktyget kommer att direkt validera sidan.

För att det skall fungera behöver du lägga in en länk till valideringsverktyget, lägg den i din footer.

```html
<p>Validering: <a href="http://validator.w3.org/check/referer">HTML</a></p>
```

För att det skall fungera behöver du även lägga till en meta-konstruktion i din `<head>` av sidan. Lägg följande konstruktion direkt efter sidans `</tile>` och innan `</head>`.

```html
<meta name="referrer" content="unsafe-url">
```

Du behöver köra din webbplats på en publik webbplats, till exempel på studentservern. Om du publiserar din webbplats dit så kan du se att det fungerar.

Så här blev det för mig.

Först publicerar jag sidan.

```text
dbwebb publish kmom01
```

Sen öppnar jag sidan på studentservern.

[FIGURE src=image/webtec/html-css-php/webbsida1_studservern.png?w=w3 caption="Sidan är nu publicerad på studentservern, en publik webbplats."]

Sedan klickar jag på valideringslänken "HTML" så kommer man till validatorn som direkt validerar den sidan som du klickade på.

[FIGURE src=image/webtec/html-css-php/webbsida1_stud_html.png?w=w3 caption="Sidan valideras direkt."]

Nu blir det enkelt att alltid dubbelkolla att webbsidan följer de riktlinjer som finns.



Visa felmeddelanden i PHP {#felmeddelanden}
--------------------------------------

Då ska vi snart börja med PHP, men innan det så förbereder vi så att PHP konfigureras till att visa felmeddelanden. Vi gör detta i en separat fil `config/config.php` som vi tänker inkludera i varje sidkontroller.

En sidkontroller i vårt sammanhang är `me.php`, `about.php` och `report.php`. Det är de sidor som vi hämtar med webbläsaren och det är där som allting startar. Det allra första vi vill göra är att de sidorna, sidkontrollerna, skall läga in konfigureringen av PHP.

Vi lägger in följande innehåll i filen `config/config.php`. Koden säger att felmeddelanden skall visas.

```html
<?php

// Report all type of errors
error_reporting(-1);

// Display all errors
ini_set('display_errors', '1');
```

Vi låter filen vara så länge, vi skall snart börja använda den.



Dela upp sidan i delar {#php-delar}
--------------------------------------

Vår nuvarande sida består av tre delar, en övre del (fram tom `<body> <header>`), en undre del (från `<footer>` och framåt) och så själva innehållet i sidan `main`.

När vi skapar nya webbsidor vill vi ofta återanvända den övre delan och den undre delen och bara förända det som ligger i `<main>`. Då kan vi använda PHP för att skapa en sådan struktur som återanvänder koden.

Vi börjar med att från `me.php` kopiera in den övre delen av koden till filen `view/header.php`. Det är följande kod vi pratar om.

```html
<!doctype html>
<html lang="sv">
<head>
    <meta charset="utf-8">
    <title>En sida om mig | Me-sidan</title>
    <meta name="referrer" content="unsafe-url">
</head>
<body>
    <header>
        <p>Här kan jag placera en fin header till webbsidan.</p>
    </header>

```

Sedan kopierar vi in den nedre delen till filen `view/footer.php`. Det handlar om följande kod.

```html

    <footer>
        <hr>
        <p>Denna sidan är Copyright &copy; av mig.</p>
        <p>Validering: <a href="http://validator.w3.org/check/referer">HTML</a><p>
    </footer>
</body>
</html>
```

Nu skall vi knyta samma dessa två delar i en ny webbsida i `about.php`. Vi gör detta genom att använda PHP konstruktionen `include()` som inkluderar en fil. Här inkluderar vi också konfigfilen vi nyss skapade, den som skall visa om vi får fel i vår kod.

Kom ihåg att alltid inkludera konfigfilen först, annars kan det hända att du inte ser felmeddelanden för den kod som körs.

```html
<?php include('../config/config.php') ?>
<?php include('../view/header.php') ?>

<main>
    <h1>Om kursen och webbplatsen</h1>
    <p>Här tänkte jag skriva lite om denna webbplatsen och om kursen.</p>
</main>

<?php include('../view/footer.php') ?>
```

Så här blir det när jag öppnar webbsidan `about.php` i min webbläsare, den är sammanslagen av de olika delarna ovan.

[FIGURE src=image/webtec/html-css-php/about.png?w=w3 caption="Den nya about-sidan visas i webbläsaren."]

Jag kan också öppna "visa källkod" så ser jag källkoden som webbläsaren får. Här kan du notera att det inte finns några inslag av PHP. PHP-koden exekveras enbart på servern och har som uppdrag att generera den HTML-kod som webbservern lämnar till webbläsaren.

[FIGURE src=image/webtec/html-css-php/about_src.png?w=w3 caption="Källkoden för about-sidan är bara HTML, ingen PHP på denna sidan webbservern."]

Nu har vi en struktur som gör att vi kan återanvända delar av koden så vi slipper duplicerad kod. Det gör att det blir enklare att utveckla och underhålla en webbplats.



En navbar för navigation mellan sidor {#navbar}
--------------------------------------

Nu när vi har två sidor så behöver vi kunna navigera mellan dem genom att klicka i webbplatsen. Det kan vi lösa med en samling länkar som vi förslagsvis placerar i filen `view/header.php`. Vi kan placera den ovan eller under `<header>`, det kan vi välja. Det handlar mest om utseende om vi vill placera vår navbar överst i sidan eller under sidans blivande header.

```html
<nav>
    <ul>
        <li><a href="me.php">Me</a></li>
        <li><a href="report.php">Report</a></li>
        <li><a href="about.php">About</a></li>
    </ul>
</nav>
```

Jag väljer att placera in navbar överst på sidan. Så här blev det för mig.

[FIGURE src=image/webtec/html-css-php/navbar.png?w=w3 caption="Nu visas en navbar överst i sidan och jag kan nå webbplatsens alla sidor."]

För att det verkligen skall fungera så behöver jag nu uppdatera sidorna `me.php` och `report.php` så att de har samma grundläggande mall som sidokontrollern skall ha.

Gör det. Du kan därefter navigera mellan alla sidorna genom att klicka i navbaren.



Länkar till dokumentation {#docs}
--------------------------------------

Låt oss uppdatera footern med ett par bra att ha länkar till resurser där vi kan lära oss HTML, CSS och PHP. Du kan placera samtliga i din footer.

```html
<p>Manualer:</p>
<ul>
    <li><a href="https://developer.mozilla.org/en-US/docs/Web/HTML/Reference">MDN: HTML</a></li>
    <li><a href="https://developer.mozilla.org/en-US/docs/Web/CSS/Reference">MDN: CSS</a></li>
    <li><a href="https://html.spec.whatwg.org/multipage/">HTML Standard</a></li>
    <li><a href="https://www.w3.org/2009/cheatsheet/">Cheat Sheet</a></li>
    <li><a href="https://www.php.net/manual/en/">PHP</a></li>
</ul>
```

Lägg gärna till fler länkar som du tycker är bra att ha. Här kommer ett par förslag.

Resurser på W3Schools.

* [HTML Tutorial](https://www.w3schools.com/html/)
* [CSS Tutorial](https://www.w3schools.com/css/)

Organisationen WHATWG arbetar med standardiseringar av webbteknologier, bland annat HTML och DOM.

* [WHATWG Standardiseringsorgan](https://whatwg.org/) för standardisering av HTML och DOM.

Organisationen W3C arbetar med standardiseringar av webbteknologier, bland annat HTML och CSS.

* [W3C Standardiseringsorgan](https://www.w3.org/) standardiseringar av HTML och CSS.
* [W3C Web design and Applications](https://www.w3.org/standards/webdesign/) omfattar bland annat HTML och CSS.



Sidans titel med variabel {#title}
--------------------------------------

En sak som du kanske märkt är att alla sidor har samma titel eftersom `<title></title>` har samma värde i `view/header.php` oavsett vilken sida vi visar.

Låt oss lösa det genom att skapa en variabel `$title` i varje sidkontroller och sedan skriver vi ut den variabeln i `view/header.php`. Vi kan ta sidan `about.php` som exempel. Koden vi vill lägga till, innan vi inkluderar headern, är följande.

```html
<?php include('../config/config.php') ?>

<?php
$title = 'Om kurs och webbplatsen';
?>

<?php include('../view/header.php') ?>
```

Eftersom vi nu har tre PHP-konstruktioner i följd så kan vi skriva om koden så att vi enbart har ett PHP-stycke med en öppnande tag och en stängande tag. Det ser bättre ut.

```html
<?php
include('../config/config.php');

$title = 'Om kurs och webbplatsen';

include('../view/header.php');
?>
```

Glöm inte ett semikolon efter varje rad/konstruktion, annars får du fel.

Glöm heller inte att konfigfilen måste inkluderas först av allt så att alla felmeddelanden verkligen visas.

När jag har uppdaterat min sidkontroller enligt ovan så har jag nu en variabel `$title` som kan skrivas ut i filen `view/header.php`, det kan se ut så här i inledningen av den filen.

```html
<!doctype html>
<html lang="sv">
<head>
    <meta charset="utf-8">
    <title><?= $title ?> | Me-sidan</title>
```

Det är den sista raden med konstruktionen `<?= $title ?>` som skriver ut innehållet i variabeln. På detta sättet kan vi i varje sidkontroller definera vilket värde vi vill ha på sidans titel.

Uppdatera alla dina sidkontroller och dubbelkolla att de nu visar olika titlar.

[FIGURE src=image/webtec/html-css-php/about.png?w=w3 caption="Här kan du se sidans titel."]

Får du problem eller felmeddelanden så kan du alltid "högerklicka och visa källkod" för att se om det ser rätt ut eller inte.



En favicon till webbplatsen {#favicon}
--------------------------------------

En webbplats kan ha en *favicon*, en liten bild som visas tillsammans med webbplatsen uppe i webbläsarens flik.

Det är något vi kan lägga till i sidans `<head>`-del med följande konstruktion.

```html
    <link rel="shortcut icon" href="img/favicon.png"/>
</head>
```

Du gör ändringen i filen `view/header.php` och det påverkar alla dina sidor/sidkontrollers.

Sedan laddar du om och kan se ikonen, *faviconen*, i webbläsarens flik.

[FIGURE src=image/webtec/html-css-php/favicon.png?w=w3 caption="Här kan du se sidans favicon."]

Formatet för en favicon är vanligen filformatet ICO, men de flesta webbläsare klarar även vanliga PNG-bilder.

Om du inte ser bilden kan du behöva ladda om sidan utan cachen, ett vanligt sätt att göra det är att klicka `shift ctrl r` (Windows, Linux) eller `shift cmd r` på Mac. Då laddas sidan om inklusive alla cachade resurser.



Interna länkar {#interna}
--------------------------------------

Vi har sett hur man kan länka mellan webbsidor med `<a>` men man kan också länka internt i en websida med konstruktionen `#id`. Låt oss ta ett exempel.

I sidan/sidkontrollern `report.php` vill vi förbereda oss för att skriva redovisningstexter till de kommande kursmomenten. Vi skapar då följande HTML struktur.

```
<h1>Redovisning</h1>

<ul>
    <li><a href="#kmom01">kmom01</a></li>
    <li><a href="#kmom02">kmom02</a></li>
</ul>


<h2 id="kmom01">kmom01</h2>

<p>Här kommer redovisningstexten för detta kursmoment.</p>


<h2 id="kmom02">kmom02</h2>

<p>Här kommer redovisningstexten för detta kursmoment.</p>
```

Du kan själv fylla på med kmom03, kmom04, kmom05, kmom06 och kmom10.

Du kan koppla ihop konstruktionen `<a href="#kmom01">` där brädgården följs av ett id som är unikt inom en webbsida. Jag har sedan angett id på de element som jag vill direktlänka till via `<h2 id="kmom01">`. På detta sättet jag skapa interna länkar i ett dokument och direktlänka till en viss del av sidan. I vårt fall har vi skapat en liten innehållsförteckning för dokumentet.

Vill du skapa en länk som leder direkt till redovisningstexten för kmom01 lägger du till `#kmom01` i slutet av länken.

[FIGURE src=image/webtec/html-css-php/report.png?w=w3 caption="En sida med en innehållsförteckning som leder till olika delar av sidans innehåll."]

Prova så att alla interna länkar fungerar. Om sidan inte är så lång så blir det ingen skillnad, som när du klickar på kmom10 så visas hela sidan och den rubriken hamnar alltså inte överst på sidan på grud av det.



En PHP-sida med PHP-kod {#php}
--------------------------------------

Låt oss nu lägga till lite PHP-kod som exekveras och skriver ut dagens datum. Det får bli en liten övning i hur vi kan jobba mer med PHP-koden.

PHP-koden nedan löser detta via den [inbyggda PHP-funktionen `date()`](https://www.php.net/manual/en/function.date.php).

Du kan skapa en ny sidkontroller för detta, eller bara modifiera `me.php` som redan finns.

Placera PHP-koden överst i filen. Det är en bra idé att lägga PHP-koden överst i filen och förbereda inför utskriften genom att spara undan innehåll i variabler `$today` och `$weekday`.

```html
<?php
// Set the timezone to use
date_default_timezone_set('Europe/Stockholm');

// The date of today
$today = date('Y-m-d H:i:s');

// Name of the week day
$weekday = date('l');
?>
```

Koden ovan placerar dagens datum och namnet på veckodagen i två variabler. Dessa kan sedan skrivas ut som en del i webbsidan, på samma sätt som du gjorde med sidans titel tidigare.

Följande kod placerar du tillsammans med HTML-koden på den plats där du vill skriva ut den i webbsidan.

```html
<p>Dagens datum är <?= $today ?> och idag är det <?= $weekday ?>.</p>
```

Så här blev det för mig. Jag nöjer mig med den engelska utskriften, att göra det på svenska kan vi ta en annan dag.

[FIGURE src=image/webtec/html-css-php/date.png?w=w3 caption="Dagens datum och namnet på veckodagen skrivs ut som en del av webbsidan."]

Det är viktigt att du har rätt flöde i filen. De olika konstruktionerna beror på varandra. I min fil ser det ut så här i inledningen av filen.

1. Starta med att inkludera konfigfilen.
1. Skapar de variabler som behövs för att sidan skall kunna renderas.
1. Rendera sidan, börja med headern och fortsätt sedan med main och footern.
    1. Skriv ut värdet på PHP-variablerna.

```html
<?php
include('../config/config.php');

$title = 'Om mig själv';

// Set the timezone to use
date_default_timezone_set('Europe/Stockholm');

// The date of today
$today = date('Y-m-d H:i:s');

// Name of the week day
$weekday = date('l');

include('../view/header.php');
?>

<main>
    <h1>Om Mig Själv</h1>

    <p>Dagens datum är <?= $today ?> och idag är det <?= $weekday ?>.</p>
```



Styla sidan med CSS {#css}
--------------------------------------

Med CSS kan vi ge sidan färg och form. Vi kan styla HTML-elementen och bestämma var de skall visas på sidan och hur de skall se ut. CSS-koden lägger vi i en separat fil och länkar till från HTML-koden.

Börja med att öppna filen `css/style.css` och lägg in följande kod för att ge din sidan en bakgrund och en lagom storlek på bilden.

```css
html {
    background-color: #9C9;
    border: 8px solid #696;
}

body {
    background-color: #8892BF;
    border: 4px solid #4F5B93;
}

main {
    margin: 0 auto;
    max-width: 800px;

    padding: 0.5em;

    border: 4px solid #CCC;
    background-color: #F2F2F2;
    color: #333;
}
```

Därefter går du till filen `view/header.php` och lägger in följande rad så att stylesheeten refereras från webbsidan.

```html
    <link rel="stylesheet" href="css/style.css">
</head>
```

När det är klart så kan du ladda om sidan. Glöm inte möjligheten att forcera omladdning och ladda in även cachade resurser. Det kan behövas eftersom stylesheeten (och bilder) ofta cachas av webbläsaren.

Så här blev det för mig.

[FIGURE src=image/webtec/html-css-php/css.png?w=w3 caption="Nu fick vi lite färg och form till webbsidan."]

Du kan kanske ana att webbsidan är uppbyggd av HTML elementen, man kan nästan se dem som block som ligger på sidan ovanpå varandra. I min style gav jag en ram (border) till några av elementen för att göra det tydligare att de placeras ovanpå varandra.

Färgerna lånade jag från PHPs webbplats.



Developer tools flik Elements {#elements}
--------------------------------------

Om du nu öppnar upp developer tools och väljer fliken "Elements" så kan du se HTML-koden för den renderade sidan. Du kan också klicka på olika delar av HTML-koden och se vilken CSS-kod som ligger bakom. Du kan även uppdatera CSS-konstruktionerna för att testa dig fram med olika konstruktioner och du kan lägga till eller avaktivera andra konstruktioner. Detta är ett bra sätt att utveckla och debugga sin webbsida, man kan se hur CSS-konstruktioner påverka elementet och sin omgivning. När du laddar om sidan så försvinner dina temporära ändringar.

Här använder jag devtools för att prova en alternativ färg på typsnittet.

[FIGURE src=image/webtec/html-css-php/devtools_elements.png?w=w3 caption="Nu fick vi lite färg och form till webbsidan."]

Prova gärna att aktivera, avvaktivera och modifiera olika konstruktioner för att lära dig mer om hur CSS påverkar webbsidans utseende.



En större stylesheet {#cssstor}
--------------------------------------

Som en liten övning valde jag ut en webbplats och jag försökte återskapa vissa delar av dess CSS-kod till min egen webbplats. Ibland är det enklare att ha ett exempel att titta på och låna idéer av.

Jag valde webbplatsen för PHP som såg ut så här.

[FIGURE src=image/webtec/html-css-php/style_php.png?w=w3 caption="Här är webbplatsen för PHP som jag tänkte låna lite style ifrån."]

Genom att inspektera webbplatsen i devtools kan jag se vilka CSS-konstruktioner de använder och sedan kan jag testa dem i min egen stylesheet.

Så här blev min webbplats när jag var "klar".

[FIGURE src=image/webtec/html-css-php/style_php_me.png?w=w3 caption="Nu är jag klar och stylade till min egen webbplats med inspiration från PHPs webbplats."]

Den stylesheet jag använde ser ut så här. Du kan studera de olika konstruktionerna och försöka gissa dig fram till hur de kan påverka sidans utseende.

```css
html {
    margin: 0;
    background-color: #333;
}

body {
    margin: 0;
    font-family: "Fira Sans", "Source Sans Pro", Helvetica, Arial, sans-serif;
}

nav {
    background-color: #8892BF;
    border-bottom: 4px solid #4F5B93;
    color: #EEEEEE;
    overflow: auto;
}

nav a {
    color: #EEEEEE;
    text-decoration: none;
}

nav a:hover {
    color: #4F5B93;
    text-decoration: underline;
}

header {
    background-color: #9C9;
    border-bottom: 2px solid #696;
    color: #EEEEEE;
    overflow: auto;
}

main {
    margin: 0 auto;
    max-width: 800px;

    padding: 0.5em;

    background-color: #F2F2F2;
    color: #333;
}

footer {
    color: #FFF;
}

footer a:link {
    color: #FFF;
}

footer a:visited {
    color: #CCC;
}

footer a:hover {
    color: #9C9;
}
```

Detta får räcka med CSS kod för denna gången, det blir en kort introduktion. Vi kan återkomma till mer CSS en annan gång.



Validera CSS-kod {#validatecss}
--------------------------------------

W3C har en [validator för CSS](https://jigsaw.w3.org/css-validator/). Pröva att kopiera in din kod från stylesheeten och validera den via "Direct input"-metoden.

Det bör se ut ungefär så här.

[FIGURE src=image/webtec/html-css-php/css_validator.png?w=w3 caption="Kopiera in din stylesheet i validatorn."]

Nu kan jag klicka så att stylesheeten valideras.

[FIGURE src=image/webtec/html-css-php/css_validated.png?w=w3 caption="Stylesheeten validerade."]

Du kan också ladda upp din sida på studentservern och validera den genom att ge validatorn länken till din me-sida. Du tar alltså länken till din egen sida och kopiera in den i validatorn.

Så här kan det se ut.

[FIGURE src=image/webtec/html-css-php/css_validate_by_url.png?w=w3 caption="Här kan jag validera stylesheeten via länken till webbsidan."]

Nu bör din stylesheet valideras på samma sätt som tidigare med samma resultat. Denna varianten fungerar inte när du kör din webbplats på localhost, du måste ha din webbplats publicerad på en publik webbserver för att validatorn skall kunna nå den.



Validera CSS via länk {#validatecsslink}
--------------------------------------

För att underlätta validering av sidorna så lägger vi till en direktlänk till CSS-validatorn. Vi gör på liknande sätt som vi gjorde med HTML-validatorn. Lägg till följande länk i din footer tillsammans med HTML validatorn.

```html
<a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a>
```

Ladda upp sidorna på driftsservern för att testa att länken till CSS-validatorn fungerar. Klicka på den och se om din sida validerar.



Unicorn, ett valideringsverktyg för flera tekniker {#unicorn}
--------------------------------------

Det finns ett valideringsverktyg som heter Unicorn som kör både HTML och CSS testerna i en körning. Dessutom kan det köra ytterligare kompletterande tester. Länka även till detta verktyget från din me-sida.

Länken till Unicorn som passar i din footer ser ut så här.

```html
<a href="http://validator.w3.org/unicorn/check?ucn_uri=referer&amp;ucn_task=conformance">Unicorn</a>
```

Så här kan det se ut när du klickar på länken och validerar både HTML och CSS enligt Unicorns validator.

[FIGURE src=image/webtec/html-css-php/unicorn.png?w=w3 caption="Unicorn validerar HTML, CSS och om sidan innehåller ett _feed_ (vilket sidan inte gör)."]

Kom nu ihåg att alltid dubbelkolla att din sida validerar. Hamnar du i trubbel så kollar du alltid först om sidan validerar. Det är ofta första steget i felsökningen, kontrollera att HTML och CSS validerar.



Om HTML-entiteter {#htmlentities}
--------------------------------------

Varför används `&amp;` istället för tecknet `&` när vi länkar till Unicorn ovan?
Du kan testa att ändra din kod och enbart skriva `&`. Validera den sedan i Unicorn. Du får då ett felmeddelande som säger:

> **`&` did not start a character reference. (`&` probably should have been escaped as `&amp;`.)**

Tecknet `&` har en speciell betydelse i HTML och därför kan det ibland behöva ersättas med sin motsvarande HTML entitet `&amp;`. Annars validerar inte HTML-koden, den är inte helt korrekt.

I tabellen nedan är ett par tecken som är reserverade i HTML, de har speciell betydelse. Om man vill att respektive tecken skall skrivas ut i text, eller vara en del av en länk, så behöver man byta ut tecknet mot dess _entity_, eller HTML entitet som det också kallas.

| Tecken | Entity   | Kommentar |
|--------|--------  |-----------|
| `&`    | `&amp;`  | Början på en entitet eller teckensekvens. |
| `<`    | `&lt;`   | Start på en HTML-tagg. |
| `>`    | `&gt;`   | Slut på en HTML-tagg. |
| `"`    | `&quot;` | Start och slut på ett attributs värde. |

Det finns fler tecken som kan konstrueras med HTML entiter. Du kan till exempel skapa ett copyright-tecken &copy; `&copy;` eller ett euro-tecken &euro; `&euro;` med dem.

Specialtecken som euro och copyright kan också skrivas (eller kopieras) direkt in i webbsidan som en utf-8 representation. Det kan vara ett bra alternativ till HTML entiteter, numer använder vi ofta teckenkodningen utf-8 för att skapa webbsidorna och det ersätter vissa av HTML entiteterna.



Link checker {#linkcheck}
--------------------------------------

Ett annat användbart verktyg för att testa och kvalitetskontrollera din webbplats är W3C link Checker som kontroller att alla länkar fungerar på din webbplats, det är både interna länka och externa länker. Verktyget kontrollerar att länkarna leder till en korrekt webbsida eller del av webbsida.

Du kan prova verktyget genom att gå till [W3C Link Checker](https://validator.w3.org/checklink) och sedan kopiera in en länk till den webbsidan på din webbplats som du vill testa. Det tar ett tag för verktyget att testa alla dina länkar och då får ett resultat om alla leder till en giltig sida.

Du kan placera in länken till verktyget i din footer, så att du kommer ihåg den.

```html
<a href="https://validator.w3.org/checklink">Link checker</a>
```



Devtools och de resurser som laddas {#network}
--------------------------------------

När webbsidan laddas av din webbläsare så laddas först källkoden till webbsidan. I källkoden kan det sedan finnas fler resurser som också behöver laddas hem, det kan vara till exempel stylesheeten, faviconen och bilder. Det är alltså en samling av resurser som laddas när en enda webbsida skall visas.

Inuti devtools kan du välja fliken "Network" för att kontrollera vilka resurser som laddas, hur lång tid de tar att laddas, deras storlek och vilken status respektive HTTP request fick.

I bilden nedan visas Network-fliken tillsammans med de resurser som laddas för sidan, vilken HTTP status requesten har, vilken typ av resurs det är och om resursen hämtas från källan eller om den är cachad.

[FIGURE src=image/webtec/html-css-php/inspect_network.png?w=w3 caption="Devtools och networksfliken visar vilka resurser som laddats till sidan."]

En bra sak att notera kan vara att vissa resurser cachas av webbläsaren och laddas inte när man gör reload på sidan. Prova att göra reload på din sida, förutsatt att du har resurser som är cachade, gör sedan en tvingad reload via `shift ctrl r` (`shift cmd r` på Mac) och se att statusen ändras och visar resursens storlek. Det visar att resursen laddades från sin källa och var inte cachad.

[FIGURE src=image/webtec/html-css-php/inspect_network_reload.png?w=w3 caption="Med en tvingande omladdning så laddas alla cachade resurser om."]

Detta verktyg kan vara bra vid felsökning när du vill se vilka resurser som laddas till sidan.



Fler bra resurser att lägga i footern {#resurser}
--------------------------------------

Det finns flera olika typer av stödverktyg som kan vara bra att ha när man utvecklare webbsidor. Här följer ett par som du bör lägga till i din footer.

* [Mät sidans prestanda](https://web.dev/measure/), mät och analysera webbsidans tekniska kvalitet, prestanda och tillgänglighet.
* [CanIUse](https://caniuse.com/), en webbplats som visar vilke HTML & CSS konstruktioner som stöds av olika versioner av webbläsare.
* [CodePen](https://codepen.io/), ett utvecklingsverktyg där du kan skriva HTML och CSS för att testa konstruktioner som du även kan dela med din kompis. Det finns även ett stort utbud av konstruktioner som du kan låna eller hämta inspiration ifrån.

Placera länkarna i din footer så tappar du inte bort dem.



Avslutningsvis {#avslutning}
--------------------------------------

Nu har du kommit igång och du har grunden till en webbplats som bygger på HTML, CSS och PHP. Som du kanske märker så kan det vara klurigt att se hur dessa tekniker samverkar med varandra. Men kortfattat har vi alltså följande.

* HTML för att strukturera innehållet i sidan.
* CSS för att ge de olika elementen i sidan utseende och style.
* PHP körs på serversidan och renderar HTML och innehåll i sidan.

När det gäller felsökning så är det bra att ha följande i minnet.

* Webbläsaren tar en url och försöker hämta den, normalt via en webbserver.
* Webbservern tar resurser, eventuellt exekveras PHP-koden, och svaret skickas tillbaka till webbläsaren.
* Webbläsaren får källkoden till sidan (högerklicka och visa källkod).
* Webbläsaren hämtar hem alla övriga resurser som sidan refererar till, i vårt fall är det bilder och stylesheet (se devtools networks-fliken).
* Webbläsaren parsar sidan (se den parsade HTML och CSS strukturen i devtools elements-fliken).

Försök vara strukturerad när du felsöker och ha alltid ovan flöde i minnet. Det är bra om du själv kan avgränsa och se vad i flödet som felet eventuellt inträffar.

Lycka till i din framtida karriär som (webb) programmerare.
