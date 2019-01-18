---
author:
    - efo
category:
    - js
    - ramverk
    - kurs ramverk2
revision:
    "2019-01-14": "(A, efo) Första utgåva."
...
Autentisering med JWT och bcrypt
===================================

Vi ska bygga vidare på vårt me-api från kmom01. I denna uppgift tittar vi på hur vi använder JWT, bcrypt och en sqlite databas för att spara och autentisera användare. Vi tittar sedan på hur vi kan skapa en route för att skapa redovisningstexter.



<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har gjort uppgiften [Bygg ett me API till ramverk2](uppgift/bygg-ett-me-api-till-ramverk2).



Introduktion {#intro}
-----------------------

I följande stycken går vi igenom tekniker som kan vara användbara för att implementera uppgiften som är specificerad i stycket [Krav](#krav).



En databas i grunden {#databas}
-----------------------

För att kunna spara användare och så småningom redovisningstexter installerar vi npm modulen node-sqlite3 i vårt me-api repo med följande kommando. [Dokumentationen för modulen](https://www.npmjs.com/package/sqlite3) är som alltid vår bästa vän.

```bash
npm install sqlite3 --save
```

Vi skapar sedan katalogen `db` i vårt repo och i den katalogen filen `texts.sqlite`. Vi ville inte att denna och andra sqlite filer är under versionshantering då de isåfall skriver över vår produktions databas när vi driftsätter så vi lägger till `*.sqlite` i `.gitignore`.

Ett smart drag i detta skedet är att skapa en migrations-fil `db/migrate.sql` som du kan använda för att skapa tabeller. Min migrate-fil innehåller än så länge följande SQL.

```sql
CREATE TABLE IF NOT EXISTS users (
    email VARCHAR(255) NOT NULL,
    password VARCHAR(60) NOT NULL,
    UNIQUE(email)
);
```

Vi har alltså två kolumner `email` och `password` och vi vill att `email` är unik. Vi kan nu med hjälp av följande kommandon skapa tabellen i vår `texts.sqlite` databas.

```bash
cd db
sqlite3 texts.sqlite
sqlite> .read migrate.sql
sqlite> .exit
```

Vi kan nu använda `sqlite3` modulen för att lägga till en användare i vår `texts.sqlite` databas på följande sätt.

```javascript
const sqlite3 = require('sqlite3').verbose();
const db = new sqlite3.Database('./db/texts.sqlite');

db.run("INSERT INTO users (email, password) VALUES (?, ?)",
    "user@example.com",
    "superlonghashedpasswordthatwewillseehowtohashinthenextsection", (err) => {
    if (err) {
        // returnera error
    }

    // returnera korrekt svar
});
```



### sqlite3 på servern

För att detta ska fungera på din droplet måste vi installera `sqlite3` innan vi kör `npm install`. Vi gör detta med `sudo apt-get install sqlite3` som vår `deploy` användare. Vi kan nu hämta senaste versionen av vårt API med `git pull` och köra `npm install` för att installera det nya paketet. Vi behöver även skapa databas filen `db/texts.sqlite` och köra migrations filen.



Säker hantering av lösenord {#passwords}
-----------------------

När vi sparar lösenord i en databas vill göra det så säkert som möjligt. Därför använder vi [bcrypt](https://codahale.com/how-to-safely-store-a-password/). Vi installerar bcrypt paketet med npm med hjälp av kommandot `npm install bcrypt --save`. [Dokumentationen för modulen](https://www.npmjs.com/package/bcrypt) är som alltid vår bästa vän.

För att hasha ett lösenord med bcrypt modulen importerar vi först modulen och sedan använder vi `bcrypt.hash` funktionen. Antal `saltRounds` definierar hur svåra lösenord vi vill skapa. Ju fler `saltRounds` är svårare att knäcka, men tar också längre tid att skapa och jämföra.

```javascript
const bcrypt = require('bcrypt');
const saltRounds = 10;
const myPlaintextPassword = 'longandhardP4$$w0rD';

bcrypt.hash(myPlaintextPassword, saltRounds, function(err, hash) {
    // spara lösenord i databasen.
});
```

Det finns även en promise version av biblioteket om man gillar promise eller async/await teknikerna. Läs mer om det i dokumentationen.

För att jämföra ett sparad lösenord med det användaren skrivit in använder vi `bcrypt.compare`.

```javascript
const bcrypt = require('bcrypt');
const myPlaintextPassword = 'longandhardP4$$w0rD';
const hash = 'superlonghashedpasswordfetchedfromthedatabase';

bcrypt.compare(myPlaintextPassword, hash, function(err, res) {
    // res innehåller nu true eller false beroende på om det är rätt lösenord.
});
```



JSON Web Tokens {#jwt}
-----------------------

Vi har i tidigare kurser använt både sessioner och tokens för att autentisera klienter mot en server. Vi ska i detta stycke titta på hur vi implementerar logiken bakom att skicka JSON Web Tokens från servern till en klient. Vi använder modulen jsonwebtoken som vi installerar med kommandot `npm install jsonwebtoken --save` och [dokumentationen finns på npm](https://www.npmjs.com/package/jsonwebtoken).


Vi använder här de två funktioner `sign` och `verify`.

```javascript
const jwt = require('jsonwebtoken');

const payload = { email: "user@example.com" };
const secret = process.env.JWT_SECRET;

const token = jwt.sign(payload, secret, { expiresIn: '1h'});
```

I ovanstående exempel skapar vi `payload` som i detta fallet enbart innehåller klientens e-post. Vi hämtar sedan ut vår `JWT_SECRET` från environment variablerna. En environment variabel sätts med kommandot `export JWT_SECRET='longsecret'`, där du byter 'longsecret' mot nått långt och slumpmässigt. Se till att denna secret är lång och slumpmässig, gärna 64 karaktärer. `payload` och `secret` blir sedan tillsammans med ett konfigurationsobjekt argument till funktionen `jwt.sign` och returvärdet är vår `token`.

När vi sen vill verifiera en token använder vi funktionen `jwt.verify`. Här skickar vi med token och vår secret som argument. Om token kan verifieras får vi dekrypterat payload och annars ett felmeddelande.

```javascript
jwt.verify(token, process.env.JWT_SECRET, function(err, decoded) {
    if (err) {
        // not a valid token
    }

    // valid token
});
```



JWT middleware {#middleware}
-----------------------

Vi såg i guiden [Node.js API med Express](kunskap/nodejs-api-med-express) hur vi kan skapa routes som tar emot POST anrop och hur vi kan använda middleware för att köra en funktion varje gång vi har ett anrop till specifika routes. Om vi skapar nedanstående route i vår me-api ser vi hur middleware funktionen `checkToken` ligger som första funktion på routen. Den anropas först och beroende på om `next()` anropas funktionen efter middleware. Vi observerar även hur vi från klientens sida har skickat med token som en del av headers och hur vi hämtar ut det från request-objektet `req`.

```javascript
router.post("/reports",
    (req, res, next) => checkToken(req, res, next),
    (req, res) => reports.addReport(res, req.body));

function checkToken(req, res, next) {
    const token = req.headers['x-access-token'];

    jwt.verify(token, config.secret, function(err, decoded) {
        if (err) {
            // send error response
        }

        // Valid token send on the request
        next();
    });
}
```

Vi såg i artikeln [Login med JWT](kunskap/login-med-jwt) kursen webapp hur man kan skicka lösenord med [postman](https://www.getpostman.com/). postman är ett utmärkt verktyg för att manuellt testa ett API. I postman kan man även sätta headers under headers fliken för varje request.

[FIGURE src=/image/ramverk2/postman-headers.png?w=c18]



Krav {#krav}
-----------------------

1. Skapa en POST route "/register" där man kan registrera en användare.

1. Skapa en POST route "/login" där man kan logga in med en registrerad användare och få tillbaka en JWT.

1. Skapa en POST route "/reports" där man som inloggad användare kan skapa en redovisningstext.

1. Ändra så dina GET "/reports/kmom01" och "/reports/kmom02" hämtar data från databasen.

1. Committa alla filer och lägg till en tagg (2.0.\*).

1. Pusha upp repot till GitHub, inklusive taggarna.

1. Publicera ditt API publikt och lägg den publika adressen i din inlämning på Canvas.



Tips från coachen {#tips}
-----------------------

Lycka till och hojta till i forumet om du behöver hjälp!
