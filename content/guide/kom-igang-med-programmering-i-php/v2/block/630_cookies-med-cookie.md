---
author: mos
revision:
    "2018-03-13": "(A, mos) Första versionen, uppdelad av större dokument."
...
Cookies med $\_COOKIE
=======================



Lämna ett spår med cookies och $\_COOKIE {#cookie}
-----------------------

[Cookies](http://php.net/manual/en/features.cookies.php) ger en möjlighet att lämna ett litet spår i besökarens webbläsare. Det är en liten fil som lagras hos den som besöker din webbplats och cookien skickas som en del av HTTP headern. Detta innebär att cookien måste sättas innan något skrivs ut till webbläsaren. Det är samma begränsning som gäller för sessionen.

Så här använder du cookie.

```php
<?php
// Set the cookie
$value = 'something from somewhere';

$output = null;
if(isset($_GET['set'])) {
  setcookie("TestCookie1", $value);
  setcookie("TestCookie2", $value, time()+3600);
  $output = "<p>Skapade två cookies med namn TestCookie1 och TestCookie2. <a href='?''>Ladda om sidan för att se dem</a>.</p>";
}
else if(isset($_GET['reset'])) {
  // Set time in past to trigger removal of cookie in browser
  setcookie("TestCookie1", "", time()-3600);
  setcookie("TestCookie2", "", time()-3600); 
  $output = "<p>Raderade två cookies med namn TestCookie1 och TestCookie2. <a href='?'>Ladda om sidan för att se att de inte finns kvar</a>.</p>";
}

echo "<p>Allt innehåll i arrayen \$_COOKIE:<br><pre>" . htmlentities(print_r($_COOKIE, 1)) . "</pre>";
?>

<p><a href="?">Ladda om sidan</a> | <a href="?set">Skapa cookie</a> | <a href="?reset">Ta bort cookie</a></p>
<?=$output?>
```

Här kan du [testa exempelprogrammet](kod-exempel/guiden-php-20/predefined/cookie.php).

Läs mer om olika varianter av cookies med [setcookie()](http://php.net/manual/en/function.setcookie.php).

Läs om hur du använder [cookies på ett säkert sätt](http://stackoverflow.com/questions/7591728/designing-a-secure-auto-login-cookie-system-in-php) för att göra automatisk inloggning för dina användare. 
