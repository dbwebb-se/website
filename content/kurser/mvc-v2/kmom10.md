---
author:
    - mos
revision:
    "2022-05-06": "(A, mos) Första utgåvan mvc-v2."
...
Kmom07/10: Projekt och examination
==================================

Detta kursmoment avslutar och examinerar kursen.

Alla delar i detta kursmoment skall utföras individuellt och självständigt.

Upplägget är enligt följande:

* Projekt
* Redovisning med videopresentation

Totalt omfattar kursmoment 07/10 i storleksordningen 20--60 studietimmar.

<!--more-->



Introduktion {#pres}
------------------------

Här är en video som "pratar" dig igenom projektets upplägg och delar av innehållet i detta dokumentet.

[YOUTUBE src="LiYCu1Pf3fM" width=700 caption="Kmom10 - Introduktion till projektet."]



Bedömning och betygsättning {#bedomning}
--------------------------------------------------------------------

Det finns ett särskilt dokument som beskriver [grunderna för bedömning och betygsättning](kurser/faq/bedomning-och-betygsattning).



Projektidé {#ide}
--------------------------------------------------------------------

Du skall fortsätta bygga vidare på din kodbas i `me/report` och där lägger du till en ny landningssida för projektets webbplats.

Du behöver göra ett aktivt val om vilket projekt du vill utveckla. Här är förslagen till projektidéer.

* Casino med kortspel (poker)
* Äventyrsspel (adventure)
* Visualisera indikatorer för hållbarhet (sustainability)
* Eget fokus (eget)

Tänk till så att du inte väljer ett alltför stort och komplext projekt som tar alltför mycket tid. Välj ett projekt där du kan slutföra grundkraven inom 20-40h beroende på din ambitionsnivå.

Letar du efter enklaste projektet så är det troligen "sustainability" projektet.

Här följer en beskrivning av varje projektidé.



### Casino med kortspel (poker) {#proj1}

Gör en webbplats där du kan spela poker om låtsaspengar. Du kan välja mellan följande olika upplägg på poker.

Utmaningen i denna uppgiften är att bestämma vilken hand man har och om den handen vinner över motspelaren. Det bör bli en del logiskt kodande kring det och där kan man ha nytta av enhetstester.

Utmaningen ligger också i Ux för att få ett trevligt spel där användaren uppfattar det som enkelt att spela.

Det finns olika varianter du kan implementera. [Läs mer om Poker](https://sv.wikipedia.org/wiki/Poker).

* Du spelar traditionell femkortspoker mot datorn. Här är utmaning att skriva kod så att datorn kan få en bra hand. Men du kan naturligtvis göra det relativt enkelt och slumpmässigt.
* Samma som ovan men kör på sjukortspoker och [Texas hold'em](https://en.wikipedia.org/wiki/Texas_hold_%27em) istället.

Ett något enklare alternativ är patiensen "[Poker Square](https://en.wikipedia.org/wiki/Poker_squares)". Här kan man spela mot sig själv och samla poängen i en highscorelista.

Denna uppgiften handlar inte om att promota spel i allmänhet, det är bara en trivsam och utmanande kodningsuppgift. Det finns [stödgrupper och hjälp att få för spelberoende](https://spelberoende.se/).



### Äventyrsspel (adventure) {#proj2}

Ett klassiskt äventyrsspel, så som jag tänker mig det i denna uppgiften, är ett spel där man börjar i ett rum och en bild visas. I rummet kan man ta saker och lägga i sin ryggsäck, man kan peta på saker i rummet och något kan hända eller visa sig. Man kan förflytta sig åt öster, väster, norr och söder, förutsatt att det finns öppningar åt de hållen.

Målet är att ta sig till sista rummet och ha med sig någon viktig sak man kan använda för att nå till skatten/målet.

Varje gång man klickar på något så sker en request till servern och sidan renderas om.

Här är utmaningen att göra en bra struktur bakom spelet så att man kan lägga till rum, saker och händelser i rummen på ett generellt sätt och undvika att hårdkoda spelets logik.

Håll det enkelt. Visa en bild för varje rum, implementera ryggsäck där man kan ta med sig saker, implementera att man kan navigera mellan rummen och se dolda saker genom att agera med dem, eventuellt via något man har i sin ryggsäck.

Spelet kan var 3-5 rum stort (inte större) och det måste finnas en fusklapp som visar läraren hur man spelar igenom spelet snabbaste vägen.

Här finns en lista med "[Top 100 All-Time Adventure Games](https://adventuregamers.com/articles/view/18643)" och kanske känner du igen något spel där. Ett spel jag själv växte upp med var första varianterna av Larry. Men jag kom aldrig i mål.



### Visualisera indikatorer för hållbarhet (sustainability) {#proj3}

Du har blivit uppmanad att marknadsföra en del av konceptet "Hållbar utveckling". Din uppgift är att välja ett av de 17 områdena som är definierade som "[de 17 globala målen](https://www.globalamalen.se/om-globala-malen/)" och berätta om det på en webbsida.

När du har valt ett område så skall du samla på dig statistik och mätvärden för det området. Du kan hitta mätvärden bland annat via "[SCB Indikatorer för hållbar utveckling](https://www.scb.se/hitta-statistik/statistik-efter-amne/miljo/miljoekonomi-och-hallbar-utveckling/indikatorer-for-hallbar-utveckling/)". Det finns också en förklaring till dessa indikatorer på "[Fakta om Indikatorer för hållbar utveckling](https://www.scb.se/hitta-statistik/statistik-efter-amne/miljo/miljoekonomi-och-hallbar-utveckling/indikatorer-for-hallbar-utveckling/produktrelaterat/Fordjupad-information/fakta-om-indikatorer-for-hallbar-utveckling/)". Dessa mätvärden placerar du i din databas och du läser dem via ditt ORM.

Utmaningen i detta projektet är att samla in mätvärden, organisera dem i databasen och därefter presentera mätvärden i en webbsida för att visa områdets nuvarande status.

Detta projekt kan vara spännande om du vill lära dig mer om ett område inom hållbarhet och få möjlighet att gräva ner dig i siffror och träna på hur du kan visualisera dessa siffor. Du bör skapa några diagram för att representera siffrorna. Du bör ha 2 eller fler indikatorer vilket leder till 2 eller fler tabeller i databasen.

Det räcker om du gör en webbsida för detta projektet, du kan alltså samla allt på en sida men du bör visa på flera aspekter och mätvärden för området och du bör lägga till egen text samt citera andra som uttalar sig om området.

Välj själv om du vill hålla en neutral och objektiv ton eller om du vill vara mer tydlig och ta en egen ställning. Det kan du välja genom sättet du skriver och presenterar indikatorerna.



### Eget fokus (eget) {#proj4}

Du har en helt egen idé om vad du vill göra som projekt. Ok, kör på det. Men du måste börja med att skriva ner din projektidé i text, ungefär som är gjort ovan, och du bör (inget krav) visa texten för en lärare innan du sätter igång och kodar loss.

Ditt projekt måste omfatta någon form av databas och ORM.



Krav {#krav}
--------------------------------------------------------------------

Det finns 3 grundläggande krav (1, 2, 3) du måste lösa för att få godkänt. Normalt leder de till betyg D/E.

Det finns 3 optionella krav (4, 5, 6) som du kan välja att utföra om du har tid, lust, energi och förmåga. Varje komplett utfört optionellt krav kan höja ditt slutbetyg en nivå (C, B, A).



Krav 1, 2, 3: Webbplats {#k123}
--------------------------------------------------------------------

Din nya webbplats skall minst uppfylla följande krav.


<!--
Går det minska omfånget på texten?
-->

### Projektfokus {#p}

Välj ditt fokus för ditt projekt.

Implementera det i din webbplats.



### Struktur och innehåll {#s}

* En landningssida `/proj` som syns i navbaren på din report-sida.
* En sida `/proj/about` som ger en kort introduktion till ditt projekt och vad det handlar om.
* Din about-sida skall innehålla en sektion om dokumentation av ditt projekt där följande är inkluderat.
    * Länk till dokumentationen som är genererad via phpdoc.
    * Länk till rapporten från phpmetrics.
    * Länk till ditt GitHub repo.
    * Länk till Scrutinizer för ditt repo.
* Din about-sida skall innehålla en summering där du berättar om projektets kodkvalitet. Berätta vilka eventuella åtgärder du gjort för att kvalitetssäkra projektet och hur du jobbat med kodkvaliteten och vilka verktyg du använt. Har du fokuserat på några speciella saker, verktyg eller metrics, så kan du berätta om dem.



### Databas med ORM {#o}

* Din webbplats skall använda databas via ORM.
* Det skall finnas en route `/proj/reset` som återställer databasen till dess ursprungliga läge. Placera en länk till denna routen i din about-sida.



### Utseende och användbarhet {#u}

* Din webbplats skall ha en stil och ett utseende som tydligt skiljer sig från din report-sida. Det skall utseendemässigt se ut som en ny webbplats så bygg en "ny" stylesheet eller modifiera din befintliga. Modifiera i någon omfattning färg, typsnitt och utseende på header och footer.
* Användbarhet är viktigt, så fokusera på att din webbplats känns lätt att använda. Använd det du lärt dig om detta hittills.



### Kodstil {#k}

* Din kod i `me/report` skall passera phpcs utan anmärkning.



### Linters {#l}

* Din kod i `me/report` skall passera phpmd och phpstan (valfri level) utan anmärkning. Det är okey att disabla varningar med kommentarer i koden.

Om du inte uppfyller detta kravet till fullo kan du berätta om varför i din redovisningstext och ge en förklaring.



### Enhetstestning & Kodtäckning {#e}

* Alla delar (klasser) av din kod i `me/report` skall täckas av testfall och assertions. Du kan exkludera  katalogerna `Controller`, `Entity`, `Repository` och filen `Kernel.php` samt de filer som är relaterade till övningar du gjort.
* Nå en kodtäckning om minst 50-70%, gärna högre.



### Dokumentation {#d}

* Använd DocBlock kommentarer när du gör projektet.
* Generera dokumentation med phpdoc och spara i `docs/api`.
* Din about-sida skall innehålla en länk till dokumentationen.



### Metrics {#m}

* Använd phpmetrics för att generera en rapport. Spara den i `docs/metrics`.
* Din about-sida skall innehålla en länk till din metrics rapport.



### Git repo och GitHub/Lab {#g}

* Din kod skall vara ett Git repo och den skall ligga publicerad på GitHub/GitLab eller liknande webbtjänst. Detta kravet bör redan vara uppfyllt för din `me/redovisa`.
* Ditt git repo skall ha en `README.md` som beskriver innehållet i någon omfattning.
* Din about-sida skall innehålla en länk till GitHub (eller motsvarande).



### Scrutinizer {#s}

* Ditt repo skall vara kopplat till Scrutinizer.
* Din about-sida skall innehålla:
    * Länk till Scrutnizer.



Krav 4: Snygg kod (optionellt) {#k4}
--------------------------------------------------------------------

<!--
Med tanke på metrics, kanske denna inte skall vara kvar?
Försök hitta annat eventuellt optionellt krav som finns tidigare i kmomen?

Bättre fokusera på implementationen kanske?
Blir mer splittrat annars?
-->

För att visa dina goda förmågor i att relatera till konceptet "Snygg och god kod" så presenterar du din egen syn på detta i en (A) artikel eller (B) presentation.

Du kan inleda så här:

> "Finns det verkligen ett begrepp som är 'Snygg och god kod'? Kan en programmerare uppfatta kod som 'snygg' och vad innebär det och hur producerar man 'snygg kod'?"

Använd och relatera till de begrepp, verktyg och mätvärden som kursen hanterat.

Visa gärna något exempel.

Du behöver inte ha ett komplett svar på frågan, det räcker om du diskuterar kring frågan och kopplar det till saker vi gjort i kursen.

Avsluta med din egen personliga syn.



### (A) Artikel {#k4a}

Du skriver din artikel på routen `proj/cleancode` och länkar till den från din about-sida.

Din artikel bör vara omfångsmässigt som en extra stor redovisningstext. Vi pratar alltså om cirka 30-60 meningar text, cirka 3.500-5.000 tecken, 1-2 A4-sidor.



### (B) Presentation {#k4p}

Du gör en "powerpoint" presentation och spelar in på video.

Länka till presentationen, en pdf-variant, via din about-sida.

Nämn videon på din about-sida, länka till den via din about-sida eller via Canvas.

Presentationen skall vara "exakt" 3 minuter lång.

Försök göra en så "professionell" presentation du kan. Tänk på inledning,  avslutning och "energinivå".

Håll tiden och försök göra presentationen till "exakt 3 minuter". Ett "proffs" kan alltid avsluta en presentation när tiden är slut.

Det är fritt fram att klippa och redigera din video i efterhand liksom att lägga till intro och outro.



Krav 5: Inloggning (optionellt) {#k5}
--------------------------------------------------------------------

Ditt projekt skall innehålla en möjlighet att logga in. Man skall kunna logga in med följande två användare.

* akronym doe, lösenord doe
* akronym admin, lösenord admin

En användare kan ha en roll som vanlig användare eller som administratör.

Användaren doe är en vanlig användare som inte har tillgång till administratörsfunktioner.

Användaren admin har tillgång till administratörsfunktioner.

Användare har en profilsida med detaljer om användaren. Någon av detaljerna skall kunna redigeras av användaren.

En användare skall ha en profilbild som användaren själv kan byta länken till.

Man skall kunna registrera en ny användare genom att ange en akronym och ett lösenord.

När administratören är inloggad kan den se en översikt av samtliga användare i databasen. Administratören kan även lägga till, uppdatera och ta bort en användare.



Krav 6: ORM (optionellt) {#k6}
--------------------------------------------------------------------

Du har valt att göra en större databas där du har minst två tabeller som har en relation mellan varandra. Du har alltså minst två tabeller som behöver joinas.

Du använder ORM för att jobba mot tabellerna.

Du kan använda SQL för att joina eller så lär du dig mer om Symfony och Doctrine och "[How to Work with Doctrine Associations / Relations](https://symfony.com/doc/current/doctrine/associations.html)".

Du har även gjort ett logiskt ER-diagram över din databas och sparat som en bild.

* I din about-sida, skriv ett stycke "ORM" och lista vilka tabeller du har och ge en beskrivning av dina tabeller (en rad räcker). Berätta även vilka tabeller som är kopplade (har en relation).
* Inkludera och visa bilden på ditt ER diagram.



Redovisning {#redovisning}
--------------------------------------------------------------------

Avsluta och redovisa din projektinlämning enligt följande.

1. Testa ditt projekt med `dbwebb test kmom10`. Se till att alla delar passerar grönt.

1. Tagga som v10.0.0, pusha till GitHub/Lab.

1. Driftsätt din applikation på studentservern. Dubbelkolla att alla delar fungerar, inklusive nollställningen av databasen.

1. På din me/report sida, skriv följande:

    <!-- Förtydliga så att man får bättre rättningsunderlag med text per krav.
    Eventuellt lägg in att man skriver det i about-sidan? -->

    1. För varje krav du implementerat, dvs 1-3, 4, 5, 6, skriver du ett textstycke om ca 5-10 meningar där du beskriver hur du löste kravet. Poängsättningen tar sin start i din text så se till att skriva väl för att undvika poängavdrag. Missar du att skriva/dokumentera din lösning så blir det 0 poäng. Du kan inte komplettera en inlämning för att få högre betyg.

    2. Skriv ett allmänt stycke om hur projektet gick att genomföra. Problem/lösningar/strul/enkelt/svårt/snabbt/lång tid, etc. Var projektet lätt eller svårt? Tog det lång tid? Vad var svårt och vad gick lätt? Var det ett bra och rimligt projekt för denna kursen?

    3. Avsluta med ett sista stycke med dina tankar om kursen och vad du anser om materialet och handledningen (ca 5-10 meningar). Ge feedback till lärarna och förslå eventuella förbättringsförslag till kommande kurstillfällen. Är du nöjd/missnöjd? Kommer du att rekommendera kursen till dina vänner/kollegor? På en skala 1-10, vilket betyg ger du kursen?

2. Ta en kopia av texten på din redovisningssida och kopiera in den på Canvas. Glöm inte att bifoga länken till projektet på studentservern.

3. Spela in en redovisningsvideo för projektet och lägg länken till videon i en kommentar på din inlämning i Canvas. Detta kan du göra dagen efter projektets deadline. Läs mer om hur du kan [spela in en redovisningsvideo](kurser/faq/slutpresentation).
