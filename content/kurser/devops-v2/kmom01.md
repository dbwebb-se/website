---

author:
    - aar
revision:
    "2026-10-08": "(C, aar) Ersatt followers med en /version route, tagit bort commit mall och CHANGELOG, dev container som labbmiljö."
    "2025-10-31": "(B, aar) Flyttat Azure delarna till kmom02"
    "2023-10-24": "(A, aar) Ny version inför v2. Sammanslagning av kmom01 och kmom02"
...
Kmom01: Introduktion till devops och Docker
==================================

Det är en fullspäckad kurs där vi ska lära oss många nya verktyg och koncept. I kursen ska vi lära oss både om det kulturella inom devops men även det praktiska. Vi börjar med att bekanta oss med ett påbörjat projekt, packa in det i Docker och koppla det till en CI/CD kedja som bygger och publicerar en ny version varje gång vi släpper en.

<!-- more -->

[INFO]
Innan ni börjar jobba med materialet fixa ["GitHub Education Pack och ett domännamn"](kunskap/github-education-pack-och-doman-namn). Det kan ta ett tag innan det blir godkänt.
[/INFO]

<!-- [WARNING]
Materialet är inte redo. Vänta på att den gula rutan försvinner.
[/WARNING] -->

Kmom01 är två veckor långt!

## Vad är devops? {#devops}

### Läs och titta {#devops-read}

