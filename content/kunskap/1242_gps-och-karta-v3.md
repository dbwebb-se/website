---
author: efo
category: javascript
revision:
  "2018-03-02": (A, efo) Första utgåvan inför kursen webapp v3.
...
GPS och karta
==================================

[FIGURE src=/image/webapp/gps.png?w=c5 class="right"]

Vi ska i denna övning använda [leaflet.js](https://leafletjs.com) tillsammans med [OpenStreetMap](https://www.openstreetmap.org) och Cordova Pluginen geolocation för att visa positionsdata på en karta. Vi ska alltså titta på hur vi med hjälp av den inbyggda GPS'en kan visa användarens position på kartan.



<!--more-->



Vi kommer dessutom titta på hur vi kan använda webpack till mer än bara att bygga våra JavaScript filer. Vi kommer importera både CSS och bild filer i JavaScript och filerna blir en del av vår byggda filer.

Exempelprogrammet från denna övning finns i kursrepot [example/gps](https://github.com/dbwebb-se/webapp/tree/master/example/gps) och i `example/gps`. Använd det gärna tillsammans med övningen för att se hur de olika delarna hänger ihop. En del kod utelämnas i exemplet för att det ska vara mer lättläst i artikeln.



En karta {#karta}
--------------------------------------
Vi kommer i detta exemplet använda leaflet.js för att visa upp en karta i vår mobila enhet och för att rita ut markörer på denna karta. Vi skapar en Cordova app i katalogen `me/kmom06/gps` precis som vi har gjort tidigare kursmoment. Vi installerar mithril och webpack och skapar en mithril app i `www` katalogen.

```bash
# stå i me/kmom06/gps
cordova create . se.dbwebb.gps GPS
npm install --save mithril
npm install --save-dev webpack webpack-cli
touch webpack.dev.config.js webpack.prod.config.js
```

I `webpack.dev.config.js` och `webpack.prod.config.js` är vår konfiguration ungefär som vanligt, men vi kommer se senare varför vi inte har med `/dist` katalogen som vanligt. En skillnad mot tidigare är att vi inte har med `CleanWebpackPlugin` vilket beror på hur vi sedan använder kartan `leaflet`. Vi börjar dock med att enbart titta på `webpack.dev.config.js`.

```javascript
// webpack.dev.config.js

const path = require("path");

module.exports = {
    entry: './www/js/index.js',
    mode: 'development',
    devtool: 'inline-source-map',
    output: {
        path: path.resolve(__dirname, 'www'),
        filename: 'bundle.min.js'
    }
};

```

Vi rensar ut i `www/index.html` och har kvar nedanstående, notera att jag har tagit bort CSS filen i head och rensat ut Cordovas Hello World exempelkod.

```html
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Security-Policy" content="default-src 'self' data: gap: https://ssl.gstatic.com 'unsafe-eval'; style-src 'self' 'unsafe-inline'; media-src *; img-src 'self' data: content:;">
        <meta name="format-detection" content="telephone=no">
        <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width">
        <link href="css/index.css" rel="stylesheet">
        <title>GPS</title>
    </head>
    <body>

        <script type="text/javascript" src="cordova.js"></script>
        <script type="text/javascript" src="bundle.min.js"></script>
    </body>
</html>
```

I filen `js/index.js` som är ingångspunkten för vår app väntar vi in att enheten är redo och sen använder vi `m.mount()` för att ladda den enda vyn i appen `map.js`.

```javascript
"use strict";

import m from "mithril";
import mapView from "./views/map.js";

const app = {
    initialize: function() {
        document.addEventListener('deviceready', this.onDeviceReady.bind(this), false);
    },
    onDeviceReady: function() {
        m.mount(document.body, mapView);
    },
};

app.initialize();
```

Vi installerar nu leaflet med hjälp av npm.

```bash
npm install --save leaflet
```

I vyn `map.js` importerar vi `leaflet.js`, sedan definieras `view`-funktionen, vi vill här ha en rubrik och en `div` där kartan ska visas. Klassen `.map` används för att ge kartan en bredd och en höjd. **Viktigt att explicit ge kartan en höjd i pixlar eller rem i din CSS fil annars visas den inte**. ID't `#map` används av JavaScript för att hämta ut rätt element.

```javascript
"use strict";

import m from "mithril";
import L from "leaflet";

const mapView = {
    view: function() {
        return [
            m("h1", "Map"),
            m("div#map.map", "")
        ];
    }
};

export default mapView;
```

Vi använder sedan livscykel funktionen `oncreate` för att anropa funktionen `showMap` som ritar upp kartan och även ett antal markörer som visar platser baserad på koordinater. Funktionen `oncreate` anropas efter att vyn har renderats och vi använder `oncreate` då `div#map.map` måste finnas tillgänglig när vi börjar använda `leaflet`.

```javascript
"use strict";

import m from "mithril";
import L from "leaflet";

const mapView = {
    oncreate: showMap,
    view: function() {
        return [
            m("h1", "Map"),
            m("div#map.map", "")
        ];
    }
};

export default mapView;
```

Funktionen `showMap` ligger som en vanlig JavaScript funktion och inte som en del av det vi exporterar i mithril kontext. Detta är en av de stora fördelarna med mithril att allt "bara" är vanlig JavaScript och att vi därför kan varva mithril med vanliga JavaScript funktioner. I `showMap` funktionen definieras ett objekt med platser i Karlskrona som sedan används för att rita ut markörerna och centrera kartan runt en av platserna. Jag har valt att definiera variabeln `map` som en global variabel i filen `js/views/map.js`, då den används i flera olika funktioner, se exempelprogrammet.

```javascript
function showMap() {
    var places = {
        "BTH": [56.181932, 15.590525],
        "Stortorget": [56.160817, 15.586703],
        "Hoglands Park": [56.164077, 15.585887],
        "Rödebybacken": [56.261121, 15.628609]
    };

    map = L.map('map').setView(places["BTH"], 13);

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',    {
        attribution: `&copy;
        <a href="https://www.openstreetmap.org/copyright">
        OpenStreetMap</a> contributors`
    }).addTo(map);

    for (var place in places) {
        if (Object.prototype.hasOwnProperty.call(places, place)) {
            L.marker(places[place]).addTo(map).bindPopup(place);
        }
    }
}
```

Vi skapar en karta (`map`) där vi definierar vilken punkt vi vill ha som centrum och även hur långt vi har zoomat in. Vi lägger sedan till vilka bilder vi vill använda som **tiles** i kartan. Jag väljer att använda OpenStreetMaps tiles, men det finns en uppsjö av andra man kan använda, se [Dokumentationen](https://leafletjs.com/plugins.html#basemap-providers) för fler tiles.

Vi lägger nu till plattformen browser i vårt Cordova projekt, vi kompilerar mithril appen och kör igång appen med följande kommandon, som vi känner igen från förra kursmomentet.

```bash
# stå i me/kmom06/gps
cordova platform add browser --save
npm start
cordova run browser
```

Vi ser att vi direkt får problem med CSP då vi inte kan ladda bilderna som ska bygga upp  och åtgärder det genom att lägga till `https://*.tile.openstreetmap.org` efter `'self'` i img-src delen av CSP. Nu kan vi ladda bilderna men ser att bilderna som används som markörer saknas och bilderna hamnar lite konstigt då vi inte har laddat leaflet CSS filerna. Vi laddar dessa genom att importera i vår JavaScript med hjälp av webpack. Längst upp i `js/views/map.js` ändrar vi till följande.

```javascript
"use strict";

import m from "mithril";
import L from "leaflet";

import "leaflet/dist/leaflet.css";
import "leaflet/dist/images/marker-icon-2x.png";
import "leaflet/dist/images/marker-icon.png";
import "leaflet/dist/images/marker-shadow.png";

var map;
```

Vi testar att bygga koden med kommandot `npm start` och får då en hel del fel relaterat till att webpack inte kan hitta en `appropriate loader to handle this file type`. Låt oss installera tre olika loaders som kan hantera dessa filer och sedan konfigurera så att filerna tas hand om av de olika loaders.

```bash
# stå i me/kmom06/gps
npm install --save-dev style-loader css-loader
npm install --save-dev file-loader
```

`style-loader` och `css-loader` är loaders som tar hand om CSS och `file-loader` kommer hantera bilderna. I vår `webpack.config.js` fil lägger vi till två objekt i en arrayen `module.rules` vår webpack konfiguration. Vi ser även till att ändra output katalogen så att bilderna kan laddas utan att ändra laddningskatalog i leaflet.

```javascript
const path = require("path");

module.exports = {
    entry: './www/js/index.js',
    mode: 'development',
    devtool: 'inline-source-map',
    output: {
        path: path.resolve(__dirname, 'www'),
        filename: 'bundle.min.js'
    },
    module: {
        rules: [
            {
                test: /\.css$/,
                use: [
                    'style-loader',
                    'css-loader'
                ]
            },
            {
                test: /\.(png|svg|jpg|gif)$/,
                use: [
                    {
                        loader: 'file-loader',
                        options: {
                            name: '[name].[ext]',
                        },
                    },
                ]
            }
        ]
    }
};
```

De två regler vi lägger till säger helt enkelt: matcher filtypen en av följande använd denna loader för att ladda filen. Vi kan nu köra `npm start` igen och denna gången ser vi att bygget går bra och att en ett antal olika filer skapas. Vi kan nu köra `cordova run browser` och nu börjar det likna nått.

Anledningen till att vi inte använder `CleanWebpackPlugin` är att `leaflet` per automatik laddar filer från samma katalog som `index.html`. Hade vi rensat den katalogen hela tiden hade vi behövt lägga till filerna igen varje gång.



Använda adress istället för koordinater {#address}
--------------------------------------
Vi har inte alltid tillgång till koordinater för de platser vi vill visa upp på kartan. Och då är det bra om vi istället kan använda adressen. Vi vill därför göra om adresser till koordinater och för det använder vi npm modulen `leaflet-geosearch`, som installeras med kommandot `npm install leaflet-geosearch --save`.

Vi börjar med att importera och skapa ett `OpenStreetMapProvider` objekt `geocoder` och även ett objekt med adresser istället för positioner. Vi använder sedan vår `geocoder` för att göra om en adress till koordinater och ritar ut en markör på rätt plats. Om `geocoder` inte lyckas koda om adressen ritas inte ut en plats. Bäst resultat får man om man inte har allt för specifika adresser, man kan till exempel utelämna post nummer.

```javascript
...

import { OpenStreetMapProvider } from "leaflet-geosearch";

...

function showMap() {
    ...

    var geocoder = new OpenStreetMapProvider();

    var addresses = [
        "Bastionsgatan 1, Karlskrona",
        "Kärleksstigen 1, Karlskrona"
    ];

    for (var i = 0; i < addresses.length; i++) {
        geocoder
            .search({ query: addresses[i] })
            .then(function(result) {
                if (result.length > 0) {
                    L.marker([result[0].y, result[0].x]).addTo(map).bindPopup(result[0].label);
                }
            });
    }
}
```

Vi behöver även lägga till `https://nominatim.openstreetmap.org` under default-src i vår CSP i `index.html` för att vi ska kunna hämta hem resultat från `leaflet-geosearch`.



Användarens position {#gps}
--------------------------------------
Då vi använder en mobil enhet med tillgång till GPS har vi möjlighet att ta reda på användarens nuvarande position och rita ut detta på kartan.

Vi använder oss av pluginen `cordova-plugin-geolocation`.

```bash
# Stå i me/kmom06/gps
cordova plugin add cordova-plugin-geolocation
```

För att använda position på iOS enheter lägger vi till följande i `config.xml`.

```xml
<edit-config file="*-Info.plist" mode="merge" target="NSLocationWhenInUseUsageDescription">
    <string>I will use your GPS position to show on a map.</string>
</edit-config>
```

Vi har nu tillgång till objektet `navigator.geolocation`. Vi använder funktionen `navigator.geolocation.getCurrentPosition()` för att få nuvarande position. För att hämta nuvarande position skapar vi en modell `models/position.js`, när vi har lyckats hämta nuvarande position ritar vi om vyn med hjälp av `m.redraw()`.

```javascript
// models/position.js
"use strict";

import m from "mithril";

const position = {
    currentPosition: {},

    getPosition: function() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(
                position.geoSuccess,
                position.geoError
            );
        }
    },

    geoSuccess: function(pos) {
        position.currentPosition = pos.coords;
        m.redraw();
    },

    geoError: function(error) {
        console.log('code: '    + error.code    + '\n' +
              'message: ' + error.message + '\n');
    }
};

export default position;
```

I funktionen `getPosition()` kollar vi först om vi har tillgång till `navigator.geolocation` och anropar sedan `navigator.geolocation.getCurrentPosition()`. Beroende på utfallet av den funktionen anropas antigen `geoSuccess` eller `geoError`. I `geoSuccess` sätter vi den nuvarande position och ritar om vyn.

I vyn använder vi `oninit` livscykel-metoden för att anropa `getPosition` i modellen.

```javascript
const mapView = {
    oninit: position.getPosition,
    oncreate: function() {
        showMap();
    },
    view: function() {
        showPosition();
        return [
            m("h1", "Map"),
            m("div#map.map", "")
        ];
    }
};

export default mapView;
```

I `showMap` funktionen lägger vi till en ny sorts markör som markerar användarens position. Jag har skapat en ikon för att visa användarens position. Du kan kopiera ikonen med följande kommando. Du kan naturligtvis använda en egen ikon också.

```bash
# Stå i kursrepot
cp example/gps/www/location.png me/kmom06/gps/www
```

Vi skapar nu leaflet ikonen `locationMarker` genom att först importera bilden i JavaScript och sedan skapa en ny ikon i leaflet.


```javascript
import locationIcon from "../../location.png";

var locationMarker = L.icon({
    iconUrl: locationIcon,
    iconSize:     [24, 24],
    iconAnchor:   [12, 12],
    popupAnchor:  [0, 0]
});
```

Och vi skapar funktionen `showPosition()` där vi sätter positionen för vår markör `locationMarker`.

```javascript
function showPosition() {
    if (position.currentPosition.latitude && position.currentPosition.longitude) {
        L.marker(
            [position.currentPosition.latitude, position.currentPosition.longitude],
            {icon: locationMarker}
        ).addTo(map).bindPopup("Din plats");
    }
}
```

Vi avslutar detta exempel genom att skapa konfigurationen för produktionsfilerna med hjälp av webpack och filen `webpack.prod.config.js`.

```javascript
const path = require("path");

module.exports = {
    mode: 'production',
    entry: './www/js/index.js',
    output: {
        path: path.resolve(__dirname, 'www'),
        filename: 'bundle.min.js'
    },
    module: {
        rules: [
            {
                test: /\.css$/,
                use: [
                    'style-loader',
                    'css-loader'
                ]
            },
            {
                test: /\.(png|svg|jpg|gif)$/,
                use: [
                    {
                        loader: 'file-loader',
                        options: {
                            name: '[name].[ext]',
                        },
                    },
                ]
            }
        ]
    }
};
```



Avslutningsvis {#avslutning}
--------------------------------------
Vi har i denna artikel använd oss av OpenStreetMap och leaflet.js för att placera ut markörer på en karta på specifika platser. Vi har även tittat på hur vi kan använda `cordova-plugin-geolocation` för att rita ut användarens position på kartan.

Vi har även tittat lite ytterligare på hur webpack kan hjälpa oss med att bygga våra appar.

Om du har frågor eller tips så finns det en särskild [tråd i forumet](t/7350) om denna artikeln.

Exempelprogrammet från denna övning finns i kursrepot [example/gps](https://github.com/dbwebb-se/webapp/tree/master/example/gps) och i `example/gps`.
