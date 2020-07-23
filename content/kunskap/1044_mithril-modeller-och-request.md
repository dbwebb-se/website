---
author: efo
category: javascript
revision:
  "2017-03-07": (A, efo) Första utgåvan inför kursen webapp v2.
...
Modeller och request i mithril
==================================

För att våra webapplikationer ska kunna hantera dynamisk data introducerar vi i denna artikel model och request. I kmom01 tittade vi främst på V och C i MVC och nu är det dags för M. M står för modell och i modeller hanterar vi hämtning och behandling av data. I denna övning går vi igenom hur vi hämtar data med request och hur vi sparar undan datat med hjälp av vår modell.

<!--more-->



Introduktion {#intro}
--------------------------------------

Vi ska i denna övning titta på hur vi hämtar data med hjälp av mithril modulen request och hur vi hanterar denna data i modeller i mithril. I övningen byggar vi en liten namnsdags app med hjälp av api:t [Svenska Dagar](https://api.dryg.net/).

Källkoden för denna övning finns i `example/namnsdag` och på [Github](https://github.com/dbwebb-se/webapp/tree/master/example/namnsdag/www).



Förutsättningar {#forutsattningar}
--------------------------------------
Du har installerat labbmiljön för kursen webapp.

Du har installerat cordova och gjort övningar och uppgifter i kursmoment 1.

Utgå från din app i `me/redovisa`, så har vi en bra grund att stå på.



Skapa en vy för namnsdagar {#skapa}
--------------------------------------
Det första vi gör är att skapa en vy där vi visar upp en lista på de kommande 10 dagarna. Vi lägger till en route i `js/index.js` och en länk i navbaren i `js/views/layout.js` så vi lätt kommer åt vår nya vy.

```javascript
// js/index.js
"use strict";
var m = require("mithril");

...
var Days = require("./views/days");

m.route(document.body, "/", {
    ...
    "/days": {
        render: function() {
            return m(Layout, m(Days));
        }
    }
});
```

```javascript
// js/views/layout.js
m("li", [m("a", { href: "#!/days" }, "Namnsdag")])
```

Vi skapar sedan vyn `js/views/days.js` där vi först initierar en array `days`, som vi fyller med dagens datum och nio dagar fram. Vi skriver ut dessa datum, som en lista av länkar. Som vanligt använder vi en _hashbang_ (#!) när vi skapar länkar för att länkarna använder sig av vår router i `js/index.js`. Datum i JavaScript är inte alltid helt enkla att komma överens med, därför har jag skapat två stycken hjälpfunktioner.


```javascript
// js/views/days.js
"use strict";
var m = require("mithril");

function zero_pad (number) {
    if (number < 10) {
        number = "0" + number;
    }
    return number;
}

function format_date (date) {
    return date.getFullYear() + "-" + zero_pad(parseInt(date.getMonth()) + 1) + "-" + zero_pad(parseInt(date.getDate()));
}

module.exports = {
    view: function() {
        var today = new Date();
        var days = [];
        days.push(today);
        for (var i = 1; i < 10; i++) {
            var temporary_date = new Date();
            temporary_date.setDate(today.getDate() + i);
            days.push(temporary_date);
        }

        return [
            m("h1", "Namnsdagar"),
            m("ul.days", days.map(function (day) {
                return m("li", [m("a", { href: "#!/nameday/" + format_date(day) }, format_date(day))]);
            }))
        ];
    }
};
```

Efter att jag har skapat arrayen med datum skapar och returnerar jag de virtuella noder som bygger upp listan. Jag använder mig av den inbyggda högre ordningens funktion `map` för att iterera över alla dagar. Jag skapar länken för den specifika dagen genom att använda en ny route och skicka med datumet som parameter. Vi skapar nu den routen för att kunna visa upp dagens namn.


[FIGURE src=/image/snapvt17/namnsdag-lista.png caption="Ett exempel på hur listan över dagar kan se ut."]


```javascript
// js/index.js
var m = require("mithril");

...
var Nameday = require("./views/nameday");

m.route(document.body, "/", {
    ...
    "/days": {
        render: function() {
            return m(Layout, m(Days));
        }
    },
    "/nameday/:date" : {
        render: function (vnode) {
            return m(Layout, m(Nameday, vnode.attrs));
        }
    }
});
```

I routen definerar vi `/nameday/:date` där `:date` som andra parameter kommer fungera som ett wildcard och variabel för de datum vi skickar in. Då vi använder oss av parametern `:date` i vår route skickas parameterns värde med till vyn för routen. Parametern skickas med som attribut till vyns virtuella noder och vi kommer åt den i vyn genom att använda `vnode.attrs.date`.

Låt oss skapa vår nya vy `js/views/nameday.js` och lägga in lite kod så vi kan testa routen. Det enda vi ser nu är alltså en rubrik "Dagens namn".

```javascript
"use strict";
var m = require("mithril");

module.exports = {
    view: function() {
        return m("h1", "Dagens namn ");
    }
};
```



Lifecycle methods {#lifecycle}
--------------------------------------
I mithril finns det ett antal [inbyggda livscykel metoder](http://mithril.js.org/lifecycle-methods.html), som anropas vid olika tidpunkter i ett DOM elements livscykel. I denna artikel kommer vi fokusera på `oninit`, men vi har redan sett `oncreate`, som vi använder när vi kopplar ihop länkar med routern. `oninit` anropas innan vyn visas och vi kan använda funktionen för att initiera hämtning av data, sätta variabler osv.

I `js/views/nameday.js` lägger vi till `oninit` metoden och låter den få tillgång till `vnode` parametern vi skickade från routern till vyn. Vi har alltså nu tillgång till `vnode.attrs.date` som är vår route parameter. Med `oninit` metoden ser vårt vy ut på detta sättet där vi skriver ut datumet vi skickar med från listan i föregående vy.

```javascript
"use strict";
var m = require("mithril");

module.exports = {
    oninit: function (vnode) {
        console.log(vnode.attrs.date);
    },
    view: function() {
        return m("h1", "Dagens namn ");
    }
};
```



Vår första mithril model {#forsta}
--------------------------------------
Vi vill nu hämta data från Svenska Dagar api:t och som beskrivit ovan hämtar och behandlar vi data i modeller. Så det första vi gör är att skapa vår första mithril model `js/models/nameday.js`. I modellen skapar vi först två attribut `currentDate` och `currentNames`. Vi fyller de med placeholder data så vi har något att visa innan vi har laddat data via api:t.

Funktionen `load` sätter först `currentDate` attributet till datumet, som vi kommer skicka från vyn till modellen. Efter tilldelningen av datumet anropar vi mithrils inbyggda [request funktion](http://mithril.js.org/request.html). `m.request` returnerar ett promise, där vi kan använda det resulterande datat för att sätta `currentNames` attributet.


```javascript
"use strict";
var m = require("mithril");

var Nameday = {
    currentDate : "1970-01-01",
    currentNames : "",
    load: function (date) {
        Nameday.currentDate = date;

        var dateArray = date.split("-");
        var apiURL = "https://api.dryg.net/dagar/v2.1/" + dateArray[0] + "/" + dateArray[1] + "/" + dateArray[2];

        return m.request({
            method: "GET",
            url: apiURL
        }).then(function (result) {
            Nameday.currentNames = result.dagar[0].namnsdag.join(" - ");
        });
    }
};

module.exports = Nameday;
```

För att vi kan använda namnsdagsmodellen i vår vy `js/views/nameday.js` måste vi importera modellen och sen anropar vi `Nameday.load` i `oninit` livscykel metoden. `view` funktionen anropas i två omgånger, exakt när vyn öppnas och sen igen när `oninit` är klar med att ladda data. Därför kan man ibland se att det blinkar till när gamla datat bytts ut mot de nya namnen när man öppnar upp vyn för namnsdagar. Detta händer helt automatisk när man använder sig av `m.request`, använder man sig däremot av asynkrona funktioner som inte tillhör mithril, måste man anropa `m.redraw` ([Dokumentation](http://mithril.js.org/redraw.html)).

```javascript
"use strict";
var m = require("mithril");

var Nameday = require("../models/nameday");

module.exports = {
    oninit: function (vnode) {
        Nameday.load(vnode.attrs.date);
    },
    view: function() {
        return [
            m("h1", "Dagens namn " + Nameday.currentDate),
            m("p", Nameday.currentNames)
        ];
    }
};

```


Du kommer nu få felet att du inte får hämta data från `api.dryg.net`. Detta åtgärder vi genom att ändra i vår `Content-Security-Policy` (CSP) i `index.html`. På detta sättet tillåter vi appen att hämta data från api't. Vi lägger helt enkelt till `https://api.dryg.net` som tillåten adress i default-src delen av vår CSP meta-tag.

```html
<meta http-equiv="Content-Security-Policy" content="default-src 'self' https://api.dryg.net data: gap: https://ssl.gstatic.com 'unsafe-eval'; style-src 'self' 'unsafe-inline'; media-src *; img-src 'self' data: content:;">
```

Nedan finns ett exempel på hur namnsdagsvyn kan se ut för den 17:e mars.

[FIGURE src="/image/snapvt17/namnsdag-namn.png" caption="Namnsdags vyn för den 17:e mars."]



Avslutningsvis {#avslutning}
--------------------------------------

Det finns många olika varianter på MVC-liknande ramverk för klientbaserad utveckling av JavaScript. På webbplatsen [TodoMVC](http://todomvc.com/) kan du se en översikt av några av dem och jämföra hur deras kod ser ut när man bygger en Todo applikation.

Att använda designmönstret MVC kan ge dig en god uppdelning av din kod i olika delar som har olika syften. Det ger en god grund för en bra arkitektur i din applikation.

I denna övning har vi tittat på M delen av MVC och hur vi hämtar data med hjälp av mithrils `m.requests`. I detta och kommande kursmoment kommer vi titta på ytterligare api:n och både hur vi hämtar och ändrar med hjälp av `m.requests` och api funktioner.
