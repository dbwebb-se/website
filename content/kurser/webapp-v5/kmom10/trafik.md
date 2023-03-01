---
author:
    - efo
revision:
    "2021-02-12": (A, efo) Första versionen av trafik projektet.
...
Kmom10: Tågtrafik upplägget
==================================

Detta projektet har i grunden förbestämda datakällor från Trafikverkets API. Data från API:t behandlas av ett [API-proxy](https://trafik.emilfolino.se/) för att förenkla gränssnittet mot API:t.


Projektspecifikation {#projspec}
--------------------------------------------------------------------

Utveckla och leverera projektet enligt följande specifikationen. Saknas information så kan du själv välja väg, dokumentera dina val i redovisningstexten.

De två första kraven är obligatoriska och de fyra sista kraven är optionella krav. De två obligatoriska kraven måste lösas tillsammans med ett (1) valfritt optionellt krav för att få godkänt på uppgiften. Lös valfritt antal av de resterande optionella krav för att samla poäng och därmed nå högre betyg.

Varje krav ger maximalt 10 poäng, totalt är det 60 poäng.



### Kataloger för redovisning {#var}

Samla alla dina filer för projektet i ditt kursrepo under `me/kmom10/proj`.

Skapa ditt Cordova projekt med följande kommando:

```bash
# stå i me/kmom10/proj
cordova create . se.dbwebb.trafik Trafik
```

Redovisningstexten skriver du i `me/redovisa`.



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

Din app ska använda följande teknologier:

* Mithril eller vanilla JavaScript
* Cordova
* Stödja Android eller iOS samt webbläsare
* Innehålla en egen ikon och splashscreen


__Arkitektur__: Beskriv i ett textstycke, som en del av din inlämning, vilka val av teknik du har gjort för din app. Berätta hur du har organiserad din kod så att en kollega snabbt kan sätta sig in i din app.

Bygg sedan en så gott som felfri webapp, i enlighet med din spec.

Fick du göra prioriteringar under arbetets gång eller nådde du din fulla ambitionsnivå med din webapp? Berätta.

Kritisera din webapp och framhäv dess brister.

Berätta om någon av de möjligheter som finns för att förbättra din lösning. Tänk att det finns begränsade resurser av tid, så förhåll dig till det och ta bara de möjligheter som kan utföras med begränsad insats av tid och/eller extra kunskap.



### Krav 2: Karta och GPS {#k2}

Använd positionsdata som finns för stationerna för att visa upp förseningar i tågtrafiken på en karta med hjälp av de tekniker vi använde i kursmoment 6. Använd Cordova pluginen [cordova-plugin-geolocation](https://cordova.apache.org/docs/en/latest/reference/cordova-plugin-geolocation) för att visa upp användarens position på kartan.

Rita ut förseningarna som markers på den station där förseningen är `FromLocation`. Skriv ut stationens namn och förseningen i markerns popup.



### Krav 3: Native design (optionellt) {#k3}

Välj ut en befintlig app på den plattform du utvecklar mot. Den valda appen ska ha ungefär samma typ av vyer som din app har. Försök att så gott det går matcha designen på din app pixel-för-pixel med den befintliga appen.

Beskriv i ett textstycke om 15-20 meningar designprocessen att efterlikna en befintlig app och vilka verktyg och tekniker du använde. Bifoga tre (3) relevanta skärmdumpar av den befintliga appen.



### Krav 4: Autentisering av användaren (optionellt) {#k4}

Utnyttja autentiseringstjänsten [auth.emilfolino.se](https://auth.emilfolino.se) för att ge möjlighet för att användare av din app kan autentisera sig med hjälp JSON Web Tokens. En autentiserad användare ska sedan få tillgång till att spara ner favorit stationer och en vy ska skapas där man lätt och överskådligt får en överblick om tåg är försenade till den inloggade användarens favoriter.



### Krav 5: Offline-läge (optionellt) {#k5}

Använd dina kunskaper om Cordova plugins från kursmoment 5 & 6 och pluginen [cordova-plugin-file](https://cordova.apache.org/docs/en/latest/reference/cordova-plugin-file/index.html) för att cacha datan från dina valda datakällor så appen kan användas utan internetuppkoppling.

När du ansluter till ett api och hämtar data ska du spara den till en fil som du hämtar datan ifrån om det inte finns någon internetuppkoppling. Cordova pluginen [cordova-plugin-network-information](https://cordova.apache.org/docs/en/latest/reference/cordova-plugin-network-information/) kan användas för att kolla status om internetuppkoppling

Övningen [Filer i Cordova](kunskap/filer-i-cordova) och exempel programmet `example/file` ([repo](https://github.com/dbwebb-se/webapp/tree/master/example/file)) hjälper en bit på vägen.



### Krav 6: Heatmap (optionellt) {#k6}

Använd en av [heatmap-modulerna](https://leafletjs.com/plugins.html#heatmaps) från leaflet's dokumentation för att rita ut en heatmap över tåg förseningarna i Sverige. Beskriv i texten om detta krav vilken modul du valde och varför. En viktig egenskap som (webb)programmerare är att kunna värdera olika moduler och vilken som är lämpligast att använda i ditt specifika fall.



Redovisning {#redovisning}
--------------------------------------------------------------------

1. På din [redovisningssida](./../redovisa), skriv följande:

    1. För varje krav du implementerat skriver du ett textstycke som uppfyller kravet. Poängsättningen tar sin start i din text så se till att skriva väl för att undvika poängavdrag. Missar du att skriva/dokumentera din lösning så blir det 0 poäng. Du kan inte komplettera en inlämning för att få högre betyg.

    1. Skriv ett allmänt stycke om hur projektet gick att genomföra. Problem/lösningar/strul/enkelt/svårt/snabbt/lång tid, etc. Var projektet lätt eller svårt? Tog det lång tid? Vad var svårt och vad gick lätt? Var det ett bra och rimligt projekt för denna kursen?

    1. Avsluta med ett sista stycke med dina tankar om kursen och vad du anser om materialet och handledningen (ca 5-10 meningar). Ge feedback till lärarna och förslå eventuella förbättringsförslag till kommande kurstillfällen. Är du nöjd/missnöjd? Kommer du att rekommendera kursen till dina vänner/kollegor? På en skala 1-10, vilket betyg ger du kursen?

2. Ta en kopia av texten på din redovisningssida och kopiera in den på Canvas. Glöm inte länka till din me-sida och projektet.

3. Se till att samtliga kursmoment validerar.

På grund av Corona ska alla spela in en redovisningsvideo som ska lämnas in tillsammans med redovisningstexten.

1. Spela in en kort video där du visar kod och berättar om de tekniska implementationerna du gjorde i den individuella examinationen. Lägg till en länk till videon i redovisningstexten på inlämningen på Canvas.

2. Visa ditt ansikte och en giltig ID handling, t.ex. körkot eller pass, i videon.

[INFO]
Se till att göra en `dbwebb update` innan `dbwebb publish me` så du får senaste versionen av kursrepot och konfiguration för kursrepot.
[/INFO]

```bash
# Ställ dig i kursrepot
dbwebb publish me
```
