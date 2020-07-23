---
author:
  - mos
  - efo
revision:
  "2018-01-30": (C, efo) Första utgåvan för webapp-v3.
  "2017-03-13": (B, efo) Första utgåvan för webapp-v2.
  "2015-11-23": (A, mos) Första utgåvan för kursen.
...
Kmom03: Formulär och CRUD
==================================
I detta kursmoment fortsätter vi med att utveckla våra GUI komponenter från tidigare kursmoment. Vi skapar lättanvända formulärfält med hjälp av HTML5 och kopplar ihop fälten i formulär som är lätta att använda på små skärmar där kontext och möjligheten att skriva snabbt och enkelt saknas.

I vår applikation lägger vi till möjligheten att skapa, uppdatera och ta bort data via formulär. Vi har i tidigare kursmoment arbetat enbart med vanilla JavaScript, men ska i detta kursmoment titta på hur vi kan använda oss av JavaScript ramverket mithril för att underlätta hämtning av data, rendering av HTML-element och de olika vyer.

<!--more-->

Så här kan det se ut när vi är klara.

[YOUTUBE src=iewE2qHR5FM width=630 caption="Lager3 i kursmoment 3."]



<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Läsanvisningar  {#lasanvisningar}
---------------------------------

*(ca: 6-10 studietimmar)*


###Kurslitteratur  {#kurslitteratur}

Läs följande:

1. [Mobile HTML5](kunskap/boken-mobile-html5).
    * Ch 4: HTML5 Web Forms



###Artiklar {#artiklar}

<!-- 1. Läs "[What the heck is shadow DOM](https://glazkov.com/2011/01/14/what-the-heck-is-shadow-dom/)".

1. Läs om vilka "[use case som finns för shadow DOM](https://www.w3.org/2008/webapps/wiki/Component_Model_Use_Cases)".

1. Skumma igenom "[Googles artikel shadow DOM-v1](https://developers.google.com/web/fundamentals/getting-started/primers/shadowdom?hl=en)". -->

1. Bekanta dig med dokumentationen för JavaScript ramverket [mithril](http://mithril.js.org/api.html). Genomgången av en enkel app i en [tutorial](http://mithril.js.org/simple-application.html) är ytterst relevant för det vi gör i detta kursmoment.



###Video  {#video}

I nedanstående videoserie använder Emil sig av mithril versionen `mithril@2.0.0-rc.4`. Det var en såkallad [_release candidate_](https://en.wikipedia.org/wiki/Software_release_life_cycle#Release_candidate) av mithril 2.0.0. Senaste versionen av mithril är nu mithril 2.0.4 och vi kan installera med kommandot `npm install mithril --save`. Den stora ändringen från _release candidate_ som användes 2019 är hur man skapar länkar. I videon '[305b Länkar i mithril 2.0.4](https://youtu.be/rMWngW5IgaY)' visar Emil hur man skapar länkar i mithril 2.0.4.

1. Det finns en [videoserie](https://www.youtube.com/playlist?list=PLKtP9l5q3ce-1cVPTFJ_Zw9b7N2Y4_ANI) kopplat till kursen, titta på videos som börjar på 3.

I spellistan finns 6 stycken videos som börjar med 'Extra: 30*' dessa är från en tidigare version av mithril (1.1.6) som användes i kursen 2018. De videos är till 90% fortfarande relevanta och vill man förkovra sig i ytterligare ett mithril exempel kan de vara sevärda.



###Lästips {#lastips}

<!-- * Bekanta dig med [mithril Components](http://mithril.js.org/components.html), som hjälper dig att skapa återanvändbar kod.

* Hur ser det egentligen ut med JavaScript ramverk 2018. Stack Overflow har publicerad statistik angående ramverk i artikeln [The Brutal Lifecycle of JavaScript Frameworks](https://stackoverflow.blog/2018/01/11/brutal-lifecycle-javascript-frameworks/).-->

* I forumet finns en tråd om val av JavaScript ramverk och vad man kan tänka på [Hur tänka inför val av JavaScript ramverk?](forum/viewtopic.php?f=11&t=7195).



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 6-10 studietimmar)*



###Övningar {#ovningar}

Gör följande övningar för att träna inför uppgifterna.

1. Gör övningen "[Kom igång med ramverket Mithril](kunskap/kom-igang-med-mithril-v2)". Spara eventuella testfiler i `me/kmom03/nobel`.

1. Läs igenom artikeln och gör övningarna i "[Ett mobilanpassad formulär](kunskap/ett-mobilanpassad-formular)". Spara eventuella testfiler i `me/kmom03/formular`.


<!-- 1. Läs igenom artikeln "[Virtuella noder](kunskap/virtuella-noder)".

1. Läs igenom artikeln och gör övningarna i "[Modeller och request i mithril](kunskap/mithril-modeller-och-request)". -->

<!-- 1. Läs igenom artikeln och gör övningarna i "[Mobil webapp och RESTful server](kunskap/mobil-webapp-och-restful-server)". Spara de övningar du gör i mappen `me/kmom03/ajax`.

1. Läs igenom artikeln "[Ett enkelt grid för alla våra enheter](kunskap/ett-enkelt-grid-for-alla-vara-enheter)".

1. Läs igenom artikeln "[En kalender med mithril components](kunskap/en-kalender-med-mithril-components)".

-->



###Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[Lager appen del 3](uppgift/lager-appen-del-3)". Spara resultatet i `me/kmom03/lager3`.

<!-- 1. Lägg till en Splash screen och en ikon till din meapp. -->



###Extra {#extra}

Det finns ingen extrauppgift.



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

* Vilka faktorer spelar in när du ska designa ett formulär för mobila enheter?
* Hur känns övergången från vanilla JavaScript till ett JavaScript ramverk?
* Gjorde du extrauppgifterna i lager appen? Berätta isåfall om det arbetet.
* Vilken är din TIL för detta kmom?
