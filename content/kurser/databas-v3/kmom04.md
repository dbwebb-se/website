---
views:
    flash:
        region: flash
        template: default/image
        data:
            src: "image/kunskap/kokbok-databasmodellering/image00.jpg?w=1100&h=300&cf&a=20,0,0,0&f=grayscale"
author: mos
revision:
    "2022-01-18": "(F, mos) Genomgången och uppdaterad inför version 2 och vt2022."
    "2021-02-10": "(E, mos) Lade till inspelade föreläsningar."
    "2019-02-13": "(D, mos) Lade till läsanvisning om EJS."
    "2019-02-08": "(C, mos) Uppdaterat inför vt19."
    "2018-12-19": "(B, mos) Uppdaterat läsanvisning utgåva 2 av kursbok."
    "2018-01-09": "(A, mos) Första utgåvan."
...
Kmom04: Transaktioner
====================================

Vi sluför ER-modellen med fokus på logisk och fysisk modellering. Vi skapar SQL-kod som kan skapa databasens schema.

Vi tittar på hur transaktioner i en databas fungerar och vi tränar på SQL-kod för att hantera COMMIT och ROLLBACK i så kallade ACID transaktioner.

I kursmomentet blir vi också introducerade till en webbserver för Node.js i form av Express.js. Du kommer igång med Express och ser hur du kan bygga upp grunderna i en webbtjänst och hur du kan skriva din applikationskod för att komma åt en databas och visa rapporter från den och uppdatera databasens innehåll via webbplatsen.


<!--more-->

[FIGURE src=image/snapvt18/bank-header-footer.png?w=w3 caption="En bank i Express som kopplar sig till MySQL, redo för transaktioner."]

[FIGURE src=image/snapvt18/bank-terminal-move.png?w=w3 caption="Via terminalklienten kan du flytta pengar mellan två konton, i skydd av en transaktion."]

