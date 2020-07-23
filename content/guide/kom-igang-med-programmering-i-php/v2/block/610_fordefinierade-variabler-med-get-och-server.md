---
author: mos
revision:
    "2018-03-13": "(A, mos) Första versionen, uppdelad av större dokument."
...
Fördefinierade variabler med $\_SERVER och $\_GET
=======================

PHP har [fördefinierade variabler](http://php.net/manual/en/reserved.variables.php) som innehåller användbar information. Följande lista visar ett par av de vanliga variablerna som du kommer i kontakt med som webbutvecklare.

* `$_SERVER`
* `$_GET`
* `$_POST`
* `$_SESSION`
* `$_COOKIE`

Variablerna är arrayer, dvs att de innehåller flera värden. Låt oss titta på ett par exempel där vi skriver ut innehållet i respektive variabel. 



Information om anropet finns i `$_SERVER` {#server}
-----------------------

`$_SERVER` ger information om själva anropet och om den som anropade sida. Det är information som anroparens ip-adress, vilken klient (webbläsare) som användes och vilken url som efterfrågas. 

Följande kod skriver ut anroparens ip-adress och information om användarens klient. 

```php
<?php
echo "<p>IP-adress till den som öppnade denna sidan: " . htmlentities($_SERVER['REMOTE_ADDR']);
echo "<p>I HTTP_USER_AGENT går det att utläsa vilken webbläsare som används: " . htmlentities($_SERVER['HTTP_USER_AGENT']);
echo "<p>Allt innehåll i arrayen \$_SERVER:<br><pre>" . htmlentities(print_r($_SERVER, 1)) . "</pre>";
```

Informationen som kommer i `$_SERVER` är delvis sådan som kommer från den som anropar sidan, det är information som skickas i http-headern, i själva protokollanropet. Det betyder att anroparen kan påverka innehållet i `$_SERVER`. Därför är det viktigt att inte lita på innehållet i `$_SERVER`. Använd alltid funktionen [`htmlentities()`](http://php.net/manual/en/function.htmlentities.php) när du skriver ut innehåll som du inte litar på.

Här kan du [testa exempelprogrammet](kod-exempel/guiden-php-20/predefined/server.php).



Skicka parametrar till en sida med `$_GET` {#get}
-----------------------

`$_GET` är en array som innehåller de argument som skickas via länken efter ?-tecknet.(*query-delen*). Detta brukar också kallas *querystring*.

```php
<?php
if(empty($_GET)) {
  echo "<p>Du har inte skickat några parametrar till sidan</p>";
}

if(isset($_GET['hej'])) {
  echo "<p>Hej på dej själv!</p>";
}

if(isset($_GET['namn'])) {
  echo "<p>Ah, så ditt namn är '" . htmlentities($_GET['namn']) . "'. Mitt namn är Mumintrollet.</p>";
}

echo "<p>Allt innehåll i arrayen \$_GET:<br><pre>" . htmlentities(print_r($_GET, 1)) . "</pre>";
?>

<p>Pröva att klicka på någon av följande länkar:</p>

<ul>
  <li><a href='?hej'>Säg hej</a></li>
  <li><a href='?namn=Marvin'>Mitt namn är Marvin, vad heter du?</a></li>
  <li><a href='?namn=Marvin&amp;hej'>Säg hej och presentera dig!</a></li>
  <li><a href='?'>Skicka inga parametrar alls.</a></li>
</ul>
```

Man kan använda funktionerna [`empty()`](http://php.net/manual/en/function.empty.php) och [`isset()`](http://php.net/manual/en/function.isset.php) för att kontrollera om det är några specifika argument som skickats med till sidan. På det sättet kan du få en webbsida att bete sig olika beroende på de parametrar som skickas med i länken.

Som du ser i länkarna i koden ovan så kan parametrarna som skickas ha ett värde eller ej. Man separerar parametrarna med `&`-tecknet, eller dess motsvarande HTML-entitet, `&amp;`, när det skrivs i HTML-koden (annars går det inte igenom HTML valideringen). 

Här kan du [testa exempelprogrammet](kod-exempel/guiden-php-20/predefined/get.php).
