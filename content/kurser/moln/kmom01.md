---
author:
  - efo
revision:
    "2023-12-14": (B, efo) Bytte från VirtualBox till Docker inför VT24.
    "2021-11-30": (A, efo) Första utgåvan för kursen VT22.
...
Kmom01: Virtualisering med Docker
==================================

Vi ska i detta kursmoment titta på hur vi kan installera ett annat operativsystem på din dator med hjälp av virtualiseringsprogramvaran Docker. Vi kommer använda sedan använda det som en webbserver.

Detta tillvägagångssätt heter virtualisering och är en viktig del av hur molnet är uppbyggt. Virtualisering gör det möjligt att ha många "små datorer" på en stor och kraftfull server.



<!--more-->



Labbmiljön  {#labbmiljo}
---------------------------------

Kolla igenom [labbmiljön](./../labbmiljo/inledning) som behövs för kursen. Se till att du har de verktyg som efterfrågas under "Verktyg (alla kurser)" och "Verktyg (kmom01)".



Kurslitteratur {#litteratur}
----------------------------

Kurslitteraturen i kursen är boken "What is the cloud?" av Bill Laberis. Boken är en kort introduktion till vad Cloud är och kan med fördel läsas i början av kursen.

Du kommer åt den boken via biblioteket på BTH. Gå till [https://bibliotek.bth.se/databases?q=o%27reilly](https://bibliotek.bth.se/databases?q=o%27reilly) och välj O'reilly. Du ska nu kunna söka på "What is the cloud?" i Sökrutan och första träffen är kurslitteraturen.



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

### Förberedelser {#forberedelser}

I kursen kommer vi behöva en katalog för att spara filer och kod. Jag rekommenderar att ni skapar den i er hemmakatalog och döper den till `moln`. Jag kommer i kursmaterialet referera tillbaka till denna katalog som "katalogen".



### Övningar {#ovningar}

Övningar förbereder inför de uppgifter som ska lämnas in.

1. Om du inte redan gjort det installera Docker som en del av [labbmiljön](kunskap/installera-virtualiseringsmiljon-docker).

1. Det finns en [guide för Docker](guide/docker) där vissa relevanta delar tas upp.
   - [Introduktion](guide/docker/introduktion)
   - [Kom igång](guide/docker/kom-igang)
   - [Volymer](guide/docker/volymer)
   - [Dockerfile](guide/docker/bygga-image)
   - [Apache och virtual hosts](guide/docker/apache-vh)



### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och lämnas in. Uppgifterna får utföras tillsammans i par. Skriv en kommentar i Canvas med namn på eventuell samarbetsstudent.

1. Gör uppgiften [Skapa en webbserver i Docker](uppgift/1311_skapa-en-webbserver-i-docker).



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

Läs [instruktionen om hur du skall redovisa](./../redovisa).

**Redovisningen görs individuellt.**

Se till att följande frågor besvaras i redovisningstexten:

1. Vad är fördelen med virtualisering med Docker?
1. Vi använder Apache som applikationsserver på vår "server". Vad är ditt första intryck av klient/server-modellen vi har använt i detta kursmoment?

TIL är en akronym för “Today I Learned” vilket leksamt anspelar på att det finns alltid nya saker att lära sig, varje dag. Man brukar lyfta upp saker man lärt sig och där man kanske hajade till lite extra över dess nyttighet eller enkelhet, eller så var det bara en ny lärdom för dagen som man vill notera.

3. Vilken är din TIL för detta kmom?
