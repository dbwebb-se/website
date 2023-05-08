---
author:
    - mos
revision:
    "2023-05-08": "(E, mos) Genomgången inför ht23."
    "2022-05-03": "(D, mos) Lade till övning om software metrics."
    "2022-05-02": "(C, mos) Uppdaterad inför vt22 och mvc-v2."
    "2021-05-04": "(B, mos) Kompletterade med läsanvisningar."
    "2021-04-30": "(A, mos) Första utgåvan."
...
Kmom06: Automatiserad test
==================================

Vi vill nu ta vara på de tester vi kör mot vår applikation och automatisera och visualisera dem så att vi kan dra ännu större nytta av dem och det resultat de kan ge oss. När vi pratar tester så innebär det både enhetstester och den statiska kodvalidering som våra validatorer gör åt oss. Statisk kodvalidering innebär i vårt fall både kodstandarder och det som kallas "mess detectors" som upptäcker kod med förbättringspotential.

Vi skall jobba med begrepp som automatiserad testning av projektet samt fundera över vad det är alla validatorer försöker berätta för oss i form av "quality metrics". Detta kommer vi att göra genom att delvis påbörja en kedja av Continous integration (CI) och koppla vårt repo mot externa byggtjänster och låta dem bygga och testa vår kod varje gång vi pushar en ny commit till GitHub/GitLab.

När vi är klara får vi en badge, en liten grön/röd status-bild av bygget, som berättar om kodbygget gick bra eller inte. Vi kan också få badges som ger oss information om hur vacker vår kod är, vilken upplevd kodkvalitet som vi har producerat.

När vi är klara så kommer vi framförallt att bättre förstå innebörden av vad följande badges kan innebära och vi kan även bedöma om de eventuellt berättar något om ordning och reda samt kodkvaliteten i det projekt som de representerar. Nedan badges representerar olika projekt och berättar om bygget gick bra, vilken kodtäckning som finns och vilken upplevd kodkvalitet projektet har. Klicka på en badge för att se mer detaljer och skaffa dig en känsla om kvaliteten i respektive projekt.

