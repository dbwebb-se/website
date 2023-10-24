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



# CI {#ci}


Vi vill ha en CI-kedja till repot så att testerna automatiskt körs när du gör push. I kursen har jag valt att använda [GitHub Actions](https://docs.github.com/en/actions). Nu ska du läsa igenom en artikel som visar hur vi kan använda Actions för python projekt. När du gjort det ska du göra det för ditt forkade repo.

Läs igenom ["Building and testing Python"](https://docs.github.com/en/actions/automating-builds-and-tests/building-and-testing-python).

Läs först om hur man kan återanvända workflows och skapa sen ett nytt workflow som bygger och pushar er docker image.
- [Reusing workflows](https://docs.github.com/en/actions/using-workflows/reusing-workflows). Tips, starta kmom01 flödet från kmom02 flödet.
- [Publishing Docker images](https://docs.github.com/en/actions/publishing-packages/publishing-docker-images). Dokumentation om [alternativ till att bygga er image](https://github.com/docker/build-push-action#customizing)

# CD {#cd}




Uppgifter  {#uppgifter}
-------------------------------------------

Ett repo
Branches och pull request. peer review.
1. Bättre commit meddelanden:
    - [The seven rules of a great Git commit message](https://chris.beams.io/posts/git-commit/#seven-rules). Ni kan också läsa stycket ovanför, i länken, om varför det är viktigt.
    - [Keeping Git Commit Messages Consistent with a Custom Template ](https://dev.to/timmybytes/keeping-git-commit-messages-consistent-with-a-custom-template-1jkm). I denna kursen kan ni t.ex. använda vilket kursmoment ni jobbar på i footern.

1. [Semantisk versionshantering](https://semver.org/lang/sv/), en bra versionsstandard för projekt. Vi följer inte riktigt den i kursen för att jag vill ha ny siffra för varje kursmoment.

1. [CHANGELOG](https://keepachangelog.com/en/1.0.0/), håll koll på vad som ändras mellan versionerna i ett projekt.


- Döp din Dockerfile till `Dockerfile_prod` och lägg den i mappen `docker`.

Läsanvisningar {#las}
--------------------------

<!-- Ny video https://www.youtube.com/watch?v=Me3ea4nUt0U kortare och med om arbetsflödet -->

Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

