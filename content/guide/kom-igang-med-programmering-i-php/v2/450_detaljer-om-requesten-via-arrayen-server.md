---
author: mos
revision:
    "2018-08-22": "(A, mos) Första versionen."
...
Detaljer om requesten via arrayen $\_SERVER
=======================

Likt $\_GET är arrayen $\_SERVER en fördefinierad variabel som byggs upp av php. Variabeln innehåller detaljer om den sidförfrågan som gjorts, _requesten_.

Vi kan dumpa dess innehåll för att få information om den request som vår sida fått och vi kan använda informationen för att till exempel bygga upp den länk som användes för att landa på vår webbsida.



En sidförfrågan, en request {#sidrequest}
-----------------------

När en webbsida efterfrågas så är det ofta en webbläsare som gör det. Webbläsaren bifogar en del information från sin värddator och lägger i HTTP-protokollets header-del. Denna information, med annan information som kan bifogas från webbservern (Apache eller liknande), samlas av php i variabeln $\_SERVER och innehåller detaljer om själva requesten.

Vi kan göra en testsida som skriver ut innehållet i variabeln.

```php
// Dump incoming variables
var_dump($_SERVER);
```

Det kan se ut så här.

[FIGURE src=image/snapht18/server.png?w=w3 caption="Innehållet i $\_SERVER ger information om sidförfrågan, requesten."]

Informationen i variabeln kan användas för att logga information eller ta beslut som baseras på den ursprungliga requesten och dess data.



Länk till nuvarande sida {#current}
-----------------------

En sak man kan göra med informationen i $\_SERVER är att konstruera den länken som användaren använde för att nå just denna sidan. Det är information som finns i flera delar och behövs slås samman till en komplett länk.

Här är ett slarvigt sätt att göra det, bara för att visa ett exempel på vad man kan göra med innehållet i $\_SERVER.

```php
// Create current url
$currentUrl = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
var_dump($currentUrl);
```

Koden ovan är samma som följande, kanske lite mer tydligt.

```php
// Create current url
$host = $_SERVER["HTTP_HOST"];
$uri = $_SERVER["REQUEST_URI"];
$currentUrl = "http://$host$uri";
var_dump($currentUrl);
```

Att skapa länken till nuvarande sida kan dock vara en betydligt större utmaning, så se exemplet ovan som en enkel variant som vi visar för att exempleifiera innehållet i $\_SERVER. Vill du fördjupa dig i hur man kan återskapa länken så kan du kika på StackOverflow om "[Get the full URL in PHP](https://stackoverflow.com/a/8891890/341137)".
