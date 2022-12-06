---
author:
    - lew
    - duk
    - grm
category: itsec
revision:
    "2022-08-11": (B, grm) Uppdaterad inför HT22.
    "2019-12-06": (A, lew, aurora) First edition.
...

Sårbarhetsanalys - Del 2 {#analys}
========================================

Uppgiften går ut på att du ska, utifrån din tidigare sårbarhetsanalys och dess prioritering, välja ut sårbarheter och åtgärda dem i den mån av tid som finns för kursmomentet.

<!--more-->

Förkunskaper {#forkunksaper}
---------------------------------

Du har utfört uppgifterna [Sårbarhetsanalys](/uppgift/sarbarhetsanalys).

Installation {#installation}
---------------------------------

[INFO]
**Innan du börjar**

Tänk på att återställa din databas om du tagit sönder den i kmom04 (gäller enbart om du kör applikationen utanför Docker)
[/INFO]

```bash
# Flytta till kurskatalogen
$ cp -r example/bank-app me/kmom05
```

*Det går bra att ta bort applikationen från din kmom04 mapp, så slipper du att den tar plats på studentservern*

Uppgifter {#uppgifter}
---------------------------------

Utifrån din rapport, välj ut en sårbarhet och lös följande delar. Återupprepa tills du antingen har löst de sårbarheter du noterat eller tills tiden för kursmomentet tar slut.

### Systemets funktionalitet {#funktionalitet}

Genom att titta igenom koden tar du reda på funktionaliteten/flödet i systemet, Bankappen, och fyller i kapitel 3 i rapporten. Gör gärna ett flödesschema eller någon annan bild som beskriver funktionaliteten/flödet. Fortsätt att jobba med din analysfil från kmom04.

### Uppdatera rapport med testmetod {#uppdatera_metod}

I kapitlet Metod lägger du ett stycke eller ett underkapitel där du beskriver din testmetod, vilken eller vilka testtekniker du använt.

### Uppdatera rapport med testfall {#uppdatera_testfall}

Dokumentera dina tester i ett eget kapitel. Berätta vilka testfall du gjorde och varför. 

### Skriv testfall {#testfall}

Skriv godtyckligt antal testfall (3+) per sårbarhet som demonstrerar hur man kan utnyttja sårbarheten och hur beteendet borde vara när det det fungerar som det ska. Först ska testfallen gå fel, visa rött, och det redovisar du med en skärmdump eller liknande i Appendix. Dessa testfall ska vara gröna när du sedan har åtgärdat sårbarheten. Redovisa även testfallen när de går rätt med en skärmdump eller liknande i Appendix. 

Minimum 9 testfall totalt.

Testerna ska gå att köras via `npm test`. Om testerna körs på ett annat sätt så dokumenterar du det så att det enkel går att köra dina tester.

### Uppdatera rapport med åtgärder {#uppdatera_atgarder}

Lägg till ett nytt kapitel i din rapport ifrån kmom04 där du noterar för varje sårbarhet vilka ändringar du gör och i vilka filer. Inled med ett kort stycke där du berättar hur många sårbarheter du åtgärdade. Var det någon sårbarhet som var svår att lösa antingen att testa eller åtgärda? Skriv en kommentar om det.   
Skapa en ny tabell som sammanfattar vilka sårbarheter du åtgärdat, vad din ursprungliga estimation var och hur lång tid det faktiskt tog att åtgärda. Kommentera dina estimat.

### Åtgärda sårbarheterna {#atgarda}

Åtgärda sårbarheterna. Om du märker av att det behövs fler tester så skriver du dit fler testfall. Kör gärna om alla dina tester när du åtgärdat en sårbarhet så att du inte "lagar sönder" något annat.

Se till att era tester blir gröna med `npm test`.


Publicera {#Publicera}
---------------------------------

```bash
# Flytta till kurskatalogen
$ dbwebb publish me
```
