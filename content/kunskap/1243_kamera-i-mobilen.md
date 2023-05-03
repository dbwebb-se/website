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



Exempelprogrammet från denna övning finns i kursrepot [example/camera](https://github.com/dbwebb-se/webapp/tree/master/example/camera) och i `example/camera`. Använd det gärna tillsammans med övningen för att se hur de olika delarna hänger ihop. En del kod utelämnas i exemplet för att det ska vara mer lättläst i artikeln. Finns inte `example/camera`-katalogen gör en `dbwebb update`.



Kamera i webbläsaren {#camera}
--------------------------------------

Låt oss ta en titt på Web API:t [MediaDevices](https://developer.mozilla.org/en-US/docs/Web/API/MediaDevices/getUserMedia) och se hur vi med hjälp av funktion getUserMedia kan ta en bild.

Vi börjar med att skapa en komponent `CameraComponent` i filen `components/camera.js`.

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
            this.startup();
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
        () => {
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
            this.takepicture(canvas, video, width, height);
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

    this.clearphoto(canvas);
}
```

De resterande funktionerna i klassen finns nedan. I `takepicture` ritar vi ut en frame från videon som en bild i `canvas`-elementet. Sedan tar vi data och skapar det som kallas en [dataUrl](https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/Data_URLs). Det är en lång base64-encoded sträng som beskriver bilden pixel för pixel. Vi sparar denna data i vår instansvariabel. `clearphoto` rensar `canvas`-elementet och sätter det till en mellangrå färg. Den kan vi se från första början på sidan.

```javascript
takepicture(canvas, video, width, height) {
    const context = canvas.getContext("2d");

    if (width && height) {
        canvas.width = width;
        canvas.height = height;
        context.drawImage(video, 0, 0, width, height);

        this.photoData = canvas.toDataURL("image/png");
    } else {
        this.clearphoto(canvas);
    }
}

clearphoto(canvas) {
    const context = canvas.getContext("2d");

    context.fillStyle = "#AAA";
    context.fillRect(0, 0, canvas.width, canvas.height);

    this.photoData = canvas.toDataURL("image/png");
}
```



Foto API {#foto-api}
--------------------------------------

För att vi ska kunna spara undan bilderna behöver vi en plats att spara undan de på. Vi väljer UploadCare då det är gratis (upp till 5,000 uploads / mo, 15 GB traffic / mo, 1 GB storage) och det finns ett trevligt uppladdnings-API. Vi börjar med att gå till [webbplatsen](https://app.uploadcare.com/accounts/signup/) för tjänsten och registrerar oss. Sedan när vi har kommit in i tjänsten kopierar vi Public key från denna sidan, se till att välja API keys ute till vänster.

![Upload care key](image/webapp/webapp-uploadcare-key.png)

Vi kan sedan installera `upload-client` som vi sedan kan använda för att ladda upp bilder till API:t.

```bash
npm install @uploadcare/upload-client
mkdir uploadcare
cp node_modules/@uploadcare/upload-client/dist/esm/index.browser.mjs uploadcare/index.browser.min.js
```

Vi importerar sedan `upload-client` längst upp i filen `components/camera.js` med raden `import { UploadClient } from "../uploadcare/index.browser.min.js";`. De med skarpa ögen såg att vi hade lagt till en `eventListener` på `sendbutton` i `startup()`, den anropar funktionen `sendpicture`.

```javascript
async sendpicture() {
    const blob = await (await fetch(this.photoData)).blob();

    const client = new UploadClient({ publicKey: '[INSERT API-KEY]' });

    const fileInfo = await client.uploadFile(blob);
    const cdnUrl = fileInfo.cdnUrl;

    console.log(cdnUrl);
}
```

I ovanstående funktionen tar vi först och gör om vår dataUrl till en [blob](https://developer.mozilla.org/en-US/docs/Web/API/Blob). Sedan initierar vi en `UploadClient` med vår API-nyckel vi kopierade från UploadCare-webbplatsen tidigare. Sedan laddar vi upp filen (kan ta en stund) och får tillbaka en url till bilden.



Avslutningsvis {#avslutning}
--------------------------------------

Vi har i denna artikel använt oss av Web API:t MediaDevices för att ta bilder med våra mobila enheter. Vi har även använt ett Foto-API för att spara undan bilderna.

Exempelprogrammet från denna övning finns i kursrepot [example/camera](https://github.com/dbwebb-se/webapp/tree/master/example/camera) och i `example/camera`.
