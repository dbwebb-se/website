---
author: mos
category:
    - nodejs
    - javascript
    - kursen databas
revision:
    "2021-01-21": "(B, mos) Länk till föreläsning."
    "2019-01-17": "(A, mos) Första utgåvan."
...
JavaScript och Node.js med async och await
==================================

[FIGURE src=image/snapvt19/js-async-await.png?a=50,50,5,8&w=c5 class="right"]

Vi tittar på hur den asynkrona programmeringsmodellen fungerar i JavaScript tillsammans med Node.js.

Vi läser in innehållet från en fil och kombinerar det med utskrifter och försöker förstå hur synkron programmeringsmodell förhåller sig till den asynkrona.

Vi använder async/await för att hantera den asynkrona programmeringsmodellen och styra upp exekveringsordningen. Men för att förstå vad som händer så tar vi vägen förbi callback och promise.

<!--more-->



Förutsättning {#pre}
--------------------------------------

Du har grundläggande kunskaper i JavaScript och du vet grunden i hur JavaScript fungerar tillsammans med Node.js.

Du har installerat Node.js, version 10 eller senare, samt pakethanteraren npm.

De filer som används i exemplet kan du finna under kursrepot databas i  [`example/nodejs/async-await`](https://github.com/dbwebb-se/databas/tree/master/example/nodejs/async-await). Du kan tjuvkika på källkoden där, eller så skriver du din egen kod medans du jobbar igenom artikeln.



Video {#video}
--------------------------------------

Det finns en inspelad föreläsning "[JavaScript och NodeJS](kurser/databas-v1/forelasning/javascript-och-nodejs)" som delvis berör samma ämne som denna artikel hanterar. Du kan välja att titta på den för att komplettera den bilden du får från artikeln, eller som en introduktion till ämnet, innan du börjar jobba med artikeln.

I videon finns ett exempel på asynkron hantering och det börjar ungefär i mitten av föreläsningen, se videons kapitelindelning och det kapitel som heter "Asynkron programmering".



Asynkron programmering i Node.js {#async}
--------------------------------------

En sak som skiljer JavaScript i Node.js, från andra traditionella programmeringsspråk, är dess asynkrona och icke blockande natur.

En viktig ingrediens för att bemästra JavaScript i Node.js är att förstå de olika delarna i dess asynkrona hantering. Tidiga versioner av JavaScript, pre ES2015 (ES6) löser hanteringen med callbacks. När ES2015 (ES6) kom så introducerades Promise och när ES2017 (ES8) kom så fick vi möjligheten att använda async/await. Vi ser att det finns olika sätt att hantera asynkron programmering i JavaScript, beroende av vilken version man jobbar med.

När man tittar på externa moduler till JavaScript och Node.js så får man vara vaksam på dokumentationen och se vilka möjligheter som erbjuds då de kan ha valt olika strategier för att hantera de asynkrona bitarna.

Om du är nybörjare på JavaScript i Node.js så kan det vara bra att vara medveten om denna frågeställning som delvis kan upplevas frustrerande när man försöker bemästra området.

För den som vill fördjupa sig i ämnet så rekommenderas de böcker som [Axel Rauschmayer skrivit om olika versioner av JavaScript](http://exploringjs.com/).

I denna artikel använder vi async/await, men vägen dit går via callback och promise.



Vad innebär en asynkron programmeringsmodell? {#asyncmod}
--------------------------------------

I en synkron programmeringsmodell så körs varje kodrade efter att föregående kodrad är avslutad. Man kan läsa koden uppifrån och ned och få en känsla för den ordning som koden exekveras i.

I synkron programmering så blockar programmet när det väntar på input från användaren, eller när programmet läser en fil. Programexekveringen slutar tills det kommer input, från användaren eller tills dess filen är inläst.

I en asynkron programmeringsmodell, vilken också kan benämnas med _Asynchrounous I/O_, så finns det en central _event loop_ som styr exekveringen. Så fort en operation, en kodrad, blockar på I/O, så lämnas exekveringskontrollen över till event loopen. Detta sker till exempel när vi låter användaren mata in något från tangentbordet, eller när vi läser och skriver till filer. Dessa är _blockande_ operationer.

Tanken är att event loopen tar över så fort någon exekvering blockar. Event loopen kan då lämna över exekveringen till en annan del i programmet som inte väntar på I/O och på det sättet exekvera hela programmet snabbare. Så fort något blockar så lämnas kontrollen över till de programdelar som inte blockar och kan exekveras.

Om du är bekant med eventstyrd programmering, som till exempel JavaScript i webbläsaren eller en fönsterbaserad GUI applikation, så vet du att event, händelser, styr vilken kod som exekveras och när den exekveras. Du kan ha en callback kopplad till en knapp och när någon trycker på knappen så skapas ett event. Om du lägger en eventlyssnare, kopplad till eventet "någon klickar på knappen A", så anropas din eventlyssnare och exekveras.

Om man är medveten om hur en eventdriven programmeringsmodell fungerar så kan man delvis jämföra den med en asynkron programmeringsmodell, och kanske kan man få viss förståelse för vad event loopen gör. Man är iallafall medveten om vad en callback gör.

Låt oss ta ett exempel.



Läs en fil och skriv ut {#lasfil}
--------------------------------------

Vi gör ett testprogram för att visa hur den asynkrona modellen exekverar när den stöter på blockande kod.

Vi gör ett program `index1.js` som läser data från en fil och skriver ut dess innehåll. Innan och efter det sker så skriver vi dessutom ut ett par textrader. Normalt tänker vi att programmet nu kommer att exekvera i ordning och utskrifterna kommer också i ordning.

```javascript
/**
 * A test program to show off async and await.
 *
 * @author Mitt Namn
 */
"use strict";

const fs = require("fs");
const path = "file.txt";

console.info("1) Program is starting up!");

fs.readFile(path, "utf-8", (err, data) => {
    console.info(data);
});

console.info("3) End of the program!");
```

Studera programmet, det är tre saker som skrivs ut. Filen `file.txt` har följande innehåll.

```text
2) This is the textfile.
```

Tanken är att lura oss att tro att sakerna skrivs ut i ordning, 1, 2 och 3. På det viset är vi vana att koden exekveras, när vi tänker synkron programmering.

Men, när vi kör programmet så får vi följande utskrift.

```text
$ node index1.js
1) Program is starting up!
3) End of the program!
2) This is the textfile.
```

Vi ser att "3)" skrivs ut före "2)". Anledningen är att anropet som läser filen är blockande och då lämnar över exekveringen till event loopen som fortsätter att skriva ut "3)" och sedan avsluta programmet. Ja, programmet avslutas inte eftersom det fortfarande inväntar att filen skall läsas och skrivas ut av den callback-funktion som angivits. När så filen är inläst så återfår den programexekveringen och kan skriva ut sin "3)".

Det vi ser i följande konstruktion är ett anrop till en funktion `fs.readFile()` som läser innehållet i en fil och sedan anropar callbacken, argument 3, som hanterar resultatet och i vårt fall skriver ut det.

```javascript
fs.readFile(path, "utf-8", (err, data) => {
    console.info(data);
});
```

Callbacken är skriven som en namnlös _arrow_ funktion, det är ett vanligt sätt att skriva en callback på.

Nåväl, utskrifter och programmets exekvering beror alltså av hur event loopen fördelar exekveringen och beror av vilka operationer som är blockande och inte.

Men, kan vi inte bara göra ett synkront anrop till att läsa filen istället?



Läsa filen synkront {#filesync}
--------------------------------------

Kika på funktionen [`fs.readFile()` i manualen](https://nodejs.org/docs/latest/api/fs.html#fs_fs_readfile_path_options_callback). Funktionen är inbyggd i Node.js och dess API. Just denna funktionen finns även som en synkron variant `fs.readFileSync()`. Ibland vill man verkligen ha en synkron variant.

Jag gör ett nytt exempelprogram där jag använder den synkrona och blockande funktionen för att läsa samma fil.

```javascript
/**
 * A test program to show off async and await.
 *
 * @author Mitt Namn
 */
"use strict";

const fs = require("fs");
const path = "file.txt";
let data;

console.info("1) Program is starting up!");

data = fs.readFileSync(path, "utf-8");
console.info(data);

console.info("3) End of the program!");
```

Nu kommer utskriften från programmet i ordning, som man förväntar sig från en program som exekveras i synkron ordning.

```text
$ node index2.js
1) Program is starting up!
2) This is the textfile.

3) End of the program!
```

Kan man inte bara göra alla metoder till synkrona?

Njae, det funkar inte så. I en asynkron programmeringsmodell så vill man verkligen dra nytta av den asynkrona och icke blockande modellen, man vill att det skall finnas en asynkron hantering. Men ibland, när man läser filer eller inväntar svaret på ett anrop från databasen, så behöver man kanske ändå en form av synkron exekvering i programmet.

Låt oss titta vidare på hur vi kan hantera asynkrona anrop och ändå kontrollera flödet i koden.



Ett löfte om ett resultat, ett promise {#promise}
--------------------------------------

Ett Promise är ett sätt att hantera asynkron programmering, vi kan kalla det ett löfte om att returnera ett svar. Promise erbjuder ett alternativ till callback-hantering och Promise är en förutsättning för det sättet vi skall jobba, med async/await.

Låt oss först titta på skillnaden mellan en callback och en promisifierad variant av samma anrop. En funktion som är promisifierad kommer att returnera ett Promise. Förenklat handlar det om att göra om en funktion som är skriven som en callback, till att returnera ett Promise. I Node.js finns det inbyggd hantering för att göra detta.

Låt oss titta på ett exempel där jag har byggt en funktion kring koden som läser in en fil (se `index3.js`). Här använder jag synkron hantering.

```javascript
/**
 * A test program to show off async and await.
 *
 * @author Mitt Namn
 */
"use strict";

const fs = require("fs");
const path = "file.txt";
let data;

console.info("1) Program is starting up!");

data = getFileContentSync(path);
console.info(data);

console.info("3) End of the program!");

/**
 * Return the content of the file, synced version which works.
 *
 * @param {string}   The path to the file to read.
 *
 * @returns {string} The content of the file.
 */
function getFileContentSync(filename) {
    let data;

    data = fs.readFileSync(filename, "utf-8");
    return data;
}
```

När jag kör koden ovan så hamnar allt i rätt sekvens, inga konstigheter här men jag använder ju den synkrona varianter av filläsning.

```text
$ node index3.js
1) Program is starting up!
2) This is the textfile.

3) End of the program!
```

Låt oss nu ser hur vi hade kunnat hantera detta om det _inte_ fanns en synkron version av funktionen. Då hade vi kunnat promisifiera callback-varianten. Här kan du [läsa i manualen om att promisifiera](https://nodejs.org/dist/latest-v8.x/docs/api/util.html#util_util_promisify_original).

Här är en uppdaterad variant i `index4.js` som har promisifierat callback-funktionen som läser filen. Här kan vi nu börja använda async och await för att styra ordningen i exekveringen så att funktionen är helt klar innan dess resultat levereras. Men för att göra det behöver vi en main-funktion då vi inte kan använda async/await på modulnivå.

```javascript
/**
 * A test program to show off async and await.
 *
 * @author Mitt Namn
 */
"use strict";

const fs = require("fs");
const util = require("util");
const readFile = util.promisify(fs.readFile);



/**
 * The main function, needed to wrap async await that can not be used
 * on module level.
 *
 * @async
 * @returns void
 */
async function main() {
    const path = "file.txt";
    let data;

    console.info("1) Program is starting up!");

    data = await getFileContentPromise(path);
    console.info(data);

    console.info("3) End of the program!");
}
main();



/**
 * Return the content of the file, using a promosiified variant.
 *
 * @param {string}   The path to the file to read.
 *
 * @returns {string} The content of the file.
 */
async function getFileContentPromise(filename) {
    let data;

    data = await readFile(filename, "utf-8");
    return data;
}
```

Titta noga på koden och notera var det finns kod med `await` och var det finns kod med `async`.

Vi vill inte gå in i detalj hur Promise fungerar, det lämnar vi som extra kvällsläsning för den intresserade. Vi vill istället förutsätta att vi har en promisifierad variant av funktionen `readFile`. Då kan vi enkelt använda await när vi anropar funktionen och därmed säga att vi vill vänta med att fortsätta exekveringen tills anropet är klart.

I funktionen `getFileContentPromise` ser vi hur `await` används.

```javascript
    data = await readFile(filename, "utf-8");
    return data;
}
```

Nyckelordet `await` inväntar svaret och fortsätter inte exekveringen till nästa rad förrän filen är inläst. Det blir egentligen samma effekt som `readFileSync`.

I main-funktionen gör vi samma sak, vi använder `await` för att invänta att funktionen returnerar sitt svar.

```javascript
    data = await getFileContentSync(path);
    console.info(data);
```

I vårt fall så har vi nu funktioner som är implementerade som asynkrona och drar nytta av den asynkrona programmeringsmodellen med eventloopen. Men flödet blir förutsägbart och vi kan bygga koden i funktioner, eller klasser, som returnerar värde när koden är klar.

Notera i koden att varje funktion som använder en `await`, måste defineras som `async`. Du kan se exempel på det både på main-funktionen och på funktionen som läser filens innehåll.

```javascript
async function main() { }
async function getFileContentPromise(filename) { }
```

Nyckelordet `async` sätts framför deklarationen av funktionen.

Detta var grunderna i async och await. Konceptet bygger på att funktioner som används är byggda med Promise och vi använder en halvautomatisk hantering att översätta kod som bygger på callback-hantering.

För att förstå detta i grunden så krävs det att man även förstår callback och hur promise fungerar. Men, om vi bara nöjer oss med att någon ser till att vår kod är promisifierad, så kan vi glatt använda async och await och det gör ett begynnande liv som JavaScript-kodare i Node.js aningen enklare, iallafall inledningsvis.



Avslutningsvis {#avslutning}
--------------------------------------

Denna artikel gav dig en introduktion i de begrepp som i mångt och mycket sammanfattar utmaningen att komma in i och förstå JavaScript med Node.js och dess asynkrona programmeringsmodell. Du har blivit introducerad i begreppen callback, promise, async och await och du har fått ett par exempelprogram att studera. Bygg gärna vidare på exempelprogrammen och se hur du kan bygga ut dem.

<!--
Denna artikel har en [egen forumtråd](t/8213) som du kan ställa frågor i, eller ge tips.
-->