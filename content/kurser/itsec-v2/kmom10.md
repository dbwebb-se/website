---
author:
    - grm
    - atb
    - mbo
    - mos
    - nik

revision:
    "2024-12-11": "(E, grm) Förtydlande inför HT24."
    "2023-12-12": "(D, grm) PHP till Javascript, ny projektuppgift inför HT23."
    "2022-12-04": "(C, grm) Uppdaterad inför HT22."
    "2020-12-10": "(B, nik) Uppdaterad inför HT20."
    "2019-12-09": "(A, lew) Första versionen."
    "2018-12-04": "(PA1, mos) Arbetskopia."
...

# Kmom07/10: Projekt och examination

Detta kursmoment avslutar och examinerar kursen.

**Du jobbar enskilt och tar inte hjälp av någon eller något. Ingen AI genererad text eller kod.**

Upplägget är enligt följande:

* _Projektet och redovisning (30-80h)_

Totalt omfattar kursmomentet (07/10) ca 30+50 studietimmar.

[WARNING]
Kursen uppdateras inför HT25. Är "gula rutan" borta är det fritt fram att börja.
[/WARNING]

## Bedömning och betygsättning {#bedomning}

När du lämnat in projektet bedöms det tillsammans med dina tidigare redovisade kursmoment och du får ett slutbetyg på kursen. Läs om [grunderna för bedömning och betygsättning](kurser/faq/bedomning-och-betygsattning-quiz).

## Förkunskapskrav {#forkunskapskrav}

Du har utfört uppgifterna från kmom01 till kmom05.

## Projektspecifikation {#projspec}

Utveckla och leverera projektet enligt följande specifikationen. Saknas info i specifikationen nedan så kan du själv välja väg, dokumentera dina val i redovisningstexten.

De tre första kraven är obligatoriska och måste lösas för att få godkänt på uppgiften. De två sista kraven är optionella krav. Lös de optionella kraven för att samla poäng och därmed nå högre betyg. Om grundkraven inte når 30 poäng får man komplettera sin inlämning. Man kan inte komplettera sig till ett högre betyg.

Krav 1-3 (Grundkraven) ger max 10 poäng styck, totalt är det 30 poäng.  
Krav 4 (Optionellt) ger max 10 poäng.  
Krav 5 (Optionellt) ger max 10 poäng.
Krav 6 (Optionellt) ger max 10 poäng.

### Kataloger för redovisning {#var}

Uppdatera materialet så du har den senaste versionen:

```bash
# Stå i rooten av kursrepot
$ dbwebb update
```

Samla alla dina filer för projektet i ditt kursrepo under `me/kmom10`.

Börja med att kopiera in applikationen till arbetsmappen och installera de nödvändiga paketen:

```bash
# Flytta till kurskatalogen
$ rsync -ravd example/eshop-js me/kmom10/
$ cd me/kmom10/eshop-js
$ npm install
$ docker compose up -d
$ npm start
# I webbläsaren, öppna localhost:3000 för terminalappen och localhost:30001 för dockerappen
# databasen ligger i docker
```

Om du inte har en fungerande Dockermiljö kan du installera paketen med `composer install`.

```bash
# Om du får problem med docker, ta ner, rensa och starta om 
$ docker compose down -v
# Rensa image och volymer för eshopen och mariadb i docker
$ docker compose up -d
# Om du får problem i terminalen, rensa, installera om och start om 
$ npm run clean-all
$ npm install
$ npm start
```

### Bakgrund {#bakgrund}

Vår kund har en eshop som är implementerad med PHP och ett ramverk som heter Anax. Eftersom det är gamla tekniker och språk, så ville de uppdatera eshopen. En firma 'HalvBra AB' kontaktades och de bytte till Javascript och Express. Firman lovade att allt skulle vara klart hösten 2023. Men så gick de i konkurs och lämnade en halvklar eshop.

Men där kommer du in i bilden. Vill du ta dig an uppdraget att fixa nästa steg i eshopen? Och dessutom göra den säkrare? Vi tror på dig!

### Krav 1 Sårbarhetsanalys {#k1}

* Gör en sårbarhetsanalys på eshopen, enligt samma kravspecifikation som i kmom04. För godkänt ska minst 3 st sårbarheter identifieras.
* Dokumentera eshopen med text och aktivitsmatris.
* Rita minst 1 attackträd.
* Dokumentera vilka testmetoder du använder och motivera varför. Glöm inte beskriva hur du gör för att återskapa sårbarheten.
Tänk på att du inte känner till koden i detta krav.