[FIGURE src=image/kunskap/kokbok-databasmodellering/image00.jpg?w=w3 caption="Vi översätter vår ER-modell till relationsmodellen och skapar SQL-kod."]

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Läs &amp; Studera  {#lasanvisningar}
---------------------------------

*(ca: 8-10 studietimmar)*



### Föreläsningar {#flas}

Titta på följande inspelade föreläsningar.

1. [Databasmodellering - Översätt till relationsmodellen](./../forelasning/oversatt-till-relationsmodellen) ger en översikt till hur du kan översätta en ER-modell från den konceptuella fasen till en databasmodell som matchar relationsmodellen i den logisk modelleringsfasen.

1. [Transaktioner i databaser - ACID](./../forelasning/transaktioner) ger en översikt till begreppet transaktioner i databasen och vad ACID innebär samt en liten utläggning om låsning, prestanda och tillförlitlighet i databasen.



### Databasteknik: Transaktioner {#databasteknik-trans}

Läs följande i kursboken:

1. [Databasteknik](kunskap/boken-databasteknik) om transaktioner.
    * Kap 24: Transaktioner

1. [Boken har även en webbplats](http://www.databasteknik.se/webbkursen/) och vissa utdrag från boken finns där. Relevant för detta kmom är följande:
    * [Transaktioner](http://www.databasteknik.se/webbkursen/transaktioner/index.html)

Det finns ytterligare ett kapitel i boken som är relaterat till transaktioner, det går utanför kursens ram men läs vid intresse.

1. [Databasteknik](kunskap/boken-databasteknik)
    * Kap 25: Hur transaktioner hanteras inuti databashanteraren



### Node.js och Express.js {#express}

Läs följande som är relaterat till att bygga en webbserver i Node.js med applikationsservern Express.js.

1. Läs översiktligt om vad [Express](http://expressjs.com/) klarar av som webb- och applikationsserver. Kolla runt i dokumentationen och bekanta dig med begrepp och exempelkod.

1. Bekanta dig snabbt med templatemotorn "[Embedded JavaScript templating (EJS)](https://ejs.co/)" som hjälper dig skapa dynamiska webbsidor.



### Databasteknik: ER-modellering {#databasteknik-er}

Läs följande i kursboken:

1. [Databasteknik](kunskap/boken-databasteknik)
    * Kap 5: Relationsmodellen
    * Kap 6: Översättning från ER-modellen till relationsmodellen

1. [Boken har även en webbplats](http://www.databasteknik.se/webbkursen/) och vissa utdrag från boken finns där. Relevant för detta kmom är följande:
    * [Översättning från ER-modellen till relationsmodellen](http://www.databasteknik.se/webbkursen/er2relationer/index.html)

Det finns ytterligare kapitel i boken som är relaterat till modellering. De går utanför kursens omfattning men läs vid intresse.

1. [Databasteknik](kunskap/boken-databasteknik)
    * Kap 3: Mer om datamodellering
    * Kap 12: Normalformer och normalisering



### ER-modellering {#ermodellering}

Följande är samma resurser som används i kmom03. Fortsätt läsa och repetera vid behov. Det ger dig stöd för uppgiften om ER-modellering.

1. Jobba igenom artikeln "[Kokbok för databasmodellering](kunskap/kokbok-for-databasmodellering)", den ger dig processen du skall följa. I detta kmom handlar det främst om att fokusera på logisk och fysisk modellering.



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 8-10 studietimmar)*



### Övningar {#ovningar}

Genomför följande övning för att förbereda inför uppgifterna.

1. Jobba igenom "[Transaktioner i databas](kunskap/transaktioner-i-databas)" för att lära dig grunderna i hur du använder transaktioner i databaser. Spara dina exempelprogram i `me/kmom04/trans`.

1. Jobba igenom artikeln "[Grunderna i Express med Node.js](kunskap/grunderna-i-express-med-nodejs)" för att komma igång med webb- och applikationsservern Express i Node.js. Spara dina exempelprogram i `me/kmom04/myexpress`.

1. Jobba igenom artikeln "[Koppla appservern Express till databasen MySQL](kunskap/koppla-appservern-express-till-databasen-mysql)" som visar hur du kan jobba med MySQL tillsammans med Express och Node.js. Spara dina exempelprogram i `me/kmom04/express-sql`.


<!--
1. Update transaktions (new article) with document on Isolation levels and Dirty reads and Deadlock. Eventuell klient för att testa låsning? https://docs.google.com/document/d/15k4XbQxNOpJp-sqxwWX-FmG8UyerGSF36YDerSelbBc/preview (nja, lite överkurs, bättre att förenkla kursen lite)

1. SQL injections (web)
-->



### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[Skapa ER-modell för en databas (logisk/fysisk)](uppgift/skapa-er-modell-for-en-databas-logisk-fysisk)". Detta är den avslutande delen av uppgiften. Spara allt du gör i `me/kmom04/er2`.

1. Gör uppgiften "[Flytta pengar med terminalprogram och med Express](uppgift/flytta-pengar-med-terminal-program-och-med-express)" för att jobba med flera klienter mot samma databas. Bygg vidare på din kod i `me/kmom04/express-sql`.



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Redovisningstexten skrivs alltid individuellt.

Se till att följande frågor besvaras i redovisningstexten.

* Hur gick det att förstå konceptet transaktioner i databas?
* Gick det bra att komma igång med Express.js, Node, EJS och MySQL?
* Lyckas du med god kodstruktur för terminal och webbklient, du såg att man kunde göra en enda funktion som löste flytten av pengar åt båda hållen?
* Gick det bra att sluföra uppgiften om ER modellering samt skapa SQL-kod för databasen?
* Hur känner du allmänt inför kursen så här långt?
* Vilken är din TIL för detta kmom?

<!-- Poängtera dbwebb test samt möjlighet att dubbelkolla att backupfilen fungerar. -->
