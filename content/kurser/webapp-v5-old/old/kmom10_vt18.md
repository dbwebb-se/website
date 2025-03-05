---
author:
    - aar
    - efo
    - mos
revision:
    "2019-02-11": (prel, efo) Inför 2019 LP4.
    "2018-03-02": (C, efo) Första versionen till webapp-v3.
    "2017-05-05": (B, aar,efo) Första versionen till webapp-v2.
    "2015-12-22": (A, mos) Första versionen till webapp.
...
Kmom10: Projekt och examination
==================================

[WARNING]

** Kursutveckling pågår till kurs webapp **

Kursstart våren 2019 LP4.

[/WARNING]



Detta kursmoment avslutar och examinerar kursen.

Upplägget är enligt följande:

* Projektet och redovisning (20-80h)

Totalt omfattar kursmomentet (07/10) ca 20+20+20+20 studietimmar.

[INFO]
Uppdatera gärna kursrepot genom kommandot `dbwebb update` för att få senaste versionen av exempelkod och konfiguration.
[/INFO]



Projektidé och upplägg {#upplagg}
--------------------------------------------------------------------

Du är en engagerad student och funderar på hur du kan nå ut och bidra till en förändring av omvärlden och säkra framtiden. Du känner en pulserande ådra av entreprenörsskap i dig. Du bestämmer dig för att "bygga en webapp" som bidrar till förändring.

Det finns en årlig tävling, ["Hack for Sweden"](http://hackforsweden.se/), där öppen data används för att bygga appar som fokuserar på nytänkande och innovation. I detta projekt kan du använda [en eller flera datakällor som publiceras via tävlingen](https://oppnadata.se) som källa till din webapp. Vi ser självklart fram emot att du deltar i tävlingen Hack for Sweden med din app.

Du funderar och väljer en ansats för din webapp.

Fråga i forumet om du känner dig osäker.



Bedömning och betygsättning {#bedomning}
--------------------------------------------------------------------

När du lämnat in projektet bedöms det tillsammans med dina tidigare redovisade kursmoment och du får ett slutbetyg på kursen. Läs om [grunderna för bedömning och betygsättning](kurser/bedomning-och-betygsattning).



Projektspecifikation {#projspec}
--------------------------------------------------------------------

Utveckla och leverera projektet enligt följande specifikationen. Saknas information så kan du själv välja väg, dokumentera dina val i redovisningstexten.

De tre första kraven är obligatoriska och måste lösas för att få godkänt på uppgiften. De tre sista kraven är optionella krav. Lös de optionella kraven för att samla poäng och därmed nå högre betyg.

Varje krav ger max 10 poäng, totalt är det 60 poäng.

[INFO]
Tänker du på att göra några av de optionella kraven läs igenom alla kraven innan du väljer API:er då de optionella kraven kan påverka val av API.
[/INFO]



###Kataloger för redovisning {#var}

Samla alla dina filer för projektet i ditt kursrepo under `me/kmom10/proj`.

Skapa ditt cordova projekt med följande kommando:

```bash
# stå i me/kmom10/proj
cordova create . se.dbwebb.<valfritt namn> <Valfritt namn>
```

Redovisningstexten skriver du i `me/redovisa`.



### Krav 1: Specifikation och datakällor {#k1}
Skapa en egen kortfattad specifikation för din webapp genom att beskriva din tänkta webapp i ett textstycke.

Välj ut de datakällor du skall använda och vilken data du behöver ur varje datakälla. Berätta om ditt val.

Du ska använda minst två API:er. API:erna måste inte vara från Hack for Sweden, det är enbart ett tips.



### Krav 2: Arkitektur, dokumentation och manual {#k2}
Beskriv arkitekturen för din lösning. Berätta varför du valde som du gjorde.

Berätta hur du organiserade din kod och filer, så att en annan teknisk person snabbt kan sätta sig in i din webapp.

Skapa en fil `README.md` som kort berättar om webappen, hur man startar den och vilka olika "features" den innehåller.

Din webapp ska använda följande teknologier:

* Mithril eller vanilla JavaScript
* Cordova
* Stödja Android eller iOS samt webbläsare
* Innehålla en egen ikon och splashscreen

Beskriv i redovisningstexten vilka teknikval du har gjort och varför.



### Krav 3: En webapp {#k3}
Bygg en så gott som felfri webapp, i enlighet med din spec.

Fick du göra prioriteringar under arbetets gång eller nådde du din fulla ambitionsnivå med din webapp? Berätta.

Kritisera din webapp och framhäv dess brister.

Berätta om någon av de möjligheter som finns för att förbättra din lösning. Tänk att det finns begränsade resurser av tid, så förhåll dig till det och ta bara de möjligheter som kan utföras med begränsad insats av tid och/eller extra kunskap.



### Krav 4: Native design (optionellt) {#k4}
Välj ut en befintlig app på den plattform du utvecklar mot. Den valda appen ska ha ungefär samma typ av vyer som din app har. Försök att så gott det går matcha designen på din app pixel-för-pixel med den befintliga appen.

Beskriv i ett textstycke om 15-20 meningar designprocessen att efterlikna en befintlig app och vilka verktyg och tekniker du använde. Bifoga tre (3) relevanta skärmdumpar av den befintliga appen.



### Krav 5: Offline-läge (optionellt) {#k5}
Använd dina kunskaper om Cordova plugins från kursmoment 6 och pluginen [cordova-plugin-file](https://cordova.apache.org/docs/en/latest/reference/cordova-plugin-file/index.html) för att cacha datan från dina valda datakällor så appen kan användas utan internetuppkoppling.

När du ansluter till ett api och hämtar data ska du spara den till en fil som du hämtar datan ifrån om det inte finns någon internetuppkoppling. Cordova pluginen [cordova-plugin-network-information](https://cordova.apache.org/docs/en/latest/reference/cordova-plugin-network-information/) kan användas för att kolla status om internetuppkoppling

Övningen [Läsa en lokal fil med Cordova](kunskap/lasa-lokal-fil-med-cordova) och exempel programmet `example/readFile` ([repo](https://github.com/dbwebb-se/webapp/tree/master/example/readFile)) hjälper en bit på vägen med att läsa från fil.



### Krav 6: Karta och GPS (optionellt) {#k6}
Använd positionsdata (Koordinater eller adresser) från en av dina valda API:er och visa upp denna data i en karta med hjälp av Google Places API. Du kan inte räkna in Google API:er som en av dina två API:er, dessa ligger utanför.



Redovisning {#redovisning}
--------------------------------------------------------------------

1. På din [redovisningssida](./../redovisa), skriv följande:

    1. För varje krav du implementerat, dvs 1-6, skriver du ett textstycke som uppfyller kravet. Poängsättningen tar sin start i din text så se till att skriva väl för att undvika poängavdrag. Missar du att skriva/dokumentera din lösning så blir det 0 poäng. Du kan inte komplettera en inlämning för att få högre betyg.

    1. Skriv ett allmänt stycke om hur projektet gick att genomföra. Problem/lösningar/strul/enkelt/svårt/snabbt/lång tid, etc. Var projektet lätt eller svårt? Tog det lång tid? Vad var svårt och vad gick lätt? Var det ett bra och rimligt projekt för denna kursen?

    1. Avsluta med ett sista stycke med dina tankar om kursen och vad du anser om materialet och handledningen (ca 5-10 meningar). Ge feedback till lärarna och förslå eventuella förbättringsförslag till kommande kurstillfällen. Är du nöjd/missnöjd? Kommer du att rekommendera kursen till dina vänner/kollegor? På en skala 1-10, vilket betyg ger du kursen?

2. Ta en kopia av texten på din redovisningssida och kopiera in den på Its/redovisningen. Glöm inte länka till din me-sida och projektet.

3. Ta en kopia av texten från din redovisningssida och gör ett inlägg i [kursforumet](forum/utbildning/webapp) och berätta att du är klar.

4. Se till att samtliga kursmoment validerar.

```bash
# Ställ dig i kursrepot
dbwebb publish me
```
