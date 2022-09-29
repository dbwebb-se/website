---
author:
  - lew
revision:
  "2022-09-23": (B, lew) Uppdaterad inför HT22.
  "2019-03-26": (A, lew) Ny inför HT19.
...

# Kmom05: Docker network

Nu har vi kontroll på hur vi kan hantera en webbserver i Docker. Vi tar ett steg till in i Bashprogrammeringen och bygger ett script som kan prata med en server.

Du kommer få en färdig server, skriven i Node.js, och ett RESTful API till servern. Servern implementerar en [_maze_](https://en.wikipedia.org/wiki/Maze). Servern är färdig och du kan testköra den via kommandot curl.

Din uppgift är att bygga en bash-klient till servern, enligt en kravspecifikation. Din klient skall använda servern för att lösa mazen. Vi lägger in klienten och servern i Docker-kontainrar och låter de prata med varandra med hjälp av "Docker network", där vi låter Docker skapa ett eget nätverk.

Vi ska även kika lite på reguljära uttryck med hjälp av en labb.

Så är upplägget. Låt se hur bra vingarna bär. Upplägget på detta kursmomentet är "lite friare", så vi går nästan rakt på själva uppgiften.

<!--more-->

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>

### Video {#video}

Till kursen finns en [videoserie](https://www.youtube.com/playlist?list=PLKtP9l5q3ce_XueavhyZ_udFDLVFaoVo5). Titta på videorna som börjar med 05.

### Lästips {#lastips}

Läs lite om [Docker network](https://docs.docker.com/network/).

## Övningar & Uppgifter {#ovningar_uppgifter}

_(ca: 8-14 studietimmar)_

### Övningar {#ovningar}

1. Läs om "[Docker network](guide/docker/docker-network) i guiden".

1. Luta dig mot guiden "[kom igång med Bash](guide/kom-igang-med-bash)".

1. Läs artikeln om "[Regulära uttryck](kunskap/regex)".

1. Läs stycket om verktyget "sed" i artikeln ["Text processering"](kunskap/text-processering#sed).

### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften [lab3 (sed1)](uppgift/vlinux-lab-sed1) för att träna upp grundläggande färdigheter i sed och reguljära uttryck.

1. Gör uppgiften "[Mazerunner i bash](uppgift/mazerunner-i-bash)". Du sparar ditt arbete under mappen `kmom05/maze/`.

1. Lägg till redovisningstexten i din me-sida.

<!-- 1. Skapa ett exekverbart Bash-skript, `maze/kmom05.bash`.
   Så här kan det se ut när du är klar. -->

[ASCIINEMA src=363527]

### dockerhub.bash {#dockerhub-bash}

1. Skapa ett Bash-script, `kmom05/dockerhub.bash`, Skriptet ska göra följande:
   - Skapa ett nätverk med namet `dbwebb`.
   - Starta upp båda kontainrarna med rätt options.
   - Servern ska även kunna nås via webbläsaren och port 8080. (localhost:8080)
   - Båda containrarna ska ha egna namn.
   - Server-containern ska köras i bakgrunden.
   - Klienten ska använda serverns namn. Du behöver då byta ut "localhost" i skriptet mot namnet du ger servern.
   - Klient-containern ska starta i Bash och i den arbetsmappen du har skriptet i.
   - Stoppa den/de containrar som är igång och ta bort nätverket.

[YOUTUBE src=efQrbQhGN4M width=639 caption="Har du fått med alla delar?"]

### Testa din inlämning {#test}

Du kan köra vissa tester på din inlämning och se om de delarna uppfyller kraven. Rättningen kommer endast genomföras om testerna går igenom.

```console
$ dbwebb test kmom05
```

## Resultat & Redovisning {#resultat_redovisning}

_(ca: 1-2 studietimmar)_

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

- Hur kändes det att skriva ett litet större bash-skript? Var det något som var mer eller mindre utmanande och tidskrävande?
- Kikade du på källkoden till maze-servern? Har du några reflektioner kring den?
- Gjorde du nåt speciellt i din mazerunner som du vill lyfta fram?
- Vad tycker du om regex så här långt?
- Känner du att du är med på grunderna i verktyget sed?
