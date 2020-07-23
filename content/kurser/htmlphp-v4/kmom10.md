---
author: mos
revision:
    "2019-10-14": "(D, mos) Trycker på Ux, responsivitet och kodstruktur."
    "2018-10-12": "(C, mos) Uppdatering och nytt alternativt projekt NVM."
    "2016-02-22": "(B, mos) Bort med not om kursutveckling och länk till version 1."
    "2015-10-11": "(A, mos) Första versionen till htmlphp v2."
...
Kmom10: Projekt och examination
==================================

Detta kursmoment avslutar och examinerar kursen.

Upplägget är enligt följande:

* Projektet och redovisning (20-80h)

Totalt omfattar kursmomentet (07/10) ca 20+20+20+20 studietimmar. Du kan själv styra din arbetsinsats genom att välja vilka optionella delar du utför.



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

Webbplatsen skall visa upp information om Nättraby vägmuseum som är världens första friluftsmuseum för vägarnas historia på land, räls, vatten och is.

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

Bygg en egen webbplats för BMO/NVM. Spara webbplatsen i ditt kursrepo under `me/kmom10`.

Webbplatsen skall ha en stil, layout, header och footer som speglar
webbplatsens syfte och idé. Din redovisningstext skall innehålla ett stycke där du förklarar ditt val av style.

Det finns många bilder i `img`-katalogen. Använd dem när du presenterar objekten och för att illustrera artiklarna. Använd "rätt" storlek av bilderna.

Objekten är i detta fallet de objekt som museet främst avser visa upp. Det finns även extra artiklar och information i underlaget. 



#### Hem {#hem}

Webbplatsen skall ha en välkomnande förstasida som visar på webbplatsens syfte och innehåll. En trevlig förstasida kan göra en lyckad webbplats.

Använd gärna objekt och korta introduktioner till artiklarna för att locka användaren att stanna kvar på din webbplats.



#### Innehåll  {#inne}

Allt innehåll från databasen skall finnas med i webbplatsen och presenteras
på ett trevligt och lättåtkomligt sätt.

Objekten skall finnas på en egen sida, tillgänglig via navbaren.

Artiklarna skall finnas på en egen sida, tillgängliga via navbaren.



#### Om {#om}

Webbplatsen skall ha en Om-sida, tillgänglig via navbaren.

I webbplatsen skall det även finnas en personlig presentation av dig själv, liknande den du har på din me-sida. Du har ju skapat siten, så berätta vem du är och i vilket sammanhang webbplatsen skapades.

Om-sidan skall även innehålla ett generellt textstycke om webbplatsen och dess innehåll. Det finns material i databasen du kan använda.



#### Validera och kompabilitet {#validera}

Webbplatsen skall validera för HTML5 och CSS3. Extensions specifika för en webbläsare är tillåtna (-moz, -webkit, etc) samt viss användning av nya CSS-konstruktioner som validatorn inte klarar av.

Webbplatsen skall minst fungera i Firefox och Google Chrome.



#### Väl fungerande webbplats {#fungera}

Webbplatsen skall fungera utan brister, brustna länkar, korrekt skalning av bilder, det skall inte finnas onödiga horisontella skrollbars och webbplatsen skall "hålla ihop".

Med andra ord, det skall vara en bra webbplats och fungera som man förväntar sig, utan uppenbara brister.



#### Responsiv webbplats {#responsiv}

Din webbplats skall ha viss responsivitet för att stödja att visas på små/stora enheter. 

Det är okey om responsiviteten inte är helt komplett. Men det måste finnas element av responsivitet som är implementerade i webbplatsen.



#### Kodstruktur och dokumentation {#kodstruktur}

Gör ytterligare en sida till din webbplats, denna sida skall innehålla dokumentation av din webbplats. Du behöver inte lägga denna sidan i navbaren, men det måste finnas en länk till dokumentationssidan från din om-sida.

I sidan skriver du om följande.

