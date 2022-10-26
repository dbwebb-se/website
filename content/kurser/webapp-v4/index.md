---
title: webapp-v4
author:
    - mos
    - efo
revision:
    "2022-01-12": (A, efo) Första revisionen v4 inför VT22.
...
Kursen webapp (v4)
==================================

Kursen **Webbapplikationer för mobila enheter**, a.k.a. *webapp*, lär dig hur du bygger applikationer för mobila enheter och läsplattor med webbteknologier.



<!--more-->



Kursen syftar till att lära ut utveckling av webbapplikationer med HTML, CSS och JavaScript och fokuserar på mobila enheter och läsplattor.

Kursen går igenom konstruktioner i HTML, CSS och JavaScript som hjälper dig bygga applikationer som är oberoende av skärmens storlek och enhetens styrning (mus, touchscreen, penna, tangentbord).

Du bygger en applikation som använder sig av HTML, CSS och JavaScript på klientsidan och du jobbar med RESTful API:er och JSON-data för att bygga appar.

Via litteraturstudier och praktiska övningar förkovrar du dig i området. I slutet av kursen får du visa dina färdigheter i ett praktiskt programmeringsprojekt där allt integreras.



[INFO]
**Tidigare/Nyare version av kursen**

Från och med vårterminen 2022 gäller version 4 av kursen.

Från och med vårterminen 2018 gäller version 3 av kursen, , [webapp-v3](kurser/webapp-v3).

Under vårterminen 2017 gällde version 2 av kursen, [webapp-v2](kurser/webapp-v2).

Fram till och med höstterminen 2016 gällde version 1 av kursen, [webapp-v1](kurser/webapp-v1).

Om du påbörjat den äldre version av kursen så skall du också slutföra denna versionen av kursen (eller göra om den nya kursen från start).
[/INFO]



