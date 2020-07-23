---
author: mos
revision:
    "2018-06-20": "(B, mos) Bort med kommentarer och lade till uttryck."
    "2018-03-13": "(A, mos) Första versionen, uppdelad av större dokument."
...
Instruktioner och uttryck
=======================

Låt oss titta på byggstenarna i språket och hur de hänger ihop. Vi kan kalla det en del av språkets syntax, det regelverk som säger hur man kan skriva koden.



PHP starttag och sluttag {#php-taggar}
-----------------------

Man går in i "php-läge" med starttag `<?php`, därefter tolkas allt som php-kod. Man avslutar med en sluttag `?>`. Därefter kan man skriva vanlig html-kod igen. På detta sätt kan man växla mellan html och php, eller ha en fil med enbart php-kod.

```php
<?php 

// Everything between the PHP tags is considered to be PHP-code.

?>
```

Om din fil enbart innehåller php-kod, eller om sluttaggen är det sista tecknet i filen, då (kan) skall du exkludera sluttaggen. Anledningen är att sluttaggen i detta fallet är en potentiell felkälla som kan ge upphov till fel som bland annat är kopplade till sessionen.



Instruktioner (statement) och semikolon {#instruktioner}
-----------------------

Det som finns mellan starttagg och sluttagg är _instruktioner_. Man kan ange flera instruktioner och separera dem med semikolon `;`. På engelska brukar vi kalla dessa instruktioner för _statement_.

Här är ett exempel på php-kod fördelat på instruktioner som var och en skriver ut en textsträng.

```php
echo "Hello World!\n";
echo "Hello PHP!\n";
echo "My name is Mikael...\n";
```

En kodsekvens i php är alltså uppbyggd av en eller flera instruktioner.

En instruktion, ett _statement_, kan vara som här en utskrift med `echo` enligt ovan, men det kan också vara en tilldelning av en variabel, en loop eller en if-sats. Du kan se dessa instruktioner som programmeringsspråkets grundläggande byggstenar.



Gruppera instruktioner {#group}
-----------------------

Man kan gruppera instruktioner inom måsvingar `{}`. Allt som ligger inom måsvingarna blir då en egen samlad instruktion som består av flera mindre instruktioner.

```php
{
    echo "Hello World!\n";
    echo "Hello PHP!\n";
    echo "My name is Mikael...\n";
}
```

Ovan konstruktion fungerar, men är inte så vanlig och tillför egentligen inget i den formen den har. Se den bara som ett exempel på en gruppering av instruktioner. Måsvingarna förekommer mest när man jobbar med loopar, villkorssatser, funktioner och klasser. 

Du kan se att koden är intabbad inom måsvingarna, det är en konvention som programmerare följer, att tabba in sin kod för att visa att den ligger i ett sammanhang. Den typen av kodkonventioner gör det enklare att läsa kod som är skriven av olika programmerare.



Uttryck (expression) {#uttryck}
-----------------------

I php kan vi sammanfatta ett uttryck som "allt som har ett värde". Uttryck kan till exempel vara en tilldelning av en variabel, en addition av två tal eller en jämförelse.

Låt oss titta på ett par exempel av uttryck.



### Tilldelning av tal {#tilldela}

Här är ett exempel på där uttryck används.

```php
// Tilldelning av ett tal till en variabel
$a = 7;
```

I exemplet ovan är `7` ett uttryck i sin enklaste form. Resultatet av det uttrycket tilldelas variabeln `$a`. Efter tilldelningen så innehåller variabeln värdet 7.

I exemplet är också `$ = 7` ett uttryck i sig självt, det lämnar kvar resten av uttrycket som i detta fallet är 7. Man kan testa det genom att skriva ut värdet från uttrycket.

```php
// Ett udda sätt att inspektera och skriva ut resultatet av en tilldelning
echo ($a = 7);
```



### Anrop av funktion som ger ett värde {#func}

En konstruktion som också är ett uttryck är anropet av en funktion.

```php
// En funktion definieras
function theAnswer()
{
    return 42;
}

// Funktionen anropas och efterlämnar ett resultat som tilldelas variabeln
$a = theAnswer();
```

I exemplet ovan definieras en funktion som returnerar talet 42. När funktionen anropas via `theAnswer()` så är det ett uttryck som ger ett resultat som tilldelas variabeln `$a`.



### Jämförelse {#jamfor}

En annan konstruktion som är ett uttryck och ger ett värde är en jämförelse mellan två tal, eller två strängar.

```php
// Jämför två tal efterlämnar ett värde
echo ( 42 > 7 );
```

Ovan skriver vi ut resultatet av en jämförelse. Själva jämförelsen `42 > 7` efterlämnar ett resultat som är sant `true` om jämförelsen är uppfylld, annars efterlämnar den ett falskt `false` värde.

Denna typen av jämförelser använder vi ofta i konstruktioner som villkorssatser och loopar.

Men i dess enkelhet är det här ett exempel på ett uttryck, ett expression.
