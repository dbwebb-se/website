---
author: mos
category:
    - kurs mvc
revision:
    "2023-05-09": "(C, mos) lade till övning om mättal."
    "2023-05-08": "(B, mos) Genomgången inför vt23."
    "2022-05-02": "(A, mos) Första utgåvan."
...
Analysera och förbättra kodkvalitet i din PHP applikation
===================================

Du skall använda ett par verktyg för att analysera kodkvaliteten i ditt PHP projekt. Ett av verktygen (phpmetrics) kan du installera och köra lokalt i din utvecklingsmiljö. Det andra verktyget (Scrutinizer CI) är en extern byggtjänst som kopplar sig mot ditt repo på GitHub/GitLab.

Använd rapporterna från dessa verktyg för att analysera kvaliteten i din kod och gör sedan ett försök att förbättra din kod och se om verktygen uppskattar dina försök genom att ge dig bättre siffror på mättalen.

<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har en PHP applikation som du kan analysera och du vet hur man installerar phpmetrics och du kan koppla ditt repo till Scrutinizer.



Introduktion och förberedelse {#intro}
-----------------------

Gör följande steg för att förbereda dig för uppgiften.



### Övning Software Quality Metrics {#ovn}

Det finns en guide/övning "[Software Quality Metrics](https://github.com/dbwebb-se/mvc/tree/main/example/metrics)" som visar hur du kan jobba med analys av din kod i Scrutinizer och phpmetrics. Det finns även en videoinspelning där Mikael visar hur du kan jobba med verktygen och de metrics de visar.

Det kan vara bra att jobba igenom denna för att få ett par tips inför uppgiften samt att ha mätvärden från fler projekt att relatera till.



### 6C om kodkvalitet {#6C}

Inför denna uppgiften definierar vi de sex C:na om kodkvalitet (6C). Du kan se det som 6 steg till snyggare och bättre kod, "clean code".

* Codestyle
* Coverage
* Complexity
* Cohesion
* Coupling
* CRAP

Din undersökning om kodkvalitet på din egen kod kan utgå från dessa "mättal". Men glöm inte bort att det finns fler mättal som kan vara intressanta.



### Om uppgiften {#om}

Uppgiften handlar dels om att göra din egen analys av kodkvalitet med hjälp av phpmetrics och Scrutinizer.

Därefter skall du identifiera ett antal förbättringsmöjligheter och genomföra dem i din kod. 

Slutligen analyserar du om och hur dina ändringar påverkade rapporterna från phpmetrics och Scrutinizer. Försök att nå så höga "poäng" som möjligt och så lite varningar som möjligt.



Krav {#krav}
-----------------------

Kraven är uppdelade i sektioner.



### Kodkvalitet {#kvalitet}

<!--
Samla rå mätdata som en deluppgift

Fixa så att phpunit kan integreras med phpmetrics
-->

1. Skapa en landningssida `metrics/` för din "Metrics analys" som handlar om kodkvalitet och hur man kan jobba med "Clean code". Placera landningssidan i din navbar. Du skriver din rapport direkt i landningssidan.

1. Börja med en rubrik "Introduktion" där du förklarar de sex C:na och hur de kan påverka kodens kvalitet. Exemplifiera, där det passar, med några mätvärden som är kopplad till din egen kod och ge en kort förklaring av mätvärdet relaterat till kodkvalitet.

1. Skapa en rubrik "Phpmetrics" och analysera dess rapport för din kod. Använd mätvärdena för att hitta flaskhalsar och svaga punkter i din kod (minst 3 stycken). Du vill hitta kod som har förbättringspotential. Visualisera med någon representativ bild från rapporten.

1. Skapa en rubrik "Scrutinizer" och analysera dess rapport för din kod. Gör på samma sätt som du gjorde med Phpmetrics.

1. I ovan analys så kopplar du dina "findings" till 6C. Använd gärna något ytterligare mättal som du finner relevant och intressant.

1. Skapa en ny rubrik "Förbättringar" där du väljer minst 3 förbättringar som du vill göra med din kod (gärna fler).

    * Exempel på förbättringar kan vara:
        * Fixa issues
        * Öka kodtäckning
        * Fokusera på kvalitetsindex i Scrutinizer
        * Minska komplexiteten i class/metod

    * Börja med att skriva om förbättringarna, vad du tänker göra, varför du väljer dem och hur du tror det kommer påverka mätvärdena för kvalitet.
    * Implementera sedan förbättringarna.
    * Analysera därefter rapporterna från phpmetrics och Scrutinizer och notera de nya mätvärdena.
    * Gör det tydligt hur mätvärdena såg ut innan och efter dina förbättringar.

1. Avsluta med ett stycke "Diskussion" där du diskuterar kort kring det du nyss gjort.

    * Kan man aktivt jobba med kodkvalitet och "clean code" på detta sättet? 
    * Finns det fördelar och kanske nackdelar? 
    * Ser du andra möjligheter att jobba mot "clean code"?



### Utvecklingsmiljö {#miljo}

Se till att köra verktygen i din utvecklingsmiljö så att de hanterar den uppdaterade koden.

1. Fixa till din kod enligt den kodstil du kör genom att köra `composer csfix`.

1. Kolla din kod hur den matchar dina linters genom att köra `composer lint`.

1. Dubbelkolla att dina testfall passerar med `composer phpunit`.

1. Generera dokumentation av din kod med `composer phpdoc`.

1. Generera metrics för din kod `composer metrics`.



### Publicera {#publicera}

1. Committa alla filer och lägg till en tagg 6.0.0. Om du gör uppdateringar så ökar du taggen till 6.0.1, 6.0.2, 6.1.0 eller liknande.

1. Kör `dbwebb test kmom06` för att kolla att du inte har några fel.

1. Pusha upp repot till GitHub, inklusive taggarna.

1. Verifiera att Scrutinizer är uppdaterad med senaste versionen av din kod.

1. Gör en `dbwebb publishpure report` och kontrollera att att det fungerar på studentservern.



Tips från coachen {#tips}
-----------------------

Lycka till och hojta till i chatt och forum om du behöver hjälp!
