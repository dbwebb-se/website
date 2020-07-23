---
author: mos
revision:
    "2018-08-22": "(A, mos) Första versionen."
...
Arrayer och funktioner
=======================

PHP har en stor del inbyggda funktioner som låter oss jobba med arrayer. Låt oss titta på några av dem.

I manualen kan du se en översikt av alla [funktioner som finns för arrayer](http://php.net/manual/en/ref.array.php).

Låt oss titta på några funktioner som kan ge oss exempel på hur det är att jobba med inbyggda funktioner och arrayer.



Push och Pop som en stack {#pushpop}
-----------------------

Med funktionerna `array_push()` kan du lägga till element i slutet av arrayn och med funktionen `array_pop()` kan du plocka ut element från slutet av arrayen. Du har alltså en datastruktur som kan fungera som en stack där "last in, first out (LIFO)". Den som kommer sist blir också först hanterad.

```php
// Create an array and use it as an stack.
$stack = [];

array_push($stack, "mos");
array_push($stack, "lew");
array_push($stack, "Mumintrollet");
var_dump($stack);

$element = array_pop($stack);
var_dump($element); // Mumintrollet
```

I exemplet ovan skapas en `$stack` och tre element läggs (push) på stacken för senare hantering. Sedan hämtas ett element från stacken via pop.

Push och pop jobbar alltså mot slutet av arrayen.



Shift och unshift {#shift}
-----------------------

För att kompensera push och pop som jobbade mot slutet av arrayen så finner vi `array_shift()` som hämtar värdet först i arrayen (lägst index) och `array_unshift()` som lägger till ett värde först i arrayen.

Här är en variant av push/pop, men med shuft/unshift. Det är fortfarande en LIFO kö.

```php
// Create an array and use it as an que/stack.
$stack = [];

array_unshift($stack, "mos");
array_unshift($stack, "lew");
array_unshift($stack, "Mumintrollet");
var_dump($stack);

$element = array_shift($stack);
var_dump($element); // Mumintrollet
```

Vi har nu verktyg för att lägga till och hämta värden i slutet och i början på en array och med det kan vi skapa olika datastrukturer som till exempel en kö i en snabbkassa där den som står först också blir först hanterad, på datorspråk kallar vi det en FIFO-kö, "first in, first out".

För att representera en FIFO-kö behöver jag antingen använda en kombination av `array_unshift()` som lägger till i början av arrayen och `array_pop()` som hämtar i slutet av arrayen. Alternativt jobbar jag med `array_push()` som lägger till i slutet av arrayen och `array_shift()` som hämtar i början av arrayen. I båda fallen leder det till en FIFO-kö.



Implode och explode {#implodeexplode}
-----------------------

Funktionerna `implode()` och `explode()` ligger under [strängfunktioner i manualen](http://php.net/manual/en/ref.strings.php), men de kan användas för att konvertera mellan strängar och arrayer och det kan vara behändigt ibland.

Om man har en kommaseparerad sträng, säg den innehåller en lista på bra-att-ha saker, så kan man göra explode på den och skapa en array av alla elementen.

Här är ett exempel där en sträng blir till en array.

```php
// Split (explode) a string into an array
$backpack = "knife, water bottle, sleepsack, tent, food";
$backpackAsArray = explode(", ", $backpack);

var_dump(count($backpackAsArray));
var_dump($backpackAsArray);
```

Motsvarigheten är implode där delarna i en array kan sammanfogas till en sträng.

```php
// Create (implode) a string from all elements within an array.
$backpack = ["knife", "water bottle", "sleepsack", "tent", "food"];
$backpackAsString = implode(", ", $backpack);

var_dump($backpackAsString);
```

Det kan vara behändigt att växla mellan de båda formaten, strängar och arrayer.



Mer array-funktioner {#mer}
-----------------------

Det finns många inbyggda funktioner för arrayer. Du kan sortera innehållet i arrayen baserat på värdet, nyckeln eller via en egen jämförelsefunktion som du kan skriva.

Du kan kolla om värden eller nycklar finns definierade i en array.

Du kan använda arrayer för att jobba med matematiska mängder och göra operationer likt mängdlära.

Man kan addera arrayer, man kan slå samman och merga innehållet i flera arrayer och du kan jämföra innehållet i två arrayer.

Man kan spara en hel del tid genom att bekanta sig med några av de funktionerna som finns definierade, då blir det lättare att hitta när man letar efter andra funktioner som man ännu inte lärt sig.

Arrayer är en grundläggande struktur och vill man ha bättre stöd för datastrukturer som listor, köer och stackar så tittar man på [Standard PHP Library (SPL)](http://php.net/manual/en/book.spl.php) som innehåller mer avancerade datastrukturer.
