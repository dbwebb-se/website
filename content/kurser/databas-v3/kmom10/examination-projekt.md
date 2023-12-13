---
author: mos
revision:
    "2018-02-27": "(A, mos) Första utgåvan."
...
Individuellt projekt
====================================

_Detta dokument gäller studentgruppen som läser enligt kurskoden PA1451 i [kurspaketet webprog](webprog)._

Detta kursmoment avslutar och examinerar kursen.

Upplägget är enligt följande:

* Projektet och redovisning

Totalt omfattar kursmomentet (07/10) i storleksordningen 20*4 studietimmar.



Bedömning och betygsättning {#bedomning}
--------------------------------------------------------------------

När du lämnat in projektet bedöms det tillsammans med dina tidigare redovisade kursmoment och du får ett slutbetyg på kursen.

Inlämningen betygssätts som en **individuell projektinlämning** enligt [grunderna för bedömning och betygsättning vid projektinlämning](kurser/faq/bedomning-och-betygsattning).



Projekt {#projekt}
--------------------------------------------------------------------

Lös uppgiften individuellt.

[Läs i projektspecen](./../projekt-internetbanken) om projektet.

Spara alla filer i katalogen `me/kmom10/proj`.



### Krav 1-2:  {#k1}

Lös uppgiften enligt projektspecen, exklusive räntehanteringen.

Gör minst en applikation som webbaserad och minst en som CLI-baserad.

Resterande applikationer kan lösas med enbart lagrade procedurer, men då krävs det att de är tydligt dokumenterade i ER-dokumentationen.

Databasen skall heta `internetbanken` och användaren user:pass skall ha full tillgång till databasen.

SQL-filer sparar du som vanligt i `sql/ddl.sql` och `sql/insert.sql`.

Din CLI startas via filen `cli.js`.

Din webbklient startas via filen `index.js`.

Detaljer för att koppla sig mot databasen delas av klienterna och sparas i `config/internetbanken.json`.

Alla externa beroenden installeras via `package.json`.



###Krav 3: {#k3}

ER-dokumentationen sparar du i `doc/er.pdf`.

Den som testar kommer att läsa dokumentationen för att se hur dina applikationer skall användas. Det är viktigt att du är tydlig och beskriver hur de används.

När du löst saker med lagrade procedurer behöver du ange hur de skall användas.



###Krav 4: (optionellt) {#k4}

Lös kraven som rör räntehanteringen.



###Krav 5: (optionellt) {#k5}

Lös samtliga krav/applikationer med CLI och/eller webbklient.



###Krav 6: (optionellt) {#k6}

Skydda webbklienten via en inloggning där du sparar användare och lösenord i databasen och använder sessioner.



<!--
Exportera till Excelark
Login m session
Flash, felhantering med session.
-->



Redovisning {#redovisning}
--------------------------------------------------------------------

1\. På din redovisningssida, skriv följande:

1.1. För varje krav du implementerat skriver du ett textstycke om ca 5-10 meningar där du beskriver vad du gjort och hur du tänkt. Poängsättningen tar sin start i din text så se till att skriva tydligt för att undvika poängavdrag. Missar du att skriva/dokumentera din lösning så blir det 0 poäng. Du kan inte komplettera en inlämning för att få mer poäng.

1.2. Skriv ett allmänt stycke om hur projektet gick att genomföra. Problem/lösningar/strul/enkelt/svårt/snabbt/lång tid, etc. Var projektet lätt eller svårt? Tog det lång tid? Vad var svårt och vad gick lätt? Var det ett bra och rimligt projekt för denna kursen?

1.3. Avsluta med ett sista stycke med dina tankar om kursen och vad du anser om materialet och handledningen (ca 5-10 meningar). Ge feedback till lärarna och förslå eventuella förbättringsförslag till kommande kurstillfällen. Är du nöjd/missnöjd? Kommer du att rekommendera kursen till dina vänner/kollegor? På en skala 1-10, vilket betyg ger du kursen?

2\. Ta en kopia av texten på din redovisningssida och kopiera in den på Its/redovisningen. Glöm inte länka till din me-sida och projektet. 

3\. Ta en kopia av texten från din redovisningssida och gör ett inlägg i [kursforumet](forum/utbildning/databas) och berätta att du är klar.

4\. Se till att kursrepot validerar och publicera.

```bash
# Ställ dig i kurskatalogen
dbwebb publish me
```
