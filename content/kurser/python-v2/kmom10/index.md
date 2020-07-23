---
author:
    - mos
    - aar
    - efo
revision:
    "2020-06-02": (M, aar) Try3.
    "2019-11-25": (L, aar) Ändrade datum för omexamination.
    "2018-12-10": (k, efo, aar) Översyn och släpp inför python-v2 try3.
    "2018-12-10": (j, efo, aar) Översyn och släpp inför python-v2 try2.
    "2018-09-28": (j, efo, aar) Översyn och släpp inför python-v2 try1.
    "2018-06-26": (I, efo) Ändrade till individuell examination.
    "2018-06-08": (prel, mos) Nytt dokument inför uppdatering av kursen.
    "2017-09-27": (H, aar) Uppdaterade krav 6, tog bort curses.
    "2017-06-22": (G, aar) Minskade antalet rum till 5 och la till fusk kommando.
    "2016-10-13": (F, mos) Bort med gammalt stycke om curses och tillåt väderstreck.
    "2015-08-25": (E, mos) Uppgraderade till dbwebb v2.
    "2015-02-12": (D, mos, Sylvanas) Uppdaterade krav 6 och 5 (tog bort curses).
    "2015-01-08": (C, mos) Bort blå ruta med kursutveckling pågår.
    "2014-11-19": (B, mos) Tog bort `s` från kommandot se, det var duplicerat.
    "2014-11-12": (A, mos) Första versionen till python ht14.
...
Kmom10: Individuell examination
==================================

Detta kursmoment avslutar och examinerar kursen.

<!-- ctr+d efter "try3" och "2020-06-10" för ny examination -->

