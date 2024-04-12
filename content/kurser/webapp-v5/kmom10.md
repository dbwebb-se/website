---
author:
    - efo
revision:
    "2024-04-12": (B, efo) Enda projekt från och med VT24.
    "2021-02-12": (A, efo) Första versionen av trafik projektet.
...
Kmom10: Projekt och examination
==================================

[FIGURE src=image/webapp/v4/kajt.jpg?w=c5 class="right"]

Detta projekt utvecklas i samarbete med Branschprogrammet Kapacitet i järnvägstrafiken – [KAJT](https://kajt.org/). Projektet baseras på öppen data från Trafikverket och handlar om att visualisera förseningar i tågtrafiken

Detta kursmoment avslutar och examinerar kursen.

Upplägget är enligt följande:

* Projektet och redovisning (20-80h)

Totalt omfattar kursmomentet (07/10) ca 20+20+20+20 studietimmar.



Bedömning och betygsättning {#bedomning}
--------------------------------------------------------------------

När du lämnat in projektet bedöms det tillsammans med dina tidigare redovisade kursmoment och du får ett slutbetyg på kursen. Läs om [grunderna för bedömning och betygsättning](kurser/bedomning-och-betygsattning).



Projektspecifikation {#projspec}
--------------------------------------------------------------------

Utveckla och leverera projektet enligt följande specifikation. Saknas information så kan du själv välja väg, dokumentera dina val i redovisningstexten.

De två första kraven är obligatoriska och de fyra sista kraven är optionella krav. De två obligatoriska kraven måste lösas tillsammans med **ett (1) valfritt optionellt krav** för att få godkänt på uppgiften. Lös valfritt antal av de resterande optionella krav för att samla poäng och därmed nå högre betyg.

Varje krav ger maximalt 10 poäng, totalt är det 60 poäng.



### Kataloger för redovisning {#var}

Samla alla dina filer för projektet i ditt kursrepo under `me/kmom10/proj`.



### Datakällor {data}

[Trafikverkets API](https://api.trafikinfo.trafikverket.se/) innehållar data om tåg- och vägtrafik i Sverige. API:t följer en lite annan standard än vad vi är vana vid från tidigare i kursen. Därför finns ett API-proxy [trafik.emilfolino.se](https://trafik.emilfolino.se/) som hanterar och cacher tågtrafik data från Trafikverkets API.

Dokumentationen för [trafik.emilfolino.se](https://trafik.emilfolino.se/) visar upp att det finns ett antal olika endpoints:

```
GET /stations - Alla stationer i Sverige
GET /messages - Meddelanden för tågtrafiken i Sverige
GET /codes - Beskrivningar av koder som återfinns under messages
GET /delayed - Försenade tåg i Sverige kommande 14 timmarna
```

Dessutom finns real-tids data för försenade tågs positioner som en del av API:t.



### Krav 1: Specifikation och arkitektur {#k1}

Din app ska visa upp förseningar i tågtrafiken i Sverige. I [trafik API:t](https://trafik.emilfolino.se/) finns information om försenade tåg under endpointen `/delayed` med [dokumentation](https://trafik.emilfolino.se/#delayed). Platsinformation för de olika stationerna finns under endpointen `/stations`.

De två datasätten kan kopplas ihop med hjälp av `LocationSignature` från `/stations` och `/delayed`.

Din webapp ska baseras på de tekniker vi har använt under kursens gång.

__Arkitektur__: Beskriv i ett textstycke, som en del av din inlämning, vilka val av teknik du har gjort för din app. Berätta hur du har organiserad din kod så att en kollega snabbt kan sätta sig in i din app.

Bygg sedan en så gott som felfri webapp, i enlighet med din spec.

Fick du göra prioriteringar under arbetets gång eller nådde du din fulla ambitionsnivå med din webapp? Berätta.

Kritisera din webapp och framhäv dess brister.

Berätta om någon av de möjligheter som finns för att förbättra din lösning. Tänk att det finns begränsade resurser av tid, så förhåll dig till det och ta bara de möjligheter som kan utföras med begränsad insats av tid och/eller extra kunskap.



### Krav 2: Karta och GPS {#k2}

Använd positionsdata som finns för stationerna för att visa upp förseningar i tågtrafiken på en karta med hjälp av de tekniker vi använde i kursmoment 5. Använd Web API:t GeoLocation för att visa upp användarens position på kartan.

Rita ut förseningarna som markers på den station där det försenade tåget är enligt `LocationSignature`. Skriv ut stationens namn och hur mycket tåget är försenat i markerns popup. Förseningen beräknas som skillnaden mellan `EstimatedTimeAtLocation` och `AdvertisedTimeAtLocation`.



### Krav 3: Native design (optionellt) {#k3}

Välj ut en befintlig app på den plattform du utvecklar mot. Den valda appen ska ha ungefär samma typ av vyer som din app har. Försök att så gott det går matcha designen på din app pixel-för-pixel med den befintliga appen.

Beskriv i ett textstycke om 15-20 meningar designprocessen att efterlikna en befintlig app och vilka verktyg och tekniker du använde. Bifoga tre (3) relevanta skärmdumpar av den befintliga appen.



### Krav 4: Autentisering av användaren (optionellt) {#k4}

Utnyttja autentiseringstjänsten [auth.emilfolino.se](https://auth.emilfolino.se) för att ge möjlighet för att användare av din app kan autentisera sig med hjälp JSON Web Tokens. En autentiserad användare ska sedan få tillgång till att spara ner favorit stationer och en vy ska skapas där man lätt och överskådligt får en överblick om tåg är försenade till den inloggade användarens favoriter.



### Krav 5: Utnyttja tiden läge (optionellt) {#k5}

Skapa möjlighet för att användare av appen kan utnyttja förseningen av tåget till att se sig omkring. Använd tiden som tåget är försenad och rita sedan ut ett område på kartan där man hinner gå till och tillbaka till tåget innan det åker. Du kan räkna med att man kan gå 100m i minuten. Beräkna även in en marginal för att inte missa tåget.

Beskriv ditt tillvägagångssätt i din redovisningstext. Om du även gör krav 6 beskriv vilken station du utgår från när du beräknar vart användaren kan gå.



### Krav 6: Realtidsdata (optionellt) {#k6}

Istället för att visa upp statisk data enligt Krav 2 använder du real-tids data enligt [dokumentationen](https://trafik.emilfolino.se/#live) och de lärdomar du gjorde dig i kmom06. Poäng ges för både krav 2 och krav 6 om du gör detta kravet. Se till att skapa en resurs effektiv lösning på problemställningen och beskriv i redovisningstexten hur du gick tillväga.




Redovisning {#redovisning}
--------------------------------------------------------------------

I Canvas skriv följande:

1. För varje krav du implementerat skriver du ett textstycke som uppfyller kravet. Poängsättningen tar sin start i din text så se till att skriva väl för att undvika poängavdrag. Missar du att skriva/dokumentera din lösning så blir det 0 poäng. Du kan inte komplettera en inlämning för att få högre betyg. Underlätta för lärarna som rättar genom att ha en rubrik för varje krav du gör.

1. Skriv ett allmänt stycke om hur projektet gick att genomföra. Problem/lösningar/strul/enkelt/svårt/snabbt/lång tid, etc. Var projektet lätt eller svårt? Tog det lång tid? Vad var svårt och vad gick lätt? Var det ett bra och rimligt projekt för denna kursen?

1. Avsluta med ett sista stycke med dina tankar om kursen och vad du anser om materialet och handledningen (ca 5-10 meningar). Ge feedback till lärarna och förslå eventuella förbättringsförslag till kommande kurstillfällen. Är du nöjd/missnöjd? Kommer du att rekommendera kursen till dina vänner/kollegor? På en skala 1-10, vilket betyg ger du kursen?



### Presentation {#presentation}

Spela in en kort video där du visar kod och berättar om de tekniska implementationerna du gjorde i den individuella examinationen. Lägg till en länk till videon i redovisningstexten på inlämningen på Canvas.



[INFO]
Se till att göra en `dbwebb update` innan `dbwebb publish me` så du får senaste versionen av kursrepot och konfiguration för kursrepot.
[/INFO]

```bash
# Ställ dig i kursrepot
dbwebb update
dbwebb publish me
```
