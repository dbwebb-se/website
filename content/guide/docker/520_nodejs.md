---
author: lew
revision:
  "2023-09-12": "(B, lew) Uppdaterad inför HT23."
  "2019-04-12": "(A, lew) Första versionen."
...

# Nodejs

För att kunna köra javascript på serversidan behöver vi såklart installera det. Vi behöver då inte Apache, utan kan testa Node's egna server. Kanske till och med testa [Express](https://expressjs.com/). Vi kan börja med `$ docker search node` och se vad som dyker upp. Den översta ser lovande ut:

```
NAME    DESCRIPTION                                     STARS     OFFICIAL  AUTOMATED
node    Node.js is a JavaScript-based platform for s…   12891     [OK]
```

Innan vi börjar behöver vi även något att utgå ifrån. Du behöver såklart ha installerat nodejs och npm i din lokala miljö. Du bör ha det från tidigare kurs, annars finns anvisningar här: [Installera node och npm](https://dbwebb.se/kunskap/installera-node-och-npm).


_Se till att skapa en arbetsmapp lokalt så du inte är i tex roten. Vi kommer kopiera filer med `.` vilket tar alla filer i nuvarande mapp._

```
$ mkdir server
$ cd server
$ npm init
```

Det dyker upp några frågor, där det bara är att trycka ENTER för defaultvärdena. Nu har du en fil, `package.json`. Den behöver vi ha koll på då den ska med in i containern.

### Installera Express {#installera-express}

Vi installerar Express lokalt så vi kan testa applikationen.

```
$ npm install express
```

Utgångsläget blir då en package.json. Min ser ut så här:

```json
{
  "name": "vlinuxexpress",
  "version": "1.0.0",
  "description": "Example for vlinux",
  "main": "server/index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "Kenneth Lewenhagen",
  "license": "ISC",
  "dependencies": {
    "express": "^4.16.4"
  }
}
```



### index.js {#index-js}

Nästa steg är filen index.js. Jag tar koden i stort sett rakt av från [expressjs.com](https://expressjs.com/en/starter/hello-world.html).

```javascript
const express = require("express")
const app = express()
const port = 1337

app.get("/", (req, res) => res.send("Hello from inside Docker!"))

app.listen(port, () => console.log(`Example app listening on port ${port}!`))
```

Nu kan vi testa servern lokalt med `$ node index.js` och peka webbläsaren på `localhost:1337`.

### Dockerfile {#dockerfile}

Hur gör vi med Dockerfile då? Vi har filen package.json och mappen server/ att leka med.

```
FROM node:18

WORKDIR /server

COPY package*.json ./

RUN npm install

COPY index.js .

CMD [ "node", "index.js" ]
```

Vi bryter ned händelseförloppet.

**FROM node:18** talar om att vi vill använda imagen node med taggen 18. Den laddas ned automatiskt om den inte finns.
**WORKDIR /server** talar om att vi vill använda mappen server/ som startläge i containern. Allt vi gör efter utgår från den mappen.
**COPY package\*.json ./** kopierar in alla filer vars namn börjar med package och slutar med .json och lägger dem i arbetsmappen.
**RUN npm install** kör kommandot som använder package.json och installerar det som behövs, i detta fallet Express.
**COPY index.js .** kopierar in index.js till arbetsmappen.
**CMD [ "node", "index.js" ]**  startar servern när containern bootas upp.

### Bygga och köra {#build-n-run}

Nu har vi allt på plats för att bygga vår image...

`$ docker build -t username/imagename:tag .`

...och köra den:

`$ docker run --rm -p 1337:1337 username/imagename:tag`

Nu kan vi peka webbläsaren mot `localhost:1337`.
