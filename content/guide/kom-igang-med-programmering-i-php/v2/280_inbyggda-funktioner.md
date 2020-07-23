---
author: mos
revision:
    "2018-06-28": "(A, mos) Första versionen, uppdelad av större dokument."
...
Inbyggda funktioner
=======================

Vi tittar på de kategorier av inbyggda funktioner som finns och vi provkör några av dem.



Om inbyggda funktioner {#om}
-----------------------

Php har ett stort antal inbyggda funktioner som underlättar livet som programmerare. Finns det funktioner så använder man dem istället för att skriva egna. Det är viktigt att lära sig hur man slår upp och letar reda på funktioner. Manualens sökfunktionen hjälper dig på vägen.
  
Varje funktion har en egen sida i PHP-manualen, du kan till exempel pröva att slå upp några av de funktioner vi använt så här långt, [`echo()`](http://php.net/manual/en/function.echo.php) och [`var_dump()`](http://php.net/manual/en/function.var_dump.php). Läs om dem och studera upplägget för manualsidan. Använda sökfunktionen på manualsidan för att hitta de funktioner du letar efter.

Ibland kan det vara enklast att googla fram en funktion, om du letar efter en funktion som beräknar längden av en sträng så söker du efter "php string length", det brukar leda rätt in i manualen.

Det finns en stor mängd inbyggda funktioner, det finns funktioner för datum och tid, matematiska funktioner, funktioner för stränghantering, kryptering, funktioner för att hämta information från andra webbplatser, för att komma åt databaser och så vidare.

Låt oss titta på några av dessa kategorier av funktioner.



Matematiska funktioner {#matte-funktioner}
-----------------------

Vi tittar på den matematiska funktionen som beräknar kvadratroten ur ett tal, [`sqrt()`](http://php.net/manual/en/function.sqrt.php), samt funktionen som skriver ut talet PI, [`pi()`](http://php.net/manual/en/function.pi.php).

Så här kan det se ut när vi använder funktionerna.

```php
$pi = pi();
$square = sqrt(2);

echo round($pi, 2), "\n";
echo round($square, 2), "\n";

echo floor($pi), "\n";
echo floor($square), "\n";

echo ceil($pi), "\n";
echo ceil($square), "\n";
```

Du kan försöka gissa hur utskriften blir av ovan exempelprogram, här kommer facit.

[FIGURE src=image/snapht18/math.png?w=w3 caption="Olika typer av avrundning ingår i de matematiska funktionerna."]

Kika snabbt på [översikten av de matematiska funktionerna](http://php.net/manual/en/ref.math.php) för att få en känsla för vilka funktioner som finns tillgängliga.
 


Funktioner för datum och tid {#datum-funk}
-----------------------

Det finns funktioner för datum och tid. Titta till exempel på funktionen [`date()`](http://php.net/manual/en/function.date.php) som hjälper dig att skriva ut dagens datum. Studera även funktionen [`time()`](http://php.net/manual/en/function.time.php) som ger dig antalet sekunder sedan den första januari 1970.

Så här kan du använda funktionerna.

```php
echo "Todays date: ", date('r'), "\n";
echo "Number of seconds since January 1, 1970: ", time(), "\n";
```

Så här kan det se ut när exemplet körs.

[FIGURE src=image/snapht18/date.png?w=w3 caption="Dagens datum och antalet sekunder sedan starten av 1970."]

Kika på [översikten av funktioner för datum och tid](http://php.net/manual/en/ref.datetime.php) för att få en känsla för vilka funktioner som finns tillgängliga.



Funktioner för stränghantering (hashning) {#strang-funk}
-----------------------

Vi har redan tittat på [inbyggda funktioner för stränghantering](./strangar-och-stranghantering#inbyggd). Men vi kan nämna några fler av de inbyggda funktioner som finns för strängar, låt oss fokusera på de som kan användas för kryptering och hashning.

Några av dessa funktioner är [`str_rot13()`](http://php.net/manual/en/function.str_rot13.php) och [`md5()`](http://php.net/manual/en/function.md5.php).

Låt oss bygga ett exempelprogram som testar dessa tillsammans med några fler liknande funktioner.

```php
$val = "Jag är Mumintrollet.";

echo "Original: ", $val, "\n";
echo "ROT13:    ", str_rot13($val), "\n";
echo "MD5:      ", md5($val), "\n";
echo "SHA1:     ", sha1($val), "\n";

$passwordHash = password_hash($val, PASSWORD_DEFAULT);
echo "password: ", $passwordHash, "\n";
echo "verify:   ", password_verify($val, $passwordHash), "\n";
```

Den sista varianten med funktionen [`password_hash()`](http://php.net/manual/en/function.password-hash.php) och `password_verify()` är den variant som rekommenderas när man vill jobba med användares lösenord och skydda inloggning till en webbsida.

Så här ser det ut när exempelprogrammet provkörs.

[FIGURE src=image/snapht18/hash.png?w=w3 caption="Hashning med inbyggda strängfunktioner."]

Glöm inte att skriva dina egna små testprogram, det är ett mycket bra sätt att lära sig.