Upplägg {#upplagg}
--------------------------------------------------------------------

<!-- Den individuella examinationen genomfördes den 2019-10-28. Omexamination genomfördes 2019-01-10. **Restexamination genomförs den 2019-06-10**. -->

Du använder dbwebb-kommandorads verktyget för att hämta din individuella examinations uppgift och för att rätta, validera och lämna in dina lösningar. Redovisning kan lämnas in dagen efter examinationen. Det är för att ni ska få en dag på er att göra er redovisning.

Inlämning på [Canvas och redovisning](#redovisning) behövs inte göras inom dessa fem timmar.

För båda studentgrupper är detta en **individuell** examination och uppgifterna ska lösas på egen hand.

Lärarteamet finns tillgängliga i gitter för hjälp med tekniska problem samt frågor och förtydliganden.

Nedanför beskriver vi upplägget för de olika studentgrupperna:

### Campus studenter {#campus}
Examination sker på valfri plats, det går att ladda ner examination från kl 8:00 till 23:59. När du har hämtat hem examinationen har du fem timmar på dig att göra klart den och lämna in.
<!-- Examination sker i sal H429, H430 och G404 mellan 8:00 och 13:00. -->

### Distansprogram och kurspakets studenter {#distans}
Examination sker på valfri plats, det går att ladda ner examination från kl 8:00 till 23:59. När du har hämtat hem examinationen har du fem timmar på dig att göra klart den och lämna in.



Hämta examinationstillfälle 2020-06-10 (try3) {#hamta}
----------------------------------------------------------------------

I [Om examination med dbwebb exam](kurser/python-v2/kmom10/om) finns mer information om `dbwebb exam`-verktyget.

Innan du kör kommandon nedan uppdatera `dbwebb` och kursrepot samt skapa kataloger i din me katalog med följande kommandon.

```bash
# stå i kursrepot dbwebb-kurser/python
dbwebb selfupdate # eventuellt behövs sudo eller admin rättigheter
dbwebb update
dbwebb init
```


För att skapa din individuella examination skriv in följande kommando.

```
dbwebb exam checkout try3
```

Materialet till din individuella examination ligger nu i din kurskatalog i `me/kmom10/try3` enligt följande.

| Fil                | Innehåll                                                              |
|--------------------|-----------------------------------------------------------------------|
| `assignments.md` | Beskrivning av examinationen och de uppgifter som skall göras, öppna och läs via en texteditor. I Atom kan du använda kortkommandot `Ctrl-Shift-m` för att se markdown preview.              |
| `exam.py`        | Här skall du skriva din kod för att lösa respektive uppgift i examinationen. Du kan köra programmet genom kommandot `python3 exam.py` |



Rätta din examination (try3) {#ratta}
----------------------------------------------------------------------

För att rätta din individuella examination och visa hur många uppgifter du har klarat och dina poäng använd följande kommando.

```bash
dbwebb exam correct try3
```

Längst upp i utskriften finns en sammanfattning av vilka uppgifter du har löst och hur många poäng du har.

Under sammanfattningen finns en utskrift från testprogrammet som körs när examinationen rättas. I denna utskrift kan du få hinter om vad som är fel med din inlämning enligt testprogrammet.
Du kan ignorera fel från uppgifter du inte utfört.


Validera din examination (try3) {#validera}
----------------------------------------------------------------------

Precis som tidigare inlämningar i kursen ska koden validera. `dbwebb validate try3` validerar din individuella examination och visar vilka valideringsfel du har i koden. Din individuella examination skall validera när den lämnas in inom tidsramen för den individuella examinationen.



Lämna in din examination (try3) {#lamna}
----------------------------------------------------------------------

För att  lämna in din individuella examination använd följande kommando.

```bash
dbwebb exam seal try3
```

Kommandot publicerar hela din me-katalog till studentservern.

Du kan när som helst hämta ett kvitto på din pågående examination och se detaljer om den, till exempel hur länge du hållit på.

```bash
dbwebb exam receipt try3
```



Bedömning och betygsättning {#bedomning}
--------------------------------------------------------------------

Det finns ett särskilt dokument som beskriver hur [bedömning och betygsättning sker](kurser/faq/bedomning-och-betygsattning-individuell).

Under hela examinationen kan du köra kommandot `dbwebb exam correct try3` för att rätta dina lösningar och se hur många poäng du har uppnått.



Redovisning {#redovisning}
--------------------------------------------------------------------

Efter din individuella examination lämna in en redovisningstext på din me-sida och via Canvas uppgiften 'Individuell examination'. I redovisningstexten skriv följande:

1. För varje uppgift du implementerade, dvs 1-5, skriver du ett textstycke om minst 5 meningar där du beskriver den tekniska implementationen.

2.  Skriv ett allmänt stycke om hur den individuella examinationen gick att genomföra. Problem/lösningar/strul/enkelt/svårt/snabbt/lång tid, etc. Var den individuella examinationen lätt eller svår? Vad var svårt och vad gick lätt? Var den individuella examinationen en bra och rimlig examination av denna kursen?

3. Avsluta med ett sista stycke med dina tankar om kursen och vad du anser om materialet och handledningen (ca 5-10 meningar). Ge feedback till lärarna och förslå eventuella förbättringsförslag till kommande kurstillfällen. Är du nöjd/missnöjd? Kommer du att rekommendera kursen till dina vänner/kollegor? På en skala 1-10, vilket betyg ger du kursen?

4. <u><b>Detta gäller alla studenter!</b></u> Kompletterar redovisningstexten med att spela in en kort video där de visar kod och berättar om de tekniska implementationerna de gjorde i den individuella examinationen. Lägg till en länk till videon i redovisningstexten på inlämningen på Canvas.



Förberedelse {#forberedelse}
----------------------------------------------------------------------

Du har innan examinationen möjlighet att förbereda dig genom att göra en test examination.

Innan du kör kommandon nedan uppdatera `dbwebb` och kursrepot samt skapa kataloger i din me katalog med följande kommandon.

```bash
# stå i kursrepot dbwebb-kurser/python
dbwebb selfupdate # eventuellt behövs sudo eller admin rättigheter
dbwebb update
dbwebb init
```

Test examinationen fungerar på liknande sätt som den riktiga individuella examinationen. Du kan hämta hem den med följande kommando:

```bash
dbwebb exam checkout prep
```

Materialet till din individuella examination ligger nu i din kurskatalog i `me/kmom10/prep` enligt följande.

| Fil                | Innehåll                                                              |
|--------------------|-----------------------------------------------------------------------|
| `assignments.md` | Beskrivning av examinationen och de uppgifter som skall göras, öppna och läs via en texteditor. I Atom kan du använda kortkommandot `Ctrl-Shift-m` för att se markdown preview.              |
| `exam.py`        | Här skall du skriva din kod för att lösa respektive uppgift i examinationen. Du kan köra programmet genom kommandot `python3 exam.py` |



Rätta förberedelse uppgiften {#rattningfor}
----------------------------------------------------------------------

`dbwebb exam correct prep` rättar din förberedelse uppgift och visar hur många uppgifter du har klarat och dina poäng.

`dbwebb validate prep` validerar din förberedelse uppgift.

`dbwebb exam seal prep` lämnar in din förberedelse uppgift.



Tidigare examinationer {#tidigare}
----------------------------------------------------------------------

Inga genomförda än för HT19.
<!-- `try1` genomfördes 2018-10-30, uppgifter och lösningsförslag finns tillgängligt i exempel-mappen, `example/old_exams/lp1-2018`.

`try2` genomfördes 2019-01-10.

`try3` genomfördes 2019-06-10. -->



Omexamination {#omexamination}
----------------------------------------------------------------------
Som student har du rätt till tre examinationstillfällen med andra ord om du inte klarar första har du två försök till på dig.
Följande tillfällen erbjuds efter 2019-10-28:

Omexaminationstillfälle fredagen den 2020-01-09.

Restexaminationstillfälle onsdagen den 2020-06-10.
