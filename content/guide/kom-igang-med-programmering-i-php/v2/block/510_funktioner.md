---
author: mos
revision:
    "2018-03-13": "(A, mos) Första versionen, uppdelad av större dokument."
...
Funktioner
=======================

När programmen växer så måste man organisera sin kod. Att dela in koden i filer är ett sätt och att skriva kod i funktioner är ett annat sätt att skapa en organisation kring sin kod. Att duplicera kod är inte önskvärt, det blir svårt att underhålla och vidareutveckla kod som är gjort enligt copy-paste metod. En bra programmerare ser alltid över sin kod och försöker finna en bra struktur som underlättar underhåll och vidareutveckling av koden.



Funktionen `dump()` {#dump}
------------------------

Att skapa en funktion är enkelt. Som du kanske märkt så använder jag ofta följande sekvens för att skriva ut innehållet i en array.

```php
echo "<pre>" . htmlentities(print_r($array, 1)) . "</pre>";
```

Kodsekvensen lämpar sig ypperligt för en funktion. Men en funktion så slipper jag skriva den långa raden så fort jag vill debugga en array. Se följande exempel på hur en sådan funktion kan se ut. Funktionen tar ett argument, det är själva arrayen som skall skrivas ut som skickas som ett argument till funktionen.

```php
function dump($array) {
  echo "<pre>" . htmlentities(print_r($array, 1)) . "</pre>";
}

// anropa funktionen så här
dump($_SERVER);
```

Istället för den längre sekvensen så räcker det nu att jag skriver funktionens namn och skickar med den array jag vill skriva ut. Jag sparar ett antal knapptryckningar och mitt kodande går snabbare. Detta är precis det som funktioner handlar om.

En funktion skall vara kort och göra en sak, blir den för lång så blir koden oöverskådlig och då bör du bryta ned funktionen i mindre delar. Ett riktvärde kan vara max 30 rader kod per funktion, helst mindre. Men det beror alltid på vad man gör. Mina egna funktioner är ofta mindre än tio rader kod.

Här kan du [testa exempelprogrammet](kod-exempel/guiden-php-20/function/dump.php).



Funktionen `getCurrentUrl()` {#getcurrenturl}
------------------------

En bra-att-ha funktion är en funktion som ger dig länken till nuvarande sida. Det är något du kan använda för att skapa en [permalänk](http://sv.wikipedia.org/wiki/Permal%C3%A4nk) till en sida. Informationen som behövs för att återskapa länken finns i `$_SERVER`. Så här kan funktionen se ut.

```php
function getCurrentUrl() {
  $url = "http";
  $url .= (@$_SERVER["HTTPS"] == "on") ? 's' : '';
  $url .= "://";
  $serverPort = ($_SERVER["SERVER_PORT"] == "80") ? '' :
    (($_SERVER["SERVER_PORT"] == 443 && @$_SERVER["HTTPS"] == "on") ? '' : ":{$_SERVER['SERVER_PORT']}");
  $url .= $_SERVER["SERVER_NAME"] . $serverPort . htmlspecialchars($_SERVER["REQUEST_URI"]);
  return $url;
}

// anropa funktionen så här
echo getCurrentUrl();
```

Du kan testa funktionen i inlägget ["Tips från Coachen: Hitta länken till nuvarande sida med en PHP-funktion - getCurrentUrl()"](coachen/hitta-lanken-till-nuvarande-sida-med-en-php-funktion-getcurrenturl).



Mer om funktioner {#mer-funktioner}
------------------------

För den som vill koda PHP som ett riktigt programmeringsspråk så är funktioner ett nödvändigt verktyg. Vill du bygga enklare webbplatser så klarar du dig rätt långt med enklare PHP-kod. Om du redan kan ett annat programmeringsspråk så är funktioner säkert inget konstigt för dig. Grunderna i funktioner är samma, oavsett programmeringsspråk.

Oavsett dina förkunskaper och behov av funktioner så finns det ett stycke i PHP-manualen som är lämplig att läsa om du vill veta [mer om funktioner](http://php.net/manual/en/language.functions.php) och få ut maximalt av dem. Där beskrivs framförallt grunderna i hur du skapar [egna funktioner](http://php.net/manual/en/functions.user-defined.php), hanterar [argument](http://php.net/manual/en/functions.arguments.php) och [returvärden](http://php.net/manual/en/functions.returning-values.php).

När du nu börjar med funktioner så behöver du också koll på det som kallas "block-scope" [^3]. Det säger var en variabel är synlig. Läs på om [variablers synlighet](http://php.net/manual/en/language.variables.scope.php) och kika lite extra på sektionen om nyckelordet `global`.

Se till att vara kompis med manualen så har du alltid nära till facit. Svårare är det inte, lär dig läsa och hitta i manualen, där finns det mesta du behöver veta om PHP.

Börja nu med att spara dessa två funktioner i en egen fil, `functions.php`. Låt det bli en fil som du använder för att spara dina egna bra-att-ha funktioner som du hittar, eller bygger själv. Efterhand kommer sådan kod som du sparar och återanvänder göra att du blir snabbare, säkrare och effektivare i din programmerarroll. Så, börja nu, glöm inte att skriva kommentarer som [PHPDoc](#kommentarer) ovanför varje funktion.
