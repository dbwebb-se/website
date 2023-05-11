---
author:
    - mos
revision:
    "2023-05-11": "(B, mos) Uppdaterad inför vt23."
    "2022-05-06": "(A, mos) Första utgåvan mvc-v2."
...
Kmom07/10: Projekt och examination
==================================

[WARNING]

**Uppdatering sker inför kursrundan vt23**

Kursmomentet är under översyn och uppdatering inför kommande kursomgång.

Strukturen för projektet/examinationen kommer att uppdateras inför vt23.

[/WARNING]

Detta kursmoment avslutar och examinerar kursen.

Alla delar i detta kursmoment skall utföras individuellt och självständigt.

Upplägget är enligt följande:

* Projekt
* Redovisning med videopresentation

Totalt omfattar kursmoment 07/10 i storleksordningen 20--40 studietimmar.

<!--stop-->
<!--more-->

<!--
* Rensa upp, städa, förenkla, förtydliga.
* Någon uppgift som innebär mycket programmering och mindre databas?
* Visa upp hur adventurespelet kan fungera?
* Lägre betyg på hållbarhet eller lägg till någon del som kan ligga i databasen

* Gör projekt som är helt nytt, istället för att bygga på de luddiga kmomen?

* Bokningssystem? Flyg, hotell?
* Blog, forum?

* Databas med återställning
* Inloggning?

* Om hållbarhet, gör mer krav på presentation med grader och referenser.
    * Mer routes so det blir mer MVC.
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

* Casino med kortspel (poker)
* Äventyrsspel (adventure)
* Visualisera indikatorer för hållbarhet (sustainability)
* Eget fokus (eget)

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


* Din about-sida skall innehålla en summering där du berättar om projektets kodkvalitet. Berätta vilka eventuella åtgärder du gjort för att kvalitetssäkra projektet och hur du jobbat med kodkvaliteten och vilka verktyg du använt. Har du fokuserat på några speciella saker, verktyg eller metrics, så kan du berätta om dem.


Krav 4: Snygg kod (optionellt) {#k4}
--------------------------------------------------------------------

* Din webbplats skall använda databas via ORM.


enhetstestning
inloggning
snygg kod
databas


dokumentera om databasen och berätta om skillnader mellan orm och databaskursen.



Krav 5: Inloggning (optionellt) {#k5}
--------------------------------------------------------------------

<!--
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
-->



Krav 6: ORM (optionellt) {#k6}
--------------------------------------------------------------------

<!--
Du har valt att göra en större databas där du har minst två tabeller som har en relation mellan varandra. Du har alltså minst två tabeller som behöver joinas.

Du använder ORM för att jobba mot tabellerna.

Du kan använda SQL för att joina eller så lär du dig mer om Symfony och Doctrine och "[How to Work with Doctrine Associations / Relations](https://symfony.com/doc/current/doctrine/associations.html)".

Du har även gjort ett logiskt ER-diagram över din databas och sparat som en bild.

* I din about-sida, skriv ett stycke "ORM" och lista vilka tabeller du har och ge en beskrivning av dina tabeller (en rad räcker). Berätta även vilka tabeller som är kopplade (har en relation).
* Inkludera och visa bilden på ditt ER diagram.
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
