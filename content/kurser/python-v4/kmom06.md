---
author:
    - mos
    - aar
    - efo
revision:
    "2020-09-04": (O, aar) Släppt för HT20.
    "2020-05-15": (N, aar) Flyttade moduler/filer från 04 till 06 inför V3 HT20.
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
Kmom06: Filer
==================================

[INFO]

Gör `dbwebb update` innan du börjar jobba med uppgifterna!

[/INFO]

Som vi jobbat i tidigare kursmoment försvinner all data när vi stänger av programmet, vi har ingen permanent data. Genom att skriva ner data i filer under exekvering kan vi uppnå ett permanent minne åt våra program. I detta kursmomentet kommer ni lära er läsa data från fil och hur man skriver ner data till fil.

Vi kommer även lämna Marvin och istället ska ni skapa ett nytt program där ni får öva mycket på dictionaries och listor för att bygga ett verktyg för textanalys.

[FIGURE src=/img/wikimedia/English_letter_frequency_(frequency).svg caption="Frekvensen för förekomsten av bokstäver i en engelsk text. [Bild från Wikimedia](https://en.wikipedia.org/wiki/Letter_frequency#mediaviewer/File:English_letter_frequency_(frequency).svg)."]

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Läsanvisningar  {#lasanvisningar}
---------------------------------

*(ca: 4-6 studietimmar)*


###Kurslitteratur  {#kurslitteratur}

Läs följande:

1. [Python for Everybody: Exploring data in Python3](kunskap/boken-python-for-everybody-exploring-data-using-python3)
    * Ch7 Files
    * Ch9 Dictionaries - andra halvan



###Artiklar {#artiklar}

Det finns inga artiklar.



###Video  {#video}

Titta på följande:

1. [Text Files in Python](https://www.youtube.com/watch?v=4mX0uPQFLDU).

2. Videoserien [Lär dig Python](https://www.youtube.com/playlist?list=PLKtP9l5q3ce93pTlN_dnDpsTwGLCXJEpd) är tätt kopplat till kursmaterialet. Kika på de videor som börjar med 6.

3. De videor som följer med och kompletterar kurslitteraturen.

    * [Python for Informatics: Chapter 7 - Files part 1](https://youtu.be/9KJ-XeQ6ZlI?list=PLlRFEj9H3Oj7Bp8-DfGpfAfDBiblRfl5p)
    * [Python for Informatics: Chapter 7 - Files part 1](https://youtu.be/0t4rvnySKR4?list=PLlRFEj9H3Oj7Bp8-DfGpfAfDBiblRfl5p)
    <!-- * [Python for Informatics: Chapter 8 - Lists](https://www.youtube.com/watch?v=nO8eU3uts0o) -->



###Lästips {#lastips}

1. Tidigare år har jag gett längre återkoppling på kmom02 inlämningar som studenter har frågat efter. Jag rekommenderar att läsa igenom dem för att se hur man kan lösa sakerna på olika sätt.
    - [Återkoppling på students marvin4](https://github.com/dbwebb-se/python/issues/54).

1. [Exempel och förklaringar av valideringsfel](https://github.com/dbwebb-se/python/issues/46)



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 12-16 studietimmar)*



### Övningar {#ovningar}

Genomför övningarna för att träna inför uppgifterna.


1. Jobba igenom artikeln/övningen "[Att läsa filer som strängar i Python](kunskap/att-lasa-filer-i-python-strings-v2)". De exempelprogram du gör kan du spara i ditt kursrepo under `me/kmom06/file`.

1. Jobba igenom artikeln/övningen "[Att läsa filer till en lista i Python](kunskap/att-lasa-filer-i-python-v2)". De exempelprogram du gör kan du spara i ditt kursrepo under `me/kmom06/file`.


### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[Läsa och skriva filer i python](uppgift/lasa-skriva-filer-i-python)" för att träna på olika typer av funktioner och moduler. Spara alla filer under `me/kmom06/lab6`.

1. Gör uppgiften "[Analysera text och ord](uppgift/analysera-text-och-ord-v3)". Spara alla filer under `me/kmom06/analyzer`.




### Extra {#extra}

Det finns inga extrauppgifter.



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall lämna in och redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

* Hur jobbar man med filer i Python?
* Vilka fördelar ger det att kunna läsa från och skriva till filer?
* Hur gick det att utföra uppgifterna?
