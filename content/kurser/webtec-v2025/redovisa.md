---
author:
    - mos
revision:
    "2022-09-01": (G, mos) Ändrad till 15-20 meningar i storlek.
    "2021-06-14": (F, mos) Uppdaterad inför webtec.
    "2020-08-28": (E, mos) Ny video som visar inlämningen.
    "2018-08-16": (D, mos) Bort redovisning i forum samt bytte ITs mot Canvas.
    "2017-06-15": (C, mos) Nytt stycke om feedback.
    "2015-08-06": (B, mos) Var man sparar redovisningstexter i kursrepot.
    "2015-03-17": (A, mos) Första utgåvan för htmlphp kursen.
...
Resultat och redovisning
==================================

Som ett sista steg i varje kursmoment skall du redovisa. Gör så här.

<!--more-->



Skriv redovisningstext {#text}
---------------------------------------

Skriv en redovisningstext för att besvara frågor och redovisa dina reflektioner från kursmomentet. Läs gärna hur du kan skriva [en bra redovisningstext](kurser/faq/att-skriva-en-bra-redovisningstext).

Du skriver din redovisningstext i `me/report`.

Besvara de specifika frågor som finns för varje uppgift och kursmoment.

Reflektera över svårigheter, problem, lösningar, erfarenheter, lärdomar, resultatet, etc.

Kan du koppla och jämföra (reflektera) dina lärdomar från nuvarande kursmoment mot andra kursmoment, kurser eller andra lärdomar du har sedan tidigare?

Skriv ett stycke om totalt 15-20 meningar för varje kursmoment. Försök väva in frågorna i löpande text.



Ladda upp och publicera din kurskatalog {#repo}
---------------------------------------

Ladda upp din kurskatalog med alla dina övningar genom att göra följande kommandon i terminalen.

```bash
# Gå till din kurskatalog
dbwebb publish me
```

Den länken som visas i utskriften av kommandot, är länken till din me-sida. Där kan du se ditt publicerade resultat.

Rätta eventuella fel som dyker upp. Det som du laddar upp måste vara felfritt.



Testa din inlämning {#testa}
---------------------------------------

Du kan själv testköra rättningsprocessen via följande kommando.

```text
dbwebb test kmom01
```

Byt ut kmom01 mot det kursmoment du vill inspektera.

Den som rättar och kontrollerar din inlämning utgår från ovan kommando.

Du kan själv provköra och se samma resultat som rättaren ser. Det är en mycket god idé att alltid testköra sin inlämning på samma sätt som rättaren gör. Du sparar tid genom att själv upptäcka eventuella slarvfel.



Lämna in på Canvas {#canvas}
---------------------------------------

Lämna in en länk till din rapport-sida på Canvas. Länken innehåller din studentakronym och på det viset hittar rättaren din inlämning.

Det är bra om du också kopierar in din redovisningstext in i Canvas, det kan vara bra att ha som backup om något händer.

Läraren kommer snabbt kolla igenom din redovisningstext och uppgifterna. Betyg är G (godkänd) eller U/komplettera (komplettera → gör om → gör bättre). Bedömningen baseras på din redovisningstext samt att du har fullgjort kursmomentets uppgifter.



Feedback och frågor {#feedback}
---------------------------------------

[Vilken feedback kan jag förvänta mig](kurser/faq/vilken-feedback-far-man-pa-inlamningarna)?

Ställ dina frågor och funderingar i de kanaler som erbjuds i kursen. Se till att du får dina frågor besvarade. Fråga igen om något är oklart. Se till att din fråga alltid blir besvarad.



Klart! {#klar}
---------------------------------------

Ta en kort mental paus innan du ger dig på nästa kursmoment.

<!--
Kika gärna på Andreas video när han rättar valideringsfel, kör inspect och lämnar in kmom01 genom att publicera till studentservern och lämna in på Canvas. Videon är för python-kursen men samma handhavande gäller i htmlphp, det är bara andra programmeringsspråk.

[YOUTUBE src=-7Wzi_IkpEU width=630 caption="Andreas visar hur man lämnar in kmom01 i python-kursen."]
-->
