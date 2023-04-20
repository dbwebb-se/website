---
author: efo
category: javascript
revision:
  "2018-03-02": (A, efo) Första utgåvan inför kursen webapp v3.
...
Kamera i mobilen
==================================

[FIGURE src=/image/webapp/Leica_M9.jpg?w=c5 class="right"]



<!--more-->



Exempelprogrammet från denna övning finns i kursrepot [example/camera](https://github.com/dbwebb-se/webapp/tree/master/example/camera) och i `example/camera`. Använd det gärna tillsammans med övningen för att se hur de olika delarna hänger ihop. En del kod utelämnas i exemplet för att det ska vara mer lättläst i artikeln.



Kamera i webbläsaren {#camera}
--------------------------------------

Låt oss ta en titt på Web API:t [MediaDevices](https://developer.mozilla.org/en-US/docs/Web/API/MediaDevices/getUserMedia) och se hur vi med hjälp av funktion getUserMedia kan ta en bild.

Vi börjar med att skapa en komponenten `CameraComponent`.

```javascript
export default class CameraComponent extends HTMLElement {
    constructor() {
        super();

        this.photoData = "";
    }

    connectedCallback() {
        this.innerHTML = `
            <div class="camera">
                <video id="video">Video stream not available.</video>
                <button id="startbutton">Take photo</button>
                <button id="sendbutton">Send photo</button>
            </div>
            <canvas id="canvas"></canvas>
        `;

        window.addEventListener("load", () => {
            this.startup()
        }, false);
    }
}
```

Här skapar vi först instansvariabeln photoData. Den kommer innehålla själva fotot vi tar med kameran inbyggt i mobilen sedan. Sedan initierar vi den HTML vi behöver för att först få upp en video som vi sedan kan ta en bild ifrån och lägga i `canvas`-elementet.

När sidan är laddat anropar vi sedan funktionen `startup` för att sätta upp kameran och initierar `EventListeners` på knapparna ovan. I funktionsanropet `navigator.mediaDevices.getUserMedia` får vi tillbaka en video-stream som vi sedan tilldelar till video-elementet och startar. När videon startar anropas eventet `canplay` som vi har skapat en `EventListener` för i startup. I den `EventListener` sätter vi även storleken på videon.

```javascript
startup() {
    let streaming = false;
    const width = 320; // We will scale the photo width to this
    let height = 0; // This will be computed based on the input stream

    let video = document.getElementById("video");
    let canvas = document.getElementById("canvas");
    let startbutton = document.getElementById("startbutton");
    let sendbutton = document.getElementById("sendbutton");

    navigator.mediaDevices
        .getUserMedia({ video: true, audio: false })
        .then((stream) => {
            video.srcObject = stream;
            video.play();
        })
        .catch((err) => {
            console.error(`An error occurred: ${err}`);
        });

    video.addEventListener(
        "canplay",
        (ev) => {
            if (!streaming) {
                height = video.videoHeight / (video.videoWidth / width);

                // Firefox currently has a bug where the height can't be read from
                // the video, so we will make assumptions if this happens.

                if (isNaN(height)) {
                    height = width / (4 / 3);
                }

                video.setAttribute("width", width);
                video.setAttribute("height", height);
                canvas.setAttribute("width", width);
                canvas.setAttribute("height", height);
                streaming = true;
            }
        },
        false
    );

    startbutton.addEventListener(
        "click",
        (ev) => {
            ev.preventDefault();
            this.takepicture(width, height);
        },
        false
    );

    sendbutton.addEventListener(
        "click",
        (ev) => {
            ev.preventDefault();
            this.sendpicture();
        },
        false
    );

    this.clearphoto();
}
```

De resterande funktionerna i klassen finns nedan.

```javascript
takepicture(width, height) {
    const context = canvas.getContext("2d");
    if (width && height) {
        canvas.width = width;
        canvas.height = height;
        context.drawImage(video, 0, 0, width, height);

        this.photoData = canvas.toDataURL("image/png");
    } else {
        clearphoto();
    }
}

clearphoto() {
    const context = canvas.getContext("2d");
    context.fillStyle = "#AAA";
    context.fillRect(0, 0, canvas.width, canvas.height);

    this.photoData = canvas.toDataURL("image/png");
}
```


Foto API {#foto-api}
--------------------------------------

```bash
npm install @uploadcare/upload-client
mkdir uploadcare
cp node_modules/@uploadcare/upload-client/dist/index.browser.js uploadcare/
```




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
