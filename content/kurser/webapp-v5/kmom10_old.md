---
author:
    - aar
    - efo
    - mos
revision:
    "2019-04-09": (E, efo) Uppdaterade med proxy och video. Släppte.
    "2019-02-11": (D, efo) En första version inför 2019 LP4.
    "2019-02-11": (prel, efo) Inför 2019 LP4.
    "2018-03-02": (C, efo) Första versionen till webapp-v3.
    "2017-05-05": (B, aar,efo) Första versionen till webapp-v2.
    "2015-12-22": (A, mos) Första versionen till webapp.
...
Kmom10: Projekt och examination
==================================

[WARNING]
Detta kmom uppdateras och är inte redo att jobbas igenom.
[/WARNING]

Detta kursmoment avslutar och examinerar kursen.

Upplägget är enligt följande:

* Projektet och redovisning (20-80h)

Totalt omfattar kursmomentet (07/10) ca 20+20+20+20 studietimmar.



Projektidé och upplägg {#upplagg}
--------------------------------------------------------------------

Du är en engagerad student och funderar på hur du kan nå ut och bidra till en förändring av omvärlden och säkra framtiden. Du känner en pulserande ådra av entreprenörskap i dig. Du bestämmer dig för att "bygga en webapp" som bidrar till förändring.

Det finns en årlig tävling, ["Hack for Sweden"](https://www.digg.se/utveckling-av-digital-forvaltning/hack-for-sweden), där öppen data används för att bygga appar som fokuserar på nytänkande och innovation. I detta projekt kan du använda [en eller flera datakällor som publiceras via tävlingen](https://www.dataportal.se/) som källa till din webapp.

Om du inte hittar ett API via Öppna Data kan detta [public-apis](https://github.com/toddmotto/public-apis) GitHub repo kanske ge inspiration till din app.

I filmen nedan pratar Emil om hur man kan tänka vid val av datakällor och rekommenderar ett antal olika API:er.

[YOUTUBE src="-wAzJgyHlR4" caption="Emil pratar om projektet"]

Om du upplever problem med Cross-Origin Access kan en API-proxy vara lösningen på problemet. I GitHub repot [emilfolino/api-proxy](https://github.com/emilfolino/api-proxy) finns källkod och instruktioner för hur man kan använda sig av en API-proxy på studentservern.

Om du hittar ett XML-API du vill använda kan du göra om XML data till JSON med hjälp av en proxy. Med hjälp av tjänsten [https://xml-proxy.emilfolino.se/](https://xml-proxy.emilfolino.se/) kan du göra om XML till JSON.

Du funderar och väljer en ansats för din webapp, fråga i forumet om du känner dig osäker.



Bedömning och betygsättning {#bedomning}
--------------------------------------------------------------------

När du lämnat in projektet bedöms det tillsammans med dina tidigare redovisade kursmoment och du får ett slutbetyg på kursen. Läs om [grunderna för bedömning och betygsättning](kurser/bedomning-och-betygsattning).



Projektspecifikation {#projspec}
--------------------------------------------------------------------

Utveckla och leverera projektet enligt följande specifikationen. Saknas information så kan du själv välja väg, dokumentera dina val i redovisningstexten.

De två första kraven är obligatoriska och de fyra sista kraven är optionella krav. De två obligatoriska kraven måste lösas tillsammans med ett (1) valfritt optionellt krav för att få godkänt på uppgiften. Lös valfritt antal av de resterande optionella krav för att samla poäng och därmed nå högre betyg.

Varje krav ger maximalt 10 poäng, totalt är det 60 poäng.

**Se till att läsa igenom alla kraven innan du bestämmer dig för datakällor då de optionella kraven kan påverka val av API.**



### Kataloger för redovisning {#var}

Samla alla dina filer för projektet i ditt kursrepo under `me/kmom10/proj`.

Skapa ditt Cordova projekt med följande kommando:

```bash
# stå i me/kmom10/proj
cordova create . se.dbwebb.<valfritt namn> <Valfritt namn>
```

Redovisningstexten skriver du i `me/redovisa`.



### Krav 1: Specifikation, datakällor och arkitektur {#k1}

Din webapp ska använda följande teknologier:

* Mithril eller vanilla JavaScript
* Cordova
* Stödja Android eller iOS samt webbläsare
* Innehålla en egen ikon och splashscreen

Välj ut de datakällor du skall använda och vilken data du behöver ur varje datakälla. Berätta om ditt val. Du ska använda minst två API:er. API:erna måste inte vara från Hack for Sweden, det är enbart ett tips.

Skapa filen `README.md` i din projekt katalog `me/kmom10/proj`. Filen ska innehålla följande stycken:

* __Specifikation__: En kortfattad beskrivning av din app och vad användaren av din app ska kunna åstadkomma med appen.

* __Datakällor__: Lista från vilka API:er du hämtar data.

* __Arkitektur__: Beskriv i textstycke vilka val av teknik du har gjort för din app. Berätta hur du har organiserad din kod så att en kollega snabbt kan sätta sig in i din app.



### Krav 2: En webapp {#k2}

Bygg en så gott som felfri webapp, i enlighet med din spec.

Fick du göra prioriteringar under arbetets gång eller nådde du din fulla ambitionsnivå med din webapp? Berätta.

Kritisera din webapp och framhäv dess brister.

Berätta om någon av de möjligheter som finns för att förbättra din lösning. Tänk att det finns begränsade resurser av tid, så förhåll dig till det och ta bara de möjligheter som kan utföras med begränsad insats av tid och/eller extra kunskap.



### Krav 3: Native design (optionellt) {#k3}

Välj ut en befintlig app på den plattform du utvecklar mot. Den valda appen ska ha ungefär samma typ av vyer som din app har. Försök att så gott det går matcha designen på din app pixel-för-pixel med den befintliga appen.

Beskriv i ett textstycke om 15-20 meningar designprocessen att efterlikna en befintlig app och vilka verktyg och tekniker du använde. Bifoga tre (3) relevanta skärmdumpar av den befintliga appen.



### Krav 4: Autentisering av användaren (optionellt) {#k4}

Utnyttja autentiseringstjänsten [auth.emilfolino.se](https://auth.emilfolino.se) för att ge möjlighet för att användare av din app kan autentisera sig med hjälp JSON Web Tokens. En autentiserad användare får sedan tillgång till delar av appen, som annars är stängda. Du kan även använda autentiseringstjänsten för att spara data för de inloggade användarna.

Du kan inte räkna autentiseringstjänsten som en av dina två API:er.



### Krav 5: Offline-läge (optionellt) {#k5}

Använd dina kunskaper om Cordova plugins från kursmoment 5 & 6 och pluginen [cordova-plugin-file](https://cordova.apache.org/docs/en/latest/reference/cordova-plugin-file/index.html) för att cacha datan från dina valda datakällor så appen kan användas utan internetuppkoppling.

När du ansluter till ett api och hämtar data ska du spara den till en fil som du hämtar datan ifrån om det inte finns någon internetuppkoppling. Cordova pluginen [cordova-plugin-network-information](https://cordova.apache.org/docs/en/latest/reference/cordova-plugin-network-information/) kan användas för att kolla status om internetuppkoppling

Övningen [Filer i Cordova](kunskap/filer-i-cordova) och exempel programmet `example/file` ([repo](https://github.com/dbwebb-se/webapp/tree/master/example/file)) hjälper en bit på vägen.



### Krav 6: Karta och GPS (optionellt) {#k6}

Använd positionsdata (Koordinater eller adresser) från en av dina valda API:er och visa upp denna data i en karta med hjälp av de tekniker vi använde i kursmoment 6. Använd Cordova pluginen [cordova-plugin-geolocation](https://cordova.apache.org/docs/en/latest/reference/cordova-plugin-geolocation) för att visa upp användarens position på kartan.



Redovisning {#redovisning}
--------------------------------------------------------------------

1. På din [redovisningssida](./../redovisa), skriv följande:

    1. För varje krav du implementerat förutom krav 1, dvs 2-6, skriver du ett textstycke som uppfyller kravet. Poängsättningen tar sin start i din text så se till att skriva väl för att undvika poängavdrag. Missar du att skriva/dokumentera din lösning så blir det 0 poäng. Du kan inte komplettera en inlämning för att få högre betyg.

    1. Skriv ett allmänt stycke om hur projektet gick att genomföra. Problem/lösningar/strul/enkelt/svårt/snabbt/lång tid, etc. Var projektet lätt eller svårt? Tog det lång tid? Vad var svårt och vad gick lätt? Var det ett bra och rimligt projekt för denna kursen?

    1. Avsluta med ett sista stycke med dina tankar om kursen och vad du anser om materialet och handledningen (ca 5-10 meningar). Ge feedback till lärarna och förslå eventuella förbättringsförslag till kommande kurstillfällen. Är du nöjd/missnöjd? Kommer du att rekommendera kursen till dina vänner/kollegor? På en skala 1-10, vilket betyg ger du kursen?

2. Ta en kopia av texten på din redovisningssida och kopiera in den på Canvas. Glöm inte länka till din me-sida och projektet.

3. Se till att samtliga kursmoment validerar.

[INFO]
Se till att göra en `dbwebb update` innan `dbwebb publish me` så du får senaste versionen av kursrepot och konfiguration för kursrepot.
[/INFO]

```bash
# Ställ dig i kursrepot
dbwebb publish me
```
