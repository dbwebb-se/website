---
views:
    flash:
        region: flash
        template: default/image
        data:
            src: "image/snapvt18/bank2-account-actions.png?w=1100&h=300&cf&c=600,270,0,0&f=edgedetect"
author: mos
revision:
    "2022-03-09": "(P, mos) Ny video för 2022 och v2."
    "2022-03-09": "(O, mos) Genomgången inför v2 och uppdaterade projektkrav."
    "2021-03-29": "(N, mos) Förtydliga självtest på krav 1 projektet."
    "2021-03-10": "(M, mos) Lade till genomgångsvideo."
    "2021-03-10": "(L, mos) Uppdaterad med tillfällen för kursrunda vt2021."
    "2020-08-27": "(K, mos) Lade till övningstenta från 2020 maj."
    "2020-05-20": "(J, mos) Lade till övningstenta från 2020 mars."
    "2020-03-25": "(I, mos) Förtydligande om redovisningsvideo."
    "2020-02-19": "(H, mos) Lade till tentor för 2020."
    "2019-06-04": "(G, mos) Lade till övningstenta bibliotek."
    "2019-05-10": "(F, mos) Inför omtenta och länk till övningstenta säpo."
    "2019-03-08": "(E, mos) Krav till eshop3."
    "2019-03-06": "(D, mos) Fixade felaktig länk till lucifer."
    "2019-03-06": "(C, mos) Ny struktur inför vt19."
    "2018-05-07": "(B, mos) Lade till examination för Webbprogrammering."
    "2018-02-27": "(A, mos) Första utgåvan."
...
Kmom10: Examination och redovisning
====================================

Detta kursmoment avslutar och examinerar kursen.

Alla delar i detta kursmoment skall utföras individuellt och självständigt. Respektera det.

Upplägget är enligt följande:

