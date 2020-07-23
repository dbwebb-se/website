---
author: mos
revision:
    "2018-08-22": "(A, mos) Första versionen."
...
Loopa array med foreach
=======================

För att loopa runt arrayer finns en speciell loop-konstruktion som heter `foreach()`.



Foreach {#foreach}
-----------------------

Det spelar ingen roll om din array är en numerisk eller en key/value array, loopkonstruktionen `forach()` fungerar på samma sätt för båda.

Det finns två varianter av loopen. Antingen loopar du igenom de värden som ligger i arrayen, eller så är du också intresserad av nyckeln för värdet.

I numeriska arrayer är nyckeln en siffra som säger vilken position värdet ligger på och i strängindexerade arrayer är nyckeln en sträng. Men, loopkonstruktionen hanterar dessa lika oavsett.

Här är en array vi kan använda.

```php
// Add items to array
$collection["hearts"] = "❤";
$collection["spade"] = "♠";
$collection["clubs"] = "♣";
$collection["diamond"] = "♦";
```

Vi kan nu loopa runt alla värden i arrayen och skriva ut dem.

```php
// Loop all values and use their keys
foreach ($collection as $key => $value) {
    echo "The key '$key' contains the value '$value'.\n";
}
```

[FIGURE src=image/snapht18/array-foreach.png?w=w3 caption="Arrayens värden loopas igenom och nyckel och värde skrivs ut."]

Om du inte är intresserad av nyckeln `$key` så kan du ignorera den i loopens konstruktion.

```php
// Loop all values and ignore their keys
foreach ($collection as $value) {
    echo "The array contains the value '$value'.\n";
}
```

Detta var grunden i en foreach och hur man loopar över arrayer.



Alternativ syntax {#alt}
-----------------------

När du blandar html och php och skriver kod i templatefiler så kan du välja att använda en alternativ syntax för foreach.

Här är en konstruktion som använder arrayer och skriver ut en meny till en webbsida genom att använda den alternativa syntaxen.

Först skapar vi en array som innehåller alla sidor på webbplatsen. Det är dessa sidor vi vill skall synas i menyn.

```php
// Create the collection of valid pages.
$pages = [
    [
        "label" => "Home",
        "title" => "The home page, it starts here.",
        "url" => "home.html",
    ],
    [
        "label" => "About",
        "title" => "About this website.",
        "url" => "about.html",
    ],
];
```

Det är en array som består av två sidor. Varje sida har ett par egenskaper som kan användas när man genererar en meny.

Vi kan nu skapa en loop, förslagsvis i en templatefil, som loopar över arrayen och genererar html-kod för varje menyval.

Det kan se ut så här.

```html
<nav>
    <ul>
    <?php foreach ($pages as $value) : ?>
        <li>
            <a href="<?= $value["url"] ?>" title="<?= $value["title"] ?>">
                <?= $value["label"] ?>
            </a>
        </li>
    <?php endforeach; ?>
    </ul>
</nav>
```

Resultatet blir en ul/li lista som sedan kan stylas till en meny.

[FIGURE src=image/snapht18/array-menu.png?w=w3 caption="Grunden till en meny via en ul/li-lista, generarad utifrån data i en array."]

Det kan vara behändigt att skapa datan till en meny via en array och sedan låta programmeringskoden generera html-koden som behövs.
