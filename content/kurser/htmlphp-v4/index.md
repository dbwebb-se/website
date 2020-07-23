---
title: htmlphp (v4)
author:
    - mos
revision:
    "2020-05-20": "(F, mos) Nytt dokument inför uppdatering v4 av kursen."
    "2018-10-15": "(E, mos) Nytt dokument inför uppdatering v3 av kursen."
    "2017-06-15": "(D, mos) Förbereder genomgång inför ht17."
    "2016-11-01": "(C, mos) Ladokmoment och studieplan omskrivna."
    "2016-02-22": "(B, mos) Bort med not om kursutveckling samt not ny kurskod från ht16."
    "2015-03-02": "(A, mos) Första revisionen inför kursstart HT2015."
...
Kursen htmlphp (v4)
==================================

Kursen **Webbteknologier**, a.k.a. *htmlphp*, lär ut webbutveckling där teknikerna  HTML, CSS, PHP och SQL används för att tillsammans bygga en databasdriven webbplats.

<!--more-->

HTML och CSS ger grundförutsättningarna för hur en webbapplikation kan byggas. Genom att använda server-side skriptprogrammering med PHP så kan webbapplikationen bli mer dynamisk och lagra information i databaser. Dessutom kan webbapplikationen byggas upp med en programmeringsmässig struktur, en struktur som underlättar utveckling och underhåll av webbplatsen.

Detta är en introduktionskurs för den som vill lära sig teknikerna från grunden. Kursen kräver inga förkunskaper och hanterar helheten kring en webbapplikation. Till att börja med fokuseras på HTML och CSS. Vi använder HTML5 och tittar på vilka möjligheter som CSS3 kommer att erbjuda.

Därefter introduceras PHP som ett skriptspråk och med enkla programmeringskonstruktioner får vi möjlighet att bygga ut vår webbplats på ett strukturerat sätt. Vi fortsätter med att lagra information i en filbaserad databas (SQLite) via PHP's gränssnitt PHP Data Objekt. Vi använder på frågespråket SQL och lär oss de grundläggande konstruktionerna.

Sammantaget blir kursen en grundlig introduktion och orientering i de tekniker som ofta används för att skapa webbplatser.



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

* självständigt, utefter en specifikation, kunna utveckla och driftsätta en webbplatts med HTML, CSS, PHP och SQL.
* ha god praktisk förmåga att hantera de verktyg och miljöer som används vid utveckling av databasdrivna webbapplikationer.



