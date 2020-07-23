---
author: mos
revision:
    "2018-03-13": "(A, mos) Första versionen, uppdelad av större dokument."
...
Formulär och $\_POST
=======================

När man jobbar med HTML-formulär finns det två sätt att posta informationen, dels via länken och `$_GET`, och dels via http-headern och då hamnar informationen i `$_POST`. Vilken man väljer beror på vad man vill göra. Du kan ha följande två grundregler i huvudet.

1. Använd GET om du vill kunna länka direkt till svarssidan och kunna visa upp resultatet. Det kan till exempel vara ett sökformulär eller ett formulär där man väljer hur en lista skall sorteras.

2. Använd POST så fort som postningen av formuläret resulterar i en ändring i en fil eller databas.

Här kan du se ett exempel på när ett [formulär byggs upp](kod-exempel/business-card-generator/) och exemplet visar också på [skillnaden mellan `$_GET` och `$_POST`](kod-exempel/business-card-generator/index2.php).

I PHP så är `$_POST` en array som innehåller alla värden från det postade formuläret och som vanligt kan det vara vist att skriva ut hela arrayen när man är osäker på dess innehåll.

```php
<?php
echo "<pre>" . htmlentities(print_r($_POST, 1)) . "</pre>";
```

Vill du själv komma igång och jobba med ett eget formulär så kan du utgå från följande exempel. Det är ett enkelt formulär som postar sig själv och skriver ut resultatet. Tekniken att hantera visningen och postningen på samma sida brukar kallas för *self-submitting form*.

```php
<?php
// Alltid validera och sanitera inkommande information innan den används.
$field1 = isset($_POST['field1']) ? htmlentities($_POST['field1']) : null;
$field2 = isset($_POST['field2']) ? htmlentities($_POST['field2']) : null;
?>

<form method=post>
<fieldset>
<legend>Ett formulär att posta</legend>
<p><input type=text name=field1 value='<?=$field1?>'></p>
<p><textarea name=field2><?=$field2?></textarea></p>
<input type=submit value=Skicka>
</fieldset>
</form>

<?="<p>Allt innehåll i arrayen \$_POST:<br><pre>" . htmlentities(print_r($_POST, 1)) . "</pre>"?>
```

Här kan du [testa exempelprogrammet](kod-exempel/guiden-php-20/predefined/post.php).
