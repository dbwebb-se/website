---
author: mos
revision:
    "2018-09-14": "(A, mos) Första versionen."
...
Läsa och skriva till sessioner
=======================

Vi tittar på hur vi läser och skriver värden till sessionsvariabeln `$_SESSION` i php.



Initiera, läsa och skriva {#lasskriv}
------------------------

När sessionen är startad så kan vi använda den inbyggda globala arrayen `$_SESSION` för att skriva och läsa värden som sparas i sessionen.

Låt oss se ett mindre exempel med en sida som minns ett tal och varje gång vi laddar om sidan så ökar talet med 1.

Det första vi behöver göra är att initiera värdet i sessionen. Den allra första gången som användaren kommer till sidan så finns inget värde i sessionen och vi behöver initiera den till att börja på 0.

Som nyckel i sessionen (arrayen) väljer vi `number`.

```php
// Read the value from the session, if it does not exist set
// it to 0.
if (!isset($_SESSION["number"])) {
    $_SESSION["number"] = 0;
}
```

Nu kan vi vara säkra på att innehållet för nyckeln `number` i sessionen alltid har ett värde.

Nu kan vi öka värdet, som på vilken variabel som helst.

```php
$_SESSION["number"] += 1;
```

Man hade också kunnat plocka ut värdet från sessionen och sparat i en variabel. Om man sedan uppdaterar värdet så behöver man dock spara tillbaka värdet i sessionen igen.

Här är en variant på hur man initierar sessionen, läser av värdet och ökar med 1. Här används en variabel som mellanlagring.

```php
// Get value from session or use 0 as default
$number = $_SESSION["number"] ?? 0;

// Increment the variable
$number++;

// Write the value to the session to remember it
$_SESSION["number"] = $number;
```

Detta är principen för hur du initierar, läser och skriver väden i sessionen.
