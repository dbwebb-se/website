---
author: aar
revision:
    "2022-10-07": "(A, aar) Skapad inför HT22."
...
Kmom10: Projekt och examination
==================================

[WARNING]

**Kursutveckling pågår inför hösten 2022. Använd inte materialet innan denna rutan är borttagen.**

[/WARNING]

Detta kursmoment avslutar och examinerar kursen.

Upplägget är enligt följande:

* Projektet och redovisning (20-60h)

Totalt omfattar kursmomentet (07/10) ca 20+10 studietimmar. Du kan själv styra din arbetsinsats genom att välja vilka optionella delar du utför.



Förutsättning {#pre}
--------------------------------------------------------------------

Du jobbat igenom föregående kursmoment.



Bedömning och betygsättning {#bedomning}
--------------------------------------------------------------------

När du lämnat in projektet bedöms det tillsammans med dina tidigare redovisade kursmoment och du får ett slutbetyg på kursen. Läs om [grunderna för bedömning och betygsättning](kurser/bedomning-och-betygsattning).



Projektidé och upplägg {#upplagg}
--------------------------------------------------------------------

Du ska utveckla ett program för att öva på att skriva snabbt på ett tangentbord. Det finns många webbsidor som erbjuder det redan, t.ex. [https://www.typingtest.com/], men vi ska skapa ett program för terminalen. **PS** Det finns inga tester för projektet. Det är upp till er att tolka och implementera kraven.

LÄGG IN VIDEO PÅ FÄRDIGT PROGRAM!!!



Projektspecifikation {#projspec}
--------------------------------------------------------------------

Utveckla och leverera projektet enligt följande specifikationen. Saknas info i specen så kan du själv välja väg, dokumentera dina val i redovisningstexten.

De tre första kraven är obligatoriska och måste lösas för att få godkänt på uppgiften. De tre sista kraven är optionella krav. Lös de optionella kraven för att samla poäng och därmed nå högre betyg.

Varje krav ger max 10 poäng, totalt är det 60 poäng.

Lägg din kod i `kmom10/typing`. Din kod ska validera i python för att få godkänt.

### Krav 1 {#k1}

`main.py`. kod i funktioner, inte globalt. minst 2 moduler


#### Validera och kompabilitet {#validera}

Koden 


#### Väl fungerande webbplats {#fungera}

Webbplatsen skall fungera utan brister, brustna länkar, korrekt skalning av bilder, det skall inte finnas onödiga horisontella skrollbars och webbplatsen skall "hålla ihop".

Med andra ord, det skall vara en bra webbplats och fungera som man förväntar sig, utan uppenbara brister.



#### Responsiv webbplats {#responsiv}

Din webbplats skall vara responsiv för att stödja att visas på små/stora enheter.

Det är okey om responsiviteten inte är helt komplett. Men det måste finnas grundläggande element av responsivitet som är implementerade i webbplatsen.

Till exempel bör bilder vara responsiva, tillsammans med header, footer och de sidor som är uppdelade i kolumner. Navbaren bör vara responsiv i rimlig mån, men det är inget hårt krav.



#### Kodstruktur och dokumentation {#kodstruktur}

Gör ytterligare en sida till din webbplats, denna sida skall innehålla dokumentation av din webbplats. Du behöver inte lägga denna sidan i navbaren, men det måste finnas en länk till dokumentationssidan från din om-sida.

I sidan skriver du om följande.

1. Berätta om din kodstruktur som ligger bakom din webbplats. Berätta hur du tänkte när du organiserade din kod för webbplatsen.
1. Berätta hur väl din sida fungerar responsivt.
1. Ge förslag på ett par förbättringar du ser att man skulle kunna göra på din webbplats, i ett fiktivt vidareutvecklingsprojekt.



### Krav 4: Sök och navigera (optionell) {#k4}

Förbättra användarens möjilghet att navigera på din webbplats och finna informationen. Användarens upplevelse, User Experience (UX), är en viktig ingrediens när man bygger flödet i webbplatsen.

Lägg till en sökfunktion och gör det enkelt att navigera mellan objekten med en länk till "Nästa objekt" och "Föregående objekt".

1. Gör en sökfunktion där man kan söka bland objekt och artiklar. När sökresultatet kommer upp så kan man klicka på ett objekt eller artikel för att komma vidare till en sida där enbart det valda objektet/artikeln visas.

2. Gör så att man enkelt kan titta över objekten med en länk till "nästa objekt" och "föregående objekt". Det kan då bli enkelt att navigera mellan objekten.



### Krav 5: Galleri av bilder (optionell) {#k5}

Skapa en egen sida med ett galleri som visar bilderna som är kopplade till objekten.

Använd inte JavaScript. Gör en lösning baserad på serversidan och PHP.

Visa mindre bilder (thumbnails) på alla bilder. Välj att visa 4 bilder (välj själv antal) på en sida. Det skall finnas en länk "Nästa >" för att visa nästa 4 bilder, och föregående "< Föregående" 4 bilder. Användaren kan klicka runt och med enkelhet se alla bilder i arkivet, sida för sida.

Om man klickar på en bild så leder den länken till att enbart bilden visas, antingen i en webbsida, eller bara som ren bild direkt i webbläsaren.



### Krav 6: Administrativt gränssnitt (optionell) {#k6}

Skapa ett gränssnitt för webbplatsens administratör. Följande delar skall finnas med.

1. Administratören kan logga in på webbplatsen för att komma åt de administrativa funktionerna. Använd *admin admin* och *doe doe* som användare och lösenord.

2. Det skall gå att editera webbplatsens innehåll (artiklar/objekt) som ligger lagrat i databasen. Det skall gå att lägga till och ta bort innehåll.



Redovisning {#redovisning}
-------------------------------------------------------------------

1. På din [redovisningssida](./../redovisa), skriv följande:

    1. För varje krav du implementerat, dvs 1-3, 4, 5, 6, skriver du ett textstycke om ca 5-10 meningar där du beskriver vad du gjort och hur du tänkt. Poängsättningen tar sin start i din text så se till att skriva väl för att undvika poängavdrag. Missar du att skriva/dokumentera din lösning så blir det 0 poäng. Du kan inte komplettera en inlämning för att få högre betyg.

    2. Skriv ett allmänt stycke om hur projektet gick att genomföra. Problem/lösningar/strul/enkelt/svårt/snabbt/lång tid, etc. Var projektet lätt eller svårt? Tog det lång tid? Vad var svårt och vad gick lätt? Var det ett bra och rimligt projekt för denna kursen?

    3. Avsluta med ett sista stycke med dina tankar om kursen och vad du anser om materialet och handledningen (ca 5-10 meningar). Ge feedback till lärarna och förslå eventuella förbättringsförslag till kommande kurstillfällen. Är du nöjd/missnöjd? Kommer du att rekommendera kursen till dina vänner/kollegor? På en skala 1-10, vilket betyg ger du kursen?

2. Ta en kopia av texten på din redovisningssida och kopiera in den på Canvas. Glöm inte att bifoga länken till projektet på studentservern.

3. Spela in en redovisningsvideo och lägg länken till videon i en kommentar på din inlämning i Canvas. Detta kan du göra dagen efter projektets deadline. Läs mer om hur du kan [spela in en redovisningsvideo](kurser/faq/slutpresentation).

4. Se till att samtliga kursmoment validerar i "dbwebb test/validate/publish".

```text
# Ställ dig i kursrepot
dbwebb test kmom10
dbwebb publish me
```
