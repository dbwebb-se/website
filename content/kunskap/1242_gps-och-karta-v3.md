---
author: efo
category: javascript
revision:
  "2018-03-02": (A, efo) Första utgåvan inför kursen webapp v3.
...
GPS och karta v3
==================================

[FIGURE src=/image/webapp/gps.png?w=c5 class="right"]

Vi ska i denna övning använda [leaflet.js](https://leafletjs.com) tillsammans med [OpenStreetMap](https://www.openstreetmap.org) och Web API:t `geolocation` för att visa positionsdata på en karta. Vi ska alltså titta på hur vi med hjälp av den inbyggda GPS'en kan visa användarens position på kartan.



<!--more-->



Exempelprogrammet från denna övning finns i kursrepot [example/gps](https://github.com/dbwebb-se/webapp/tree/master/example/gps-v5) och i `example/gps-v5`. Använd det gärna tillsammans med övningen för att se hur de olika delarna hänger ihop. En del kod utelämnas i exemplet för att det ska vara mer lättläst i artikeln.



En karta {#karta}
--------------------------------------

Vi kommer i detta exemplet använda leaflet.js för att visa upp en karta i vår mobila enhet och för att rita ut markörer på denna karta. Vi börjar med att skapa de filer och kataloger som behövs för att få ihop grunden.

```bash
# stå i me/kmom05/gps
touch index.html main.js style.css
mkdir components leaflet models
touch components/map-view.js
```

I `index.html` lägger vi in grunden som vi har haft i tidigare kursmoment. Men vi lägger till ett `main`-element och `map-view` som vi senare kommer att skapa som `customElement`.

```html
<!doctype html>
<html lang="sv">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Map and GPS v5</title>

    <link rel="stylesheet" href="style.css" />

    <script type="module" src="main.js" defer></script>
</head>
<body>
    <main>
        <map-view></map-view>
    </main>
</body>
</html>
```

I `style.css` skapar vi en väldigt enkel grundstil. Viktigt att notera är att vi sätter en explicit höjd på det som kommer vara kart-elementet (`.map`), annars kommer det inte synas.

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

main {
    padding: 0.7rem;
}

h1 {
    font-size: 2rem;
    margin-bottom: 1.4rem;
}

p {
    font-size: 1rem;
    margin-bottom: 1.4rem;
}

.map {
    height: 50vh;
    width: 100%;
}
```

Låt oss då börja med vår web-component. I `main.js` definierar vi först elementet.

```javascript
import MapView from "./components/map-view.js";

customElements.define("map-view", MapView);
```

Vi börjar sedan `components/map-view.js` med att skapa en instansvariabel för kartan `this.map` och sedan skriver vi ut en rubrik bara för att se att allt fungerar som det ska.

```javascript
export default class MapView extends HTMLElement {
    constructor() {
        super();

        this.map = null;
    }

    connectedCallback() {
        this.innerHTML = `<h1>MapView</h1>`;
    }
}
```

Nu bör du kunna se en rubrik om du öppnar upp applikationen i webbläsaren.



Leaflet {#leaflet}
--------------------------------------

Låt oss installera `leaflet` för att komma igång med kartan och kopiera lite filer så allt hamnar på rätt plats.

```bash
# stå i me/kmom05/gps
npm init --yes
npm install leaflet
mkdir leaflet
cp node_modules/leaflet/dist/leaflet.js leaflet/leaflet.min.js
cp node_modules/leaflet/dist/leaflet.css leaflet/leaflet.min.css
cp -r node_modules/leaflet/dist/images leaflet/
cp ../../../example/gps-v5/leaflet/location.png leaflet/
```

Vi importerar sedan `leaflet.min.js` filen och då får vi tillgång till ett global objekt `L`. För att valideringen inte ska klaga lägger vi en kommentar längst upp i filen om att vi vet att globala variabeln finns. Vi lägger även till `<div id="map" class="map"></div>` som en del av `innerHTML` för vår komponent. I funktionen `renderMap` renderar vi sedan ut kartan och lägger till vilka **tiles** vi vill använda, **tiles** är de små kartbilder som tillsammans bygger ihop kartan i olika grader av in-zoomning.

```javascript
/* global L */

import "../leaflet/leaflet.min.js";

export default class MapView extends HTMLElement {
    constructor() {
        super();

        this.map = null;
    }

    connectedCallback() {
        this.innerHTML = `<h1>MapView</h1><div id="map" class="map"></div>`;

        this.renderMap();
    }

    renderMap() {
        this.map = L.map('map').setView([56.18219, 15.59094], 11);

        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(this.map);
    }
}
```

Om vi laddar om sidan nu bör det bli heltokigt på riktigt, men kartbitar lite överallt på skärmen, så vi ser till att lägga till `leaflet.min.css` i `index.html` innan vår `style.css` fil.

```html
<link rel="stylesheet" href="leaflet/leaflet.min.css" />
<link rel="stylesheet" href="style.css" />
```

Och nu bör det ser någorlunda vettigt ut med en karta som visar Karlskrona med omnejd.



Markörer {#markorer}
--------------------------------------

För att vi ska kunna visa olika specifika platser på kartan vill vi kunna rita ut markörer. För att vi ska kunna rita ut markörer behöver vi koordinater och det kan vi antingen skriva in manuellt eller så kan vi omvandla adresser till koordinater. Jag väljer först att skapa en modell för just omvandlingen till koordinater i filen `models/nominatim.js`. I den modellen använder vi tjänsten nominatim.openstreetmap.org för att göra om en adress till koordinater.

```javascript
export default async function getCoordinates(address) {
    const urlEncodedAddress = encodeURIComponent(address);
    const url = "https://nominatim.openstreetmap.org/search.php?format=jsonv2&q=";
    const response = await fetch(`${url}${urlEncodedAddress}`);
    const result = await response.json();

    return result;
}
```

Vi kan sedan importera denna funktion till vår komponent. Från `connectedCallback`-metoden anropar vi sedan `this.renderMarkers`-metoden som ritar ut en markör baserat på koordinater och en från en adress vi omvandlar med hjälp av modellen.

```javascript
/* global L */

import "../leaflet/leaflet.min.js";

import getCoordinates from "../models/nominatim.js";

export default class MapView extends HTMLElement {
    constructor() {
        super();

        this.map = null;
    }

    connectedCallback() {
        this.innerHTML = `<h1>MapView</h1><div id="map" class="map"></div>`;

        this.renderMap();
    }

    renderMap() {
        this.map = L.map('map').setView([56.18219, 15.59094], 11);

        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(this.map);

        this.renderMarkers();
    }

    async renderMarkers() {
        let coordinates = [56.2345, 15.6034];

        L.marker(coordinates).addTo(this.map);

        let adress = "Stortorget 1, Karlskrona";

        const results = await getCoordinates(adress);

        L.marker([
            parseFloat(results[0].lat),
            parseFloat(results[0].lon)
        ]).addTo(this.map);
    }
}
```

Vi bör nu kunna se två markörer på kartan, en på Stortorget och en en bit norrom Karlskrona.



Användarens plats {#plats}
--------------------------------------

Sista pusselbiten vi behöver att få på plats är användarens position utritad på kartan. Vi kommer då använda oss av webbläsarens inbyggda möjlighet för att plocka ut användarens position. [Geolocation API](https://developer.mozilla.org/en-US/docs/Web/API/Geolocation_API) beskriver hur det fungerar med att hämta ut användarens position.

Vi lägger till ytterligare en metod i vår komponent `renderLocation`, som vi anropar från `renderMap`. I metoden frågar vi först om `geolocation` är tillgängligt i `navigator`-objektet som är den webbläsare vi ser sidan via. Sedan frågar vi `navigator` om nuvarande position och får tillbaka ett result som vi sedan ritar ut som en markör. Vi väljer att ändra utseendet på markören bara för att visa att den ena är positionen och den andra en vanlig markör.

```javascript
/* global L */

import "../leaflet/leaflet.min.js";

import getCoordinates from "../models/nominatim.js";

export default class MapView extends HTMLElement {
    constructor() {
        super();

        this.map = null;
    }

    connectedCallback() {
        this.innerHTML = `<h1>MapView</h1><div id="map" class="map"></div>`;

        this.renderMap();
    }

    renderMap() {
        this.map = L.map('map').setView([56.18219, 15.59094], 11);

        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(this.map);

        this.renderMarkers();

        this.renderLocation();
    }

    async renderMarkers() {
        let coordinates = [56.2345, 15.6034];

        L.marker(coordinates).addTo(this.map);

        let adress = "Stortorget 1, Karlskrona";

        const results = await getCoordinates(adress);

        L.marker([
            parseFloat(results[0].lat),
            parseFloat(results[0].lon)
        ]).addTo(this.map);
    }

    renderLocation() {
        let locationMarker = L.icon({
            iconUrl:      "leaflet/location.png",
            iconSize:     [24, 24],
            iconAnchor:   [12, 12],
            popupAnchor:  [0, 0]
        });


        if ("geolocation" in navigator) {
            navigator.geolocation.getCurrentPosition((position) => {
                L.marker(
                    [position.coords.latitude,                  position.coords.longitude],
                    {icon: locationMarker}
                ).addTo(this.map);
            });
        }
    }
}
```



Avslutningsvis {#avslutning}
--------------------------------------

Vi har i denna artikel använt oss av OpenStreetMap och leaflet.js för att placera ut markörer på en karta på specifika platser. Vi har även tittat på hur vi kan använda `geolocation`-Web-API:t för att rita ut användarens position på kartan.

Exempelprogrammet från denna övning finns i kursrepot [example/gps](https://github.com/dbwebb-se/webapp/tree/master/example/gps-v5) och i `example/gps-v5`.
