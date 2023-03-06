---
author: efo
revision:
    "2023-03-01": "(A, efo) Första utgåvan."
...
Web Components
==================================

I denna övningen tittar vi på hur vi kan skapa återanvändbara delar av vår kod med hjälp av webbens inbyggda tekniker HTML, CSS och JavaScript, samt ett antal inbyggda API:er i webbläsaren.



<!--more-->



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
        <lager-title name="Emil"></lager-title>
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





Avslutningsvis {#avslutning}
--------------------------------------

Vi har i denna övningen tittat på hur vi kan använda web components för att kapsla in kod till egna komponenter.



Referenser {#references}
--------------------------------------

[1] Thomas, D., & Hunt, A. (2019). The pragmatic programmer. Addison-Wesley Professional.

[2] Martin, R. C. (2009). Clean code: a handbook of agile software craftsmanship. Pearson Education.

[3] Snyder, A. (1986, June). Encapsulation and inheritance in object-oriented programming languages. In Conference proceedings on Object-oriented programming systems, languages and applications (pp. 38-45).
