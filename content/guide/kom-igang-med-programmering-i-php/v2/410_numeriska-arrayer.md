---
author: mos
revision:
    "2018-08-22": "(A, mos) Första versionen."
...
Numeriska arrayer
=======================

I php är arrayen en inbyggd datatyp och en grundläggande datastruktur där man kan lagra information oavsett typ. Allt går att lagra i en array, du kan lägga dit strängar, siffror och boolska värden. Det du får är en sammanhängande samling av värden, en variabel som kan representera många olika värden.

I php finns numeriska arrayer och key/value arrayer. De skiljer sig aningen åt i hur de sparar informationen och hur du når informationen, men i grunden är det samma array-typ.

Du kan läsa om [typen arrayer i manualen](http://php.net/manual/en/language.types.array.php).



Skapa numeriska arrayer {#create}
----------------------

Man skapar en array genom att tilldela en variabel en tom array, antingen med `[]` eller via `array()`, båda ger samma resultat.

Här skapar vi två arrayer, en tom och en som innehåller ett antal värden av olika typer.

```php
// Create some arrays
$collection1 = [];
$collection2 = ["A string", 42, 3.14, true, false, null, []];
var_dump($collection1);
var_dump($collection2);
```

När man har en array så kan man lägga till värden till arrayen, de hamnar då i slutet av arrayen.

```php
// Add items to array
$collection1[] = "❤";
$collection1[] = "♠";
$collection1[] = "♣";
$collection1[] = "♦";
var_dump($collection1);
```

Du kan också bestämma vilken position du lägger värdet på, det behöver inte ligga i ordning.

```php
$collection1[42] = "Some answer.";
```

Man kan se det som att indexet inte behöver vara i en ordning.



Läs värde från arrayen {#las}
----------------------

Sådana arrayer vi nu visar kallas numeriska arrayer. Man kan nå dess innehåll via den position som värdet ligger lagrat på. Numreringen av positionerna börjar normalt på 0 och slutar på antalet värden som ligger i arrayen minus ett. 

Här kan du se hur vi plockar ut värdena i en array, ett och ett.

```php
// Get items from an array
echo $collection1[0];
echo $collection1[1];
echo $collection1[2];
echo $collection1[3];
echo "\n";
```

Om du försöker nå ett item som inte är definierat så får du ett felmeddelande.

```php
// Get item that does not exists
echo $collection1[9];
```

Ovan genererar ett felmeddelande i formen:

> _Notice: Undefined offset: 9 in /home/mos/git/dbwebbse/kurser/htmlphp/example/guide-php/04/numarray.php on line 43_

Du försöker nå ett index i arrayen som inte har ett värde kopplat till sig.



Kontrollera om värdet finns {#finns}
----------------------

Man kan kontrollera om ett index, en position i arrayen, har ett värde -- innan man försöker använda det.

```php
// Check if a item exists before accessing it.
$value = "default value";
if (array_key_exists(9, $collection1)) {
    $value = $collection[9];
}
var_dump($value);
```

Samma sak kan man göra med något som kallas en _null coalescing operator_. Det är en konstruktion som består av uttryck separerade med `??`. Det första värdet som inte är null kommer att användas och man kan använda godtyckligt antal uttryck separerade med `??` i en serie.

Så här kan null operatorn användas för att hämta ett värde ur en numerisk array, om arrayens position innehåller ett värde.

```php
// Check if a item exists before accessing it.
$value = $collection[9] ?? "default value";
var_dump($value);
```

Du kan kanske se släktskapet mellan null coalescing operator och den korta if-satsen ternary operator? Det är iallafall ett smidigt sätt att tilldela värden och att ha en backup-lösning av ett defaultvärde.



Ta bort värde i en array {#tabort}
----------------------

Du kan ta bort värden i en array genom att göra `unset()` på det.

```php
unset($collection1[1]);
```

I koden ovan försvinner det värdet som ligger på positionen 1, resterande positioner är oförändrade. När man plockar bort ett item med `unset()` så ligger alla andra värden kvar på sina ursprungliga positioner.



Nollställ arrayen {#nolla}
----------------------

Du kan nollställa en array genom att tilldela den en tom array.

```php
$collection1 = []; // Now its an empty array
```



Räkna antalet item i en array {#count}
----------------------

Med funktionen `count()` kan du beräkna hur många värden som en array innehåller.

```php
echo "Collection 1: " . count($collection1) . "\n";
echo "Collection 2: " . count($collection2) . "\n";
```
