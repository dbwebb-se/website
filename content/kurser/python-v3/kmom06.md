---
author:
    - mos
    - aar
    - efo
revision:
    "2020-05-15": (O, aar) Flyttade moduler/filer från 04 till 06 inför V3 HT20.
    "2019-06-14": (M, efo) Ändrade så kmom05 blir 04.
    "2018-06-29": (L, aar) Uppdaterade mappstruktur mot kursrepo.
    "2018-06-18": (K, aar) La till moduler och flyttade listor till kmom05.
    "2018-06-08": (prel, mos) Nytt dokument inför uppdatering av kursen.
    "2017-06-14": (J, lew) Uppdatering inför hösten 2017.
    "2016-03-15": (I, mos) Tog bort videoserie MonkeyLords och NewBoston.
    "2016-02-29": (H, mos) Tog bort material om två dimensionell lista och lade till övning "Kom igång med datatypen lista i Python".
    "2016-02-22": (G, mos) Lade till videoserien "Lär dig Python".
    "2015-02-03": (F, mos) Tog bort curses fråga från redovisningsfrågorna.
    "2015-02-02": (E, mos) Flyttade curses till extra uppgift och lade till ny uppgift med Marvin inventarier.
    "2015-01-08": (D, mos) Bort blå ruta med kursutveckling pågår.
    "2014-10-01": (C, mos) Ändrade länken till redovisa-instruktionen.
    "2014-09-19": (B, mos) Tog bort beta status.
    "2014-08-27": (A, mos) Första utgåvan för python kursen.
...
Kmom06: Moduler och filer
==================================

Vi fortsätter med att titta på hur vi kan använda funktioner för att strukturera vår kod. För att ytterligare strukturera koden introduceras moduler där vi delar koden i olika filer. Du kommer även lära dig hur man kan läsa information från en fil samt att lagra information i en fil.

<!--[FIGURE src=/image/snap/py-marvin.png?w=w2 caption="Marvin i Python."]-->

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Läsanvisningar  {#lasanvisningar}
---------------------------------

*(ca: 4-6 studietimmar)*


###Kurslitteratur  {#kurslitteratur}

Läs följande:

1. [Python for Everybody: Exploring data in Python3](kunskap/boken-python-for-everybody-exploring-data-using-python3)
    * Ch7 Files


<!-- 2. Komplettera med motsvarande kapitel från systerboken [Think Python: How to Think Like a Computer Scientist](kunskap/boken-think-python-how-to-think-like-a-computer-scientist)
    * Ch10 Lists
    * Ch14 Files



###Artiklar {#artiklar}

Det finns inga artiklar.

<!--
Läs följande:

2. Läs om hur man skapar en två-dimensionell array av listor i Python.
    * [How to define two-dimensional array in python](http://stackoverflow.com/questions/6667201/how-to-define-two-dimensional-array-in-python)
-->



###Video  {#video}

Titta på följande:

1. Videoserien [Lär dig Python](https://www.youtube.com/playlist?list=PLKtP9l5q3ce93pTlN_dnDpsTwGLCXJEpd) är tätt kopplat till kursmaterialet. Kika på de videor som börjar med 4.

2. De videor som följer med och kompletterar kurslitteraturen.

    * [Python for Informatics: Chapter 7 - Files part 1](https://youtu.be/9KJ-XeQ6ZlI?list=PLlRFEj9H3Oj7Bp8-DfGpfAfDBiblRfl5p)
    * [Python for Informatics: Chapter 7 - Files part 1](https://youtu.be/0t4rvnySKR4?list=PLlRFEj9H3Oj7Bp8-DfGpfAfDBiblRfl5p)
    <!-- * [Python for Informatics: Chapter 8 - Lists](https://www.youtube.com/watch?v=nO8eU3uts0o) -->



### Lästips {#lastips}

Det finns inga lästips.



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 12-16 studietimmar)*



### Övningar {#ovningar}

Genomför övningarna för att träna inför uppgifterna.

1. Jobba igenom artikeln/övningen "[Moduler i Python](kunskap/moduler-i-python)" för att bekanta dig med ett sätt att strukturera koden i Python. De exempelprogram du gör kan du spara i ditt kursrepo under `me/kmom04/modules` då denna uppgiften bygger vidare på kmom03.

1. Jobba igenom artikeln/övningen "[Att läsa filer som strängar i Python](kunskap/att-lasa-filer-i-python-strings)". De exempelprogram du gör kan du spara i ditt kursrepo under `me/kmom04/file`.

1. Jobba igenom artikeln/övningen "[Att läsa filer till en lista i Python](kunskap/att-lasa-filer-i-python)". De exempelprogram du gör kan du spara i ditt kursrepo under `me/kmom05/file`.


### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[Python med funktioner och moduler](uppgift/python-med-funktioner-moduler)" för att träna på olika typer av funktioner och moduler. Spara alla filer under `me/kmom04/lab4`.

1. Gör uppgiften "[Din egen chattbot - Marvin - inventarie](uppgift/din-egen-chattbot-marvin-inventarie)". Spara alla filer under `me/kmom04/marvin3`.



### Extra {#extra}

Det finns inga extrauppgifter.

<!-- 1. Bekanta dig med Python-modulen Curses och gör uppgiften "[Ett terminal-baserat spel i Python - steg1](uppgift/ett-terminal-baserat-spel-i-python-steg1)". Läs följande dokument för att komma igång med curses.
    * [Curses Programming with Python](https://docs.python.org/3/howto/curses.html)
    * [Curses — Terminal handling for character-cell displays](https://docs.python.org/3/library/curses.html) -->




Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

* Du har gjort din första modul i Python, känns strukturen bra?
* Hur kan du använda moduler?
* Hur jobbar man med filer i Python?
* Vilka fördelar ger det att kunna läsa från fil?
* Hur gick det att utföra uppgifterna, vilken tog mest tid och vilken var mest lärorik?
* Gjorde du någon av extrauppgifterna? Berätta om det arbetet isåfall.
