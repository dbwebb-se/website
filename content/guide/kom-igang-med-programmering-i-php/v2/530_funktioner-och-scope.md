---
author: mos
revision:
    "2018-09-03": "(A, mos) Första versionen."
...
Funktioner och scope
=======================

Variabler som definieras i en funktion syns enbart inuti funktionen. Det beror på omfattningen av variabelns synlighet, variabelns _scope_.

Låt oss se på ett exempel.



Scope {#scope}
------------------------

Vi tar ett exempel där en variabel är definierad i det globala scopet, det vill säga utanför en funktion, och sedan har vi en variabel med samma namn som är definierad inuti en funktion.

```php
// Here is the global scope, its not within a function
$sum = 7;

function sumValues($val1, $val2, $val3)
{
    // This is the functions scope
    $sum = $val1 + $val2 + $val3;
    return $sum;
}

echo $sum . "\n";                // 7
echo sumValues(40, 2, 0) . "\n"; // 42
echo $sum . "\n";                // 7
```

Vi har alltså variabeln `$sum` som är definierad i ett globalt scope, utanför alla funktioner, på yttersta filnivå.

Sedan finns en variabel med samma namn `$sum` som används inuti funktionen. Dessa båda krockar inte då de ligger i olika scope, de har olika synlighetsfält.

En variabel kan (normalt) bara läsas och skrivas till inom det synlighetsscope den finns.



Läs mer {#mer}
------------------------

Om du vill kan du läsa mer om [variabel och scope i manualen](http://php.net/manual/en/language.variables.scope.php).
