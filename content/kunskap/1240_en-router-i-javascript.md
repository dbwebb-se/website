---
author: efo
revision:
    "2023-03-15": "(A, efo) Första utgåvan för webapp-v5."
...
En router i JavaScript
==================================

I denna övningen tittar vi på hur vi kan använda en Web Component som bas för en router så vi har möjligheten att byta mellan olika vyer i vår applikation utan att ladda om sidan.



<!--more-->



Förkunskaper {#prereqs}
--------------------------------------

Du har gjort uppgiften "[Lager appen del 1](uppgift/lager-appen-del-1)" och kan med fördel bygga vidare på den koden.



Exempelkod {#example}
--------------------------------------

Exempelkod för denna övningen finns i kursrepot under [example/web-component-starter-del2](https://github.com/dbwebb-se/webapp/tree/master/example/web-component-starter-del2).

Om du skriver nedanstående kod i `me/lager` katalogen kan du återanvända koden i uppgiften "[Lager appen del 2](uppgift/lager-appen-del-2)".



Förutsättningar för vår router {#demands}
--------------------------------------

Vår router ska göra så att vi kan byta mellan olika vyer i vår applikation och göra detta utan att vi laddar om själva webbplatsen. Vi kommer använda `#`-deln av en url för att hantera vilken route vi är på. I `location` objektet i webbläsaren finns det massa med godsaker så innan vi drar igång kan det vara bra att titta på [dokumentationen](https://developer.mozilla.org/en-US/docs/Web/API/Location).



En router komponent {#router-component}
--------------------------------------

Vi börjar med att skapa filen `me/lager/router.js` som kommer innehålla komponenten som hanterar routingen i vår applikation. Vi skapar detta som en vid det här laget en "vanlig" web component. Jag lägger till lite kod så att vi ser att allting fungerar när vi lägger till den i `main.js` och sedan i `index.html`.

```javascript
export default class Router extends HTMLElement{
    constructor() {
        super();
    }

    // connect component
    connectedCallback() {
        this.innerHTML = "router-outlet";
    }
}
```

I `main.js` definierar vi sedan ett `customElement` som vi ger namnet `router-outlet`. Jag väljer att strukturera upp mina imports och komponenter genom att använda lite mellanrum, men det är enbart för min egen skull.

```javascript
// router import
import Router from "./router.js";

// component imports
import LagerTitle from "./components/lager-title.js";
import ProductList from "./components/product-list.js";
import SingleProduct from "./components/single-product.js";

customElements.define('router-outlet', Router);

customElements.define('lager-title', LagerTitle);
customElements.define('product-list', ProductList);
customElements.define('single-product', SingleProduct);
```

I `index.html` tar vi bort alla andra komponenter och har bara `<router-outlet></router-outlet>`.


```html
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Lager-Components</title>

    <link rel="stylesheet" href="style.css" />
    <script type="module" src="main.js" defer></script>
</head>
<body>
    <router-outlet></router-outlet>
</body>
</html>
```

När vi öppnar vår applikation nu ser vi bara texten **router-outlet** men vi är på gång.



Avslutningsvis {#avslutning}
--------------------------------------
