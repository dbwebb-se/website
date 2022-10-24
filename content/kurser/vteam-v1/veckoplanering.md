---
views:
    flash:
        region: flash
        template: default/image
        data:
            src: "image/vteam/logo.png"
author: mos
revision:
    "2022-10-10": "(A, mos) Första utgåva inför kursstart HT2022."
...
Veckoplan med kursveckor - vad händer och vad göra?
=========================

Detta dokument uppdateras löpande under kursen, som minnesnoteringar för vad som händer i varje kursvecka.

Varje kursvecka förekommer ett eller flera fokusområden som presenteras från lärarteamet med föreläsningar och/eller artiklar. Dessa fokusområden skall sedan diskuteras och hanteras i grupperna och införlivas i gruppens arbete.

<!--
* Problemlösning, prioritering och implementering utifrån en kravspecifikation.
• Utveckling i ramverk för webbapplikationer.
• Test och kvalitetssäkring av kod.
• Begreppet "god och snygg kod" (clean code).
• Driftsättning av större projekt samt analys av projektets eventuella bidrag inom begreppet "hållbarhet".
• Arbete i team där team inte är bundna till tid eller fysisk plats.
• Att tillsammans med teamet bygga ett större system efter en kravspecifikation och enligt en uppsatt tidplan.
• Hur skapa ett gott och gynnsamt gruppklimat.


TODO

* Maila refgruppen och be om tips - vad säga till studenterna om vad som är viktigt när man jobbar i grupp och vilka arbetssätt som normalt förekommer ute.

* Förra årets lektioner och läsanvisningar:
https://bth.instructure.com/courses/4367/modules/items/125416


LINKS

* vteam streams https://www.youtube.com/playlist?list=PLKtP9l5q3ce_wXroqbxvzSNBzi2Yy8ULF
* vteam How To https://www.youtube.com/playlist?list=PLKtP9l5q3ce9BUGisXHdP8dueMoaXyQ71

* Förra årets streams:
https://www.youtube.com/playlist?list=PLKtP9l5q3ce9JglLprvPbXklQiAC_Jizu

-->



Förbered inför kursen
-------------------------

Skaffa dig en grupp genom att till exempel annonsera att du söker en grupp i kursens chattkanal eller prata med dina studiekompisar.



Vecka 01 (v44): Kund och uppdrag
-------------------------

<!--
TODO 

* Kursintroduktion och genomgång av kravspecen.
* Presentation av systemarkitekturer och genomgång av uppgiften SDS.
-->

Kursen startar och projektet presenteras tillsammans med kursens upplägg. Kundens kravbild gås igenom. Första uppgiften gås igenom, det handlar om förutsättningar för att skapa en översikt av systemet via en System Design Specification (SDS). Vi pratar om olika typer av arkitekturer när man bygger ett större system.

Innan veckan är slut skall alla finnas i en grupp. Gruppstorleken är 4 studenter.

**Presentation**

* TBD

