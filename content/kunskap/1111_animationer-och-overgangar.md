---
author: efo
category: javascript
revision:
  "2018-03-02": (A, efo) Första utgåvan inför kursen webapp v3.
...
Animationer och övergångar
==================================

[FIGURE src=/image/webapp/moving.jpg?w=c5 class="right"]

Vi har i tidigare kursmoment tittat på hur vi kan designa webbapplikationer så de ser ut som native appar. Vi ska i denna övning titta på hur vi med hjälp av animationer och övergångar även får känslan av att det är en native app.



<!--more-->



Vi ska i följande övning få till samma känsla som nedan när vi går från en list-vy till en detalj-vy.

[FIGURE src=/img/webapp/animation-ios.gif class="right"]

Vi ser att detalj-vyn kommer in från höger och försvinner ut till höger. Vi använder CSS3 för animationer och tittar på hur vi löser det i en mithril app.



Grunden i mithril-appen {#mithril}
--------------------------------------
Jag har gjort en app med två stycken vyer `js/views/list.js` och `js/views/detail.js`. List-vyn visar två stycken länkar till detalj-vyn som visar upp en siffra. Oerhört enkelt men räcker för det vi vill åstadkomma i övningen och låter oss fokusera på animationer. Nedan syns list-vyn och under det kodexemplet finns detalj-vyn.

```javascript
// js/views/list.js
"use strict";

var m = require("mithril");

var list = {
    view: function() {
        return m("div.list", [
            m(
                "a.list-item",
                { href: "#!/detail/1" },
                "Siffran 1"
            ),
            m(
                "a.list-item",
                { href: "#!/detail/2" },
                "Siffran 2"
            )
        ]);
    }
};

module.exports = list;
```

```javascript
"use strict";

var m = require("mithril");

module.exports = {
    view: function(vnode) {
        return m("div.slide-in.detail-" + vnode.attrs.id, [
            m("a", { href: "#!/list" }, "Tillbaka"),
            m("h1", "Detaljer om " + vnode.attrs.id)
        ]);
    }
};
```

I `js/index.js` skapar vi de två routes som behövs.



CSS {#css}
--------------------------------------
Vi använder `@keyframes` för att göra animation av de olika vyerna. Vi använder `transform: translateX()` för att flytta vy och definierar två stycken `@keyframes`: `moveFromRight` och `moveToRight`.

```css
@keyframes moveFromRight {
    from { transform: translateX(100%); }
}

@keyframes moveToRight {
    to { transform: translateX(100%); }
}
```

I `moveFromRight` flyttar vi den från 100% dvs. från höger om skärmen och i `moveToRight` flyttar vi den till precis höger om skärmen.

Vi definierar först klassen `.slide-in` som använder sig av `moveFromRight` på nedanstående sätt. Detalj-vyerna har alltid klassen `.slide-in`, vilket skarpsynta såg ovan.

```css
.slide-in {
    animation: moveFromRight 0.4s ease both;
}
```

Nu glider detalj-vyn in från höger när vi går från listan till detalj-vyn. För att få detalj-vyn att glida ut till höger när vi klickar på Tillbaka länken använder vi oss av livscykel-metoden `onbeforeremove`, som anropas när vi går till en annan route från detalj-vyn. I livscykel-metoden lägger vi till klassen `.slide-out`, men vi vill att klassen tas bort när vi har flyttat ut vyn till höger. Vi använder en timeout tid som är kortare än animeringstiden då vi vill visa upp listan innan vi har flyttat ut vyn hela vägen. Vi returnerar ett `promise` från `onbeforeremove` då mithril automatisk ritar upp andra vyn när vårt `promise` anropar `resolve`.

```javascript
// js/views/detail.js
var m = require("mithril");

module.exports = {
    onbeforeremove: function(vnode) {
        vnode.dom.classList.add("slide-out");
        return new Promise(function(resolve) {
            setTimeout(function() {
                vnode.dom.classList.remove("slide-out");
                resolve();
            }, 250);
        });
    },
    view: function(vnode) {
        return m("div.slide-in.detail-" + vnode.attrs.id, [
            m("a", { href: "#!/list" }, "Tillbaka"),
            m("h1", "Detaljer om " + vnode.attrs.id)
        ]);
    }
};
```

Klassen `.slide-out` som använder sig av `moveToRight` keyframen.

```css
.slide-out {
    animation: moveToRight 0.4s ease both;
}
```

Vår animerade övergångar ser nu ut på följande sätt.

<img src="/img/webapp/animation-css.gif" class="right" width="300px" />



Avslutningsvis {#avslutning}
--------------------------------------
Vi har i denna övning tittat på hur man med hjälp av animationer får känslan av att använda en mobil enhet och att det inte bara ser ut som en mobil enhet.

Om du har frågor eller tips så finns det en särskild [tråd i forumet](t/7319) om denna artikeln.
