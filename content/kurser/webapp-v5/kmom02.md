---
author:
  - mos
  - efo
revision:
  "2023-03-01": (E, efo) Gjorde om för webapp-v5.
  "2018-01-30": (D, efo) Gjorde om för webapp-v3.
  "2017-03-09": (C, efo) Gjorde om för webapp-v2.
  "2016-02-08": (B, mos) Lade till extrauppgift om detect-swipe-event.
  "2015-10-26": (A, mos) Första utgåvan för kursen.
...
Kmom02: En router
==================================

Vi tar en titt på vilka begränsningar och utmaningar man står inför som användare av en mobil enhet. Vi bryter ut CSS koden från kmom01 till ett GUI komponentbaserad ramverk och lägger till fler GUI komponenter till vårt ramverk.

Vi fortsätter med vår applikation från kmom01 och tittar på hur vi kan använda en router för att visa upp olika sidor utan att ladda om sidan.

Innan vi gör detta tittar vi på ett verktyg som hjälper oss att söka och visa information i JSON-filer.

Det kan se ut så här när vi har gjort klart Lager appen del 2.



<!--more-->



Nedan finns en liten video som visar hur det kan se ut när man är klar med Lager appen del 2.

[YOUTUBE src=QAvD-vRgSaU width=630 caption="Lager appen del 2."]



<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Läsanvisningar  {#lasanvisningar}
---------------------------------

*(ca: 6-10 studietimmar)*



### Artiklar {#artiklar}

Läs följande artiklar för att få bakgrunden till övningarna.

1. Titta igenom [jsonapi.org](http://jsonapi.org/format/) för att få en uppfattning om vad ett JSON-API är. Speciellt specification, recommendation, examples och FAQ är relevanta.

1. Till mobil operativsystemen [iOS](https://developer.apple.com/design/) och [Android](https://developer.android.com/design/) ger Apple respektive Google ut guidelines för hur man ska designa på de två plattformarna. Detta är ett viktigt verktyg inte minst när vi designar med hjälp av HTML och CSS istället för de inbyggda native elementen. Skumma igenom de två guides och spara de som bokmärken.



### Video {#video}

1. Det finns en [videoserie](https://www.youtube.com/playlist?list=PLKtP9l5q3ce_CbhJOudHjxkjYofM98kvh) kopplat till kursen, titta på videos som börjar på 2.

1. Videospellistan [Introduktion till SASS](https://www.youtube.com/playlist?list=PLKtP9l5q3ce8HZ5mbVhoKM_R1DmlX1iH1) ger en kort introduktion till funktioner i SASS.



### Lästips {#lastips}

* Kika igenom [webbplatsen om applikationen jq](https://stedolan.github.io/jq/) som hjälper dig söka och visualisera innehållet i en JSON fil.



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 6-10 studietimmar)*



### Övningar {#ovningar}

Gör följande övningar för att träna inför uppgifterna.

1.  Installera och testa verktyget jq via artikeln "[Installera verktyget jq för att söka i JSON-filer](kunskap/installera-verktyget-jq-for-att-soka-i-json-filer)".

1. Läs igenom artikeln och installera "[Utvecklingsverktyg för REST tjänster](kunskap/utvecklingsverktyg-for-restful-tjanster)".

1. Gör övningen "[Knappar för mobilen](kunskap/knappar-for-mobilen)". Spara eventuella testfiler i `me/kmom02/buttons`.

1. Gör övningen "[En router i JavaScript](kunskap/en-router-i-javascript)". Spara med fördel koden i `me/lager`.



### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[Sökverktyg för JSON filer](uppgift/sokverktyg-for-json-filer)". Spara resultatet i `me/kmom02/jq`.

1. Gör uppgiften "[Lager appen del 2](uppgift/lager-appen-del-2)". Spara resultatet i `me/lager`.



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

* Vilka fördelar ser du med verktyg som Postman och jq?
* Fick du till en bra struktur i din CSS/SASS kod?
* Vilka fördelar ser du med att kombinera _web components_ med en router i JavaScript?
* Vilka insikter fick du när du skummade igenom Apples och Androids design guidelines?
* Valda du flat design eller ej för dina knappar? Varför?
* Vilken är din TIL för detta kmom?
