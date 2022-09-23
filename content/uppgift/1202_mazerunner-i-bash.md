---
author: lew
category: vlinux
revision:
  "2022-06-22": (A, lew) Uppdatering inför HT22.
...

# Lös mazen med din mazerunner i bash

Du kommer få en färdig server, skriven i Node.js, och ett RESTful API till servern. Servern implementerar en _maze_. Servern är färdig och du kan testköra den via kommandot curl.

Din uppgift är att bygga en bash-klient till servern, enligt en kravspecifikation. Din klient skall använda servern för att lösa mazen.

<!--more-->

## Förkunskaper {#forkunskaper}

Du har gått igenom delen i guiden som handlar om [Docker network](guide/docker/docker-network).
Du har koll på [Bash-guiden](guide/kom-igang-med-bash).
Du har bekantat dig med programmet [curl](https://curl.haxx.se/).

## Introduktion {#intro}

Läs kort på Wikipedia om vad en [_maze_](https://en.wikipedia.org/wiki/Maze) kan vara. Möjligen kan det vara inspirerat av boken/filmen med samma namn, [The Maze Runner](https://sv.wikipedia.org/wiki/The_Maze_Runner).

<!--
Så här kan det se ut när du löser mazen med ditt skript.

[ASCIINEMA src=244037]

Så kan det alltså se ut. -->

### Om servern maze {#om}

Servern [maze finns i kursrepot](https://github.com/dbwebb-se/vlinux/tree/master/example/maze). Där finns all källkod och en specifikation över [serverns API](https://github.com/dbwebb-se/vlinux/blob/master/example/maze/api.md).

Börja med att översiktligt bekanta dig med serverns API.

Så här kan du starta servern.

```bash
# Gå till kursrepot
cd example/maze
node index.js
```

Du kan testa maze-servern med curl. Så här.

[ASCIINEMA src=243851]

Studera gärna källkoden till maze-servern. Hade du kunnat skriva den själv?

### Ta en kopia av Maze {#copy}

Börja med att ta en kopia av koden i `example/maze/`. Spara alla dina filer i katalogen `me/kmom05/maze/server/`.

```bash
# Gå till kursrepot
cp -ri example/maze/{api.md,index.js,maze.js,maps,router.js} me/kmom05/maze/server/
```

Nu är du redo att starta din egen variant av maze-servern.

Du startar servern med `$ node index.js`.

### Att spara spelets id till fil {#fil}

Din klient behöver komma ihåg spelets id och vilket rum du står i. Du sparar den informationen enklast i fil. För att du skall slippa hantera JSON med bash, så har servern en möjlighet att leverera svaren som en komma-separerad sträng.

Testa att köra följande kommandon mot servern så ser du skillnaden.

```bash
curl localhost:1337/map
curl localhost:1337/map?type=csv
```

Det är alltså `?type=csv` som kan underlätta för din bash-klient som kommer att behöva parsa innehållet.

## Krav {#krav}

Kraven består av två delar. Först skapar vi ett Bash-skript som körs mot servern. Sedan bygger vi in både servern och klienten i varsin container som pratar med varandra via ett eget nätverk.

### Bashscript för att lösa maze (del 1) {#del1}

1. Skapa ett skript `mazerunner.bash` i mappen `maze/client/`. Gör scriptet exekverbart.

1. Använd API:et för att lägga till följande funktioner i skriptet. Skriptet skall alltid skriva ut ett meddelande om det gick bra eller inte.

| Kommando                          | Vad skall hända                                      |
| --------------------------------- | ---------------------------------------------------- |
| `./mazerunner.bash init`          | Initiera ett spel och spara ned spelets id i en fil. |
| `./mazerunner.bash maps`          | Visa vilka kartor som finns att välja bland.         |
| `./mazerunner.bash select <#map>` | Välj en viss karta via siffra.                       |
| `./mazerunner.bash enter`         | Gå in i första rummet.                               |
| `./mazerunner.bash info`          | Visa information om rummet.                          |
| `./mazerunner.bash go north`      | Gå till ett nytt rum, om riktningen stödjs.          |
| `./mazerunner.bash go south`      | Gå till ett nytt rum, om riktningen stödjs.          |
| `./mazerunner.bash go east`       | Gå till ett nytt rum, om riktningen stödjs.          |
| `./mazerunner.bash go west`       | Gå till ett nytt rum, om riktningen stödjs.          |

Så här kan det se ut när du är klar.

[ASCIINEMA src=244037]

### Mazerunner i docker (del 2) {#del2}

Tanken är här att vi ska flytta in vår Mazerunner i Docker och de ska prata med varandra via ett eget nätverk. Allt ska starta via ett Bash-skript.

1. Skapa en Dockerfile i mappen `maze/server/` där du kopierar in din server i en container. Servern ska startas när containern startas. Bygg imagen och publicera den på Docker hub med namnet `username/vlinux-mazeserver:latest`. Byt ut _username_ mot ditt egna användarnamn.

1. Skapa en Dockerfile i mappen `maze/client/` där du kopierar in din Bash-klient. Bygg imagen och publicera den på Docker hub med namnet `username/vlinux-mazeclient:1.0`. Byt ut _username_ mot ditt egna användarnamn.

### Validera och publicera {#publish}

Validera och publicera din kod enligt följande.

```bash
# Ställ dig i kurskatalogen
$ dbwebb validate maze
```

Rätta eventuella fel som dyker upp och publicera igen. När det ser grönt ut så är du klar.

## Extrauppgift {#extra}

Det finns ingen extrauppgift.

## Tips från coachen {#tips}

Strukturera din kod med funktioner i bash. Då får du en bra struktur i första delen och i andra delen så kan du återanvända funktionerna.

Lycka till och hojta till i chatten om du behöver hjälp!
