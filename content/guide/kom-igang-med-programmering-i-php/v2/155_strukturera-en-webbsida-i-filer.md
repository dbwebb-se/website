---
author: mos
revision:
    "2018-06-21": "(A, mos) Första versionen, uppdelad av större dokument."
...
Strukturera en webbsida i filer
=======================

Vi ser hur vi kan strukturera en webbsida i tre delar, sidans header, sidans footer och sidans själva innehåll. Vi lägger respektive del i varsin fil och använder include för att sätta samman filerna till en enhet.



Inkludera för att strukturera en webbsida {#include-webb}
-----------------------

Vi utgår från den uppdaterade `template1.php` som nu inkluderar en konfigurationsfil. Vi ser i filen att det som är en gemensam "header" består av `<pre>` och den gemensamma footern består av `</pre>`. Det är inte mycket till header och footer men låt oss ändock separera dessa delar i olika filer.

Så här ser grundfilen `template1.php` ut.

```php
<?php
include(__DIR__ . "/config.php");
?>

<pre>
<?php

// Here is my testprogram
echo "hello";

?>
</pre>
```

Låt oss nu strukturera om den i tre olika filer.

Vi skapar filen `header.php`, sidans gemensamma header.

```php
<pre>
```

Vi skapar filen `footer.php`, sidans gemensamma footer.

```php
</pre>
```

Vi kan nu inkludera dessa bitar till en enhet, en webbsida, via en ny fil `page.php`.

```php
<?php
include(__DIR__ . "/config.php");
include(__DIR__ . "/header.php");

// Here is my testprogram
echo "hello";

include(__DIR__ . "/footer.php");
?>
```

Det vi får är en mer uppdelad struktur där vi separerar html-koden bort från php-koden samtidigt som vi får kod-enheter i olika filer som är enklare att hantera och uppdatera. 

För att bli en duktig utvecklare så är ordning, reda och struktur i koden viktiga ledord.

Det vi ser ovan är ett exempel på ett designmönster "pagecontroller", en sidkontroller. Det är ett designmönster för webbplatser där man samlar all kod i en fil, en pagekontroller. Den filen ger alla förutsättningar, från start till slut, för att skapa en webbsida på egen hand.

Designmönster är en benämning på vanliga kodlösningar som har kommit fram av erfarenhet och god praxis.

Prova nu själv att göra en liknande struktur för dina exempelprogram. Glöm inte att ta bort den avslutande phptaggen när den står sist i filen.
