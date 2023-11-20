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
v01 - Kund och uppdrag
=========================

Kursen startar och projektet presenteras tillsammans med kursens upplägg. Kundens kravbild gås igenom. Första uppgiften gås igenom, det handlar om förutsättningar för att skapa en översikt av systemet via en System Design Specification (SDS). Vi pratar om olika typer av arkitekturer när man bygger ett större system.

Innan veckan är slut skall alla finnas i en grupp.

<!--
TODO

* Lägg till så man skapar en mall för SDS? Eller som en egen video som spelas in.

* Rita bild om stakeholders för projektet. Kan koppla in den bilden när man gör riskanalysen.

* Hitta process hur man tar krav och överför till features, så man kan stämma av att alla krav utförs samt att man får möjlighet att prioritera dem. Kan kopplas till aktiviteter. Kan kopplas till riskanalysen?

* Skapa material för röd tråd om projektplanering från att bryta ned kraven till att planera aktiviteter i backlogg i github projetcts. inklusive övergripande vecko plan

* Skapa material för röd tråd om git, github, docker, issues, github projects, github actions, devops... Automatisera tester och byggen med byggtjänster och tjänster för kodkvalitet.

* Gör röd tråd med input från näringslivet, spela in intervjuver som material?



-->



Kursintro {#intro}
-------------------------

Vi går igenom kursens formalia, upplägg och fokus.



Projekt {#proj}
-------------------------

Vi tittar på de viktiga grunddokumenten i projektet, vi börjar med bakgrundsanalysen/domänbeskrivningen och vi går snabbt igenom kravspecifikationen. 

Vi tittar även på tips och trix som kan vara bra att veta om samt de tekniska rapporter som finns från föregående års studenter.



Föreläsning {#flas}
-------------------------

Följande är föreläsningsmaterial som hanteras under veckan.

1. [System Design Specification (SDS)](./../forelasning/sds) berättar om systemarkitekturer och hur man med olika verktyg, bilder och texter kan analysera ett system och visualisera och berätta för sin omgivning hur systemet är tänkt att fungera och byggas.

Studera följande.

1. [Software architecture patterns - Take a deep dive into several common software architecture patterns](https://www.oreilly.com/content/software-architecture-patterns/). Läs artikel om 5 vanliga designmönster för arkitektur.

1. [The Big Ball of Mud and Other Architectural Disasters](https://blog.codinghorror.com/the-big-ball-of-mud-and-other-architectural-disasters/). Läs artikeln om vad som händer när arkitekturen blir fel.



Uppgifter {#uppgift}
-------------------------

* Börja jobba med [uppgiften SDS:en](./../assignment/system-design-specification).



Team {#team}
-------------------------

Är alla indelade i ett team? Annars löses det under första träffen.

Ni bör ha ett första möte i ert team där ni pratar med varandra så alla får berätta lite om sig själva och sin ambition i kursen. Låt alla berätta vad de är duktiga på. Lyssna.

Bestäm hur ni skall ha era träffar i teamet, hur skall ni kommunicera löpande så att ni inte tappar varandra och alltid är synkade?

Behöver ert team ha någon som har en ledande roll, någon som är sammankallande?

Bestäm vad ni gör till nästa vecka, så att alla har uppgifter att utföra. Börja nästa möte med en avstämning så alla får berätta vad de gjort och hur långt de kommit.

Studera följande.

1. [Vilken är din roll i gruppen?](https://www.youtube.com/watch?v=7KSCvPwNrzE&list=PLKtP9l5q3ce9BUGisXHdP8dueMoaXyQ71) Emil lyfter frågan om hur en grupp organiserar sig och vilken roll man tar på sig.



Torsdag standup
-----------------------

Varje torsdag har vi standup möten, läs om hur vi genomför [torsdagens standup](kurser/vteam-v1/assignment/virtuell-stand-up).

Denna veckan har vi fokus på:

1. Var är nu absolut viktigast för att komma igång på bästa sätt?

    * Git
    * GitHub
        * Actions
        * Project
    * Docker
    * Mall till SDS

2. Tips från förra årets studenter (vad skrev de i sina slutrapporter)?

3. Planering, hur kan vi övergripande göra en enklare tidplanering för projektet?

<!--
* [Dokument för 2023](https://docs.google.com/document/d/1pDRVOwz0e58zwFZJsefQCCb79ZWnzvkl6mLTrQWn2QM/edit?usp=sharing)
* [Dokument från 2022](https://docs.google.com/document/d/1F2yxBIUW2sR_IkPK5iJsrhvEuSGX_W2mci9X5hVqVAM/edit?usp=sharing)
-->
