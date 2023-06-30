---
author:
    - aar
revision:
    "2023-06-15": (B, aar) Bytt från redovisningstext till quiz.
    "2021-06-18": (A, aar) Första utgåva för automaträttning.
...
Lämna in och redovisa
==================================

Som ett sista steg i varje kursmoment skall ni lämna in veckans uppgifter. Gör så här.

<!--more-->

Du kan lämna in hur många gånger som helst, tills du får godkänt. Om du får Ux är det bara att lösa felet och lämna in igen.



Testa uppgifterna {#test}
---------------------------------------

När du känner att du är klar med uppgifterna ska du köra testerna som finns för dem. Varje kmom består av en större uppgift och en lab. Till de större uppgifterna har vi skrivit tester som kollar att er kod uppfyller kraven som står i uppgiftsbeskrivningen. Om de testerna inte passerar kommer er inlämning inte rättas. Därför ska ni alltid köra dem innan ni lämnar in.

Kör testerna med kommandot `dbwebb test` på kursmomentet du lämnar in. Du kan [läsa mer om dbwebb test](dbwebb-cli/python) och hur du kan använda det.

```bash
# Gå till din kurskatalog
dbwebb test <kmom> # ersätt med ditt kmom, t.ex. kmom01. dbwebb test kmom01
```

Det kommandot kommer validera din kod, rätta labben och uppgiften. Om allt blir grönt är du klar och redo att ladda upp koden. Om någon del är röd behöver du göra om den delen, köra om testerna och kolla att det är grönt. När det är grönt är du redo att skriva redovisningstext.



Ladda upp och publicera din kurskatalog {#repo}
---------------------------------------

Ladda upp din kurskatalog med alla dina övningar genom att göra följande kommandon i terminalen.

```bash
# Gå till din kurskatalog
dbwebb publish me
```

Den **länken** som visas i utskriften av kommandot, är länken till din **me-sida**. Där kan du se ditt publicerade resultat.

Rätta eventuella fel som dyker upp. Det som du laddar upp skall vara felfritt.



Lämna in på Canvas {#canvas}
---------------------------------------

Gå till kursens sida på [Canvas](https://www.bth.se/canvas/) och utför det quiz med samma namn som kursmomentet du ska lämna in. Lämna sen in uppgiften, i textrutan skicka med länk till din me-sida, den som skrivs ut när du gör `dbwebb publish`. Nu är det bara att vänta på att det rättas.



Hur rättas min inlämning? {#umbridge}
---------------------------------------

Efter att du har gjort en inlämning på Canvas kommer, inom några minuter, vårt [Umbridge](coachen/umbridge) system att ladda ner din kod och köra `dbwebb test` på den. Om alla tester går igenom kommer Umbridge sätta betyget `PG` (Preliminärt Godkänt) på inlämningen. Om testerna inte går igen får du betyget `Ux` (komplettera → gör om → gör bättre). Din inlämning kommer inte rättas när den har betyget Ux. Då ska du kolla loggen som Umbridge skickar med och fixa felet som visas och sen lämna in igen på Canvas. Om ni anser att Umbridge har gett er ett felaktigt Ux, kontakta kursansvarig.

Inlämningar med betyg PG går rättarna så småningom igenom. När en rättar kollar på en inlämning läses loggen från Umbridge och den inlämnade koden. Om allt ser bra ut sätter de betyget `G` (Godkänt). Då är det kursmomentet helt klar. Om rättaren tycker något ser konstigt/fel ut sätter de betyget Ux och skriver vad ni behöver förbättra för att få godkänt.

Kolla på videon [i slutet](#klart) om du vill se ett exempel.



Feedback och frågor {#feedback}
---------------------------------------

[Vilken feedback kan jag förvänta mig](kurser/faq/vilken-feedback-far-man-pa-inlamningarna)?

Ställ dina frågor och funderingar i chatten. Se till att du får dina frågor besvarade. Fråga igen om något är oklart.



Klart! {#klar}
---------------------------------------

[YOUTUBE src=hRqoy8UXD_o width=630 caption="Andreas visar hur man lämnar in ett kmom."]

Ta en kort mental paus innan du ger dig på nästa kursmoment.
