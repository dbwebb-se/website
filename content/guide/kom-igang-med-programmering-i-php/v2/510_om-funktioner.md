---
author: mos
revision:
    "2018-08-29": "(A, mos) Första versionen."
...
Om funktioner
=======================

När programmen växer så måste man organisera sin kod. Att dela in koden i filer är ett sätt att organisera och fördela koden. Ett annat sätt är att skapa funktioner och anropa dem.

Låt oss se hur det går till.



Varför funktioner? {#vaffo}
------------------------

Funktioner är framförallt bra när du har kodsekvenser som upprepar sig på flera ställen i din kod. Kanske har man en bra lösning som fungerar, sedan märker man att samma lösning behövs i ett annat sammanhang, eller kanske en snarlik lösning. Man kallar det slarvigt för copy-paste utveckling, man utvecklar ny kod genom att kopiera gammal kod.

Beroende på sammanhanget så behöver det inte vara felaktigt att utveckla genom att kopiera gammal kod. Men nackdelen blir att exakt, eller snarlik, kod existerar på flera platser. Det gör att kodbasen blir större och efterhand kan det nå en nivå där det blir svårt att vidareutveckla och underhålla koden.

Det finns ett talesätt kring programmering som heter DRY, "don't repeat yourself". Det handlar om att en kodsekvens skall finnas på en och endast en plats. När man kodar enligt copy-paste tekniken så är man inte DRY.

Ett sätt att bli DRY är att jobba med funktioner. Lämpliga kodsekvenser fördelas in i funktioner. Det kan vara kod som upprepar sig, eller bara en kodsekvens som man bedömmer att "den här passar i en funktion".



Definiera en funktion {#definiera}
------------------------

Så här skapar man en funktion.

```php
function quack()
{
    echo "The duck says quack, quack.";
}
```

Ovan är en funktion som skriver ut en sträng. Funktionen heter `quack()`. Konstruktionen inleds med nyckelordet `function` och funktionens kod, dess _body_, omringas med måsvingar `{}`.

Så här kan man anropa funktionen.

```php
quack(); // Calls the function which echos the string
```

Detta är grunden i hur man skapar och anropar en funktion.



Hur stor är en funktion? {#stor}
------------------------

En funktion kan innehålla godtyckligt antal kodrader och konstruktioner. När man vill skriva läsbar kod så försöker man hålla funktionerna _lagom stora_. Lagom stora funktioner kan vara 1-20 rader kod, det ger en god översikt av koden i funktionen utan att programmeraren behöva skrolla genom stora kodstycken.

När en funktion blir för stor, eller om en funktion gör för många saker, så kan man välja att dela upp funktionens kod i flera funktioner. Man vill helst ha funktioner som är fokuserade på att göra en sak. Det kan göra det enklare att läsa och förstå koden.



Var sparar man funktioner {#src}
------------------------

Kod för en funktion är som all annan kod och kan egentligen placeras var som helst. Man måste dock definiera funktionen innan den kan anropas.

I min exempelkod så har jag valt att lägga alla funktioner i en egen fil. Det är inte ovanligt att man gör så.

I min sidkontroller `page.php` finns följande kodsektion som inkluderar alla mina funktioner.

```php
// Include essential functions
include(__DIR__ . "/src/functions.php");
```

Ännu har jag inte skapat några funktioner så filen `src/functions.php` är tom, förutom en kommentar.

```php
/**
 * Definitions of commonly used functions.
 */
```

Det kan vara bra att samla funktioner i en och samma fil. Om man tycker att funktions-filen blir för stor så kan man dela in funktionerna i olika filer. Det kan göra en växande kodbas tydlig. Man kan till exempel tänka sig att vissa funktioner hör ihop och då väljer man att lägga dem i var sina filer. En god kodstruktur kan man behöva jobba med hela tiden då koden utvecklas.



Returnera värde från en funktion {#return}
------------------------

En funktion kan returnera ett värde. Låt oss skriva om funktionen `quack()` så att den istället returnerar strängen. Sedan kan anroparen själv välja när strängen skrivs ut. På det sättet blir det mer flexibelt för användaren av funktionen att styra vad som händer.

Här returneras ett värde från funktionen. Den gamla koden är bortkommenterad.

```php
function quack()
{
    //echo "The duck says quack, quack.";
    return "The duck says quack, quack.";
}
```

Nu kan anroparen själv välja om funktionens resultat skall skrivas ut eller kanske sparas i en variabel.

```php
echo quack(); // Calls the function, returns the string and echos it.

$str = quack(); // Calls the function, stores the returned value in a variable.
echo "$str\n";  // Prints the variable together with a newline.
```

Vi har sett hur en funktion kan defineras och anropas och att den kan returnera ett värde.
