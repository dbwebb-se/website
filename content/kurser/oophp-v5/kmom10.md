---
author:
    - mos
revision:
    "2020-05-26": "(G, mos) Information om produkter och blogginlägg skall sparas i databasen."
    "2020-05-05": "(F, mos) Genomgång och mindre justeringar i text samt lade till krav om redovisningsvideo."
    "2019-05-17": "(E, mos) Bort med del i krav 3 om redigera footer."
    "2019-05-10": "(D, mos) Uppdaterad till v5, optionella uppdaterade till flexibelt admin-interface och regga användare."
    "2018-05-08": "(C, mos) Ny inför oophp v4."
    "2017-05-09": "(B, mos) Mindre förtydligande."
    "2017-05-06": "(A, mos) Första utgåvan."
...
Kmom07/10: Projekt och examination
==================================

Detta kursmoment avslutar och examinerar kursen.

Alla delar i detta kursmoment skall utföras individuellt och självständigt.

Upplägget är enligt följande:

* Projektet
* Redovisning

Totalt omfattar kursmoment 07/10 i storleksordningen 20--40 studietimmar.



Bedömning och betygsättning {#bedomning}
--------------------------------------------------------------------

När du lämnat in projektet bedöms det tillsammans med dina tidigare redovisade kursmoment och du får ett slutbetyg på kursen. Läs om [grunderna för bedömning och betygsättning](kurser/bedomning-och-betygsattning).



Projektidé och upplägg {#upplagg}
--------------------------------------------------------------------

Ryktet har spritt sig att du är en högst kompetent programutvecklare vilket resulterat i att en välkänd IT-profil, låt oss kalla honom Matt Mullvägg, har bett dig utveckla nästa generations bloggverktyg.

Du accepterar uppdraget, väl medveten om att du redan har en god grund till lösningen.

Du tar din grund `me/redovisa` och skapar ett helt nytt projekt i `me/kmom10/proj`. Om du väljer att göra ett Git-repo av projektet och väljer att lägga det på GitHub/Bitbucket så behöver det vara privat. Eftersom detta är det avslutande projektet så vill vi undvika att någon hittar och lånar dina affärshemligheter.

Du skall alltså göra ett bloggverktyg där användaren kan skapa och publicera webbsidor och bloggposter via ett administrativt gränssnitt. Investeraren vill se din tekniska lösning men låter dig själv bestämma vilken profil du väljer för din webbplats som demonstrerar din lösning.

Du kan bygga din webbplats med följande fokus.

* Marknadsför en/flera (verklig/påhittad) produkt, tjänst, koncept, idé så att hela din webbplats handlar om just denna "grej" och dess utomordentliga förträfflighet. Det kan vara tydlig försäljning "köp denna produkten" eller någon variant av influencer där säljandet vävs in i webbplatsen.

Om du vill kan du anpassa upplägget ovan och bygga webbplatsen med alternativt fokus, till exempel enligt följande.

* Personlig webbplats (för dig själv eller en påhittad person) med allmänna reflektioner och betraktelser i vardagen tillsammans med fotografier för att ge känsla, kanske kan det bli en variant av din egen webbplats där du marknadsför dig själv.

Specen nedan bygger på att du gör en webbplats som marknadsför en produkt/tjänst/koncept. Men du kan säkert anpassa det till din egen idé.



Projektspecifikation {#projspec}
--------------------------------------------------------------------

Utveckla och leverera projektet enligt följande specifikation. Saknas info i specen så kan du själv göra en bedömning och välja väg, dokumentera dina val i redovisningstexten.

De tre första kraven är obligatoriska. De tre sista kraven är optionella krav,  lös dem för att samla poäng och därmed nå högre betyg.

Varje krav ger max 10 poäng, totalt är det 60 poäng.



### Krav 1: Webbplats som demo {#k1}

Nedan används "produkt" som ett samlingsnamn för det fokus du valt vilket kan innebära att lyfta fram en produkt, tjänst, koncept, person eller annat. Det du lyfter fram är alltså "produkten".

Bygg stöd för följande sidor på din webbplats.

* Hem, en förstasida som ger en översikt av webbplatsens innehåll.
* En produktsida som visar upp dina produkter (jämför uppgiften filmdatabas).
* En blogg med nyheter om produkter, erbjudande och din verksamhet (jämför uppgiften i kmom06).
* En om-sida med information om webbplatsens fokus, dig själv och din verksamhet.
* Gemensam header med logo och titel, eller din egen personliga variant av header.
* Gemensam footer, med text om Copyright med företagsnamnet.
* En navbar med länkar till webbplatsens olika delar.

På produktsidan ser man en översikt av alla produktvarianter och erbjudande som finns. Du kan välja att visa översikten av produkterna i en tabell, eller visa upp dem mer som en traditionell Eshop kunde gjort (välj själv). Visa upp minst 5 produkter. Man kan klicka på en produkt för att se den i sin helhet på en produktsida med bild(er) och information om produkten.

I nyhetsbloggen presenterar du nyheter och allmän information om produkter och erbjudande. I översikten skall det visas inledningen till minst 5 blogginlägg. Man kan klicka på rubriken för att komma till en egen sida där blogginlägget visas i sin helhet. Använd minst en bild till varje blogginlägg.

Information om produkter och blogginlägg skall sparas i databasen.

Fyll din webbplats med relevanta bilder och texter.

Ditt system driftas på studentservern.



### Krav 2: Ordning och reda {#k2}

Du vill dokumentera ditt system så att en likasinnad programmerare kan förstå vad du gjort.

Lägg till ytterligare en sida på webbplatsen som heter "doc" där du förklarar den kodstruktur som du har i din lösning. Vilka klasser är centrala, vilka kontroller har du och vilka övriga klasser som är viktiga. Var kortfattad och tänk att du förklarar din kod för en likasinnad programmerare. Skriv ett stycke om 15-30 rader eller så. Lägg till en bild som visar ett översiktligt klasssdiagram. Lägg till sidan i navbaren.

Du skapar ett ER-diagram av din färdiga databas och sparar i `htdocs/img/er.png`. Det är okey att automatgenerera en översikt av tabellerna. Skapa rubriken "Databas" i din "doc" och infoga ER-diagrammet som bild samt nämn något om dina tabeller och din databasstruktur.

Ditt projekt skall innehålla en Makefile som kan köra enhetstester med phpunit och generera kodtäckning via `make phpunit`. Det finns inga speciella krav på kodtäckningen, men ange i korthet din ambitionsnivå i sidan "doc", under rubriken "Testning" och berätta vilken kodtäckning du nådde.

Du kan även köra `make test` och validera koden i ditt projekt, försök städa bort så mycket valideringsfel du kan och kommentera övriga i sidan "doc".

Ditt projekt kan generera dokumentation med phpdoc via `make doc`. Vid problem med installation av phpdoc så berättar du om problemen i sidan "doc" och sen går du vidare och lägger tiden på annat.



### Krav 3: Administrativt gränssnitt {#k3}

Webbsidan skyddas av inloggning och man kan logga in som användaren admin med lösenordet admin, man får då behörigheten "administratör". Användare och lösenord sparas i databasen.

När man är inloggad (och har behörighet som "administratör") kan man via ett gränssnitt ändra innehållet på webbplatsen enligt följande.

* Hantera nyhetsbloggen (lägga till, ta bort och redigera inlägg).
* Administrera produkterna (lägga till, ta bort och redigera informationen).

När du skriver texten till blogg- och produktsidor så skriver du den i Markdown och använder en textfilter-klass för att formattera den.



### Krav 4: Förstasidan (optionell) {#k4}

Lägg extra kraft på förstasidan och gör den fin, välkomnande, stylad och full av information. Snygg och tilltalande helt enkelt.

Du kan dela in sidan i regioner/block (gör som du vill) och presentera extra information enligt följande.

* De tre senaste inläggen från din nyhetsblogg. Visa inledningen och en länk för att läsa hela blogginlägget.
* Ett "featured" blogginlägg, visa titel och inledningen semt en länk till hela blogginlägget.
* Senaste inkomna produkter.
* Veckans erbjudande(n) som länk till en produkt eller blogginlägg.
* Rekommenderad produkt(er).

Du kan uppdatera förstasidans innehåll genom att använda information från databasen.



### Krav 5: Registrera nytt konto (optionell) {#k5}

Erbjud en möjlighet för besökaren att registrera ett konto på din webbplats. Man skall kunna registrera ett konto, logga in och där kan man editera sin personliga profilsida där man har sitt namn och epostadress.

Användarna sparas i databasen och du väljer om de loggar in med ett användarnamn och/eller sin epostadress samt ett lösenord.

Lägg till så att användarens profilbild visas med en Gravatar (eller motsvarande), se gravatar.org för detaljer.

I ditt admingränssnitt visar du en översikt av alla användare som finns registrerade.

De användare som lägger till sig själva har inte rättigheter att nå ditt admin gränssnitt, det är bara administratören som kan göra det. Du behöver alltså ha två olika typer av användare, administratörer och vanliga användare.



### Krav 6: Ett flexibelt admingränssnitt (optionell) {#k6}

I admingränssnittet visar du innehållet (produkter, pages, posts eller motsvarande) och användarna i tabellform.

Du har möjlighet till CRUD för dem.

Du har också möjlighet till paginering, sökning/filtrering och sortering av det resultat som visas i tabellerna (jämför kmom05 movie).

Det skall alltså finnas stöd för följande.

* CRUD av innehåll och användare.
* Tabellen skall pagineras och man kan välja hur många träffar som visas på varje sida.
* Man skall kunna filtrera resultatet i tabellen och endast visa de träffar som matchar en viss söksträng.
* Man kan klicka på rubrikerna i tabellen och få tabellen sorterad per den kolumnen i stigande eller sjunkande ordning.



Redovisning {#redovisning}
--------------------------------------------------------------------

1. På din [redovisningssida](./../redovisa), skriv följande:

    1. För varje krav du implementerat, dvs 1-6, skriver du ett textstycke om ca 5-10 meningar där du beskriver vad du gjort och hur du tänkt. Poängsättningen tar sin start i din text så se till att skriva väl för att undvika poängavdrag. Missar du att skriva/dokumentera din lösning så blir det 0 poäng. Du kan inte komplettera en inlämning för att få högre betyg.

    1. Spela in en redovisningsvideo om 5-7 minuter där du visar upp ditt projekt och går igenom dess delar. Utgå gärna från hur du löste kraven. Kombinera med en snabb översikt av någon utvald del i din kod och avsluta med en summering om du är nöjd med din insats och om du hade gjort annorlunda om du hade gjort om projektet.

    1. Skriv ett allmänt stycke om hur projektet gick att genomföra. Problem/lösningar/strul/enkelt/svårt/snabbt/lång tid, etc. Var projektet lätt eller svårt? Tog det lång tid? Vad var svårt och vad gick lätt? Var det ett bra och rimligt projekt för denna kursen?

    1. Avsluta med ett sista stycke med dina tankar om kursen och vad du anser om materialet och handledningen (ca 5-10 meningar). Ge feedback till lärarna och förslå eventuella förbättringsförslag till kommande kurstillfällen. Är du nöjd/missnöjd? Kommer du att rekommendera kursen till dina vänner/kollegor? På en skala 1-10, vilket betyg ger du kursen?

2. Ta en kopia av texten på din redovisningssida och kopiera in den på Canvas. Glöm inte länka till din me-sida med projektet.

```bash
# Ställ dig i kursrepot
dbwebb publish me
```
