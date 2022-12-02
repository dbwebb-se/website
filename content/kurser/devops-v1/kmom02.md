---
author:
    - aar
revision:
    "2022-10-26": "(D, aar) Bytte ut CircleCi mot Github Actions."
    "2021-10-29": "(C, aar) Slog ihop canvas inlämning med kmom01."
    "2020-11-06": "(B, aar) Ready for HT20."
    "2019-11-01": "(A, aar) Första versionen."
...
Kmom02: Docker
==================================

Vi packar in vår kod i en Docker container för att underlätta utveckling, driftsättning och körning av vår applikation.

<!-- more -->

[FIGURE src="https://pics.me.me/it-works-on-my-machine-then-well-ship-your-machine-62072263.png"]


[INFO]
Innan ni sätter igång med kursmomentet kolla att ert Microblog repo är synkat med originalet, [Syncing a fork](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/syncing-a-fork).
[/INFO]



## Vad är Docker? {#docker}

En snabb översikten av vad Docker är kan vi hitta på [Dockers egna webbsida](https://www.docker.com/resources/what-container). Docker är en container teknologi som liknar en avskalad virtuella maskin. Vad tillför det till oss som utvecklare?

Docker låter utvecklare att utveckla och driftsätta applikationer i virtuella container miljöer. Detta ska göra att en applikation kan köras på exakt samma sätt utan kompabilitets problem oberoende av vilken dator/server den körs på, så länge Docker är installerat. Att applikationen kan köras oberoende av systemet gör att applikationen blir lättare att använda, utveckla, underhålla och driftsätta.



### Docker terminologi {#terminologi}

- **Image**: En image är typ ett exekverbart paket som innehåller allt som behövs för att köra applikationen, det inkluderar konfigurationsfiler, miljövariabler och bibliotek.
- **Dockerfile**: Fil som innehåller instruktionerna för att bygga en Docker image. Koden som används för att skapa en **Image**.
- **Build**: Skapar en image snapshot från Dockerfile.
- **Tag**: Version av en image. Varje image har ett tag namn.
- **Container**: Ett lättviktig program skapat från en specifik image version. Vi kan se det som att vi kallar en image en container när den exekveras.
- **DockerHub**: Image repository där vi kan hitta images. Typ GitHub för images.
- **Docker Daemon**: Körs på host systemet. Användare kan inte jobba direkt mot Docker daemon utan gör det via Docker klienter.
- **Docker Engine**: Skapar och kör Containers.
- **Docker Client**: Huvud interfacet för Docker.



### Installera Docker {#installera}

För att få en bättre förståelse för Docker behöver vi använda det och då måste vi installera det. Notera att det kan vara lite svårt med Docker i Windows 10 Home b.la., om ni har en annan miljö ni kan jobba på så rekommenderas det. Lösningen för tillfället är att köra Docker i VirtualBox på Windows 10 Home.

- [Installera virtualiseringsmiljön Docker](kunskap/installera-virtualiseringsmiljon-docker). 



### Öva på Docker {#ova}

Kolla på följande video för en kort introduktion till Docker och hur vi kan använda det.

[YOUTUBE src="6aBsjT5HoGY" caption="Docker Concepts Introduction"]

Om ni redan har läst kursen vlinux kan ni gå vidare till nästa steg. Annars jobba igenom hela följande guide för att lära er skapa egna images och containrar.

- [Docker](guide/docker/introduktion)

Om ni vill öva mer på Docker så finns det många [Docker övningar på killercoda](https://killercoda.com/comp-killercoda/course/Docker%20Tutorials%20(Without%20Click-and-Execute)).



### Docker i devops {#devops}

Docker är väldigt populärt inom devops världen av många anledningar, läs om varför i Dockers bloggserie **Docker and the Three Ways of DevOps**.

- [Docker and the Three Ways of DevOps](https://drive.google.com/file/d/1mAmfW6cilWNx_osvhsImSoH1bmZ__Tbe/view?usp=sharing)



## Skapa egen Docker image för produktion {#file_prod}

Nu när vi har lite kött på benen och vet vad Docker är och hur det fungerar ska ni skapa en egen Dockerfile för microblogen.

- Jobba igenom [Microblog med docker containers](kunskap/microblog_med_docker_containers) för att skapa dig en Dockerfile för produktion. Döp din Dockerfile till `Dockerfile_prod` och lägg den i mappen `docker`.

När ni har skapat er Dockerfile ska ni läsa en recension av den Dockerfile ni har skapat.

- Vsupalov's recension av [Docker Usage in 'The Flask Mega-Tutorial'](https://vsupalov.com/flask-megatutorial-review/).



### Databas i Docker {#db_docker}

Att köra sin databas i Docker har länge varit debatterat, många är emot men fler och fler börjar tycka att det är OK. Jag är för att köra databasen in Docker så länge man lägger data mappen som en volym så att datan inte skrivs över när vi startar om containern.

- Läsa om argumenten i [Should You Run Your Database in Docker?](https://vsupalov.com/database-in-docker/). 

MySQL sparar sin data i mappen `/var/lib/mysql` så när ni kör er databas container i produktion gör den mappen till en volym på host systemet. Så att datan i databasen inte försvinner när vi stänger ned containern.



## Skapa en Docker image för testning {#file_test}

Den stora fördelen med Docker är att vi kan skapa färdiga miljöer och skicka mellan olika datorer. Nu har ni byggt en miljö/image för att köra microblog i produktion. Det vill vi även göra för utvecklings-/testmiljön. Med utvecklingsmiljön i Docker kan vi snabbt och lätt byta dator och få in nya utvecklare till projektet.

I den image som används i produktion är koden och alla dependencies statiska. När vi har skapat vår image kommer de sakerna inte ändras och containern ska vara igång för evigt. När vi istället gör en image för testning vill vi inte behöva bygga om hela vår image varje gång vi vill kolla om något fungerar och när den startas som en container ska den stängas när testerna har körts. Detta gör att koden och testerna behöver vara dynamisk i vår image. Denna imagen ska bara behöva byggas om när vi ändrar på test miljön (moduler och verktyg).

I produktions filen skapar vi mappen microblog och kopiera in alla mappar som behövs och gör allt i den mappen. Men det går inte nu när vi ska separera på installations- och kod-filer. `requirements` mappen ska ni kopiera in och installera filen `requirements/test.txt`. Själva koden och testerna läggs in som en volym när ni startar er container efter att ni har byggt en image.

- Skapa en ny Dockerfile, döp den till `Dockerfile_test` och lägg den i mappen `docker`.
- I den är det bara `requirements` mappen som ska kopieras in. Installera filen `requirements/test.txt`.
- Installera `make` kommandot.
- Skapa ett nytt `boot.sh` skript som kör `make test` i mappen du sätter som volym för testerna.
- När containern startar ska den köra `make test` via ditt skript. När det är klart ska containern stängas ner av sig själv.

Bygg filen som vanligt, `docker build -t microblog:test -f docker/Dockerfile_test .`. När ni ska använda den sen måste ni skicka med er lokala microblog mapp som en volym till container.

Om ni vill kan ni ändra så integrationstesterna körs mot MySQL i docker container istället för SQLite i minnet. Testerna kommer troligen köras långsammare men testerna blir mer värdefulla då de körs mot likadant system som körs i produktion. När man kör databasen i en container för testerna brukar man inte göra data mappen till en volym, i och med att vi inte bryr oss om persistent data för tester.

Kolla så att era Dockerfiler validerar med Hadolint. Det finns redan ett Make kommando, `make validate-docker`, som kör validering på `Dockerfile_prod` och `Dockerfile_test`.



## Spara konfiguration som kod {#konfig_kod}

En viktigt del av det praktiska inom devops är att spara konfiguration som kod och versionshantera den. Detta är för att undvika att tillfällen uppstår där det bara är specifika personer som vet hur man startar/kör/konfigurerar något. Allt ska finnas som kod och versionshanterat så alla kan göra det.

En typisk sån sak är att bygga/köra Docker images. Att bygga/starta en image behöver ofta någon slags konfiguration t.ex. vad ska vara volymer, miljövariabler eller vilken port som ska öppnas. Om detta inte finns som kod blir det svårt för någon annan än för den som skrev koden att göra det.

För Docker använder vi [docker-compose](https://docs.docker.com/compose/) i detta syftet. Om ni jobbade igenom hela docker guiden längre upp borde ni ha det installerat. Annars jobba igenom följande guide.

- [docker-compose](https://dbwebb.se/guide/docker/installera-compose).

Skapa filen `docker-compose.yml` i root mappen av repot. I den, lägg till en service för att köra test container och en som startar prod containern mot en MySQL container. För att docker-compose ska klara av att hantera `<<-EOF` i Dockerfile behöver ni sätta följande miljövariabler:

```
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1
```

`docker-compose run test` ska starta test containern och köra alla tester.

`docker-compose up prod` ska starta en MySQL container och er prod container.

Skapa ett nytt Make kommado `make test-docker` som startar er test image och kör alla tester på koden.



## Actions och Continuous Delivery {#actions-cd}

Vi kan se Continuous Delivery som steget efter Continuous Integration. I CI har vi ett flöde där vi kör tester automatisk, nästa steg är när alla tester har blivit godkända. Då vill vi bygga vår applikation så att den finns tillgänglig för driftsättning med de senaste uppdateringarna. Vår applikation bygger vi genom att skapa en fungerande docker image. Läs en mer detaljerad förklaring av [Martin Fowler](https://martinfowler.com/bliki/ContinuousDelivery.html), ett av de stora namnen inom Microservices, Software Development och Continuous Integration/Delivery/Deployment. I nästa kursmoment ska vi ta det ett steg längre och uppnå Continuous Deployment, vilket lägger till att automatisk driftsätta applikationen efter vi testat och byggt den.
<!-- https://puppet.com/blog/continuous-delivery-vs-continuous-deployment-what-s-diff -->

Vi ska inte uppnå "riktigt" CD då vi inte har en staging miljö och vi borde testa koden mer rigoröst. Men vi jobbar med det vi har. Vi har redan ett CI flöde på Actions, nu ska ni bygga ut det med delivery steget. Om testerna går igenom ska ni bygga er produktions image och publicera den på DockerHub.

Om ni inte redan har ett, skapa först ett konto på [DockerHub](https://hub.docker.com/). Skapa sen ett nytt repo där ni kan ladda upp er produktions image. När ni gjort det testa ladda upp er första image manuellt.

- [Skapa och hanter konto på DockerHub](https://dbwebb.se/guide/docker/skapa-och-hantera-konto).

Nu vill vi att er produktions image byggs och pushas till dockerhub automatiskt när ni pushar uppdateringar i er kod till GitHub. Ni vill bara bygga och pusha er image om testerna går igenom för koden. Ni har redan ett workflow som kollar det. Eftersom vi är utvecklare gillar vi att dela upp vår kod i olika filer. Nu ska ni skapa ett nytt workflow (separat fil) som bygger och pushar er image till DockerHub men bara om testerna passerar. Ni uppnår det genom att från det nya workflow:et återanvända det som tester koden.

Läs först om hur man kan återanvända workflows och skapa sen ett nytt workflow som bygger och pushar er docker image.
- [Reusing workflows](https://docs.github.com/en/actions/using-workflows/reusing-workflows). Tips, starta kmom01 flödet från kmom02 flödet.
- [Publishing Docker images](https://docs.github.com/en/actions/publishing-packages/publishing-docker-images). Dokumentation om [alternativ till att bygga er image](https://github.com/docker/build-push-action#customizing).

Gör ett aktivt val mellan att publicera ny image för varje ny release eller vid varje commit!



## Kör i produktion {#docker_prod}

Det sista steget i continuous delivery är att ni själva måste manuellt uppgradera produktions miljön så att er nya image används. Men vi skippar det i detta kursmomentet och tar det i nästa istället.

<!-- att köra er produktions container på er VM i Azure. Installera Docker på servern och starta up er microblog med docker-compose. Bygg inte containerna på servern utan använd den som byggdes på GitHub Actions och laddades upp till DockerHub. -->

<!-- Ni ska inte använda supervisor längre. Vi använde supervisor för att se till att det hela tiden finns en Gunicorn process igång men det ansvaret flyttas över till Docker. Lägg till `restart: always` i er docker-compose fil. -->

Läs om vad Docker tycker om att använda [compose i produktion](https://docs.docker.com/compose/production/).



### Video {#video}

Det finns generellt kursmaterial i video form.


1. Kursen innehåller föreläsningar som spelas in och därefter läggs i spellistan "[devops streams ht22](https://www.youtube.com/playlist?list=PLKtP9l5q3ce8t5NnxhZIJC69_FL55FzNV)".

1. I "[kursen devops](https://www.youtube.com/playlist?list=PLKtP9l5q3ce8s67TUj2qS85C4g1pbrx78)" hittar du alla videor som är kopplade till kursmomentet, de börjar på 2xx i namnet.



## Lästips {#lastips}

[Multistage builds](https://docs.docker.com/develop/develop-images/multistage-build/), för vår app är detta kanske inte nödvändigt men det är väldigt bra att känna till.

[Best practices](https://www.wintellect.com/security-best-practices-for-docker-images/) för Docker.

[Docker latest tag](https://vsupalov.com/docker-latest-tag/), ett annat hett ämne inom Docker är om man ska använda `latest` taggen för att köra images eller ej.

[Building Your Production Tech Stack for Docker Container Platform](https://dockercon2018.hubs.vidyard.com/watch/k3Cv676wmxAwYDxbvcgcgC), video från DockerCon 2018.



Uppgifter {#uppgifter}
-----------------------------------------------

Följande uppgifter skall utföras och resultatet skall redovisas.
<!-- nginx i docker med https https://medium.com/@pentacent/nginx-and-lets-encrypt-with-docker-in-less-than-5-minutes-b4b8a60d3a71 -->

1. Två Dockerfile's i mappen `docker`, en för produktion som heter `Dockerfile_prod` och en som heter `Dockerfile_test`.

1. En docker-compose fil för att köra test och starta prod miljön.

2. Använd `make test-docker` för att köra testerna och validerar kod i Docker.

3. GitHub Action kör testerna, validering och bygger produktions image och pushar till DockerHub.

4. Försäkra dig om att du har pushat repot med din senaste kod och taggat din inlämning med version v12.0.0. Om du pushar kmom02 flera gånger kan du öka siffrorna efter 12:an.

5. Inkludera en länk till ditt GitHub repo och din webbsida (domännamn) i din inlämning på Canvas.

[YOUTUBE src=LOULXBE3iAE caption="Hur det kan se ut när det är klart"]

Läsanvisningar {#las}
--------------------------

I kursen ska ni läsa boken **[Effective DevOps](http://tinyurl.com/y6jy5x8u)**. Boken är inte kopplad till kursmomenten, men den behövs när ni ska skriva rapporten i slutet av kursen. Ni kan själva välja upplägg för när ni läser den. Ett rekommenderat upplägg är att läsa en del, "part", i veckan. Då har ni läst igenom hela boken efter kmom06.

Rekommendationen för denna veckan är att läsa **"Part II. Collaboration"**.



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i texten:

1. Vad var din uppfattning av devops innan kursen började?

1. Hur skulle du definiera devops?

1. Har du använt Docker förut? Gick det bra att använda det nu?

1. Hur används Docker inom devops?

1. Valde du att bygga ny Docker image vid varje commit eller release? Varför?

1. Vad är Continuous Delivery?

1. Hur var storleken på kursmomentet? Vad tycker du om upplägget på kursmomentet?

1. Veckornas TIL?
