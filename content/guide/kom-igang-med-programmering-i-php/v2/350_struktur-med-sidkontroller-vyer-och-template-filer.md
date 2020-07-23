---
author: mos
revision:
    "2018-03-13": "(A, mos) Första versionen, uppdelad av större dokument."
...
Struktur med sidkontroller, vyer och templatefiler
=======================

Låt oss göra en uppdaterad struktur för vårt exempelprogram, en struktur som tar ett steg till att separera olika typer av kod i olika filer.



Översikt av filer i katalogstruktur {#katalogstruktur}
----------------------

Följande struktur och filer har jag nu i min uppdaterade struktur för exempelprogrammen. Jag använder terminalen och kommandot `tree` för att visa en trädstruktur av mina kataloger och filer.

```text
$ tree .
.
├── config.php
├── page.php
├── src
│   └── functions.php
├── view
    ├── footer.php
    └── header.php
```

Låt oss gå igenom filerna en och en.



En sidkontroller page.php {#sidkontroller}
----------------------

Vi börjar med grunden i sidkontrollern, den som i mitt exempel är döpt till `page.php`. Det är den som webbläsaren öppnar och det är där som allt börjar.

Denna filen ger sedan en grundstruktur för vad som händer när den resulterande webbsidan skapas.

Så här är grunden i `page.php`.

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



Konfiguration i config.php {#config}
----------------------

Det första som händer i sidkontrollern är att filen `config.php` inkluderas.


```php
// Include the configuration file
include(__DIR__ . "/config.php");
```

När filen config.php läses in så sätter den grunden för sidan, ofta sätter man vilken typ av felhantering som skall ske, i utvecklingssammanhang så vill man visa alla felmedelanden och om webbplatsen är i produktion och körs live, så vill man inte visa eventuella felmeddelanden för användaren då det kan innebära säkerhetsrisker och mindre bra användbarhet i allmänhet.

Om man använder en databas så kan man lägga information om hur man kopplar sig till databasen i denna filen.

För tillfället ser innehållet i filen `config.php` ut så här.

```php
<?php
/**
 * Configuration file with common settings.
 */
error_reporting(-1);              // Report all type of errors
ini_set("display_errors", 1);     // Display all errors
```


Funktioner i egen fil {#functions}
----------------------

Nästa sak som händer i sidkontrollern är att filen `src/functions.php` inkluderas.

```php
// Include essential functions
include(__DIR__ . "/src/functions.php");
```

Här är tanken att samla bra-att-ha funktioner som kan användas i vyer och övrig källkod. Än så länge finns inga funktioner definierade, men det kommer när vi lär oss hur dessa kan skapas.

Innehållet i filen `src/functions.php` är tomt, så när som på en kommentar.

```php
<?php
/**
 * Definitions of commonly used functions.
 */
```



En templatefil för header.php {#header}
----------------------

Nästa sak som händer i sidkontrollern är att sidans titel sätts i en variabel och därefter inkluderas och processas header vyn via templatefilen `view/header.php`.

```php
// Set common variables, these are exposed to the view template files
$title = "Test page";

// Include the page header through the view template file
include(__DIR__ . "/view/header.php");
```

Innehållet i filen `view/header.php` är tänkt att generera webbsidans översta innehåll, där ingår det att skriva ut webbsidans titel.

Så här ser min enkla templatefil ut för `view/header.php`.

```html
<!doctype html>
<html lang="en">
<title><?= $title ?></title>

<pre>
```



Sidans huvudsakliga innehåll {#main}
----------------------

Nästa steg är att sidkontrollern själv skriver ut sidans huvudsakliga innehåll. I mina testprogram sker det via `echo` men om man gör mer "riktiga" sidor så kan det ske via templatefiler eller anrop till databaser.

```php
// Here is my testprogram which outputs the page main content
echo "Hello my test page.";
```

Här kan man naturligtvis ta hjälp av en eller flera specialiserade templatefiler som med fördel kan sparas i `view/` katalogen. Säg att du vill skriva ut innehåll i artiklar, då kanske du har innehållet i en annan fil som du sedan renderar med en templatefil. Så här.

```php
// Get content from a file
$content = file_get_contents(__DIR__ . "/content/my-blog-article.txt");

// Render a view using a templatefile
require __DIR__ . "/view/article.php";
```

Ovan visar ett exempel på hur man kan separera olika typer av innehåll i olika filer. Artikelns innehåll ligger i filen "content/my-blog-article.txt" och via templatefilen "view/article.php" skapas en del av den slutliga html sidan.

Ju mer du lär dig, ju mer kommer du att inse att det är viktigt att separera olika typer av kod och information i olika delar. Det blir enklare att prata om koden och innehållet och framförallt enklare att utveckla och underhålla koden.

Denna uppdaterade strukturen på testprogrammet är ett steg i den riktningen, att underlätta strukturen för en växande kodbas.



Sidans footer {#footer}
----------------------

Det sista som sker i sidkontrollern är att webbsidans footer och avslutande del inkluderas via dess templatefil.

```php
// Include the page footer through the view template file
include(__DIR__ . "/view/footer.php");
```

När man inkluderar en templatefil på det viset, eller vilken fil som helst, så blir alla variabler som är definierade, synliga i den filen. Man kan alltså definiera variabler i sidkontrollern och samma variabler blir sedan synliga och kan användas i templatefilen som renderar vyn.

I templatefilen `view/footer.php` händer inte så mycket mer än att ett par html-element stängs.

```html

</pre>

</html>
```



Avslutningsvis om sidkontroller {#sid}
----------------------

Syftet med att strukturera sin kod i en sidkontroller är att den har full kontroll över hur den resulterande webbsidan renderas. Allt utgår från sidkontrollern och alla filer som inkluderas är synliga i själva sidkontrollern som blir en översta nivå för all kod.

Att prata om templatefiler som renderar vyer som delar av den slutliga webbsidan är en terminologi som är vanlig i webbsammanhang. Det handlar egentligen bara om olika php-filer som inkluderas, det är vi själva som ger en struktur som säger att alla templatefiler ligger i katalogen `view/`. Det gör det enklare att separera kod och påvisa att olika kod och filer har olika syften och roller att fylla när webbsidan genereras.

Sakta och säkert försöker vi bygga upp ett synsätt på vikten av struktur och en terminologi som gör det enklare att samtala kring kodandet.
