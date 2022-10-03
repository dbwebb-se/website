---
author: lew
category:
  - Bash
  - Docker
  - Docker Compose
  - linux
revision:
  "2022-09-28": (B, lew) Uppdaterad inför HT22.
  "2019-05-06": (A, lew) Ny inför HT19.
...

# Uppdatera mazen med en loop

Du ska utgå ifrån mazerunnern du skapade i kursmoment 05. Tanken är att skriptet ska kunna köras med kommandot `./mazerunner.bash loop` och hålla sig i spelet tills man avslutar eller nått sista rummet.

<!--more-->

## Förkunskaper {#forkunskaper}

Du har gått igenom delen i guiden som handlar om [Docker compose](guide/docker/docker-compose).
Du har färdigställt uppgiften [mazerunner i Bash](uppgift/mazerunner-i-bash).
Du har koll på [Bash-guiden](guide/kom-igang-med-bash).

## Introduktion {#intro}

Som introduktion kan vi kika på exemplet igen. Ta gärna en fundering på hur programmet struktureras och hur man kan lösa uppgiften med så få rader som möjligt. Om man har en god struktur på koden från föregående kursmoment så behövs inte mycket handpåläggning för att skapa en spel-loop.

[ASCIINEMA src=250794]

## Krav {#krav}

Kraven består av två delar. Först jobbar vi med Mazerunnern från kursmoment 5. Den här gången kan vi utgå ifrån samma Dockerfile och i slutändan ger vi den uppdaterade imagen en ny tagg `:loop`. Servern kan vi återanvända (om du inte väljer att ändra i den). Den andra delen handlar om att skapa en _docker-compose.yml_ som sköter uppstarten av både servern och klienten samt skapar nätverket de ska använda sig utav.

Börja med att ta en kopia av mazerunnern:

```
# Ställ dig i kursrepot
$ cp -ri me/kmom05/maze/ me/kmom06/maze2/
```

### Mazerunner med loop (del 1) {#del1}

1. Utöka funktionaliteten i `client/mazerunner.bash` så att allt sker i en loop när man startar programmet med `./mazerunner.bash loop`. Skriptet skall börja med att initiera ett nytt spel och visa vilka kartor som finns. Spelaren kan då välja en karta varpå spelaren träder in i första rummet. Därefter fortsätter loopen och väntar på att spelaren skriver in riktningen north, south, east, west, info för rumsinformation, help för en hjälptext eller quit för att avsluta.

1. Bygg om din image och tagga den med `:loop` (_username/vlinux-mazeclient:loop_). Publicera den på Docker Hub.

### Docker Compose (del 2) {#del2}

Skapa filen `docker-compose.yml` i mappen `maze2/`.

1. Skapa ett nätverk (bridge).

1. Det ska finnas två services, _server_ och _client_, som hanterar respektive container.

1. Klienten ska nå servern via ett eget namn.

1. För att starta ett spel ska följande kommandon exekveras:
   - `$ docker-compose up -d server`
   - `$ docker-compose run client` (kör containern och scriptet med kommandot _loop_)
   - `$ docker-compose down` (stänger ned servern och klienten)

Om allt startar och stängs ned som det ska är du färdig.

<!-- 1. Servern ska läggas till som en volym. -->

### Validera och publicera {#publish}

Validera och publicera din kod enligt följande.

```bash
# Ställ dig i kurskatalogen
$ dbwebb validate maze2
```

```bash
# Ställ dig i kurskatalogen
$ dbwebb publish maze2
```

Rätta eventuella fel som dyker upp och publicera igen. När det ser grönt ut så är du klar.

## Extrauppgift {#extra}

Det finns ingen extrauppgift.

## Tips från coachen {#tips}

Strukturera din kod med funktioner i bash. Då får du en bra struktur i första delen och i andra delen så kan du återanvända funktionerna.

Lycka till och hojta till i forumet om du behöver hjälp!
