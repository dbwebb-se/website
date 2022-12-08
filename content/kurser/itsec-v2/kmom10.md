---
author:
    - atb
    - mbo
    - mos
    - nik
    - grm
revision:
    "2022-12-04": "(C, grm) Uppdaterad inför HT22."
    "2020-12-10": "(B, nik) Uppdaterad inför HT20."
    "2019-12-09": "(A, lew) Första versionen."
    "2018-12-04": "(PA1, mos) Arbetskopia."
...
Kmom07/10: Projekt och examination
==================================

<!-- [WARNING]
Kursen uppdateras inför HT22. Är "gula rutan" borta är det fritt fram att börja.
[/WARNING] -->

Detta kursmoment avslutar och examinerar kursen.

**Du jobbar enskilt och tar inte hjälp av någon.**

Upplägget är enligt följande:

* _Projektet och redovisning (30-80h)_

Totalt omfattar kursmomentet (07/10) ca 30+25+25 studietimmar.



Bedömning och betygsättning {#bedomning}
--------------------------------------------------------------------

När du lämnat in projektet bedöms det tillsammans med dina tidigare redovisade kursmoment och du får ett slutbetyg på kursen. Läs om [grunderna för bedömning och betygsättning](kurser/faq/bedomning-och-betygsattning-quiz). I detta projekt har krav 4-6 slagits ihop till 2 lite större krav, krav 4 och krav 5.



Projektspecifikation {#projspec}
--------------------------------------------------------------------

Utveckla och leverera projektet enligt följande specifikationen. Saknas info i specen så kan du själv välja väg, dokumentera dina val i redovisningstexten.

De tre första kraven är obligatoriska och måste lösas för att få godkänt på uppgiften. De två sista kraven är optionella krav. Lös de optionella kraven för att samla poäng och därmed nå högre betyg. Om grundkraven inte når 30 poäng får man komplettera sin inlämning. Man kan inte komplettera sig till ett högre betyg.

Krav 1-3 (Grundkraven) ger max 10 poäng styck, totalt är det 30 poäng.  
Krav 4 (Optionellt) ger max 15 poäng.  
Krav 5 (Optionellt) ger max 15 poäng.   
<!-- Krav 6 (Optionellt) ger max 10 poäng. -->



### Kataloger för redovisning {#var}

Uppdatera materialet så du har den senaste versionen:

```bash
# Stå i rooten av kursrepot
$ dbwebb update
```

Samla alla dina filer för projektet i ditt kursrepo under `me/kmom10`.

Börja med att kopiera in applikationen till arbetsmappen och installera de nödvändiga paketen:

```bash
# Flytta till kurskatalogen
$ rsync -ravd example/eshop-app2 me/kmom10/
$ cd me/kmom10/eshop-app2
$ docker-compose up -d
```

Om du inte har en fungerande Dockermiljö kan du installera paketen med `composer install`.

### Krav 1, 2, 3: Sårbarhetsanalys {#k1}

* Gör en sårbarhetsanalys, enligt samma kravspecifikation som i kmom04. För godkänt ska minst 5 st sårbarheter identifieras. Spara sårbarhetsanalysen i `kmom10/sårbarhetsanalys.pdf`.

* Implementera testfall för sårbarheterna ca 3-5 per sårbarhet. 
    * Det går att använda valfri "testsuite", men rekommendationen ligger på PHPUnit tillsammans med `make test` eller `composer test` (mer om Composer Script [här](https://getcomposer.org/doc/articles/scripts.md#writing-custom-commands)).
    * Dokumentera i redovisningstexten vad du valde och hur man kör testerna. Notera även PHP-version du använder om du kör utanför Docker.

* Åtgärda de sårbarheterna du hittat. Utöka din analys på samma sätt som i kmom05.

### Krav 4: Loggning (optionell) {#k4}

Implementera loggning av data i applikationen ni gör en sårbarhetsanalys på. Fundera över vad som bör loggas och motivera dina val i din redovisningstext. Varför valde du just den datan? Vad valde du bort och varför?

För att få 10 poäng så behöver du logga, motivera och dokumentera data från 3 olika händelser eller incidenter. För att få 15 poäng behöver du göra något extra:   

* antingen använda något loggverktyg likt Apache log och beskriv hur loggarna ska analyseras och användas.   

* eller utred och implementera skydd mot 'log injection'.   

* eller beskriv i ord hur personalen som administrerar eshopen ska övervaka datan du loggat, kanske visa den på en webbsida, hur ofta ska loggen övervakas, vilka ska informeras om något inträffar.   

### Krav 5: Privacy (optionell) {#k5}

Sätt er in i situationen att ni sitter på ett företag som får följande uppdrag:

Kunden *Infopedia* har insett att de börjat tappa användare för deras bristande fokus på privacy. De anlitar er för att göra en förberedande rapport som går igenom vad som är viktigt att tänka på inom privacy, varför det är viktigt och hur man kan gå tillväga för att uppnå det.

*Infopedia* jobbar huvudsakligen med projekt/kunder i Europa så rapporten måste täcka GDPR. De är speciellt nyfikna på vad autentisering & behörighet (authentication & authorization) innebär och tror att den största risken är 'Broken Access Control'. Stämmer det eller vad kommer du fram till i din utredning?

De vill gärna att samtliga inom företaget ska gå igenom dokumentet och vill därför att längden på det ska vara **1-3 sidor**. Rapporten ska ha referenser till relevant information inom ämnet. (För 10 poäng)

För att få 15 poäng, så ska **vetenskapliga källor (minst 2)** bidra till minst två stycken i rapporten. BTH's bibliotek har bra information om vad som kan vara en vetenskaplig länk, se i [Ämnesguide Datavetenskap & Datorsäkerhet](https://www.bth.se/bibliotek/amnesguider/amnesguide-datorsakerhet/).

Spara rapporten i `kmom10/privacy.pdf`.

<!-- ### Krav 6: Quiz (optionell) {#k6}

Gör Kmom07/10 quiz enligt instruktionerna i quizet. -->

<!-- ### Krav 5 Säkerhet (optionell) {#k5}

**UTANFÖR SCOPE AV KURSEN?**

Kunden *SafeSecurity* vill att ni ska kolla på ett av följande tre typer av it-system och motivera vilken typ av data de behöver lagra, varför den behövs och hur man bör lagrar informationen.

* Banksystem (Swedbank/Nordea eller ännu större, Visa/Mastercard)
* Eshop (Amazon, Ebay)
* Vårdinrättningar (1177, region Blekinge)

Tänk bortom kunddata, vad behövs loggas för att garantera att systemet fungerar, att ingen obehörig får åtkomst till information de inte ska få läsa. -->



Redovisning {#redovisning}
--------------------------------------------------------------------

1. I textfältet på Canvas, skriv följande:

    1. För varje krav du implementerat, dvs 1-5, skriver du ett textstycke om ca 5-10 meningar där du beskriver vad du gjort och hur du tänkt. Poängsättningen tar sin start i din text så se till att skriva väl för att undvika poängavdrag. Missar du att skriva/dokumentera din lösning så blir det 0 poäng. Du kan inte komplettera en inlämning för att få högre betyg.

    1. Skriv ett allmänt stycke om hur projektet gick att genomföra. Problem/lösningar/strul/enkelt/svårt/snabbt/lång tid, etc. Var projektet lätt eller svårt? Tog det lång tid? Vad var svårt och vad gick lätt? Var det ett bra och rimligt projekt för denna kursen?

    1. Avsluta med ett sista stycke med dina tankar om kursen och vad du anser om materialet och handledningen (ca 5-10 meningar). Ge feedback till lärarna och förslå eventuella förbättringsförslag till kommande kurstillfällen. Är du nöjd/missnöjd? Kommer du att rekommendera kursen till dina vänner/kollegor? På en skala 1-10, vilket betyg ger du kursen?

2. Glöm inte länka till projektet.

3. Se till att allt är publicerat.

```bash
# Ställ dig i kursrepot
dbwebb publish me
```

4. Redovisningsvideo med dig (facecame) och ditt id eller redovisning på plats (hör av dig så bestämmer vi tid). Redovisningen ska vara 7-10 minuter lång och innehålla din sårbarhetsanalys med den sammanfattande tabellen av sårbarheter du hittat och med vilken metod. Berätta vilken testmetod du valt, testverktyg och testfall. Visa hur du kör dina testfall. Visa den sammanfattande tabellen med åtgärderna du gjort och gärna kod (vad har du gjort för åtgärd i koden). Om du gjort de optionella kraven, så får du ett par minuter extra per krav för att visa vad du gjort.
