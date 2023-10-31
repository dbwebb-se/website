---
views:
    flash:
        region: flash
        template: default/image
        data:
            src: "image/vteam/logo.png"
author: mos
revision:
    "2023-10-10": "(C, mos) Utbruten till eget dokument."
    "2022-10-24": "(B, mos) Länk till domänbeskrivning."
    "2022-10-10": "(A, mos) Första utgåva inför kursstart HT2022."
...
v02 - Fokus Serversidan
=========================

Jobba vidare med SDS för att bryta ned och förstå systemet och dess delar. Fokus på serversidan av projektet.

<!--stop-->

<!--
TODO

1. Utgå från architecture.svg och en översikt av systemet/arkitekturen [architecture.svg](https://github.com/dbwebb-se/pattern/blob/main/docs/lecture/L02-RESTful-API/architecture.svg), [web](https://dbwebb-se.github.io/pattern/lecture/L02-RESTful-API/architecture.svg)

    * Utgå från bilden och börja skissa på backenden
    * Rita och skissa, prata och diskutera
    * MVC, web, rest, db, sas, möjliga artifekter, programmeringskod, ramverk, språk

2. Designa ett REST API.

    * I lektionen skissade vi på en [REST API matris](https://docs.google.com/spreadsheets/d/1V_2KmGhWYd4qShBpHRBNepor11cSS6YxFjAHmlPEtJ4/edit?usp=sharing) som en variant av hur man kan skissa och designa sitt REST API. På ett sätt är detta jämförbart med hur man skissar och designar en databas med ER-modellering.
    * Hur dokumentera ett REST API? [REM server](https://rem.dbwebb.se/) som exempel.

3. Hur jobba med Git repon (GitHub eller GitLab) när man jobbar i grupp?

    * [Understanding the GitHub flow](https://guides.github.com/introduction/flow/)
    * [Introduction to GitLab Flow](https://docs.gitlab.com/ee/topics/gitlab_flow.html)

4. Vad innebär "högpresterande team" och vad är "bike shedding"?

    * [Tuckman's stages of group development](https://en.wikipedia.org/wiki/Tuckman%27s_stages_of_group_development)
    * [High-performance teams](https://en.wikipedia.org/wiki/High-performance_teams)
    * [Bike shedding / Law of triviality](https://en.wikipedia.org/wiki/Law_of_triviality)

5. Tekniska studier och rapporter för att lära sig och sprida kunskap.

    * https://dbwebb.se/kurser/vteam-v1/tips-trix-och-fortydliganden#tech
-->



Projekt {#proj}
-------------------------




Föreläsning {#flas}
-------------------------

Följande är föreläsningsmaterial som hanteras under veckan.

1. [System Design Specification (SDS)](./../forelasning/sds) berättar om systemarkitekturer och hur man med olika verktyg, bilder och texter kan analysera ett system och visualisera och berätta för sin omgivning hur systemet är tänkt att fungera och byggas.



Uppgifter {#uppgift}
-------------------------

* Fortsätt jobba med uppgiften SDS:en.
* Tekniska rapporter



Team {#team}
-------------------------

Något om grupppsykologi och mognadsfaser i grupp?

Vad är viktigast för att ha ett välmående team?

<!--
Om effektiva team, bild från BTH
https://drive.google.com/drive/folders/1d402GyUORehBNtypJzfHx6Pe80kYXSUQ
-->



Torsdag standup
-----------------------

Denna veckan fokuserar vi på:

1. XXX

GitHub Projects




**Presentation**

Vi träffas och pratar som saker som hjälper oss framåt.

1. Jobba med arkitekturen och backenden samt olika teknikval
1. Designa och dokumentera ett REST API
1. GitHub/GitLab flow
1. Effektiva och högpresterande team
1. Tekniska studier och rapporter för att lära sig och sprida kunskap.
    * Någon som är sugen på en teknisk studie om Docker med många containrar?

**Resurser**

Följande läsresurser är relevanta denna veckan.

Följande artikelserie tar dig igenom hur man kan tänka när man designar ett REST API. Du får också stöd för hur du kan designa ditt API med en matris som lite kan liknas vid hur vi designade databasen med ER-modellering.

1. [How to design a RESTful API architecture from a human-language spec (part 1)](https://www.oreilly.com/content/how-to-design-a-restful-api-architecture-from-a-human-language-spec/)
1. [How a RESTful API server reacts to requests (part 2)](https://www.oreilly.com/content/how-a-restful-api-server-reacts-to-requests/)
1. [How a RESTful API represents resources (part 3)](https://www.oreilly.com/content/how-a-restful-api-represents-resources/)

Dokumentation av REST API:er.

1. Här är en [REM server](https://rem.dbwebb.se/) som visar ett exempel på hur en API:et till en REST server kan se ut och som kan användas för test. Använd en REST klient likt [ARC](https://advancedrestclient.com/) för att testa API:et.

1. [Emils dokumentation av REST API:et för lager API:et](https://lager.emilfolino.se/v2).


Hur jobba med Git repon (GitHub eller GitLab) när man jobbar i grupp?

* [A successful Git branching model](https://nvie.com/posts/a-successful-git-branching-model/)
* [Understanding the GitHub flow](https://guides.github.com/introduction/flow/)
* [Introduction to GitLab Flow](https://docs.gitlab.com/ee/topics/gitlab_flow.html)

Vad innebär "högpresterande team" och vad är "bike shedding"?

* [Tuckman's stages of group development](https://en.wikipedia.org/wiki/Tuckman%27s_stages_of_group_development)
* [High-performance teams](https://en.wikipedia.org/wiki/High-performance_teams)
* [Bike shedding / Law of triviality](https://en.wikipedia.org/wiki/Law_of_triviality)

Tekniska rapporter för att göra små korta utredningar och presentera resultat.

* [Exempel på tekniska studier och rapporter](https://dbwebb.se/kurser/vteam-v1/tips-trix-och-fortydliganden#tech)

