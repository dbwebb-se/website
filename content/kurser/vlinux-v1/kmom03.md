---
author:
  - lew
revision:
  "2022-05-09": (B, lew) Uppdaterad inför HT22.
  "2019-03-25": (A, lew) Ny inför HT19.
...

# Kmom03: Virtual Hosts

Nu kan vi enkelt snurra igång en Linuxmiljö så låt oss se hur vi kan använda containern som en server och installera ett par webbplatser på den. Det låter som en vettig syssla för en webbprogrammerare.

Ett bra sätt att installera många webbplatser på en och samma maskin är Apache Virtual Hosts och det är något vi skall bekanta oss med. Vi ska skapa namnbaserade webbplatser som ligger på samma domän med hjälp av webbservern Apache.

<!--more-->

[FIGURE src=/image/vlinux/apache.svg.png caption="Apache2."]

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>

## Läs-/videoanvisningar {#anvisningar}

_(ca: 8-12 studietimmar)_

<!-- ### Kurslitteratur  {#kurslitteratur}

Läs följande: -->

<!-- 1. [The Linux Command Line](kunskap/boken-the-linux-command-line)
    * Kapitel 6 Redirection
    * Kapitel 24 Writing Your First Script -->

### Video {#video}

Till kursen finns en [videoserie](https://www.youtube.com/playlist?list=PLKtP9l5q3ce_XueavhyZ_udFDLVFaoVo5). Titta på videorna som börjar med 03.

## Övningar & Uppgifter {#ovningar_uppgifter}

_(ca: 4-10 studietimmar)_

### Övningar {#ovningar}

Genomför följande övningar.

1. Läs igenom artikeln "[Kom igång med Apache](kunskap/kom-igang-med-apache)". Här ska du inte utföra delarna utan det räcker att du läser igenom de olika stegen.

1. Läs stycket om verktyget "grep" i artikeln ["Text processering"](kunskap/text-processering#grep).

1. Jobba dig igenom delen om [Apache virtual hosts i Docker guiden](guide/docker/apache-vh).

1. Ha lite koll på [Docker guiden](guide/docker). Framförallt delarna om Dockerfile och volymer.

### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften [Lab 2](uppgift/linux-lab-2-sok-i-en-logg-fil) för att träna upp grundläggande färdigheter i bash och hantering av filsystem. Här jobbar du i mappen `kmom03/bash2`.

1. Gör uppgiften "[Skapa en webbplats på en Apache Virtual Host](uppgift/skapa-virtual-host)". Här arbetar du i mappen `kmom03/vhosts`.

1. Lägg till redovisningstexten i din me-sida.

### dockerhub.bash {#dockerhub-bash}

1. Skapa ett Bash-script, `kmom03/dockerhub.bash` som kör din publicerade image. Filerna ska servas via en volym där sökvägen tas emot som argument. Utgå alltid från den egna kontexten (`$(pwd)`). Mappa sökvägen mot din valda `DocumentRoot` i config-filen.

1. Containern ska kunna nås via port 8080 (-p).

1. Containern ska köras i bakgrunden (-d).

1. Containern ska ha namnet "mysite" (--name).

1. Lägg till hosten via `docker run`. Den ska heta `mysite.vlinux.se`.

[YOUTUBE src=N4utGAtitTg width=639 caption="Har du fått med alla delar?"]

### Testa din inlämning {#test}

Du kan köra vissa tester på din inlämning och se om de delarna uppfyller kraven. Rättningen kommer endast genomföras om testerna går igenom.

```console
$ dbwebb test kmom03
```

## Resultat & Redovisning {#resultat_redovisning}

_(ca: 1-2 studietimmar)_

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

- Hur känns konceptet med Apache name-based Virtual Hosts? Känner du igen det sedan tidigare?
- Det blir allt fler kommandon i terminalen, hur känns det med terminalen och dess kommandon?
- Har du koll på portar och hur vi kan använda dem?
- Hur kändes det att jobba med volymer?
- Reflektera över hur du känner inför Unix som operativsystem så här långt.
