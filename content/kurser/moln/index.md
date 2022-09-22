---
title: moln
author:
  - efo
revision:
    "2021-11-23": (A, efo) Första versionen inför VT22.
...
Kursen "moln"
==================================

Kursen **Introduktion till molnteknologi**, a.k.a. *moln*, fokuserar på de grundläggande koncepten för distribuerade system och cloud computing. Kursen omfattar teoretiska och praktiska aspekter med fokus på verkliga exempel. Efter genomförd kurs ska studenten vara kapabel att välja och använda grundläggande molnresurser (till exempel datorer och lagring som en tjänst) och att utforma skalbara arkitekturer och applikationer.

<!--more-->



Förkunskaper {#forkunskaper}
------------------------

Det formella förkunskapskravet är:

> För tillträde till kursen krävs 6 hp i programmering.



Innehåll {#innehall}
------------------------

Kursen omfattar följande områden:

* Introduktion till distribuerade system.
* Introduktion till Cloud Computing: historik, servicemodeller, utvecklingsmodeller, skalbarhet, service level agreement (SLA), molnapplikationer.
* Virtualisering: Virtuella maskiner (VM), Paravirtualisering, Virtualisering på operativsystemsnivå (docker behållare), minnesvirtualisering, lagringsvirtualisering, VM migration.
* Cloud datalagringssystem.



Mål {#mal}
------------------------

### Kunskap och förståelse {#kunskap}

Efter genomförd kurs skall studenten:

* Kunna beskriva och förklara allmänna begrepp i samband med distribuerade system.
* Kunna beskriva och förklara begreppet cloud computing.



### Färdighet och förmåga {#fardighet}

Efter genomförd kurs skall studenten:

* Kunna skriva och presentera laborationsresultat i en kort rapport.
* Kunna välja, konfigurera och implementera molnresurser genom att använda GUI och API.



### Värderingsförmåga och förhållningssätt {#vardering}

Efter genomförd kurs ska studenten:

* Vara medveten om den huvudsakliga tjänste- och utvecklingsmodellen för cloud computing.
* Kunna jämföra olika molntjänster, lösningar och teknologier.



Kursmoment {#kursmoment}
------------------------

Kursen är uppdelad i kursmoment där varje kursmoment består av av programmering, undersökning, läsande, övningar, uppgifter, redovisning och eftertanke. Alla kursmoment skall redovisas enskilt individuellt genom att svra på ett antal frågor i slutet av varje kursmoment.


### kmom01: Virtualisering med VirtualBox {#kmom01}

Du kommer igång med en labb- och utvecklingsmiljö som stödjer den utveckling vi ska göra i kursen. Vi installerar VirtualBox på vår egna dator och virtualiserar ett annat operativsystem i vår eget.

[Instruktion till kursmoment 01](moln/kmom01).



### kmom02: En applikation i molnet {#kmom02}

Vi börjar utvecklingen av vår applikation i Python och micro-ramverket Flask där vi hämtar data från ett API. Data behandlas och presenteras sedan på nytt. Applikationen driftsätts sedan i molnet.

[Instruktion till kursmoment 02](moln/kmom02).



### kmom03: Projekt och examination {#kmom03}

Avslutningsvis gör vi ett projekt enligt en specifikation. Projektet är det sista som du gör och tillsammans med inlämningsuppgifter och redovisningar används detta som underlag för att examinera dig från kursen.

[Instruktion till kursmoment 03](moln/kmom03).



Kurslitteratur {#litteratur}
----------------------------

Kurslitteraturen i kursen är boken "What is the cloud?" av Bill Laberis. Boken är en kort introduktion till vad Cloud är och kan med fördel läsas i början av kursen.

Du kommer åt den boken via biblioteket på BTH. Gå till [https://bibliotek.bth.se/databases?q=o%27reilly](https://bibliotek.bth.se/databases?q=o%27reilly) och välj O'reilly. Du ska nu kunna söka på "What is the cloud?" i Sökrutan och första träffen är kurslitteraturen.



Exempelkod {#examplecode}
----------------------------

På GitHub finns det ett repo med exempelkod som kan användas som inspiration. Repot [dbwebb-se/moln](https://github.com/dbwebb-se/moln) kommer uppdateras under kursens gång.



Rekommenderad studieplan {#schema}
---------------------------------------------

Det finns en [rekommenderad studieplan](moln/studieplan) som är kopplad till varje kurstillfälle.



Lärarstöd och handledning {#handledning}
----------------------------------------

Kursen ges på campus och handledning sker i anslutning till tid i labbsalen.

Det finns även en Discord chatt där man kan få hjälp och handledning. Invite-länk finns i Canvas.



Ladokmoment {#ladokmoment}
------------------------

Enligt kursplanen finns ett antal ladokmoment och de är kopplade till kursens kursmoment enligt följande.

| Kursens moment   | Ladok moment enligt kursplan |
|------------------|------------------------------|
| kmom01 + kmom02  | Laboration á 2hp              |
| Kmom03           | Projekt á 2hp              |



Betygsättning {#betyg}
------------------------

Det finns ett särskilt dokument som beskriver [hur bedömning och betygsättning sker](kurser/faq/bedomning-och-betygsattning-g-u).



Kursutvärdering och kursutveckling {#kursutvardering}
-----------------------------------------------------

Det finns ett särskilt dokument som beskriver hur arbetet med kursutvärderingar och kursutveckling sker. Det är oerhört viktigt för oss att du säger till vad du tycker om kurs och kursmaterial, du kan alltid hojta till i både forum, chatt eller mail.

Läs om hur vi [jobbar med kursutvärdering och kursutveckling](kurser/kursutvardering-och-kursutveckling).



Kursplan {#kursplan}
-----------------------------------------------------

Kursplanen är kursens formella dokument som fastställts av högskolan. När kursen utvärderas görs det mot kursplanen. I kursplanen kan du läsa om kursens klassificering, syfte, innehåll, mål, generella förmågor, lärande och undervisning, bedömning och examination, litteratur, mm.

Du hittar [kursplanen genom att söka på kurskoden DV1615 via BTH's hemsida](http://edu.bth.se/utbildning/utb_kursplaner.asp?KKurskod=DV1615).
