---
author: efo
category: javascript
revision:
  "2018-01-30": (C, efo) Anpassade artikeln för webapp-v3.
  "2017-03-09": (B, aar) Cordova anpassade artikeln.
  "2017-03-03": (A, efo) Första utgåvan inför kursen webapp v2.
...
Kom igång med ramverket Mithril v2
==================================
[FIGURE src=/image/webapp/mithril-logo.png class="right"]

Vi har tidigare i kursen skrivit våra SPA-applikationer i vanilla JavaScript. Vanilla JavaScript är beteckningen för ren JavaScript där vi inte använder annat än det som är implementerat i webbläsaren. Det finns både fördelar och nackdelar med att använda enbart JavaScript för att skriva applikationer. Vi har i våra SPA-applikationer än så länge inte separerat vyer och hämtning av data, allt har gjorts i samma funktioner och/eller moduler. Vi ska i denna övning titta på hur vi med hjälp av JavaScript ramverket mithril kan skapa bättre struktur i våra SPA-applikationer. Vi ska använda en router, separera vyer och modeller och använda virtuella noder för att skapa en SPA-applikation.

I övningen skapar vi en SPA-applikation inför Nobelfesten där vi hämtar data från det officiella Nobel API:t.



<!--more-->



Introduktion {#intro}
--------------------------------------
Vi kommer installera och använda [Mithril](http://mithril.js.org/) för att bygga en enkel applikation som använder sig av en router och använder virtuella noder för att visa upp våra vyer.

Låter det magiskt? Lika bra vi ser hur det fungerar i kod, så faller saker nog på plats. Följ gärna med i exempelkoden i kursrepots `example/nobel`.

[INFO]
Vi har valt att inte inkludera `node-modules`-mappen i Mithril exemplen. För att testa exempelkoden kör kommandot `npm install`, som installerar node modulerna från `package.json`.
[/INFO]



Förutsättningar {#forutsattningar}
--------------------------------------
Du har installerat labbmiljön för kursen webapp. Du är bekant med SPA-applikationer i vanilla JavaScript och har bekantat dig med webpack.



Installera mithril via npm {#install}
--------------------------------------
I tidigare kursmoment installerade vi webpack med hjälp av npm. Vi ska nu titta på hur vi installerar och konfigurerar ett mithril projekt med hjälp av npm, `package.json` och webpack. Vi börjar med att initiera en grund `package.json` fil som innehåller konfigurationen för vårt projekt.

```bash
# gå till me
$ cd me/kmom03/nobel
$ npm init --yes
```

Vi ska nu installera mithril och webpack via npm och gör det med följande kommandon. Vi installerar den senaste versionen av mithril vilket vill säga `2.0.0-rc.4`.

Vi använder `--save` för att det ska sparas som en modul vi är beroende av i `package.json`. Webpack installerar vi för att som tidigare i kursen kunna skriva vår JavaScript kod i moduler.

```bash
$ npm install --save mithril
$ npm install --save-dev webpack webpack-cli
```

Det kan hända att du får varningar när du kör ovanstående kommandon, men dessa kan du ignorera för nu.

Låt oss nu titta in i `package.json`, för att se vad vi har fått på plats och lägga till så vi kan köra våra mithril applikationer.

```json
{
  "name": "nobel",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC",
  "dependencies": {
    "mithril": "^2.0.4",
    "webpack": "^4.41.5",
    "webpack-cli": "^3.3.10"
  }
}
```

Vi skapar även en webpack konfigurationsfil `webpack.config.js` där vi lägger till att vår ingångspunkt för appen ska vara filen `js/index.js` och den kompilerade filen ska heta `app.js`. `webpack-cli` lägger sina kompilerade filer i en katalog `dist` per automatik, så sökvägen till den kompilerade koden blir `dist/app.js`.

```javascript
module.exports = {
    entry: './js/index.js',
    output: {
        filename: './app.js'
    }
};
```

Vi kan nu använda oss av möjligheten för att skapa skripts i `package.json` och skapar två stycken. Kör vi `npm start` kompileras filerna till `dist/app.js` och kör vi `npm run watch` kompileras filerna automatisk varje gång vi sparar.

```json
"scripts": {
  "test": "echo \"Error: no test specified\" && exit 1",
  "start": "webpack -d",
  "watch": "webpack -d --watch"
},
```



Början till en mithril app {#forsta}
--------------------------------------
Tanken med appen är att vi har en lista med knappar från åren 2010 till 2017. När man klickar på knapparna kommer man till en vy med information om det valda årets Nobelvinnare.

Vi börjar dock med en enkel `index.html`, där vi känner igen det mesta från tidigare. Notera att jag har lagt till den minifierade CSS-filen från tidigare kursmoment, som baseras på `base.scss`. Vi inkluderar även `dist/app.js` längst ner i `index.html`.

```html
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Nobel</title>

    <link rel="stylesheet" href="style.min.css" />
</head>
<body>

    <script type="text/javascript" src="dist/app.js"></script>
</body>
</html>
```

Nu saknas bara `js/index.js` så är vi på bana och redo för att skapa vår första mithril app.

```bash
# stå i me/kmom03/nobel
$ mkdir js
$ touch js/index.js
```

Filen `js/index.js` är vår ingångspunkt för appen och i den kommer vi senare i övningen lägga vår router, som pekar ut rätt vy.



Vår första vy {#vy}
--------------------------------------
En av fördelarna med att använda ett JavaScript ramverk är att vi kan separera vyer från modeller och därmed hämtningen av data. Vi börjar med att skapa katalogen `js/views` och en vy `js/views/list.js`.


```bash
# utgår från www/
$ mkdir js/views
$ touch js/views/list.js
```

I `js/views/list.js` filen vill vi än så länge bara visa upp för användaren att vi har hamnat i en app för Nobelfesten. Vi börjar med att hämta in modulen mithril och spara den i variablen `m`.

Vi exporterar sedan det som inom mithril kallas en komponent, det är ett objekt med en funktion kallat `view`. Det som händer när vi använder komponenten i filen `js/views/list.js` är att funktionen `view` anropas och där returneras den virtuell noden `m("h1", "Nobelfesten")`. Denna virtuella noden kommer sedan i webbläsaren renderas som `<h1>Nobelfesten</h1>`. Det virtuella DOM-trädet som ritas upp av JavaScript genom ramverket mithril består av dessa virtuella noder. För mer information om virtuella noder i kontexten av mithril se denna utmärkta [introduktion](http://mithril.js.org/vnodes.html).

```javascript
"use strict";

import m from 'mithril';

let list = {
    view: function() {
        return m("h1", "Nobelfesten");
    }
};

export { list };
```

För att appen ska veta om att vi vill visa upp list-vyn måste vi in i appens ingångspunkt (`js/index.js`) och peka ut vyn. Vi anger först i vilket html-element vår vy skall renderas och skickar sedan med vår vy till funktionen `m.mount`.

```javascript
"use strict";

import m from 'mithril';
import { list } from './views/list.js';

m.mount(document.body, list);
```

Nu behöver vi bara kompilera vår mithril app med hjälp av webpack för att se Nobelfest-appen för första gången. Detta gör vi i terminalen med `npm start`, som vi definierade tidigare som ett npm script i `package.json`. Öppna upp filen `index.html` i din webbläsare och skåda mästerverket eller iallafall Nobelfesten som en fin rubrik. Vi kan nu köra kommandot `npm run watch` i terminalen för att löpande under utveckling kompilera om filerna när de sparas.

Låt oss använda lite av stylingen från tidigare kursmoment och samtidigt titta på hur vi lägger till flera virtuella noder i samma vy/komponent.

```javascript
"use strict";
import m from 'mithril';

let list = {
    view: function() {
        return m("main.container", [
            m("h1", "Nobelfesten"),
            m("p", "Välj ett årtal i listan:")
        ]);
    }
};

export { list };
```

I ovanstående kod skapar vi först en virtuell nod `m("main.container")`, som renderat blir till `<main class="container"></main>`. Vi tilldelar barn till denna virtuella nod genom att tilldela en array som värde. Arrayen innehåller två stycken virtuella noder `<h1>Nobelfesten</h1>` och `<p>Välj ett årtal i listan:</p>`.

Nästa del är att skapa listan med årtal, vi använder en `while`-loop för att iterera från 2010 till och med 2017. För varje år lägger vi till en virtuell nod i arrayen `years`. Vi lägger till den virtuella noden `<a class="button blue-button"></a>`, som har värdet för ett av åren mellan 2010 och 2017.

Vi vill även att knappen ska kunna ta oss till en annan sida så vi skickar även med ett objekt med konfiguration: `{ href: "/year/" + startYear, oncreate: m.route.link }`. Objektet består av två attribut: `href` och `oncreate`. `href` känner vi igen från HTML som hyperlink reference dvs länkadressen vi vill gå till. I detta fallet blir det '/year' följd av årtalen 2010 till 2017. Vi ska senare i guiden titta på hur vi kan fånga upp specifika årtalet i vår router.

Det andra attributet i objektet är `oncreate` och är en av [mithrils inbyggda livscykel metoder](https://mithril.js.org/lifecycle-methods.html). Livscykel metoder är funktioner som anropas när en händelse inträffar. Livscykel metoder kan liknas med EventListeners, som vi känner igen från JavaScript. I detta fallet använder vi livscykel metoden `oncreate` som anropas när ett element har skapats. Vi skickar med den inbyggda funktionen `m.route.link` ([Dokumentation](https://mithril.js.org/api.html#mroutelink---)) som kopplar länken till routern vi kommer skapa i `js/index.js`.

```javascript
"use strict";
import m from 'mithril';

let list = {
    view: function() {
        var startYear = 2010;
        var endYear = 2017;
        var years = [];

        while (startYear <= endYear) {
            years.push(
                m("a.button.blue-button",
                { href: "#!/year/" + startYear, oncreate: m.route.link },
                startYear)
            );
            startYear++;
        }

        return m("main.container", [
            m("h1", "Nobelfesten"),
            m("p", "Välj ett årtal i listan:"),
            m("div.year-container", years)
        ]);
    }
};

export { list };
```

Kolla igenom koden ovan så att du förstår alla delar innan vi går vidare.



En router för flera vyer {#router}
--------------------------------------
Med bara en vy har vi inte kommit långt. Så låt oss titta på hur vi lägger till ytterligare en vy och en router så vi kommer åt vyn. Först skapar vi filen `js/views/year.js` och precis som `list.js` definierar våra nya `year.js` en vy. Än så länge visar vi bara rubriken Year i vyn, vi vill se så att routern fungerar och kommer sedan bygga ut funktionaliteten.

```javascript
"use strict";

import m from 'mithril';

let year = {
    view: function() {
        return m("main.container", [
            m("h1", "Year")
        ]);
    }
};

export { year };
```

I vår `index.js` ändrar vi så vi använder funktionen `m.route()` istället för `m.mount()`. `m.route()` tar tre argument:

1. Vilket element som skall fyllas med virtuella noder.

1. Vår ursprungsroute som är den vy där appen börjar.

1. Ett objekt som definierar alla routes i appen.

Och vår `js/index.js` fil ser nu ut så här:

```javascript
"use strict";

import m from 'mithril';

import { list } from "./views/list";
import { year } from "./views/year";

m.route(document.body, "/", {
    "/": list,
    "/year/:year" : year
});
```

Vi kan nu klicka på våra knappar och kommer till year-vyn. I routern har vi lagt till `:year` i year-routen. `:year` är en placeholder för året vi skickar med till vyn och vi kommer åt värdet genom att använda `vnode.attrs.year`. För att kunna använda `vnode` måste vi dock definiera `vnode` som parameter till vår `view` funktion. Så låt oss istället för `<h1>Year</h1>` skriva ut året.

```javascript
"use strict";

import m from 'mithril';

let year = {
    view: function(vnode) {
        return m("main.container", [
            m("h1", vnode.attrs.year)
        ]);
    }
};

export { year };
```

Mithrils route funktion är användbar för mer än bara vår huvudrouter. Vi kan till exempel göra omdirigeringar, hämta nuvarande route och mycket annat. [Dokumentationen för `m.route()`](http://mithril.js.org/route.html).



En modell i mithril {#modell}
--------------------------------------
Tanken med appen var att visa upp information om Nobelvinnare för ett givet år så låt oss titta på hur vi hämtar JSON-data från Nobel-API:t med hjälp av en modell i mithril.

**Varje gång du ska hämta data från ett API gör du det i en modell. Hämta aldrig data direkt i en vy.**

Vi börjar med att skapa katalogen `js/models` och filen `js/models/nobel.js`.

```bash
# stå i nobel katalogen

$ mkdir js/models
$ touch js/models/nobel.js
```

Som alltid när vi hämtar data från ett API är [dokumentationen](https://nobelprize.readme.io) viktig, så vi tar en titt i den. Vi hittar den endpoint vi vill använda och urlen som hör till `http://api.nobelprize.org/v1/prize.json?year=[YEAR]`.

Vi har tidigare i kursen använd `XMLHttpRequest` och `fetch` för att hämta data. När vi hämtar data i mithril gör vi det med funktionen [m.request](https://mithril.js.org/request.html). `m.request` använder sig precis som `fetch` av promises, men vi får direkt tillbaka JSON-data om vi inte angett nått annat.

Vi börjar med att bara hämta data och skriva ut det med `console.log` så vi ser att det fungerar. Vår model består förutom funktionen `load`, även av attributet `current`. Vi kommer använda objektet `current` för att spara den senaste data vi har hämtat från API:t.

```javascript
// js/models/nobel.js
"use strict";

import m from 'mithril';

let nobel = {
    current: {},
    load: function(year) {
        return m.request({
            method: "GET",
            url: "http://api.nobelprize.org/v1/prize.json?year=" + year
        })
        .then(function(result) {
            console.log(result);
        });
    }
};

export { nobel };
```

Vi måste anropa funktionen för att den kan köras och detta gör vi från vyn. Vi använder oss av livscykel metoden `oninit`, funktionen anropas 1 gång när vyn initieras och innan nått ritas upp. I de flesta fall när vi hämtar data som ska visas upp i vyn använder vi `oninit`, då denna bara anropas en gång. Vi använder oss utav `vnode.attrs.year` på samma sätt som när vi skrev ut årtalet och skickar med årtalet till modellen.

```javascript
// js/views/year.js
"use strict";

import m from 'mithril';

import { nobel } from "../models/nobel.js";

let year = {
    oninit: function(vnode) {
        nobel.load(vnode.attrs.year);
    },
    view: function(vnode) {
        return m("main.container", [
            m("h1", vnode.attrs.year)
        ]);
    }
};

export { year };
```

Vi laddar om sidan och öppnar upp konsolen i webbläsaren och ser att vi har skrivit ut ett JSON-objekt. Det vi vill åt för varje objekt i `prizes` arrayen är `category` och både förnamn och efternamn inne i `laureates` arrayen. Först tilldelar vi resultat från API:t till `current` och sedan kan vi använda detta i vyn.

```javascript
// js/models/nobel.js
"use strict";

import m from 'mithril';

let nobel = {
    current: {},
    load: function(year) {
        return m.request({
            method: "GET",
            url: "http://api.nobelprize.org/v1/prize.json?year=" + year
        })
        .then(function(result) {
            nobel.current = result;
        });
    }
};

export { nobel };
```

Då vi har importerat `nobel` modellen i vår vy kan vi komma åt `current` genom att använda `nobel.current`. Vi använder oss av funktionen [Array.prototype.map](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map), för att iterera oss igenom JSON arrayen.

```javascript
"use strict";

import m from 'mithril';
import { nobel } from "../models/nobel.js";

let year = {
    oninit: function(vnode) {
        nobel.load(vnode.attrs.year);
    },
    view: function(vnode) {
        return m("main.container", [
            m("h1", vnode.attrs.year),
            m("div.year-container", nobel.current.prizes.map(function(prize) {
                return [
                    m("h2", prize.category),
                    prize.laureates.map(function(laureate) {
                        return m("p", laureate.firstname + " " + laureate.surname);
                    })
                ];
            }))
        ]);
    }
};

export { year };
```

Om vi laddar om sidan i webbläsaren får vi ett JavaScript fel `Uncaught TypeError: Cannot read property 'map' of undefined`. Detta beror på mithrils sätt att rendera på och det asynkrona `m.request` anrop till API:t. Ordningen för rendering i mithril är följande:

1. `oninit` anropas

1. `view` anropas och ritar upp vyn

1. `m.request` är klar med att hämta data

1. `view` anropas en gång till och ritar upp vyn data från `m.request`

Detta är även anledningen till att vi **ALDRIG** hämtar data direkt från en vy, då detta skulle resultera i en oändlig loop. För dokumentation av livscykel metoder och renderingsordning se [Lifecycle methods](https://mithril.js.org/lifecycle-methods.html#lifecycle-methods).

För att kunna använda oss av koden i vyn `year` definierar vi `nobel.current` enligt nedan, med ett `prizes` attribut med en tom array.

```javascript
// js/models/nobel.js
"use strict";

import m from 'mithril';

let nobel = {
    current: { prizes: [] },
    load: function(year) {
        return m.request({
            method: "GET",
            url: "http://api.nobelprize.org/v1/prize.json?year=" + year
        })
        .then(function(result) {
            nobel.current = result;
        });
    }
};

export { nobel };
```

När vi sedan öppnar applikationen i webbläsaren skrivs namnen på Nobelpristagarna ut som väntat. Kolla gärna igenom koden ovan så du förstår alla delar. Ta även en titt på renderingsordningen för att förstå hur de virtuella noderna ritas upp av mithril.



Layout {#layout}
--------------------------------------
En del av den koden vi skriver är samma för våra två vyer. Vi vill kunna återanvända koden och även lägga till navigation längst upp för att ta oss från årsvyn tillbaka till listningen, precis som vi har gjort i tidigare kursmoment.

I mithril kan vi använda oss av layouts för att återanvända kod i flera vyer. Vi skapar först en ny vy `js/views/layout.js`, som blir vår mall för andra vyer.

```javascript
"use strict";

import m from 'mithril';

let layout = {
    view: function(vnode) {
        return [
            m("nav.top-nav", "Nobel"),
            m("main.container", vnode.children)
        ];
    }
};

export { layout };
```

I ovanstående kodexempel skapar vi `.top-nav` som vi känner igen från tidigare kursmoment. Vi skapar även en `main.container` där vi skickar med de virtuella noderna (`vnode.children`) som vi vill ska renderas i den. I detta fallet är det list-vyn och års-vyn vi skickar med. För att använda oss av layouten gör vi som nedan. För varje route visar vi layouten och skickar med vyn vi vill visa i layouten.

```javascript
"use strict";

import m from "mithril";
import { layout } from "./views/layout";
import { list } from "./views/list";
import { year } from "./views/year";

m.route(document.body, "/", {
    "/": {
        render: function() {
            return m(layout, m(list));
        }
    },
    "/year/:year": {
        render: function(vnode) {
            return m(layout, m(year, vnode.attrs));
        }
    }
});
```

Vi använder oss av en [RouteResolver](http://mithril.js.org/route.html#routeresolver) för att rendera layout och skickar med de virtuella noder, i detta fallet vår två vyer, som ska renderas inuti layouten.

För att vyerna inte ska renderas inne i två stycken `main.container` tar vi bort dessa från vyerna. Just nu tillför layouten inte mer än att vi har gjort koden lite mera DRY. Vi vill ge användaren en möjlighet för att ta sig tillbaka till listan med år när vi är inne på ett specifikt år. Vi gör detta i `layout` och använder oss av en 'ternary operator' och `m.route.get()`. Vi jämför om första delen av routen är 'year' och är den det skriver vi ut en länk tillbaka till listan annars skriver vi ut ingenting.

```javascript
"use strict";

import m from 'mithril';

let layout = {
    view: function(vnode) {
        return [
            m("nav.top-nav",
                { textContent: "Nobel"},
                [
                    m.route.get().split("/")[1] == "year" ?
                        m("span", [
                            m("a", { href: "/", oncreate: m.route.link }, "Alla år")
                        ]) : null
                ]),
            m("main.container", vnode.children)
        ];
    }
};

export { layout };
```

Här under kan ni se ett exempel på Nobel applikationen med navigation.

[FIGURE src="/image/webapp/nobel-app-final-year.png?w=c7" class="right" caption="Screenshot Nobel app år vy"]
[FIGURE src="/image/webapp/nobel-app-final-list.png?w=c7" caption="Screenshot Nobel app list-vy"]



Exempelkod {#example}
--------------------------------------
Exempelprogrammet från denna övning finns i kursrepot [example/nobel](https://github.com/dbwebb-se/webapp/tree/master/example/nobel) och i `example/nobel`.

I kursrepot finns några mithril exempel program. Följande exempelprogram är relevanta för att lära sig mithril från början.

* `example/meapp-mithril` visar hur man skapar en meapp med mithril.

* `example/namnsdag` visar hur man kan hämta data från ett API med namnsdagar.

* `example/calendar` använder komponenter för att skapa en kalender med namnsdagar.



Avslutningsvis {#avslutning}
--------------------------------------
Vi har i denna övning skapat en app inför Nobelfesten, som hämtar information från det officiella Nobel-api. Vi har bekantat oss med virtuella noder och hur vi skapar dessa med `m`. Vi har tittat på en router i mithril och hur vi kan använda den för att koppla vyer till specifika router och skicka med parametrar till dessa. Vi har skapat modeller i mithril där vi hämtar data och skickar tillbaka till vyerna.

Om du har frågor eller tips så finns det en särskild [tråd i forumet](t/7316) om denna artikeln.
