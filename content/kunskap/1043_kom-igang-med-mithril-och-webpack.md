---
author: efo
category: javascript
revision:
  "2017-03-09": (B, aar) Cordova anpassade artikeln.
  "2017-03-03": (A, efo) Första utgåvan inför kursen webapp v2.
...
Kom igång med ramverket Mithril
==================================

[FIGURE src=/image/snapht15/mithril-logo.png class="right"]

En SPA är en *single page application* som är skriven i HTML, CSS och JavaScript och laddas som en sida. Det är ett sätt att skriva webbapplikationer som är fokuserade i webbläsaren. För att skriva den typen av applikationer så är det inte ovanligt att använda ett MVC-liknande ramverk som ger tillgång till ett visst grundstöd till hur man skriver sin kod.

Mithril är ett sådant ramverk och vi skall nu bekanta oss med hur Mithril kan användas för att skapa SPA-applikationer.

<!--more-->



Introduktion {#intro}
--------------------------------------

Du kan läsa mer om [begreppet SPA på Wikipedia](https://en.wikipedia.org/wiki/Single-page_application).

Vi kommer installera och använda [Mithril](http://mithril.js.org/) för att bygga en enkel applikation som använder sig av en router och använder virtuella noder för att visa upp våra vyer.

Låter det magiskt? Lika bra vi ser hur det fungerar i kod, så faller saker nog på plats.

Det är bra om du är bekant med [MVC-liknande tekniker](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller). Men det är inte nödvändigt, det här kommer att gå bra ändå. Det handlar bara om att strukturera sin kod.

Du kan testa samtliga exemplel i artikeln via  i kursrepot som ligger på dbwebb i katalogen [`example/meapp-mithril`](webapp/repo/example/meapp-mithril/). Källkoden för exemplet hittar i i ditt kursrepo eller på [GitHub](https://github.com/mosbth/webapp/tree/master/example/meapp-mithril/www).

[INFO]
Vi har valt att inte inkludera `node-modules`-mappen i Mithril exemplen. För att testa dem behöver du ett Cordova projekt du kan kopiera in www-mappen i och sen köra kommandot `npm install`, som installerar node modulerna via `package.json`.
[/INFO]



Förutsättningar {#forutsattningar}
--------------------------------------
Du har installerat labbmiljön för kursen webapp.

Du har installerat cordova och skapat Hello World cordova appen enligt [Kom igång med cordova](kunskap/kom-igang-med-cordova).



Installera mithril via npm {#install}
--------------------------------------
Vi har i tidigare kurser använd pakethanteraren npm för att installera javascript och nodejs moduler. Vi kommer i denna kurs använda npm för att installera och administrera vår mithril installation och beroende kod. Detta görs med hjälp av en `package.json` fil, som vi initiellt skapar genom att skriva följande i terminalen:

```bash
# gå till me
$ cd me/redovisa
$ cordova create . se.dbwebb.meapp MeApp
$ cordova platform add android --save
$ cordova platform add browser --save
$ cd www/
$ npm init --yes
```

Vi har nu skapat vår egna paket fil för just detta projektet som än så länge inte innehåller mycket, men som vi i denna övning kommer bygga på. Vi ska nu installera mithril och webpack via npm och gör det med följande kommandon. Vi använder `--save` för att det ska sparas som en modul vi är beroende av i `package.json`. Webpack installerar vi för att kunna importera och exportera kod i mithril.

```bash
$ npm install mithril --save
$ npm install webpack --save
```

Det kan hända att du får varningar när du kör ovanstående kommandon, men dessa kan du ignorera för nu.

Låt oss nu titta in i `package.json`, för att se vad vi har fått på plats och lägga till så vi kan köra våra mithril applikationer.

```json
{
  "name": "meapp",
  "version": "1.0.0",
  "description": "A me-app in mithril",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "dependencies": {
    "mithril": "^1.0.1",
    "webpack": "^2.2.1"
  }
}
```

I scripts attributet ändrar vi så det blir följande för att löpande under utveckling packa ihop koden till en fil `bin/app.js` med hjälp av webpack. Vi använder här möjligheten för att skapa scripts via npm CLI-verktyget. Vi har nedan skapat två scripts `start` för att packa ihop mithril appen till ett script och `test` för att kontinuerligt göra detta under utveckling. Våra två npm scripts anropas på följande sätt `npm start` eller `npm test`.

```json
"scripts": {
  "start": "webpack js/index.js bin/app.js -d",
  "test": "webpack js/index.js bin/app.js -d --watch"
},
```



Vår första mithril app {#forsta}
--------------------------------------
Vi börjar med att rensa i `index.html`.

```html
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Security-Policy" content="default-src 'self' data: gap: https://ssl.gstatic.com 'unsafe-eval'; style-src 'self' 'unsafe-inline'; media-src *; img-src 'self' data: content:;">
        <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width">
        <link rel="stylesheet" type="text/css" href="css/index.css">
        <title>Mithril me-app</title>
    </head>
    <body>
        <script type="text/javascript" src="cordova.js"></script>
        <script type="text/javascript" src="bin/app.js"></script>
    </body>
</html>
```

Vi behåller `Content-Security-Policy` taggen för att skydda oss mot XSS attacker, vi kommer dock i senare kursmoment lägga till så vi kan hämta data från api'er. `viewport` meta-taggen talar om att vi vill visa upp våra appar på enheter i olika storlekar. Längst ner i `index.html` ändrar vi från att inkludera `index.js` till att istället inkludera vår mithril app som finns i `bin/app.js`.



Vår första vy {#vy}
--------------------------------------

Skapa mappen `js/views` och vår första mithril vy `js/views/me.js`.

```bash
# utgår från www/
$ mkdir js/views
$ touch js/views/me.js
```

Den befintliga filen `js/index.js` är vår utgångspunkt för appen och den pekar ut vad som ska visas när en användare kommer till vår app. Vi skapar desutom en katalog för våra vyer, med vårt första mithril vy `me.js`.

I `js/views/me.js` filen vill vi än så länge bara visa upp vårt egna namn. Vi importerar först mithril och lägger till vårt vy som en modul. Alla vy-moduler har en funktion `view`, som returnerar de element som ska visas upp i vyen. Här vill vi bara visa vårt egna namn i en `<h1>` tag, så bytt gärna ut mitt namn mot ditt.

```javascript
"use strict";
var m = require("mithril");

module.exports = {
    view: function() {
        return m("h1", "Emil Folino");
    }
};
```
Kodsnutten `m("h1", "Emil Folino")` skapar en "[virtual DOM node](http://mithril.js.org/hyperscript.html)" en så kallad [vnode](http://mithril.js.org/vnodes.html). En `vnode` är ett JavaScript objekt som representerar ett DOM element. Det blir först ett DOM element när vi använder den i en `render` eller `mount` funktion.

För att appen ska veta om att vi vill visa upp vårt me-vy måste vi in i appens utgångspunkt (`js/index.js`) och peka ut vyn. Vi anger först i vilket html-element vår vy skall renderas och skickar sedan med vår vy till funktionen `m.mount`:

```javascript
"use strict";
var m = require("mithril");
var Me = require("./views/me");

var app = {
    initialize: function() {
        document.addEventListener('deviceready', this.onDeviceReady.bind(this), false);
    },
    onDeviceReady: function() {
        m.mount(document.body, Me);
    },
};
app.initialize();
```

Nu behöver vi bara packa ihop vår mithril app med hjälp av webpack för att se me-appen för första gången. Detta gör vi i terminalen med följande kommando, som vi definerade tidigare som ett npm script i `package.json`.

```bash
$ npm start
$ cordova emulate android
```
Du kan även testa appen i webbläsaren med `cordova emulate browser`.

Nu borde du se din me-sida med ditt namn.



En router för flera sidor {#router}
--------------------------------------
Med bara en sida har vi inte kommit långt. Så låt oss titta på hur vi lägger till ytterligare en vy och en router så vi kommer åt vyn. Först skapar vi filen `js/views/hobby.js` och precis som `me.js` definerar våra nya `hobby.js` en vy. I den här vyn ser du att vi returnerar en array av virtuella noder, som placeras i ordning efter varann i vyn.

```javascript
"use strict";
var m = require("mithril");

module.exports = {
    view: function() {
        return [
            m("h1", "My hobby"),
            m("p", "I run orienteering most of the time. And was pretty good at it before I blew my knee.")
        ];
    }
};
```

I vår `index.js` ändrar vi så vi använder funktionen `m.route()` istället för `m.mount()`. `m.route()` tar tre argument:

1. Vilket element som skall fyllas med de virtuella noder.

1. Vår ursprungsroute som är det vy där appen börjar.

1. Ett objekt som definerar alla routes i appen.

Och vår index.js fil ser nu ut så här:

```javascript
"use strict";
var m = require("mithril");
var Me = require("./views/me");
var Hobby = require("./views/hobby");
var app = {
    initialize: function() {
        document.addEventListener('deviceready', this.onDeviceReady.bind(this), false);
    },
    onDeviceReady: function() {
        m.route(document.body, "/", {
            "/": Me,
            "/hobby" : Hobby
        });
    },

};
app.initialize();
```

Om du manuellt skriver in `/hobby` efter `index.html#!` i din webbläsares adressfält, ser du innehållet från din hobby-vy. `#!` är en _hashbang_, det används vanligen till routing på klient sidan. Det går att ändra vad som ska vara hashbang med [m.route.prefix](http://mithril.js.org/route.html#mrouteprefix).

Vi vill inte skriva in adresser manuellt, så vi ska nu titta på hur vi kan skapa navigering för vår app. Vi kan skapa länkar precis som vi har skapat andra virtuella noder tidigare, så vi lägger till en länk längst upp i vårt me-vy med följande kod. Vi kan nu gå från vårt Me-vy till hobby-vyn.

```javascript
m("a", { href: "#!/hobby" }, "Hobby")
```

Mithrils route funktion är användbar för mer än bara vår huvudrouter. Vi kan till exempel göra omdirigeringar, hämta nuvarande route och mycket annat. [Dokumentationen för `m.route()`](http://mithril.js.org/route.html).



Styling {#styling}
--------------------------------------
Vi vill ju alltid att våra hemsidor, applikationer och program är snygga och användarvänliga, så därför vill vi kunna styla våra sidor. Öppna `css/index.css` och fixa en egen snygg design.

Jag valde att lägga till några extra element i min `me-vy` enligt nedan och en enkel responsiv styling, för ett resultat enligt det som syns nedan. Som du ser nedan har jag lagt in html-element i en array efter det andra elementet `div`. Elementen blir barn-element till det yttre och man kan ha så många nivåer man vill i det virtuella dom'et.

```javascript
"use strict";
var m = require("mithril");

module.exports = {
    view: function() {
        return [
            m("a", { href: "#!/hobby" }, "Hobby"),
            m("div", [
                m("h1", "Emil Folino"),
                m("p", "My name is Emil, I'm originally from Denmark, but now I live in Sweden."),
                m("p", "I run orienteering and drive an old Skoda.")
            ])
        ];
    }
};
```

[FIGURE src="/image/snapvt17/mithril-me-screen.png" caption="Screenshot enkel me-sida i mithril"]



Layout {#layout}
--------------------------------------
Om vi vill ha navigering i alla vyer kan vi lägga till länkar längst upp, men som vanligt vill vi hålla vår kod DRY. I mithril kan vi använda oss av layouts för att återanvända kod i flera vyer. Vi skapar först ett nytt vy `js/views/layout.js`, som blir vår mall för andra vyer.

```javascript
"use strict";
var m = require("mithril");

module.exports = {
    view: function(vnode) {
        return m("main", [
            m("navbar", [
                m("div.container", [
                    m("h2.brand", "Emil Folino"),
                    m("ul.nav", [
                        m("li", [m("a", { href: "#!/" }, "Me")]),
                        m("li", [m("a", { href: "#!/hobby" }, "Hobby")])
                    ])
                ])
            ]),
            m("section.container", vnode.children)
        ]);
    }
};
```

I ovanstående kodexempel skapar vi vår navigation som en navbar med en "logga" och två stycken länkar. Efter navbar skapas ett section-element (`m("section.container", vnode.children)`), som innehåller de virtuella noder från vyn som använder sig av layout. Så lått oss titta på hur vi använder oss av layout från `index.js`.

```javascript
"use strict";
var m = require("mithril");
var Layout = require("./views/layout");
var Me = require("./views/me");
var Hobby = require("./views/hobby");
var app = {
    initialize: function() {
        document.addEventListener('deviceready', this.onDeviceReady.bind(this), false);
    },
    onDeviceReady: function() {
        m.route(document.body, "/", {
            "/": {
                render: function() {
                    return m(Layout, m(Me));
                }
            },
            "/hobby": {
                render: function() {
                    return m(Layout, m(Hobby));
                }
            }
        });
    }
};

app.initialize();
```

Vi använder oss utav en [RouteResolver](http://mithril.js.org/route.html#routeresolver) för att rendera layout och skickar med de virtuella noder, i detta fallet vår två vyer, som ska renderas inuti layouten.

Här under kan ni se ett exempel på en mithril me-app med navigation.

[FIGURE src="/image/snapvt17/mithril-me-screen-final.png" caption="Screenshot enkel me-sida i mithril med navigation"]



Avslutningsvis {#avslutning}
--------------------------------------

Det finns många olika varianter på MVC-liknande ramverk för klientbaserad utveckling av JavaScript. På webbplatsen [TodoMVC](http://todomvc.com/) kan du se en översikt av några av dem och jämföra hur deras kod ser ut när man bygger en Todo applikation.

Att använda designmönstret MVC kan ge dig en god uppdelning av din kod i olika delar som har olika syften. Det ger en god grund för en bra arkitektur i din applikation.

Mithril är en spännande lösning på klientbaserad programmering med JavaScript. Det är inte helt enkelt att komma in i det, men koden är liten och överskådlig.

Har du [tips, förslag eller frågor om artikeln](t/6313) så finns det en specifik forumtråd för det.
