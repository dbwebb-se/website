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



En start {#start}
--------------------------------------

Vi börjar med att lägga till `socket.io`-klienten i vår index.html, lägg den innan du laddar `main.js`-filen.

```html
    <script src="https://cdn.socket.io/4.7.5/socket.io.min.js"></script>
```

Sedan definierar vi ett `customElement` i `main.js` med följande kod:

```javascript
import ChatForm from "./components/chat-form.js";

customElements.define("chat-form", ChatForm);
```

Vilket gör det möjligt att använda oss av `<chat-form></chat-form>` i vår kod. Så låt oss ta en titt på den komponenten.



Vår chatt-komponent {#component}
--------------------------------------

I komponenten börjar vi med att skriva ut ett fält för att skriva i, en knapp för att skicka meddelanden och en `div` för att kunna visa upp alla meddelanden, som kommer skickas båda från din klient och alla andras klienter.

```javascript
/* global io */

export default class ChatForm extends HTMLElement {
    constructor() {
        super();
    }

    connectedCallback() {
        this.innerHTML = `<textarea class="message-textarea" id="message-textarea"></textarea>

        <button class="message-button" id="message-button">Send</button>

        <h2>Sent messages</h2>
        <div id="messages"></div>`;

        window.addEventListener("load", () => {
            this.init();
        }, false);
    }

    init() {

    }
}
```

När vyn har laddats anropar vi sedan `init`-funktionen, som är den funktionen som kommer initiera socketen. Här börjar vi med att skapa socket objektet utifrån vår `io`-instans. Vi skickar här med URL'n till den server vi vill koppla oss mot. Sedan ser vi till att vi har tillgång till de element vi skapade i `connectedCallback` ovan.

Varje gång knappen för att skicka meddelanden trycks vill vi skicka iväg ett meddelande till socket-servern. Det gör vi med `socket.emit` ([Dokumentation](https://socket.io/docs/v3/emit-cheatsheet/#client-side)), där första argumentet är ett namn för det event vi skickar och andra argumentet är värdet.

```javascript
init() {
    const socket = io("https://lager-chat.emilfolino.se");

    const textarea = document.getElementById("message-textarea");
    const button = document.getElementById("message-button");
    const messages = document.getElementById("messages");

    button.addEventListener("click", function(event) {
        event.preventDefault();

        if (textarea.value) {
            socket.emit('chat message', textarea.value);
            textarea.value = '';
        }
    });

    socket.on('chat message', (msg) => {
        const item = document.createElement('p');

        item.textContent = msg;

        messages.prepend(item);
    });
}
```

För att vi även ska kunna ta emot meddelanden från socket-servern vill vi även skapa en "lyssnare" för `chat messsage` händelser. Vi använder `socket.on`-funktionen för detta. Callback-funktionen får här in meddelandet som argument och vi kan sedan använda det för att skriva ut det i `messages`-diven.



Skicka objekt {#objects}
--------------------------------------

I kodexemplet skickar vi enbart en sträng som värde med hjälp av `emit`, men det går lika bra att skicka mer avancerade datatyper som till exempel objekt.

```javascript
const message = {
    sender: "Emil",
    test: "Coolt med sockets!",
};

socket.emit('chat message', message);
```


Avslutningsvis {#avslutning}
--------------------------------------

Vi har i denna övning tittat på hur vi kan använda `socket.io` för att kommunicera i realtid mellan ett antal olika klienter.

Exempelkod för denna övningen finns i kursrepot under [example/chat](https://github.com/dbwebb-se/webapp/tree/master/example/chat).