1. Berätta om din kodstruktur som ligger bakom din webbplats. Du kan tex berätta om katalogstrukturen, konfigfilen, funktioner, vyer, sidkontroller respektive multisidkontroller och så vidare.
1. Berätta hur väl din sida fungerar responsivt.
1. Ge förslag på ett par förbättringar du ser att man skulle kunna göra på din webbplats, i ett fiktivt vidareutvecklingsprojekt. 



### Krav 4: Presentera innehåll på alternativa sätt (optionell) {#k4}

Var uppfinningsrik i hur du väljer att presentera objekten och artiklarna. Välj flera varianter på hur du presenterar dem och gör informationen lätt tillgänglig för slutanvändaren.

Gör minst 2 av följande (och fyll gärna på med något egen variant du anser gynnar webbplatsen).

Låt användarens upplevelse, User Experience (UX), styra dig i dina val. Enkelt sagt, gör en bra webbplats som har bra innehåll och äv enkel att använda och navigera på. 

1. Gör en sökfunktion där man kan söka bland objekt och artiklar.

2. Visa objekten på flera sätt. Visa samtliga objekt eller en översikt av objekten med en kort intro till respektive objekt. Ge användaren något alternativ till hur du visar upp informationen.

3. Gör så att man enkelt kan titta över objekten med en länk till "nästa objekt" och "föregående objekt". Det kan då bli enkelt att navigera mellan objekten.



### Krav 5: Galleri av bilder (optionell) {#k5}

Skapa en egen sida med ett galleri som visar bilderna som är kopplade till objekten.

Använd inte JavaScript. Det ger ingen bonus. Gör en lösning baserad på serversidan och PHP.

Visa mindre bilder (thumbnails) på alla bilder. Välj att visa 4 bilder (välj själv antal) på en sida. Det skall finnas en länk "Nästa >" för att visa nästa 4 bilder, och föregående "< Föregående" 4 bilder. Användaren kan klicka runt och med enkelhet se alla bilder i arkivet, sida för sida.

Om man klickar på en bild så leder den länken till att enbart bilden visas, antingen i en webbsida, eller bara som ren bild direkt i webbläsaren.



### Krav 6: Administrativt gränssnitt (optionell) {#k6}

Skapa ett gränssnitt för webbplatsens administratör. Följande delar skall finnas med.

1. Administratören kan logga in på webbplatsen för att komma åt de administrativa funktionerna. Både *admin admin* och *doe doe* skall fungera som användarnamn och lösenord.

2. Det skall gå att editera webbplatsens innehåll som ligger lagrat i databasen. Det skall gå att lägga till och ta bort innehåll.



Redovisning {#redovisning}
--------------------------------------------------------------------

1. På din [redovisningssida](./../redovisa), skriv följande:

    1. För varje krav du implementerat, dvs 1-6, skriver du ett textstycke om ca 5-10 meningar där du beskriver vad du gjort och hur du tänkt. Poängsättningen tar sin start i din text så se till att skriva väl för att undvika poängavdrag. Missar du att skriva/dokumentera din lösning så blir det 0 poäng. Du kan inte komplettera en inlämning för att få högre betyg.

    1. Skriv ett allmänt stycke om hur projektet gick att genomföra. Problem/lösningar/strul/enkelt/svårt/snabbt/lång tid, etc. Var projektet lätt eller svårt? Tog det lång tid? Vad var svårt och vad gick lätt? Var det ett bra och rimligt projekt för denna kursen?

    3. Avsluta med ett sista stycke med dina tankar om kursen och vad du anser om materialet och handledningen (ca 5-10 meningar). Ge feedback till lärarna och förslå eventuella förbättringsförslag till kommande kurstillfällen. Är du nöjd/missnöjd? Kommer du att rekommendera kursen till dina vänner/kollegor? På en skala 1-10, vilket betyg ger du kursen?

2. Ta en kopia av texten på din redovisningssida och kopiera in den på Canvas. Glöm inte länka till din me-sida och projektet. 

3. Se till att samtliga kursmoment validerar i "dbwebb validate/publish".

```bash
# Ställ dig i kursrepot
dbwebb publish me
```
