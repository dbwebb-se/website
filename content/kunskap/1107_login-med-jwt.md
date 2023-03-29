---
author: efo
category: javascript
revision:
  "2018-02-07": (A, efo) Första utgåvan inför kursen webapp v3.
...
Login med JWT
==================================

[FIGURE src=/image/webapp/padlock.png?w=c5 class="right"]

Vi har i tidigare kurser och i andra programmeringsspråk hanterat inloggning med hjälp av sessioner. I denna övning ska vi titta på ett sätt att autentisera våra klienter mot servern utan sessioner. Detta ger oss vissa fördelar som att vi har inbyggda utlöpstider och att det underlättar om vi vill skala upp vårt API, samtidigt som det ger ett säkert sätt att identifiera klienterna på.

I denna övning tittar vi på hur vi med hjälp av Postman registrerar en användare, loggar in som denna användare och får en JSON Web Token (JWT). Sist i övningen tittar vi på hur vi med hjälp av JWT kommer åt funktioner i Lager API:t som ligger skyddade.



<!--more-->



Registrering och inloggning {#login}
--------------------------------------

Vi börjar med att registrera en användare i Lager API:t genom att skicka en `POST` till URL'en `/v2/auth/register` med 3 parametrar i `body`: `api_key`, `email` och `password`. Detta kan till exempel göras med Postman eller som en POST request från JavaScript.

Vi får följande svar från Lager API:t:

```json
{
    "data": {
        "message": "User successfully registered."
    }
}
```

När vi sedan vill logga in som den nyss registrerade användaren gör vi det genom att skicka en `POST` till URL'en `/v2/auth/login` med de samma 3 parametrar i `body`: `api_key`, `email` och `password`.

Vi får följande svar från Lager API:t. `token` i det nedanstående data objektet är den JSON web token vi har fått tillbaka från API:t.

```json
{
    "data": {
        "type": "success",
        "message": "User logged in",
        "user": {
            "api_key": "...",
            "email": "new@example.com"
        },
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhc...NzczfQ.zUUd...KHTkM"
    }
}
```



Använda JSON Web Tokens {#jwt}
--------------------------------------

Vi ser att svaret från Lager API:t innehåller attributet `token` och detta är vår JWT som vi använder varje gång vi vill åt funktioner i API:t som ligger bakom skyddet. Vi skickar med `token` som `x-access-token` i HTTP-headern.


I fetch kan du skicka med headers på följande sätt.

```javascript
const response = await fetch("https://lager.emilfolino.se/v2/invoices?api_key=[YOUR_API_KEY]", {
    headers: {
      'x-access-token': [TOKEN]
    },
});
const result = await response.json();

```



### Exempelprogram {#example}

Jag har valt att skapa en modell `models/auth.js` som får hålla koll på om vi har en token eller ej. I modellen finns även de funktioner som står för logga in och registreing med hjälp av `fetch` till Lager-API:t.

```javascript
import { apiKey, baseURL } from "../utils.js";

const auth = {
    token: "",

    login: async function login (username, password) {
        const user = {
            email: username,
            password: password,
            api_key: apiKey
        };

        const response = await fetch(`${baseURL}/auth/login`, {
            body: JSON.stringify(user),
            headers: {
              'content-type': 'application/json'
            },
            method: 'POST'
        });

        const result = await response.json();

        if (result.data.type === "success") {
            auth.token = result.data.token;
            console.log(auth.token);
            return "ok";
        }

        return "not ok";
    },

    register: async function register (username, password) {
        const user = {
            email: username,
            password: password,
            api_key: apiKey
        };

        const response = await fetch(`${baseURL}/auth/register`, {
            body: JSON.stringify(user),
            headers: {
              'content-type': 'application/json'
            },
            method: 'POST'
        });

        const result = await response.json();

        if (result.data.message === "User successfully registered.") {
            return "ok";
        }

        return "not ok";
    },
};

export default auth;
```

Vi kan sedan i våra komponenter och vyer använda detta för att ge användare tillgång till de olika delar som i vanliga fall ligger bakom lås och bom.

Till exempel kan det se ut på följande sätt i faktura-vyn `views/invoices.js` där vi först kollar om användaren är inloggat annars ändrar vi `location.hash` för att istället visa login-vyn.

```javascript
import authModel from "../models/auth.js";

export default class InvoicesView extends HTMLElement {
    // connect component
    connectedCallback() {
        if (!authModel.token) {
            location.hash = "login";
        }

        this.render();
    }

    render() {
        this.innerHTML =    `<header class="header">
                                <lager-title title="Fakturor"></lager-title>
                             </header>
                             <main class="main">
                                <invoices-table></invoices-table>
                             </main>
                             `;
    }
}
```



Avslutningsvis {#avslutning}
--------------------------------------
Vi har i denna artikel använd oss av Postman för att registrera en användare och logga in med den användaren. Vi har även tittat på hur man kan använda `headers` som en del av ett anrop med `fetch`.