Förkunskaper {#forkunskaper}
------------------------

Det formella förkunskapskravet är:

> För tillträde till kursen krävs genomgångna kurser motsvarande 15 hp i programmering och webbteknologier varav 6 hp ska vara programmering med JavaScript.



Innehåll {#innehall}
------------------------

Kursen omfattar följande områden:

* HTML5, CSS3, JavaScript med mobilt fokus.
* CSS3 för att styla webbapp som en "native app".
* Mobilen och läsplattan som test och utvecklingsmiljö.
* Touch-event.
* Responsive design, storlekar, landskap, portätt.
<!-- * Koppling mot server och databas. -->
* Jobba med RESTful API:er och JSON.
* Mobil prestanda och tillgänglighet.
* Att använda hårdvarufunktioner som är specifika på mobila enheter, tex splash-screens, logotyper och filhantering.
* Jobba med webappar och hybrid webapp för att komma åt hårdvarunära funktioner.
* Felsökning och tekniker att debugga sitt program.
* Utvecklingsmiljö och verktyg för utveckling av mobila appar.



Mål {#mal}
------------------------

### Kunskap och förståelse {#kunskap}

Efter genomförd kurs skall studenten:

* påvisa grundläggande förståelse för utveckling av mobila applikationer med valda tekniker genom att skriftligen beskriva och sammanfatta erfarenheter och observationer från övningar och projekt.
* påvisa god förståelse för mobila enheters begränsningar och styrkor samt anpassa mobila applikationer för tillgänglighet och användbarhet.
* påvisa goda kunskaper i att skapa mobila appar, med HTML, CSS och JavaScript, genom att tillämpa dessa tekniker i praktiska övningar och projekt.
<!-- * påvisa goda kunskaper i att använda JavaScript på serversidan tillsammans med Node.js genom att tillämpa dessa tekniker i praktiska övningar och projekt. -->
* påvisa goda kunskaper i att använda JSON API:er för att hämta, skapa, uppdatera och ta bort data genom att använda JSON API:er i praktiska övningar och projekt.


### Färdighet och förmåga {#fardighet}

Efter genomförd kurs skall studenten:

* självständigt utveckla, dokumentera och presentera ett projekt baserat på utveckling av en mobil app.
<!-- * med både klient- och server-kod. -->
* ha god praktisk förmåga att hantera de verktyg och miljöer som används vid utveckling och felsökning av mobila appar med valda tekniker.



Kursmoment {#kursmoment}
------------------------

Kursen är uppdelad i kursmoment där varje kursmoment uppskattas till 20h studerande i form av programmering, undersökning, läsande, övningar, uppgifter, redovisning och eftertanke. Alla kursmoment redovisas som en del av inlämningen.



### kmom01: Vår första React Native app {#kmom01}

Vi ska i detta kursmomentet ta en titt på hur vi utvecklar appar med hjälp av ramverken React Native och Expo. Vi tar en titt på båda ramverken och hur vi utvecklar med hjälp av TypeScript i React Native. Dessutom introduceras Lager-API:t som är med oss i kmom01-kmom06 och hur vi hämtar data från det API:t.

[Instruktion till kursmoment 01](kurser/webapp-v4/kmom01).



### kmom02: Mobila enheters begränsningar {#kmom02}

Vi tar en titt på vilka begränsningar och utmaningar man står inför som användare av en mobil enhet. Vi brytar ut CSS koden från kmom01 till ett GUI komponentbaserad ramverk och lägger till fler GUI komponenter till vårt ramverk.

Vi fortsätter med vår applikation från kmom01 och använder tekniker för att strukturera JavaScript koden på ett bättre sätt.

Innan vi gör detta tittar vi på ett verktyg som hjälper oss att söka och visa information i JSON-filer.

[Instruktion till kursmoment 02](kurser/webapp-v4/kmom02).



### kmom03: Formulär och CRUD {#kmom03}

I detta kursmoment fortsätter vi med att utveckla våra GUI komponenter från tidigare kursmoment. Vi skapar lättanvända formulärfält med hjälp av HTML5 och kopplar ihop fälten i formulär som är lätta att använda på små skärmar där kontext och möjligheten att skriva snabbt och enkelt saknas.

I vår applikation lägger vi till möjligheten att skapa, uppdatera och ta bort data via formulär. Vi har i tidigare kursmoment arbetat enbart med vanilla JavaScript, men ska i detta kursmoment titta på hur vi kan använda oss av JavaScript ramverket mithril för att underlätta hämtning av data, rendering av HTML-element och de olika vyer.

[Instruktion till kursmoment 03](kurser/webapp-v4/kmom03).



### kmom04: Autentisering med JWT {#kmom04}

Vi fortsätter med Lager appen och lägger till en funktion för att skapa fakturor utifrån en order. Alla ska inte kunna skapa fakturor så innan vi skapar faktura funktionen skapar vi inloggning och tittar på JSON Web Tokens för autentisering.

När man skapar en faktura är det bra att ha snygga och responsiva tabeller. Så kursmomentets GUI-komponent är just tabeller och hur vi optimerar dessa för mobila enheter.

[Instruktion till kursmoment 04](kurser/webapp-v4/kmom04).



### kmom05: Mobila enheters styrkor {#kmom05}

Än så länge har vi skapat applikationer för webbläsaren, men i detta och nästa kursmoment skapar vi applikationer på 'riktigt' för våra mobila enheter. Vi ska se vilka fördelar detta kan ge och hur vi maximerar styrkorna för våra mobila enheter. Vi lägger till ikoner och splash screens och fokuserar på att anpassa applikationernas design för de olika plattformarna och skärmstorlekar.

[Instruktion till kursmoment 05](kurser/webapp-v4/kmom05).



### kmom06: GraphQL {#kmom06}

I detta kursmoment fortsätter vi att utnyttja styrkorna i våra mobila enheter. Vi kopplar in kamera och GPS för att skapa en fulländad applikation, som utnyttjar alla möjligheter vi har på en mobil plattform.

[Instruktion till kursmoment 06](kurser/webapp-v4/kmom06).



### kmom07/10: Projekt och examination {#kmom10}

Avslutningsvis gör du ett projekt enligt en specifikation. Projektet är det sista som du gör och tillsammans med alla redovisningar som finns på din me-sida så används detta som underlag för att examinera dig från kursen.

Projektet bygger på tidigare kursmoment och med dina nya erfarenheter skapar du en tillgänglig och användbar mobil applikation enligt specifikationen.

[Instruktion till kursmoment 10](kurser/webapp-v4/kmom10).



Kurslitteratur {#litteratur}
----------------------------

Finns ingen specifik kurslitteratur för denna i kursen. I varje kursmoment finns relevant litteratur och annat material för att vi ska lära oss bakgrunden till kursmomentet.



### Referenslitteratur {#referenslitteratur}

Följande böcker har jag valt som referenslitteratur. De kan vara bra att ha tillhands och ger lite extra läsmöjligheter. De behövs inte för att klara kursen men vill du bemästra kursens område så är dessa böcker bra startpunkter.

* **[You Don't Know JS](kunskap/boken-you-dont-know-javascript)** -- K. Simpson (@getify)
    Om du vill förstå JavaScript på djupet och därigenom bli kung på JavaScript, men samtidigt en bättre programmerare rekommenderas You Don't Know JS starkt.

* **[JavaScript: The Good Parts](kunskap/boken-javascript-the-good-parts)** -- D. Crockford
  En genomgång av JavaScript Core och hur man ska, och inte ska, skriva sin kod.



Rekommenderad studieplan {#studieplan}
---------------------------------------------

Kursen har en [rekommenderad studieplan](kurser/webapp/studieplan) som visar en översikt över kursens olika moment och när de i tiden bör utföras för att studenten skall ligga i fas med kursens planering.

I studieplanen visas när rättning sker av respektive inlämnat moment samt när det finns möjligheter att göra restinlämningar.

Läs mer om den [rekommenderade studieplanen](kurser/faq/rekommenderad-studieplan).



Lektionsplan {#lektionsplan}
---------------------------------------------

Det finns en [lektionsplan](kurser/webapp/lektionsplan) som visar en detaljplanering för undervisningen i kursen, vecka för vecka.

Läs mer om [lektionsplanen](kurser/faq/lektionsplan-och-schema).



Lärarstöd och handledning {#handledning}
----------------------------------------

Schemalagda labbtillfällen, hangouts samt forum och chatt är de viktigaste källorna för handledning. Läs om [handledning och hjälp-till-självhjälp](kurser/faq/lararstod-och-handledning).

Ofta ställda frågor (FAQ) finns på [GitHub issues](https://github.com/dbwebb-se/webapp/issues?q=is%3Aopen+is%3Aissue+label%3Afaq).



Betygsättning {#betyg}
------------------------

Det finns ett särskilt dokument som beskriver [hur bedömning och betygsättning sker](kurser/bedomning-och-betygsattning).



Ladok {#ladok}
------------------------

Enligt kursplanen finns ett antal ladokmoment och de är kopplade till kursens kursmoment enligt följande.

| Kursens moment  | Ladok moment enligt kursplan  |
|-----------------|-------------------------------|
| Kmom01 + kmom02 | Uppgift 1 á 2.5hp             |
| Kmom03 + kmom04 | Uppgift 2 á 2.5hp             |
| Kmom05 - kmom10 | Projekt á 2.5hp               |

Läs mer om [rapportering av resultat](kurser/faq/resultatrapportering).



Kursutvärdering och kursutveckling {#kursutvardering}
-----------------------------------------------------

Det finns ett särskilt dokument som beskriver hur arbetet med kursutvärderingar och kursutveckling sker. Det är oerhört viktigt för mig att du säger till vad du tycker om kurs och kursmaterial, du kan alltid hojta till i både forum, chatt eller mail.

Läs om hur [jag jobbar med kursutvärdering och kursutveckling](kurser/kursutvardering-och-kursutveckling).



Kursplan {#kursplan}
-----------------------------------------------------

Kursplanen är kursens formella dokument som fastställts av högskolan. När kursen utvärderas görs det mot kursplanen. I kursplanen kan du läsa om kursens klassificering, syfte, innehåll, mål, generella förmågor, lärande och undervisning, bedömning och examination, litteratur, mm.

Kursens namn är "Webbapplikationer för mobila enheter".

Från och med våren 2019 hittar du [kursplanen genom att söka på kurskoden DV1609 via BTH's hemsida](http://edu.bth.se/utbildning/utb_kursplaner.asp?KKurskod=DV1609).

Fram till våren 2018 så gavs kursen under [kurskoden DV1546](http://edu.bth.se/utbildning/utb_kursplaner.asp?KKurskod=DV1546).
