---
author: mos
category:
    - webbprogrammering
    - kurs htmlphp
    - php
revision:
    "2018-09-07": "(B, mos) Uppdaterat struktur på multisidan så titel fungerar."
    "2018-08-22": "(A, mos) Omskriven och genomarbetad i en ny version 2."
...
Bygg en multisida med PHP (v2)
==================================

[FIGURE src=image/snapht18/multipage.png?w=c5 class="right"]

Vi skall göra något som jag väljer att kalla för en multisida med PHP, eller en "sidkontroller för en multisida". Det är en sida som har en navigeringsmeny i den vänstra kolumnen och beroende av vilket val man där gör så visas olika innehåll i den högra kolumnen av sidan.

När vi är klara så kan vi integrera vår multisida i vår me-sida och skapa två nivåer av navigering på webbplatsen.

Det blir en programmeringsövning i att använda konstruktioner i php, att skriva templatefiler och sammanfoga delarna till en gemensam webbsida, i det som vi kallar multisida.

<!--more-->

Så här kan en multisida se ut, färglagd i pastellfärger.

[FIGURE src=image/snapht18/multipage.png?w=w3 caption="En multisida i PHP, navigeringsmeny i vänsterkanten och färgad i pastellfärger."]

Du kan se på multisidan som en utökad variant än den sidkontroller som vi hittills använt.

Låt oss börja så klarnar det säkert.