Kolla på följande video för att få en introduktion till ämnet devops. Devops är ett brett ämne med många olika definitioner, här försöker skaparen av CM (Configuration Management) verktyget [Chef](https://www.chef.io) beskriva konceptet och komma fram till en rimlig definition.

[YOUTUBE src="_DEToXsgrPc" caption="Chef Style DevOps Kungfu - Adam Jacob Keynote - ChefConf 2015."]

I videon nedanför får vi en kortare genomgång som fokuserar mer på arbetsflödet.

[YOUTUBE src="Me3ea4nUt0U" caption="Introduction to DevOps | Devops Tutorial for Beginners."]

## Miljö {#env}

Tanken är att vi ska jobba med ett projekt igenom hela kursen och då behöver vi verktyg och program för att jobba med koden. Vi börjar med en lokal utvecklingsmiljö. En produktionsmiljö kommer i kmom02.

### Lokal utvecklingsmiljö {#dev}

Alla verktyg ni behöver finns färdiginstallerade, med bestämda versioner, i en dev container som följer med i Microblog repot. Då slipper ni installera och versionshantera Python, make med flera själva. Vi utökar vad som finns i dev containern under kursen, när vi kommer till ett kursmoment som behöver fler verktyg.

#### Att göra {#dev-do}

- Följ [labbmiljön](./../labbmiljo) och starta dev containern, enligt avsnittet "Dev container". **Klona repot inuti WSL** om ni använder Windows.
- Kör alla kommandon i kursen i VS Codes terminal, den körs i containern.

[INFO]
Appen och Docker containrarna ni startar körs på er dator, inte i dev containern. Webbläsaren på er dator når dem på `localhost:<port>`, men `curl localhost:<port>` i terminalen i VS Code gör inte det.
[/INFO]

Om dev containern inte fungerar för er finns en reservlösning i [labbmiljön](./../labbmiljo), där ni installerar verktygen själva.

## Appen {#app}

Nästa steg är att bekanta dig med appen som du ska jobba med i kursen.

### Läs och titta {#app-read}

- [Introduktion till Devops appen](kunskap/introduktion_till_devops_appen).

## Docker {#docker}

I kursen ska ni packa in er kod i en Docker container för att underlätta utveckling, driftsättning och körning av applikationen.

### Läs och titta {#docker-read}

- [Docker i devops](kunskap/docker-i-devops).

### Att göra {#docker-do}

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

Ni ska jobba enligt GitHub Flow i ert repo. Det betyder att ni ska ha feature branches, göra pull requests och göra code reviews. För att underlätta det ska ni också skriva bra commit meddelanden.

### Läs och titta {#git-read}

- [GitHub Flow](https://docs.github.com/en/get-started/quickstart/github-flow)

- [The seven rules of a great Git commit message](https://chris.beams.io/posts/git-commit/#seven-rules). Använd reglerna när ni skriver commit meddelanden.

- [Semantisk versionshantering](https://semver.org/lang/sv/), en bra versionsstandard för projekt.

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
    - Ni ska ha feature branches och när ni är klara med en del gör ni pull request till huvudbranchen (`master`), den andra av er ska göra code review.
    - Ni ska skriva bra commit meddelanden.
    - Ni ska följa semantisk versionshantering.

1. Skapa en Dockerfile för Microblog. Om ni redan har jobbat igenom [Docker](#docker) delen så är den klar. Lägg filen i mappen `docker`. Filen `boot.sh` från guiden ligger i roten av repot.

    - Validera filen med  `make validate-docker`. Kommandot använder hadolint. Det kan klaga på saker som guiden inte nämner, läs regeln i meddelandet och rätta Dockerfilen. Passar en regel inte kan ni stänga av den för en rad med en kommentar, t.ex. `# hadolint ignore=DL3018`. Skriv då varför.
    - Skapa en compose fil, `docker-compose.yml`, i root mappen av ert repo. Lägg till en service som startar prod containern mot en MySQL container.

        - Kommandot `docker-compose up prod` ska starta en MySQL och en microblog container.

1. Skapa en Dockerfile för testning, `docker/Dockerfile_test`.

    - Vid start ska container köra `make test` och sen stänga ner.
        - mapparna `app` och `tests` ska inte kopieras in utan ligga som volymer.
        - installera `requirements/test.txt` Istället för `prod.txt`.
        - skapa en nytt skript som körs vid uppstart. Det ska köra `make test`, så alla tester körs.
        - imagen behöver innehålla `make` (i Alpine installeras det med `apk add make`) och filerna som `make test` använder: `Makefile`, `pytest.ini`, `.pylintrc` och `.coveragerc`.
    - Validera Docker filen med  `make validate-docker`.
    - Lägg till en ny service i `docker-compose.yml` som kör test containern. Den ska gå att starta med `docker-compose up test`.
    - Om ni vill, ändra så testerna körs mot en MySQL server istället för SQLite.

1. Sätt upp Continuous Integration. Koppla ditt repo till GitHub Actions. När du gör en push, till vilken branch som helst, ska Actions köra alla unittester, integrationtester och validera koden och Dockerfilerna (`make validate-docker`).

    - Använd `ubuntu-24.04` som `runs-on`, inte `ubuntu-latest`. Då ändras inte bygget av sig självt när GitHub byter Ubuntu version.
    - Workflow:et ska köras vid push till en branch men inte när ni pushar en tagg. Då körs testerna bara en gång vid en release, CD workflow:et kör dem själv.
    - Lägg till en Actions [badge](https://docs.github.com/en/actions/monitoring-and-troubleshooting-workflows/adding-a-workflow-status-badge) i README filen för repot.

1. Sätt upp Continuous Delivery i Actions.

    - Skapa ett nytt workflow (separat fil) som bygger och pushar er Docker image till DockerHub men bara om testerna från CI passerar. Ni uppnår det genom att från det nya workflow:et återanvända det som tester koden.
    - CD kedjan ska bara köras vid ny tagg, inte varje kommit.
    - Ni får **inte** använda latest taggen, ni ska ha unika taggar för varje ny release. T.ex. använd er semantiska version som tagg. En git tagg `v11.0.1` ska ge imagen `<användarnamn>/microblog:11.0.1`.
    - Användarnamn och lösenord till DockerHub sparar ni som secrets i GitHub, inte i koden.
    - Workflow:et ska skicka versionen till bygget som build argument `APP_VERSION`, se nästa uppgift.

1. Lägg till en route, `/version`, i Microblog som visar vilken version av appen som körs.

    - Routen ska gå att anropa utan att logga in. Svaret är bara versionen som text, t.ex. `11.0.1`.
    - Versionen ska komma från miljövariabeln `APP_VERSION`, som ni läser i `app/config.py`. Finns den inte ska svaret vara `unknown`.
    - Skriv tester för routen i `tests/integration/main/`. Testa både standardvärdet och ett satt värde.
    - Imagen ska ta emot versionen som ett build argument (`ARG APP_VERSION` i Dockerfilen) och sätta miljövariabeln. I `docker-compose.yml` kan ni skicka med `APP_VERSION` som build argument, ge den ett standardvärde.
    - Skapa en ny release (se nästa uppgift). CD kedjan ska bygga och publicera en ny image. Starta imagen från DockerHub och kontrollera att `/version` visar versionen från taggen.

1. Tagga repot, följ semantiska versionshantering fast börja på siffran **11.0.0**. Jag har redan taggar detta repo och då kan ni inte börja på 0. Taggen ska börja med `v`, t.ex. `v11.0.0`. Skapa också en release på GitHub för taggen och beskriv i release notes vad som har ändrats. Om ni får komplettering på en inlämning öka versionen.

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
