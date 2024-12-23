---
author:
    - nik
    - grm
category: itsec
revision:
    "2022-11-28": (D, grm) Ändrade till minst 6 sårbarheter
    "2022-08-10": (C, grm) Uppdaterad inför ht22
    "2020-12-02": (B, nik) Uppdaterad inför ht20
    "2019-10-11": (A, lew, aurora) First edition.
...

Sårbarhetsanalys {#analys}
==================================

Uppgiften går ut på att analysera en applikation efter sårbarheter. Ni får gärna analysera och hitta sårbarheter två och två men dokumentet, Sårbarhetsanalys, ska lämnas in individuellt.

<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har deltagit i föreläsningen som tillhör kursmomentet.

Du har deltagit i föreläsningarna om Hot och Attacker i förra kursmomentet samt gjort övat på attacker på OWASP Juice shop.

Analys {#analys}
-----------------------

Du ska analysera applikationen utifrån de metoder och tekniker som nämns under föreläsningarna. Utgå ifrån att det är blackbox testing, dvs att du inte har tillgång till koden. Bortse ifrån säkerhetsbrister som baseras på hur miljön är uppsatt, t.ex. att HTTPS inte används i en lokal utvecklingsmiljö.

Applikationen jobbar emot en databas, om du av någon anledning behöver återställa den så är det bara kopiera över den ifrån katalogen example igen. Testa gärna att göra SQL-injektion på databasen med [SQLmap](https://sqlmap.org/). Kanske får du veta vilken databas det är och innehållet med tabeller och data. Det är i vilket fall bra att känna till sqlmap. Det finns en film under kapitlet "Usage" som visar hur sqlmap kan användas.

Prova gärna [Wappalyzer i din webbläsare](https://www.wappalyzer.com/). Det bör ge dig programmeringsspråk och webbserver.

Mall sårbarhetsanalys {#mall}
-----------------------

Det finns en LaTeX mall tillgänglig [här](https://www.overleaf.com/read/mmjgxndgkbkv#674488) som du kan använda. Länken är till en read-only version, för att skapa er egna behöver du vara inloggade och sen trycker du "Menu" och sen "Copy Project". Det går givetvis att använda valfritt program, så länge man uppfyller nedanstående krav:

1. Försättsblad med titel, ert namn och datum.
2. Innehållsförteckning.
3. Sammanfattning av innehållet i analysen.
4. Målet med analysen.
5. En beskrivning av systemet och dess funktionalitet/flöde (mycket kort, ska utökas nästa vecka när du tittar på koden).
6. En metodbeskrivning av hur du gått tillväga för att identifiera sårbarheter.
7. En lista med de sårbarheter du identifierat
    * Risk/sårbarhet (namn)
    * Beskrivning av sårbarheten
    * Allvarlighetsgrad (Sannolikhet \* Risk)
    * Estimerad kostnad att åtgärda (i timmar)
    * OWASP-kategori
8. En överskådlig tabell som presenterar ovanstående lista tillsammans med en rangordning och motiveringen till rangordningen.

Metodbeskrivningen bör visa hur du har gått tillväga, t.ex. om du använt attackträd, use-cases, eller någon annan metodik. Era eventuella attackträd eller visualiseringar ska också tas med i rapporten.

### Applikationen

Börja med att kopiera in mappen med applikationen till er me-katalog:

```bash
# Flytta till kurskatalogen
$ cp -r example/bank-app me/kmom04
```

**OBS - titta inte på koden! Det gör vi i kmom05!**

Gå till me/kmom04/bank-app och kör applikationen lokalt med `npm install && npm start`. Ignorera varningar för "deprecated", de spelar ingen roll.

Om du hellre vill använda docker, så starta applikationen med `docker-compose up -d`. 

### Lämna in

1. Analysera applikationen efter sårbarheter enligt de metoder som nämndes under föreläsningen som  attack träd, penetrationstestning etc. Dokumentera hur du gjorde när du hittade sårbarheten. Du bör hitta minst 6 sårbarheter.

1. Döp analysen till `analys.pdf` och ladda upp på Canvas.

<!-- ```bash
# Flytta till kurskatalogen
$ dbwebb publish me
``` -->

Tips från coachen {#tips}
-----------------------

Gå igenom applikationen som en vanlig användare och bygg upp en visuell bild av hur flödet är. Det är lättare att leta säkerhetsbrister när man vet var de troligen finns. Använd dig gärna av någon eller några av metoderna från föreläsningen som Attackträd, Data flow diagram, Process flow diagram, aktivitetsmatris etc.

Lycka till och hojta till i Discord om du behöver hjälp!
