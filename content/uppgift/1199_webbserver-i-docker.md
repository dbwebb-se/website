---
author: lew
revision:
  "2022-06-22": (B, lew) Uppdaterad inför HT22.
  "2019-04-11": (A, lew) Första utgåvan inför HT19.
...

# En webbserver i Docker

Du skall skapa en Docker image och publicera den till Docker Hub.
Imagen ska vara en webbserver som ska kunna svara på en uppsättning routes och returnera JSON.

<!--more-->

## Förkunskaper {#forkunskaper}

Du har läst igenom guiden [Hantera applikationer](guide/docker/hantera-applikationer) och valt ett språk du vill använda. Kika gärna på alla, då det kan göras på olika sätt.

Du har läst kurslitteraturen och skaffat dig grundläggande kunskaper om bash.

## Introduktion {#intro}

I exempelmappen finns en [JSON-fil](https://github.com/dbwebb-se/vlinux/tree/master/example/json) som ska servas med hjälp av en router, byggd i språket du valt. Du väljer själv hur du vill sköta "routingen".

<!-- Om du vill köra med PHP, finns en [minimal router](https://github.com/dbwebb-se/vlinux/tree/master/example/php-router) i exempelmappen du kan utgå ifrån. Tips finns i tillhörande README.md-fil. -->

Routes som ska stödas är:

| Route            | Vad skall returneras                          |
| ---------------- | --------------------------------------------- |
| `/`              | En presentation av de olika routesen.         |
| `/all`           | Hela JSON-filen.                              |
| `/names`         | Namnen på alla växterna.                      |
| `/color/<color>` | Alla växter som kan ha &lt;color&gt; som färg |

JSON-filen kopierar du från exempelmappen:

```bash
# Ställ dig i kursroten
$ cp -r example/json/items.json me/kmom04/server/data/
```

## Krav {#krav}

Du ska i den här uppgiften mestadels jobba i mappen `kmom04/server/`.

1. Bygg en server som kan svara på "routsen" ovan. Alla svar ska vara JSON.

1. Skapa en Dockerfile `Dockerfile` och lägg till din server i arbetsmappen `/server`. JSON-filen ska inte kopieras in, utan ska läggas till som en volym.

1. Publicera din image med namnet _username/vlinux-server:1.0_ där du använder ditt egna användarnamn. Se till så imagen är publik.

1. Publicera imagen till Docker Hub.

1. Publicera uppgiften enligt följande.

```bash
# Ställ dig i kurskatalogen
$ dbwebb publish server
```

Rätta eventuella fel som dyker upp och publicera igen. När det ser grönt ut så är du klar.

## Extrauppgift {#extra}

Det finns inga extrauppgifter.

## Tips från coachen {#tips}

Lycka till och hojta till i chatten om du behöver hjälp!
