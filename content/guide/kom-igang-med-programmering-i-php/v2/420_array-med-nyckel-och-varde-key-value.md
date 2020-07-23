---
author: mos
revision:
    "2018-08-22": "(A, mos) Första versionen."
...
Arrayer med nyckel och värde, key/value
=======================

Man kan själv definiera en nyckel i en array och lagra ett värde på positionen för den nyckeln. Detta kallas för nyckel/värde arrayer, key/value. Man kan också kalla det för hashtabeller eller dictionaries. Nyckeln i arrayen är här en sträng och inte en siffra som var fallet med de numeriska arrayerna.



Skapa key/value arrayer {#create}
----------------------

Du kan skapa en tom array på samma sätt som du gör med en numerisk array.

```php
// Add a collection of staff members
$staff = [];
```

Du skapar en key/value array genom att ange en sträng-nyckel till värdet. Du separerar nyckel och värde med konstruktionen `=>`.

```php
// Add details for one person
$mos = ["name" => "Mikael", "acronym" => "mos", "salary" => 7];
var_dump($mos);
```

Du kan också strukturera tilldelningen i en array på flera rader, det kan se snyggare ut.

```php
// Add details for another person
$lew = [
    "name" => "Kenneth",
    "acronym" => "lew",
    "salary" => 8
];
var_dump($lew);
```



Läs värde från arrayen {#las}
----------------------

Du kan läsa ett värde från arrayen genom att ange dess nyckel.

```php
// Read values from the array
$name = $mos["name"];
$acronym = $mos["acronym"];
$salary = $mos["salary"];
echo "The person $name ($acronym) earns $salary money.";
```

Om du försöker nå ett värde som inte är definierat så händer samma sak som med den numeriska arrayen.



Ta bort, nollställ, räkna {#same}
----------------------

Om du vill ta bort ett element från arrayen, om du vill nollställa arrayen eller om du vill räkna ut antalet värden i arrayen så gör du på samma sätt som med den numeriska arrayen.



Lägg till värden {#add}
----------------------

Du kan lägga till nya värden till en existerande array, eller till en tom array. Du anger bara vilken nyckel det gäller och vilket värde som skall sparas.

```php
// Add items to array
$collection["hearts"] = "❤";
$collection["spade"] = "♠";
$collection["clubs"] = "♣";
$collection["diamond"] = "♦";
var_dump($collection);
```



Array i array {#multi}
----------------------

Du kan lagra arrayer i en array. En array är bara ett värde, en datatyp, likt en sträng eller en siffra.

På detta viset kan du skapa en samling av flera arrayer.

```php
// Array of arrays
$staff["mos"] = $mos;
$staff["lew"] = $lew;
var_dump($staff);
```

Ovan har vi nu en array `$staff` som innehåller två värden, dels arrayen som ligger i `$mos` och dels arrayen som ligger i `$lew`.

När man gör en var_dump på den strukturen så ser det ut så här.

[FIGURE src=image/snapht18/array-staff.png?w=w3 caption="En array som består av två värden och varje värde är i sig en array som består av tre värden."]

Du kan nå varje värde i arrayen genom att ange dess nyckel.

```php
// Access values in array of arrays
echo "Mos has a salary of " . $staff["mos"]["salary"] . " moneys.\n";
```
