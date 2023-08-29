---
author: lew
category:
    - Bash
    - Docker
    - linux
revision:
    "2023-08-24": (B, lew) Uppdaterad inför HT23.
    "2022-04-20": (A, lew) Ny inför HT22.

...
Struktur
==================================

Vi ska träna på vanliga kommandon i unixmiljön. Vi ska flytta runt lite filer och mappar för att uppnå en önskad struktur.

<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har installerat [Docker](kunskap/installera-virtualiseringsmiljon-docker).



Introduktion {#intro}
-----------------------

Varje krav ska resultera i en rad i filen. Du ska lägga till det kommando du använt dig av för att lösa kravet. En rad per krav. Till din hjälp har du `man`-sidorna och internet i stort.

Förbered uppgiften genom att kopiera in mappen `example/structure` till containern och ställ dig i den mappen.


Krav {#krav}
-----------------------

1. Använd terminalkommandon för att möblera om strukturen i mappen till följande:

```console
.
|-- a
|   |-- 1
|   `-- 2
|-- answers.bash
|-- b
|   |-- 3
|   `-- 4
|-- c
|   |-- 5
|   `-- 6
`-- d
    |-- 7
    `-- 8

4 directories, 9 files
```

2. Du får inte skapa någon fil eller mapp utan allt finns någonstans i den kopierade mappen (vissa är även dolda).

3. Varje kommando du kör lägger du även i filen `answers.bash`. Ett kommando per rad och filen ska inte innehålla något annat. Alla kommandon ska utgå ifrån att du står i den kopierade mappen.

Tips: Installera programmet `tree`. Det används för att lista innehåll i en mappstruktur på ett överskådligt sätt. Kommandot `tree .` listar strukturen med utgångspunkt i den nuvarande mappen. Se även `man tree`.

När du är klar så kopierar du filen `answers.bash` från containern in till den lokala mappen `kmom01/structure`.



### Testa din lösning {#test}

För att testa din lösning som läraren kan du göra följande:

1. Kopiera in en ny `example/structure` in till containern.

1. Kopiera in din `answers.bash` fil till ovan mapp.

1. Kör kommandot `$ bash answers.bash` för att köra alla kommandon i följd.

1. Hur ser det ut med `tree .`?



### Publicera {#publish}

Publicera din kod enligt följande.

```bash
# Ställ dig i kurskatalogen
$ dbwebb publish structure
```

Rätta eventuella fel som dyker upp och publicera igen. När det ser grönt ut så är du klar.



Extrauppgift {#extra}
-----------------------

Det finns ingen extrauppgift.



Tips från coachen {#tips}
-----------------------

Lycka till och hojta till i Discord om du behöver hjälp!
