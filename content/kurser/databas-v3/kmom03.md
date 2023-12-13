---
views:
    flash:
        region: flash
        template: default/image
        data:
            src: "image/kunskap/kokbok-databasmodellering/image02.jpg?w=1100&h=300&cf&a=0,0,16,0&f=grayscale"
author: mos
revision:
    "2022-01-18": "(G, mos) Genomgången och uppdaterad inför version 2 och vt2022."
    "2021-01-31": "(F, mos) Lade till inspelade föreläsningar."
    "2020-02-07": "(E, mos) Uppdaterat från 20h till 40h."
    "2019-02-08": "(D, mos) Flyttade vissa läsanvisningar om ER modellering till kmom04."
    "2019-01-31": "(C, mos) Uppdaterat inför vt19."
    "2018-12-19": "(B, mos) Uppdaterat läsanvisning utgåva 2 av kursbok."
    "2018-01-05": "(A, mos) Första utgåvan."
...
Kmom03: ER-modellering
====================================

Vi jobbar vidare med SQL och tränar mer på utmanande saker som subqueries, JOIN och LEFT/RIGHT OUTER JOIN.

Vi bygger vidare på våra terminalskript i JavaScript och Node.js och bygger en menydriven klient som kan utföra olika saker mot databasen.

Vi övar i hur man modellerar och bygger upp en databas, det som kallas Entity-Relationship modelling, ER-modellering, eller bara databasmodellering. Vi delar in modelleringen i konceptuell, logisk och fysisk modellering. Vi börjar med att fokusera på den konceptuella delen av modelleringen.

<!--more-->

[FIGURE src=image/kunskap/kokbok-databasmodellering/image02.jpg?w=w3 caption="Databasmodellering av en filmdatabas."]

[FIGURE src=image/kunskap/kokbok-databasmodellering/image00.jpg?w=w3 caption="Databasmodellering fortsätter och närmar sig strukturen av tabeller."]

Vi bygger vidare på vårat terminalprogram och skapar en menydriven terminalklient.

[ASCIINEMA src=223879 caption="En menydriven terminalklient som visar hur man skapar en kommandoloop med JavaScript i Node.js."]

När vi är klara har vi även byggt en menydriven terminalklient som pratar med databasen.



<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **40 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Läs &amp; Studera  {#lasanvisningar}
---------------------------------

*(ca: 10-15 studietimmar)*



### Föreläsningar {#flas}

Titta på följande inspelade föreläsningar.

1. [Modellera databas - faser och steg](./../forelasning/modellera-databas) ger en översikt av modellering av databaser och visar olika faser och steg för att modellera databasen.

1. [ER-modellering - konceptuell modellering](./../forelasning/er-modellering) visar hur man kan rita en ER-modell via olika konstruktioner och introducerar en del begrepp om ER som underlättar ritandet.


<!--
* Lägg till guide om modellering.
    * https://dbwebb.se/guide/er-modellering-med-databaser
    * Lägg till videoserie om hur man modellerar vissa övningar
    * Osäker på hur detta förslag förhåller sig till deinspelningar som gjordes 2021, men det behövs några övningar som visar hur man tänker när man modellerar en databas, kanske räcker det att man spelar in några modelleringsövningar.
-->



### Databasteknik {#dbteknik}

Läs följande i kursboken:

1. [Databasteknik](kunskap/boken-databasteknik) repetera om avancerad SQL.
    * Kap 8: Mer om SQL: Aggregatfunktioner, null-värden, yttre join

1. [Databasteknik](kunskap/boken-databasteknik) om ER modellering.
    * Kap 2: ER-modellering
    * Kap 4: Designprocessen

1. [Boken har även en webbplats](http://www.databasteknik.se/webbkursen/) och vissa utdrag från boken finns där. Relevant för detta kmom är följande:
    * [ER-modellering i webbkursen](http://www.databasteknik.se/webbkursen/er/)



### JavaScript {#javascript}

Det finns inga specifika läsanvisningar för JavaScript. Men du kommer att fortsätta skriva program för JavaScript i Node.js tillsammans med async/await och callbacks.

Läs gärna vidare på egen hand, i "[Boken: JavaScript for impatient programmers](https://dbwebb.se/kunskap/boken-javascript-for-impatient-programmers)", i den mån du vill förkovra dig i JavaScript som programmeringsspråk.



### ER-modellering {#ermodellering}

Läs igenom följande artiklar.

1. Läs igenom igenom artikeln "[Kokbok för databasmodellering](kunskap/kokbok-for-databasmodellering)", den ger dig en metod för att modellera databaser i olika faser. Du kommer jobba enligt denna modellen i uppgiften. I detta kmom läser du först och främst delen om "Konceptuell modellering".



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 20-25 studietimmar)*



### Övningar {#ovningar}

Genomför följande för att förbereda inför uppgifter.

1. Jobba igenom artikeln "[Gör en kommandoradsklient i Node.js (v2)](kunskap/gor-en-kommandoradsklient-i-node-js-v2)". Spara alla filer du gör i `me/kmom03/cli`.

<!--
Modelleringsövningsuppgifter
https://docs.google.com/document/d/1kKoSO2BQL5T2cnzshpM_hnk5JbqT0_00khfGJKZQ2Fo/edit

Gjort modelleringsövning i sal med draw.io: https://goo.gl/vNRvKt
-->



### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[Node.js terminalprogram mot MySQL med kommandoloop](uppgift/nodejs-terminalprogram-mot-mysql-med-kommandoloop)". Spara alla filer i `me/kmom03/terminal2`.

1. Fortsätt jobba igenom nästa del av guiden "[Kom igång med SQL i MySQL](guide/kom-igang-med-sql-i-mysql-v2)". Spara filerna i katalogen `me/skolan` som din redovisning. Detta är sista delen av guiden som vi kommer jobba med.
    * [Delen: Koppla tabeller](guide/kom-igang-med-sql-i-mysql-v2/koppla-tabeller)

1. Gör uppgiften "[Skapa ER-modell för en databas (konceptuell)](uppgift/skapa-er-modell-for-en-databas-konceptuell)". Visa att du kan jobba enligt en metod för att skapa en databasmodell och redovisa i ett dokument. Detta är första delen av uppgiften som slutförs i kommande kursmoment. Spara allt du gör i `me/kmom03/er1`.

<!--
Förtydliga hur innehållsförteckningen kan se ut i dokumentet, skapa en mall som de kan följa.
-->



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Redovisningstexten skrivs alltid individuellt.

Se till att följande frågor besvaras i redovisningstexten.

* Några generella reflektioner på att skriva och jobba med menydrivna terminalprogram i JavaScript och Node.js?
* Berätta om din kodstruktur i ditt terminalprogram mot databasen, är du nöjd eller ser du förbättringspotential?
* Något att nämna kring det aktuella stycket i guiden skolan med till exempel outer joins och subqueries?
* Hur gick det att jobba med ER-modelleringen, några reflektioner?
* Fanns det några extra svårigheter/utmaningar du kämpade med i kursmomentet?
* Vilken är din TIL för detta kmom?

<!-- Poängtera dbwebb test samt möjlighet att dubbelkolla att backupfilen fungerar. -->