---
views:
    flash:
        region: flash
        template: default/image
        data:
            src: "image/webtec/logo.png"
author: mos
revision:
    "2022-10-10": "(I, mos) Uppdaterad inför webtec v2 ht22."
    "2021-10-12": "(H, mos) Uppdaterad inför webtec v1."
    "2020-10-14": "(G, mos) Not om redovisningsvideo."
    "2020-10-14": "(F, mos) Not om access till databasen."
    "2020-10-12": "(E, mos) Uppdatera tillgänglig tid i enlighet med läsperioden."
    "2019-10-14": "(D, mos) Trycker på Ux, responsivitet och kodstruktur."
    "2018-10-12": "(C, mos) Uppdatering och nytt alternativt projekt NVM."
    "2016-02-22": "(B, mos) Bort med not om kursutveckling och länk till version 1."
    "2015-10-11": "(A, mos) Första versionen till htmlphp v2."
...
Kmom10: Projekt och examination
==================================

Detta kursmoment avslutar och examinerar kursen.

Du jobbar enskilt och tar inte hjälp av någon.

Upplägget är enligt följande:

* Projektet och redovisning (20-60h)

Totalt omfattar kursmomentet (07/10) ca 20+20+20 studietimmar. Du kan själv styra din arbetsinsats genom att välja vilka optionella delar du utför.

<!--
Responsiv sida som ett optionellt krav, via optionella delar i kmomen?

-->



