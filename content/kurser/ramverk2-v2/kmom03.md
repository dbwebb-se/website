---
author:
    - mos
revision:
    "2019-01-09": "(C, efo) Uppdaterade till version 2."
    "2018-06-08": "(prel, mos) Nytt dokument inför uppdatering av kursen."
    "2017-11-13": "(B, mos) Uppdatera var koden kan sparas samt redovisningsfråga om enhetstester i Docker."
    "2017-11-03": "(A, mos) Första utgåvan."
...
Kmom03: Docker & test
==================================

[WARNING]

** Kursutveckling pågår till kurs ramverk2 v2 **

Kursstart våren 2019.

[/WARNING]

Vi installerar Docker och gör det till en integrerad del av vårt repo och testmiljö. Det handlar om att använda virtualisering för att köra flera versioner av ett målsystem och använda för att testa koden i ditt repo.

Vi tittar på hur vi kan använda enhetstestning för att säkerställa att de minsta beståndsdelar i vår kod gör som det är tänkt.

<!--more-->

[FIGURE src=image/snapht17/cimage-php56.png?w=w2 caption="Tre flikar mot tre olika installationer och versioner av PHP, samtidigt."]

[ASCIINEMA src=143344 caption="Starta och stoppa flera kontainrar samtidigt med docker-compose."]

[FIGURE src=image/snapht17/mocha-nyc-codecoverage.png?w=w2 caption="Kodtäckningen är på 100% i vårt exempel."]

Tänk dig in i rollen som systemarkitekt på ett företag där du är den som gör teknikvalen till nästa projekt. Du skall göra teknikval som hela ditt utvecklargäng sedan skall använda. Tänk så, det blir en bra attityd inför kursmomentet.



<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Läsanvisningar  {#lasanvisningar}
---------------------------------

*(ca: 4-6 studietimmar)*



### Material {#material}

Kika igenom följande material.

1. [Webbplatsen för Docker](https://www.docker.com/) ger dig en översikt och där hittar du dokumentationen som du vill läsa igenom samt instruktioner till hur du installerar verktyget.

1. Webbplatsen för [Mocha](https://mochajs.org/) ger dig en översikt av ett verktyg för att testa din JavaScript-kod med enhetstester. Du skall själv välja ett eget testverktyg att använda, Mocha är en av möjligheterna.

1. Verktyget [Istanbul](https://istanbul.js.org/) kan kopplas till Mocha för att hantera kodtäckning vid enhetstester.

1. Det finns en forumtråd med tips om [artiklar för testning](t/6984). Kika där för inspiration.



### Video  {#video}

1. Det finns en [videoserie](https://www.youtube.com/playlist?list=PLKtP9l5q3ce--Z6iuqvY-UfAN6vWhHpmZ) kopplat till kursen, titta på videos som börjar på 3. Videoserien uppdateras varje måndag och innehåller material för att utvärdera tekniker och ge tips & trix för att lösa kursmomenten.



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 6-10 studietimmar)*



###Övningar {#ovningar}

Gör följande övningar, de behövs normalt för att klara uppgifterna.

1. Jobba igenom artikeln "[Kom igång med Docker som utvecklingsmiljö](kunskap/kom-igang-med-docker-som-utvecklingsmiljo)" för att komma igång och installera Docker och dess verktyg. Spara din exempelkod i `me/kmom03/docker`.

1. Jobba igenom artikeln "[Kom igång med en testmiljö i JavaScript](kunskap/kom-igang-med-en-testmiljo-i-javascript)" för att komma igång med tester och en testmiljö. Spara dina exempelprogram i `me/kmom03/unittest`.



###Uppgifter {#uppgifter}

Följande uppgifter skall utföras och resultatet skall redovisas via me-sidan.

1. Gör uppgiften "[Integrera en testmiljö med JavaScript i me-sida och Express](uppgift/integrera-en-testmiljo-med-javascript-i-me-sida-och-express)". Det handlar om att integrera enhetstester, kodtäckning och en CI-kedja i ditt me-api. Spara allt i dina befintliga repon.

1. Gör uppgiften "[Skriva redovisningstexter i frontend](uppgift/skriva-redovisningstexter-i-frontend)". Du skapar ett formulär för redovisningstexter i frontend som användaren kommer åt efter att ha autentiserad sig.



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Lägg extra tid på skrivandet i detta inledande momentet då redovisningstexten är mer omfattande än du är van vid.

Se till att följande frågor besvaras i texten:

* Har du jobbat med Docker eller andra virtualiseringstekniker innan?
* Hur ser du på möjligheterna att använda dig av Docker för att jobba med tester av ditt repo?
* Berätta vilka tekniker/verktyg du valde för enhetstester och kodtäckning och varför?
* Berätta om din CI-kedja och reflektera över de valen du gjorde?
* Reflektera över hur det gick att integrera enhetstesterna i olika Docker-kontainerns och om du ser någon nytta med detta.
* Hur väl lyckades du utvärdera TDD-konceptet och vilka är dina reflektioner?
* Vad är din TIL för detta kmom?

Har du frågor eller funderingar så ställer du dem i forumet.
