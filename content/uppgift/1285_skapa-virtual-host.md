---
author: lew
category: linux
revision:
  "2022-05-10": (A, lew) Ny inför HT22.
...

# Skapa en webbplats på en Apache Virtual Host

Fixa iordning en webbplats med en Apache Virtual Host. Du får dels konfigurera upp en Named Apache Virtual Host och dels får du använda volymer och portar för att hantera filer på din lokala arbetsstation i servern som kör webbplatsen. Du ska leverera en image som kan serva en lokal mapp med en webbsida på en viss adress.

<!--more-->

## Förkunskaper {#forkunskaper}

Du har jobbat igenom artikeln "[Kom igång med Apache](kunskap/kom-igang-med-apache)" och guiden om "[Apache och virtual hosts](guide/docker/apache-vh)".

## Introduktion {#intro}

De filer du skapar och använder i denna uppgiften skall du spara i ditt kursrepo i katalogen `me/kmom03/vhosts`. De används för att redovisa uppgiften.

## Krav {#krav}

1. Skapa `mysite.vlinux.se.conf`. Använd variabler för sökvägarna.

1. Skapa en `Dockerfile` som installerar Apache2, kopierar in configfilen till rätt plats och startar Apache2 utan felmeddelanden eller varningar.

1. Ta en skärmdump på terminalen som visar när du använder `w3m` för att komma åt webbplatsen inifrån containern med hjälp av ett host-namn. Spara den som `dump.png`. Spara bilden i formatet .png och använd små bokstäver i filnamnet.

1. Publicera din image med namnet _username/vlinux-vhost:1.0_ där du använder ditt egna användarnamn. Se till så imagen är publik.

1. Publicera uppgiften enligt följande.

```bash
# Ställ dig i kurskatalogen
$ dbwebb publish vhosts
```

Rätta eventuella fel som dyker upp och publicera igen. När det ser grönt ut så är du klar.

## Extrauppgift {#extra}

1. Lägg till fler virtuella hostar via följande lokala mappar: `mysite1, mysite2 etc`.

## Tips från coachen {#tips}

Stressa inte. Kör det ihop sig så är det en bra taktik att börja om från början och göra om. Det går snabbare andra gången, och ännu snabbare tredje gången.

Lycka till och hojta till i chatten om du behöver hjälp!
