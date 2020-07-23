---
views:
    flash:
        region: flash
        template: default/image
        data:
            src: "image/snapvt18/bank2-account-actions.png?w=1100&h=300&cf&c=600,270,0,0&f=edgedetect"
author: mos
revision:
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

Alla delar i detta kursmoment skall utföras individuellt och självständigt.

Upplägget är enligt följande:

* [Tentamen "programmeringstenta" (obligatorisk)](#tentamen)
* [Projekt "eshop3" (optionell)](#projekt)
* [Redovisning (obligatorisk)](#redovisning)

Totalt omfattar kursmoment 07/10 i storleksordningen 20--40 studietimmar.



Bedömning och betygsättning {#bedomning}
--------------------------------------------------------------------

Tentamen rättas och bedöms när den lämnats in.

När du lämnar in redovisningstexten slutbedöms din insats på kursen och du får ett slutbetyg på kursen.

Inlämning av projektet måste ske samtidigt som du lämnar in redovisningstexten, annars kommer projektet ej att bedömas.

Läs hur betyget sätts i [grunder för bedömning och betygsättning (tentamen + projekt)](kurser/faq/bedomning-och-betygsattning-tentamen-och-projekt).



Tentamen "programmeringstenta" (obligatorisk) {#tentamen}
--------------------------------------------------------------------

Du måste nå ett godkänt betyg på tentamen. Om du missar tentamen så kan du göra omtentamen eller resttentamen vid senare tillfälle alternativt omregistrera dig på nästa kurstillfälle.

Du kan få maximalt 30 poäng om du löser alla uppgifter på tentamen. Du behöver minst 60% för att bli godkänd.

Med en godkänd tentamen kan du nå ett slutbetyg om E-C.



### Planerade tentamen {#planerade}

Följande tentamen är planerade ([se även den rekommenderade studieplanen](./../#studieplan)).

* Tenta (kmom10/try1): Torsdagen den 26:e mars, 2020.
* Omtenta (kmom10/try2): Fredagen den 29:e maj, 2020.
* Resttenta (kmom10/try3): Fredagen den 28:e augusti, 2020.

För campus mellan 9-14 i sal H430/H429. För distans 9-24. Ingen anmälan krävs.

Nästkommande tillfällen sker i samband med kurstillfället som är planerat till läsperiod 3, vårterminen 2021.

Du kan även se planeringen för dessa tentamen via `dbwebb exam ls`.



### Genomförande {#genomfor}

Tentamen sker vid ett bokat tillfälle under en dag. Campusstudenter har en bokad sal på campus 9-14. Distansstudenter har en hemtentamen som skall utföras någon gång med start mellan 9-24.

Tiden för tentamen är begränsad till 5 timmar. Om du har rätt till utökad tid vid tentamen så meddelar du läraren och bifogar underlag.

Lärare är normalt tillgängliga för frågor under 9-17, lärarstöd under 17-24 är inte garanterat.

Du får ha tillgång till internet, ditt kursrepo och all kod du skrivit under kursen. Du gör uppgiften på din egen dator, i ditt kursrepo.

Du jobbar individuellt och självständigt och tar inte hjälp av någon. Generella förtydligande kan du få av lärare i salen eller via chatt/forum.

Verktyget `dbwebb exam` används tillsammans med kursrepot för att checka ut och lämna in din tentamen. Du kan, och bör, förbereda dig genom att läsa [hur du checkar ut och lämnar in din tentamen](./tentamen).

Det är fritt att förbereda sig inför tentamen, efter bästa förmåga.



### Förbered via tidigare tentamen {#tidigare}

Du kan träna på tidigare tentamen för att få övning och en känsla av vilken typ av uppgifter och struktur du kan förvänta dig.

Det finns ingen garanti för att nya tentamen kommer att följa exakt samma upplägg som tidigare tentamen. Oavsett det så bedömmer läraren att de tidigare tentamen som finns tillgängliga nedan är relevanta övningsobjekt.

Följande gamla tentor finns tillgängliga, de senaste tentorna är ofta mest relevanta.

* 2020
    * [Rock](./tentamen/rock)

* 2019
    * [Pingis](./tentamen/pingis)
    * [Bibliotek](./tentamen/bibliotek)
    * [Säkerhetspolisens (SÄPO)](./tentamen/sapo)

Här följer en del äldre tentor från 2017-18. De är relevanta som övningstentor, även om de delvis skiljer sig i det upplägg som används från 2019 och framåt. Observera att poängfördelningen är olika för nedan tentor.

* [En japansk smakresa, 31 augusti 2018](./tentamen/en-japansk-smakresa)
* [Det stora slaget om tårtan, 31 maj 2018](./tentamen/det-stora-slaget-om-tartan)
* [Upplevelse, 21 mars 2018](./tentamen/upplevelse)
* [Lucifer Morningstar, 24 november 2017](kurser/dbjs-v1/examination/lucifer)
* [Hotel Paradise, 5 maj 2017](kurser/dbjs-v1/examination/paradise)
* [Mannsmandel, 12 april 2017](kurser/dbjs-v1/examination/mannsmandel)

Du kan checka ut ett par av ovan tentamen via `dbwebb exam checkout prep`, de sparas då i katalogen `me/kmom10/prep` och du kan använda `dbwebb exam` som vid en vanlig tentamen. Läsa om [hur du checkar ut och lämnar in din tentamen med `dbwebb exam`](./tentamen).



Projekt "eshop3" (optionell) {#projekt}
--------------------------------------------------------------------

Projektet är optionellt och kan hjälpa dig att nå ett högre betyg (D-A) på kursen.

Projektet skall lösas individuellt och självständigt, oavsett om du tidigare jobbat i grupp när du löst `eshop1` och `eshop2`.

Varje krav är värt maximalt 10 poäng om kravet är löst till fullo utan brister. Totalt omfattar projektet maximalt 30 poäng.

Spara alla filer i `me/kmom10/eshop3`.

Du måste lösa krav 1 innan du kan lösa krav2 eller 3.



### Krav 1 {#k1}

Följande krav måste vara uppfylla
Ditt eshop3 skall uppfylla de krav som finns för ehop1 och eshop2.

Du har följande filer med relevant innehåll:

* `package.json`
* `config/db/eshop.json`
* `sql/eshop/{backup,setup,ddl,insert}.sql`
* `{index,cli}.js`

Webbklienten innehåller en sida `eshop/about` som visar namnen på de som jobbat på projektet i eshop1 och eshop2 samt vem som utfört uppgiften i eshop3. Terminalklienten har kommandot `about` som visar samma information.

I webbklienten skall `eshop/log` visa de 20 senaste händelserna i loggtabellen. Det skall finnas ett formulärelement där användaren kan skriva in en söksträng som filtrerar vilka rader som visas i utskriften.

I terminalklienten skall kommandot `logsearch <str>` ge samma svar som ovan.

I webbklienten, gör så att man kan klicka på en kategori och sedan visas de produkter som finns i kategorin.

I webbklienten, gör så att man kan koppla en produkt till en eller flera produktkategorier.



#### Självtest krav 1 {k1test}

Följande är förslag till hur du själv kan testa delar av kravet.

Lägg till och hantera en produkt i webbklienten.

1. Lägg till, redigera en produkt.
2. Lägg produkt i flera kategorier.
3. Se produktöversikten och produkten skall synas med sina kategorier.
4. Visa kategorier, klicka på en kategori, produkterna skall synas.

I terminalklienten.

1. Lägg till produkten på ett par hyllor i lagret.
2. Se att produkten finns i lagret på rätt hyllor med rätt antal.
3. Plocka bort ett visst antal av produkten från någon av lagerhyllorna.



### Krav 2 {#k2}

I webbklienten kan man hantera sin order och dess orderrader och "beställa" sin order.

Det skall finnas en webbsida som visar en komplett order, inklusive orderstatus, kunddetaljer och orderrader.

I terminalklienten kan man skapa en plocklistan som visar att respektive beställd produkt finns i lagret.

Gör en webbsida som visar plocklistan för ordern. Visa tydligt om det finns tillräckligt med produkter på lagret och vilka hyllor de finns på.

I terminalklienten kan man skicka en order, ange att den är skickad. När ordern skeppas iväg så minskas innehållet i lagret med de produkter som skickas till kund.



#### Självtest krav 2 {k2test}

Följande är förslag till hur du själv kan testa delar av kravet.

1. Skapa en order, lägg till orderrader (med din nya produkt, och befintliga produkter).
2. Visa översyn av order inklusive information om orderstatus, orderrader och kunddetaljer på en webbsida.
3. Visa/skapa en plocklista i terminalklienten.
4. Visa samma plocklista i webbklienten och se tydligt om det finns tillräckligt med produkter i lagret, för varje orderrad.
5. Ändra status på ordern till skickad, via terminalklienten.
6. Dubbelkolla att lagret har minskat med motsvarande antal produkter.



### Krav 3 {#k3}

När en leverans skickas, så genereras automatiskt en faktura som innehåller pris per orderrad och ett totalpris på ordern.

I webbklienten kan man få se alla detaljer om fakturan, dess fakturarader, priset per fakturarad och det summerade priset samt datum då ordern skickades. Man kan också se status på fakturan, om den är betald eller ej.

I terminalklienten finns ett kommando `payed <invoiceid> <date>` där man kan ange en faktura som betald.



#### Självtest krav 3 {k3test}

Följande är förslag till hur du själv kan testa delar av kravet.

1. Skapa och skeppa en order.
2. I webbklienten, kontrollera att fakturan innehåller samma saker som ordern inklusive prisdetaljer och fakturastatus.
3. I terminalklienten, ange fakturan som betald.
4. I webbklienten, visa att fakturans status är uppdaterad till "betald".




<!--

Styr upp så redovsiningstexten är separat för projektet och för examinationen samt slutrapporten för hela kursen. Eller hur det nu skall vara. Man måste i texten se hur många poäng som de fick för projektet.

Egentligen borde det finnas ytterligare ett ladokmoment för projektet (kanske).

Använd HAVING i examinationsuppgiften, samt union.

-->

<!--

Eventuellt krav till projektet.

* Jobba med kategorierna i webbklienten, lägg till kategorier, koppla produkt till kategorier

* Lös restnoteringar i lagret.
* Snygg samlad utskrift av order, plocklista, faktura
* Skapa fakturor
* Tänk streckkod där lagerpersonal läser av att en produkt flyttas från leverans inkommande till lager och från lager till kundorder för leverans utgående.

-->


<!--

Svara på följande frågor i redovisningstexten.
Man kan skriva redovisningstexten innan man utför tentan.

* Nu när kursen närmar sig slutet, hur är din relation till:
    * SQL, ER, MySQL/MariaDB
    * JavaScript, Node och Express?
* Se tillbaka på de kmom du gjort, känner du att du har koll på databas nu, eller känner du att något saknas eller finns något du vill lära dig mer om?

-->

<!--

Gör megavalidering som avslutning, påverka betyget.

-->


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
