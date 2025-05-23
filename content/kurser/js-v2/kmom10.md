---
author: lew
revision:
  "2024-12-12": (D, lew) Uppdaterad inför ht24.
  "2023-12-06": (C, lew) Uppdaterad inför ht23.
  "2022-12-08": (B, lew) Uppdaterad inför ht22.
  "2021-12-10": (A, lew) Uppdaterad inför ht21.
...

# Kmom10: Projekt och examination

<!-- [WARNING]
Kursmomentet är under uppdatering och är klart när den här gula rutan är borta.
[/WARNING] -->

Detta kursmoment avslutar och examinerar kursen.

Upplägget är enligt följande:

- Projektet och redovisning (20-80h)

Totalt omfattar kursmomentet (07/10) ca 20+20+20+20 studietimmar.

<!--more-->

## Bedömning och betygsättning {#bedomning}

När du lämnat in projektet bedöms det tillsammans med dina tidigare redovisade kursmoment och du får ett slutbetyg på kursen. Läs om [grunderna för bedömning och betygsättning i kursen js](kurser/faq/bedomning-och-betygsattning-js).

### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[Intelligenstest](https://github.com/dbwebb-se/js-v2/blob/master/components/10/01_project.md)". Spara koden i `public/`.

## Redovisning {#redovisning}

1\. På din redovisningssida, skriv följande:

1.1. För varje deltest du implementerat, dvs 1-6, skriver du ett textstycke om ca 5-10 meningar där du beskriver vad du gjort och hur du tänkt. Poängsättningen tar sin start i din text så se till att skriva väl för att undvika poängavdrag. Missar du att skriva/dokumentera din lösning så blir det 0 poäng. Du kan inte komplettera en inlämning för att få högre betyg.

1.2. Skriv ett allmänt stycke om hur projektet gick att genomföra. Problem/lösningar/strul/enkelt/svårt/snabbt/lång tid, etc. Var projektet lätt eller svårt? Tog det lång tid? Vad var svårt och vad gick lätt? Var det ett bra och rimligt projekt för denna kursen?

1.3. Avsluta med ett sista stycke med dina tankar om kursen och vad du anser om materialet och handledningen (ca 5-10 meningar). Ge feedback till lärarna och förslå eventuella förbättringsförslag till kommande kurstillfällen. Är du nöjd/missnöjd? Kommer du att rekommendera kursen till dina vänner/kollegor? På en skala 1-10, vilket betyg ger du kursen?

2\. Ta en kopia av texten på din redovisningssida och kopiera in den på Canvas. Glöm inte länka till din me-sida.

3\. Se till att samtliga kursmoment validerar.

### Krav på videon (distans, KP) {#krav-video}

1. Börja med att visa upp en idhandling och ditt ansikte så vi vet att du är du.

2. Berätta om projektet och visa upp vad du har gjort. Kör igenom kraven.

3. Lyft fram delar i koden som du har jobbat mycket med eller som du är stolt över. Visa att du har kontroll över koden.

4. Försök hålla presentationen som en demo i arbetslivet, det är bra träning.

5. Sikta på 4-5 minuter.

6. Lägg till videon som en kommentar i Canvas eller på annat ställe där den är skyddad, lägg inte upp den på Youtube. **Dubbelkolla så länken till videon fungerar.**

### Krav på presentation (campus) {#krav-pres}

1. Berätta om projektet och visa upp vad du har gjort.

2. Lyft fram delar som du har jobbat mycket med eller som du är stolt över.

3. Försök hålla presentationen som en demo i arbetslivet, det är bra träning.

4. Sikta på 4-5 minuter.



### Validera din kod {#validate}

Du validerar koden med npm scripten:

```console
$ cd me
$ npm run eslint --what=public
$ npm run stylelint --what=public
$ npm run htmlhint --what=public
```


### Publicera {#publish}

Glöm inte att publicera kursmomentet.

```bash
# Ställ dig i kurskatalogen
$ dbwebb publish public
```
