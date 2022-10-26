---
title: devops (v1)
author:
    - aar
    - mos
revision:
    "2022-10-26": "(D, aar) Uppdaterade kurskod/kursplan."
    "2020-01-24": "(C, aar) Ändrade hur kmoms ger poäng."
    "2019-04-16": "(B, aar) Uppdaterad inför V1."
    "2018-12-06": "(A, mos) Första revisionen efter kursens inrättande."
...
Kursen devops (v1)
==================================

Kursen **Kontinuerlig integration och driftsättning i molnet**, a.k.a. *devops*, lär ut hur man jobbar med utveckling och it-drift tillsammans genom att lära grunderna i att sätta upp och automatisera processer för kontinuerlig integration och driftsättning i en molnbaserad miljö.

<!--more-->



Förkunskaper {#forkunskaper}
------------------------

Det formella förkunskapskravet är:

> För tillträde till kursen krävs avklarade kurser motsvarande 45 högskolepoäng inom området datavetenskap/programvaruteknik/telekommunikation varav minst 20hp inom programmering och databaser.



Innehåll {#innehall}
------------------------

Kursen omfattar följande områden:

* Innebörden av arbetsfilosofin DevOps

* Kontinuerlig integration (Continuous Integration CI)

* Kontinuerlig driftsättning (Continuous Deployment - CD)

* Automatisering av processer för testning, byggning och driftsättning.

* Virtualisering med Docker för utveckling, test och driftsättning

* Testning av kod och applikation

* Versionshantering av kod

* Relaterade verktyg och tekniker.



Mål {#mal}
------------------------

Följande är kursens mål, indelat i undergrupper.



### Kunskap och förståelse {#kunskap}

Efter genomförd kurs skall studenten:

* vara väl bevandrad i arbetsfilosofin DevOps och ha en övergripande förståelse för dess användning, fördelar och nackdelar.

* ingående redogöra för utveckling baserat på DevOps och de tekniker som omfattas genom att skriftligen beskriva och sammanfatta erfarenheter och observationer från övningar.

* kunna visa goda kunskaper i att använda valda tekniker genom att tillämpa dessa tekniker i praktiska övningar.



### Färdighet och förmåga {#fardighet}

Efter genomförd kurs skall studenten:

* ha en grundlig, både teoretisk och praktisk, förmåga att förstå och använda Docker

* kunna utveckla, dokumentera och presentera ett projekt som använder verktyg och processer för automatisk CI och CD.

* ha god praktisk förmåga att hantera de verktyg och utvecklingsmiljöer som används vid utveckling och felsökning vid CI och CD.



### Värderingsförmåga och förhållningssätt {#vardera}

Efter genomförd kurs skall studenten:

* översiktligt förstå, kunna förklara samt allmänt kunna argumentera val av miljö och verktyg för DevOps och CI.



Kursmoment {#kursmoment}
------------------------

Kursen är uppdelad i kursmoment där varje kursmoment uppskattas till 20h studerande i form av programmering, undersökning, läsande, övningar, uppgifter, redovisning och eftertanke. Alla kursmoment skall redovisas och du samlar alla redovisningar i din me-sida.

Kursen avslutas med ett större avslutande moment som examinerar kursen.



### Kmom01: Introduktion till DevOps {#kmom01}

Vi startar kmom01 med att bekanta oss med koden för ett redan påbörjat projekt. Vi behöver servrar för att driftsätta projektet och ska ska använda oss av [Azure](https://azure.microsoft.com/) för att hosta servrar i molnet. Dessutom börjar vi titta på innebörden av DevOps.

Läs [instruktionen till kursmoment 01](./kmom01).



### Kmom02: Docker {#kmom02}

Vi packar in vårt kod i en Docker container och lär oss används docker-compose. Samtidigt ser vi till att fixa en Docker container för utvecklingsmiljön och en för produktionsmiljön.

Läs [instruktionen till kursmoment 02](./kmom02).



### Kmom03: Configuration Management och Continuous Deployment {#kmom03}

Vi lär oss CM verktyget Ansible och använder det för att enkelt kunna skapa nya servrar och driftsätta vår kod.


Läs [instruktionen till kursmoment 03](./kmom03).



### Kmom04: Monitoring och logging {#kmom04}

Nu när vi har ett system upper och rullande behöver vi veta när något går fel, vi ska börja övervaka systemet.

Läs [instruktionen till kursmoment 04](./kmom04).



### Kmom05: Continuous Security {#kmom05}

Devops handlar om att brygga kommunikationsbarriärer, det är stort fokus på development och operations teams men även security behöver inkluderas för att det ska bli ett bra resultat. I detta kursmoment ska vi kolla på hur vi kan inkludera säkerhet i hela utvecklingsprocessen, så att alla blir ansvariga för säkerhet i ett projekt.


Läs [instruktionen till kursmoment 05](./kmom05).



### Kmom06: Container orchestration {#kmom06}

Er Microblog har fått många nya användare och ni behöver utöka er infrastruktur för att hantera tycket på servrarna. Ni börjar med att utöka hur ni använder Ansible och startar upp fler servrar och containrar på servrarna. Dock märker ni snabbt att det är krångligt och Ansible är inte gjort för att användas till detta. Istället  börjar ni läsa på om container orchestration.

Läs [instruktionen till kursmoment 06](./kmom06).



### Kmom07/10: Uppsats {#kmom10}

Avslutningsvis skriver du en uppsats. Uppsatsen är det sista som du gör och tillsammans med alla redovisningar används detta som underlag för att examinera dig från kursen.

Läs [instruktionen till kursmoment 07/10](./kmom10).



Kurslitteratur {#litteratur}
----------------------------

[Måste jag skaffa kurslitteraturen](kurser/maste-jag-skaffa-kurslitteraturen)?



### Kurslitteratur {#kurslitteratur}

Som kurslitteratur har jag valt följande böcker. Det är en god idé att läsa igenom dessa  under kursen, det finns läsanvisningar till dessa i samband med varje kursmoment.
* **[Effective DevOps](http://tinyurl.com/y6jy5x8u)** -- Jennifer Davis, Ryn Daniels  

  Building a Culture of Collaboration, Affinity, and Tooling at Scale.



### Referenslitteratur {#referenslitteratur}

Följande böcker har jag valt som referenslitteratur. De kan vara bra att ha tillhands och ger lite extra läsmöjligheter. De behövs inte för att klara kursen men vill du bemästra kursens område så är dessa böcker bra startpunkter. Välj och vraka och ta ett eget beslut om de böcker du vill använda.


* **[Securing DevOps](http://tinyurl.com/y659zjwc)** -- Julien Vehent 
  Explores how the techniques of DevOps and security should be applied together to make cloud services safer.

* **[The Pheonix Project](kunskap/boken-the-pheonix-project)** -- Gene Kim, Kevin Behr, George Spafford  
  En roman om en IT chef som går över till DevOps.



### Övrig litteratur {#ovriglitteratur}

I varje kursmoment kan det tillkomma läsanvisningar i till exempel artiklar, manualer och webbmaterial.



Rekommenderad studieplan {#studieplan}
---------------------------------------------

Kursen har en [rekommenderad studieplan](kurser/devops/studieplan) som visar en översikt över kursens olika moment och när de i tiden bör utföras för att studenten skall ligga i fas med kursens planering.

I studieplanen visas när rättning sker av respektive inlämnat moment samt när det finns möjligheter att göra restinlämningar.

Läs mer om den [rekommenderade studieplanen](kurser/faq/rekommenderad-studieplan).



Lektionsplan {#lektionsplan}
---------------------------------------------

Det finns en [lektionsplan](kurser/devops/lektionsplan) som visar en detaljplanering för undervisningen i kursen, vecka för vecka.

Läs mer om [lektionsplanen](kurser/faq/lektionsplan).



Handledning {#handledning}
----------------------------------------

Förutom den planerade undervisningen enligt lektionsplanen så kan du få hjälp och stöd i kursens chatt och i Diskussioner på Canvas. Chatten lämpar sig för korta enkla frågor och Diskussioner för mer utredande och längre frågor och svar. Om du inte får svar i chatten så rekommenderas att du postar i Diskussioner.

Läs om [lärarstöd och handledning](kurser/faq/lararstod-och-handledning).



Betygsättning {#betyg}
------------------------

Det finns ett särskilt dokument som beskriver [hur bedömning och betygsättning sker](kurser/bedomning-och-betygsattning). 



Ladok {#ladok}
------------------------

Enligt kursplanen finns ett antal ladokmoment och de är kopplade till kursens kursmoment enligt följande.

| Kursens moment           | Ladok moment enligt kursplan  |
|--------------------------|-------------------------------|
| Kmom01 + kmom02 + kmom03 | Inlämningsuppgift 1 á 2.5hp   |
| Kmom04 + kmom05 + kmom06 | Inlämningsuppgift 2 á 2.5hp   |
| Kmom07 - kmom10          | Inlämningsuppgift 3 á 2.5hp   |

Den sista inlämningen bestämmer kursens slutbetyg vilket utfärdas när samtliga moment godkänts.

Totalt omfattar kursen 7.5hp.

Läs mer om [rapportering av resultat](kurser/faq/resultatrapportering).



Kursutvärdering och kursutveckling {#kursutvardering}
-----------------------------------------------------

Det finns ett särskilt dokument som beskriver hur arbetet med kursutvärderingar och kursutveckling sker. Det är oerhört viktigt för mig att du säger till vad du tycker om kurs och kursmaterial, du kan alltid hojta till i både Diskussioner, chatt eller mail.

Läs om hur [vi jobbar med kursutvärdering och kursutveckling](kurser/kursutvardering-och-kursutveckling).



Kursplan {#kursplan}
-----------------------------------------------------

Kursens namn är "Kontinuerlig integration och driftsättning i molnet". Du hittar [kursplanen genom att söka på kurskoden DV1658 via BTH's hemsida](http://edu.bth.se/utbildning/utb_kursplaner.asp?KKurskod=DV1658).

Fram till och med 2021 gick kursen med kurskoden [DV1617](http://edu.bth.se/utbildning/utb_kursplaner.asp?KKurskod=DV1617)
