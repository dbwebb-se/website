---
author: mos
category:
    - nodejs
    - javascript
    - mysql
    - kursen dbjs
    - kursen databas
revision:
    "2021-01-21": "(C, mos) lade till länk till inspelad föreläsning."
    "2019-01-21": "(B, mos) Genomgången och uppdaterad med mer förklaringar och ny kodstruktur på exempelprogrammen."
    "2017-12-29": "(A, mos) Uppdaterad version av tidigare artikel."
...
MySQL och Node.js (v2)
==================================

[FIGURE src=/image/snapvt17/npm-mysql.png?w=c5 class="right"]

Vi skall använda JavaScript och Node.js för att koppla oss mot en MySQL databas, med hjälp av externa paket vi installerar med pakethanteraren npm.

Vi använder en befintlig databas och kopplar upp oss med ett par JavaScript-filer och gör en rapport via SELECT och en sökfunktion där vi filterar resultatet.

Vi använder async/await för att hantera det asynkrona beteendet och vi gör en enkel inmatning från tangentbordet.

<!--more-->

När vi är klara har vi byggt ett litet skript som söker i databasen via JavaScript och Node.js och presenterar resultatet i en textbaserad rapport med tabell layout.

[FIGURE src=image/snapvt18/nodejs-mysql-search.png?w=w3 caption="Med JavaScript och Node.js bygger du ett skript som kopplar sig till din databas."]