* [Tentamen "programmeringstenta" (obligatorisk)](#tentamen)
* [Projekt "eshop3" (optionell)](#projekt)
* [Redovisning (obligatorisk)](#redovisning)

Totalt omfattar kursmoment 07/10 i storleksordningen 20--60 studietimmar.

<!--

Använd optionella krav i 05/06 och låt dem återfinnas i projektet. Kan streamlinas mer.

Kanske enbart fokusera på faktureringen i projektet. Kanske fokusera på att göra nåt snyggare i webbklienten.

* Lista fakturor
* Skapa faktura
* Betala faktura

Förtydliga minsta möjliga krav för att klara av tentan.

* Lagrade procedurer
* LEFT/RIGHT JOIN

-->


Inspelad genomgång {#flas}
--------------------------------------------------------------------

Det finns en inspelad genomgång som går igenom hur kmom10 och examinationen är upplagd. Se den som ett komplement till att läsa informationen i detta dokumentet.

[YOUTUBE src="RC11mh4HRKc" width=700 caption="Genomgång av examinerande moment med programmeringstenta, projekt och redovisning (18 min)."]



Bedömning och betygsättning {#bedomning}
--------------------------------------------------------------------

Tentamen rättas och bedöms när den lämnats in.

När du lämnar in redovisningstexten slutbedöms din insats på kursen och du får ett slutbetyg på kursen.

Inlämning av projektet måste ske samtidigt som du lämnar in redovisningstexten. Redovisnignstexten är det sista du lämnar in i kursen och det "stänger" kursen och ger dig slutbetyget.

Läs hur betyget sätts i [grunder för bedömning och betygsättning (tentamen + projekt)](kurser/faq/bedomning-och-betygsattning-tentamen-och-projekt).



Tentamen "programmeringstenta" (obligatorisk) {#tentamen}
--------------------------------------------------------------------

Du måste nå ett godkänt betyg på tentamen. Om du missar tentamen så kan du göra omtentamen eller resttentamen vid senare tillfälle alternativt omregistrera dig på nästa kurstillfälle.

Du måste gjort minst kmom05 för att göra tentan. I tentan finns krav på lösningar som använder tekniker som introduceras i kmom05. Utan dem kan man inte klara godkänt på tentan.

Du kan få maximalt 30 poäng om du löser alla uppgifter på tentamen. Du behöver minst 60% (18 poäng) för att bli godkänd.

Med en godkänd tentamen kan du nå ett slutbetyg om E-C.



### Planerade tentamen {#planerade}

Följande tentamen är planerade för kursomgången våren 2022.

* Tenta (kmom10/try1): Torsdagen den 24:e mars, 2022.
* Omtenta (kmom10/try2): Fredagen den 27:e maj, 2022.
* Resttenta (kmom10/try3): Fredagen den 26:e augusti, 2022.

Tentamen är distans och online. Ingen anmälan krävs.

<!--
För campus mellan 9-14 i sal H430/H429. För distans 9-24. Ingen anmälan krävs.
-->

Nästkommande tillfällen för examination sker i samband med kurstillfället som är planerat till läsperiod 3, vårterminen 2023. Du kan omregistrera dig på det kurstillfället för att delta.

Du kan även se planeringen för tentamen via `dbwebb exam ls` i kursrepot.



### Genomförande {#genomfor}

Tentamen sker vid ett bokat tillfälle under en dag. Samtliga studenter har hemtentamen som skall utföras någon gång med start mellan 9-24.

<!--
Campusstudenter har en bokad sal på campus 9-14. Distansstudenter har en hemtentamen som skall utföras någon gång med start mellan 9-24.
-->

Tiden för tentamen är begränsad till 5 timmar. Om du har rätt till utökad tid vid tentamen så meddelar du läraren och bifogar underlag.

Lärare är normalt tillgängliga för frågor under 9-17, lärarstöd under 17-24 är inte garanterat.

Du får ha tillgång till internet, manualer, dokumentation, ditt kursrepo och all kod du skrivit under kursen. Du gör uppgiften på din egen dator, i ditt kursrepo.

Du jobbar individuellt och självständigt och tar inte hjälp av någon. Generella förtydligande kan du få av lärare som är tillgänglig i chatten.

Verktyget `dbwebb exam` används tillsammans med kursrepot för att checka ut och lämna in din tentamen. Du behöver alltså tillgång till både kursrepo och dbwebb-cli för att kunna genomföra tentamen.



### Förbered via tidigare tentamen {#tidigare}

Det är fritt att förbereda sig inför tentamen, efter bästa förmåga. Det är till och med väldigt klokt att göra det och det ger troligen en rejäl fördel under tentadagen.

Du kan träna på tidigare tentamen för att få övning och en känsla av vilken typ av uppgifter och struktur du kan förvänta dig.

Det finns ingen garanti för att nya tentamen kommer att följa exakt samma upplägg som tidigare tentamen. Oavsett det så bedömer läraren att de tidigare tentamen som finns tillgängliga nedan är relevanta övningsobjekt.

Följande gamla tentor finns tillgängliga.

<!--
* 2022
    * [Fiskodling](./tentamen/fiskodling)
    * [Förmögenhet](./tentamen/formogenhet)
-->

* 2021
    * [Hund](./tentamen/hund)
    * [Vaccin](./tentamen/vaccin)

* 2020
    * [Vapen](./tentamen/vapen)
    * [Rock](./tentamen/rock)

* 2019
    * [Pingis](./tentamen/pingis)
    * [Bibliotek](./tentamen/bibliotek)
    * [Säkerhetspolisens (SÄPO)](./tentamen/sapo)

<!--
Här följer en del äldre tentor från 2017-18. De är relevanta som övningstentor, även om de delvis skiljer sig i det upplägg som används från 2019 och framåt. Observera att poängfördelningen är olika för nedan tentor.

* [En japansk smakresa, 31 augusti 2018](./tentamen/en-japansk-smakresa)
* [Det stora slaget om tårtan, 31 maj 2018](./tentamen/det-stora-slaget-om-tartan)
* [Upplevelse, 21 mars 2018](./tentamen/upplevelse)
* [Lucifer Morningstar, 24 november 2017](kurser/dbjs-v1/examination/lucifer)
* [Hotel Paradise, 5 maj 2017](kurser/dbjs-v1/examination/paradise)
* [Mannsmandel, 12 april 2017](kurser/dbjs-v1/examination/mannsmandel)

-->

Du kan checka ut ett par övningstentor via `dbwebb exam checkout prep`, de sparas då i katalogen `me/kmom10/prep` och du kan använda `dbwebb exam` som vid en vanlig tentamen.

Förbered dig till tentorna genom att läsa om [hur du checkar ut och lämnar in din tentamen med `dbwebb exam`](./tentamen). Pröva sedan att göra en eller flera övningstentor för att se vad som väntar dig. Rekommendationen är att göra minst två övningstentor.



Projekt "eshop3" (optionell) {#projekt}
--------------------------------------------------------------------

Projektet är optionellt och kan hjälpa dig att nå ett högre betyg (D-A) på kursen.

Projektet skall lösas individuellt och självständigt, oavsett om du tidigare jobbat i grupp när du löst databasmodelleringen, `eshop1` och/eller `eshop2`.

Varje krav är värt maximalt 10 poäng om kravet är löst till fullo utan brister. Totalt omfattar projektet maximalt 30 poäng.

Spara alla filer i `me/kmom10/eshop3`.

Du måste lösa krav 1 innan du kan lösa krav 2. Du måste lösa krav 2 innan du kan lösa krav 3.



### Krav 1 {#k1}

Ditt eshop3 skall uppfylla de krav som finns för ehop1 och eshop2.

I webbklienten skall man kunna lägga till en ny produkt och koppla den till en eller flera kategorier.

Samtliga produkter skall synas i översikten och det skall synas om de är kopplade till kategorier.

I webbklienten kan man visa vad som finns på lagret och respektive lagerhylla.

I webbklienten skall man kunna lägga till en ny produkt på en lagerhylla. Man skall sedan kunna uppdatera antalet produkter som ligger på lagerhyllan.



#### Självtest krav 1 {k1test}

Följande är förslag till hur du själv kan testa delar av kravet.

Lägg till och hantera en produkt i webbklienten.

1. Lägg till och redigera detaljer för en produkt.
1. Se produktöversikten och produkten skall visas.
1. Lägg produkt i en kategori.
1. Se produktöversikten och produkten skall visas med detaljer om kategori.
1. Lägg produkt i flera kategori.
1. Se produktöversikten och produkten skall visas med detaljer om kategorier.

Hantera lagret från webbklienten.

1. Visa innehållet i lagret på de olika lagerhyllorna.
1. Lägg till en ny produkt på en lagerhylla med ett visst antal.
1. Uppdatera antalet produkter som ligger på lagerhyllan.



### Krav 2 {#k2}

I webbklienten kan man hantera sin order och dess orderrader och "beställa" sin order.

Det skall finnas en webbsida som visar en komplett order, inklusive orderstatus, kunddetaljer och orderrader. Visa även en summa som säger antalet orderrader.

I terminalklienten kan man skapa en plocklista som visar att respektive beställd produkt finns i lagret (eller inte).

Gör en webbsida som visar plocklistan för ordern. Visa tydligt om det finns tillräckligt med produkter på lagret och vilka hyllor de finns på.

I terminalklienten kan man skicka en order, ange att den är skickad. När ordern skeppas iväg så minskas innehållet i lagret med de produkter som skickas till kund.

Gör så att man kan skicka ordern från webbklienten. Det kan vara lämpligt att "skicka/skeppa ordern" när plocklistan visas.

Lagret skall inte kunna bli negativt när en order/plocklista "skickas/skeppas".



#### Självtest krav 2 {k2test}

Följande är förslag till hur du själv kan testa delar av kravet.

1. Skapa en order, lägg till orderrader (med nya/befintliga produkter).
2. Visa översyn av order i webbklienten.
3. Visa/skapa en plocklista i terminalklienten.
4. Visa samma plocklista i webbklienten och se tydligt om det finns tillräckligt med produkter i lagret, för varje orderrad.
5. Ändra status på ordern till skickad, via webbklienten.
6. Dubbelkolla att lagret har minskat med motsvarande antal produkter.



### Krav 3 {#k3}

När en leverans skickas, så genereras automatiskt en faktura som innehåller pris per orderrad och ett totalpris på ordern.

Fakturan innehåller bara de delar som kunde skeppas från plocklistan.

I webbklienten kan man få se alla detaljer om fakturan, dess id, alla fakturarader, priset per fakturarad och det summerade priset samt datum då ordern skickades. Man kan också se status på fakturan, om den är betald eller ej.

I terminalklienten finns ett kommando `payed <invoiceid> <date>` där man kan ange en faktura som betald.



#### Självtest krav 3 {k3test}

Följande är förslag till hur du själv kan testa delar av kravet.

1. Skapa en order och skeppa en plocklista.
2. I webbklienten, kontrollera att fakturan innehåller rätt detaljer.
3. I terminalklienten, ange fakturan som betald.
4. I webbklienten, visa att fakturans status är uppdaterad till "betald".



Redovisning (obligatorisk) {#redovisning}
--------------------------------------------------------------------

När du är klar med allt du avser lämna in, skriv då redovisningstexten enligt följande. De delar som berör projektet skriver du endast om du genomfört projektet.

1. På din redovisningssida, skriv följande:

    1. Skriv ett stycke om hur programmeringstentan gick att genomföra. Var tentan lätt eller svår? Tog det lång tid, stressigt? Vad var svårt och vad gick lätt? Var det en bra och rimlig examination för kursen?

    1. För varje projektkrav du implementerat, dvs 1-3, skriver du ett textstycke om ca 5-10 meningar där du beskriver vad du gjort och hur du tänkt. Poängsättningen tar sin start i din text så se till att skriva väl för att undvika poängavdrag. Missar du att skriva/dokumentera din lösning så blir det 0 poäng. Du kan inte komplettera en inlämning för att få högre betyg.

    1. Om du gjort projektet så skall du även spela in en redovisningsvideo som ett komplement till din redovisningstext och därmed underlätta rättningen av ditt projekt. I videon visar du tydligt vilka krav du löst och hur du löst dem.

    1. Skriv ett stycke om hur projektet gick att genomföra. Berätta om problem/lösningar/strul/enkelt/svårt/snabbt/lång tid, etc. Var projektet lätt eller svårt? Tog det lång tid? Vad var svårt och vad gick lätt? Var det ett bra och rimligt projekt som avslutning på kursen?

    1. Avsluta med ett sista stycke med dina tankar om kursen och vad du anser om materialet och handledningen (ca 5-10 meningar). Ge feedback till lärarna och förslå eventuella förbättringsförslag till kommande kurstillfällen. Är du nöjd/missnöjd? Kommer du att rekommendera kursen till dina vänner/kollegor? På en skala 1-10, vilket betyg ger du kursen?

1. Ta en kopia av texten på din redovisningssida och kopiera in den på läroplattformen Canvas. Glöm inte länka till din me-sida.

1. Publicera till studentservern och se till att samtliga kursmoment validerar.

```bash
# Ställ dig i kursrepot
dbwebb publish me
```

<!-- dbwebb inspect kmom10 -->
