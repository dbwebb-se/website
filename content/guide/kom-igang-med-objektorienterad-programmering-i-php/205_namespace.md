---
author: mos
revision:
    "2002-04-08": "(B, mos) Förtydligade vilka filer man jobbar i."
    "2018-03-27": "(A, mos) Första versionen, uppdelad av större dokument och uppdaterad."
...
Namespace
==================================

Vi börjar använda begreppet namespace, namnrymd, för att ge våra variabler, funktioner och klasser en egen rymd att leva i, där de inte krockar med andra enheter som har samma namn.

Spara koden du skriver i denna övningen i `index_namespace.php`, `src/Person/Person.php` samt `autoload_namespace.php`.



Namespace i PHP {#name}
----------------------------------

I PHP kan vi deklarera en namnrymd, ett _namespace_, med kommandot `namespace`.

De variabler, funktioner och klasser som definieras inom denna namnrymd är endast synliga där. Vinsten är att man kan deklarera enheter som har samma namn, men om de befinner sig i olika namespace så krockar de inte.

När man använder moduler som kommer från olika leverantörer så kan de nu använda samma benämning på variabler, funktioner och klasser men de krockar inte eftersom de är definierade i olika namnrymder.



Klassen Person i egen namnrymd {#person}
----------------------------------

Vi tar klassen Person och deklarerar ett namespace överst i klassfilen `src/Person/Person.php`.

```php

namespace Mos\Person;

/**
 * Showing off a standard class with methods and properties.
 */
class Person
{
```

Deklarationen av namespace ligger alltid överst i filen.

I min deklaration av namespace så användare jag strukturen `<vendor>\<namespace>`.

I mitt fall är `Mos` vendor, leverantören av koden. Jag väljer att lägga vendor-namnet i mitt namespace, då kan alla klasser jag själv skriver ligga under mitt eget namespace och undvika krockar med andra vendor, leverantörer.

Mitt `<namespace>` är `Person` som är ett rimligt namn på modulen (klassen) jag skapat. Klassens namn är nu `Person`.



Skapa objekt av klassen Person {#skapaperson}
----------------------------------

När vi nu vill skapa ett objekt av klassen Person, i filen `index_namespace.php`, så måste det ske med klassens absoluta namn, det finns ett par alternativ att göra detta.

Ett alternativ är att skapa ett objekt genom att ange hela namespacet till klassen.

```php
$person = new \Mos\Person\Person();
```

Ovan är den absoluta _sökvägen_ till klassen.

Ett annat alternativ är att använda samma namespace som klassen har, i filen där jag jobbar, då hade det kunnat sett ut så här.

```php
namespace Mos\Person;

$person = new Person();
```

All kod som skrivs i filen är deklarerad under namespacet `Mos/Person` så när jag skapar objektet så är sökvägen till objektet relativ det namespace jag jobbar i. När jag gör `new Person()` blir det alltså `new \Mos\Person\Person()` eftersom jag jobbar under namespace `Mos/Person`.

Ytterligare ett alternativ är att använda `use \Mos\Person\Person` för att berätta vilken sökvägen, namespacet, är till klassen `Person`.

```php
use \Mos\Person\Person;

$person = new Person();
```

I detta fallet så anger jag att i filen så kan jag referera till `Person` och då innebär det att sökvägen `\Mos\Person\Person` används.

Det finns alltså flera varianter på hur man kan ange vilken sökväg/namespace som gäller för respektive klass, funktioner eller variabel.



En autoloader för namespace {#autoload}
----------------------------------

Nu när klassens namn består av en namnrymd så fungerar inte längre vår autoloader. Låt oss uppdatera den och samtidigt göra ett exempel som kontrollerar att allt fungerar.

Först placerar vi koden för klassen Person i filen `src/Person/Person.php`, du kan se att sökvägen till filen motsvarar namespacet `\Mos\Person\Person`, om man tar bort vendor-namnet. Stora och små bokstäver är viktiga, annars kommer autoloadern inte att hitta filen.

Då behöver vi ha en autoloader som hittar klassfilen. Vi tar och skapar en helt ny autoloader. I PHP kan vi ha flera autoloaders, de kedjas, _chainas_, och anropas efter varandra, tills klassfilen hittas. I vårt exempel kommer vi dock bara använda en autoloader åt gången.

Här är en autoloader som hittar klassen, oavsett vendor-namnet (du kan alltså välja ditt eget vendor-namn), under katalogen `src/`. Spara din autoloader som `autoload_namespace.php`.

```php
/**
 * Autoloader for classes with namespace, exclude the vendor name.
 *
 * @param string $class the name of the class.
 */
spl_autoload_register(function ($class) {
    //echo "$class<br>";

    // Base directory for the namespace prefix
    $baseDir = __DIR__ . "/src/";

    // Remove the vendor-part
    $offset = strpos($class, "\\") + 1;

    // Get the relative class name
    $relativeClass = substr($class, $offset);

    // Replace the namespace prefix with the base directory, replace namespace
    // separators with directory separators in the relative class name, append
    // with .php
    $file = $baseDir . str_replace("\\", "/", $relativeClass) . '.php';

    // If the file exists, require it
    if (file_exists($file)) {
        require $file;
    }
});
```

Sedan gör du `index_namespace.php` där du testar att skapa ett objekt av klassen.

```php
/**
 * Show off the autoloader using namespace.
 */
include(__DIR__ . "/config.php");
include(__DIR__ . "/autoload_namespace.php");

$object = new \Mos\Person\Person("MegaMic", 42);
echo $object->details();
var_dump($object);
```

När allt är på plats så bör du kunna köra ditt testprogram som tidigare, men nu använder du namespace och har tagit ett viktigt steg in i modularisering av din kod, ett begrepp där du kan samla flera sammanhängande klasser i en egen modul.
