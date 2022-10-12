---
author:
  - lew
revision:
  "2022-10-06": (C, lew) Klarmarkerade kmom10.
  "2022-10-04": (B, lew) Uppdaterad inför HT22.
  "2019-03-26": (A, lew) Ny inför HT19.
...

# Kmom10: Projekt och examination

Detta kursmoment avslutar och examinerar kursen.

Upplägget är enligt följande:

- Projektet och redovisning (20-80h)

Totalt omfattar kursmomentet (07/10) ca 20+20+20+20 studietimmar.

## Bedömning och betygsättning {#bedomning}

När du lämnat in projektet bedöms det tillsammans med dina tidigare redovisade kursmoment och du får ett slutbetyg på kursen. Läs om [grunderna för bedömning och betygsättning](kurser/bedomning-och-betygsattning).

## Projektidé och upplägg {#upplagg}

Du är nyanställd på firman BTH Server & Nätverk AB. De är osäkra på dina kunskaper och ger dig ett projekt som blivit liggande. De säger "Vi har en logg-fil från vår server, men den innehåller massa konstig information...Kan du hjälpa oss att plocka ut ip- och webbadresserna samt låta oss kunna filtrera dem?".

Du säger "Självklart. Finns det något att utgå ifrån?"

Du får en länk till en [katalog på en projektserver](https://github.com/dbwebb-se/vlinux/tree/master/example/proj). Sedan lämnar de dig åt ditt öde.

Du hittar alltså filen som är relaterad till projektet i ditt kursrepo under `example/proj`.

Du kikar snabbt i katalogen och väljer att fokusera på en server som söker i loggen. Det låter lagom stort. Då du inte vet vilken miljö de använder väljer du att bygga in applikationen i Docker.

## Projektspecifikation {#projspec}

Utveckla och leverera projektet enligt följande specifikationen. Saknas info i specen så kan du själv välja väg, dokumentera dina val i redovisningstexten.

De tre första kraven är obligatoriska och måste lösas för att få godkänt på uppgiften. De två sista kraven är optionella krav. Lös de optionella kraven för att samla poäng och därmed nå högre betyg. Om grundkraven inte når 30 poäng får man komplettera din inlämning och kan då max få 30 poäng.

Krav 1-3 (Grundkraven) ger max 10 poäng styck, totalt är det 30 poäng.
Krav 4 (Optionellt) ger max 10 poäng.
Krav 5 (Optionellt) ger max 20 poäng.

### Kataloger för redovisning {#var}

Samla alla dina filer för projektet i ditt kursrepo under `me/kmom10/bthloggen`.

Redovisningstexten skriver du som vanligt i `me/redovisa`.

### Krav 1 Regex för att konvertera loggfil till JSON {#k1}

Administrationen har fixat ett utdrag ur loggen. Du behöver plocka ut ip- och webbadresserna till en JSON-fil.

Du hittar logg-filen i ditt kursrepo under `example/proj/`. Informationen i filen ser ut ungefär så här:

```text
31.200.12.141 - - [17/Aug/2016:14:16:44 +0200] "GET /forum/viewforum.php?f=9 HTTP/1.0" 200 43595 "https://dbwebb.se/viewforum.php?f=9" "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.103 Safari/537.36"
1.208.61.234 - - [17/Aug/2016:13:56:33 +0200] "GET /community HTTP/1.1" 200 7763 "https://dbwebb.se/kurser" "Mozilla/5.0 (Windows NT 10.0; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0"
31.254.32.6 - - [17/Aug/2016:14:04:28 +0200] "GET /kurser/lektionsplan-och-rekommenderad-studieplan HTTP/1.0" 302 650 "-" "Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)"
...
```

Du behöver bara ta hänsyn till de rader som har både ip- och webbadress. Det skall omformas till JSON-fil enligt följande:

```text
[
    {
        "ip": "31.200.12.141",
        "url": "https://dbwebb.se"
    },
    {
        "ip": "1.208.61.234",
        "url": "https://dbwebb.se"
    },
    {
        "ip": "31.254.32.6",
        "url": "http://www.majestic12.co.uk"
    }
]
```

Börja med att kopiera logg-filen. Ställ dig i kursroten:

```
$ cp example/proj/access-50k.log me/kmom10/
```

Skapa ett Bash-script som automatiskt skapar en JSON-fil utifrån innehållet i logg-filen med hjälp av regex. Du får ta hjälp av verktygen vi gått igenom i kursen, tex sed och awk.

Döp ditt Bash-script till `bthloggen/log2json.bash`. När skriptet körs så skall det skapas en fil `bthloggen/data/log.json` som innehåller samtliga rader enligt strukturen ovan.

Använd ett onlineverktyg, tex [jsonlint](https://jsonlint.com/), för att kontrollera att du producerat JSON som validerar.

### Krav 2 Server för att servera loggen {#k2}

Här jobbar du i mappen `bthloggen/server/`.

Skapa en server i valfritt språk som kan visa och filtrera datan via följande routes. Alla svar skall vara i JSON.

| Route             | Resultat                                 |
| ----------------- | ---------------------------------------- |
| `/`               | Visa en lista av de routes som stöds.    |
| `/data/`          | Visa samtliga rader.                     |
| `/data?ip=<ip>`   | Visa raderna som innehåller &lt;ip&gt;.  |
| `/data?url=<url>` | Visa raderna som innehåller &lt;url&gt;. |

Spara koden för servern, och det som servern behöver, i en underkatalog `bthloggen/server`. Servern skall byggas in i en Dockercontainer som publiceras med _username/bthloggen-server:&lt;tag&gt;_.

Skapa en fil, `docker-compose.yml`, i mappen `bthloggen/` som kan starta servicen _server_.

Mappen `data/`, som innehåller logg-filen ska läggas till som en volym i docker-compose.

### Krav 3 Bashscript för att testa servern {#k3}

Här jobbar du i mappen `bthloggen/client/`.

Skapa en klient i Bash som kan köras mot servern. Börja med att skapa filen `bthloggen/client/bthloggen.bash` och gör den exekverbar. Följande kommandon ska fungera:

```text
Commands available:

url             Get url to view the server in browser.
view            List all entries.
view url <url>      View all entries containing <url>.
view ip <ip>       View all entries containing <ip>.
use <server>    Set the servername (localhost or service name).
```

Klienten skall stödja följande options:

```text
Options available:

-h, --help      Display the menu
-v, --version   Display the current version
-c, --count     Display the number of rows returned
```

Ett exempel på `-c` kan vara:

```
root@ef2d7f6842c0:/client# ./bthloggen.bash -c view url dbwebb
27108
```

Klienten skall byggas in i en Dockercontainer som publiceras med _username/bthloggen-client:&lt;tag&gt;_.

Lägg till uppstarten av klienten i Docker Compose, där man ska hamna i Bash med `$ docker-compose run client`.

Nedan ser du ett exempel på hur krav 1-3 kan fungera.

[ASCIINEMA src=252509 caption="Exempel på krav 1-3"]

### Krav 4: Mer data (optionell) {#k4}

Utöka ditt skript `log2json.bash` så man får ut även datumet och klockslaget för varje rad. Lägg till dem i JSON-filen och se till så servern stöder filtrering på dem. Uppdatera även klient(erna). Glöm heller inte lägga till det i hjälptexten i `bthloggen.bash`.

| Route&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Resultat                                                                                                                                                |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `/data?month=<month>`                                                                                                                                                                                                                                                                                                                                                                           | Visa raderna från månaden &lt;month&gt; (tex `?month=Aug`).                                                                                             |
| `/data?day=<day>`                                                                                                                                                                                                                                                                                                                                                                               | Visa raderna från dagen &lt;day&gt;.                                                                                                                    |
| `/data?time=<time>`                                                                                                                                                                                                                                                                                                                                                                             | Visa raderna från tiden &lt;time&gt; (tex `?time=14`) visar alla rader inkomna 14:00 och fram till 14:59. `?time=13:28` visar alla rader inkomna 13:28. |
| `/data?day=<day>&time=<time>`                                                                                                                                                                                                                                                                                                                                                                   | Visa raderna från tiden &lt;time&gt; på dagen &lt;day&gt;.                                                                                              |
| `/data?month=<month>&day=<day>&time=<time>`                                                                                                                                                                                                                                                                                                                                                     | Visa raderna från tiden &lt;time&gt; på dagen &lt;day&gt; och månaden &lt;month&gt;.                                                                    |

Ett exempel är alltså `/data?month=Aug&day=17&time=14:36` som kan ge resultatet:

```
[
    {
        "ip": "3.46.13.143",
        "day": "17",
        "month": "Aug",
        "time": "14:36:04",
        "url": "http://www.bing.com"
    },
    {
        "ip": "3.55.39.16",
        "day": "17",
        "month": "Aug",
        "time": "14:36:17",
        "url": "http://www.bing.com"
    },
    {
        "ip": "3.227.89.252",
        "day": "17",
        "month": "Aug",
        "time": "14:36:29",
        "url": "https://dbwebb.se"
    }
]
```

### Krav 5: Webbklient (optionell) {#k5}

Här jobbar du i mappen `bthloggen/webbclient/`.

Skapa en webbsida som presenterar serverns funktionalitet. Man ska till exempel kunna söka information via ett sökfält eller välja det via en lista och få det presenterat på ett trevligt sätt. Utmana dig själv. Gör en snygg design på sidan så du inte bara visar upp JSON svaren. Här är det fritt att välja språk. Kraven är att:

- Sidan ska byggas in i en Dockercontainer som publiceras med taggen _username/bthloggen-webbclient:&lt;tag&gt;_.
- containern ska vara nåbar via port `1338`.
- containern ska kunna startas som en service (webbclient) i docker-composefilen.
- containern ska ligga på samma nätverk som de tidigare containrarna (krav 2 och 3).

## Redovisning {#redovisning}

1. På din [redovisningssida](./../redovisa), skriv följande:

   1. För varje krav du implementerat, dvs 1-5, skriver du ett textstycke om ca 5-10 meningar där du beskriver vad du gjort och hur du tänkt. Poängsättningen tar sin start i din text så se till att skriva väl för att undvika poängavdrag. Missar du att skriva/dokumentera din lösning så blir det 0 poäng. Du kan inte komplettera en inlämning för att få högre betyg.

   1. Skriv ett allmänt stycke om hur projektet gick att genomföra. Problem/lösningar/strul/enkelt/svårt/snabbt/lång tid, etc. Var projektet lätt eller svårt? Tog det lång tid? Vad var svårt och vad gick lätt? Var det ett bra och rimligt projekt för denna kursen?

   1. Avsluta med ett sista stycke med dina tankar om kursen och vad du anser om materialet och handledningen (ca 5-10 meningar). Ge feedback till lärarna och förslå eventuella förbättringsförslag till kommande kurstillfällen. Är du nöjd/missnöjd? Kommer du att rekommendera kursen till dina vänner/kollegor? På en skala 1-10, vilket betyg ger du kursen?

2. Ta en kopia av texten på din redovisningssida och kopiera in den på Canvas/redovisningen. Glöm inte länka till din me-sida och projektet.

3. Se till att samtliga kursmoment validerar.

### Krav på videon {#krav-video}

1. Börja med att visa upp en idhandling och ditt ansikte så vi vet att du är du.

2. Berätta om projektet och visa upp vad du har gjort.

3. Lyft fram delar som du har jobbat mycket med eller som du är stolt över.

4. Försök hålla presentationen som en demo i arbetslivet, det är bra träning.

5. Sikta på 4-5 minuter.

6. Ladda upp videon i Canvas som en kommentar i inlämningen.

```bash
# Ställ dig i kursrepot
dbwebb publish me
```
