---
author: mos
revision:
    "2022-08-26": (L, aar) Bytte ut vag redovisningsfråga till tydligare.
    "2020-03-30": (K, moc) Flyttade Funktioner från 04 till 03 inför V4 HT21.
    "2020-09-04": (J, aar) Släppt för HT20.
    "2020-05-15": (I, aar) Flyttade Funktioner från 03 till 04 inför V3 HT20.
    "2018-06-18": (H, aar) Flyttade moduler till kmom04.
    "2018-06-08": (prel, mos) Nytt dokument inför uppdatering av kursen.
    "2017-06-14": (G, efo) Ändrade kursliteratur till funktioner i kmom03, la till övningar.
    "2016-03-15": (F, mos) Tog bort videoserie MonkeyLords och NewBoston.
    "2016-02-22": (E, mos) Lade till videoserien "Lär dig Python".
    "2015-01-08": (D, mos) Bort blå ruta med kursutveckling pågår.
    "2014-10-01": (C, mos) Ändrade länken till redovisa-instruktionen.
    "2014-09-08": (B, mos) Första publika releasen.
    "2014-08-27": (A, mos) Första utgåvan för python kursen.
...
Kmom03: Funktioner och moduler
==================================

I detta kursmoment ska vi kolla på hur vi kan strukturera koden så den blir mer effektiv och mer lättläst. Du introduceras till funktioner och hur de kan underlätta för att återanvända koden och moduler för att strukturera koden i flera filer. Vi kommer i övningar och uppgifter träna på hur vi skriver funktioner med och utan argument och hur vi skickar tillbaka data från funktioner. Till slut vidareutvecklar vi Marvin så han kan svara på ännu fler frågor.


[FIGURE src=/image/python/func-module.png?w=w2 caption="Marvin skall nu lära sig lite mer och få en bättre struktur."]

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Läsanvisningar  {#lasanvisningar}
---------------------------------

*(ca: 4-6 studietimmar)*


###Kurslitteratur  {#kurslitteratur}

Läs följande:

1. [Python for Everybody: Exploring data in Python3](kunskap/boken-python-for-everybody-exploring-data-using-python3)
    * Ch4 Functions



###Artiklar {#artiklar}

Det finns inga artiklar.



###Video  {#video}

Titta på följande:

1. Videoserien [Lär dig Python](https://www.youtube.com/playlist?list=PLKtP9l5q3ce93pTlN_dnDpsTwGLCXJEpd) är tätt kopplat till kursmaterialet. Kika på de videor som börjar med 3.

2. De videor som följer med och kompletterar kurslitteraturen.
    * [Python for Informatics: Chapter 4 - Functions part 1](https://youtu.be/5Kzw-0-DQAk?list=PLlRFEj9H3Oj7Bp8-DfGpfAfDBiblRfl5p)
    * [Python for Informatics: Chapter 4 - Functions part 2](https://youtu.be/AJVNYRqn8kM?list=PLlRFEj9H3Oj7Bp8-DfGpfAfDBiblRfl5p)
    <!-- * [Python for Informatics: Chapter 6 - Strings](https://www.youtube.com/watch?v=L2IUSArpG98)
    * [Python for Informatics: Chapter 7 - Files](https://www.youtube.com/watch?v=O0wE2M8-ois) -->



###Lästips {#lastips}

1. Tidigare år har jag gett längre återkoppling på kmom02 inlämningar som studenter har frågat efter. Jag rekommenderar att läsa igenom dem för att se hur man kan lösa sakerna på olika sätt.
    - [labbuppgift 4.2 och menyval A5](https://gist.github.com/AndreasArne/cecb1fb4dbc1ec7c83c57a8d2f678012).
    - [menyval A5 HT21](https://github.com/dbwebb-se/python/issues/51).
    - [menyval A5 HT20](https://github.com/dbwebb-se/python/issues/48).


1. [Think Python: How to Think Like a Computer Scientist](kunskap/boken-think-python-how-to-think-like-a-computer-scientist)
    * Chapter Debugging

1. [Exempel och förklaringar av valideringsfel](https://github.com/dbwebb-se/python/issues/46)



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 12-16 studietimmar)*


###Övningar {#ovningar}

Genomför övningarna för att träna inför uppgifterna.

1. Jobba igenom artikeln/övningen "[Funktioner, argument och returvärden](kunskap/funktioner-argument-och-returvarden)" för att träna på hur du skapar funktioner. De exempelprogram du gör kan du spara i ditt kursrepo under `me/kmom03/functions`.

1. Jobba igenom övningen "[LEGB regeln och scopes i Python](kunskap/legb-regeln-och-scopes)" som handlar hur python hanterar scope och vart variabler är tillgängliga. De exempelprogram du gör kan du spara i ditt kursrepo under `me/kmom03/functions`

1. Jobba igenom artikeln/övningen "[Moduler i Python](kunskap/moduler-i-python)" för att bekanta dig med ett sätt att strukturera koden i Python. De exempelprogram du gör kan du spara i ditt kursrepo under `me/kmom03/functions` då koden bygger på förra övningen.

1. Fortsätt med del 4 och 5 i "[Debugger i Python](kunskap/python-debugger)" för att lära dig felsöka och förstå din kod med debuggern. Alternativ fortsätt använda Thonny, det är som en grafisk debugger.



###Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[Python med funktioner och moduler](uppgift/python-med-funktioner)" för att träna på olika typer av funktioner, med och utan argument. Spara alla filer under `me/kmom03/lab3`.

2. Gör uppgiften "[Din egen chattbot - Marvin - steg 2](uppgift/din-egen-chattbot-marvin-steg-2-v4)" för att träna på strukturering av dina program. Spara alla filer under `me/kmom03/marvin2`.



###Extra {#extra}

Det finns inga extra uppgifter.



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall lämna in och redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

* Har du programmerat med funktioner tidigare?
* Vilka fördelar finns med att använda funktioner i koden?
* Hur fungerar funktioner?
* Du har gjort din första modul i Python, känns strukturen bra?
* Hur kan du använda moduler?
* Gjorde du någon av extrauppgifterna? Berätta om det arbetet i så fall.
