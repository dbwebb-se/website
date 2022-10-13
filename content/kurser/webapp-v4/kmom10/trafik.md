---
author:
    - efo
revision:
    "2021-02-12": (A, efo) Första versionen av trafik projektet.
...
Kmom10: Tågtrafik upplägget
==================================

[FIGURE src=image/webapp/v4/kajt.jpg?w=c5 class="right"]

Detta projekt utvecklades i samarbete med Branschprogrammet Kapacitet i järnvägstrafiken – [KAJT](https://kajt.org/). Projektet baseras på öppen data från Trafikverket och handlar om att visualisera förseningar i tågtrafiken.



Projektspecifikation {#projspec}
--------------------------------------------------------------------

Utveckla och leverera projektet enligt följande specifikationen. Saknas information så kan du själv välja väg, dokumentera dina val i redovisningstexten.

De två första kraven är obligatoriska och de fyra sista kraven är optionella krav. De två obligatoriska kraven måste lösas tillsammans med ett (1) valfritt optionellt krav för att få godkänt på uppgiften. Lös valfritt antal av de resterande optionella krav för att samla poäng och därmed nå högre betyg.

Varje krav ger maximalt 10 poäng, totalt är det 60 poäng.

Detta projektet har i grunden förbestämda datakällor från Trafikverkets API. Data från API:t behandlas av ett [API-proxy](https://trafik.emilfolino.se/) för att förenkla gränssnittet mot API:t.



### Kataloger för redovisning {#var}

Samla alla dina filer för projektet i ditt kursrepo under `me/kmom10/proj`.

Skapa ditt Expo projekt med följande kommando:

```bash
# stå i me/kmom10/proj
expo init .
```

Redovisningstexten skriver du som en del av din inlämning på Canvas.



### Datakällor {data}

[Trafikverkets API](https://api.trafikinfo.trafikverket.se/) innehållar data om tåg- och vägtrafik i Sverige. API:t följer en lite annan standard än vad vi är vana vid från tidigare i kursen. Därför finns ett API-proxy [trafik.emilfolino.se](https://trafik.emilfolino.se/) som hanterar och cacher tågtrafik data från Trafikverkets API.

Dokumentationen för [trafik.emilfolino.se](https://trafik.emilfolino.se/) visar upp att det finns ett antal olika endpoints:

```
GET /stations - Alla stationer i Sverige
GET /messages - Meddelanden för tågtrafiken i Sverige
GET /codes - Beskrivningar av koder som återfinns under messages
GET /delayed - Försenade tåg i Sverige kommande 14 timmarna
```



### Krav 1: Specifikation och arkitektur {#k1}

Din app ska visa upp förseningar i tågtrafiken i Sverige. I [trafik API:t](https://trafik.emilfolino.se/) finns information om förseningar under endpointen `/delayed` med [dokumentation](https://trafik.emilfolino.se/#delayed). Platsinformation för de olika stationerna finns under endpointen `/stations`.

De två datasätten kan kopplas ihop med hjälp `LocationSignature` från `/stations` och `FromLocation[].LocationName` i `/delayed`.

Din app ska använda de teknologier vi har använt hittils i kursen.

__Arkitektur__: Beskriv i ett textstycke, som en del av din inlämning, vilka val av teknik du har gjort för din app. Berätta hur du har organiserad din kod så att en kollega snabbt kan sätta sig in i din app.

Bygg sedan en så gott som felfri webapp, i enlighet med din spec.

Fick du göra prioriteringar under arbetets gång eller nådde du din fulla ambitionsnivå med din webapp? Berätta.

Kritisera din webapp och framhäv dess brister.

Berätta om någon av de möjligheter som finns för att förbättra din lösning. Tänk att det finns begränsade resurser av tid, så förhåll dig till det och ta bara de möjligheter som kan utföras med begränsad insats av tid och/eller extra kunskap.



### Krav 2: Karta och GPS {#k2}

Använd positionsdata som finns för stationerna för att visa upp förseningar i tågtrafiken på en karta med hjälp av de tekniker vi använde i kursmoment 5. Använd Expo Location för att visa upp användarens position på kartan.

Rita ut förseningarna som markers på den station där förseningen är `FromLocation`. Skriv ut stationens namn och förseningen i markerns popup.



### Krav 3: Native design (optionellt) {#k3}

Välj ut en befintlig app på den plattform du utvecklar mot. Den valda appen ska ha ungefär samma typ av vyer som din app har. Försök att så gott det går matcha designen på din app pixel-för-pixel med den befintliga appen.

Beskriv i ett textstycke om 15-20 meningar designprocessen att efterlikna en befintlig app och vilka verktyg och tekniker du använde. Bifoga tre (3) relevanta skärmdumpar av den befintliga appen.



### Krav 4: Autentisering av användaren (optionellt) {#k4}

Utnyttja autentiseringstjänsten [auth.emilfolino.se](https://auth.emilfolino.se) för att ge möjlighet för att användare av din app kan autentisera sig med hjälp JSON Web Tokens. En autentiserad användare ska sedan få tillgång till att spara ner favorit stationer och en vy ska skapas där man lätt och överskådligt får en överblick om tåg är försenade till den inloggade användarens favoriter.

Beskriv i redovisningstexten om du stötte på några problem när du implementerade autentisering.



### Krav 5: Utnyttja tiden läge (optionellt) {#k5}

Skapa möjlighet för att användare av appen kan utnyttja förseningen av tåget till att se sig omkring. Använd tiden som tåget är försenad och rita sedan ut ett område på kartan där man hinner gå till och tillbaka till tåget innan det åker. Du kan räkna med att man kan gå 100m i minuten. Beräkna även in en marginal för att inte missa tåget.

Beskriv ditt tillvägagångssätt i din redovisningstext.



### Krav 6: Test (optionellt) {#k6}

Använd dina kunskaper om test från kursmoment 6. Skriv fem (5) stycken use-cases för din applikation och testa sedan dessa med hjälp av Jest och React Native Testing Library. Se till att kommandot `npm test` fungerar och att testerna går igenom.

Lämna in dina 5 use-cases som en del av din redovisningstext i Canvas.