Kursmoment {#kursmoment}
------------------------

Kursen är uppdelad i kursmoment där varje kursmoment uppskattas till 20h studerande i form av programmering, undersökning, läsande, övningar, uppgifter, redovisning och eftertanke. Alla kursmoment skall redovisas och du samlar alla redovisningar i din me-sida.

Kursen avslutas med ett större avslutande moment som examinerar kursen.



### Kmom01: Bygg en webbplats. {#kmom01}

Kursmomentet visar hur du kommer igång med labbmiljön, dels via en installation på din egen dator och dels genom att publicera resultatet på driftsservern. Du kommer att utveckla din kod lokalt och därefter kopiera över resultatet till en driftsserver.

Du skall gå igenom ett par exempel på kodning i HTML, CSS och PHP och använda lärdomarna för att bygga en me-sida. Me-sidan är en enkel webbplats som innehåller en presentation av dig själv tillsammans med redovisningstexterna för kursmomenten.

[Instruktion till kursmoment 01](./kmom01).



### Kmom02: Bygg ut din webbplats. {#kmom02}

Vi fortsätter att bygga ut me-sidan med HTML, CSS och PHP. Detta moment är en vidare genomgång av grunder i HTML och CSS. Efter kursmomentet så har du en me-sida version 2 som innehåller några av de vanligaste konstruktionerna som återfinns i flertalet “riktiga” webbplatser.

Vi börjar använda lite fler enkla PHP-konstruktioner för att dra nytta av PHP och dess fördelar.

Vi gör en första laboration i PHP för att få en känsla för hur det är att koda med PHP.

[Instruktion till kursmoment 02](./kmom02).



### Kmom03: Bygg multisida i PHP. {#kmom03}

I kursmomentet gås igenom de inbyggda arrayerna i PHP. Vi tittar på `$_GET`, och `$_SERVER` samt hur de kan användas som arrayer. Med hjälp av dessa arrayer, och lite mer PHP-kunskaper, gör vi ett par små testprogram för att klura ut hur saker och ting fungerar.

Vi skapar en sida, som har sin egen meny, vi kallar den multisida och löser både den och lite andra småsaker med PHP-kod.

Till slut knyter vi ihop det genom att integrera multisidan i din me-webbplats. Resultatet blir me-sida version 3.0.

[Instruktion till kursmoment 03](./kmom03).



### Kmom04: Formulär och sessioner. {#kmom04}

I detta kursmoment går vi igenom fler grunder i CSS, grunder såsom boxmodellen, storlekar, display, float, fonter, färger och bakgrund. Du får möjligheten att leka runt och testa olika konstruktioner. Det är ett bra sätt att lära sig.

I PHP får du lära dig att skapa egna funktioner och se hur du jobbar med HTML formulär och sessioner i PHP. Du kommer bekanta dig med de inbyggda globala arrayerna `$_GET`, `$_POST` och `$_SESSION` och se hur de relaterar till formulär och sessioner.

[Instruktion till kursmoment 04](./kmom04).



### Kmom05: SQL och SQLite. {#kmom05}

Låt oss börja med databaser. Jag har valt att introducera databasen SQLite som är en filbaserad databas. En filbaserad databas förenklar hanteringen eftersom databasen ligger i en enda fil och det finns inga användare eller behörigheter att konfigurera.

Till databasen SQLite behövs klientprogram som kan användas för att prata med databasen. Vi prövar olika klienter, en variant för desktop, en som är webbaserad och en terminalbaserade.

[Instruktion till kursmoment 05](./kmom05).



### Kmom06: PHP, PDO och SQL. {#kmom06}

Vi fortsätter jobba med databasen SQLite och integrerar databasen med en PHP applikation. Vi använder PHP PDO för att koppla oss till databasen.

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


<!--

###Referenslitteratur {#referenslitteratur}

Det finns ingen referenslitteratur.

-->



### Övrig litteratur {#ovriglitteratur}

I varje kursmoment kan det tillkomma läsanvisningar i till exempel artiklar, manualer och webbmaterial.

<!--

Bort inför ht18

* **[Beginning PHP and MySQL: From Novice to Professional](kunskap/boken-beginning-php-and-mysql-from-novice-to-professional)** -- Gilmore, W  
  En tjockare bok för den som vill ha en mer komplett vy över PHP och MySQL från början.
-->


<!--
Läsanvisningar {#lasanvisning}
------------------------------

Här följer en sammanställning av de läsanvisningar till kurslitteraturen som ges i varje kursmoment.

| Kursmoment | HTML och CSS-boken     | Webbutveckling med PHP och MySQL    |
|------------|------------------------|-------------------------------------|
| Kmom01     | Inledning, 1, 2        | 1                                   |
| Kmom02     | 3, 4                   | 2, 4, 5, 6                          |
| Kmom03     | 5, 7                   | 2.4, 3                              |
| Kmom04     | 9, 10                  | 7                                   |
| Kmom05     | 9 (repetera)           | 8                                   |
| Kmom06     |                        | 8                                   |
| Kmom10     |                        |                                     |

Dessutom har varje kursmoment läsanvisningar i artiklar och videos.

-->



Rekommenderad studieplan {#studieplan}
---------------------------------------------

Kursen har en [rekommenderad studieplan](kurser/htmlphp/studieplan) som visar en översikt över kursens olika moment och när de i tiden bör utföras för att studenten skall ligga i fas med kursens planering.

I studieplanen visas när rättning sker av respektive inlämnat moment samt när det finns möjligheter att göra restinlämningar.

Läs mer om den [rekommenderade studieplanen](kurser/faq/rekommenderad-studieplan).



Lektionsplan {#lektionsplan}
---------------------------------------------

Det finns en [lektionsplan](kurser/htmlphp/lektionsplan) som visar en detaljplanering för den lärarledda undervisningen i kursen, vecka för vecka. Där kan du se när tider är bokade för undervisning och handledning.

Läs mer om [lektionsplanen](kurser/faq/lektionsplan-och-schema).



Veckoplan {#veckoplan}
---------------------------------------------

Det finns en [veckoplan](kurser/htmlphp/veckoplan) som kompletterar den rekommenderade studieplanen och lektionsplanen. Här kan du få en rekommendation till hur du skall lägga upp dina studier, vecka för vecka.



Läromaterial {#laromaterial}
----------------------------------------

Via [läromaterial](laromaterial) kan du se en översikt av hur kurstillfället har valt att strukturera läromaterialet och vilka verktyg som används i undervisningen.



Handledning {#handledning}
----------------------------------------

Förutom den planerade undervisningen enligt lektionsplanen så kan du få hjälp och stöd i kursens chatt och i forumet. Chatten lämpar sig för korta enkla frågor och forumet för mer utredande och längre frågor och svar. Om du inte får svar i chatten så rekommenderas att du postar i forumet.

I läromaterialet ovan kan du se vilka chatt/forum-verktyg som används vid ditt kurstillfälle.

Läs mer om [lärande community](kurser/faq/larande-community) samt [lärarstöd och handledning](kurser/faq/lararstod-och-handledning).



Betygsättning {#betyg}
------------------------

Det finns ett särskilt dokument som beskriver [hur bedömning och betygsättning sker](kurser/bedomning-och-betygsattning).



Formalia {#formalia}
----------------------------------------

Du kan hitta [formalia om ett kurstillfälle](formalia) och se lärarteamet, deras roller och kontaktuppgifter tillsammans med vilka studentgrupper som läser kursen och övriga intressenter till kurstillfället.



Ladok {#ladok}
------------------------

Enligt kursplanen finns ett antal ladokmoment och de är kopplade till kursens kursmoment enligt följande.

| Kursens moment  | Ladok moment enligt kursplan  |
|-----------------|-------------------------------|
| Kmom01 + kmom02 | Uppgift 1 á 2.5hp             |
| Kmom03 + kmom04 | Uppgift 2 á 2.5hp             |
| Kmom05 - kmom10 | Projekt á 2.5hp               |

Den sista inlämningen bestämmer kursens slutbetyg vilket utfärdas när samtliga moment godkänts.

Läs mer om [rapportering av resultat](kurser/faq/resultatrapportering).



Kursutvärdering och kursutveckling {#kursutvardering}
-----------------------------------------------------

Det finns ett särskilt dokument som beskriver hur arbetet med kursutvärderingar och kursutveckling sker. Det är oerhört viktigt för mig att du säger till vad du tycker om kurs och kursmaterial, du kan alltid hojta till i både forum, chatt eller mail.

Läs om hur [jag jobbar med kursutvärdering och kursutveckling](kurser/kursutvardering-och-kursutveckling).



Kursplan {#kursplan}
-----------------------------------------------------

Kursplanen är kursens formella dokument som fastställts av högskolan. När kursen utvärderas görs det mot kursplanen. I kursplanen kan du läsa om kursens klassificering, syfte, innehåll, mål, generella förmågor, lärande och undervisning, bedömning och examination, litteratur, mm.

Från och med hösten 2016 hittar du [kursplanen genom att söka på kurskoden PA1439 via BTH's hemsida](http://edu.bth.se/utbildning/utb_kursplaner.asp?KKurskod=PA1439) och kursen heter "Webbteknologier".

Mellan höstterminen 2013 och vårterminen 2016 hade kursen kurskoden [DV1462](http://edu.bth.se/utbildning/utb_kursplaner.asp?KKurskod=DV1462) och hette "Databaser, HTML, CSS och skriptbaserad PHP-programmering".

Från 2010 till och med vårterminen 2013 hade kursen kurskoden [DV1401](http://edu.bth.se/utbildning/utb_kursplaner.asp?KKurskod=DV1401) och hette "Databaser, HTML, CSS och skriptbaserad PHP-programmering".



Versioner av kursen {#versioner}
-----------------------------------------------------

Om du påbörjat den äldre version av kursen så skall du också slutföra denna versionen av kursen (eller göra om den nya kursen från start). Alternativt rådgör du med den som är kursansvarig.

För tillfällen från höstterminen 2020 så [finns kursmaterialet till htmlphp (v4) här](kurser/htmlphp-v4).

För tillfällen från höstterminen 2018 till och med höstterminen 2019 så [finns kursmaterialet till htmlphp (v3) här](kurser/htmlphp-v3).

För tillfällen från höstterminen 2015 till och med höstterminen 2017 så [finns kursmaterialet till htmlphp (v2) här](kurser/htmlphp-v2).

För tillfällen fram till och med vårterminen 2015, så [finns kursmaterialet till den kursen i htmlphp (v1)](kurser/arkiv/htmlphp-v1).