Förutsättningar {#pre}
---------------------------------

Du har en me-sida liknande den från artikeln [Skapa en webbsida med HTML, CSS och PHP, steg 2](kunskap/skapa-en-webbsida-med-html-css-och-php-steg-2). Du behöver inte använda den i själva artikeln, men tanken är att du har motsvarande kunskaper.

Du har också jobbat igenom stycket "[Datastrukturer i guiden Kom igång med programmering i PHP](guide/kom-igang-med-programmering-i-php/datastrukturer)" där du fick grunden för sidkontrollern.



Exempel på en multisida {#exempel}
--------------------------------------

I kursrepot finns ett exempel på en multisida under [`example/multipage`](https://github.com/mosbth/htmlphp/tree/master/example/multipage).

Låt nu se hur denna multisida är uppbyggd.



Grundstrukturen för en multisida {#multisida}
--------------------------------------

Låt oss börja med en visuell bild av den sidan jag vill ha. Jag vill ha en sida, som visar en meny i vänsterkolumnen (eller högerkolumnen). Jag vill ha en mängd menyval som jag kan klicka på och sedan visa olika innehåll. Jag vill samla allt detta i en kodstruktur som blir grunden till en "multisida".

Utseendemässigt skulle det kunna se ut så här i webbläsaren.

[FIGURE src=image/snapht18/multipage.png?w=w3 caption="En multisida i PHP, navigeringsmeny i vänsterkanten och färgad i pastellfärger."]

Färgerna är i pastell, men med hjälp av dem kan du enkelt se exakt vilken div som är vilken och hur stylen påverkar de olika delarna i sidan. Se det som ett utvecklingsverktyg för att förstå hur de olika html-elementen renderas i webbsidan.



### HTML-struktur för multisidan {#htmlstrukt}

Den bakomliggande html-strukturen kan exemplifieras med följande kod.

```html
<div class="wrap-main">

    <aside>
        <!-- The navigation menu -->
    </aside>

    <main>
        <article>
            <!-- The main content, included from a sub page. -->
        </article>
    </main>
</div>
```

Vi har sidomenyn med navigeringen och vi har det huvudsakliga innehållet som inkluderas från en separat fil. Allt wrappas i en div för att underlätta stylning.



### CSS-struktur för multisidan {#cssstrukt}

Med css-kod organiserar vi så att navigeringen flyter till vänster om main.

```css
main {
    width: 70%;
    float: left;
}

aside {
    width: 30%;
    float: left;
}
```

Det är grunden i den html och css-kod som krävs för multisidan.



Sidkontroller blir till multisida {#sidkontroller}
--------------------------------------

Vi tittar på den sidokontroller som vi tidigare använt. Koden för den ser ut så här.

```php
<?php
/**
 * This is a sample page controller.
 */
// Include the configuration file
include(__DIR__ . "/config.php");

// Include essential functions
include(__DIR__ . "/src/functions.php");

// Set common variables, these are exposed to the view template files
$title = "Test page";

// Include the page header through the view template file
include(__DIR__ . "/view/header.php");



// Here is my testprogram which outputs the page main content
echo "Hello my test page.";



// Include the page footer through the view template file
include(__DIR__ . "/view/footer.php");
```

Det är grunden för den sidkontroller som använts i guiden "Kom igång med programmering i PHP" och du bör känna igen den.

För att bygga ut den till en "multipage controller", eller "pagecontroller for a multipage", så gör vi följande steg.

Först så tar vi bort denna delen som är sidans huvudsakliga innehåll.

```php
// Here is my testprogram which outputs the page main content
echo "Hello my test page.";
```

Vi ersätter med logiken för att hantera en multisida.

```php
// Get what subpage to show, defaults to index
$pageReference = $_GET["page"] ?? "index";

// Get the filename of this multipage, exkluding the file suffix of .php
$base = basename(__FILE__, ".php");

// Create the collection of valid sub pages.
$pages = [
    "index" => [
        "title" => "Intro to this multipage.",
        "file" => __DIR__ . "/$base/index.php",
    ],
    "print-get" => [
        "title" => "Print the content of \$_GET variable.",
        "file" => __DIR__ . "/$base/print-get.php",
    ],
    "get-samples" => [
        "title" => "Try various links using GET queryparams.",
        "file" => __DIR__ . "/$base/get-samples.php",
    ],
    "print-server" => [
        "title" => "Print the content of \$_SERVER variable.",
        "file" => __DIR__ . "/$base/print-server.php",
    ],
];

// Get the current page from the $pages collection, if it matches
$page = $pages[$pageReference] ?? null;

// Include the main multipage content through the view template file
require __DIR__ . "/view/multipage.php";
```

Det var i grova drag det som behövs för en multisida. Låt oss finslipa lite.



Bygg upp innehåll, rendera i slutet {#renderaslut}
--------------------------------------

I slutet av detta stycket kan du se den slutliga strukturen på multisidan.

Jag vill göra en ändring till i strukturen i multisidan, jag vill göra sidans rendering i slutet av sidkontrollern. Sidans rendering är när jag inkluderar vyerna som _renderar_, skriver ut den slutliga webbsidans innehåll.

Det är dessa tre delar som jag vill skall ske i slutet av sidan.

```php
// Include the page header through the view template file
require __DIR__ . "/view/header.php";

// Include the main multipage content through the view template file
require __DIR__ . "/view/multipage.php";

// Include the page footer through the view template file
require __DIR__ . "/view/footer.php";
```

Dessa tre vyer har till ansvar att rendera hela webbsidan med dess innehåll. Det som sker innan de kan börja jobba handlar om att skapa variabler som vyerna kan jobba på.

Förenklat kan man säga att vårt skript, vår sidkontroller, numer multisidkontroller, har följande arbetssätt.

1. Samla värden i variabler.
2. Gör variablerna tillgängliga för vyerna.
3. Rendera vyerna.

Jag flyttar tunt koden i multisidan och slutresultatet blir så här.

```php
<?php
/**
 * This is a page controller for a multipage. You should name this file
 * as the name of the pagecontroller for this multipage. You should then
 * add a directory with the same name, excluding the file suffix of ".php".
 * You then then have several multipages within the same directory, like this.
 *
 * multipage.php
 * multipage/
 *
 * some-test-page.php
 * some-test-page/
 */
 // Include the configuration file
 require __DIR__ . "/config.php";

 // Include essential functions
 require __DIR__ . "/src/functions.php";

// Get what subpage to show, defaults to index
$pageReference = $_GET["page"] ?? "index";

// Get the filename of this multipage, excluding the file suffix of .php
$base = basename(__FILE__, ".php");

// Create the collection of valid sub pages.
$pages = [
    "index" => [
        "title" => "Intro to this multipage.",
        "file" => __DIR__ . "/$base/index.php",
    ],
    "print-get" => [
        "title" => "Print the content of \$_GET variable.",
        "file" => __DIR__ . "/$base/print-get.php",
    ],
    "get-samples" => [
        "title" => "Try various links using GET queryparams.",
        "file" => __DIR__ . "/$base/get-samples.php",
    ],
    "print-server" => [
        "title" => "Print the content of \$_SERVER variable.",
        "file" => __DIR__ . "/$base/print-server.php",
    ],
];

// Get the current page from the $pages collection, if it matches
$page = $pages[$pageReference] ?? null;

// Base title for all pages and add title from selected multipage
$title = $page["title"] ?? "404";
$title .= " | Test multipage";

// Render the page
require __DIR__ . "/view/header.php";
require __DIR__ . "/view/multipage.php";
require __DIR__ . "/view/footer.php";
```

Låt oss gå igenom multisidans olika delar för att förklara dess syften.



Navigering till en multisida {#navigering}
--------------------------------------

En multisida representeras av en sidkontroller, en fil, till exempel `multipage.php`. Man kan alltid gå till en multisida genom att ange dess filnamn som länk.

En multisida består av flera undersidor. När man navigerar till en multisida kan man ange vilken undersida man vill se. I min multisida innebär det att man sätter GET-variabeln till `?page=page-reference` där värdet "page-reference" pekar ut en viss undersida.

I koden för multisidan representeras detta av denna delen.

```php
// Get what subpage to show, defaults to index
$pageReference = $_GET["page"] ?? "index";
```

Konstruktionen kontrollerar om GET innehåller en nyckel "page" och tar då dess värde, annars används defaultvärdet "index". Jag har alltså en default undersida som jag döper till "index". Man hamnar på den när man inte använt en referens till en undersida.

Följande är alltså tänkt som giltiga länkar till min multisida.

* `multipage.php`
* `multipage.php?page=index`



Spara undersidor i en katalog {#undersidor}
--------------------------------------

Jag har valt en struktur där multisidan hämtar sina undersidor från en katalog. Om multisidan heter `multipage.php` så hämtas undersidorna från katalogen `multipage/filnamn.php`. Det är ingen hård koppling, men det är så jag tänkte mig att strukturen kan se ut.

I mitt exempel får jag då följande filer, multisidan och dess undersidor.

```text
├── multipage.php
├── multipage
│   ├── get-samples.php
│   ├── index.php
│   ├── print-get.php
│   └── print-server.php
```

Om jag vill skapa en ny multisida så kan jag kopiera `multipage.php` och sedan skapa en ny katalog som motsvarar namnet på den nya multisidan.

I koden för multisidan är det följande kodrad som klurar ut var undersidorna ligger.

```php
// Get the filename of this multipage, exkluding the file suffix of .php
$base = basename(__FILE__, ".php");
```

Genom att använda sökvägen till nuvarande fil `__FILE__` så hämtas värdet ut på katalogen som är tänkt att innehålla undersidorna.



Detaljer om undersidor {#detaljer}
---------------------------

Den multisidan jag bygger behöver konfigureras så att den känner igen de undersidor som är giltiga. Det gör jag med en array `$pages` som är tänkt att innehålla detaljer om alla giltiga undersidor.

Så här kan det se ut.

```php
// Create the collection of valid sub pages.
$pages = [
    "index" => [
        "title" => "Intro to this multipage.",
        "file" => __DIR__ . "/$base/index.php",
    ],
    "print-get" => [
        "title" => "Print the content of \$_GET variable.",
        "file" => __DIR__ . "/$base/print-get.php",
    ],
    "get-samples" => [
        "title" => "Try various links using GET queryparams.",
        "file" => __DIR__ . "/$base/get-samples.php",
    ],
    "print-server" => [
        "title" => "Print the content of \$_SERVER variable.",
        "file" => __DIR__ . "/$base/print-server.php",
    ],
];
```

Det vi har är en array, en key-value array där varje key pekar ut en array som innehåller detaljer om en undersida. En array som innehåller andra arrayer.

För varje undersida finns nu en nyckel som kan mappas som den sidreferens som kommer in via GET-argumentet. Till exempel kan länken `?page=index` mappas mot `$page["index"]`. Därmed kan också göras en mappning mot den specifika undersidans filnamn. Man kan referera till en undersidas filenamn via `$pages["index"]["file"]`.

I koden för multisidan sker mappningen mellan requesten, den sida som efterfrågas, och de sidor som är tillgängliga, via följande kodsekvens.

```php
// Get the current page from the $pages collection, if it matches
$page = $pages[$pageReference] ?? null;
```

Nu innehåller variabeln `$page` informationen om den sidan som efterfrågas. Om undersidan inte är definierad så innehåller den `null`.



Templatefil för multisidan {#template}
-------------------------------

Vi har nu samlat ihop detaljer om den undersida vi vill visa. Ansvaret för att rendera själva sidan delegerar vi till en vy i form av templatefilen `view/multipage.php`. Denna vy är samma för alla multisidor, oavsett vad de heter.

Vyn renderas utifrån `multipage.php` enligt följande.

```php
// Include the main multipage content through the view template file
require __DIR__ . "/view/multipage.php";
```

Det är här all rendering av multisidans innehåll sker, både navigeringen och innehållet från undersidorna. Arbetet sker med hjälp av variablerna `$page` och `$pages`.

Det som sker är en rendering av navigeringsvyn och en rendering av själva sidans innehåll.

Låt oss titta på dem, var för sig, det är två olika templatefiler.



### Templatefil view/multipage.php {#viewmultipage}

Först öppnar vi templatefilen `view/multipage.php`.

```html
<div class="wrap-main">

<?php require __DIR__ . "/multipage-aside.php" ?>

    <main>
        <article>
            <?php if ($page) : ?>
                <?php require $page["file"] ?>
            <?php else : ?>
                <p>You have selected a page reference '<?= htmlentities($pageReference) ?>' that does not map to an actual page.</p>
            <?php endif; ?>
        </article>
    </main>
</div>
```

Ovan ser du grunden för den html-struktur vi vill uppnå för multisidan.

Det som renderar undersidans huvudsakliga innehåll utifrån en undersida, är följande.

```php
<?php if ($page) : ?>
    <?php require $page["file"] ?>
<?php else : ?>
    <p>You have selected a page reference '<?= htmlentities($pageReference) ?>' that does not map to an actual page.</p>
<?php endif; ?>
```

Först kontrollera vi om variabeln `$page` har ett värde vilket säger oss att det är en giltig undersida. Om så är fallet så inkluderas undersidan via dess filnamn, annars skriver vi ut ett felmeddelande.



### Templatefil för navigering {#templatenavigate}

Templatefilen för navigeringsvyn ligger i `view/multipage-aside.php`. Den ser ut så här.

```html
<aside>
    <nav>
        <ul>
        <?php foreach ($pages as $key => $value) : ?>
            <li><a href="?page=<?= $key ?>"><?= $value["title"] ?></a></li>
        <?php endforeach; ?>
        </ul>
    </nav>
</aside>
```

Bortsett från html-strukturen som ger en meny via en ul/li-lista så är det följande del som utifrån arrayen `$pages` automatiskt genererar delarna för navigeringen.

```html
<?php foreach ($pages as $key => $value) : ?>
    <li><a href="?page=<?= $key ?>"><?= $value["title"] ?></a></li>
<?php endforeach; ?>
```

Det vi ser är en loop över alla element i arrayen `$pages` och med hjälp av den informationen skapas en flexibel navigeringsmeny.



Säker programmering i PHP {#secure}
----------------------------------------------------

Man vill alltid skriva säker kod. Man vill inte erbjuda säkerhetshål till användaren. Man vet aldrig om användaren är snäll eller inte. Man vill inte lämna öppningar för användaren att förstöra din webbplats, eller öppningar för att använda din webbplats för att göra bedrägerier mot andra användare.

Låt oss därför titta på koden för multisidan och se vilka potentiella hot den innehåller.



### Koda utskriften med htmlentities() {#htmlent}

I följande kodsekvens i filen `view/multipage.php` anropar jag funktionen [`htmlentities()`](http://php.net/htmlentities) för att koda om innehållet i `$pageReference` och göra det "säkert" för utskrift, innan det skrivs ut på webbsidan.

```html
<?php if ($page) : ?>
    <?php require $page["file"] ?>
<?php else : ?>
    <p>You have selected a page reference '<?= htmlentities($pageReference) ?>' that does not map to an actual page.</p>
<?php endif; ?>
```

I detta fallet är `$pageReference` hämtat direkt från querystringen och `$_GET["page"]` vilket innebär att användaren kan skriva precis vad den vill.

Med funktionen `htmlentites()` kodas innehållet så att jag kan kan skriva ut, även känsliga saker, på webbsidan. Om jag inte hade skyddat mig på detta viset så hade jag utsatt min webbplats för en attack som kallas [Cross-site scripting (XSS)](https://en.wikipedia.org/wiki/Cross-site_scripting). Jag hade öppnat upp så att någon hade kunnat köra ett JavaScript via min länk.

En länk likt denna hade varit en möjlighet för XSS.

```text
?page=<script>alert("You got XSS:ed. Got ya.");</script>
```

Med anropet till `htmlentities()` så skrivs texten ut som ren text. Utan anropet så kommer texten att representera kod i JavaScript som körs i webbläsaren hos den som klickat på länken.

Här är ett exempel på när man har skyddat sig via funktionen htmlentities.

[FIGURE src=image/snapht18/xss-no.png?w=w3 caption="Här skrivs koden ut direkt i webbsidan, utan bekymmer, med hjälp av funktionen htmlentities."]

Man kan titta på webbsidans källkod så ser man hur den "farliga strängen" har konverterats till html-entiteter. Det är tecknet `<` som ersatts med `&lt;`, tecknet `>` har erstts med `&lt;` och så vidare för de tecken som kan användas till "farliga" saker.

Så här ser källkoden ut.

```html
<p>You have selected a page reference '&lt;script&gt;alert(&quot;You got XSS:ed. Got ya.&quot;);&lt;/script&gt;' that does not map to an actual page.</p>
```

När du inte har skyddat dig så kan det se ut så här när koden för JavaScriptet körs.

[FIGURE src=image/snapht18/xss.png?w=w3 caption="Här används inte htmlentities och webbplatsen kör JavaScript-koden som användaren skickat in."]

Glöm inte följande.

> _Om du skriver ut text på din webbsida som kommer från användaren, eller om du inte kan fullt ut lita på dess innehåll, använd då `htmlentities()` för att skydda dig från XSS-attacker._




### Lita aldrig på inkommande variabler {#inkommande}

Exemplet med XSS innebär att du aldrig skall lita på inkommande variabler, variabler som användaren kan påverka.

En annan variant på samma tema handlar om att undvika risken med [File inclusion vulnerability](https://en.wikipedia.org/wiki/File_inclusion_vulnerability) vilket innebär att användaren själv kan välja att inkludera en fil från din dator.

I multisidan så inkluderas en undersida, baserat på den sidreferens som kommer in via `?page=index`. Undersidan inkluderas sedan i princip som `require $base/index.php`.

Tänk om du istället hade skrivit följande kod, i ett försök att skapa mer flexibel kod som magiskt förbereder för fler undersidor.

```php
require "$base/{$_GET["page"]}"
```

Då hade du erbjudit användaren en möjlighet att visa en godtycklig fil från ditt system. Till exempel kan användaren se innehållet i filen `etc/passwd` som innehåller en lista över de användare som finns på ditt system.

[FIGURE src=image/snapht18/file-inclusion.png?w=w3 caption="Webbplatsen är öppen för file inclusion och användaren kan visa innehållet i passwd-filen."]

I multisidan hanterar vi säkerheten kring detta genom att lagra alla undersidor i en variabel `$pages` och där har vi "hårdkodat" sökvägen till respektive undersida. Det finns då ingen möjlighet för användaren att påverka vilken undersida som inkluderas. Vi har själva kontrollen och kan dubbelkolla att undersidans referens är giltig och att undersidans filnamn är det rätta.

```php
$pages = [
    "index" => [
        "title" => "Intro to this multipage.",
        "file" => __DIR__ . "/$base/index.php",
    ],
];

// Get the current page from the $pages collection, if it matches
$page = $pages[$pageReference] ?? null;
```

Ovan struktur hjälper oss så att enbart giltiga undersidor kan visas.

Glöm inte följande.

> _Testa alltid inkommande värden. Lita inte på dem. Översätt dem till dina egna värden och se till att de ligger inom en förväntad värdemängd och typ._

Det var lite om säker programmering i PHP. Det finns en [forumtråd som handlar om säker programmering i PHP](t/1702), kika gärna där om du är intresserad av att dyka ner i ämnet.




Borde man alltid testa inkommande värden? {#testin}
-----------------------------------------------

Du behöver ha koll på inkommande värden som användaren skickar till ditt php-skript. Inkommande värden kan komma via querysträngen och GET, eller via SERVER. Den typen av värden skall man vara försiktig med och alltid tolka som att de kan innehålla osäkra konstruktioner.

Det finns ett koncept som heter "[fail fast, fail hard](https://en.wikipedia.org/wiki/Fail-fast)" vilket innebär att du tidigt testar mot felaktiga värden och är något fel så avbryter du skriptet. Det finns ingen anledning att fortsätta exekveringen av skriptet då det ändå kommer att fallera lite senare.

I vårt fall med multisidan har vi god felhantering för denna typen av felaktiga inkommande värden. Men låt oss titta på ett exempel där man tidigt i skriptet hade kunnat avbryta exekveringen.

```php
// Get what subpage to show, defaults to index
$pageReference = $_GET["page"] ?? "index";

// Check if pageReference is a valid page in $pages.
if (!array_key_exists($pageReference, $pages)) {
    die("Invalid reference to a page.");
} 

// Continue to do actual work, now a bit more safe
```

Det är en god praktik att alltid testa inkommande variabler. Om inkommande inte matchar förväntningarna så kan man lika gärna avbryta skriptet. 

Ett synsätt på hur man kan hantera sådant här är alltså att misslyckas tidigt och hårt.

> _"Fail fast, fail hard."_



Avslutningsvis {#avslutning}
--------------------------------------

Vi har skapat en struktur för en multisida, en _pagecontroller for multipages_, eller en sidkontroller för en multisida, om vi säger det på svenska.

En multisida kan vara en behändig struktur när man bygger webbplatser på detta sättet.

Framförallt fick vi ett exempel på hur olika php-konstruktioner kan samverka för att generera en webbsida och vi fick möjlighet att prata om strukturer för filer och kataloger där filerna har olika syften och ibland blandas med html och ibland inte.

Det finns en [egen tråd för denna artikel i forumet](t/7550), fråga där om du behöver hälp eller om du vill bidra med tips och trix.