Förutsättning {#pre}
--------------------------------------------------------------------

Det finns ingen anledning att påbörja projektet om du inte är klar med kmom05 och kmom0606 som visar hur du jobbar mot databaser i den kodstruktur som kursen erbjuder.

Börja med en `dbwebb update` för at tuppdatera ditt kursrepo.



Bedömning och betygsättning {#bedomning}
--------------------------------------------------------------------

När du lämnat in projektet bedöms det tillsammans med dina tidigare redovisade kursmoment och du får ett slutbetyg på kursen. Läs om [grunderna för bedömning och betygsättning](kurser/bedomning-och-betygsattning).



Projektidé och upplägg {#upplagg}
--------------------------------------------------------------------

Det finns två alternativa projekt. Du skall välja att utföra ett av dem. I båda projekten får du en SQLite-databas med webbplatsens innehåll samt ett antal bilder. Du skall sedan bygga en webbplats baserat på det materialet. Det finns en gemensam kravspecifikation som gäller för båda projekten.

Projekten heter BMO och NVM. Välj ett av dem.



### Projekt alternativ 1: BMO {#bmo}

Projektet heter Begravningsmuseum Online (BMO).

Webbplatsen skall presentera innehåll relaterat till begravningsseder och bruk under 1800-talet och tidigt 1900-tal, webbplatsens syfte är att visa upp och vårda ett kulturarv.

Webbplatsen *får inte* ha någon koppling eller referens till det fysiska begravningsmuseum som finns i Ljungby. Det du bygger är helt fristående och har ingen relation till Ljungbys fysiska motsvarighet.

Du kan läsa mer om projektets bakgrund och idé i artikeln "[Ronny Holm och Begravningsmuseum Online (BMO)](./../projekt-appendix-1)".



### Projekt alternativ 2: NVM {#nvm}

Projektet heter Nättraby Vägmuseum (NVM).

Webbplatsen skall visa upp information om Nättraby vägmuseum som är världens första friluftsmuseum för vägars historia på land, räls, vatten och is.

Det finns en befintlig webbplats som du skall göra ett bättre alternativ till. Kunden är Nättraby Hembygdsförening.

Du kan läsa mer om projektets bakgrund och idé i artikeln "[Nättraby Vägmuseum (NVM)](./../projekt-appendix-2)".



### Tips från Coachen {#tips}

Det finns "[Tips från Coachen](./../tips-fran-coachen)" som kan ge dig viss vägledning till hur du mentalt kan ta dig an uppgiften.



Projektspecifikation {#projspec}
--------------------------------------------------------------------

Utveckla och leverera projektet enligt följande specifikationen. Saknas info i specen så kan du själv välja väg, dokumentera dina val i redovisningstexten.

De tre första kraven är obligatoriska och måste lösas för att få godkänt på uppgiften. De tre sista kraven är optionella krav. Lös de optionella kraven för att samla poäng och därmed nå högre betyg.

Varje krav ger max 10 poäng, totalt är det 60 poäng.



### Krav 1, 2, 3: Grunden {#k1}

Gör ditt val mellan BMO och NVM. Bygg sedan webbplatsen med följande funktion och struktur.


#### Allmänt {#allmant}

Bygg en egen webbplats för BMO/NVM. Spara webbplatsen i ditt kursrepo under `me/proj`.

Webbplatsen skall ha en stil, layout, header och footer som speglar
webbplatsens syfte och idé. Din redovisningstext skall innehålla ett stycke där du förklarar ditt val av style.

Det finns många bilder som du kan använda när du presenterar objekten och för att illustrera artiklarna. Använd "rätt" storlek av bilderna så att webbläsaren inte behöver skala om bilden.

Objekten är de utställningsobjekt som visas upp i museet. Det finns också artiklar som berättar och sätter in objekten i ett sammanhang.



#### Databas {#databas}

Informationen från databasen läses in med PHP PDO på det viset vi gjort i kmom05 & 06. Man skall inte kopiera innehåll från databasen och placera in i HTML-koden.

Man kan göra justeringer direkt i databasens innehåll och tabellstruktur. Det är okey att modifiera tabeller och lägga till ytterligare tabeller och information i databasen. Berätta vad du gjort för ändringar i redovisningstexten.

Databasen placerar du i katalogen `db/`.



#### Webbplatsens kodbas {#kodbas}

Du skall bygga webbplatsen med stöd av den kodbas och struktur du använt i kursen. Det innebär sidkontroller, processingkontroller och templatefiler för vyer och layout. Använd samma katalogstruktur som använts i kursen.

Skapar du egna funktioner så lägger du dem i katalogen `src/`.

Det finns ingen anledning att använda JavaScript i projektet. Det är inte förbjudet, men det ger ingen bonus, eventuellt tvärtom - om det inte fungerar för rättaren.

Det finns ingen anledning att använda ett CSS ramverk i projektet, men det är inte förbjudet. Försök istället bygga ditt egna "CSS ramverk".



#### Hem {#hem}

Webbplatsen skall ha en välkomnande förstasida som visar på webbplatsens syfte och innehåll. En trevlig förstasida kan göra en lyckad webbplats.

Döp denna sidkontroller till `public/home.php`.

Använd gärna objekt och korta introduktioner till artiklarna för att locka användaren att stanna kvar på din webbplats.



#### Innehåll {#inne}

Allt innehåll från databasen skall finnas med i webbplatsen och presenteras
på ett trevligt och lättåtkomligt sätt.

* Objekten skall finnas på en egen sida, tillgänglig via navbaren.

* Artiklarna skall finnas på en egen sida, tillgängliga via navbaren.

Det skall finnas en sida som visar flera/alla objekt med en kort intro till respektive objekt.

Man kan sedan välja ett specifikt objekt som man vill titta på och då visas det objektet upp i en separat sida.

Gör en liknande struktur för artiklarna.



#### Om {#om}

Webbplatsen skall ha en Om-sida, tillgänglig via navbaren.

I webbplatsen kan det även finnas en personlig presentation av dig själv, liknande den du har på din me-sida. Du har ju skapat siten, så berätta vem du är och i vilket sammanhang webbplatsen skapades.

Om-sidan skall även innehålla ett generellt textstycke om webbplatsen och dess innehåll. Det finns material i databasen du kan använda till om-sidan.



#### Validera och kompabilitet {#validera}

Webbplatsen skall validera för HTML och CSS enligt Unicorn. Extensions specifika för en webbläsare är tillåtna (-moz, -webkit, etc) samt viss användning av nya CSS-konstruktioner som validatorn inte klarar av.

Webbplatsen skall minst fungera i Firefox och Google Chrome.



#### Väl fungerande webbplats {#fungera}

Webbplatsen skall fungera utan brister, brustna länkar, korrekt skalning av bilder, det skall inte finnas onödiga horisontella skrollbars och webbplatsen skall "hålla ihop".

Med andra ord, det skall vara en bra webbplats och fungera som man förväntar sig, utan uppenbara brister.



#### Responsiv webbplats {#responsiv}

Din webbplats skall vara responsiv för att stödja att visas på små/stora enheter.

Det är okey om responsiviteten inte är helt komplett. Men det måste finnas grundläggande element av responsivitet som är implementerade i webbplatsen.

Till exempel bör bilder vara responsiva, tillsammans med header, footer och de sidor som är uppdelade i kolumner. Navbaren bör vara responsiv i rimlig mån, men det är inget hårt krav.



#### Kodstruktur och dokumentation {#kodstruktur}

Gör ytterligare en sida till din webbplats, denna sida skall innehålla dokumentation av din webbplats. Du behöver inte lägga denna sidan i navbaren, men det måste finnas en länk till dokumentationssidan från din om-sida.

Döp denna sidkontroller till `public/doc.php`.

I sidan skriver du om följande.

1. Berätta om din kodstruktur som ligger bakom din webbplats. Berätta hur du tänkte när du organiserade din kod för webbplatsen.
1. Berätta hur väl din sida fungerar responsivt.
1. Ge förslag på ett par förbättringar du ser att man skulle kunna göra på din webbplats, i ett fiktivt vidareutvecklingsprojekt.



### Krav 4: Sök och navigera (optionell) {#k4}

Förbättra användarens möjilghet att navigera på din webbplats och finna informationen. Användarens upplevelse, User Experience (UX), är en viktig ingrediens när man bygger flödet i webbplatsen.

Lägg till följande möjligheter för att söka och navigera.

1. Gör en sökfunktion där man kan söka bland objekt och artiklar. När sökresultatet kommer upp så presenteras kort information om sökträffen. Sedan kan man klicka på sökträffen och komma till det objekt eller artikel som sökträffen gäller. Placera länken till söksidan i navbaren (eller motsvarande).

2. Gör så att man enkelt kan titta över alla objekten med en länk till "nästa objekt" och "föregående objekt". Det kan då bli enkelt att navigera mellan objekten. Man skall alltså kunna klicka sig fram mellan samtliga objekt.



### Krav 5: Galleri av bilder (optionell) {#k5}

Skapa en egen sida med ett galleri som visar bilderna som är kopplade till objekten. Namnge länken som "Galleri" och placera den i navbaren.

Använd inte JavaScript. Gör en lösning baserad på serversidan och PHP.

Visa mindre bilder (thumbnails) på alla bilder. Välj att visa 4 bilder (välj själv antal) på en sida. Det skall finnas en länk "Nästa >" för att visa nästa 4 bilder, och föregående "< Föregående" 4 bilder. Användaren kan klicka runt och med enkelhet se alla bilder i arkivet, sida för sida.

Om man klickar på en bild så leder den länken till att enbart bilden visas, antingen i en webbsida, eller bara som ren bild direkt i webbläsaren.



### Krav 6: Administrativt gränssnitt (optionell) {#k6}

Skapa ett gränssnitt för webbplatsens administratör. Följande delar skall finnas med.

1. Administratören kan logga in på webbplatsen för att komma åt de administrativa funktionerna. Använd *admin admin* och *doe doe* som användare och lösenord. Placera länken till login i navbaren (eller liknande).

2. Det skall gå att editera webbplatsens innehåll (artiklar/objekt) som ligger lagrat i databasen. Det skall gå att lägga till och ta bort innehåll.



Redovisning {#redovisning}
-------------------------------------------------------------------

1. På din [redovisningssida](./../redovisa), skriv följande:

    1. För varje krav du implementerat, dvs 1-3, 4, 5, 6, skriver du ett textstycke om ca 5-10 meningar där du beskriver vad du gjort och hur du tänkt. Poängsättningen tar sin start i din text så se till att skriva väl för att undvika poängavdrag. Missar du att skriva/dokumentera din lösning så blir det 0 poäng. Du kan inte komplettera en inlämning för att få högre betyg.

    2. Skriv ett allmänt stycke om hur projektet gick att genomföra. Problem/lösningar/strul/enkelt/svårt/snabbt/lång tid, etc. Var projektet lätt eller svårt? Tog det lång tid? Vad var svårt och vad gick lätt? Var det ett bra och rimligt projekt för denna kursen?

    3. Avsluta med ett sista stycke med dina tankar om kursen och vad du anser om materialet och handledningen (ca 5-10 meningar). Ge feedback till lärarna och förslå eventuella förbättringsförslag till kommande kurstillfällen. Är du nöjd/missnöjd? Kommer du att rekommendera kursen till dina vänner/kollegor? På en skala 1-10, vilket betyg ger du kursen?

2. Ta en kopia av texten på din redovisningssida och kopiera in den på Canvas. Glöm inte att bifoga länken till projektet på studentservern.

3. Spela in en redovisningsvideo och lägg länken till videon i en kommentar på din inlämning i Canvas. Detta kan du göra dagen efter projektets deadline. Läs mer om hur du kan [spela in en redovisningsvideo](kurser/faq/slutpresentation).

4. Se till att samtliga kursmoment validerar i "dbwebb test/validate/publish".

```text
# Ställ dig i kursrepot
dbwebb test kmom10
dbwebb publish me
```
