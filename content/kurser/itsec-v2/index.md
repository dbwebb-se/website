---
title: itsec-v2
author:
    - atb
    - mbo
    - mos
    - lew
    - nik
    - grm
revision:
    "2021-11-12": "(E, grm) Uppdaterad inför HT21."
    "2021-10-01": "(D, lew) Ny version inför HT21."
    "2020-04-21": "(C, nik) Ny version inför HT20."
    "2019-02-04": "(B, mos) Uppdaterad med information från kursplan."
    "2018-12-04": "(A, mos) Kursen inrättas med namn och syfte."
...
Kursen itsec (v2)
==================================

Kursen **Informationssäkerhet med webbtillämpningar**, a.k.a. *itsec*, lär ut generella grunder och principer inom området informationssäkerhet och hur det appliceras specifikt mot området webb.


<!--more-->

<!-- [WARNING]

**Kursutveckling pågår**

Kursstart hösten 2021.

[/WARNING] -->



Förkunskaper {#forkunskaper}
------------------------

Det formella förkunskapskravet är:

> För tillträde till kursen krävs avklarade kurser motsvarande 60 högskolepoäng varav minst 20 högskolepoäng inom programmering och databaser.




Innehåll {#innehall}
------------------------

Kursen omfattar följande områden:

* Översiktlig orientering i området informationssäkerhet, kategorisering av området samt terminologi, specifikt fokus säkerhetsområden som är relevanta att applicera på området webb.
* Skyddad data via hashning, kryptering samt identifiering och autentisering inklusive nyckelhantering och certifikat.
* Databaser, dataläckage och privacy.
* Risk och sårbarhetsanalys
* Introduktion till existerande webbsäkerhetsprojekt.
* Säkerhetsrelaterade attacker.
* Säkerhetstestning (test-driven security)
* Relaterade verktyg, tekniker, processer och metoder.



Mål {#mal}
------------------------

Följande är kursens mål, indelat i undergrupper.



### Kunskap och förståelse {#kunskap}

Efter genomförd kurs skall studenten:

* ingående redogöra för informationssäkerhet med webbtillämpningar baserat på de tekniker som omfattas genom att beskriva och sammanfatta erfarenheter och observationer från övningar och projekt.
* kunna visa goda kunskaper i att använda relevanta tekniker och metoder genom att tillämpa dessa tekniker i praktiska övningar och projekt.



### Färdighet och förmåga {#fardighet}

Efter genomförd kurs skall studenten:

* självständigt kunna bedöma, dokumentera och presentera relevanta säkerhetsrelaterade riskområden för en webbaserad applikation.
* ha god praktisk förmåga att hantera verktyg och miljöer som används vid testning och undersökning rörande säkerhetsrelaterade attacker.



### Värderingsförmåga och förhållningssätt {#vardera}

Efter genomförd kurs skall studenten:

* via redovisningarna kunna visa god förmåga att reflektera och argumentera över säkerhet, risker, sårbarhet och attacker mot webbaserade applikationer.



Kursmoment {#kursmoment}
------------------------

Kursen är uppdelad i kursmoment där varje kursmoment uppskattas till 20h studerande i form av programmering, undersökning, läsande, övningar, uppgifter, redovisning och eftertanke. Alla kursmoment skall redovisas och du samlar alla redovisningar i din me-sida.


### Kmom01: Orientering {#kmom01}

Kursmomentet ger en översiktlig orientering i området informationssäkerhet vilket involverar dels en kategorisering av området samt genomgång av central terminologi. Fokus ligger på de säkerhetskoncept som har relevans inom webbutveckling. Dessutom involverar den översiktliga orienteringen att ge studenterna en förståelse för säkerhetskonceptens möjligheter och begränsningar inom området webbutveckling.

[Instruktion till kursmoment 01](./kmom01).



### Kmom02: Privacy {#kmom02}

Kursmomentet ger en introduktion till konceptet privacy genom att förklara centrala definitioner. Särskilt belyses avvägningen mellan privacy och att som slutanvändare dela med sig av sin information för att möjliggöra diverse IT-baserade tjänster. Därutöver kommer exempel på vanliga privacy-förbättrande tekniker förklaras. Slutligen ges exempel på omfattande attacker som påverkat slutanvändarnas privacy negativt samt förslag på relevanta mekanismer för att försvåra dessa attacker.

[Instruktion till kursmoment 02](./kmom02).



### Kmom03: Attacker {#kmom03}

Det finns ett antal attacker som kan räknas som vanliga när man pratar om webbsäkerhet. I detta kursmomentet går vi igenom vanliga attacker och hur man kan skydda sig mot dem: XSS, session hijacking, redirect problem, directory traversal, etc.

[Instruktion till kursmoment 03](./kmom03).



### Kmom04: Sårbarhetsanalys {#kmom04}

Risk- och sårbarhetsanalysmomentet omfattar en introduktion till olika metoder för att modellera applikationers beteende, metoder för att genomföra sårbarhetsanalyser och attackscenarier. Vidare introduceras även riskanalys och riskhantering för att sätta sårbarheter i kontext.

[Instruktion till kursmoment 04](./kmom04).



<!-- ### Kmom05: Skydda data {#kmom05}

Kursmomentet ger en övergripande introduktion till både symmetriska och asymmetriska krypteringsmetoder genom att på ett övergripande sätt förklara hur de fungerar. Vidare visas hur sådana krypteringsmetoder kan användas för att både skydda konfidentialiteten i data såväl som dess integritet. Dessutom kommer kryptografiska certifikat förklaras och hur de kan använda för att styrka identiteter i webbtjänster.

[Instruktion till kursmoment 05](./kmom05). -->



### Kmom05: Säkerhetstestning {#kmom06}

Mjukvarutest ökar kvaliteten i den mjukvara som skrivs, men hur fungerar det med säkerhetstest. I detta kursmomentet, som bygger på sårbarhetsanalyser, går vi igenom vad säkerhetstester innebär och vad man behöver tänka på.

[Instruktion till kursmoment 05](./kmom05).



### Kmom07/10: Projekt och examination {#kmom10}

Avslutningsvis gör du ett projekt enligt en specifikation. Projektet är det sista som du gör och tillsammans med alla redovisningar som finns på din me-sida så används detta som underlag för att examinera dig från kursen.

[Instruktion till kursmoment 10](./kmom10).



Kurslitteratur {#litteratur}
----------------------------



### Kurslitteratur {#kurslitteratur}

Kurslitteraturen består av framförallt två böcker:

* Computer Security
* Beyond Fear

Det finns läsanvisningar i samband med varje kursmoment.



### Referenslitteratur {#referenslitteratur}

Referensdokumentationen är främst olika online-resurser i form av manualer.



### Övrig litteratur {#ovriglitteratur}

Det finns närliggande litteratur som är intressant för den som vill fördjupa sig i ämnet eller den som vill skaffa sig förkunskaper innan kursen.




Rekommenderad studieplan {#studieplan}
---------------------------------------------

Kursen har en [rekommenderad studieplan](kurser/itsec/studieplan) som visar en översikt över kursens olika moment och när de i tiden bör utföras för att studenten skall ligga i fas med kursens planering.

I studieplanen visas när rättning sker av respektive inlämnat moment samt när det finns möjligheter att göra restinlämningar.

Läs mer om den [rekommenderade studieplanen](kurser/faq/rekommenderad-studieplan).



Lektionsplan {#lektionsplan}
---------------------------------------------

Det finns en [lektionsplan](kurser/itsec/lektionsplan) som visar en detaljplanering för undervisningen i kursen, vecka för vecka.

Läs mer om [lektionsplanen](kurser/faq/lektionsplan-och-schema).



Handledning {#handledning}
----------------------------------------

Förutom den planerade undervisningen enligt lektionsplanen så kan du få hjälp och stöd i kursens chatt och i [Github Issues](https://github.com/dbwebb-se/itsec). Chatten lämpar sig för korta enkla frågor och issues för mer utredande och längre frågor och svar. Om du inte får svar i chatten så rekommenderas att du skapar en issue.

Läs om [lärarstöd och handledning](kurser/faq/lararstod-och-handledning).



Betygsättning {#betyg}
------------------------

Det finns ett särskilt dokument som beskriver [hur bedömning och betygsättning sker](kurser/bedomning-och-betygsattning).



Ladok {#ladok}
------------------------

Enligt kursplanen finns ett antal ladokmoment och de är kopplade till kursens kursmoment enligt följande.

| Kursens moment  | Ladok moment enligt kursplan  | Betyg |
|-----------------|-------------------------------|-------|
| Kmom01 + kmom02 | Inlämningsuppgift 1 á 2.5hp   | G-U   |
| Kmom03 + kmom04 | Inlämningsuppgift 2 á 2.5hp   | G-U   |
| Kmom05 - kmom10 | Inlämningsuppgift 3 á 2.5hp   | A-F   |

Den sista inlämningen bestämmer kursens slutbetyg vilket utfärdas när samtliga moment godkänts.

Läs mer om [rapportering av resultat](kurser/faq/resultatrapportering).



Kursutvärdering och kursutveckling {#kursutvardering}
-----------------------------------------------------

Det finns ett särskilt dokument som beskriver hur arbetet med kursutvärderingar och kursutveckling sker. Det är oerhört viktigt att du säger till vad du tycker om kurs och kursmaterial, du kan alltid hojta till i både issues, chatt eller mail.

Läs om hur [vi jobbar med kursutvärdering och kursutveckling](kurser/kursutvardering-och-kursutveckling).



Kursplan {#kursplan}
-----------------------------------------------------

Kursplanen är kursens formella dokument som fastställts av högskolan. När kursen utvärderas görs det mot kursplanen. I kursplanen kan du läsa om kursens klassificering, syfte, innehåll, mål, generella förmågor, lärande och undervisning, bedömning och examination, litteratur, mm.

Kursens namn är "Informationssäkerhet med webbtillämpningar". Du hittar [kursplanen genom att söka på kurskoden DV1616 via BTH's hemsida](http://edu.bth.se/utbildning/utb_kursplaner.asp?KKurskod=DV1616).
