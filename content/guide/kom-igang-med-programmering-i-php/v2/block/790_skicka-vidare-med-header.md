---
author: mos
revision:
    "2018-03-13": "(A, mos) Första versionen, uppdelad av större dokument."
...
Skicka vidare med header
=======================

_(dela upp i delar, redirect vid formulär, 404+403 samt json/pdf/zip)_

HTTP-protokollet, det som används för att visa webbsidor, innehåller en header-del och en body-del. När vi visar en vanligt webbsida så sköter webbservern om att skapa själva headern för svaret. Men om vi vill göra lite mer komplexa saker så behöver vi själva skapa headern för HTTP-protokollet. Detta kan vi göra med PHP-funktionen [`header()`](http://php.net/manual/en/function.header.php).

Med hjälp av `header()` kan vi skicka vidare till en svarssida. Det är ett vanligt sätt att hantera processing av formulär, först processar man själva formuläret och sparar i databasen, sedan skickar man vidare till en ny sida som visar resultatet. Man gör en så kallad "redirect".

På liknande sätt kan vi skicka en statuskod som 404 för att säga att sidan inte finns, eller 403 för att säga att sidan inte har rättigheter att visas. Med hjälp av dessa kan vi skapa egna sidor för felhantering och visa dem istället för webbserverns standardiserade felsidor.

Ett annat sätt att använda `header()`-funktionen är att hantera nedladdning av filer. Ibland vill man inte ge direktlänken till nedladdningsfilen utan man vill sköta nedladdning via ett PHP-skript, det kan du göra genom att skicka rätt HTTP-header.

I följande exempelkod ser du olika varianter på HTTP-headers med `header()` funktionen.

```php
<?php
$do = isset($_GET['do']) ? $_GET['do'] : null;

switch($do) {
  case 'redirect':
    // Redirect to another page, perhaps a resultpage showing the result of a posted form
    header("Location: http://dbwebb.se/style");
    exit;
    break;
    
  case '404':
    // Generate HTTP response code 404 Not Found
    header("HTTP/1.0 404 Not Found");
    echo "This is a generated page with a 404 Not Found HTTP header, you may analyse the headerinformation with your browser to verify it.";
    exit;
    break;
    
  case '403':
    // Generate HTTP response code 403 Forbidden
    header("HTTP/1.0 403 Forbidden");
    echo "This is a generated page with a 403 Forbidden HTTP header, you may analyse the headerinformation with your browser to verify it.";
    exit;
    break;
    
  case 'pdf':
    // Download a pdf-file and name it downloaded.pdf
    header('Content-type: application/pdf');
    header('Content-Disposition: attachment; filename="downloaded.pdf"');
    readfile(__DIR__ . '/hello.pdf');
    exit;
    break;
    
  case 'zip':
    // Download a zip-file and name it downloaded.zip
    header('Content-type: application/zip');
    header('Content-Disposition: attachment; filename="downloaded.zip"');
    readfile(__DIR__ . '/hello.zip');
    exit;
    break;

  default:
    ;
}
```

Kan du nu själv sätta ihop ett exempelprogram som testar funktionen `header()`?

Funktionen `header()` måste anropas innan något har skrivits ut till webbläsaren, annars får du ett felmeddelande som ser ut så här.

>  Warning: Cannot modify header information - headers already sent by (output started at /usr/home/mos/htdocs/dbwebb.se/kod-exempel/guiden-php-20/header/multitest.php:11) in /usr/home/mos/htdocs/dbwebb.se/kod-exempel/guiden-php-20/header/multitest.php on line 12

Det räcker med ett mellanslag eller nyrads-tecken för att felmeddelandet skall uppkomma. Var noga med hur du skriver din kod, då blir det enklare att felsöka denna typen av felmeddelanden.

Här kan du [testa min variant exempelprogrammet](kod-exempel/guiden-php-20/header/multitest.php).
