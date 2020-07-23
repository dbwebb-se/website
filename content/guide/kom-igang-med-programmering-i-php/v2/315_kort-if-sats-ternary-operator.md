---
author: mos
revision:
    "2018-08-20": "(B, mos) Uppdaterad med nya exempelprogram."
    "2018-03-13": "(A, mos) Första versionen, uppdelad av större dokument."
...
Kort if-sats med ternary operator
=======================

Det finns ett kortare sätt att skriva vissa if-satser. Sättet är egentligen en operator som kallas [ternary operator](http://php.net/manual/en/language.operators.comparison.php#language.operators.comparison.ternary). Det är en konstruktion som återfinns även i andra programmeringsspråk. Det är inte en konstruktion som ersätter alla if-satser, men i vissa fall är den behändig. Speciellt bra är den när man vill ge en variabel ett värde beroende på ett villkor.



Ternary operator {#ternary}
--------------------------

Så här fungerar principen för ternary operatorn som består av `?:`.

```php
(villkor) ? (värde om villkoret är sant) : (värde om villkoret är falskt)
```

Ett vanligt exempel är om du vill tilldela en variabel ett värde beroende på ett visst villkor.

I exemplet nedan vill vi tilldela variabeln `$a` värdet `$b + 1`, men bara om `$b` har ett värde, annars skall `$a` bli `null`.

Så här kan du göra med en if-sats.

```php
$b = 7;

$a = null;
if ($b) {
    $a = $b + 1;
}

echo "The values are: a='$a', b='$b'.\n";
```

Med konstruktionen ternary operator kan du ersätta if-satsen med följande konstruktion.

```php
$a = $b ? $b + 1 : null;
```

Som du ser så blir det mindre kod när du använder ternary operatorn. Det är ett smidigt sätt att tilldela variabler beroende på ett villkor.
