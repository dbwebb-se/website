---
author: mos
category:
    - nodejs
    - javascript
    - kursen databas
revision:
    "2021-01-21": "(C, mos) Komplettera med länk till föreläsning."
    "2019-02-01": "(B, mos) Rätta hur tärningen slumpas fram."
    "2019-01-17": "(A, mos) Första utgåvan."
...
JavaScript och Node.js
==================================

[FIGURE src=image/snapvt19/js-class-dice.png?a=10,60,55,07&w=c5 class="right"]

Vi skall ta de första stegen för att bygga ett program med JavaScript som vi kan köra med Node.js. Vi börjar med den interaktiva interpretatorn för att sedan lägga koden i en fil och exekvera med programmet node.

Vi ser även hur vi kan lägga funktioner och klasser i separata moduler som inkluderas till vårt main-program.

<!--more-->

När vi är klara har vi byggt ett litet skript, vårt första "Hello World" med JavaScript och Node.js och förhoppningsvis har vi fått en grundstruktur i där vi kan skriva våra program.



Förutsättning {#pre}
--------------------------------------

Du kan ett eller fler programmeringsspråk sedan tidigare.

Du är bekant med terminalen och du har tillgång till en texteditor.

Du har installerat Node.js, version 10 eller senare, samt pakethanteraren npm.

Du har läst på om grunderna i programmeringsspråket JavaScript och du vet att webbplatsen MDN innehåller information om språkets syntax och semantik.

Du vet att Node.js har en egen dokumentation för det API som Node.js bidrar med.

De filer som används i exemplet kan du finna under kursrepot databas i  [`example/nodejs/javascript`](https://github.com/dbwebb-se/databas/tree/master/example/nodejs/javascript). Du kan tjuvkika på källkoden där, eller så skriver du din egen kod medans du jobbar igenom artikeln.



Video {#video}
--------------------------------------

Det finns en inspelad föreläsning "[JavaScript och NodeJS](kurser/databas-v1/forelasning/javascript-och-nodejs)" som berör samma ämne som denna artikel hanterar. Du kan välja att titta på den för att komplettera den bilden du får från artikeln, eller som en introduktion till ämnet, innan du börjar jobba med artikeln.



Interpretatorn {#inter}
--------------------------------------

JavaScript är ett interpreterande språk, det finns en interpretator som läser och tolkar koden. Det fungerar på liknande sätt i programmeringsspråken Python och PHP.

När man har tillgång till en interpretator så kan man skriva JavaScript-kod som exekveras direkt.

Alla webbläsare har en sådan inbyggd interpretator, det är webbläsarens devtools och console som erbjuder den möjligheten. Man öppnar devtools vanligen med `F12` i godtycklig webbläsare.

[FIGURE src=image/snapvt19/devtools-console-js.png?w=w3 caption="I en webbläsare kan man skriva JavaScript i devtools console."]

Men, nu skall vi använda Node.js istället.

Vi kan starta den interpretatorn direkt i terminalen via kommandot `node`. Sedan kan vi skriva in liknande kommandon som jag använde ovan. Här har du några kommandon du kan leka med.

```javascript
console.log("Hello World");

for (let i=0; i < 9; i++) {
    console.log(i);
}

let a = 1;
let b = a + 1;

console.log(a, b);
```

Om jag startar `node` och sedan kör in samtliga kommandon ovan in i interpretatorn så kan det se ut så här i utskriften.

```text
$ node
> console.log("Hello World");
Hello World
undefined
>
> for (let i=0; i < 9; i++) {
...     console.log(i);
... }
0
1
2
3
4
5
6
7
8
undefined
>
> let a = 1;
undefined
> let b = a + 1;
undefined
>
> console.log(a, b);
1 2
undefined
>
```

Du kan avbryta interpretatorn genom att trycka `ctrl-d` som ofta innebär "slut på inmatning".

Ibland är det smidigt att snabbt öppna en interpretator för att testa konstruktionern, men ofta vill man istället spara koden i en fil och köra filen via interpretatorn.



Spara i fil {#sparafil}
---------------------------------------

Vi tar de kommandon jag hade ovan och sparar dem i en fil `interpretator.js`.

Nu kan vi köra alla kommandon i filen med kommandot `node`, det kan se ut så här.

```text
$ node interpretator.js
Hello World
0
1
2
3
4
5
6
7
8
1 2
```

Bra, då kan vi köra vår första fil med Node.js och JavaScript.



En main-funktion {#main}
---------------------------------------------

Låt oss göra en bättre struktur på programmet, vi lägger koden i en main-funktion och snyggar till det lite. Jag sparar koden i `hello.js`.

Så här ser min kod ut.

```javascript
/**
 * A sample of a main function stating the famous Hello World.
 *
 * @returns void
 */
function main() {
    console.log("Hello World");

    for (let i=0; i < 9; i++) {
        console.log(i);
    }

    let a = 1;
    let b = a + 1;

    console.log(a, b);
}

main();
```

Om vi nu kör programmet med `node hello.js` så får vi samma utskrift som tidigare. Skillnaden är att vi nu har en funktion som vi döpt till `main()` och att den anropas i slutet av skriptet.

Nu har vi en startpunkt för våra program.



Strukturera koden i main {#mainstruktur}
---------------------------------------------

Låt oss kika lite på koden vi nyss skrev och strukturera om den lite. Vi har här ett scope som är block-scope inuti funktionen och vi kan skapa variablerna i början av funktionen, det blir tydligare så.

Funktionen `console.log()` är egentligen för debug-utskrifter och det finns en motsvarighet om `console.info()` som är till för riktiga utskrifter. De fungerar på samma sätt så det är mer en semantisk skillnad.

För att pilla lite i koden så uppdaterar jag for-loopen och sparar siffer-sekvensen i en variabel som jag sedan skriver ut, exklusive sista komma-tecknet, med en inbyggd funktion [`substring()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/substring).

Så här ser min uppdatering ut, jag sparade den i `hello1.js`.

```javascript
/**
 * A sample of a main function stating the famous Hello World.
 *
 * @returns void
 */
function main() {
    let a = 1;
    let b;
    let range = "";

    b = a + 1;

    for (let i=0; i < 9; i++) {
        range += i + ", ";
    }

    console.info("Hello World");
    console.info(range.substring(0, range.length - 2));
    console.info(a, b);
}
```

Kan du nu uppdatera koden och lägga till en if-sats och en while-loop? Gör det för att visa att det inte är så svårt.

Kan du dessutom söka på MDN och finna hur man skriver ut dagens datum? Pröva googla på "mdn date".

JavaScript har en del inbyggda objekt som erbjuder en del inbyggda metoder att anropa. Kika på [JavaScript referens på MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference) för att få en snabb översikt.



Strict mode {#strict}
---------------------------------------------

I JavaScript finns något som heter "strict mode" som är en striktare hantering av vad som kan ske i koden. Koden blir lite mer brutal och säger ifrån när du skriver tvivelaktig kod.

Det är vanligt att se konstruktionen `"use strict";` överst i filer där man vill vara säker på att koden skall tolkas enligt det strikta modet.

Jag uppdaterar mitt program och lägger in kommentar överst i filen och sedan följade rad.

```javascript
/**
 * A simple test program.
 *
 * @author Mitt Namn
 */
"use strict";

// Sedan följer min main funktion...
```

Jag sparar mitt uppdaterade program i `hello2.js`. När jag kör det så ser det likadant ut. Det handlar lite mer om ordning och reda så ta för vana att lägga till en filkommentar och `"use strict";`.

Det är en god idé att lägga till ditt eget namn i alla filer. Iallafall när vi har det som skolarbete.

Provkör ditt program och se att det fungerar som tidigare.

Vill du veta mer om strict mode så kan du läsa om [Strict Mode i MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Strict_mode).



Skapa funktioner i filer {#funcfil}
--------------------------------------

I Node.js kan vi jobba med moduler som inkluderas, det gör det enkelt att fördela koden i olika filer vilket blir lättare att testa, underhålla och vidareutveckla.

Låt oss säga att vi vill skapa en funktion som räknar från a till b och skriver ut en sträng med alla tal mellan a och b.

En sådan funktion kan se ut så här, funktionen tar två argument och returnerar strängen. Jag döper funktionen till `stringRange(a, b)` och lägger koden i en fil `stringRange.js`.

Låt oss ta det stegvis och göra filen med funktionen och samtidigt testa den, innan vi integrerar den så den anropas från main-funktionen.

Så här blir min kod, inklusive två testfall i slutet av koden.

```javascript
/**
 * A collection of useful functions.
 *
 * @author Mitt Namn
 */
"use strict";



/**
 * Return the range between a and b as a string, separated by commas.
 *
 * @param {integer} a   Start value.
 * @param {integer} b   Last included value.
 * @param {string}  sep Separator, defaults to ", ".
 *
 * @returns {string} A comma separated list of values.
 */
function stringRange(a, b, sep = ", ") {
    let res = "";
    let i = a;

    while (i < b) {
        res += i + sep;
        i++;
    }

    res = res.substring(0, res.length - sep.length);
    return res;
}

console.log(stringRange(1, 10));
console.log(stringRange(1, 10, "-"));
```

Jag kan nu köra filen med `node`. Det blir ett enkelt sätt att testa filen för sig.

Så här ser utskriften ut.

```text
$ node stringRange.js
1, 2, 3, 4, 5, 6, 7, 8, 9
1-2-3-4-5-6-7-8-9
```

Än så länge är detta bara en funktion i en fil.



Skapa en modul av funktioner {#modulfil}
--------------------------------------

Låt oss skapa en modul av funktionen ovan, en modul som exporterar funktionen `stringRange()` så att den kan användas av `main()`.

Jag placerar dessa ändringar i en kopia av filen `stringRange.js` som jag döper till `stringRange1.js`.

Jag behöver kommentera ut mina testanrop, så de inte ligger kvar när jag nu gör en modul som skall importeras av andra filer.

Det första är att definiera vad modulen exporterar. Jag inleder nu filen så här.

```
/**
 * A collection of useful functions.
 *
 * @author Mitt Namn
 */
"use strict";

module.exports = {
    "stringRange": stringRange
};

// Here follows the definition of the function stringRange()...
```

Det jag gör är att skapa ett objekt `module.exports`, objekt konstrueras med måsvingar `{}`. Inuti objektet säger jag vad som skall exporteras och där lägger jag min funktion och exporterar den med samma namn. Jag kan exportera funktionen med ett annat namn om jag vill.

Vill jag exportera fler funktioner från samma fil så fyller jag på vad som exporteras, ungefär så här.

```javascript
module.exports = {
    "stringRange": stringRange,
    "exportedAsName": anotherFunction
};
```

Jag skapar nu en ny fil för mitt main-program som jag döper till `import.js`.

Denna gången skriver jag koden på modul-nivå och låter bli att använda en main-funktion, det går bra det också. Koden blir scopad på modulnivå, det vill säga filens scope, så det blir inga problem med att vi skräpar ned i ett globalt scope, sånt vill vi ju annars undvika.

```javascript
/**
 * A simple test program.
 *
 * @author Mitt Namn
 */
"use strict";

let utils = require("./stringRange1.js");
let res;

res = utils.stringRange(1, 10);
console.info(res);

res = utils.stringRange(1, 10, "-");
console.info(res);

console.log("\nWhat does the imported 'utils' consists of?");
console.log(utils);
```

När jag nu kör programmet så ser det ut så här.

```text
$ node import.js
1, 2, 3, 4, 5, 6, 7, 8, 9
1-2-3-4-5-6-7-8-9

What does the imported 'utils' consists of?
{ stringRange: [Function: stringRange] }
```

Den sista delen är utskiften av det objekt `utils` som innehåller den importerade funktionen. Ibland, vid felsökning, kan det vara bra att veta om att även sådana komplexa objekt går att skriva ut.

Så, vi har nu alltså delat upp vår kod i filer och vi har visat hur dessa filer, eller moduler, kan importeras in till vårt main-program.

Det är en bra plan att hantera all kod, förutom main-programmet, som moduler som ligger i egna filer.



Skapa klasser i filer {#klassfil}
--------------------------------------

I JavaScript finns möjligheten att skapa klasser som innehåller metoder och medlemsvariabler.

Klasserna kan man organisera i moduler där en modul är en klass. Man kan sedan inkludera klasserna i sitt main-program, på samma sätt som vi nyss gjorde med funktioner.

När man sedan har klassen så kan man skapa ett objekt med klassen som mall. Man skapar en instans av klassen.

Så här ser en klassfil ut, med ett par metoder och en medlemsvariabel. Klassen är förberedd att vara en modul. Jag döper filen till `dice.js`.

```javascript
/**
 * A module for game Guess the number I'm thinking of.
 */
"use strict";

class Dice {
    /**
     * @constructor
     */
    constructor() {
        this.dice = null;
    }

    /**
     * Roll the dice and remember tha value of the rolled dice.
     *
     * @param {integer} faces The number of faces of the dice, defaults to 6.
     *
     * @returns {integer} The value of the rolled dice min=1 and max=faces.
     */
    roll(faces=6) {
        this.dice = Math.floor(Math.random() * faces + 1);
        return this.dice;
    }

    /**
     * Get the value of the last rolled dice.
     *
     * @returns {integer} The value of the last rolled dice.
     */
    lastRoll() {
        return this.dice;
    }

    /**
     * When someone is printing this object, what should it look like?
     *
     * @returns {string} The value of the last rolled dice.
     */
    toString() {
        return this.dice;
    }
}

module.exports = Dice;
```

Klassen representerar en tärning där man kan rulla tärningen och optionellt ange hur många sidor som tärningen har. Klassen minns sista tärningsslaget och man kan hämta det igen.

Jag gör ett nytt main-program i filen `yatzy.js` där jag skapar fem tärningar som jag kastar och skriver ut deras värde.

```javascript
/**
 * A simple test program importing a class Dice.
 *
 * @author Mitt Namn
 */
"use strict";

let Dice = require("./dice.js");

// Prepare a dice hand to hold the dices (its an array)
let hand = [];

// Add the dices to the dice hand and roll them once
for (let i=0; i<5; i++) {
    hand[i] = new Dice();
    hand[i].roll();
}

console.info("Here is the dices you have rolled.");

// Print out the whole datastructure
console.info(hand);

// Join the elements and print out as a string.
// This construct is using the builtin class method toString.
console.info(hand.join());
```

När jag kör programmet så får jag en utskrift som ser ut så här.

```text
$ node yatzy.js
Here is the dices you have rolled.
[ Dice { dice: 4 },
  Dice { dice: 6 },
  Dice { dice: 3 },
  Dice { dice: 2 },
  Dice { dice: 4 } ]
4,6,3,2,4
```

Första utskriften skriver ut hela datastrukturen för min tärningshand, det är en array som innehåller fem objekt och varje objekt har en medlemsvariabel 'dice'.

Den sista raden är en sträng som skapats genom att joina array-elementen och använder den inbyggda funktionen `toString()` som jag definierat i klassen. Det ger en egendefinierad strängrepresentation av ett objekt och metoden kan anpassas efter ens behov.

Det var en klass, som en modul. Försök att organisera din kod i funktioner och klasser och dela in funktioner och klasser i filer och moduler.



Avslutningsvis {#avslutning}
--------------------------------------

Du har nu fått en genomgång i hur JavaScript fungerar med Node.js och du har fått en grundstruktur i hur du kan organisera ditt program tillsammans med main-program, funktioner, klasser och filer med moduler.

Grundstrukturen kan du förhoppningsvis bygga vidare på, även med begränsade kunskaper i JavaScript och Node.js. Det är alltid bra att ha en god grundstruktur att bygga på.

<!--
Denna artikel har en [egen forumtråd](t/8212) som du kan ställa frågor i, eller ge tips.
-->