<!--
* [System Design Specification (SDS) (slides)](https://dbwebb-se.github.io/pattern/lecture/L01-system-design-specification/slide.html)
-->

**Resurser**

Följande läsresurser är relevanta denna veckan.

1. [Software architecture patterns - Take a deep dive into several common software architecture patterns](https://www.oreilly.com/content/software-architecture-patterns/)
    1. [The top 5 software architecture patterns: How to make the right choice (shorter article on the same matter)](https://techbeacon.com/app-dev-testing/top-5-software-architecture-patterns-how-make-right-choice)
1. [The Big Ball of Mud and Other Architectural Disasters](https://blog.codinghorror.com/the-big-ball-of-mud-and-other-architectural-disasters/)
    1. [Big Ball of Mud (original paper)](http://www.laputan.org/mud/mud.html)
    1. [Why Software Becomes a Big Ball of Mud (yet another (short) article on the matter)](https://pressupinc.com/blog/2015/04/why-software-becomes-a-big-ball-of-mud/)
1. [What UML diagram should I use to show a platform's architecture? (TLDR; "make it look good")](https://softwareengineering.stackexchange.com/questions/198178/what-uml-diagram-should-i-use-to-show-a-platforms-architecture)



Vecka 02 (v45): Fokus Serversidan
-------------------------

<!--
TODO

* Införa någon form av standup, kanske på torsdagarna?

* Måndags-zoom - Genomgång av REST API
* Måndags-zoom - Skissa och designa ett REST API utifrån en matris
* Måndags-zoom - Tips om bike-shedding och tips om att jobba med Git/GitHub

-->

Jobba vidare med SDS för att bryta ned och förstå systemet och dess delar. Fokus på serversidan av projektet.

<!--
En övergripande bild visades, för att översiktligt förklara en arkitektur.

* https://github.com/dbwebb-se/pattern/blob/main/docs/lecture/L02-RESTful-API/architecture.svg
* https://dbwebb-se.github.io/pattern/lecture/L02-RESTful-API/architecture.svg

Designa ett REST API.

* I lektionen skissade vi på en [REST API matris](https://docs.google.com/spreadsheets/d/1V_2KmGhWYd4qShBpHRBNepor11cSS6YxFjAHmlPEtJ4/edit?usp=sharing) som en variant av hur man kan skissa och designa sitt REST API. På ett sätt är detta jämförbart med hur man skissar och designar en databas med ER-modellering.

Hur jobba med Git repon (GitHub eller GitLab) när man jobbar i grupp?

* [Understanding the GitHub flow](https://guides.github.com/introduction/flow/)
* [Introduction to GitLab Flow](https://docs.gitlab.com/ee/topics/gitlab_flow.html)

Vad innebär "högpresterande team" och vad är "bike shedding"?

* [Tuckman's stages of group development](https://en.wikipedia.org/wiki/Tuckman%27s_stages_of_group_development)
* [High-performance teams](https://en.wikipedia.org/wiki/High-performance_teams)
* [Bike shedding / Law of triviality](https://en.wikipedia.org/wiki/Law_of_triviality)
-->

**Presentation**

* TBD

<!--
* Om olika sätt att rita bilder till SDS:en? Från Java-kursen. Inkl något om att jobba i projekt och hålla kontakten?
-->

**Resurser**

Följande läsresurser är relevanta denna veckan.

<!--
Följande artikelserie tar dig igenom hur man kan tänka när man designar ett REST API. Du får också stöd för hur du kan designa ditt API med en matris som lite kan liknas vid hur vi designade databasen med ER-modellering.

1. [How to design a RESTful API architecture from a human-language spec (part 1)](https://www.oreilly.com/content/how-to-design-a-restful-api-architecture-from-a-human-language-spec/)
1. [How a RESTful API server reacts to requests (part 2)](https://www.oreilly.com/content/how-a-restful-api-server-reacts-to-requests/)
1. [How a RESTful API represents resources (part 3)](https://www.oreilly.com/content/how-a-restful-api-represents-resources/)

Här är en [REM server](https://rem.dbwebb.se/) som visar ett exempel på hur en API:et till en REST server kan se ut och som kan användas för test. Använd en REST klient likt [ARC](https://advancedrestclient.com/) för att testa API:et.

Torsdagen hade vi en session om riskanalys av projektet som också spelades in.

* [Riskanalysdokumentet](https://docs.google.com/spreadsheets/d/1jqmyl1bKGc7La81MfwGVY0JqVPmopM0oG9s8-gCGEkc/edit?usp=sharing)
* [Zoom-sessionen om riskerna](https://youtu.be/r-c7ETb80M0)
-->



Vecka 03 (v46): Fokus Klientsidan
-------------------------

Jobba med SDS. Fokus på klientsidan av projektet. Gräv djupare in i serversidan.

<!--
Hur ser industrin på att organisera sig i team och grupper?

* [Martin Mazur - Dagens Industri IT & Strategy](https://www.linkedin.com/feed/update/urn:li:activity:6861311477781970944/)

Vilka krav har industrin på nya studenter?

* [Jane Strandberg, teamleader och chef, Prisjakt](https://gist.github.com/mosbth/76a4d7a503e45692d28c4c0dcd029703)
* Input från en annan XXX som jobbar på ett av Sveriges största IT-bolag

[Presentationen från måndagen (lite arkitektur och lite om teams)](https://dbwebb-se.github.io/pattern/lecture/L03-seminar/slide.html)
-->



Vecka 04 (v47): SDS Klar
-------------------------

Leverans av SDS.

<!--
* Individuell reflektion över arbetet så här långt samt se vilken plats man själv tar i projektet.
    * Fundera på om det är något man vill ändra för resten av projektet.
-->


<!--
Vad vill näringslivet att vi skall kunna när vi kommer ut? Vilket behov upplever de att de har av programmerare och vilka krav ställer de på nyanställda? Mikael har pratat med gamla studenter och samlat ihop vad de anser vara viktigt.

[Teknisk studie i OAuth](https://github.com/mosbth/oauth-tec-study/blob/main/OAuth_Technical_Study.md). Hur sprider man denna typen av kunskap i en arbetsgrupp och mellan grupper?

Automatisera tester och byggen med byggtjänster och tjänster för kodkvalitet.

(Docker, docker-compose, en miljö för test och utveckling.)

**Torsdag**

Denna veckan blir det ingen Q&A session, istället finns det två videor/föreläsningar att titta på och en liten mini-uppgift som gäller att besvara frågan.

> "Vad innebär "vacker kod" och är det något vi kan applicera i vårt projekt?"

1. Video 1 "[The concept of Good and Clean Code](https://www.youtube.com/watch?v=drkATTaqEiw)"
1. Video 2 "[Software philosophies and principles](https://www.youtube.com/watch?v=xLCHREF5I-I)"

Mini-uppgiften löser du i 'Reflektera över "Good and Clean Code"'.
-->



Vecka 05 (v48): Implementera
-------------------------

Påbörja implementationsfasen av projektet och implementera systemet enligt er SDS.

<!--
Vi hade en kort generell avstämning av läget, allt verkar så här långt "se bra ut". Det dyker inte upp så många frågor.

Man kan nu boka in en tid för att leverera i december och vi fortsätter med korta träffar på måndagar och torsdagar inleds med en timme öppet hus för frågor och därefter kan man boka in gruppvis diskussioner.

(Övriga diskussioner kring implementationen av systemet, eventuellt justeringar av kraven.)

(Hur simulerar man ett system i drift?)
-->



Vecka 06 (v49): Teknikval
-------------------------

Lämna in de teknikval ni gjort för projektet och berätta kort om hur ni kommer att implementera systemet.



Vecka 07 (v50): Implementera projektet
-------------------------

Jobba med implementationen av projektet och se till att kontinuerligt integrera teamets arbete i en helhet.

Första möjligheten att göra en leverans av systemet.



Vecka 08 (v51): Implementera projektet
-------------------------


Vecka 09 (v52): Implementera projektet
-------------------------


Vecka 10 (v01): Förbered inför leverans
-------------------------

Jobba med projektet och förbered inför leveransen. Genomför en egenkontroll i form av en avstämning inför slutleveransen, vad skall finnas med och hur skall det leveraras, dokumenteras, presenteras och testköras?



Vecka 11 (v02): Leverans och redovisning
-------------------------

Gruppen levererar systemet och presenterar arbetet och demonstrerar att systemet fungerar.

Avslutningsvis skrivs en slutrapport från gruppens projektarbetet. Slutrapporten innehåller även en erfarenhetsrapport med lärdomar.

Varje deltagare skriver också en avslutande summering av sina egna erfarenheter och lärdomar av gruppens arbete och kursens utformning.

<!-- Vad gjorde vi bra och vad kan vi göra bättre nästa gång samt fem viktiga tips (tekniska tips och grupptips) till grupperna som går detta projekt nästa år -->



<!--
* Påvisa goda kunskaper i att designa större applikationer och system inom webbteknologier genom att skriftligen beskriva och sammanfatta arkitekturen för systemet.
* Påvisa goda kunskaper att jobba i en grupp och aktivt delta i gruppens löpande arbete samt inse olika kriterier som kan ge en hälsosam grupp.

* Utifrån en större kravspecifikation kunna designa, utveckla och leverera ett komplett och fungerande system där möjlighet till olika prioriteringar medges.
* Visa mycket god förmåga att skapa kod som kan betraktas som ”god och snygg kod” genom att använda filosofier, tester och analysverktyg som hjälper att skapa en bild av det som kan vara "god kod".

* Självständigt och i grupp kritiskt kunna utvärdera och analysera sin tekniska lösning och de
prioriteringar som ledde fram till den.
* Självständigt och i grupp reflektera över de byggstenar som gör en god och hälsosam grupp och
grupparbete.
-->