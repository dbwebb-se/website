---
author:
    - mos
revision:
    "2023-05-11": "(B, mos) Uppdaterad inför vt23."
    "2022-05-06": "(A, mos) Första utgåvan mvc-v2."
...
Kmom07/10: Projekt och examination
==================================

Detta kursmoment avslutar och examinerar kursen.

Alla delar i detta kursmoment skall utföras individuellt och självständigt.

Upplägget är enligt följande:

* Projekt
* Redovisning med videopresentation

Totalt omfattar kursmoment 07/10 i storleksordningen 20--40 studietimmar.

<!--more-->

<!--
* Borde lösas inuti kmom, ev som extrauppgift
    * Databas med återställning
    * Inloggning?
-->



<!--
Introduktion {#pres}
------------------------

Här är en video som "pratar" dig igenom projektets upplägg och delar av innehållet i detta dokumentet.

[YOUTUBE src="LiYCu1Pf3fM" width=700 caption="Kmom10 - Introduktion till projektet."]
-->



Bedömning och betygsättning {#bedomning}
--------------------------------------------------------------------

Det finns ett särskilt dokument som beskriver [grunderna för bedömning och betygsättning](kurser/faq/bedomning-och-betygsattning).



Projektidé {#ide}
--------------------------------------------------------------------

Du skall fortsätta bygga vidare på din kodbas i `me/report` och där lägger du till en ny landningssida för projektets webbplats.

Du behöver göra ett aktivt val om vilket projekt du vill utveckla. Här är förslagen till projektidéer.

* [Visualisera indikatorer för hållbarhet](./sustainability)
* [Casino med kortspel](./poker)
* [Äventyrsspel](./adventure)
* [Eget fokus](./eget-fokus)

Tänk till så att du inte väljer ett alltför stort och komplext projekt som tar alltför mycket tid. Välj ett projekt där du kan slutföra grundkraven inom 20-40h beroende på din ambitionsnivå.

Letar du efter enklaste projektet så är det troligen "sustainability" projektet.



Krav {#krav}
--------------------------------------------------------------------

Det finns 3 grundläggande krav (1, 2, 3) du måste lösa för att få godkänt. Normalt leder detta till betyg D/E.

Det finns 3 optionella krav (4, 5, 6) som du kan välja att utföra om du har tid, lust, energi och förmåga. Varje komplett utfört optionellt krav kan höja ditt slutbetyg en nivå (C, B, A).



Krav 1, 2, 3: Webbplats {#k123}
--------------------------------------------------------------------

Din nya webbplats skall minst uppfylla följande krav.



### Innehåll och utseende {#i}

1. Skapa en landningssida `/proj` som syns i navbaren på din report-sida. Denna sida är din förstasida på projektets webbplats.
1. Välj ditt fokus för ditt projekt. Implementera det i din webbplats under `proj/`.
1. Ditt projekt skall ha en stil och ett utseende som tydligt skiljer sig från din report-sida. 
    * Det skall utseendemässigt se ut som en ny webbplats så bygg en "ny" stylesheet eller modifiera din befintliga. Modifiera i någon omfattning färg, typsnitt och utseende på header och footer.
    * Skapa en separat navbar för projektet som enbart innehåller länkarna för projektet.
1. En sida `/proj/about` som ger en kort introduktion till ditt projekt och vad det handlar om.



### Repo och dokumentation {#r}

* Ditt git repo skall ha en `README.md`.
    * Det skall finnas badges som är klickbara och leder till uppdaterade Scrutinizer rapporter för build, coverage och quality.
    * Beskriv innehållet av repot och berätta varför det finns. som beskriver innehållet i någon omfattning.
    * Instruktion för hur man klonar och startar igång webbplatsen

* Innehållet i `docs/` skall vara uppdaterat
    * Kodtäckning sikta på över 90% kodtäckning (exkludera filer som inte är relevanta).
    * Generera dokumentation med phpdoc.
    * Generera metrics med phpmetrics.



Krav 4: ORM (optionellt) {#k4}
--------------------------------------------------------------------

1. Din webbplats skall använda databas via ORM.

1. Din databas måste innehålla minst två tabeller.

1. Skapa en sida `proj/about/database`, och lägg till

    1. En bild på ett ER diagram av tabellerna.
    1. För varje tabell beskriv i en mening vad som sparas i tabellen.
    1. Förklara hur du löste eventuella relationer mellan tabellerna.
    1. Berätta om du använde SQLite eller någon annan databas.
    1. Berätta om du gjorde enhetstester mot databasen.
        * Berätta om/hur du lyckades med enhetstester på Scrutinizer med databasen.

1. Berätta med egna ord (cirka 15 meningar) om hur du ser på fördelar, nackdelar, likheter och skillnader mellan ORM och det sätt vi jobbade med databasen i databaskursen.

1. Från din sida `proj/about`, lägg till en länk till `proj/about/database`.



Krav 5: Valfritt 1 (optionellt) {#k5}
--------------------------------------------------------------------

**Arbete pågår**



Krav 6: Valfritt 2 (optionellt) {#k6}
--------------------------------------------------------------------

**Arbete pågår**



<!--
snygg kod
inloggning

* Din about-sida skall innehålla en summering där du berättar om projektets kodkvalitet. Berätta vilka eventuella åtgärder du gjort för att kvalitetssäkra projektet och hur du jobbat med kodkvaliteten och vilka verktyg du använt. Har du fokuserat på några speciella saker, verktyg eller metrics, så kan du berätta om dem.
-->



Redovisning {#redovisning}
--------------------------------------------------------------------

Avsluta och redovisa din projektinlämning enligt följande.

1. Testa ditt projekt med `dbwebb test kmom10`. Se till att alla delar passerar grönt.

1. Tagga som v10.0.0, pusha till GitHub/Lab.

1. Driftsätt din applikation på studentservern. Dubbelkolla att alla delar fungerar, inklusive nollställningen av databasen.

1. På din me/report sida, skriv följande:

    1. För varje krav du implementerat, dvs 1-3, 4, 5, 6, skriver du ett textstycke om ca 5-10 meningar där du beskriver hur du löste kravet. Poängsättningen tar sin start i din text så se till att skriva väl för att undvika poängavdrag. Missar du att skriva/dokumentera din lösning så blir det 0 poäng. Du kan inte komplettera en inlämning för att få högre betyg.

    2. Skriv ett allmänt stycke om hur projektet gick att genomföra. Problem/lösningar/strul/enkelt/svårt/snabbt/lång tid, etc. Var projektet lätt eller svårt? Tog det lång tid? Vad var svårt och vad gick lätt? Var det ett bra och rimligt projekt för denna kursen?

    3. Avsluta med ett sista stycke med dina tankar om kursen och vad du anser om materialet och handledningen (ca 5-10 meningar). Ge feedback till lärarna och förslå eventuella förbättringsförslag till kommande kurstillfällen. Är du nöjd/missnöjd? Kommer du att rekommendera kursen till dina vänner/kollegor? På en skala 1-10, vilket betyg ger du kursen?

2. Ta en kopia av texten på din redovisningssida och kopiera in den på Canvas. Glöm inte att bifoga länken till projektet på studentservern.

3. Spela in en redovisningsvideo för projektet och lägg länken till videon i en kommentar på din inlämning i Canvas. Detta kan du göra dagen efter projektets deadline. Läs mer om hur du kan [spela in en redovisningsvideo](kurser/faq/slutpresentation).
