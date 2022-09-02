---
title: vlinux (v1)

author:
    - lew
revision:
    "2022-04-20": (C, lew) Uppdaterad inför HT22
    "2018-12-21": (B, lew)
    "2018-12-21": (A, mos) Inför skapandet av linux v3, nytt namn, syfte, förkunskaper och kurskod.
...
Kursen vlinux (v1)
==================================

[WARNING]
Kursen uppdateras inför HT22. Är "gula rutan" borta under kursmomentet är det fritt fram att börja.
[/WARNING]

Kursen **Operativsystemet Linux och virtualiseringstekniker**, a.k.a. *vlinux*, och syftet med kursen är att studenten ska lära sig operativsystemet Linux och dess beståndsdelar såsom processer, filsystemet och terminalen. Kursens fokusområden ligger även i operativsystemets uppbyggnad, programhantering och serverhantering samt att programmera i språket Bash. Studenten ska även lära sig hantera virtualiseringstekniken Docker.

<!--more-->

Kursen har tre fokus. Det ena är att lära ut grunder och beståndsdelar i operativsystemet Linux. Det andra är att lära ut programmeringsspråket Bash och dess funktionalitet. Det tredje är att introducera virtualiseringsmiljöer och visa på hur man kan använda dem. Kursen är för de som skall jobba med webbprogrammering.

Kursen börjar med att du installerar virtualiseringsmiljön Docker och varianter på operativsystemet Linux. Därefter lär du dig de grundläggande koncepten i Linux såsom terminalen, filsystemet, process-begreppet och att installera tjänster och programvaror och servrar. Senare i kursen får du lära dig hur du flera Docker-containrar som kommunicerar med varandra.
<!-- Kursen börjar med att du installerar virtualiseringsmiljön VirtualBox med ett operativsystemet Linux. Därefter lär du dig de grundläggande koncepten i Linux såsom terminalen, filsystemet, process-begreppet och att installera tjänster och programvaror och servrar. Senare i kursen får du lära dig hur du installerar och hanterar virtualiseringsmiljön Docker samt hur vi jobbar med flera Docker-containrar som kommunicerar med varandra. -->

Samtidigt skriver du skript-program i programspråket Bash.

I slutet av kursen får du visa dina färdigheter i ett praktiskt programmeringsprojekt.



