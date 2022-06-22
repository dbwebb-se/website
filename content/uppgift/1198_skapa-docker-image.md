---
author: lew
revision:
  "2022-05-04": (B, lew) Uppdaterad inför HT22.
  "2019-04-11": (A, lew) Första utgåvan inför HT19.
...

# Skapa en Docker image

Du skall skapa en Docker image och publicera den till Docker Hub. Du ska även använda ditt script från föregående övning och kopiera in det i din image.

<!--more-->

## Förkunskaper {#forkunskaper}

Du har [installerat Docker](kunskap/installera-virtualiseringsmiljon-docker) som en del av labbmiljön. Du har även skapat ett konto på Docker Hub.

Du har gjort uppgifterna "[Lab1](uppgift/linux-lab-1-introduktion-till-bash)" och [Bash-script med argument options](uppgift/ett-bash-script-med-options-command-arguments).

Du har läst kurslitteraturen och skaffat dig grundläggande kunskaper om bash.

## Introduktion {#intro}

Du ska skapa en Docker image där scriptet som ligger i mappen `kmom02/script` ska köras. Imagen ska sedan publiceras på Docker Hub.

[INFO]
**TIPS:**
Använd [guiden för Docker](guide/docker). Du bör klara dig med informationen fram till och med [Docker Hub](guide/docker/docker-hub).
[/INFO]

## Krav {#krav}

1. Skapa en Dockerfile `script/Dockerfile` som använder sig av imagen `ubuntu:22.04`.

1. Kopiera in ditt egna `script/commands.bash` in i containern, till arbetsmappen `kmom02`.

1. Se till så scriptet är körbart inuti containern.

1. Vid uppstart ska kommandot `commands.bash all` köras och sedan ska containern stängas ned. Dubbelkolla så alla program, tex `cal` är installerade.

1. Bygg din image med namnet _username/vlinux-commands:1.0_ där du använder ditt egna användarnamn.

1. Publicera imagen till Docker Hub och se till så den är publik.

```bash
# Flytta till kurskatalogen
$ dbwebb validate script
$ dbwebb publish script
```

Rätta eventuella fel som dyker upp och publicera igen. När det ser grönt ut så är du klar.

## Extrauppgift {#extra}

Det finns inga extrauppgifter.

## Tips från coachen {#tips}

Lycka till och hojta till på Discord om du behöver hjälp!
