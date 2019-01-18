---
author:
    - efo
    - mos
category:
    - nodejs
    - javascript
    - express
    - kursen dbjs
    - kursen ramverk2
revision:
    "2018-12-18": (D, efo) Kopierade och gjorde om för v2.
    "2017-10-16": (C, mos) Uppdatering inför kursen ramverk2, mer om pug.
    "2017-03-22": (B, mos) Flytta npm pug till toppen.
    "2017-03-20": (A, mos) Första utgåvan i kursen dbjs.
...
Node.js API med Express
==================================

[FIGURE src=image/snapvt17/npm-express.png?w=c5&a=0,30,20,0&cf class="right"]

Vi skall bygga ett simpelt API med hjälp av Node.js och modulen Express.

API:t är tänkt användas som ett me-api där vi skickar information i JSON format.

Vi ska titta på hur vi kan organisera våra routes och hur vi strukturerar koden på ett bra sätt.

<!--more-->



Förutsättning {#pre}
--------------------------------------

Du kan grunderna i Node.js och JavaScript på serversidan.

Du har genomgått artikeln "[GitHub Education Pack och en server på Digital Ocean](kunskap/github-education-pack-och-en-server-pa-digital-ocean)" och har en server på Digital Ocean samt ett domännamn.

Exempelprogram från tidigare version av kursen finns i ditt kursrepo under `example/express` (ramverk2).

Jag fixade ett exempel, bara för att kolla att alla delarna fungerar tillsammans som tänkt. Du kan se mitt exempel på [`emilfolino/ramverk2-me`](https://github.com/emilfolino/ramverk2-me) och det finns live på [me-api.jsramverk.me](https://me-api.jsramverk.me).



Installera modulen med npm {#npm}
--------------------------------------

Modulen [Express finns på npm](https://www.npmjs.com/package/express). Express är en del av [MEAN](http://mean.io/) som är en samling moduler för att bygga webbapplikationer med Node.js. I denna artikeln kommer vi att använda Express (E) och Node.js (N) i MEAN.

Innan vi börjar så skapar vi en `package.json` som kan spara information om de moduler vi nu skall använda.

```bash
# Ställ dig i katalogen du vill jobba
npm init
```

När du ombeds döpa paketet så ange "me-api" eller något liknande (det spelar ingen roll). Använd bara inte "express" eftersom det paketnamnet redan finns och du får problem i nästa steg. Du kan köra om `npm init` om du vill ändra namn, eller redigera namnet direkt i filen `package.json`.

Nu kan vi installera paketen vi skall använda `express`, `cors` och `morgan`. Vi väljer att spara dem i vår `package.json`.

```bash
npm install express cors morgan --save
```

Vi använder oss av `cors` för att hantera Cross-Origin Sharing problematik och `morgan` för loggning av händelser i API:t.

Då vi inte vill ha `node_modules` katalogen versionshanterad i git skapar vi filen `.gitignore` och lägger "node_modules/" som första rad i den filen.



Verifiera att Express fungerar {#verifiera}
---------------------------------------

Låt oss starta upp en server för att se att installationen gick bra.

Jag börjar med kod som startar upp servern tillsammans med en route för `/` och sparar i en fil du själv skapar `app.js`.

```javascript
const express = require("express");
const app = express();

const port = 1337;

// Add a route
app.get("/", (req, res) => {
    res.send("Hello World");
});

// Start up server
app.listen(port, () => console.log(`Example API listening on port ${port}!`));
```

Sedan startar jag servern.

```bash
$ node app.js
Example API listening on port 1337!
```

Nu kan jag skicka requester till servern via curl.

```bash
$ curl localhost:1337
Hello World
```

Om jag använder en route som inte finns så får jag en 404 tillsammans med ett svar som säger att routen inte finns.

```bash
$ curl -i localhost:1337/asd
HTTP/1.1 404 Not Found
X-Powered-By: Express
Content-Security-Policy: default-src 'self'
X-Content-Type-Options: nosniff
Content-Type: text/html; charset=utf-8
Content-Length: 134
Date: Wed, 15 Mar 2017 08:47:43 GMT
Connection: keep-alive

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Error</title>
</head>
<body>
<pre>Cannot GET /asd</pre>
</body>
```

Pröva nu samma routes via din webbläsare. Du bör få motsvarande svar även i din webbläsare.

Det verkar som allt gick bra och Express är uppe och snurrar och svarar på tilltal.



### Låt npm köra dina skript {#skript}

I filen `package.json` kan du lägga in skript och köra dem via `npm`. Du kan till exempel lägga till skriptet för att starta servern så här.

```json
{
    "scripts": {
        "start": "node app.js"
    }
}
```

Nu kan du starta servern via `npm start`. Det blir ett sätt att samla enklare skript in i din `package.json`.



Läs på om Express {#laspa}
--------------------------------------

Vi vänder oss nu till dokumentationen för Express för att ytterligare se vad man kan göra med Express. Informationen hittar vi på [webbplatsen för Express](http://expressjs.com/).

Låt oss komma igång med grunderna i Express och hur man sätter upp en applikationsserver som även kan fungera som en vanlig webbserver.



Svara med JSON {#json}
--------------------------------------

I de allra flesta fall vill vi att vårt API svarar med ett JSON svar. För det använder vi `response` objektets inbyggda funktion `json` istället för `send` som vi såg ovan.

```javascript
const express = require("express");
const app = express();

const port = 1337;

// Add a route
app.get("/", (req, res) => {
    const data = {
        data: {
            msg: "Hello World"
        }
    };

    res.json(data);
});

// Start up server
app.listen(port, () => console.log(`Example API listening on port ${port}!`));
```

I exemplet ovan skickar vi ett JSON objekt när vi skickar en förfrågan till `/`. Vi startar om servern och vi får följande svar om vi testar med curl i terminalen.

```bash
$ curl localhost:1337
{"data":{"msg":"Hello World"}}
```



Routing mot olika request metoder {#routemet}
--------------------------------------

En route sätts upp för att svara mot en speciell request metod såsom GET, POST, PUT, DELETE. Det är på det sättet man bygger upp en RESTful tjänst.

Här är fyra routes som har samma url, men skiftar i requestens metod.

```javascript
// Testing routes with method
app.get("/user", (req, res) => {
    res.json({
        data: {
            msg: "Got a GET request"
        }
    });
});

app.post("/user", (req, res) => {
    res.json({
        data: {
            msg: "Got a POST request");
        }
    });
});

app.put("/user", (req, res) => {
    res.json({
        data: {
            msg: "Got a PUT request");
        }
    });
});

app.delete("/user", (req, res) => {
    res.json({
        data: {
            msg: "Got a DELETE request");
        }
    });
});
```

Om du testar med din webbläsare så blir det en GET request.

För att testa de andra metoderna så använder jag verktygen Postman eller RESTClient som är ett plugin in till Firefox. Med de verktygen kan jag välja om jag skall skicka en GET, POST, PUT, DELETE eller någon annan av de HTTP-metoder som finns. En sådan REST-klient är ett värdefullt utvecklingsverktyg.

Så här ser det ut när jag skickar en request med en annan metod än GET.

[FIGURE src=image/snapvt17/express-rest-client.png?w=w2 caption="En DELETE request skickas tll servern som svarar från rätt route."]

Det var routes och stöd för olika metoder det. Se till att du installerar en klient motsvarande RESTClient och testa din egen server.

Man vill ofta skicka en annan statuskod än 200 när man gör andra typer av requests än GET. Det kan vi göra med `response` objektets inbyggda funktion `status`.

```javascript
// Testing routes with method
app.get("/user", (req, res) => {
    res.json({
        data: {
            msg: "Got a GET request, sending back default 200"
        }
    });
});

app.post("/user", (req, res) => {
    res.status(201).json({
        data: {
            msg: "Got a POST request, sending back 201 Created");
        }
    });
});

app.put("/user", (req, res) => {
    // PUT requests should return 204 No Content
    res.status(204).send();
});

app.delete("/user", (req, res) => {
    // DELETE requests should return 204 No Content
    res.status(204).send();
});
```

Vi skickar alltså tillbaka statusen 201 när vi skapar objekt med POST anrop och 204 när vi uppdaterar eller tar bort. Det är enkelt gjort med `status` funktion. För se innebörden av alla HTTP status koder finns [följande lista](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes).



Route med dynamiskt innehåll {#dynamiskt}
--------------------------------------

Vi skapar nya routes för att se hur routern hanterar dynamiskt innehåll i form av parametrar.

```javascript
const express = require("express");
const app = express();

const port = 1337;

// Add a route
app.get("/", (req, res) => {
    const data = {
        data: {
            msg: "Hello World"
        }
    };

    res.json(data);
});

app.get("/hello/:msg", (req, res) => {
    const data = {
        data: {
            msg: req.params.msg
        }
    };

    res.json(data);
});

// Start up server
app.listen(port, () => console.log(`Example API listening on port ${port}!`));
```

Vi kan nu använda följande routes och se vad som händer.

```text
/
/hello/Hello-World
/hello/Hello World
/hello/Jag kan svenska ÅÄÖ
```

Vi ser att parametern hanteras och kan nås i routen via `req.params`. Vi ser också att mellanslag och svenska tecken hanteras och översätts med `encodeURIComponent()`.

I webbsidan ser det ut som det ska.

[FIGURE src=image/ramverk2/dynamic-routing.png?w=w3 caption="I webbläsaren ser det bra ut, ungefär som man tänkte."]

I terminalen där servern kör ser det ut så här.

```text
GET
/hello/Jag%20kan%20svenska%20%C3%85%C3%84%C3%96
```

Det vi ser är exempel på hur webbläsaren och servern hanterar encodning av udda tecken.

Webbläsaren konverterar länken, urlencodar, så att mellanslagen byts ut mot `%20`. När länken tas emot som en route och översätts till parametrar, så gör Express en urldecode på innehållet. Detta är sättet som används för att hantera udda tecken i en webblänk och det sker automatiskt av webbläsaren och Express.

Det fungerar så här, om man översätter det till ren JavaScript.

```bash
$ node
> a = encodeURIComponent("Jag kan svenska åäö")
'Jag%20kan%20svenska%20%C3%A5%C3%A4%C3%B6'
> b = decodeURIComponent(a)
'Jag kan svenska åäö'
>
```

Det är bra att veta om att det finns en hantering av udda tecken som sker i bakgrunden.

Om man vill använda sig av parametrar tillsammans med HTTP metoderna POST, PUT och DELETE används `body-parser`. Vi importerar modulen längst upp i `app.js`. Och lägger sen till att vi vill göra en parse på bodyn genom följande rader kod.

```javascript
const bodyParser = require("body-parser");

...

app.use(bodyParser.json()); // for parsing application/json
app.use(bodyParser.urlencoded({ extended: true })); // for parsing application/x-www-form-urlencoded
```



Middleware - CORS och loggning {#middleware}
--------------------------------------

I express finns termen "middleware" som benämning på callbacks som anropas innan själva routens hanterare anropas. En middleware kan också vara en hanterare som alltid anropas för alla routes.

Låt oss skapa en sådan middleware, som alltid anropas, oavsett route. Den skall skriva ut vilken route som accessades och med vilken metod.

Vi lägger till middleware via metoden `app.use()`. Vi kan lägga till dem för en specifik route, eller för alla routes.

```javascript
// This is middleware called for all routes.
// Middleware takes three parameters.
app.use((req, res, next) => {
    console.log(req.method);
    console.log(req.path);
    next();
});
```

Middleware anropas i den ordningen de är definierade, när de matchar en route. Använd ett anrop till `next()` när du är klar och vill skicka vidare kontrollen till nästa middleware och slutligen till routens hanterare.

Om du vill att denna middleware alltid skall anropas så behöver du lägga den högst upp i din kod.

På serversidan ser du nu delar av innehållet i request-objektet som visar metoden och pathen som anropats, samt eventuellt inkommande parametrar.



### Loggning med tredjepartsmodul

Vi väljer i vårt API att använda en tredje parts modul `morgan` för loggning. Vi har redan installerad `morgan` som en del av `node_modules` och vi lägger till modulen i `app.js` enligt nedan och använder den inbyggda middleware för att skriva ut loggen. Vi lägger in anropet till `morgan` innan vi anropar några routes då vi vill att loggningen sker för alla routes.

```javascript
const express = require('express');
const morgan = require('morgan');

const app = express();
const port = 1337;

// don't show the log when it is test
if (process.env.NODE_ENV !== 'test') {
    // use morgan to log at command line
    app.use(morgan('combined')); // 'combined' outputs the Apache style LOGs
}
```



### Cross-Origin Resource Sharing (CORS) {#cors}

Då vi vill att vårt API ska kunna konsumeras av många olika klienter vill vi tillåta att klienter från andra domäner kan hämta information från vårt API. Vi gör även detta med en tredjepartsmodul `cors`, som vi installerade i början av artikeln. På samma sätt som för `morgan` använder vi den inbyggda middleware och använder funktionen `use`.

```javascript
const express = require('express');
const cors = require('cors');
const morgan = require('morgan');

const app = express();
const port = 1337;

app.use(cors());

// don't show the log when it is test
if (process.env.NODE_ENV !== 'test') {
    // use morgan to log at command line
    app.use(morgan('combined')); // 'combined' outputs the Apache style LOGs
}
```



404 med routes {#routefel}
--------------------------------------

När användaren försöker nå en route som inte finns så blir det ett svar med statuskod 404.

[FIGURE src=image/snapvt17/express-default-404.png?w=w2 caption="Ett standard felmeddelande när routen saknas."]

Man kan lägga till en egen route som blir en "catch all" och agerar kontrollerad hantering av 404.

```javascript
// Add routes for 404 and error handling
// Catch 404 and forward to error handler
// Put this last
app.use((req, res, next) => {
    var err = new Error("Not Found");
    err.status = 404;
    next(err);
});
```

Ovan så använder min hanterare för 404 den inbyggda felhanteraren. Det sker via anropet `next(err)` där `err` är ett objekt av typen `Error`. Min variant är alltså att säga att nu är det felkod 404 och jag överlämnar till den inbyggda felhanteraren att skriva ut felmeddelandet.

[FIGURE src=image/snapvt17/express-default-error-handler.png?w=w2 caption="Den inbyggda felhanteraren ger ett fel och en stacktrace."]

Det finns alltså en inbyggd felhanterare som visar upp information om felet, tillsammans med en stacktrace. Det är användbart när man utvecklar.

När node startar upp Express så är det default i utvecklingsläge. Du kan testa att starta upp i produktionsläge, det ger mindre information i felmeddelandena.

```bash
$ NODE_ENV="production" node app.js
```

Nu försvann stacktracen från klienten, men den syns fortfarande i terminalen där servern körs.

[FIGURE src=image/snapvt17/express-error-handling-production.png?w=w2 caption="I produktion så visas inte stacktrace för klienten."]

Vi ser till att även skapa ett npm skript för att köra i produktion som vi sedan kan använda på servern. Vi kan då köra `npm run production` för att starta i i produktion.

```json
{
    "scripts": {
        "start": "node app.js",
        "production": "NODE_ENV='production' node app.js"
    }
}
```

När vi utvecklar så blir det enklast att köra development läge (standard). Men när man sätter en server i produktion så får man se till att det också är produktionsläge för felmeddelandena, vilket innebär att visa så lite information som möjligt.



En egen hanterare för felutskrift {#errorHandler}
--------------------------------------

Vi kan skapa vår egen felhanterare och skicka felmeddelandet som JSON.

En egen felhanterare i Express kan se ut som det `app.use` funktionsanrop längst ner. Vi kombinerar det med vår hanterare för 404 felmeddelande och använder `next(err);` för att skicka vidare felmeddelandet till vår egen hanterare.

```javascript
app.use((req, res, next) => {
    var err = new Error("Not Found");
    err.status = 404;
    next(err);
});

app.use((err, req, res, next) => {
    if (res.headersSent) {
        return next(err);
    }

    res.status(err.status || 500).json({
        "errors": [
            {
                "status": err.status,
                "title":  err.message,
                "detail": err.message
            }
        ]
    });
});
```

Kom ihåg att en sådan här felhanterare är som all annan middleware och det är viktigt i vilken ordning de ligger. De kan anropas i den ordningen som de definieras.



Uppdelning av routes {#splitroutes}
--------------------------------------

Med tanke på de få routes vi kommer ha tillgängliga i våra API:er hade det inte varit helt orimligt att ha al hantering i `app.js`, men vi väljer ändå att dela upp våra routes då vi gillar bra struktur inför framtida uppskalningar.

Vi skapar katalogen `routes` och i den katalogen skapar vi två stycken filer `index.js` och `hello.js`. Här skapar vi och returnerar ett objekt av typen `express.Router()`.

```javascript
var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
    const data = {
        data: {
            msg: "Hello World"
        }
    };

    res.json(data);
});

module.exports = router;
```

Vi importerar sedan dessa filer i `app.js` och använder de som routehanterare med ett funktionsanrop till `use`.

```javascript
...

const index = require('./routes/index');
const hello = require('./routes/hello');

...

app.use('/', index);
app.use('/hello', hello);
```

På det sättet håller vi `app.js` liten i storlek och var sak har sin plats.



Driftsättning {#deployment}
--------------------------------------

Vi börjar med att klona vårt repo till servern. Använd https länken när du klonar för enklast hantering. Jag har skapat en katalog `~/git` där jag klonar mitt repo till. När du har klonat repot kan du göra `npm install` så alla moduler är installerat.

För att våra klienter ska komma åt API:t ser vi till att driftsätta det på vår server. Vi ska använda oss av det som kallas en nginx reverse proxy för att trafiken utifrån på port 80 eller 443 (vanliga portarna för HTTP och HTTPS) ska skickas till vårt API som ligger och lyssnar på en annan port.

När vi installerade nginx fick vi med oss ett antal olika kataloger och konfigurationsfiler. I katalogen `/var/www` kommer vi skapa kataloger för de webbplatser vi vill skapa på vår server. Vi börjar med att logga in på servern som `deploy` och skapar en katalog för vårt API.

Jag kommer i följande exempel utgå ifrån min konfiguration på servern [jsramverk.me](https://jsramverk.me) där mitt API ligger på subdomänen [me-api.jsramverk.me](https://me-api.jsramverk.me).

Jag skapar alltså katalogen `/var/www/me-api.jsramverk.me/html` enklast med kommandot `sudo mkdir -p /var/www/me-api.jsramverk.me/html`. Denna katalog kommer inte användas för filer, men vi kommer använda den i ett senare skede när vi vill spara ett certifikat för HTTPS trafik till vårt API.

Jag har satt i gång API:t med kommandot `npm run production` och API:t ligger och lyssnar på port 8333. Den reverse proxy som vi skapar i följande stycke lyssnar i första skedet på port 80 och skickar vidare förfrågningarna till 8333.

I katalogen `/etc/nginx/sites-available` skapar vi en konfigurationsfil `me-api.jsramverk.me` genom att kopiera standard konfiguration från filen `default` och öppna upp filen i text editorn nano. Vi gör det med följande kommandon.

```bash
cd /etc/nginx/sites-available
sudo cp default me-api.jsramverk.me
sudo nano me-api.jsramverk.me
```

I filen klistrar vi in följande konfiguration. Först skapar vi en server med namnet me-api.jsramverk.me. Vi skapar därefter två stycken `location`. Det är routes där vi vill att nått speciellt ska hända. Den första är för en fil relaterad till det certifikat vi ska installera om ett ögonblick för att fixa HTTPS till vår server. Den andra `location /` är alla andra routes som ska skickas till `http://localhost:8333` där vårt API ligger och lyssnar. Detta kallas en reverse proxy och användas i många sammanhang för att kopplat förfrågningar på port 80 till en annan port. En reverse proxy används då man inte vill öppna portarna utåt, men vill låta nginx ta hand om detta.

```bash
server {
    server_name me-api.jsramverk.me;

    location /.well-known {
        alias /var/www/me-api.jsramverk.me/html/.well-known;
    }

    location / {
        proxy_pass http://localhost:8333;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }

    listen 80;
}
```

Vi sparar filen genom att trycka `Ctrl-X` och skriva in ett y + Enter. Vi skapar sedan en symbolisk länk i katalogen `/etc/nginx/sites-enabled` till vår konfigurations fil för att sidan blir tillgänglig.

```bash
cd /etc/nginx/sites-enabled
sudo ln -s /etc/nginx/sites-available/me-api.jsramverk.me
```

Vi vill sedan testa om konfigurationen är korrekt och sedan starta om nginx och det gör vi med följande kommandon.

```bash
sudo nginx -t
sudo service nginx restart
```

För att internet ska veta att vi har en server som ligger här och vill svara på förfrågningar skapar vi en subdomän i Digital Ocean gränssnittet. Gå till Networking och välj din domän skriv sedan in din subdomän välj din droplet och skapa subdomänen.

[FIGURE src=image/ramverk2/do-subdomain.png?w=w3 caption="Digital Ocean subdomän"]

Det ska nu gå att se ett JSON svar från API:t om vi går till vår subdomän. Ibland kan det ta en liten stund innan subdomäner kommer på plats, så avvakta lite grann om det inte syns direkt.



HTTPS {#https}
--------------------------------------

Då vi är medvetna om våra användares privatliv vill vi att alla anslutningar till våra tjänster och services sker över HTTPS, som krypterar den data som skickas. Vi behöver därför installera ett certifikat. Vi väljer att använda ett certifikat från [Let's Encrypt](https://letsencrypt.org/) och vi installerar det med tjänsten [Certbot](https://certbot.eff.org/) då vi har tillgång till serverns CLI.

Vi behöver först öppna upp så vi kan installera paket från det som heter APT backports. Vi öppnar upp filen `/etc/apt/sources.list` och letar reda på följande två rader som vi avkommenterar. Raderne brukar finnas längst ner i filen.

```bash
deb http://mirrors.digitalocean.com/debian stretch-backports main contrib non-free
deb-src http://mirrors.digitalocean.com/debian stretch-backports main contrib non-free
```

Uppdatera apt-get med `sudo apt-get update`. Vi kan nu installera verktyget certbot med kommandot `sudo apt-get install python-certbot-nginx -t stretch-backports`.

Vi startar verktyget genom att köra kommandot `sudo certbot --nginx`. Vi får då välja för vilka domäner och subdomäner vi vill installera certifikat. Efter att vi har vald domänerna får vi frågan om vi vill omdirigera all trafik till HTTPS istället för HTTP och det svarar vi ja till (i certbot gränssnittet motsvarar det en tvåa).

Vi ska nu se en hänglås i adressfältet om vi uppdaterar i webbläsaren.



Avslutningsvis {#avslutning}
--------------------------------------

Detta var en introduktion i webb- och applikationsservern Express tillsammans med grundläggande begrepp såsom router, request, response och hur vi svarar med ett JSON svar. Du har nu grunderna för att skriva ditt eget API.

Vi har även driftsatt API:t på vår server och skaffat ett certifikat för HTTPS.

För fullständiga kodexempel titta gärna ytterligare i exempelprogrammet [`emilfolino/ramverk2-me`](https://github.com/emilfolino/ramverk2-me) och live på [me-api.jsramverk.me](https://me-api.jsramverk.me).