Krav på labbmiljö {#labb}
------------------------

I kursen installerar du virtualiseringssystemet Docker. Du bör ha en dator med minst 8GB internminne för att det skall fungera bra. Med mindre internminne tar det längre tid att genomföra övningarna och det kan kännas trögt.

Kort och gott, du skall installera Docker och du behöver ha en tillräckligt bra miljö för att det skall fungera utan bekymmer.



Förkunskaper {#forkunskaper}
------------------------

Det formella förkunskapskravet är:

> För tillträde till kursen krävs 22,5hp programmering, webbteknologier och databaser.



Innehåll {#innehall}
------------------------

Kursen omfattar följande områden:

* Installation av Linux och Linux som server. Paket och pakethantering.
* Installation av webbservern Apache.
* Linux med terminal (Bash), ssh, nano, och systemkommandon.
* Operativsystemets olika delar såsom filsystemet, processer och processhantering.
* Skriptprogrammering i Bash.
* Virtualiseringmiljön Docker.



Mål {#mal}
------------------------



###Kunskap och förståelse {#kunskap}

Efter genomförd kurs skall studenten:

* visa grundläggande förståelse för operativsystemet Linux genom att skriftligen beskriva och sammanfatta erfarenheter och observationer från övningar och projekt.
* visa goda kunskaper i att använda och kontrollera en webbserver i Linuxmiljö genom att tillämpa tekniker i praktiska övningar och projekt.
* visa goda kunskaper i att använda och kontrollera virtualiseringsmiljer genom att tillämpa teknikerna i praktiska övningar och projekt.



###Färdighet och förmåga {#fardighet}

Efter genomförd kurs skall studenten:

* kunna självständigt utveckla, dokumentera och presentera ett projekt baserat på programmering med Bash och Docker i en Linux-miljö.
* ha god praktisk förmåga att hantera de verktyg och miljöer som används vid utveckling och felsökning för Bash-script och webbservrar i en Linux-miljö.



###Värderingsförmåga och förhållnigssätt {#vardering}

Efter genomförd kurs ska studenten:

* via redovisningstexter kunna visa god förmåga att reflektera över kodstruktur i språket Bash och hanteringen av en webbserver.
* via redovisningstexter kunna visa god förmåga att reflektera över användandet av en virtualiseringsmiljö.
* via redovisningar och utförda övningar påvisa god kunskap om serverhantering, terminalhantering, språket Bash, webbserver och en virtualiseringsmiljö.



Kursmoment {#kursmoment}
------------------------

Kursen är uppdelad i kursmoment där varje kursmoment uppskattas till 20h studerande i form av programmering, undersökning, läsande, övningar, uppgifter, redovisning och eftertanke. Alla kursmoment skall redovisas och du samlar alla redovisningar i din me-sida.



<!-- ### Kmom01: Linux som server {#kmom01} -->

<!-- Det första kursmomentet går ut på att installera Debian/Linux i Virtualiseringsmilön VirtualBox och logga in på maskinen som en server, via SSH.

För att lyckas med det så behöver du bekanta dig med grunderna i terminalen och lära dig ett par av de viktigaste kommandona som utförs i terminalen. -->
### Kmom01: Docker och en linuxmiljö {#kmom01}

Det första kursmomentet går ut på att installera Docker och bekanta sig med miljön. Vi ska titta på hur det ser ut i terminalen och träna på några vanliga kommandon som hjälper oss på olika sätt.

[Instruktion till kursmoment 01](kurser/vlinux-v1/kmom01).



### Kmom02: Dockerfile och Bash {#kmom02}

<!-- Nu har vi en Linux-server. Låt oss installera ett par webbplatser på den. Det låter som en vettig syssla för en webbprogrammerare.

Ett bra sätt att installera många webbplatser på en och samma maskin är Apache Virtual Hosts och det är något vi skall bekanta oss med.

Samtidigt behöver vi bekanta oss med fler Unix-kommandon så vi känner oss hemma i terminalen, SSH och att jobba med Linux som en server. -->

[Instruktion till kursmoment 02](kurser/vlinux-v1/kmom02).



### Kmom03: Virtual Hosts {#kmom03}

<!-- Mycket handlar om att förenkla vardagen som programmerare genom att automatisera de processer och rutiner man utför. En hel del av det vi gör kan automatiseras via skript, till exempel Bash-skript med kommandon. Men för att göra det behöver vi ha koll på hur man skapar skript och hur man programmerar i Bash. Vi lämnar även VirtualBox och tittar närmare på virtualisering med Docker. En del kanske stannar i VirtualBox och installerar Docker däri. -->

[Instruktion till kursmoment 03](kurser/vlinux-v1/kmom03).



### Kmom04: En webbserver i Docker {#kmom04}

Vi går vidare med Docker och lär oss hur vi får igång en webbserver som körs inuti containern. Vi tittar även på volymer och hur vi kan anropa servern utifrån. Till detta skapar vi också ett Bashscript som kan testa en egen router.

[Instruktion till kursmoment 04](kurser/vlinux-v1/kmom04).



### Kmom05: Ett nätverk i Docker {#kmom05}

Vi lär oss skapa fler containrar och kommunicera mellan dem med hjälp av ett privat nätverk. Flera services ska kommunicera med varandra i Docker.

Vi traskar även vidare med vår programmering i Bash och diverse verktyg.

[Instruktion till kursmoment 05](kurser/vlinux-v1/kmom05).



### Kmom06: Docker Compose {#kmom06}

Vi bygger vidare på föregående kursmoment och använder docker-compose för att hantera våra services i det privata nätverket. Vi jobbar även vidare med Bash-script.

[Instruktion till kursmoment 06](kurser/vlinux-v1/kmom06).



### Kmom07/10: Projekt och examination {#kmom10}

Avslutningsvis gör du ett projekt enligt en specifikation. Projektet är det sista som du gör och tillsammans med alla redovisningar som finns på din me-sida så används detta som underlag för att examinera dig från kursen.

[Instruktion till kursmoment 10](kurser/vlinux-v1/kmom10).



Kurslitteratur {#litteratur}
----------------------------

[Måste jag skaffa kurslitteraturen](kurser/maste-jag-skaffa-kurslitteraturen)?



###Kurslitteratur {#kurslitteratur}

Som kurslitteratur har jag valt följande bok, tillsammans med ett antal artiklar som finns tillgängliga på nätet.

<!-- Det finns läsanvisningar i samband med varje kursmoment. -->


* **[The Linux Command Line](kunskap/boken-the-linux-command-line)** -- William Shotts
    En lättläst och trevlig bok med öppen licens som gör att boken finns tillgänglig fritt på bokens webbplats. Boken ger en bra introduktion till nybörjaren i Linux, systemkommandon och terminalen.



###Referenslitteratur {#referenslitteratur}

Följande böcker har jag valt som referenslitteratur. De kan vara bra att ha tillhands och ger lite extra läsmöjligheter. De behövs inte för att klara kursen men vill du bemästra kursens område så är dessa böcker bra startpunkter.

* **[The Debian Administrator's Handbook, Debian Wheezy from Discovery to Mastery](kunskap/boken-the-debian-administrator-s-handbook)** -- Raphaël Hertzog, Roland Mas
    En gedigen referensmanual för den som är allvarlig med att lära sig Linux.



###Övrig litteratur {#ovriglitteratur}

Det finns närliggande litteratur som är intressant för den som vill fördjupa sig i ämnet eller den som vill skaffa sig förkunskaper innan kursen.


<!-- * **[Speaking JavaScript: An In-Depth Guide for Programmers](kunskap/boken-speaking-javascript)** -- Axel Rauschmayer
    En bok om att komma igång med JavaScript som programmeringsspråk. Fungerar för nya programmerare såväl som för de som redan kan ett eller ett par programmeringsspråk.

* **[JavaScript: The Good Parts](kunskap/boken-javascript-the-good-parts)** -- D. Crockford
    En genomgång av JavaScript Core och hur man ska, och inte ska, skriva sin kod.

* **[JavaScript: The definitive Guide](kunskap/boken-javascript-the-definitive-guide)** -- D. Flanagan
    En tegelsten, komplett med allt du vill veta om språket JavaScript med dess Core, DOM och eventhantering, inklusive en referens till olika funktioner. Perfekt för dig som verkligen vill JavaScript. -->



Läsanvisningar {#lasanvisning}
------------------------------

TBD

<!-- Här följer en sammanställning av de läsanvisningar till kurslitteraturen som ges i varje kursmoment.

| Kursmoment | Linux Command Line | Debian Handbook |
|------------|--------------------|-----------------|
| Kmom01     | 1, 2, 3, 4         | 1, 4            |
| Kmom02     | Repetera 1-4       | 6, 7            |
| Kmom03     | 6, 24              |                 |
| Kmom04     |                    |                 |
| Kmom05     |                    |                 |
| Kmom06     |                    |                 |
| Kmom10     |                    |                 |

Varje kursmoment kan ha fler läsanvisningar som nämns i respektive instruktion för kursmomentet. -->



Lektionsplan och rekommenderad studieplan {#schema}
---------------------------------------------

Läser du kursen inom ramen för programmet Webbprogrammering (campus/distans) så finns det en [rekommenderad studieplan inom programmet](kurser/vlinux-v1/studieplan) samt en [lektionsplan](kurser/vlinux-v1/lektionsplan).

Läser du kursen som en del i ett kurspaket så finns det en [studieplan som är kopplad till kurspaketet](webutv#studieplan).

<!--
För dig som studerar kursen som enskild kurs finns det en [rekommenderad studieplan](linux/studieplan) kopplad till de kurstillfällen som erbjuds.
-->

Vissa av kurstillfällena kan ha en lektionsplan som du får i samband med kursstart. Lektionsplanen visar de tillfällena som är schemalagda träffar.

Finns det en lektionsplan så finns ofta bokningar av salar gjorda i bokningsschemat.

Studieplan, eventuell lektionsplan och eventuellt schema finns tillgängligt via kurstillfället på ITs.

Läs mer om den [rekommenderade studieplanen](kurser/faq/rekommenderad-studieplan) och [lektionsplanen](kurser/faq/lektionsplan-och-schema).



Lärarstöd och handledning {#handledning}
----------------------------------------

Schemalagda labbtillfällen, hangouts samt forum och chatt de viktigaste källorna för handledning. Läs om [handledning och hjälp-till-självhjälp](kurser/faq/lararstod-och-handledning).



Ladok {#ladok}
------------------------

Enligt kursplanen finns ett antal ladokmoment och de är kopplade till kursens kursmoment enligt följande.

| Kursens moment  | Ladok moment enligt kursplan  | Betyg |
|-----------------|-------------------------------|-------|
| Kmom01 + kmom02 | Uppgift 1 á 2.5hp             | G-U   |
| Kmom03 + kmom04 | Uppgift 2 á 2.5hp             | G-U   |
| Kmom05 - kmom10 | Projekt á 2.5hp               | A-F   |

Den sista inlämningen bestämmer kursens slutbetyg vilket utfärdas när samtliga moment godkänts.

Läs mer om [rapportering av resultat](kurser/faq/resultatrapportering).



Betygsättning {#betyg}
------------------------

Det finns ett särskilt dokument som beskriver [hur bedömning och betygsättning sker](kurser/bedomning-och-betygsattning).



Kursutvärdering och kursutveckling {#kursutvardering}
-----------------------------------------------------

Det finns ett särskilt dokument som beskriver hur arbetet med kursutvärderingar och kursutveckling sker. Det är oerhört viktigt för mig att du säger till vad du tycker om kurs och kursmaterial, du kan alltid hojta till i både forum, chatt eller mail.

Läs om hur [vi jobbar med kursutvärdering och kursutveckling](kurser/kursutvardering-och-kursutveckling).



Kursplan {#kursplan}
-----------------------------------------------------

Kursplanen är kursens formella dokument som fastställts av högskolan. När kursen utvärderas görs det mot kursplanen. I kursplanen kan du läsa om kursens klassificering, syfte, innehåll, mål, generella förmågor, lärande och undervisning, bedömning och examination, litteratur, mm.

Från och med hösten 2019 heter kursen "Operativsystemet Linux och virtualiseringstekniker". Du hittar [kursplanen genom att söka på kurskoden DV1611 via BTH's hemsida](http://edu.bth.se/utbildning/utb_kursplaner.asp?KKurskod=DV1611).

Fram till och med våren 2019 gick kursen under namnet "Programmera webbtjänster i Linux". Du hittar [kursplanen genom att söka på kurskoden DV1547 via BTH's hemsida](http://edu.bth.se/utbildning/utb_kursplaner.asp?KKurskod=DV1547).

Under våren 2019 fanns en kurskod DV1609 med justerade förkunskapskrav jämfört med DV1547. Men den kursen har inget kurstillfälle.



Tidigare utgåvor {#tidigare}
-----------------------------------------------------

Kursen [linux (v3)](kurser/linux-v3) bygger på kurskoden DV1611.

Kurserna [linux (v2)](kurser/linux-v2) och [linux (v1)](kurser/linux-v1) bygger på kurskoden DV1547.