Spara sårbarhetsanalysen i `kmom10/sårbarhetsanalys.pdf`.

### Krav 2: Säkerhetstestning med åtgärder {#k2}

* Fortsätt med sårbarhetsanalysen på eshopen enligt samma kravspecifikation som i kmom05. Säkerhetstesterna ska göras på de 3 sårbarheterna som du hittar i krav 1. Fortsätt skriva i  sårbarhetsanalysen från krav 1.
Eftersom att appen är under utveckling så behöver du inte göra en kopia på databasen. Däremot ska du se till att testfallen rensar efter sig.

* Implementera testfall för 3 olika sårbarheter, ca 3-5 per sårbarhet. Minst 10 totalt.
  * Gör en testplan
  * Det går att använda valfritt testverktyg
  * Dokumentera i redovisningstexten vad du valde för testverktyg och hur man kör testerna.
  * Dokumentera testerna som går fel i ett Appendix.

* Åtgärda de sårbarheterna du hittat. Utöka din analys på samma sätt som i kmom05.
  * Motivera och dokumentera dina åtgärder
  * Dokumentera testerna som går rätt i ett Appendix.

### Krav 3: Nyutveckling med säkerhetstänk {#k3}

Tyvärr har inte allt utveckling blivit klar och just nu behandlas alla användare lika. Men en användare som har rollen admin ska kunna se ett admingränssnitt när den loggar in. I admingränsnittet ska alla användare listas och dessutom ska admin kunna uppdatera alla användare samt ta bort dem från eshopen. Implementera detta på ett säkert sätt.

* Gör en skiss över nyutvecklingen och lägg som ett eget kapitel i Sårbarhetsanalysen. Där beskriver du grovt hur du tänkt implementera det hela. Beskriv skillnaden på admin och vanliga användare. Motivera dina designval med tanke på säkerhet. Vad är skillnaden admin och vanliga användare? Avsluta med ett stycke om framtida utveckling. Vad tycker du att admin mer ska kunna i en eshop?

