---
author:
    - atb
    - mbo
    - mos
    - lew
revision:
    "2019-12-09": "(A, lew) Första versionen."
    "2018-12-04": "(PA1, mos) Arbetskopia."
...
Kmom07/10: Projekt och examination
==================================

[WARNING]

**Kursutveckling pågår**

Kursen planeras ge hösten 2020.

[/WARNING]

Detta kursmoment avslutar och examinerar kursen.

Upplägget är enligt följande:

* _Projektet och redovisning (20-80h)_

Totalt omfattar kursmomentet (07/10) ca 20+20+20+20 studietimmar.



Bedömning och betygsättning {#bedomning}
--------------------------------------------------------------------

När du lämnat in projektet bedöms det tillsammans med dina tidigare redovisade kursmoment och du får ett slutbetyg på kursen. Läs om [grunderna för bedömning och betygsättning](kurser/bedomning-och-betygsattning).



Projektspecifikation {#projspec}
--------------------------------------------------------------------

Utveckla och leverera projektet enligt följande specifikationen. Saknas info i specen så kan du själv välja väg, dokumentera dina val i redovisningstexten.

De tre första kraven är obligatoriska och måste lösas för att få godkänt på uppgiften. De två sista kraven är optionella krav. Lös de optionella kraven för att samla poäng och därmed nå högre betyg. Om grundkraven inte når 30 poäng får man komplettera sin inlämning. Man kan inte komplettera sig till ett högre betyg.

Krav 1-3 (Grundkraven) ger max 10 poäng styck, totalt är det 30 poäng.  
Krav 4 (Optionellt) ger max 15 poäng.  
Krav 5 (Optionellt) ger max 15 poäng.  



### Kataloger för redovisning {#var}

Uppdatera materialet så du har den senaste versionen:

```
# stå i kursmappen
$ dbwebb update
```

Samla alla dina filer för projektet i ditt kursrepo under `me/kmom10`.

Redovisningstexten skriver du som vanligt i `me/redovisa`.

Börja med att kopiera in applikationen till arbetsmappen och installera de nödvändiga paketen:

```
# stå i kursmappen
$ cp -rf example/itsec-proj me/kmom10/
$ cd me/kmom10/itsec-proj
$ docker-compose up
```

Om du inte har en fungerande Dockermiljö kan du installera paketen med `$ npm install`.  
Starta sedan med `$ npm start`

Applikationen hittar du sedan på *localhost:1337*.



### Krav 1, 2, 3 Sårbarhetsanalys {#k1}

* Gör en sårbarhetsanalys av applikationen och mappa den mot OWASP's top 10 lista. För godänt ska minst 5 st sårbarheter identifieras. Skriv ner analysen i `kmom10/sårbarhetsanalys.pdf`.

* Implementera testfall för sårbarheterna ca 3-5 per sårbarhet. Använd gärna ett godtyckligt paket från `npm`. *Tips: Mocha*

* Laga de sårbarheterna du hittat. Skriv ned ett par rader om hur du lagade varje sårbarhet.




### Krav 4 Loggning (optionell) {#k4}

Implementera funktionalitet för loggning av data. Fundera över vad du väljer att logga och motivera dina val i din redovisningstext. Varför väljer du just den datan? Vad valde du bort och varför?



### Krav 5 OAuth (optionell) {#k5}

Implementera inloggning via Oauth2. Se till att stöda minst två tjänster, tex Facebook och Google. Skriv ett par rader om hur det påverkar säkerheten med applikationen.



Redovisning {#redovisning}
--------------------------------------------------------------------

1. På din [redovisningssida](./../redovisa), skriv följande:

    1. För varje krav du implementerat, dvs 1-5, skriver du ett textstycke om ca 5-10 meningar där du beskriver vad du gjort och hur du tänkt. Poängsättningen tar sin start i din text så se till att skriva väl för att undvika poängavdrag. Missar du att skriva/dokumentera din lösning så blir det 0 poäng. Du kan inte komplettera en inlämning för att få högre betyg.

    1. Skriv ett allmänt stycke om hur projektet gick att genomföra. Problem/lösningar/strul/enkelt/svårt/snabbt/lång tid, etc. Var projektet lätt eller svårt? Tog det lång tid? Vad var svårt och vad gick lätt? Var det ett bra och rimligt projekt för denna kursen?

    1. Avsluta med ett sista stycke med dina tankar om kursen och vad du anser om materialet och handledningen (ca 5-10 meningar). Ge feedback till lärarna och förslå eventuella förbättringsförslag till kommande kurstillfällen. Är du nöjd/missnöjd? Kommer du att rekommendera kursen till dina vänner/kollegor? På en skala 1-10, vilket betyg ger du kursen?

2. Ta en kopia av texten på din redovisningssida och kopiera in den på Canvas/redovisningen. Glöm inte länka till din me-sida och projektet.

3. Se till att samtliga kursmoment validerar.

```bash
# Ställ dig i kursrepot
dbwebb publish me
```