[![Build Status](https://scrutinizer-ci.com/g/canax/router/badges/build.png?b=master)](https://scrutinizer-ci.com/g/canax/router/build-status/master) [![Code Coverage](https://scrutinizer-ci.com/g/canax/router/badges/coverage.png?b=master)](https://scrutinizer-ci.com/g/canax/router/?branch=master) [![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/canax/router/badges/quality-score.png?b=master)](https://scrutinizer-ci.com/g/canax/router/?branch=master)

[![Build Status](https://scrutinizer-ci.com/g/canax/database/badges/build.png?b=master)](https://scrutinizer-ci.com/g/canax/database/build-status/master) [![Code Coverage](https://scrutinizer-ci.com/g/canax/database/badges/coverage.png?b=master)](https://scrutinizer-ci.com/g/canax/database/?branch=master) [![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/canax/database/badges/quality-score.png?b=master)](https://scrutinizer-ci.com/g/canax/database/?branch=master)

[![Build Status](https://scrutinizer-ci.com/g/mosbth/cimage/badges/build.png?b=master)](https://scrutinizer-ci.com/g/mosbth/cimage/build-status/master) [![Code Coverage](https://scrutinizer-ci.com/g/mosbth/cimage/badges/coverage.png?b=master)](https://scrutinizer-ci.com/g/mosbth/cimage/?branch=master) [![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/mosbth/cimage/badges/quality-score.png?b=master)](https://scrutinizer-ci.com/g/mosbth/cimage/?branch=master)

<!-- more -->

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>


<!--
Lägg till i dbwebb test så att det kollar om README filen är uppdaterad med länkar till badges.
-->



Läs & Studera  {#lasanvisningar}
---------------------------------

*(ca: 2-8 studietimmar)*



### Föreläsning {#flas}

Titta igenom följande föreläsningar.

1. [Software quality metrics and static code analysis](./../forelasning/quality) en introduktion till området kring kodkvalitet och statisk kodanalys.

<!--
Se igenom föreläsningen om den har rätt fokus, gör en uppdatering.
Knyt ihop med (en uppdaterad variant av) föreläsningen om kvalitetsaspekter på oo programmering.

Förenkla och håll ett fokus kring fyra (fem code coverage, sex CRAP) C:n för att komma igång med kodkvalitet.
* Cyclomatic complexity
* Cohesion (LCOM)
* Coupling (Afferent and Efferent)
* Coverage

Något om CI/CD? Locka till kursen i trean?
Något om olika typer av buildsystem?
-->



### Litteratur  {#litteratur}

Läs enligt följande.

1. Om du känner att du behöver en introduktion till "varför vi sysslar med detta" så kan du läsa om följande två begrepp som till viss mån berör problemområdet inom mätning av kvalitet av programvara och allmänt om kodkvalitet.

    * [Code smell](https://en.wikipedia.org/wiki/Code_smell)
    * [Technical debt](https://en.wikipedia.org/wiki/Technical_debt)

1. När vi pratar automatiserad testning så berör vi områden som benämns CI/CD. Läs snabbt och översiktligt igenom artikeln "[What is CI/CD?](https://www.redhat.com/en/topics/devops/what-is-ci-cd)" och försök ta reda på vad termen CD och vad termen CD står för.

1. Bekanta dig snabbt och översiktligt med byggtjänsten [Scrutinizer CI](https://scrutinizer-ci.com/), du kommer använda den i uppgifterna.



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 10-14 studietimmar)*

Övningar är träning inför uppgifterna, det är ofta klokt att jobba igenom övningarna. Uppgifter skall utföras och redovisas.

Jobba gärna i grupp med dina studiekompisar, men skriv alltid din egen kod för hand. Även om du tjuvkikar för att hitta bra lösningar så är det en stor skillnad att skriva koden själv jämfört med att kopiera från någon.



### Övningar {#ovningar}

Jobba igenom övningarna, de förbereder dig inför uppgifterna.

1. En guide/övning "[Software Quality Metrics](https://github.com/dbwebb-se/mvc/tree/main/example/metrics)" som visar hur du kan jobba med analys av din kod i Scrutinizer och phpmetrics. Det finns även en videoinspelning där Mikael visar hur du kan jobba med verktygen och de metrics de visar. Det kan vara bra att jobba igenom denna för att få ett par tips inför uppgiften samt att ha mätvärden från fler projekt att relatera till.



### Uppgifter {#uppgifter}

Följande uppgifter skall utföras och resultatet skall redovisas.

PS. Undvik att uppdatera din källkod i `me/report` när du gör de två första övningarna. Spara dina eventuella ändringar till sista uppgiften.

1. Det finns en övning "[Quality metrics of your PHP code](https://github.com/dbwebb-se/mvc/tree/main/example/phpmetrics)" i ditt kursrepo under `example/phpmetrics` som hjälper dig att komma igång med att visualisera mätvärden för din kod som kan ange och indikera en viss nivå av kvalitet för din kod.

1. Det finns en övning "[Integrate your repo with Scrutinizer](https://github.com/dbwebb-se/mvc/tree/main/example/scrutinizer)" i ditt kursrepo under `example/scrutinizer` som hjälper dig att integrera ditt repo med den externa byggtjänsten Scrutinizer.

1. Utför uppgiften "[Analysera och förbättra kodkvalitet i din PHP applikation](uppgift/analysera-och-forbattra-kodkvalitet-i-din-php-applikation)" och jobba mot ditt `me/report`.

<!--
Integrera phpmetrics med phpunit så att man ser en rapport.

Om test mot databas använd .env.test

Om specifikt för Scrutinizer, .env.scrutinizer

CI flöde, GitHub Actions?
-->



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i din redovisningstext.

* Hur uppfattade du verktyget phpmetrics och fann du några särskilda bitar mer värdefulla än andra? Var det några särskilda metrics eller bilder du uppskattade?

* Berätta hur det gick att integrera med Scrutinizer och vilken är din första känsla av verktyget och dess badges? Vilken kodtäckning och kodkvalitet fick du efter första bygget?

* Hur är din egen syn på kodkvalitet, berätta lite om den? Tror du man kan man påvisa kodkvalitet i någon viss mån med badges eller vad tror du?

* Vilken är din TIL för detta kmom?
