---
views:
    flash:
        region: flash
        template: default/image
        data:
            src: "image/webtec/logo.png"
title: webtec (v2)
author:
    - mos
revision:
    "2022-06-17": "(A, mos) Första revisionen inför kursstart HT22."
...
Kursen webtec (v2)
==================================

Kursen **Webbteknologier**, a.k.a. *webtec*, lär ut webbutveckling där teknikerna  HTML, CSS, PHP och SQL används för att tillsammans bygga en databasdriven webbplats.



<!--more-->

HTML och CSS ger grundförutsättningarna för hur en webbapplikation kan byggas. Genom att använda server-side skriptprogrammering med PHP så kan webbapplikationen bli mer dynamisk och lagra information i databaser. Dessutom kan webbapplikationen byggas upp med en programmeringsmässig struktur, en struktur som underlättar utveckling och underhåll av webbplatsen.

Detta är en introduktionskurs för den som vill lära sig teknikerna från grunden. Kursen kräver inga förkunskaper och hanterar helheten kring en webbapplikation. Till att börja med fokuserar vi på HTML och CSS. Vi använder HTML5 och tittar på vilka möjligheter som CSS3 kommer att erbjuda.

Därefter introduceras PHP som ett skriptspråk och med enkla programmeringskonstruktioner får vi möjlighet att bygga ut vår webbplats på ett strukturerat sätt. Vi fortsätter med att lagra information i en filbaserad databas (SQLite) via PHP's gränssnitt PHP Data Objekt. Vi använder på frågespråket SQL och lär oss de grundläggande konstruktionerna.

Sammantaget blir kursen en grundlig introduktion och orientering i de tekniker som ofta används för att skapa webbplatser.

Läs vidare för en översikt för kursens innehåll, struktur och planering.



