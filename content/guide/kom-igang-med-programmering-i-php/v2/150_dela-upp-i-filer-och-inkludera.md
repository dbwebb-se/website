---
author: mos
revision:
    "2018-03-13": "(A, mos) Första versionen, uppdelad av större dokument."
...
Dela upp i filer och inkludera
=======================

När du börjar skriva mycket kod så vill du dela in din kod i olika delar. Det är enklare att underhålla mindre väl avgränsade delar än en stor klump av kod. Att dela in koden i mindre delar gör det också enklare att återanvända den.

 Ett sätt att organisera koden är att dela in den i filer och inkludera filerna när det behövs med [`include()`](http://php.net/manual/en/function.include.php) eller [`require()`](http://php.net/manual/en/function.require.php).



Inkludera en konfigurationsfil {#include}
-----------------------

Om vi tittar på det exempelprogram `template.php` vi gjorde tidigare, så ser vi att det innehåller delar som återanvänds i varje skript. Borde vi inte kunna strukturera koden lite annorlunda med include?

```php
<?php
error_reporting(-1);              // Report all type of errors
ini_set("display_errors", 1);     // Display all errors 
?>

<pre>
<?php

// Here is my testprogram
echo "hello";

?>
</pre>
```

Säg att vi flyttar konfigurationsdelen, den som berättar att vi vill skriva ut felmeddelandena, till en egen fil `config.php`.

```php
<?php
error_reporting(-1);              // Report all type of errors
ini_set("display_errors", 1);     // Display all errors 
?>
```

Eftersom filen nu enbart består av php-kod så tar vi bort sluttaggen i filen.

Vi kan nu göra ett nytt testprogram `template1.php` som inkluderar konfigurationsfilen.

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

Vinsten är att vi nu har en gemensam konfiguration för alla testprogram och om vi ändrar i den gemensamma konfigurationen så påverkar det alla testprogram. Det är bra, om man vill ha det så.

I vårt fall är konfigurationen för felutskrifter en gemensam del som kan delas av alla testprogram.

I längden handlar programmering en hel del om att ha en god struktur och att fördela koden i olika enheter, filer, funktioner och klasser. Det vi ser här är ett första exempel på hur man kan fördela kod i olika filer.



Include eller require? {#require}
-----------------------

Skillnaden på `include()` och `require()` är felhanteringen. Om filen saknas så *avbryter* `require()` exekveringen med ett felmeddelande medan `include()` ger ett felmeddelande men *fortsätter exekveringen*. Vilket som är bäst att använda beror på sammanhanget och du kan själv välja vilket du tycker passar bäst.

Det finns även två varianter som heter [`include_once()`](http://php.net/manual/en/function.include-once.php) och [`require_once()`](http://php.net/manual/en/function.require-once.php). Skillnaden är att de kontrollerar att filen endast inkluderas en gång, i vissa sammanhang, när filer inkluderar varandra, kan det vara en bra möjlighet att använda.



Konstanter `__FILE__` och `__DIR__` för absolut sökväg {#sokvag}
-----------------------

När man inkluderar filer så vill man ibland använda absolut sökvägen till filerna. Då har man användning av konstanterna `__FILE__` och `__DIR__`. Dessa konstanter ger sökvägen till den filen som nu exekveras, eller till den katalog som filen finns i.

Om du vill inspektera värdet på dessa konstanter så kan du skriva ut dem.

```php
echo __FILE__;
echo __DIR__;
```

Här ser du ett par exempel på hur du kan använda konstanter tillsammans  med ett filnamn för att ge en absolut sökväg.

```php
// Include using a relative path
include("config.php");

// Include using an absolute path
include(__DIR__ . "/config.php");
include(dirname(__FILE__) . "/config.php");
```

När du inkluderar med en relativ sökväg så är det relativt det allra första php-skriptet som exekveras. Om du inkluderar filer som inkluderar filer så är det fortfarande en relativ sökväg mot det allra första skriptet. Det är därför enklare och mer feltolerant att använda sig av absoluta sökväger, man bheöver då enbart ha koll på nuvarande fil och dess förhållande till de filer den vill inkludera.



Magiska konstanter {#magic}
-----------------------

I språket finns en del [fördefinierade konstanter](http://php.net/manual/en/reserved.constants.php), bland annat kan du se vilken version av php som används via konstanten `PHP_VERSION`.

Konstanten `__DIR__` är exempel på magiska konstanter som ändrar sig beroende på vad de används. Du kan läsa mer i [manualen om magiska konstanter](http://php.net/manual/en/language.constants.predefined.php).
