---
author: efo
revision:
    "2024-02-16": "(A, efo) Första utgåvan för webapp-v5 VT24."
...
Real-tids chatt
==================================

I denna övningen tittar vi på hur vi kan använda websockets för att kommunicera i realtid mellan flera klienter.



<!--more-->



Förkunskaper {#prereqs}
--------------------------------------

Du har gjort uppgiften "[Lager appen del 5](uppgift/lager-appen-del-5-v5)" och kan med fördel bygga vidare på den koden.



Exempelkod {#example}
--------------------------------------

Exempelkod för denna övningen finns i kursrepot under [example/chat](https://github.com/dbwebb-se/webapp/tree/master/example/chat).

Om du skriver nedanstående kod i `me/lager` katalogen kan du återanvända koden i uppgiften "[Lager appen del 6](uppgift/lager-appen-del-6-v5)".



Förutsättningar för chatten {#demands}
--------------------------------------

Vi kommer i denna övningen använda oss av socket.io som är en modul för att underlätta websocket kommunikation. Vi kommer allihopa koppla oss mot chatt-servern [https://lager-chat.emilfolino.se](https://lager-chat.emilfolino.se) för att det ska bli lite meddelanden i allas chattar.



En chat komponent {#chat-component}
--------------------------------------

Vi börjar med att skapa filen `me/lager/router.js` som kommer innehålla komponenten som hanterar routingen i vår applikation. Vi skapar detta som en vid det här laget en "vanlig" web component. Jag lägger till lite kod så att vi ser att allting fungerar när vi lägger till den i `main.js` och sedan i `index.html`.

```javascript
export default class Router extends HTMLElement {
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

När vi öppnar vår applikation nu ser vi bara texten **router-outlet** men nu vi är på gång.



Definiera routes {#define}
--------------------------------------

Till en början väljer vi att definiera våra routes direkt i konstruktorn i `Router` klassen. Jag definierar även en variabel för att hålla koll på nuvarande route. Längre ner i koden kommer vi dela upp komponenter och vyer (views) i två olika kataloger. Vyer är _web components_ men kommer mer vara en samling av andra små komponenter som tillsammans bygger ihop hela vyer. Varje route definieras utifrån nyckeln i objektet och det vi skriver där är det vi vill ska stå i adress fältet när vi vill besöka den specifika vyn som vi specificerar under `view`-attributet. `name` kommer i ett senare skede användas för att visas som text i navigationen.

```javascript
export default class Router extends HTMLElement {
    constructor() {
        super();

        this.currentRoute = "";

        this.allRoutes = {
            "": {
                view: "<products-view></products-view>",
                name: "Lagerlista",
            },
            "packlist": {
                view: "<packlist-view></packlist-view>",
                name: "Plocklista",
            }
        };
    }

    get routes() {
        return this.allRoutes;
    }

    // connect component
    connectedCallback() {
        this.innerHTML = "router-outlet";
    }
}
```

I ovanstående kod definierade jag även den publika `getter`-metod routes. Det gör att vi på ett enkelt sätt kan hämta ut alla routes, både inuti `Router` klassen men även från de instanser vi skapar.



### Hantera ändringar i routes {#changes}

Vi kommer i vår router utnyttja [hash-delen](https://developer.mozilla.org/en-US/docs/Web/API/URL/hash) av en URL för routingen, dvs det som kommer efter `#` i en URL. Och som av en händelse finns det ett `event` i webbläsaren `hashchange` som vi kan använda för detta.

Jag har valt att dela upp det i tre delar, man hade säkert kunnat lösa det med en eller två metoder, men känns som detta kan ge större flexibilitet i framtiden. I `connectedCallback` ser vi till att skapa en `EventListener` för att lyssna på om `hash` ändras. När den gör det vill vi anropa `resolveRoute`, dock vi vill vi även göra det första gången sidan laddas så därför lägger vi även ett anrop utanför `EventListener`-delen. I `resolveRoute`-metoden plockar vi ut `location.hash` och tar bort `#` vilket då får bli vår `currentRoute`. Finns det ingen hash, blir det en tom sträng som vi har definierat ska vara routen för LagerSaldo sidan i `this.allRoutes`. Sedan renderar vi rutten med hjälp av att hämta ut komponenten/vyn vi vill visa. Om inte `this.currentRoute` finns i `this.allRoutes` ritar vi istället upp vyn `not-found`, där vi bara skriva ut att routen inte finns, antar ni vid detta läget kan skapa den själv.

```javascript
export default class Router extends HTMLElement {
    constructor() {
        super();

        this.currentRoute = "";

        this.allRoutes = {
            "": {
                view: "<products-view></products-view>",
                name: "Lagerlista",
            },
            "packlist": {
                view: "<packlist-view></packlist-view>",
                name: "Plocklista",
            }
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
        this.innerHTML = this.routes[this.currentRoute].view || "<not-found></not-found>";
    }
}
```



Vyer att visa upp {#views}
--------------------------------------

Låt oss då ta en titt på dessa vyer som vi vill visa upp när vi navigerar till en route. Jag väljer att skapa en katalog `views` så att jag håller isär rena komponenter och vyer som mer blir en samling av underliggande komponenter.

Nedan syns filen `views/products.js` som i sin tur renderar ut lagersaldo listan med hjälp av de komponenter vi skapade i kmom01.

```javascript
export default class ProductsView extends HTMLElement {
    // connect component
    connectedCallback() {
        this.innerHTML =    `<header class="header">
                                <lager-title title="Produkt lista"></lager-title>
                             </header>
                             <main class="main">
                                <product-list></product-list>
                             </main>
                             `;
    }
}
```

Se till att hålla vyerna ganska rena, så får logiken ligga i de enskilda komponenterna. Du bör utifrån detta exemplet lätta kunna skapa ytterligare vyer, till exempel den PlockLista vy som är uppgiften i detta kmom och som vi definierade i `this.allRoutes` i ovanstående `Router`-klass. Det kan vara smart att skapa den, även om den just nu bara innehåller en text så du ser att routern fungerar.



Navigationen {#navigation}
--------------------------------------

För att vi på ett enkelt sätt kan navigera mellan olika vyer skapar vi även en navigations-komponent. Även denna lägga vi i `me/lager` och vi lägger in den på precis samma sätt som `router-outlet`, både i `main.js` och i `index.html`.

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
    <navigation-outlet></navigation-outlet>
</body>
</html>
```

Jag skapar då filen `navigation.js` med nedanstående klass i den filen. Här skapar vi en instans av `Router` och hämtar sedan ut de routes som finns. Sedan itererar vi över de och ritar ut menyn i ett `nav`-element.

```javascript
import Router from "./router.js";

export default class Navigation extends HTMLElement {
    constructor() {
        super();

        this.router = new Router();
    }

    // connect component
    connectedCallback() {
        const routes = this.router.routes;

        let navigationLinks = "";

        for (let path in routes) {
            navigationLinks += `<a href='#${path}'>${routes[path].name}</a>`;
        }

        this.innerHTML = `<nav>${navigationLinks}</nav>`;
    }
}
```


### Styling av menyn {#styling}

Tanken är att vi ska ha en navigationsmeny längst nere på skärmen, som vi känner igen det från många mobil-appar. Menyn ligger längst nere på skärmen för att underlätta för användaren av den mobila enheten. Nedan finns exempel på en meny längst ner i en mobil-app, till vänster syns det på android och till höger i iOS.

[FIGURE src=image/webapp/ios-bottom-menu.jpeg?w=c7 class="right" caption="Meny längst ner på iOS."]

[FIGURE src=image/webapp/android-bottom-menu.png?w=c7 caption="Meny längst ner på android."]

Vi börjar med att placera menyn längst ner på skärmen och samtidigt fylla ut hela bredden genom att använda följande CSS.

```css
.bottom-nav {
    position: fixed;
    bottom: 0;
    overflow: hidden;
    width: 100%;
}
```

Vi sätter positionen med värdet `fixed` och att vi vill ha den längst ner på skärmen med `bottom: 0;`. Vi använder `overflow: hidden;` för att inte få problem med scrolling där vi inte vill ha det. För att fördela länkarna jämt i menyn använder vi [flexbox](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Basic_Concepts_of_Flexbox). Flexbox är en förhållandevis ny teknik för att skapa 1-endimensionella layouter på ett enkelt sätt. I detta tillfälle använder vi följande attribut.

```css
.bottom-nav {
    position: fixed;
    bottom: 0;
    overflow: hidden;
    width: 100%;
    display: flex;
    flex-flow: row | nowrap;
    justify-content: space-around;
}
```

Vi anger att vår meny ska använda sig av flexbox med attributet `display: flex;`. Attributet `flex-flow: row | nowrap;` är kort notation för  `flex-direction: row;` och `flex-wrap: nowrap;` och vi vill här att länkarna ska lägga sig på en rad och med attributet `justify-content: space-around;` fördelar vi ut länkarna jämt i menyn. I exemplet nedan ser vi hur det kan se när man har lagt sin menyn längst ner på skärmen. Vi kommer använda flexbox under kursens gång så oroa dig inte om du inte känner att du har fullt koll på flexbox, vi kommer bygga vidare på flexbox i kursen.



Avslutningsvis {#avslutning}
--------------------------------------

Vi har i denna övning tittat på hur vi kan skapa en router som enkelt låter oss navigera mellan olika vyer i vår applikation.
