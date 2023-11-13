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
v03 - Fokus Klientsidan
=========================

Jobba med SDS. Fokus på klientsidan av projektet.

<!--stop-->

<!--
TODO

* Tekniker för klientsidan
* Docker

CHANGE

* Uppdatera seminarie slidesen till att bli tydliga delar med en tydlig inriktning. Varje del kan spelas in för sig.
* Projektplanering med GitHub project
* Förbättra/förtydliga slides/fokuset på klientsidans tekniker (gör egen artikel?) Kika lite på vad artikeln från IBM innehåller och gör liknande slidespresentation.
* Fundera på hur lägga upp "industrin och jobba i grupper". kanske skriva en egen artikel om det?
* Förbättra docker-exemplet, inkludera dokumentation.

-->

Projekt {#proj}
-------------------------




Föreläsning {#flas}
-------------------------

Följande är föreläsningsmaterial som hanteras under veckan.

1. [System Design Specification (SDS)](./../forelasning/sds) berättar om systemarkitekturer och hur man med olika verktyg, bilder och texter kan analysera ett system och visualisera och berätta för sin omgivning hur systemet är tänkt att fungera och byggas.



Uppgifter {#uppgift}
-------------------------

* Fortsätt jobba uppgiften SDS:en.
* Tekniska rapporter



Team {#team}
-------------------------


4. Vad innebär "högpresterande team" och vad är "bike shedding"?

    * [High-performance teams](https://en.wikipedia.org/wiki/High-performance_teams)
    * [Bike shedding / Law of triviality](https://en.wikipedia.org/wiki/Law_of_triviality)



Torsdag standup
-----------------------

Denna veckan fokuserar vi på:

1. XXX





Jobba med SDS. Fokus på klientsidan av projektet.

**Presentation & Seminarie**

Vi träffas och pratar som saker som hjälper oss framåt.

1. Allmänt om arkitektur, teknik och mjuka värden.

    * [Slides från måndagen](https://dbwebb-se.github.io/pattern/lecture/L03-seminar/slide2.html)

**Resurser**

1. Vilka varianter finns det för att bygga klienter med webbteknologier?
    * Mobile app via webbläsaren, responsiv eller utvecklad enbart för små enheter, baserad på klassisk server-side generering av webbsidor.
    * Single Page Application (SPA)
        * React, Angular, Vue, Mithril
    * Progressiva web appar
        * [web.dev: Progressive Web Apps](https://web.dev/progressive-web-apps/)
        * [MDN: Progressive web apps (PWAs)](https://developer.mozilla.org/en-US/docs/Web/Progressive_web_apps)
    * [Apache Cordova](https://cordova.apache.org/) kompilera HTML, CSS, JS till nativ applikation.
    * "Native apps", kompilerade för respektive enhet.
        * iPhone med Swift och Objective-C
        * Android med Java/Kotlin
    * [Electron](https://www.electronjs.org/), "Build cross-platform desktop apps with JavaScript, HTML, and CSS".

1. "[Choosing the best programming language for mobile app development](https://developer.ibm.com/articles/choosing-the-best-programming-language-for-mobile-app-development/)" är en artikel som kortfattat nämner flertalet av ovan tekniker för att bygga klientapplikationer med webbaserade teknologier.

1. Docker med exempel på hur images byggs och containrar startas upp och kommunicerar.
    * [Repo på GitLab med exempelkod](https://gitlab.com/mikael-roos/docker)

1. Hur ser industrin på att organisera sig i team och grupper?
    * [Martin Mazur - Dagens Industri IT & Strategy](https://www.linkedin.com/feed/update/urn:li:activity:6861311477781970944/)

1. Vilka krav har industrin på nya studenter?
    * [Jane Strandberg, teamleader och chef, Prisjakt](https://gist.github.com/mosbth/76a4d7a503e45692d28c4c0dcd029703)
