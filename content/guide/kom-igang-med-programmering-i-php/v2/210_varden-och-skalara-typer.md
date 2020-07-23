---
author: mos
revision:
    "2018-10-01": "(B, mos) Rätt länk till variabler deklareras."
    "2018-03-13": "(A, mos) Första versionen, uppdelad av större dokument."
...
Värden och skalära typer
=======================

Vi har sett grunden för hur [variabler deklareras och tilldelas ett värde](guide/kom-igang-med-programmering-i-php/variabler). låt oss nu fortsätta med de olika typer som finns i php och hur typerna fungerar och kan avläsas. 

Manualen för php ger dig en översikt av [vilka typer som finns](http://php.net/manual/en/language.types.intro.php), läs den som referens och om du vill veta mer.



Skalära typer {#typer}
-----------------------

En skalär typ är något som kan uttryckas med ett enda värde. I php finns följande sådana typer.

| Typ   | Beskrivning |
|-------|-------------|
| boolean | Ett värde är sant `true` eller falskt `false`. |
| integer | Heltalsvärde som 7, 9 eller 13. |
| double  | Flyttalsvärde som 3.14, 2.414 eller 7.0E-10. |
| string  | Strängar omslutna med dubbelfnutt "" eller enkelfnutt ''. |
| null    | Egentligen inte en skalär typ utan mer en specialtyp som innebär avsaknaden av ett värde, en variabel som inte har ett värde. |

Typen double kan också benämnas float eller _real numbers_.

I php finns fler typer, men för tillfället håller vi oss vid dessa enkla typer.



Typdeklaration och upplevd typ {#upplevd}
-----------------------

Språket php är löst typat, även kallat dynamisk typat. Dess skillnad är statiskt typade programmeringsspråk där variabelns typ deklareras tillsammans med variabeln.

I språk som är dynamiskt typade så har en variabeldeklaration inte någon typ. En variabels typ beror av det värde den innehåller. Under en variabels livstid kan den alltså anta olika typer, beroende av vilket värde den innehåller.

Här är ett exempelprogram som visar hur en och samma variabel har olika värden och typer samt hur man kan skriva ut variabelns typ.

```php
$var = false;
echo $var, " (", gettype($var), ")\n";

$var = true;
echo $var, " (", gettype($var), ")\n";

$var = 42;
echo $var, " (", gettype($var), ")\n";

$var = 3.14;
echo $var, " (", gettype($var), ")\n";

$var = "Hello";
echo $var, " (", gettype($var), ")\n";
```

Om du gör ett testprogram av koden ovan så kan du få följande utskrift.

[FIGURE src=image/snapht18/gettype.png?w=w3 caption="Olika värden bestämmer variabelns upplevda typ."]

I utskriften ovan ser du att inget värde skrivs ut när variabeln innehåller värdet `null` eller `false`. Det beror på att värdet översätts till något som kan skrivas ut och `null` och `false` ersätts med en tom sträng `""`, det syns alltså inget när man skriver ut det värdet.

Enligt liknande princip ersätts värdet `true` med `1` vid utskriften.




Felsök med var_dump {#var_dump}
-----------------------

Ett sätt att skriva ut en variabels värde och dess upplevda typ är att använda funktionen `var_dump()`. Uppdatera ditt exempelprogram i stil med följande.

```php
$var = null;
var_dump($var);

$var = false;
var_dump($var);
```

Uppdatera hela ditt exempelprogram och du kan få följande utskrift deär både värde och upplevd typ visas.

[FIGURE src=image/snapht18/vardump.png?w=w3 caption="Med funktionen var_dump kan variabelns värde och typ visas."]

Funktionen `var_dump()` är bra att använda när man felsöker och vill dubbelkolla var en variabel innehåller.
