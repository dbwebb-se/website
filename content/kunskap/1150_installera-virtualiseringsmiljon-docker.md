---
author: lew
category: labbmiljo
revision:
    "2022-04-11": (B, lew) Uppdatering för Windows och ht22.
    "2019-03-08": (A, lew) Första utgåvan.
created: "2019-03-08 10:49:30"
...
Installera virtualiseringsmiljön Docker
==================================

Docker kommer utgöra grunden för kursens labbmiljö. Vi kommer få en unixmiljö där vi kan exekvera alla uppgifter och program samt träna på terminalkommandon. Vi lutar oss mot Dockers egna dokumentation för installationsanvisningar, [https://docs.docker.com/](https://docs.docker.com/). Fortsätt läsa för att se hur du går vidare.



Hämta installationsprogrammet {#download}
---------------------------------

Webbplatsen för Docker innehåller en del där du kan ladda hem och installera Docker. Det finns en Community Edition (CE) versioner för Windows, Mac och Linux. Kör igenom installationen enligt anvisningarna.

* Windows
    - [Installera Bash i Windows med WSL och Ubuntu](/kunskap/installera-bash-i-windows-med-wsl-och-ubuntu)
    - [Installera Docker](https://docs.docker.com/docker-for-windows/install/) 

* [MacOs](https://docs.docker.com/docker-for-mac/install/)

* [Linux (Debian)](https://docs.docker.com/install/linux/docker-ce/debian/)

* [Linux (Ubuntu)](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

Docker är en virtualiseringsmiljö så den kräver att din datorn är kapabel att köra vissa virtualiseringstekniker.

Du behöver bekanta dig med [dokumentationen för Docker](https://docs.docker.com/). Det är din vägledare för att komma igång med Docker.



Tips vid installation
---------------------------------

Nu har du förhoppningsvis installerat Docker CE. Det kan såklart krångla med installationen så här samlar vi lite tips och trix når något går snett. Om du inte väljer att installera Docker för Linux kan det vara bra att tänka på följande.



Verifiera installationen {#verify}
---------------------------------

Nu är Docker (förhoppningsvis) installerat. Det är lika bra att dubbelkolla...

```bash
$ docker --version
Docker version 20.10.13, build a224086
```

```bash
$ which docker
/usr/bin/docker
```

Bra då vet vi var vi har det installerat och att kommandot `docker` fungerar. Vi kör vår första container:

```bash
$ docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
1b930d010525: Pull complete
Digest: sha256:2557e3c07ed1e38f26e389462d03ed943586f744621577a99efb77324b0fe535
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```

Vad som hände ovan är att Docker letar lokalt efter en image `hello-world` med taggen `latest`. Om den inte hittar den lokalt laddas den ned från Docker Hub och containern startas. Just den här containern är inte så spännande men nu vet vi att det fungerar!



Avslutningsvis {#avslutning}
--------------------------------------

Nu har du förhoppningsvis en fungerande Dockerinstallation.