Förutsättning {#pre}
--------------------------------------

Du har redan koll på databasen MySQL, dess klienter och du kan grunderna i Node.js och JavaScript på serversidan.

Du har installerat npm och du har Node.js version 10 eller senare.

Exempelprogrammen i artikeln finns i kursrepot databas under [`example/nodejs/mysql`](https://github.com/dbwebb-se/databas/tree/master/example/nodejs/mysql).

Du är bekant med guiden "[Kom igång med SQL i MySQL](guide/kom-igang-med-sql-i-mysql)" och har tillgång till datasen "skolan" som är fylld med innehåll.



Video {#video}
--------------------------------------

Det finns en inspelad föreläsning "[JavaScript och MySQL](kurser/databas-v1/forelasning/javascript-och-mysql)" som berör samma ämne som denna artikel hanterar. Du kan välja att titta på den för att komplettera den bilden du får från artikeln, eller som en introduktion till ämnet, innan du börjar jobba med artikeln.



Förberedelser {#forbered}
--------------------------------------

Vi skall snart installera ett par moduler som hjälper oss att koppla JavaScript med Node.js mot MySQL. Vi installerar dessa moduler med pakethanteraren npm och vi behöver först bestämma en katalog där vi gör installationen.

Eftersom vi troligen jobbar i ett kursrepo, kursrepot databas, så väljer jag katalogen `me/` som installationskatalog.

Vi behöver då förbereda katalogen så att vi senare kan göra installationen.

Gör så här för att initiera katalogen.

```text
# Gå till kursrepot och katalogen me/
npm init
```

När du får frågor från `npm init` så kan du trycka enter och använda standardsvaren. När du är klar har filen `package.json` skapats. Den filen kommer att innehålla de paket du senare väljer att installera.

Du kan se vad filen `package.json` innehåller.

```text
cat package.json
```

Om du av någon anledning vill göra om initieringen så kan du enkelt radera de filerna som skapades med följande kommando.

```text
rm package.json
```



API mot MySQL {#api}
--------------------------------------

Vi behöver ett API som låter oss prata med databasen via JavaScript och Node.js. Vi väljer [paketet mysql](https://www.npmjs.com/package/mysql) som är ett av de mer använda.

Jag vill använda programmeringsstilen med async/await för att hantera asynkrona anrop. För det syftet väljer jag [paketet promise-mysql](https://www.npmjs.com/package/promise-mysql) som är en wrapper kring paketet mysql.

Jag går till kursrepot under katalogen `me/` och installerar modulerna med npm. Jag installerar direkt i `me/` så kan alla mina program kan använda samma installation.

```text
# Ställ dig i kursrepot under katalogen `me/`.
npm install mysql promise-mysql
```

Då var det klart.

Om du dubbelkollar innehållet i filen `package.json` så ser du två rader med ovan paketnamn, följt av de versionsnummer som installerats.

```text
cat package.json
```

Om du av någon anledning vill göra om installationen från början så kan du enkelt radera de filerna som skapades med följande kommando.

```text
rm -rf package-lock.json node_modules/
```

Då testar vi om installationen gick bra.



Koppla mot MySQL {#connect}
---------------------------------------

Jag gör ett kort exempelprogram för att verifiera att min installation fungerar. Tanken är att göra en koppling mot databasen, utföra en SELECT och sedan avsluta. Det ger mig ett test på att installationen har gått bra.

Jag sparar koden i en fil `connect.js` inuti en main-funktion.

```javascript
/**
 * To verify that mysql is installed and is working.
 * Create a connection to the database and execute
 * a query without actually using the database.
 */
"use strict";

const mysql = require("promise-mysql");

/**
 * Main function.
 * @async
 * @returns void
 */
(async function() {
    let sql;
    let res;
    const db = await mysql.createConnection({
        "host":     "localhost",
        "user":     "user",
        "password": "pass",
        "database": "skolan"
    });

    sql = "SELECT 1+1 AS Sum";
    res = await db.query(sql);

    console.info(res);

    db.end();
})();
```

Jag lägger hela programmet i en funktion, ett eget mainprogram som körs direkt.

Jag använder en variant av main-funktionen som är en självexekverande funktion, det är en funktion som exekverar direkt, jag slipper anropa den. I JavaScript kallas den konstruktionen för "[IIFE (Immediately Invoked Function Expression)](https://developer.mozilla.org/en-US/docs/Glossary/IIFE)".

Följande två konstruktioner är alltså likvärdiga.

```javascript
// An ordinary async main function.
async function main() {

}
main();

// A immediately invoked async main function.
(async function() {

})();
```

Konstruktionerna ovan är alltså likvärdiga.

Jag använder async/await för att hantera att vissa av anropen är ansynkrona och jag vill förenkla och behöver ett (traditionellt) synkront flöde där varje funktion är klar innan nästa utförs. Jag måste vänta på att databasfrågan blir klar, innan jag kan hantera dess resultat.

Så här ser det ut när jag testkör programmet.

```text
$ node connect.js
[ RowDataPacket { Sum: 2 } ]
```

Svaret jag förväntade mig är `Sum: 2` och det får jag inuti en datastruktur. En bra start och paketen jag installerat fungerar enligt plan.



Om det går fel... {#felmeddelande}
---------------------------------------------

När exekveringen av programmet går fel så får du ett felmeddelande tillsammans med en stacktrace som visar var felet inträffade.

Pröva att ändra detaljerna som kopplar dig till databasen, använd ett felaktigt lösenord. Kör programmet och du kan få ett felmeddelande som börjar med något som liknar detta.

```text
$ node connect.js
(node:19881) UnhandledPromiseRejectionWarning: Error: ER_ACCESS_DENIED_ERROR: Access denied for user 'user'@'localhost'
 (using password: YES)
```

Om man letar i felmeddelandet i stacktracen så kan man se på vilken rad (och kolumn) som felmeddelandet genererades.

> "at /home/mos/git/dbwebbse/kurser/databas/example/nodejs/mysql/connect.js:15:31"

I mitt exempel är det raden som börjar med databasens uppkoppling.

```text
const db    = await mysql.createConnection({
```

På det sättet kan man felsöka och se vilket felmeddelande som gäller (överst) och vilken rad som genererar det (leta efter skriptets namn och radnummer).



Skapa en config.json {#config}
---------------------------------------------

Om vi tittar på exempelprogrammet ovan så krävs ett antal rader för att göra uppkopplingen till databasen. Dessa kommer jag behöva i alla mina filer som skall koppla sig mot databasen. Det vore trevligt om alla filer kunde dela en gemensam konfigurationsfil.

Jag skapar en JSON-fil med de detaljer som behövs för att koppla sig mot databasen och döper den till `config.json`.

```json
{
    "host":     "localhost",
    "user":     "user",
    "password": "pass",
    "database": "skolan"
}
```

Jag tar en kopia av `connect.js` och sparar som `connect_config.js` och uppdaterar enligt följande.

```javascript
// code before
const config = require("./config.json");

/**
 * Main function.
 * @async
 * @returns void
 */
(async function() {
    const db = await mysql.createConnection(config);

    // rest of code
})();
```

Nu använder jag konstruktionen `require` för att läsa in konfigurationsfilen till ett objekt `config` som jag sedan använder för att skapa databasens uppkoppling.

Det blev några färre kodrader vilket oftast blir enklare att hantera och leder till mer lättläst kod. Den stora fördelen är att jag nu kan dela konfigurationen mellan flera filer och olika main-program.



Rapport från databasen {#query}
---------------------------------------------

Jag tänker skapa en rapport som visar innehållet i en tabell. I databasen jag använder finns tabellen `larare` och jag tänker skriva ut en lista med alla lärare och vilken avdelning de jobbar på.

Om du är osäker på vad tabellen innehåller så går du till guiden och "[Skapa rapporter från tabellen](guide/kom-igang-med-sql-i-mysql/skapa-rapporter-fran-tabellen)".



### SELECT fråga {#select}

Jag tar en kopia av `connect_config.js` och sparar som `teachers.js` och uppdaterar enligt följande.

```javascript
/**
 * Show teachers and their departments.
 */
(async function() {
    const db = await mysql.createConnection(config);
    let sql;
    let res;

    sql = `
        SELECT
            akronym,
            fornamn,
            efternamn,
            avdelning
        FROM larare
        ORDER BY akronym;
    `;
    res = await db.query(sql);

    console.info(res);

    db.end();
})();
```

Jag väljer att skriva SQL-satsen på flera rader, som en [template sträng](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals) med backticks, jag tycker det blir tydligare på det viset.

När jag kör skriptet kommer resultsetet skrivas ut, det är en array `[]` och varje matchande rad (lärare) är ett objekt `{}` med properties som har ett värde. Det ser ut så här.

```text
$ node teachers.js
[ RowDataPacket {
    akronym: 'ala',
    fornamn: 'Alastor',
    efternamn: 'Moody',
    avdelning: 'DIPT' },
  RowDataPacket {
    akronym: 'dum',
    fornamn: 'Albus',
    efternamn: 'Dumbledore',
    avdelning: 'ADM' },

... resten av raderna
```

Datatypen `RowDataPacket` är en egenskapad datatyp som ligger i npm modulen mysql.



### Skriv ut som JSON {#json}

I sammanhanget JavaScript är formatet JSON ofta använt för att hantera data. Vi kan konvertera resultsetet till en JSON struktur ([`JSON.stringify()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify)) och skriva ut den med följande kodrader.

```javascript
// Output resultset as JSON
let data;

data = JSON.stringify(res, null, 4);
console.info(data);
```

När vi kör programmet får vi nu istället en utskrift i form av formatterad JSON data som ser ut så här.

```text
[
    {
        "akronym": "ala",
        "fornamn": "Alastor",
        "efternamn": "Moody",
        "avdelning": "DIPT"
    },
    {
        "akronym": "dum",
        "fornamn": "Albus",
        "efternamn": "Dumbledore",
        "avdelning": "ADM"
    }
}
```

Du ser här en array `[]` av objekt `{}` där varje objekt har namngivna properties (`akronym`, `fornamn`) med värden (`"ala"`, `"Alastor"`).

Det är ofta enkelt att konvertera mellan JavaScripts datastrukturer och JSON-formatet. Ibland är det enklare att felsöka och debugga om man skriver ut komplexa datastrukturer med formatterad JSON.



### Skriv ut som formatterad text {#pad}

Jag kan få en mer kontrollerad utskrift om jag loopar genom resultsetet och skriver ut informationen i formen av en tabell. Jag kan använda funktionenerna [`String.padStart()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/padStart) och [`String.padEnd()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/padEnd) för att formattera min utskrift och jag kan använda konstruktionen [`for..of`](https://developer.mozilla.org/sv-SE/docs/Web/JavaScript/Reference/Statements/for...of) för att loopa genom resultsetet.

Principen är så här.

```javascript
// Loop through each row the resultset
for (const row of res) {
    console.info(row);
}
```

Vi vill formattera utskriften som en tabell och då kan det se ut så här med lite strängformattering. Jag bygger upp en sträng med en header och jag lägger till rad för rad och till slut skriver jag ut strängen.

```javascript
// Output as formatted text in table
let str;

str  = "+-----------+---------------------+-----------+----------+\n";
str += "| Akronym   | Namn                | Avdelning |   Lön    |\n";
str += "|-----------|---------------------|-----------|----------|\n";
for (const row of res) {
    str += "| ";
    str += row.akronym.padEnd(10);
    str += "| ";
    str += (row.fornamn + " " + row.efternamn).padEnd(20);
    str += "| ";
    str += row.avdelning.padEnd(10);
    str += "| ";
    str += row.lon.toString().padStart(8);
    str += " |\n";
}
str += "+-----------+---------------------+-----------+----------+\n";
console.info(str);
```

När vi kör programmet får vi nu en väl formatterad tabell som innehåller informationen från databasen.

```text
$ node teachers.js
+-----------+---------------------+-----------+----------+
| Akronym   | Namn                | Avdelning |   Lön    |
|-----------|---------------------|-----------|----------|
| ala       | Alastor Moody       | DIPT      |    27594 |
| dum       | Albus Dumbledore    | ADM       |    85000 |
| fil       | Argus Filch         | ADM       |    27594 |
| gyl       | Gyllenroy Lockman   | DIPT      |    27594 |
| hag       | Hagrid Rubeus       | ADM       |    30000 |
| hoc       | Madam Hooch         | DIDD      |    37580 |
| min       | Minerva McGonagall  | DIDD      |    49880 |
| sna       | Severus Snape       | DIPT      |    40880 |
+-----------+---------------------+-----------+----------+
```

Nu känns det som vi har kontroll över hur vi kan ställa frågor mot databasen och skriva ut resultatet på olika sätt.



Strukturera i funktioner {#struktur}
---------------------------------------------

Jag vill förbereda mig för att skriva mer kod så jag väljer att strukturera upp min nuvarande kod i funktioner. Jag tar en kopia av filen `teachers.js` och sparar som `teachers_func.js` och börjar strukturera.

Inledningen ser ut som tidigare, jag väljer att göra require på modulnivå.

```javascript
/**
 * Show teachers and their departments.
 */
"use strict";

const mysql  = require("promise-mysql");
const config = require("./config.json");
```

Sedan kommer min main-funktion som nu anropar en funktion `viewTeachers()` som utför arbetet. Jag väljer att låta funktionen returnera en sträng, med rapporten, som jag kan skriva ut.

```javascript
/**
 * Main function.
 *
 * @async
 * @returns void
 */
(async function() {
    const db = await mysql.createConnection(config);
    let str;

    str = await viewTeachers(db);
    console.info(str);

    db.end();
})();
```

Funktionen `viewTeachers()` är definierad som async, så jag använder await för att invänta dess resultat.

Vi kan titta på funktionen och se att den utför samma SQL-sats som tidigare. Funktionen tar databaskopplingen som ett argument och använder det för att utföra sql-frågan.

```javascript
/**
 * Get a report with teacher details, formatted as a text table.
 *
 * @async
 * @param {connection} db Database connection.
 *
 * @returns {string} Formatted table to print out.
 */
async function viewTeachers(db) {
    let sql;
    let res;
    let str;

    sql = `
        SELECT
            akronym,
            fornamn,
            efternamn,
            avdelning,
            lon
        FROM larare
        ORDER BY akronym;
    `;
    res = await db.query(sql);
    str = teacherAsTable(res);
    return str;
}
```

Du kan se att jag valde att göra ytterligare en funktion `teacherAsTable()` för själva utskriften av rapporten. Den funktionen är inte definierad som async så här behövs inte någon await.

```javascript
/**
 * Output resultset as formatted table with details on teachers.
 *
 * @param {Array} res Resultset with details on from database query.
 *
 * @returns {string} Formatted table to print out.
 */
function teacherAsTable(res) {
    let str;

    str  = "+-----------+---------------------+-----------+----------+\n";
    str += "| Akronym   | Namn                | Avdelning |   Lön    |\n";
    str += "|-----------|---------------------|-----------|----------|\n";
    for (const row of res) {
        str += "| ";
        str += row.akronym.padEnd(10);
        str += "| ";
        str += (row.fornamn + " " + row.efternamn).padEnd(20);
        str += "| ";
        str += row.avdelning.padEnd(10);
        str += "| ";
        str += row.lon.toString().padStart(8);
        str += " |\n";
    }
    str += "+-----------+---------------------+-----------+----------+\n";

    return str;
}
```

Funktionen bearbetar resultsetet och skapar en sträng som sedan kan skrivas ut som en rapport.

Själva utskriften ser ut precis som tidigare.

```text
$ node teachers_func.js
+-----------+---------------------+-----------+----------+
| Akronym   | Namn                | Avdelning |   Lön    |
|-----------|---------------------|-----------|----------|
| ala       | Alastor Moody       | DIPT      |    27594 |
| dum       | Albus Dumbledore    | ADM       |    85000 |
| fil       | Argus Filch         | ADM       |    27594 |
| gyl       | Gyllenroy Lockman   | DIPT      |    27594 |
| hag       | Hagrid Rubeus       | ADM       |    30000 |
| hoc       | Madam Hooch         | DIDD      |    37580 |
| min       | Minerva McGonagall  | DIDD      |    49880 |
| sna       | Severus Snape       | DIPT      |    45000 |
+-----------+---------------------+-----------+----------+
```

Då skall vi se hur vi kan begränsa antalet rader som visas, med någon form av sökning, eller filtrering.



Söka i databasen {#search}
---------------------------------------------

Säg att vi vill reducera antalet rader i tabellen och bara skriva ut de som matchar en söksträng, hur kan man göra det?

Jag tar en kopia av `teachers_func.js` och skapar `search_al.js`.



### Main-funktion till search {#mainsearch}

Mitt main-program ser ut så här, det är samma som tidigare, bortsett från att jag nu anropar funktion `searchTeachers()` med en parameter.

```javascript
/**
 * Main function.
 *
 * @async
 * @returns void
 */
(async function() {
    const db = await mysql.createConnection(config);
    let str;
    let search;

    search = "al";
    str = await searchTeachers(db, search);
    console.info(str);

    db.end();
})();
```

Jag söker efter lärare som ar en delsträng `al` i sig. Just nu är detta hårdkodat.



### Funktionen searchTeachers {#searchteach}

Vi tittar på funktionen `searchTeachers()`, den ser ut så här.

```javascript
/**
 * Output resultset as formatted table with details on a teacher.
 *
 * @async
 * @param {connection} db     Database connection.
 * @param {string}     search String to search for.
 *
 * @returns {string} Formatted table to print out.
 */
async function searchTeachers(db, search) {
    let sql;
    let res;
    let str;
    let like = `%${search}%`;

    console.info(`Searching for: ${search}`);

    sql = `
        SELECT
            akronym,
            fornamn,
            efternamn,
            avdelning,
            lon
        FROM larare
        WHERE
            akronym LIKE ?
            OR fornamn LIKE ?
            OR efternamn LIKE ?
            OR avdelning LIKE ?
            OR lon = ?
        ORDER BY akronym;
    `;
    res = await db.query(sql, [like, like, like, like, search]);
    str = teacherAsTable(res);
    return str;
}
```

Funktionen är uppbyggd på samma sätt som `viewTeachers()`, med den skillnaden att här har vi en WHERE-del. Låt oss titta på den.

WHERE-delen är skapad med _place holders_ i form av `?`.

```javascript
sql = `
    // sql code...
    WHERE
        akronym LIKE ?
        OR fornamn LIKE ?
        OR efternamn LIKE ?
        OR avdelning LIKE ?
        OR lon = ?
    // more sql code...
`;
```

Tanken är att vi skickar med ersättare till dessa frågetecken, när vi utför själva frågan. Vi kan se hur det sker i slutet av funktionen.

```javascript
res = await db.query(sql, [like, like, like, like, search]);
```

Förutom sql-satsen så skickar vi med en array där respektive värde kommer att ersätta sitt motsvarande frågetecken, i ordning. Man måste vara noggrann med att antalet frågetecken motsvaras av antalet värden i arrayen. Annars får man ett felmeddelande om att sql-satsen är felaktig.

Du kan läsa i manualen om [npm mysql och hur placeholders fungerar](https://www.npmjs.com/package/mysql#performing-queries). Fördelen är att argumenten _escapas_ för att undvika skadliga injektioner i din SQL-kod.

I koden ovan väljer jag att formattera alla strängar till `%search%` så att det jag söker efter är en substräng. Det är därför jag använder variabeln `like`. När jag söker efter lönen så använder jag dock det rena värdet från `search`.



### Testa search.js {#testsearch}

Vi kan nu testa skriptet, det kan se ut så här när man söker ut de lärare som har delsträngen `al` i någon del.

```text
$ node search_al.js
Searching for: al
+-----------+---------------------+-----------+----------+
| Akronym   | Namn                | Avdelning |   Lön    |
|-----------|---------------------|-----------|----------|
| ala       | Alastor Moody       | DIPT      |    27594 |
| dum       | Albus Dumbledore    | ADM       |    85000 |
| min       | Minerva McGonagall  | DIDD      |    49880 |
+-----------+---------------------+-----------+----------+
```

Hur kan vi göra så att användaren själv kan mata in söksträngen?



Läsa in från tangentbord {#read}
--------------------------------

Vi kan använda [Node.js modulen readline](https://nodejs.org/api/readline.html) för att läsa in söksträngen via tangentbordet.

Vi bygger ett testprogram `search.js` genom att ta en kopia av filen `search_al.js`.

Överst i filen så inkluderar jag nu modulen readline och initierar den mot stdin och stdout.

```javascript
// Read from commandline
const readline = require('readline');
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});
```

Sedan bygger jag om flödet i mitt main-program och läser in söksträngen från användaren, med hjälp av funtionen `rl.question()`. Jag hanterar svaret i en callback så jag behöver flytta in all logik från main-programmet, in i callbacken.


```javascript
/**
 * Main function.
 *
 * @async
 * @returns void
 */
(async function() {
    const db = await mysql.createConnection(config);
    let str;

    // Ask question and handle answer in async arrow function callback.
    rl.question("What to search for? ", async (search) => {
        str = await searchTeachers(db, search);
        console.info(str);

        rl.close();
        db.end();
    });
})();
```

Vi kan bryta ned vad som händer.

Först grundstrukturen som tar en sträng som skrivs ut, följt av en callback som anropas när användaren har matat in sin söksträng.

```javascript
rl.question("What to search for? ", // a callback function
    //
});
```

Callbacken skriver vi som en anonym [arrow function](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions). Callbacken måste anges som `async` eftersom den använder `await` inuti sin funktionsbody. Funktionen tar en parameter `(search)` som är det som användaren matat in.

```javascript
async (search) => {
    str = await searchTeachers(db, search);
    console.info(str);

    rl.close();
    db.end();
}
```

All kod ligger nu inuti callbacken, på gott och ont. Vi kan ju inte stänga ned databasen, eller `rl`, innan frågan är klar, så vi kan inte ha den delen utanför callbacken.

När jag provkör programmet ser det ut så här.

```text
$ node search.js
What to search for? DIDD
Searching for: DIDD
+-----------+---------------------+-----------+----------+
| Akronym   | Namn                | Avdelning |   Lön    |
|-----------|---------------------|-----------|----------|
| hoc       | Madam Hooch         | DIDD      |    37580 |
| min       | Minerva McGonagall  | DIDD      |    49880 |
+-----------+---------------------+-----------+----------+
```

Provkör ditt egna program och pröva söka efter fler delsträngar.



Readline med async och await {#rlawait}
--------------------------------------

Som du kanske såg så använde vi en klassisk callback för att hantera inmatningen från tangentbordet med `rl.question()`. Det finns dock en möjlighet att promisifiera denna funktionen, så att den går att använda tillsammans med await. Det är lite pilligt, men låt oss trots det kika kort på hur en sådan variant kan se ut. Jag skapar filen `search_await.js` som en kopia av `search.js`.

Det som är pilligt är just promisifieringen av funktionen. Den ser ut så här och kan ske överst i filen, på modulnivå.

```javascript
// Promisify rl.question to question
const util = require("util");

rl.question[util.promisify.custom] = (arg) => {
    return new Promise((resolve) => {
        rl.question(arg, resolve);
    });
};
const question = util.promisify(rl.question);
```

Vi fördjupar oss inte i konstruktionen som finns beskriven i [Node.js manualen för promisify och custom promisified functions](https://nodejs.org/api/util.html#util_util_promisify_original).

Huvudsaken är att vi nu har en funktion `question()` som returnerar det som användaren skriver in och vi kan använda tillsammans med await.

Flödet i main-funktionen blir då så här.

```javascript
/**
 * Main function.
 *
 * @async
 * @returns void
 */
(async function() {
    const db = await mysql.createConnection(config);
    let str;
    let search;

    search = await question("What to search for? ");
    str = await searchTeachers(db, search);
    console.info(str);

    rl.close();
    db.end();
})();
```

Utskriften ser ut som tidigare.

```text
$ node search_await.js
What to search for? adm
Searching for: adm
+-----------+---------------------+-----------+----------+
| Akronym   | Namn                | Avdelning |   Lön    |
|-----------|---------------------|-----------|----------|
| dum       | Albus Dumbledore    | ADM       |    85000 |
| fil       | Argus Filch         | ADM       |    27594 |
| hag       | Hagrid Rubeus       | ADM       |    30000 |
+-----------+---------------------+-----------+----------+
```

Du kan välja om du använder callback-varianten eller await. Men för min egen del så kör jag vidare med await-varianten, nu när jag ändå har den så att den fungerar.

Jag kan tycka att programflödet blir aningen enklare att förstå, när man är nybörjare på Node.js.



Dokumentation {#docs}
--------------------------------------

Som du märker i artikeln så är kärnan i JavaScript dokumenterad på MDNs webbplats. När det gäller moduler specifika för Node.js så finns referensmanualen på deras webbplats. När det gäller paket vi installerar med npm så är vi hänvisade till dess README och bakomliggande GitHub repo.

Det gäller att skaffa sig kontroll över vilken referensdokumentation som är den "rätta". Refmanualen är alltid din bästa vän, se till att bli kompis med den, det sparar tid och frustration.



Avslutningsvis {#avslutning}
--------------------------------------

Du har nu fått en genomgång i hur MySQL kan fungera tillsammans med Node.js och du har fått en grundstruktur i hur du kan organisera ditt program.

Du har även fått en genomgång i hur man matar in text från användaren.

Grundstrukturen i programmen kan du förhoppningsvis bygga vidare på när du bygger allt större program med databasen.

<!--
Denna artikel har en [egen forumtråd](t/6270) som du kan ställa frågor i, eller ge tips.
-->
