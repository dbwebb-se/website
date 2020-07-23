---
author:
    - mos
    - efo
revision:
    "2020-05-15": (N, aar) Flyttade Dict/Tuple från 06 till 05 inför V3 HT20.
    "2018-08-13": (M, aar) Flyttade extrauppgifter till kmom05.
    "2018-06-29": (L, aar) Uppdaterade mappstruktur mot kursrepo.
    "2018-06-27": (K, efo) Tog bort argparse och anpassade för v2.
    "2018-06-08": (prel, mos) Nytt dokument inför uppdatering av kursen.
    "2017-09-08": (J, mos) Bort någon fråga.
    "2017-06-22": (I, efo) La till nya artiklar och ändrade namn på uppgifter.
    "2016-03-15": (H, mos) Tog bort videoserie MonkeyLords och NewBoston.
    "2016-02-22": (G, mos) Lade till videoserien "Lär dig Python".
    "2015-02-05": (F, mos) Bort med curses och in med marvin för textanalys och tic-tac-toe.
    "2015-01-08": (E, mos) Bort blå ruta med kursutveckling pågår.
    "2014-10-01": (D, mos) Ändrade länken till redovisa-instruktionen.
    "2014-09-26": (C, mos) Tog bort beta stämpel.
    "2014-09-15": (B, mos) Flyttade Marvin till extrauppgift.
    "2014-09-12": (A, mos) Första utgåvan för python kursen.
...
Kmom05: Dictionaries och Tupler
==================================

Lär dig mer om datastrukturer i Python, nu handlar det om dictionaries och tupler. Dictionaries sparar data som ett nyckel-värde par och tupler strukturer vår data i mindre enheter med ett sammanhang. Vi använder våra kunskaper om dictionaries för att bygga ett verktyg för textanalys.



[FIGURE src=/img/wikimedia/English_letter_frequency_(frequency).svg caption="Frekvensen för förekomsten av bokstäver i en engelsk text. [Bild från Wikimedia](https://en.wikipedia.org/wiki/Letter_frequency#mediaviewer/File:English_letter_frequency_(frequency).svg)."]

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Läsanvisningar  {#lasanvisningar}
---------------------------------

*(ca: 4-6 studietimmar)*


###Kurslitteratur  {#kurslitteratur}

Läs följande:

1. [Python for Everybody: Exploring data in Python3](kunskap/boken-python-for-everybody-exploring-data-using-python3)
    * Ch9 Dictionaries
    * Ch10 Tuples

<!--
2. Komplettera med motsvarande kapitel från systerboken [Think Python: How to Think Like a Computer Scientist](kunskap/boken-think-python-how-to-think-like-a-computer-scientist)
    * Ch11 Dictionaries
    * Ch12 Tuples
    * Ch13 Case study: data structure selection
-->



###Artiklar {#artiklar}

Det finns inga artiklar.



###Video  {#video}

Titta på följande:

1. Videoserien [Lär dig Python](https://www.youtube.com/playlist?list=PLKtP9l5q3ce93pTlN_dnDpsTwGLCXJEpd) är tätt kopplat till kursmaterialet. Kika på de videor som börjar med 6.

2. De videor som följer med och kompletterar kurslitteraturen.

    * [Python for Informatics: Chapter 9 - Dictionaries part 1](https://youtu.be/yDDRMb-1cxI?list=PLlRFEj9H3Oj7Bp8-DfGpfAfDBiblRfl5p)
    * [Python for Informatics: Chapter 9 - Dictionaries part 1](https://youtu.be/LRSIuH94XM4?list=PLlRFEj9H3Oj7Bp8-DfGpfAfDBiblRfl5p)
    * [Python for Informatics: Chapter 10 - Tuples part 1](https://youtu.be/CaVhM65wD6g?list=PLlRFEj9H3Oj7Bp8-DfGpfAfDBiblRfl5p)
    * [Python for Informatics: Chapter 10 - Tuples part 2](https://youtu.be/FdUdA6o0Ij0?list=PLlRFEj9H3Oj7Bp8-DfGpfAfDBiblRfl5p)



###Lästips {#lastips}

Det finns inga lästips.



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 12-16 studietimmar)*


###Övningar {#ovningar}

Genomför övningarna för att träna inför uppgifterna.

1. Gör övningen "[Dictionaries och tupler i Python](kunskap/dictionaries-och-tupler-i-python)" för att bekanta dig med dictionaries och tupler i Python. De exempelprogram du gör kan du spara i ditt kursrepo under `me/kmom06/warehouse`.

<!-- 1. Gör övningen "[Modulen argparse](kunskap/argparse)" där vi skriver ett CLI-program som tar emot options och argument. De exempelprogram du gör kan du spara i ditt kursrepo under `me/kmom06/argparse`. -->



###Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[Python med dictionaries och tupler](uppgift/python-med-dictionaries-och-tupler)". Spara alla filer under `me/kmom06/lab6`.

1. Gör uppgiften "[Analysera text och ord](uppgift/analysera-text-och-ord-v2)". Spara alla filer under `me/kmom06/analyzer`.



###Extra {#extra}

Det finns inga extrauppgifter.


<!-- 1. Gör den Curses-baserade uppgiften "[Ett terminal-baserat spel i Python - steg2](uppgift/ett-terminal-baserat-spel-i-python-steg2)". -->



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

* Känns det som du fick ordning på listor, dictionaries och tupler, när man skall använda respektive och hur de kan användas?
* Vad skiljer de tre datastrukturerna från varandra?
* Hur använde du dem i uppgifterna?
* Hur gick det att utföra uppgifterna, vilken tog mest tid och vilken var mest lärorik?
* Gjorde du någon av extrauppgifterna? Berätta om det arbetet isåfall.
