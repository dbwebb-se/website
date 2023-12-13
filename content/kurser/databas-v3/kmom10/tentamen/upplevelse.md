---
author:
    - mos
category:
    - kurs databas
    - examination
revision:
    "2018-03-20": "(A, mos) Examinationen 21 mars 2018."
...
Examination 21 mars 2018
=======================================

Detta är den individuella examinationen som är en del av kmom07-10.

Examinationen pågår 9-14 och uppgifterna skall lösas individuellt och du får inte prata, diskutera eller chatta med någon för att ta hjälp. Fråga läraren om något är oklart med uppgifterna.

Övriga hjälpmedel är tillåtna, inklusive egen dator, access till Internet och tillgång till tidigare kursmoment och ditt kursrepo.

Du behöver samla ihop **minst 10 poäng för att få godkänt** på detta examinationsmomentet. Samla fler poäng för att nå ett högre slutbetyg på kursen.

<!--more-->

Gör en `dbwebb update` innan du börjar.

Spara all kod i `me/kmom10/exam`.

Missa inte att läsa sista stycket om hur du skall lämna in din examination.



Inledning {#inledning}
---------------------------------------

Du har fått i uppdrag av kunden "MoC (Morgan & Ola-Conny)" att utveckla en upplevelseagentur med en stark webbshop där de kan sälja sina resor till jordens alla hörn.



Uppgift 1 10p (obligatorisk) {#u1}
---------------------------------------

Bygg en databas med en webbklient och en terminalklient.



### Filheader med ditt namn och akronym {#filheader}

I varje fil du skapar (`*.sql` och `*.js`) så lägger du en kommentar överst, som en header i filen. I kommentaren skriver du ditt namn, akronym och datum så det är tydligt att det är din fil.



### Filer för databasen {#databasfiler}

I filen `sql/setup.sql` lägger du kod för att skapa databasen `exam` och för att ge tillgång till användaren `user` med lösenordet `pass`.

I filen `sql/ddl.sql` lägger du alla SQL DDL som skapar databasens schema.

I filen `sql/insert.sql` lägger du SQL INSERT för att fylla upp databasen.

Skriver du mer SQL-kod så lägger du den i `sql/dml.sql`. Det är bra att spara på kod, man vet aldrig när man vill titta tillbaka på den.

Samtliga filer skall gå att köra i en sekvens, för att återskapa databasen.

Använd kommentarer för att göra koden snygg och ordningsam.



### Upplevelser {#tabellupplevelse}

MoC vill marknadsföra sig och erbjuda en sida där de visar alla de resor de varit på. Skapa en tabell och lägg in varje resa/avsnitt från säsong 1 som rader i tabellen.

[Du hittar informationen på Wikipedia](https://sv.wikipedia.org/wiki/En_stark_resa_med_Morgan_%26_Ola-Conny).

**Tabellen** bör innehålla säsongens nummer/titel, avsnitt, datum, sträng som anger titel på avsnittet/resmålen.

Gör en **lagrad procedur** som visar innehållet från tabellen (`SELECT *`).

När tabellen är klar så bygger du en **terminalklient** som visar upp tabellens innehåll och skriver ut dess innehåll i en fint formatterade textbaserad tabell.

Din terminalklient bygger du med ett menysystem och kommandot för att skriva ut säsongerna är `season`. Din terminalklient innehåller även kommandon för att visa menyn `menu` och för att avsluta `exit`.

Man startar terminalklienten via `cli.js`.

MoC gillar vad de ser och ber dig bygga en **webbklient** som listar samma innehåll i en webbsida, fint uppstyrt i en tabell.

I webbklienten gör du även en framsida som representerar deras upplevelseagentur. Alla sidorna på webbplatsen har en gemensam header, footer och navbar.

Man startar webbklienten via `index.js`.

Terminalklienten och webbklienten använder samma gränssnitt (samma kodbas) mot databasen och det är den lagrade proceduren som används.



### Länder och resmål {#resmal}

MoC gillar vad de ser och ber om ytterligare en webbsida i **webbklienten** som listar alla länder/städer de besökt inklusive en länk till resmålets wikipediasida.

Du skapar en **tabell** för resmålen och sparar namnet på resmålet (land eller stad) och en länk till dess wikipediasida.

Du skapar en **lagrad procedur** som skriver ut alla resmålen tillsammans med länken till wikipediasidan.

Du lägger till kommandot `destination` i **terminalklienten** som skriver ut en fin tabell med alla destinationer.



### Länka mellan avsnitt och resmål {#lankaresmal}

MoC gillar återigen vad de ser, men undrar om man inte kan koppla samman informationen från de båda tabellerna och visa i en gemensam rapport.

Något i stil med följande.

| Säsong  | Avsnitt | Datum | Resmål (sträng) | Resmål land + länk |
|---------|---------|-------|-----------------|--------------------|
| SE01 En stark resa | E01 | 2 april 2012 | London, Storbritannien | Storbritannien https://sv.wikipedia.org/wiki/Storbritannien |
| SE01 En stark resa | E02 | 9 april 2012 | Gran Canaria, Spanien | Spanien https://sv.wikipedia.org/wiki/Spanien |

Du ser att här behövs en **kopplingstabell**, en tabell som kan länka mellan ett avsnitt (upplevelsetabellen) och dess resmål. Du skapar en sådan tabell och du nöjer dig att länka _ett avsnitt_ till _ett resmål/land_.

Du inser att ett avsnitt kan ha flera resmål, men du undviker den svårighetsnivån, för tillfället.

Du skapar en ny **webbsida** som visar din rapport med klickbara länkar till landet för resmålet.

Du använder en **lagrad procedur** för att generera rapporten från databasen.



Uppgift 2 10p (optionell) {#u2}
---------------------------------------

MoC börjar få mycket information i sin databas och vill ha en funktion som erbjuder sökning/filtrering vid utskrifterna.

Du uppdaterar **terminalklienten** med en sökfunktion för upplevelser/avsnitten via `season <search>`.

Du lägger till en sida i **webbklienten** som erbjuder ett formulär som låter dig söka bland resmålen.



Uppgift 3 20p (optionell) {#u3}
---------------------------------------

MoC vill kunna uppdatera informationen på sin webbplats. Du bygger **CRUD** till dem så de kan uppdatera upplevelserna/avsnitten och resmålen via **webbklienten**.



Inlämning {#inlamning}
---------------------------------------

Lämna in genom att göra dbwebb publish och passera utan fel.

Dubbelkolla din inlämning genom att köra dbwebb inspect. Du kan inte se att det är rätt men du kan se att alla filer som förväntas vara med finns där.

När du är klar, maila mos@bth.se och ange ditt namn och länken till ditt publicerade kursrepo.
