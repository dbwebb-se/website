---
author: aar
revision:
    "2023-10-24": (A, aar) Första versionen.
...

Docker {#docker}
==================================


En snabb översikten av vad Docker är kan vi hitta på [Dockers egna webbsida](https://www.docker.com/resources/what-container). Docker är en container teknologi som liknar en avskalad virtuella maskin. Vad tillför det till oss som utvecklare?

Docker låter utvecklare att utveckla och driftsätta applikationer i virtuella container miljöer. Detta ska göra att en applikation kan köras på exakt samma sätt utan kompabilitets problem oberoende av vilken dator/server den körs på, så länge Docker är installerat. Att applikationen kan köras oberoende av systemet gör att applikationen blir lättare att använda, utveckla, underhålla och driftsätta.

[FIGURE src="https://pics.me.me/it-works-on-my-machine-then-well-ship-your-machine-62072263.png"]



## Docker terminologi {#terminologi}

- **Image**: En image är typ ett exekverbart paket som innehåller allt som behövs för att köra applikationen, det inkluderar konfigurationsfiler, miljövariabler och bibliotek.
- **Dockerfile**: Fil som innehåller instruktionerna för att bygga en Docker image. Koden som används för att skapa en **Image**.
- **Build**: Skapar en image snapshot från Dockerfile.
- **Tag**: Version av en image. Varje image har ett tag namn.
- **Container**: Ett lättviktig program skapat från en specifik image version. Vi kan se det som att vi kallar en image en container när den exekveras.
- **DockerHub**: Image repository där vi kan hitta images. Typ GitHub för images.
- **Docker Daemon**: Körs på host systemet. Användare kan inte jobba direkt mot Docker daemon utan gör det via Docker klienter.
- **Docker Engine**: Skapar och kör Containers.
- **Docker Client**: Huvud interfacet för Docker.



## Öva på Docker {#ova}

Kolla på följande video för en kort introduktion till Docker och hur vi kan använda det.

[YOUTUBE src="6aBsjT5HoGY" caption="Docker Concepts Introduction"]

Om ni redan har läst kursen vlinux kan ni gå vidare till nästa steg. Annars jobba igenom hela följande guide för att lära er skapa egna images och containrar och använda docker-compose.

- [Docker](guide/docker/introduktion)

Om ni vill öva mer på Docker så finns det många [Docker övningar på killercoda](https://killercoda.com/comp-killercoda/course/Docker%20Tutorials%20(Without%20Click-and-Execute)).


**Läs om** [Docker latest tag](https://vsupalov.com/docker-latest-tag/), ett annat hett ämne inom Docker är om man ska använda `latest` taggen för att köra images eller ej.



## Docker i devops {#devops}

Docker är väldigt populärt inom devops världen av många anledningar, läs om varför i Dockers bloggserie **Docker and the Three Ways of DevOps**.

- [Docker and the Three Ways of DevOps](https://drive.google.com/file/d/1mAmfW6cilWNx_osvhsImSoH1bmZ__Tbe/view?usp=sharing)



## Databas i Docker {#db_docker}

Att köra sin databas i Docker har länge varit debatterat, många är emot men fler och fler börjar tycka att det är OK. Jag är för att köra databasen in Docker så länge man lägger data mappen som en volym så att datan inte skrivs över när vi startar om containern.

- Läsa om argumenten i [Should You Run Your Database in Docker?](https://vsupalov.com/database-in-docker/). 

MySQL sparar sin data i mappen `/var/lib/mysql` så när ni kör er databas container i produktion gör den mappen till en volym på host systemet. Så att datan i databasen inte försvinner när vi stänger ned containern.



## Spara konfiguration som kod {#konfig_kod}

En viktigt del av det praktiska inom devops är att spara konfiguration som kod och versionshantera den. Detta är för att undvika att tillfällen uppstår där det bara är specifika personer som vet hur man startar/kör/konfigurerar något. Allt ska finnas som kod och versionshanterat så alla kan göra det.

En typisk sån sak är att bygga/köra Docker images. Att bygga/starta en image behöver ofta någon slags konfiguration t.ex. vad ska vara volymer, miljövariabler eller vilken port som ska öppnas. Om detta inte finns som kod blir det svårt för någon annan än för den som skrev koden att göra det.

För Docker använder vi [docker-compose](https://docs.docker.com/compose/) i detta syftet.

Läs att använda [docker compose i produktion](https://docs.docker.com/compose/production/).

Om ni jobbade igenom hela docker guiden längre upp borde ni ha det installerat. Annars jobba igenom följande guide för att installera.

- [docker-compose](guide/docker/installera-compose).
