---
author: mos
revision:
    "2021-10-12": "(C, mos) Uppdaterad inför webtec v1."
    "2020-10-14": "(B, mos) Förtydligade att man skall använda databasfilen nvm2."
    "2018-10-12": "(A, mos) Första ugåvan inför ht18 och htmlphp v3."
...
Kmom10: Appendix 2 Projekt NVM
==================================

Projektet heter Nättraby Vägmuseum (NVM). Projektet innebär att du skall utveckla och leverera en webbplats till en kund. Du får tillgång till en databas som innehåller material samt bilder. Det finns en befintlig webbplats som du kan hämta inspiration ifrån men din uppgift är att bygga en bättre webbplats.

Här kan du läsa mer om kunden och webbplatsen.

<!--more-->



Översikt {#oversikt}
--------------------------------------------------------------------

Det finns en projektspecifikation som beskriver vad du skall göra och vad din leverans skall innnehålla.

Det finns innehåll som du skall använda i din webbplats. Innehållet består av bilder i filer och en databas med artiklar. Artiklarna är dels generella och dels visar de upp objekten i vägmuseet. Allt innehåll är förpackat i kursrepot i en exempelmapp i kursrepot.

Utmaningen är att bygga en webbplats med innehåll och funktioner som specificerats samt att göra en styling som matchar webbplatsens profil. Använd det du hittills lärt dig i kursen så kommer det att gå utmärkt.

**Lycka till och kämpa väl!**



Kund: Nättraby Vägmuseum {#kund}
--------------------------------------------------------------------

Vi betraktar Nättraby Vägmuseum som vår kund. Bakom dem finns Nättraby Hembygdsförening.

Redan 1995 kläckte journalisten Peter Öjerskog från Karlskrona idén om ett vägmuseum i det fria i Nättraby. Förslaget mottogs positivt men det omfattande arbetet med att göra Karlskrona till marint världsarv kom emellan.

2006 kontaktade Nättraby Hembygdsförening med ordförande Ingegerd Holm i spetsen återigen Peter Öjerskog. En styrgrupp och en referensgrupp bildades för Nättraby Vägmuseum. Huvudintressenter är Nättraby Hembygdsförening, Karlskrona kommun, Vägverket, länsstyrelsen i Blekinge och Blekinge Museum.

Nättraby Vägmuseum är ett friluftsmuseum där befintliga vägmiljöer används. Den informella rastplatsen vid E22 avfart 61 till Nättraby används som centralplats för vägmuseet.

Idag är det webbplatsen [Nättraby Vägmuseum](http://nattrabyvagmuseum.se/) som visar upp museets innehåll.

Vi har fått tillstånd att använda materialet från deras webbplats som underlag till vårt projekt. Materialet vi har, i form av texter och bilder, är nedladdat från deras webbplats.



#### Museets objekt {#objekt}

Nättraby Vägmuseum består av 14 utvalda vägmiljöer i Nättraby socken. Vägmiljöerna är:

* 01 Hålvägen – stigen
* 02 Via Regia – landsvägen
* 03 Värendsvägen – handelsvägen
* 04 Skillinge – övergivna vägen
* 05 Milstolparna – vägmärkena
* 06 Ryttarliden – namnminnet
* 07 Riks 4 – gatstensvägen
* 08 E22 – motorvägen
* 09 Cykelvägen – bilfria vägen
* 10 Kustbanan – järnvägen
* 11 Krösnabanan – smalspåret
* 12 Nättrabyån – vattenvägen
* 13 Isvägen – vintervägen
* 14 Stenbron – vägen över vatten

Dessa kallar vi objekt, eller museets utställningsobjekt.



Innehåll till NVM {#innehall}
--------------------------------------------------------------------

Det finns fördefinerat innehåll som skall finnas på NVM. Innehållet består av följande delar.

* Generella artiklar
* Artiklar om utställningsobjekten
* Bilder

Allt innehåll är samlat i kursrepots exempel-katalog i `example/nvm`. Du kan kopiera allt innehåll från den katalogen.

I katalogen finns följande.

| Fil/katalog        | Beskrivning |
|--------------------|-------------|
| `img/orig`         | Orginalbilder från webbplatsen. |
| `img/[250,500,800]` | Bilder skalade till upplösningar max bredd eller höjd 250px, 500px och 800px. |
| `img/[80x80,150x150]` | Bilder skalade till upplösningar max bredd/höjd 80x80px, 150x150px. |
| `db/nvm.sqlite`    | Databasfil som innehåller artiklar, objekt och information. |



NVM Style och Layout {#style}
--------------------------------------------------------------------

Styla webbplatsen och ge den en style och profil som du anser stämmer överens med webbplatsens syfte. Kunden vill att du gör en personlig style, du har fria händer, gör den mörk eller ljus, glad eller sorgsen, traditionell eller provocerande. Ingen style är fel, men, komponera färg, form, typsnitt, texturer och bilder för att forma ett helhetsintryck som avspeglar webbplatsens syfte och tanke.

Det handlar om att vårda ett kulturarv genom att skapa intresse. För att skapa intresse måste man ibland sticka ut näsan och riskera att bli bränd. Ta en risk. Gör det.
