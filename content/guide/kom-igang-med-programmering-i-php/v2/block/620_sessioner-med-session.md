---
author: mos
revision:
    "2018-03-13": "(A, mos) Första versionen, uppdelad av större dokument."
...
Sessioner med $\_SESSION
=======================

HTTP-protokollet är ett *stateless* protokoll vilket innebär att varje fråga-svar innehåller all information som krävs. Det finns inga krav på att HTTP-servern skall spara information om anroparen så att ett anrop kan kopplas ihop med efterkommande anrop. Men i våra webbplatser vill vi kunna hantera inloggade användare och personliga inställningar. Till vår hjälp finns sessioner och cookies.



Kom ihåg saker med sessionen och $\_SESSION {#session}
--------------------------

Rent användarmässigt så handlar det om arrayen `$_SESSION`. I den kan vi lagra information som i vilken array som helst, dessutom kommer arrayen att innehålla information som kan minnas mellan sidoanropen. Här är ett enkelt testprogram som visar hur det fungerar.

```php
<?php
session_name('php20guiden');
session_start();

if(isset($_SESSION['count'])) {
  $_SESSION['count']++;
}
else {
  $_SESSION['count'] = 0;
}

if(isset($_GET['reset'])) {
  $_SESSION['count'] = 0;
}

echo "<p>Allt innehåll i arrayen \$_SESSION:<br><pre>" . htmlentities(print_r($_SESSION, 1)) . "</pre>";
?>

<p><a href="?">Ladda om sidan och öka variabeln med ett</a> | <a href="?reset">Nollställ variabeln</a></p>
```

Här kan du [testa exempelprogrammet](kod-exempel/guiden-php-20/predefined/session.php).

När vi loggar in på en webbplats så används sessionen för att minnas vem vi är.

Det finns [funktioner](http://php.net/manual/en/ref.session.php) för den som vill göra lite mer med sessioner. Pröva gärna att bygga ut testprogrammet genom att skriva ut sessions id, namn och tiden för hur länge sessionen lever.

När man vill förstöra en session, tex för att logga ut en användare från en webbplats, så gör man det precis som de gör i exemplet på manualsidan för [destroy_session()](http://php.net/manual/en/function.session-destroy.php).