Kursintro {#pres}
------------------------

Här är en video som "pratar" dig igenom kursens upplägg och delar av innehållet i detta dokumentet.

[YOUTUBE src="K7F5IVgK1bg" width=700 caption="Kursintroduktion till kursen webtec med Mikael."]



Förkunskaper {#forkunskaper}
------------------------

Det formella förkunskapskravet är:

> Grundläggande behörighet.




Innehåll {#innehall}
------------------------

Kursen omfattar följande områden:

* HTML och HTML5. Element och dess uppbyggnad och användning. Valideringsverktyg.
* CSS och CSS3 (Cascading Stylesheets). Hantering och användning. Valideringsverktyg.
* Skriptbaserad PHP-programmering för att dela upp strukturen i filer och funktioner samt för att hantera formulär och lagring i databas.
* SQL och den filbaserade relationsdatabasen SQLite tillsammans med PHP Data Objekt.
* Strukturerad utveckling av webbapplikationer där synen på struktur, ordning och reda påverkar hur vi utvecklar vår webbapplikation.
* Användning, i mindre omfattning, av verktyg och tekniker som lämpar sig för utveckling av webbapplikationer, tex egen webbserver för utveckling och test, UNIX/Linux, installation på extern webbserver för drift, ssh, ftp/sftp



Mål {#mal}
------------------------

Kursens mål är indelade i undergrupper.



### Kunskap och förståelse {#kunskap}

Efter genomförd kurs skall studenten:

* påvisa grundläggande kunskaper om webbutveckling med HTML, CSS, PHP och SQL, genom att skriftligt beskriva och sammanfatta erfarenheter och observationer från övningar och projekt.
* påvisa grundläggande kunskaper i att använda HTML, CSS, PHP samt SQL genom att tillämpa dem i praktiska övningar och projekt.



### Färdighet och förmåga {#fardighet}

Efter genomförd kurs skall studenten:

* självständigt, utefter en specifikation, kunna utveckla och driftsätta en webbplats med HTML, CSS, PHP och SQL.
* ha god praktisk förmåga att hantera de verktyg och miljöer som används vid utveckling av databasdrivna webbapplikationer.



Kursmoment {#kursmoment}
------------------------

Kursen är uppdelad i 10 kursmoment där varje kursmoment uppskattas till 20h studerande i form av programmering, undersökning, läsande, övningar, uppgifter, redovisning och eftertanke. Alla kursmoment skall redovisas och du samlar alla redovisningar i din me-sida.

Kursen avslutas med ett större avslutande moment som examinerar kursen.



### Kmom01: Bygg en webbplats {#kmom01}

Vi börjar med en labbmiljö för att bygga webbplatser och med hjälp av den så studerar vi HTML och CSS för att se hur de bidrar när vi bygger en webbplats. HTML står för strukturen och innehållet på webbplatsen och CSS bidrar med utseende och layout.

[Instruktion till kursmoment 01](./kmom01).



### Kmom02: Styla en webbplats {#kmom02}

Vi börjar med en labbmiljö för att bygga webbplatser och med hjälp av den så studerar vi HTML och CSS för att se hur de bidrar när vi bygger en webbplats. HTML står för strukturen och innehållet på webbplatsen och CSS bidrar med utseende och layout.

[Instruktion till kursmoment 02](./kmom02).



### Kmom03: Programmera en webbplats {#kmom03}

Vi lär oss grunderna i programmeringsspråket PHP om hur man kan skapa dynamiska webbsidor via programmeringskonstruktioner som variabler, if-satser, och loopar. Vi använder inbyggda variabler som $_GET och $_SERVER tillsammans med querysträng och HTML formulär där vi provar att skicka argument till en webbsida.

[Instruktion till kursmoment 03](./kmom03).



### Kmom04: PHP datastrukturer {#kmom04}

Vi fördjupar oss mer i programmering med PHP och vi tittar på datastrukturer med arrayer för att se skillnader och likheter mellan numeriska arrayer och associativa arrayer.

Vi tittar vidare på HTML formulär och använder POST tillsammans med processing- och resultat-sidor.

Vi kikar på sessionen och lär oss hur man kan spara värden i sessions-arrayenoch få en lagring av värden mellan användarens sidanrop.

[Instruktion till kursmoment 04](./kmom04).



### Kmom05: SQL och SQLite {#kmom05}

Vi skall titta på databasen SQLite som är en filbaserad databas. En filbaserad databas förenklar hanteringen eftersom databasen ligger i en enda fil och det finns inga användare eller behörigheter att konfigurera.

I en databas, en relationsdatabas som SQLite, så pratar vi SQL med databasen. Vi skriver SQL uttryck för att skapa tabeller och för att lägga till, uppdatera, visa och radera data från databasen.

Vi skapar en sökmotor som kan söka i en befintlig databas och presentera resultatet i en webbsida.

[Instruktion till kursmoment 05](./kmom05).



### Kmom06: PHP, PDO och SQL {#kmom06}

Vi skall titta på databasen SQLite som är en filbaserad databas. En filbaserad databas förenklar hanteringen eftersom databasen ligger i en enda fil och det finns inga användare eller behörigheter att konfigurera.

I en databas, en relationsdatabas som SQLite, så pratar vi SQL med databasen. Vi skriver SQL uttryck för att skapa tabeller och för att lägga till, uppdatera, visa och radera data från databasen.

[Instruktion till kursmoment 06](./kmom06).



### Kmom07/10: Projekt och examination {#kmom10}

Avslutningsvis gör du ett projekt enligt en specifikation. Projektet är det sista som du gör och tillsammans med alla redovisningar som finns på din me-sida så används detta som underlag för att examinera dig från kursen.

[Instruktion till kursmoment 10](./kmom10).



Kurslitteratur {#litteratur}
----------------------------

[Måste jag skaffa kurslitteraturen](kurser/maste-jag-skaffa-kurslitteraturen)?



### Kurslitteratur {#kurslitteratur}

Kurslitteraturen består av följande bok. Det finns läsanvisningar i samband med varje kursmoment.


<!--
* **[HTML och CSS-boken](kunskap/boken-html-och-css-boken)** -- Rolf Staflin  
  En stabil bok för att komma igång med HTML och CSS.
-->

* **[Webbutveckling med PHP och MySQL](kunskap/boken-webbutveckling-med-php-och-mysql)** -- Montathar Faraon  
  En svensk bok som ger en god intro för den som är ny i PHP och programmering. Innehåller en del PHP och en del databaser och MySQL.



### Referenslitteratur {#referenslitteratur}

Referensdokumentationen är främst olika online-resurser i form av manualer.



### Övrig litteratur {#ovriglitteratur}

I varje kursmoment kan det tillkomma läsanvisningar, till exempel artiklar, manualer, videor och webbmaterial.



Planering och studieplaner {#planering}
---------------------------------------------

Eftersom kursen ges kombinerat på campus och distans så är kursens planering fördelad på ett antal olika dokument. Bekanta dig med dem så att du har koll på hur kursens upplägg fungerar och vilket som är en normaltakt för kursen.

Kursen har en [rekommenderad studieplan](webtec/studieplan) som visar en översikt, vecka för vecka, vilket kursmoment som är aktuellt att jobba med. Där finns även rättningsfönster som visar när saker rättas. Följer du denna planeringen så är du i fas med kursens normaltakt.

På Canvas finns datum för inlämningsuppgifter. Ett rättningsfönster pågår normalt sett 15 arbetsdagar efter inlämningsdatum på uppgiften. Inlämningsdatumen på Canvas är ett par dagar senare än vad som visas i den rekommenderade studieplanen, det är för att ge dig lite slack/utrymme för att själv planera dina studier.

Kursen har en [lektionsplan](webtec/lektionsplan) som visar när det är lärarledda tillfällen för undervisning/handledning på campus/distans.

Kursen har bokade tillfällen i BTHs schemabokningsprogram, "schemat", som säger när en fysisk sal är bokad på campus. Det finns en länk till det aktuella schemat, via lektionsplanen.



Läromaterial och resurser {#laromaterial}
----------------------------------------

Här kan du se en översikt av hur kurstillfället har valt att strukturera läromaterialet och vilka resurser och verktyg som används i undervisningen.

Här finner du även länkar till aktuella video streams och spellistor samt chatter och forum för handledning.

* [Läromaterial ht22, lp1](./laromaterial-ht22lp1)

<!--
* [Läromaterial ht21, lp1](./laromaterial-ht21lp1)
-->



Lärarteam och intressenter {#team}
----------------------------------------

Här kan du hitta detaljer om ett kurstillfälle och se lärarteamet som utför kurstillfället, deras roller och kontaktuppgifter tillsammans med de som "äger" kursen och kurstillfället och vilka studentgrupper som läser kursen samt övriga intressenter till kurstillfället.

* [Lärarteam och intressenter ht22, lp1](./team-ht22lp1)

<!--
* [Lärarteam och intressenter ht21, lp1](./team-ht21lp1)
-->



Dialog & Samarbete {#samarbete}
---------------------------------

Kursen främjar att studenter för dialog och samarbeter. Diskutera med studiekollegor kring problem och lösningar på de övningar och uppgifter som finns. Använd de möjligheter som finns inom kursen för att samverka och hjälpa varandra. Tveka inte att starta egna studiegrupper där ni kan stödja varandra.



Fusk & Disciplinnämnden {#fusk}
---------------------------------

Läs om skolans syn och hantering av "[Fusk och medveten vilseledning](https://dbwebb.se/kurser/faq/fusk-och-disciplinarende)" samt var gränserna går mellan samarbete och fusk.

> "Hjälp varandra och diskutera, men kopiera inte och skriv all kod/text själv."

Misstanke om fusk anmäls alltid till Discplinnämnden.



Ladok {#ladok}
------------------------

Enligt kursplanen finns ett antal ladokmoment och de är kopplade till kursens kursmoment enligt följande.

| Kursens                     | Ladok moment enligt kursplan  | Betygsskala |
|-----------------------------|-------------------------------|:-----------:|
| kmom01 + kmom02             | Inlämningsuppgift 1 á 2.5hp   | U-G         |
| kmom03 + kmom04             | Inlämningsuppgift 2 á 2.5hp   | U-G         |
| kmom05 - Kmom10             | Individuellt projekt á 2.5hp  | A-F, Fx     |

Den sista inlämningen bestämmer kursens slutbetyg vilket utfärdas när samtliga moment godkänts.

Läs mer om [rapportering av resultat](kurser/faq/resultatrapportering).



Betygsättning {#betyg}
------------------------

Det finns ett särskilt dokument som beskriver [hur bedömning och betygsättning sker](kurser/bedomning-och-betygsattning).



Kursutvärdering och kursutveckling {#kursutvardering}
-----------------------------------------------------

Det finns ett särskilt dokument som beskriver hur arbetet med kursutvärderingar och kursutveckling sker. Det är oerhört viktigt för mig att du säger till vad du tycker om kurs och kursmaterial, du kan alltid hojta till i både forum, chatt eller mail.

Läs om hur [vi jobbar med kursutvärdering och kursutveckling](kurser/faq/kursutvardering-och-kursutveckling).



Kursplan {#kursplan}
-----------------------------------------------------

Kursplanen är kursens formella dokument som fastställts av högskolan. När kursen utvärderas görs det mot kursplanen. I kursplanen kan du läsa om kursens klassificering, syfte, innehåll, mål, generella förmågor, lärande och undervisning, bedömning och examination, litteratur, mm.

Från och med hösten 2016 hittar du [kursplanen genom att söka på kurskoden PA1439 via BTH's hemsida](http://edu.bth.se/utbildning/utb_kursplaner.asp?KKurskod=PA1439) och kursen heter "Webbteknologier".

Mellan höstterminen 2013 och vårterminen 2016 hade kursen kurskoden [DV1462](http://edu.bth.se/utbildning/utb_kursplaner.asp?KKurskod=DV1462) och hette "Databaser, HTML, CSS och skriptbaserad PHP-programmering".

Från 2010 till och med vårterminen 2013 hade kursen kurskoden [DV1401](http://edu.bth.se/utbildning/utb_kursplaner.asp?KKurskod=DV1401) och hette "Databaser, HTML, CSS och skriptbaserad PHP-programmering".



Versioner av kursen {#versioner}
-----------------------------------------------------

Om du påbörjat den äldre version av kursen så skall du också slutföra denna versionen av kursen (eller göra om den nya kursen från start). Alternativt rådgör du med den som är kursansvarig.

För tillfället från och med höstterminen 2022 så [finns kursmaterialet till webtec (v2) här](kurser/webtec-v2).

För tillfället under höstterminen 2021 så [finns kursmaterialet till webtec (v1) här](kurser/webtec-v1).

Tidigare kursomgångar gick kursen under smeknamnet htmlphp.

För tillfällen under höstterminen 2020 så [finns kursmaterialet till htmlphp (v4) här](kurser/htmlphp-v4).

För tillfällen från höstterminen 2018 till och med höstterminen 2019 så [finns kursmaterialet till htmlphp (v3) här](kurser/htmlphp-v3).

För tillfällen från höstterminen 2015 till och med höstterminen 2017 så [finns kursmaterialet till htmlphp (v2) här](kurser/htmlphp-v2).

För tillfällen fram till och med vårterminen 2015, så [finns kursmaterialet till den kursen i htmlphp (v1)](kurser/arkiv/htmlphp-v1).