* Funktionalitet för admin
  * Hur blir nyutveckling säker? Motivera i kapitlet i Sårbarhetsanalysen om du använder någon guide som till exempel [OWASP Developer Guide](https://owasp.org/www-project-developer-guide/release/) och hotmodelleringsramverk som [STRIDE](https://owasp.org/www-community/Threat_Modeling_Process#stride).
  * Implementera views, router och controller för admin (följ strukturen i designen som finns).
  * Gör en adminvy, där admin ska se alla användare och kunna uppdatera deras profiler. Lösenord kan inte uppdateras, så det behöver du inte implementera om du inte vill.
  * Admin ska kunna ta bort användare från adminvyn

* Gör en testplan för vilka sårbarheter du ska testa

* Implementera testfall för sårbarheterna, minst 6 testfall totalt.
  * Valfritt testverktyg
  * Kör gärna testdriven utveckling där du utvecklar testerna först. Om du gör det, så dokumentera att testerna går fel först.

* Implementera så säkert du kan och kör testerna igen. Dokumentera att testerna går rätt.

### Optionella krav

### Krav 4: Loggning (optionell) {#k4}

Implementera loggning av data i eshopen. Fundera över vad som bör loggas och motivera dina val i din redovisningstext eller `kmom10/logging.pdf`. Varför valde du just den datan? Vad valde du bort och varför? Berätta vad du har implementerat och varför.

Förutom att logga, motivera och dokumentera data från 2 olika händelser eller incidenter, så ska du göra något av nedanstående:

* antingen använda något loggverktyg likt Apache log och beskriv hur loggarna ska analyseras och användas.

* eller utred och implementera skydd mot 'log injection'.

* eller beskriv i ord hur personalen som administrerar eshopen ska övervaka datan du loggat, kanske visa den på en webbsida, hur ofta ska loggen övervakas, vilka ska informeras om något inträffar.

### Krav 5: Checklista (optionell) {#k5}

Vår kund har tagit säkerheten på allvar och vill ha en checklista för hur de kan kolla säkerheten i eshopen. Vad behöver de göra för åtgärder? Finns det verktyg att använda som hjälper dem?

* Skriv en checklist i `kmom10/checklist.pdf`
* Dokumentet har inledning och sammanfattning. Däremellan finns kapitel som beskriver en sammanfattning av checklistan. Dessutom ett kapitel med en utförligare beskrivning av punkterna i checklistan. Den här utförligare beskrivningen ska innehålla en beskrivning av punkten i checklistan, motivera varför den är med samt vad som ska göras för att åtgärda den.
* Minst 8 punkter på checklistan
* 2-3 sidor

### Krav 6: Privacy (optionell) {#k6}

Sätt er in i situationen att ni sitter på ett företag som får följande uppdrag:

Kunden _Infopedia_ har insett att de börjat tappa användare för deras bristande fokus på privacy. De anlitar er för att göra en förberedande rapport som går igenom vad som är viktigt att tänka på inom privacy, varför det är viktigt och hur man kan gå tillväga för att uppnå det.

_Infopedia_ jobbar huvudsakligen med projekt/kunder i Europa så rapporten måste täcka GDPR. De är speciellt nyfikna på vad autentisering & behörighet (authentication & authorization) innebär och tror att den största risken är 'Broken Access Control'. Stämmer det eller vad kommer du fram till i din utredning?

De vill gärna att samtliga inom företaget ska gå igenom dokumentet och vill därför att längden på det ska vara **2-3 sidor**. Rapporten ska ha referenser till relevant information inom ämnet.

Det ska vara **vetenskapliga källor (minst 2)** som bidrar till minst två stycken i rapporten. BTH's bibliotek har bra information om vad som kan vara en vetenskaplig länk, se i [Ämnesguide Datavetenskap & Datorsäkerhet](https://www.bth.se/bibliotek/amnesguider/amnesguide-datorsakerhet/).

Spara rapporten i `kmom10/privacy.pdf`.

<!-- ### Krav 6: Quiz (optionell) {#k6}

Gör Kmom07/10 quiz enligt instruktionerna i quizet. -->

<!-- ### Krav 5 Säkerhet (optionell) {#k5}

**UTANFÖR SCOPE AV KURSEN?**

Kunden *SafeSecurity* vill att ni ska kolla på ett av följande tre typer av it-system och motivera vilken typ av data de behöver lagra, varför den behövs och hur man bör lagrar informationen.

* Banksystem (Swedbank/Nordea eller ännu större, Visa/Mastercard)
* Eshop (Amazon, Ebay)
* Vårdinrättningar (1177, region Blekinge)

Tänk bortom kunddata, vad behövs loggas för att garantera att systemet fungerar, att ingen obehörig får åtkomst till information de inte ska få läsa. -->

## Redovisning {#redovisning}

### Redovisningstext

1. I textfältet på Canvas, skriv följande:

    1. För varje krav du implementerat, dvs 1-5, skriver du ett textstycke om ca 5-10 meningar där du beskriver vad du gjort och hur du tänkt. Poängsättningen tar sin start i din text så se till att skriva väl för att undvika poängavdrag. Missar du att skriva/dokumentera din lösning så blir det 0 poäng. Du kan inte komplettera en inlämning för att få högre betyg.

    2. Skriv ett allmänt stycke om hur projektet gick att genomföra. Problem/lösningar/strul/enkelt/svårt/snabbt/lång tid, etc. Var projektet lätt eller svårt? Tog det lång tid? Vad var svårt och vad gick lätt? Var det ett bra och rimligt projekt för denna kursen?

    3. Avsluta med ett sista stycke med dina tankar om kursen och vad du anser om materialet och handledningen (ca 5-10 meningar). Ge feedback till lärarna och förslå eventuella förbättringsförslag till kommande kurstillfällen. Är du nöjd/missnöjd? Kommer du att rekommendera kursen till dina vänner/kollegor? På en skala 1-10, vilket betyg ger du kursen?

2. Länka till projektet på studentservern.

3. Se till att allt är publicerat.

```bash
# Ställ dig i kursrepot
dbwebb publish kmom10
```

### Redovisningsvideo

Redovisningsvideo med dig (facecame eller liknande) och ditt id eller redovisning på plats (hör av dig så bestämmer vi tid). Redovisningen ska vara 7-10 minuter lång och innehålla din sårbarhetsanalys med den sammanfattande tabellen av sårbarheter du hittat. Berätta vilken testmetod du valt, testverktyg och testfall. Visa hur du kör dina testfall när de går grönt. Visa den sammanfattande tabellen med åtgärderna du gjort och visa kodexempel (vad har du gjort för åtgärd i koden).
Berätta om nyutvecklingen. Hur gick det? Vilka sårbarheter hittade du och hur testade du dom? Visa delar av koden i nyutvecklingen.
Om du gjort de optionella kraven, så får du ett par minuter extra per krav för att visa vad du gjort.
