---
author: mos
revision:
    "2018-09-03": "(A, mos) Första versionen."
...
Funktioner och argument
=======================

En funktion kan ta emot inkommande argument. När man anropar funktionen så skickar men med argumenten och baserat på dem kan funktionen returnera olika resultat.

Låt oss se hur det går till.



Argument {#args}
------------------------

När man definierar en funktion så kan man även definiera om den skall ta argument, och hur många.

Vi skriver om vår funktion `quack()` så att den tar ett argument som säger hur lätet skall vara.

Jag skapar en ny funktion `duckSays()` så att den inte krockar med den jag redan har skapat.

```php
function duckSays($sound)
{
    return "The duck says {$sound}.";
}
```

Nu kan jag anropa funktionen. Jag får inte missa att skicka med argumentet, annars får jag ett felmeddelande.

```php
echo duckSays("quack") . "\n";        // The duck says quack.
echo duckSays("quack, quack") . "\n"; // The duck says quack, quack.
```

Det vi får är en mer flexibel funktion som har fler användningsområden än ursprungliga funktionen `quack()`.



Flera argument {#args-fler}
------------------------

Man kan skicka fler argument till funktionen. Om vi tittar på vår funktion `duckSays($sound)` så kan vi tänka oss hur en funktion skulle kunna se ut om vi även skickade in djuret, inte bara lätet. Borde vi då inte få en än mer generell funktion som kan användas i än fler sammanhang?

Vi prövar idéen och skapar funktionen `animalSays($animal, $sound)` som tar två argument. Ett argument `$animal` som säger vilket djur det är och ett argument `$sound` som säger vilket lätet är.

```php
function animalSays($animal, $sound)
{
    return "The {$animal} says {$sound}.";
}
```

Vi kan nu anropa funktionen.

```php
echo animalSays("duck", "quack, quack") . "\n"; // The duck says quack, quack.
echo animalSays("snake", "sssssssssss") . "\n"; // The snake says sssssssssss.
```

Att använda flera parametrar in i en funktion gör att den kan användas i fler sammanhang.



Argument med standardvärde {#default}
------------------------

Det finns något som heter standard värde på ett argument, eller _default argument values_. Det är det värdet som argumentet får om den som anropar funktionen inte skickar med ett argument.

Låt oss jobba vidare med vår funktion och säg att vi vill avsluta utskriften med ett utropstecken "!" istället för en punkt ".". Kanske är det en hund som skäller väldigt högt. Jag döper funktionen till `animalSays1()` så att den inte krockar med de funktioner jag redan skapat.

```php
function animalSays1($animal, $sound, $end = ".")
{
    return "The {$animal} says {$sound}{$end}";
}
```

Se hur det tredje argumentet `$end` blir tilldelat ett standardvärde genom konstruktionen `$end = "."`.

Vi har nu en funktion med ett optionellt tredje argument. Den som anropar funktionen kan då välja att skicka med två eller tre argument.

```php
echo animalSays1("duck", "quack, quack") . "\n";   // The duck says quack, quack.
echo animalSays1("dog", "VOV, VOV", "!!!") . "\n"; // The dog says VOV, VOV!!!
```

Så här blir det när exempelsidan skrivs ut.

[FIGURE src=image/snapht18/vov.png?w=w3 caption="Djuren gör läten via en funktion som tar parametrar."]

Då har du kommit igång med hur man skickar argument till en funktion.



Läs mer {#mer}
------------------------

Du kan läsa mer om [funktioner och argument i manualen](http://php.net/manual/en/functions.arguments.php).
