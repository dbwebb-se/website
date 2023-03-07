---
author: efo
revision:
    "2023-03-01": "(A, efo) Första utgåvan."
...
Web Components
==================================

I denna övningen tittar vi på hur vi kan skapa återanvändbara delar av vår kod med hjälp av webbens inbyggda tekniker HTML, CSS och JavaScript, samt ett antal inbyggda API:er i webbläsaren.



<!--more-->



Förkunskaper {#prereqs}
--------------------------------------

Du har gjort övningarna "[Introduktion till Lager-API:t](kunskap/introduktion-till-lager-api)" och "[Typografi i mobila enheter](kunskap/typografi-i-mobila-enheter)".



Exempelkod {#example}
--------------------------------------

Exempelkod för denna övningen finns i kursrepot under [example/web-component-starter](https://github.com/dbwebb-se/webapp/tree/master/example/web-component-starter).

Om du skriver nedanstående kod i `me/lager` katalogen kan du återanvända koden i uppgiften "[Lager appen del 1](uppgift/lager-appen-del-1)".



Web komponenter {#components}
--------------------------------------

När vi utvecklar mjukvara är det ett antal olika principer och best-practices som har vunnit mark och som karakteriserar bra mjukvara. Ofta har de lite olika roliga förkortningar och nedan är ett par av de som _web components_ är ett försök på att efterleva.

**DRY**: Do not Repeat Yourself [1]

**SRP**: Single Responsibility Principle [2]

**Encapsulation** [c.f. 3]

Vi vill alltså kapsla in vår kod som har exakt ett (1) ansvarsområde för att kunna återanvända.



Låt mig se lite kod Emil! {#code}
--------------------------------------

Nu får det räcka med massa torra forskningsartiklar, böcker och förkortningar, så låt oss titta på lite kod.

Vi börjar med att skapa en HTML-fil `index.html` där vi än så länge har en tom `body`-del, men laddar in en CSS-fil och en JavaScript-fil i `head`-elementet. Se till att skapa filerna `style.css` och `main.js` också. Vi ser till att definiera en `viewport` meta-tag. Och att vi laddar `main.js` scriptet med hjälp av `defer`-attributet. När vi använder `defer` exekveras JavaScript-filen först efter att hela dokumentet har laddats.

```html
<!doctype html>
<html lang="se">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Lager-Components</title>

    <link rel="stylesheet" href="style.css" />
    <script type="module" src="main.js" defer></script>
</head>
<body>
</body>
</html>
```

I `style.css` filen lägger vi till grunden från övningen "[Typografi i mobila enheter](kunskap/typografi-i-mobila-enheter)". Så att filen ser ut så här:

```css
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html {
    font-size: 100%;
}

body {
    line-height: 1.4;
    font-family: sans-serif;
}

h1 {
    font-size: 1.8rem;
}

h2 {
    font-size: 1.6rem;
    margin-bottom: 1.4rem;
}

p {
    margin-bottom: 1.4rem;
    font-size: 1rem;
}
```



### Vår första komponent {#first}

Vi ska nu skriva vår första komponent. Tanken är att den ska skriva ut en titel på sidan allra längst upp. Detta hade vi kunnat göra med enbart HTML, men väljer att göra det som en _web component_. Både för att demonstrera konceptet, men även för att vi i kommande kursmoment kommer återanvända komponenten för att ändra titeln längst upp när vi byter vy.

I `body`-delen i `index.html` skriver vi in följande.

```html
<body>
    <header class="header">
        <lager-title></lager-title>
    </header>
</body>
```

Vi lägger till ett vanligt `header`-element med `.header` och sedan inuti det elementet har vi vår första komponent. I vanliga fall hade det ovanstående kod inte gjort särskilt mycket, men med hjälp av WebAPI:t [customElements](https://developer.mozilla.org/en-US/docs/Web/API/Window/customElements) kan vi definiera element på webbplatsen som inte i vanliga fall finns i HTML-specifikationen. **Alla _web components_ som vi skapar med hjälp av customElements bör innehålla ett bindestreck (-).** Detta för att särskilja de från de elementen som finns fördefinierade i HTML-specifikationen.

I `main.js` skriver vi in följande rader.

```javascript
import LagerTitle from "./components/lager-title.js";

customElements.define('lager-title', LagerTitle);
```

Först importerar vi klassen `LagerTitle` från en fil och klass som vi kommer skapa om en liten stund. Sedan definierar vi vårt element `lager-title` och skickar med klassen `LagerTitle` så den anrops när webbläsaren _parser_ vår HTML med den taggen/elementet.



### Elementets klass {#class}

Vi börjar med att skapa en katalog `components` och här är tanken att vi under utvecklandet av vår lager-app lägger våra egna komponenter. I katalogen skapar vi filen `lager-title.js` som innehåller klassen `LagerTitle`.

```javascript
export default class LagerTitle extends HTMLElement {
    // connect component
    connectedCallback() {
        this.innerHTML = `<h1>Lager-app</h1>`;
    }
}
```

Det första vi gör är att ärva från den generella HTMLElement klassen som är JavaScripts representation av alla de HTML Element som finns specificerade. Detta för att vi då kan komma attribut som `textContent`, `innerHTML` osv. Vi definierar sedan funktionen `connectedCallback`, viktigt att den heter exakt så då den anropas när komponenten ritas ut i webbläsaren. `connectedCallback` är ett exempel på en såkallad _life-cycle method_ där det finns ett antal fördefinierade [life-cycle methods](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_custom_elements#using_the_lifecycle_callbacks). Dessa funktioner med specifika fördefinierade namn anropas av webbläsaren under komponentens livs-cykel.

Om du öppnar upp `index.html` i webbläsaren via din **webbserver lokalt**. Din webbserver lokalt kan vara XAMPP eller så kan man använda Python's inbyggda webbserver genom att köra kommandot `python3 -m http.server 9000` i `me/lager` i terminalen. Då kan du gå till `http://localhost:9000` i terminalen och din app bör då visas i webbläsaren.

Nu gör detta inte så mycket mer än att vi i HTML-filen hade kunnat skriva `<h1>Lager-app</h1>`, så låt oss titta vidare på hur vi kan jobba med komponenterna.



### Elementets attribut {#attributes}

Vi börjar med att lägga till en konstruktor i vår `LagerTitle` klass. Här ser vi först till att klassen vi ärver ifrån `HMTLElement`'s konstruktor anrops för att sedan definiera en instansvariabel för objekten som skapas utifrån klassen. Instansvariabeln skapas med kodraden `this.name = "Andreas";` där `this` i klasser i JavaScript alltid pekar tillbaka på instansen som skapats.

```javascript
export default class LagerTitle extends HTMLElement {
    constructor() {
        super();

        this.name = "Andreas";
    }

    // connect component
    connectedCallback() {
        this.innerHTML = `<h1>Lager-app</h1>`;
    }
}
```

Vi skapar sedan en `getter`-metod i klassen returnerar en array med de attribut vi vill ska vara _observable_.

```javascript
export default class LagerTitle extends HTMLElement {
    constructor() {
        super();

        this.name = "Andreas";
    }

    // component attributes
    static get observedAttributes() {
        return ['name'];
    }

    // connect component
    connectedCallback() {
        this.innerHTML = `<h1>Lager-app</h1>`;
    }
}
```

För att komponenten sedan ska kunna upptäcka att ett attribut ändrats använder vi ytterligare en livscykel-metod `attributeChangedCallback` som ändrar vår instansvariabel om attributets värde skiljer sig från tidigare värdet. I samma veva passar vi på att även ändra den HTML som skrivs ut i `connectedCallback` metoden.

```javascript
export default class LagerTitle extends HTMLElement {
    constructor() {
        super();

        this.name = "Andreas";
    }

    // component attributes
    static get observedAttributes() {
        return ['name'];
    }

    // attribute change
    attributeChangedCallback(property, oldValue, newValue) {
        if (oldValue === newValue) return;
        this[property] = newValue;
    }

    // connect component
    connectedCallback() {
        this.innerHTML = `<h1>${this.name}'s Lager-app</h1>`;
    }
}
```

Laddar vi om sidan ser vi att det nu står "Andreas's Lager-app" längst upp i vår webbläsare. Dock utnyttjar vi fortfarande inte attributen på vår komponent så vi ser till att ändra i `index.html`.

```html
<body>
    <header class="header">
        <lager-title name="Emil"></lager-title>
    </header>
</body>
```

Laddar vi om sidan nu ser vi att titeln på sidan har ändrats från "Andreas's Lager-app" till "Emil's Lager-app".



En mer fullständig komponent {#fullstandig}
--------------------------------------

Än så länge har vi inte riktigt sett några större fördelar med detta sättet att strukturera vår kod förutom att vi kan lägga logik för en tagg på en specifik plats på ett specifikt sätt. Så låt oss ta ytterligare ett steg och börja med att bygga en lista på de produkter som finns i lagret.

Låt oss börja genom att lägga till en `main`-del i vår `index.html` och i den lägg nya taggen `product-list`.

```html
<body>
    <header class="header">
        <lager-title name="Emil"></lager-title>
    </header>

    <main class="main">
        <product-list></product-list>
    </main>
</body>
```

Vi behöver då i `main.js` skapa ytterligare ett `customElements.define()` anrop. Vilket då gör att filen ser ut på följande sätt och gör att vi även behöver skapa komponenten `components/product-list.js`-filen.

```javascript
import LagerTitle from "./components/lager-title.js";
import ProductList from "./components/product-list.js";

customElements.define('lager-title', LagerTitle);
customElements.define('product-list', ProductList);
```

I filen `components/product-list.js` skapar vi sedan klassen och till en början har vi med konstruktorn och `connectedCallback`-metoden.

```javascript
import { apiKey, baseURL } from "../utils.js";

export default class ProductList extends HTMLElement {
    constructor() {
        super();

        this.products = [];
    }

    // connect component
    async connectedCallback() {
        this.innerHTML = `<h2>Produktlista</h2>`;
    }
}
```

Laddar vi om sidan i webbläsaren bör vi nu se ytterligare en rubrik under "Emil's Lager-app" (Vid det här laget det kanske är rimligt att ändra till ditt egna namn). Låt oss då fylla på vår instansvariabel `products` med de produkter som bör finnas i lagret efter att du gjort övningen "[Introduktion till Lager-API:t](kunskap/introduktion-till-lager-api)".

Då vi i ganska många filer och komponenter kommer behöva anropa Lager-API:t lägger vi URL'n och API-nyckeln i en gemensam fil för att på ett enkelt sätt kunna återanvända den informationen. Jag skapar filen `me/lager/utils.js` och lägger följande i den, se till att byta ut så din API-nyckel finns i filen, annars fungerar det inte.

```javascript
const apiKey = "[DIN API NYCKEL]";
const baseURL = "https://lager.emilfolino.se/v2";

export { apiKey, baseURL };
```

Vi kan då i klassen importera värdena och använda de. Vi ser till att definiera `connectedCallback`-metoden som en `async` metod för att kunna använda `await` när vi hämtar data från Lager-API:t. I ett första skede skriver vi bara ut de hämtade produkterna till konsollen.

```javascript
import { apiKey, baseURL } from "../utils.js";

export default class ProductList extends HTMLElement {
    constructor() {
        super();

        this.products = [];
    }

    // connect component
    async connectedCallback() {
        const response = await fetch(`${baseURL}/products?api_key=${apiKey}`);
        const result = await response.json();

        this.products = result.data;

        console.log(this.products);

        this.innerHTML = `<h2>Produktlista</h2>`;
    }
}
```



### Enskilda produkter {#single}

Nu vill vi skriva ut en lista på de enskilda produkterna som finns i ditt egna lager. Det att visa upp detaljer om en enskild produkt känns som något vi vill kunna göra mer än en gång i vår applikation. Med tanke på **DRY** väljer vi därför att lägga denna funktionalitet i en egen komponent. I `product-list.js` skriver vi därför ut en lång sträng med taggarna `<single-product></single-product>` och använder attribut för att skicka med den specifika produkten. Då de enskilda produkterna är komplexa objekt väljer vi att göra om objekten till en JSON-sträng innan vi skickar med som attribut till `single-product` komponenten.

Jag väljer även att extrahera själva ritandet av listan till en egen metod `render()` då det kan finnas tillfällen där vi bara vill rendera ut listan utan att hämta data på nytt.

```javascript
import { apiKey, baseURL } from "../utils.js";

export default class ProductList extends HTMLElement {
    constructor() {
        super();

        this.products = [];
    }

    // connect component
    async connectedCallback() {
        const response = await fetch(`${baseURL}/products?api_key=${apiKey}`);
        const result = await response.json();

        this.products = result.data;

        this.render();
    }

    render() {
        const list = this.products.map((product) => `<single-product product='${JSON.stringify(product)}'></single-product>`).join("");

        this.innerHTML = `<h2>Produktlista</h2>${list}`;
    }
}
```

Nu behöver vi då skapa komponenten `components/single-product.js` och definiera den som ett `customElement` i `main.js`.

```javascript
import LagerTitle from "./components/lager-title.js";
import ProductList from "./components/product-list.js";
import SingleProduct from "./components/single-product.js";

customElements.define('lager-title', LagerTitle);
customElements.define('product-list', ProductList);
customElements.define('single-product', SingleProduct);
```

I klassen `SingleProduct` definierar vi först de attribut vi vill kunna "observera" och sedan en `getter`-funktion som använder sig av `HTMLElement`'s `getAttribute` funktion som vi sedan gör om från en JSON-sträng till original objektet.

I `connectedCallback` ser det ut som tidigare när vi använt en instansvariabel, men det som egentligen händer är att `getter`-funktionen anrops och från det objektet som returneras hämtar vi ut `name` i detta fallet.

```javascript
export default class SingleProduct extends HTMLElement {
    // component attributes
    static get observedAttributes() {
        return ['product'];
    }

    get product() {
        return JSON.parse(this.getAttribute("product"));
    }

    // connect component
    connectedCallback() {
        this.innerHTML = `<p>${this.product.name}</p>`;
    }
}
```

Laddar du om sidan bör du få en lista på produkterna som finns i lagret.



Avslutningsvis {#avslutning}
--------------------------------------

Vi har i denna övningen tittat på hur vi kan använda _web components_ för att kapsla in kod till egna komponenter. Vi har dessutom tittat på anledningar till varför vi vill använda _web components_ och hur vi kan använda oss av attribut för att dynamiskt ändra innehåll i komponenter.



Referenser {#references}
--------------------------------------

[1] Thomas, D., & Hunt, A. (2019). The pragmatic programmer. Addison-Wesley Professional.

[2] Martin, R. C. (2009). Clean code: a handbook of agile software craftsmanship. Pearson Education.

[3] Snyder, A. (1986, June). Encapsulation and inheritance in object-oriented programming languages. In Conference proceedings on Object-oriented programming systems, languages and applications (pp. 38-45).
