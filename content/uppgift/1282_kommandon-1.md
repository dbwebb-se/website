---
author: lew
category:
  - Bash
  - Docker
  - linux
revision:
  "2023-08-24": (B, lew) Uppdaterad inför HT23.
  "2022-04-14": (A, lew) Ny inför HT22.
...

# Kommandon 1

Vi ska träna på några kommandon i unixmiljön. Vi ska installera några program och se hur vi kan använda dem och dess "options" och skapa ett par filer med diverse information och kommandon.

<!--more-->

## Förkunskaper {#forkunskaper}

Du har installerat [Docker](kunskap/installera-virtualiseringsmiljon-docker).

## Introduktion {#intro}

Varje krav ska resultera i en rad i filen. Du ska lägga till det kommando du använt dig av för att lösa kravet. Ett krav per rad. Till din hjälp har du `man`-sidorna. Och hela internet såklart. 

Ett tips är att kommandot `cal` blir tillgängligt om man installerar `bsdmainutils`: `$ apt install bsdmainutils`.

[INFO]Du ska utföra alla kommandon inifrån containern[/INFO]

## Krav {#krav}

1. Ta en skärmdump som visar resultatet av kommandot `cal` inifrån containern. Spara filen som `cal.png`.

1. Skapa filen `info` och lägg till kommandot som löser respektive krav:

   1. Skriv enbart ut operativsystemets namn. (`uname`)

   1. Visa en kalender över enbart juli 2023. (`cal`)

   1. Skriv ut dagens datum i formatet `yyyy/mm/dd`. (`date`)

   1. Hur mycket utrymme tar mappen `/usr/bin` i mb? (`du`)

   1. Använd `cowsay` för att skriva ut en valfri hälsning. (`./usr/games/cowsay`)

Se till så du har filen `kmom01/commands/info` när du lämnar in.



### Publicera {#publish}

Publicera din kod enligt följande.

```bash
# Ställ dig i kurskatalogen
$ dbwebb publish commands
```

Rätta eventuella fel som dyker upp och publicera igen. När det ser grönt ut så är du klar.

## Extrauppgift {#extra}

Det finns ingen extrauppgift.

## Tips från coachen {#tips}

Lycka till och hojta till i Discord om du behöver hjälp!
