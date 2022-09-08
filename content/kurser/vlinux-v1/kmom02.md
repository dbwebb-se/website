---
author:
  - lew
revision:
  "2022-04-11": (A, lew) Ny inför HT22.
...

# Kmom02: Dockerfile och Bash

Nu har vi fått Dockermiljön på plats och vi vet hur vi startar en container samt hur vi navigerar i den. Vi ska nu titta på hur vi kan skapa en egen image utifrån en så kallad Dockerfile så vi slipper installera om allt varje gång vi stänger ner containern. Vi ska också lära oss hur vi kan skapa bashscript som vi exekverar i containern.

<!--more-->

[FIGURE src=/image/vlinux/bashlogo.png caption="Bash."]

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>

## Läsanvisningar {#lasanvisningar}

_(ca: 4-10 studietimmar)_

### Kurslitteratur {#kurslitteratur}

Läs följande:

1. [The Linux Command Line](kunskap/boken-the-linux-command-line)
   - Kapitel 1-4, repetera grundläggande kommandon
   - Kapitel 6 Redirection
   - Kapitel 24 Writing Your First Script

### Video {#video}

Till kursen finns en [videoserie](https://www.youtube.com/playlist?list=PLKtP9l5q3ce_XueavhyZ_udFDLVFaoVo5). Titta på videorna som börjar med 02.

## Övningar & Uppgifter {#ovningar_uppgifter}

_(ca: 6-10 studietimmar)_

### Övningar {#ovningar}

Genomför följande övningar.

1. Gå igenom guiden och de delar som handlar om [Volymer](guide/docker/volymer), [Dockerfile](guide/docker/bygga-image) och [Docker Hub](guide/docker/docker-hub).

1. Jobba igenom artikeln ["Skapa script med options, command och arguments"](kunskap/skapa-bash-skript-med-options-command-och-arguments). Den ger dig en struktur till hur du kan skapa Bash-script.

1. Kika i guiden [kom igång med Bash](guide/kom-igang-med-bash), där du hittar beskrivningar om de vanligaste konstruktionerna.

### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften [Lab 1](uppgift/linux-lab-1-introduktion-till-bash) för att träna upp grundläggande färdigheter i bash och hantering av filsystem. Här jobbar du i mappen `kmom02/bash1`.

1. Gör uppgiften "[Bash-script med argument options](uppgift/ett-bash-script-med-options-command-arguments)". Spara arbetet i mappen `kmom02/script`.

1. Gör uppgiften "[Skapa Docker image](uppgift/skapa-docker-image)". Du fortsätter arbeta i mappen `kmom02/script`.

1. Lägg till redovisningstexten i din me-sida.

[YOUTUBE src=LJs-9hBkO58 width=639 caption="Har du fått med alla delar?"]

### dockerhub.bash {#dockerhub-bash}

1. Skapa ett script `kmom02/dockerhub.bash` som vid exekvering kör din publicerade image. Se till så filen är exekverbar.

### Testa din inlämning {#test}

Du kan köra vissa tester på din inlämning och se om de delarna uppfyller kraven. Rättningen kommer endast genomföras om testerna går igenom.

```console
$ dbwebb test kmom02
```

## Resultat & Redovisning {#resultat_redovisning}

_(ca: 1-2 studietimmar)_

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

- Är detta din första bekantskap med scriptprogrammering i Bash?
- Berätta om din uppfattning om Bash som programmeringsmiljö, relatera till andra programspråk du kan.
- Vilka möjligheter/utmaningar ser du med denna typen av scriptprogrammering?
- Var det något som var extra svårt eller utmanande i uppgifterna?
- Reflektera över hur du känner inför ett Unix-liknande operativsystem så här långt?
