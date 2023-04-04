---
author: efo
category: javascript
revision:
  "2023-04-03": (B, efo) Uppdaterad inför webapp-v5.
  "2018-03-02": (A, efo) Första utgåvan inför kursen webapp v3.
...
Animationer och övergångar
==================================

[FIGURE src=/image/webapp/moving.jpg?w=c5 class="right"]

Vi har i tidigare kursmoment tittat på hur vi kan designa webbapplikationer så de ser ut som native appar. Vi ska i denna övning titta på hur vi med hjälp av animationer och övergångar även får känslan av att det är en native app.



<!--more-->



Vi ska i följande övning få till samma känsla som nedan när vi går från en list-vy till en detalj-vy.

[FIGURE src=/img/webapp/animation-ios.gif class="right"]

Vi ser att detalj-vyn kommer in från höger och försvinner ut till höger. Vi använder CSS3 för animationer och tittar på hur vi löser det i en liten app.

Exempelkoden finns i kursrepot [example/animation](https://github.com/dbwebb-se/webapp/tree/master/example/animation).



Grunden {#base}
--------------------------------------

Jag har gjort i ordning en liten applikation med två stycken vyer. En list vy och en detalj vy. Routern som används är den som skapades i övningen "[En router i JavaScript](kunskap/en-router-i-javascript)".

```javascript
// list-component.js

export default class ListComponent extends HTMLElement {
    connectedCallback() {
        let link = document.createElement("a");

        link.textContent = "Se detaljer";

        link.addEventListener("click", (event) => {
            event.preventDefault();

            location.hash = "detail";
        });

        this.appendChild(link);
    }
}
```


```javascript
// detail-component.js

export default class DetailComponent extends HTMLElement {
    connectedCallback() {
        let link = document.createElement("a");

        link.textContent = "Se lista";

        link.addEventListener("click", (event) => {
            event.preventDefault();

            location.hash = "";
        });

        this.appendChild(link);
    }
}
```

```javascript
// router.js

export default class Router extends HTMLElement {
    constructor() {
        super();

        this.currentRoute = "";

        this.allRoutes = {
            "": {
                view: "<list-component></list-component>",
                name: "Lista",
            },
            "detail": {
                view: "<detail-component class='slide-in'></detail-component>",
                name: "Detalj",
            },
        };
    }

    get routes() {
        return this.allRoutes;
    }

    // connect component
    connectedCallback() {
        window.addEventListener('hashchange', () => {
            this.resolveRoute();
        });

        this.resolveRoute();
    }

    resolveRoute() {
        this.currentRoute = location.hash.replace("#", "");

        this.render();
    }

    render() {
        this.innerHTML = "<not-found></not-found>";

        if (this.routes[this.currentRoute]) {
            this.innerHTML = this.routes[this.currentRoute].view;
        }
    }
}
```



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

Vi definierar först klassen `.slide-in` som använder sig av `moveFromRight` på nedanstående sätt. Detalj-komponenten har alltid klassen `.slide-in`, vilket skarpsynta såg ovan i `router.js`-filen.

```css
.slide-in {
    animation: moveFromRight 0.4s ease both;
}
```

Nu glider detalj-vyn in från höger när vi går från listan till detalj-vyn. För att få detalj-vyn att glida ut till höger när vi klickar på Lista-länken använder vi oss `addEventListener` och `setTimeout` innan vi ändrar `location.hash`.

```javascript
// detail-component.js
export default class DetailComponent extends HTMLElement {
    connectedCallback() {
        let link = document.createElement("a");

        link.textContent = "Se lista";

        link.addEventListener("click", (event) => {
            event.preventDefault();

            this.classList.add("slide-out");

            setTimeout(() => {
                this.classList.remove("slide-out");

                location.hash = "";
            }, 250);
        });

        this.appendChild(link);
    }
}
```

Klassen `.slide-out` som använder sig av `moveToRight` keyframen.

```css
.slide-out {
    animation: moveToRight 0.4s ease both;
}
```

För att se animeringen kan ni öppna upp `example/animation` med hjälp av er lokala webbserver.



Avslutningsvis {#avslutning}
--------------------------------------
Vi har i denna övning tittat på hur man med hjälp av animationer får känslan av att använda en mobil enhet och att det inte bara ser ut som en mobil enhet.
