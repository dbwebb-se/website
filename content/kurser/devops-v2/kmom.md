---
author:
    - aar
revision:
    "2023-10-24": "(A, aar) Ny version inför v2. Sammanslagning av kmom01 och kmom02"
...
Kmom01: Introduktion till devops och Docker
==================================

Det är en fullspäckat kurs där vi ska lära oss många ny verktyg och koncept. I kursen ska vi lära oss både om det kulturella inom devops men även det praktiska. Vi börjar med att skaffa en produktionsmiljö och bekantar oss med ett påbörjat projekt som ska kopplas till en CI kedja och driftsätta manuellt.

[WARNING]
Kurs under utveckling!

Påbörja inte före denna rutan är borta.
[/WARNING]

[INFO]
Innan ni börjar jobba med materialet fixa ["GitHub Education Pack och ett domännamn"](kunskap/github-education-pack-och-doman-namn). Det kan ta ett tag innan det blir godkänt.
[/INFO]

<!-- more -->

## Vad är devops? {#devops}

### Läs och titta {#devops-read}

Kolla på följande video för att få en introduktion till ämnet devops. Devops är ett brett ämne med många olika definitioner, här försöker skaparen av CM (Configuration Management) verktyget [Chef](https://www.chef.io) beskriva konceptet och komma fram till en rimlig definition.

[YOUTUBE src="_DEToXsgrPc" caption="Chef Style DevOps Kungfu - Adam Jacob Keynote - ChefConf 2015."]

I videon nedanför får vi en kortare genomgång som fokuserar mer på arbetsflödet.

[YOUTUBE src="Me3ea4nUt0U" caption="Introduction to DevOps | Devops Tutorial for Beginners."]


## Miljö {#env}

Tanken är att vi ska jobba med ett projekt igenom hela kursen och då behöver vi verktyg och program för att jobba med koden. Vi kommer ha både en lokal utvecklingsmiljö och en produktionsmiljö.

### Lokal utvecklingsmiljö {#dev}

Vi kommer att utöka vad som ingår i labbmiljön under kursen.

#### Att göra {#dev-do}

- [installera labbmiljön](./../labbmiljo). Det är rekommenderat att ha minst python version 3.8.



### Produktions miljö {#prod}

När man jobbar enligt devops ska saker ofta gå snabbt och automatiskt, då underlättar det om man snabbt och enkelt kan starta upp och stänga ner servrar. Därför ska vi använda oss av en molntjänst, mer specifikt [Microsoft Azure](https://azure.microsoft.com/en-us/). OBS! logga inte in via den länken.

#### Att göra {#prod-do}

Jobba igenom:

- [Kom igång med Azure](guide/kom-igang-med-azure).

- [Första 10 minuter på en server](kunskap/10-forsta-minuterna-pa-en-server).



## Appen {#app}

Nästa steg är att bekanta dig med appen som du ska jobba med i kursen.

### Läs och titta {#app-read}

- [Introduktion till Devops appen](kunskap/introduktion_till_devops_appen).



## Docker {#docker}

I kursen ska ni packa in er kod i en Docker container för att underlätta utveckling, driftsättning och körning av applikationen.

### Läs och titta {#docker-read}

- [Docker i devops](kunskap/docker-i-devops).

### Att göra {#prod-do}

Jobba igenom:

- Om ni inte redan har ett, [Skapa ett konto på DockerHub](https://dbwebb.se/guide/docker/skapa-och-hantera-konto).
- [Microblog i Docker](kunskap/microblog_med_docker_containers)

Läs:

- Vsupalov's recension av [Docker Usage in 'The Flask Mega-Tutorial'](https://vsupalov.com/flask-megatutorial-review/).



## Continuous Integration {#ci}


Vi vill ha en CI-kedja till repot så att testerna automatiskt körs när du gör push. I kursen har jag valt att använda [GitHub Actions](https://docs.github.com/en/actions).

### Läs och titta {#ci-read}

- [Continuous Integration av Martin Fowler](https://martinfowler.com/articles/continuousIntegration.html).


### Att göra {#ci-do}

Jobba igenom:

- ["Building and testing Python"](https://docs.github.com/en/actions/automating-builds-and-tests/building-and-testing-python) i Actions.



## Continuous Delivery {#cd}

Vi kan se Continuous Delivery som steget efter Continuous Integration. I CI har vi ett flöde där vi kör tester automatisk, nästa steg är när alla tester har blivit godkända. Då vill vi bygga vår applikation så att den finns tillgänglig för driftsättning med de senaste uppdateringarna.

### Läs och titta {#cd-read}

- [Continuous Delivery av Martin Fowler](https://martinfowler.com/bliki/ContinuousDelivery.html).

- [Reusing workflows](https://docs.github.com/en/actions/using-workflows/reusing-workflows) i Actions.

- [Publishing Docker images](https://docs.github.com/en/actions/publishing-packages/publishing-docker-images) från Actions. Dokumentation om [alternativ till att bygga er image](https://github.com/docker/build-push-action#customizing)




## Hur vi jobbar med repot {#git}

Ni ska jobba enligt GitHub Flow i ert repo. Det betyder att ni ska ha feature branches, gör pull requests och göra code reviews. För att underlätta det ska ni också fokusera på bra commit meddelanden.



### Läs och titta {#git-read}

- [GitHub Flow](https://docs.github.com/en/get-started/quickstart/github-flow)

- [The seven rules of a great Git commit message](https://chris.beams.io/posts/git-commit/#seven-rules).

- [Keeping Git Commit Messages Consistent with a Custom Template ](https://dev.to/timmybytes/keeping-git-commit-messages-consistent-with-a-custom-template-1jkm).

- [Semantisk versionshantering](https://semver.org/lang/sv/), en bra versionsstandard för projekt. Vi följer inte riktigt den i kursen för att jag vill ha ny siffra för varje kursmoment.

- [CHANGELOG](https://keepachangelog.com/en/1.0.0/), håll koll på vad som ändras mellan versionerna i ett projekt.



## Lästips {#lastips}

- [Multistage builds](https://docs.docker.com/develop/develop-images/multistage-build/), för vår app är detta kanske inte nödvändigt men det är väldigt bra att känna till.

- [Best practices](https://www.wintellect.com/security-best-practices-for-docker-images/) för Docker.

- [Building Your Production Tech Stack for Docker Container Platform](https://dockercon2018.hubs.vidyard.com/watch/k3Cv676wmxAwYDxbvcgcgC), video från DockerCon 2018.



Uppgifter  {#uppgifter}
-------------------------------------------

versioner - git och docker
ci som kör tester
cd dom publiserar
microblog ska köras på azure server och vara tillgänglig via ett domännamn, med den nya funktionaliteten.

var är nginx? kunskap/driftsatta-en-flask-app#conf_nginx

- Döp din Dockerfile till `Dockerfile_prod` och lägg den i mappen `docker`.


Nu vill vi att er produktions image byggs och pushas till dockerhub automatiskt när ni pushar uppdateringar i er kod till GitHub. Ni vill bara bygga och pusha er image om testerna går igenom för koden. Ni har redan ett workflow som kollar det. Eftersom vi är utvecklare gillar vi att dela upp vår kod i olika filer. Nu ska ni skapa ett nytt workflow (separat fil) som bygger och pushar er image till DockerHub men bara om testerna passerar. Ni uppnår det genom att från det nya workflow:et återanvända det som tester koden.


Läsanvisningar {#las}
--------------------------

<!-- Ny video https://www.youtube.com/watch?v=Me3ea4nUt0U kortare och med om arbetsflödet -->

Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

