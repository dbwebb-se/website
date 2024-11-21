---
author:
    - aar
revision:
    "2023-10-24": "(A, aar) Ny version inför v2. Sammanslagning av kmom01 och kmom02"
...
Kmom01: Introduktion till devops och Docker
==================================

Det är en fullspäckat kurs där vi ska lära oss många ny verktyg och koncept. I kursen ska vi lära oss både om det kulturella inom devops men även det praktiska. Vi börjar med att skaffa en produktionsmiljö och bekantar oss med ett påbörjat projekt som ska kopplas till en CI kedja och driftsätta manuellt.

<!-- more -->

Kmom01 är två veckor långt!

[INFO]
Innan ni börjar jobba med materialet fixa ["GitHub Education Pack och ett domännamn"](kunskap/github-education-pack-och-doman-namn). Det kan ta ett tag innan det blir godkänt.
[/INFO]

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

- [installera labbmiljön](./../labbmiljo). Det är rekommenderat att ha minst python version 3.8. Det finns ett problem med 3.11 så om ni har det byt till en högre eller lägre version.



### Produktions miljö {#prod}

När man jobbar enligt devops ska saker ofta gå snabbt och automatiskt, då underlättar det om man snabbt och enkelt kan starta upp och stänga ner servrar. Därför ska vi använda oss av en molntjänst, mer specifikt [Microsoft Azure](https://azure.microsoft.com/en-us/). OBS! logga inte in via den länken.

#### Att göra {#prod-do}

Jobba igenom:

- [Kom igång med Azure](guide/kom-igang-med-azure).

- [Första 10 minuter på en server](kunskap/10-forsta-minuterna-pa-en-server).

För att komma åt varandras servrar har ni ett par alternativ:

- Lägg till varandras SSH filer som authenticated. Lättaste alternativet.
- Dela era SSH filer med varandra. Inte jättesäkert men OK för oss.
- Skapa en extra användare för varandra på servrarna. Proffsigaste alternativet, men då måste man tänka på att användarna behöver samma rättigheter. Det bli mer att tänka på längre fram.

Om något går fel på servern när ni jobbar med resten av materialen så ni behöver skapa om servern i Azure. Då kan ni använda er av [skripten i repot](https://github.com/dbwebb-se/microblog/tree/master/scripts) för att snabbt göra de 10 första minuterna på en server, så slipper ni göra det manuellt igen.


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

- [Semantisk versionshantering](https://semver.org/lang/sv/), en bra versionsstandard för projekt.

- [CHANGELOG](https://keepachangelog.com/en/1.0.0/), håll koll på vad som ändras mellan versionerna i ett projekt.



## Lästips {#lastips}

- [The 12 Factor App](https://12factor.net/) är en populär "standard" för att bygga Software-as-a-service och  används mycket i devops sammanhang.

- [DevOps Roadmap](https://roadmap.sh/devops) Visar upp vanligaste verktygen man behöver kunna för att jobba med de tekniska delarna av devops.

    - Här kan ni se vilka av verktygen vi kommer använda oss i kursen, [i fylld devops roadmap](image/devops/devops-roadmap-filled.png)


- [Multistage builds](https://docs.docker.com/develop/develop-images/multistage-build/), för vår app är detta kanske inte nödvändigt men det är väldigt bra att känna till.

- [Best practices](https://www.wintellect.com/security-best-practices-for-docker-images/) för Docker.

- [Building Your Production Tech Stack for Docker Container Platform](https://dockercon2018.hubs.vidyard.com/watch/k3Cv676wmxAwYDxbvcgcgC), video från DockerCon 2018.



Läsanvisningar {#read}
--------------------------

Läsanvisningar hittar ni på sidan [bokcirkel](./../bokcirkel).

Kolla i [lektionsplanen](https://dbwebb.se/devops/lektionsplan) för att se när vi träffas för bokcirkeln.



Uppgifter  {#uppgifter}
-------------------------------------------

1. Jobba i ert repo enligt [Hur vi jobbar med repot](#git-read). Det betyder att
    - Ni ska ha feature branches och när ni är klara med en del gör ni pull request till main den andra av er ska göra code review.
    - Ni ska ha en template för commit meddelanden.
    - Ni ska följa semantisk versionshantering.
    - Ni ska ha en CHANGELOG.

1. Skapa en Dockerfile för Microblog. Om ni redan har jobbat igenom [Docker](#docker) delen så är den klar. Lägg filen i mappen `docker`.

    - Validera filen med  `make validate-docker`.
    - Skapa en compose fil, `docker-compose.yml`, i root mappen av ert repo. Lägg till en service som startar prod containern mot en MySQL container. 

        - Kommandot `docker-compose up prod` ska starta en MySQL och en microblog container.

1. Skapa en Dockerfile för testning, `docker/Dockerfile_test`.

    - Vid start ska container köra `make test` och sen stänga ner.
        - mapparna `app` och `tests` ska inte kopieras in utan ligga som volymer.
        - installera `requirements/test.txt` Istället för `prod.txt`.
        - skapa en nytt skript som körs vid uppstart. Det ska köra `make test`, så alla tester körs.
    - Validera Docker filen med  `make validate-docker`.
    - Lägg till en ny service i `docker-compose.yml` som kör test containern. Den ska gå att starta med `docker-compose up test`.
    - Om ni vill, ändra så testerna körs mot en MySQL server istället för SQLite.



1. Sätt upp Continuous Integration. Koppla ditt repo till GitHub Actions. När du gör en commit ska Actions köra alla unittester, integrationtester och validera koden. 

    - Lägg till en Actions [badge](https://docs.github.com/en/actions/monitoring-and-troubleshooting-workflows/adding-a-workflow-status-badge) i README filen för repot.

1. Sätt upp Continuous Delivery i Actions.

    - Skapa ett nytt workflow (separat fil) som bygger och pushar er Docker image till DockerHub men bara om testerna från CI passerar. Ni uppnår det genom att från det nya workflow:et återanvända det som tester koden.
    - CD kedjan ska bara köras vid ny tagg, inte varje kommit.
    - Ni får **inte** använda latest taggen, ni ska ha unika taggar för varje ny release. T.ex. använd er semantiska version som tagg.

1. Lägg till funktionaliteten att följa andras blogginlägg. Jobba igenom [Kom igång med followers](kunskap/kom-igang-med-followers). 

    - När ni är klara med det, skapa en ny release i git. CD kedjan ska bygga och publicerar en ny image med funktionaliteten.

1. Tagga repot, följ semantiska versionshantering fast börja på siffran **11.0.0**. Jag har redan taggar detta repo och då kan ni inte börja på 0. Om ni får komplettering på en inlämning öka versionen.


1. Välj en av era servrar som produktionsserver.

    - Installera Docker på er server.
    - Driftsätt er nya Docker imagen på den.
    - Koppla er image mot en MySQL Docker container. Tänk på att data ska ligga som en volym. Så att all data inte försvinner vid en omstart.
    - Sätt upp [Nginx med HTTPS](kunskap/driftsatta-en-flask-app#conf_nginx) så man kommer åt er Microblog via ett av era domännamn.
    <!-- nginx i docker med https https://medium.com/@pentacent/nginx-and-lets-encrypt-with-docker-in-less-than-5-minutes-b4b8a60d3a71 -->

[YOUTUBE src=LOULXBE3iAE caption="Hur det kan se ut när det är klart"]



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

Svara på nedanstående frågor individuellt, lämna in på Canvas tillsammans med länken till ert gemensamma GitHub-repo och domännamn till microblog sidan.

Se till att följande frågor besvaras i texten:

1. Vad var din uppfattning av devops innan kursen började?

1. Hur skulle du definiera devops än så länge?

1. Har du använt Docker förut? Gick det bra att använda det nu?

1. Hur används Docker inom devops?

1. Vad är Continuous Delivery?

1. Hur var storleken på kursmomentet? Vad tycker du om upplägget på kursmomentet?

1. Veckornas TIL?
