---
author: mos
revision:
    "2018-06-26": "(A, mos) Första versionen, kort introduktion."
...
Variabler
=======================

Vi tittar kort på begreppet variabler, som en introduktion till vad det är och hur det fungerar i PHP. Vi ser hur de skapas, hur värdet tilldelas och hur variablen kan användas för att skriva ut värdet och hur variabeln kan användas som argument till en inbyggd funktion i PHP.



Deklaration av variabler {#dekl-variabel}
-----------------------

En variabel i PHP föregås av ett dollartecken, `$`, det visar att det handlar om en variabel.

Efter dollartecknet följer variabelns namn som i variablerna `$val` och `$text`.

Variabelns namn startar med en bokstav eller "underscore" `_` och följs sedan av en mix av bokstäver, siffror och `_`. Variabelnamn gör skillnad på stora och små bokstäver, det betyder att `$text` och `$Text` är två olika variabler.

En variabel definieras första gången den används. Man kan fördeklarera en variabel, för tydlighets skull.

Här är exempel på ett par variabler med olika innehåll.

```php
// A variabel, declared but has no value. 
$var;

// A variable containing the value 0
$sum = 0;

// Add integers to variables.
$number1 = 42;
$number2 = 1337;

// Create variable holding a float value.
$number3 = 3.141592654;
$number4 = 1.4142;

// Variables with strings, the string is surrounded by '' or "".
$text1 = "I know ten decimals on pi: ";
$text2 = "Square of 2 is: ";
$text3 = "What is the response to the question on everythin and universe?";
$text4 = "The value 1337 is also known as Leet, or elite.";

// Boolean values (true/false) can be stored in variables.
$value1 = true;
$value2 = false;

// The value null is special and means "nothing", its useful to clear a value
// from a variable, to "reset" it.
$nothingness = null;
```

Där har du ett antal exempel på hur du kan spara värden i variabler.



Skriv ut variablers värde {#skrivut}
-----------------------

När du har deklarerat variablerna kan du använda dem. Här är ett exempel där värdet på variablerna skrivs ut tillsammans med text.

Man kan skriva ut flera saker på en rad och separera värdena med kommatecken.

```php
// Write out the ultimate question and its response, according to the book:
// The Hitchhiker's Guide to the Galaxy
echo $text3, " ", $number1, "\n";
```

Gör du ett testprogram med texten ovan så kommer resultatet att bli följande.

[FIGURE src=image/snapht18/42.png?w=w3 caption="Svaret på frågan om allt och universum."]

Det var ett enklare exempel på hur variabler kan användas för att bilda ett sammanhang.



Variabler som argument till funktioner {#argument}
-----------------------

I php finns ett stort antal inbyggda funktioner och till dem kan man skicka värden, eller variabler. Man kallar det att de inbyggda funktionerna tar argument.

Här är ett exempel på hur variabeler kan samverka med inbyggda funktioner.

```php
// Write out the square root of 2 and round it to three decimals.
$number = 2;
$square = sqrt($number);
$square = round($square, 3);
echo "The square root of ", $number, " is ", $square, "\n";
```

Det kan se ut så här när du kör programmet.

[FIGURE src=image/snapht18/square.png?w=w3 caption="Kvadratrooten ur talet 2 är 1.414, när man avrundar till tre decimaler."]

Du har nu sett grunden i hur variabler fungerar tillsammans med andra byggstenare i språket.



Bygg ett testprogram för variabler {#test}
-----------------------

Bygg ett eget litet testprogram för att använda dig av variabler och skriva ut dem samt använda dem tillsammans med inbyggda funktioner.

Att bygga små testprogram är ett mycket bra sätt att lära sig. Via små testprogram kan man bygga små konstruktioner för att testa hur de fungerar och på det sättet lära sig hur de kan användas.

Du kan se mitt lilla testprogram i kursrepot under `example/guide-php/01/variables.php`.
