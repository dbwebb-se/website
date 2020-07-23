---
author: mos
revision:
    "2018-06-27": "(A, mos) Första versionen, uppdelad av större dokument."
...
Strängar och stränghantering
=======================

Vi tittar på hur strängar kan hanteras och vad som skiljer på strängar med enkelfnutt och dubbelfnutt. Vi tittar på begreppen strängkonkatenering, interpolation och vilka inbyggda funktioner som finns för stränghantering.



Dubbelfnutt {#dubbelfnutt}
-----------------------

En sträng är det som står inom dubbelfnutten, till exempel `"Jag vill ha en moped."`.

Man kan skriva ut en sträng direkt eller så kan man lägga den i en variabel. Man kan också kombinera utskriften av variabler och strängar.

```php
// Print out "My name is Mikael."
$name = "Mikael";
echo "My name is ", $name, ".\n";
```



Konkatenera strängar {#konkat}
-----------------------

Man kan slå samman strängar, konkatenera dem. I php finns en operator punkt `.` som är konkateneringsoperator för strängar.

```php
// Print out "My name is Mikael."
$name = "Mikael";
$message = "My name is " . $name . ".\n";
echo $message;
```

I exemplet ovan så konkateneras delsträngar, slås ihop, och den samlade strängen finns i `$message` som skrivs ut.



Interpolation med strängar {#interpolation}
-----------------------

Man kan kombinera variabler inuti strängar, php-parsern kommer att ersätta variablernas värde inuti strängen. Detta kallas _string interpolation_ eller _variable interpolation_.

```php
// Print out "My name is Mikael."
$name = "Mikael";
$message = "My name is $name.\n";
echo $message;
```

Det finns alltså olika sätt att hantera strängar och man använder det man känner bäst för. Kanske anser du att sättet ovan med interpolation är det som är mest läsbart?

Om man har komplexa strängar eller variabler så kan man behöva omringa variabeln med måsvingar `{}`. Det gör man då variabeln riskerar att krocka med texten.

```php
// Print out "This is Mikael's rubber duck."
$name = "Mikael";
$message = "This is ${name}'s rubber duck.\n";
echo $message;
```

Måsvingarna gör att parsern kan tolka och enklare skilja vad som är sträng och variabel. Det kan också göra koden mer läsbar för programmeraren.


Enkelfnutt {#enkelfnutt}
-----------------------

Enkelfnutten skiljer sig från dubbelfnutten i hur specialtecken och interpolation fungerar.

När strängen omges med enkelfnuttar så sker ingen interpolation och specialtecken skrivs inte ut, istället skrivs dess motsvarande tecken ut.

Låt oss ta ett exempel.

```php
// Print out "This is Mikael's rubber duck."
$name = "Mikael";
$message = "This is ${name}'s rubber duck.\n";
echo $message;

// See the difference when using ''
$message = 'This is ${name}\'s rubber duck.\n';
echo $message;
```

När jag vill skriva ut en enkelfnutt, inuti en sträng som omges med enkelfnuttar, så behöver jag escapa det tecknet med en _backslash_ `\'`. Samma gäller om jag vill skriva ut en dubbelfnutt inom en sträng som omges av dubbelfnuttar.

Så här kan du se skillnaden.

[FIGURE src=image/snapht18/enkelfnutt.png?w=w3 caption="Se skillnanden mellan enkelfnutt och dubbelfnutt."]

Du kan se att det inte sker någon interpolation i enkelfnuttsträngen och att även tecknet för radbrytning `\n` skrivs ut och ersätts inte med en radbrytning. Detta är skillnaden hur enkel- och dubbelfnuttar fungerar.



Inbyggda funktioner för strängar {#inbyggd}
-----------------------

Det finns en stor mängd [inbyggda funktioner för att jobba med strängar](http://php.net/manual/en/ref.strings.php). Med dessa funktioner kan du räkna ut längden på strängar, plocka ut delsträngar och jämföra strängar och mycket mycket mer.

Här är ett par exempel på hur du kan använda inbyggda funktioner för strängar.

```php
// Trim a string and remove all whitespace
$var = trim("  this is content  ");

// Count the length (3) of the string
$var = strlen("123");

// Get a substring "am" from a string
$var = substr("I am happy", 2, 2);

// Compare two strings and ignore case
$var = strcasecmp("moped", "MOPED");
```

Genom att lära sig vilka inbyggda funktioner som finns så kan man spara en hel del kodrader, det finns funktioner som löser de vanligaste fallen för stränghantering.

Referensmanualen för php är din guide till att veta mer om inbyggda funktioner för stränghantering.
