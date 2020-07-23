---
author:
    - mos
    - efo
    - aar
revision:
    "2019-05-24": (K, efo, aar) Uppdaterade med video inför HT19.
    "2018-06-08": (prel, mos) Nytt dokument inför uppdatering av kursen.
    "2017-09-01": (J, mos) Video till installation av dbwebb-cli.
    "2017-06-15": (I, mos) Omarbetning inför ht17.
    "2016-03-15": (H, mos) Tog bort videoserie MonkeyLords och NewBoston.
    "2016-02-22": (G, mos) Lade till videoserien "Lär dig Python".
    "2015-08-25": (F, mos) Ändrar till hur labbmiljön installeras samt dbwebb-cli v2.
    "2015-01-08": (E, mos) Bort blå ruta med kursutveckling pågår.
    "2014-10-01": (D, mos) Ändrade länken till redovisa-instruktionen.
    "2014-08-30": (C, mos) Publicerades för första gången officiellt.
    "2014-08-25": (B, mos) Cgi fungerar som tänkt med python3 på webbservern.
    "2014-08-21": (A, mos) Första utgåvan för python kursen.
...
Kmom01: Kom i gång med Python
==================================

Det första vi skall göra är att skaffa oss en utvecklingsmiljö och kika i kurslitteraturen. Python fungerar på många miljöer och i olika varianter.

Vi börjar skriva de första enkla programmen för att komma underfund med hur Python kan användas och hur programmeringsspråket fungerar i grunden.

<!-- [FIGURE src=/image/snapht14/python-mos-me-page.png?w=w2 caption="Mikaels me-sida i Python som cgi-skript."] -->

Ditt första Python-program.

[ASCIINEMA src=122865 caption="Kör ditt första Python-program."]


Så här kan det se ut när du är klar med Plane uppgiften.

[YOUTUBE src=7qifosdyfe8 caption="Så här kan det se ut när du är klar med Plane uppgiften."]



<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Labbmiljön  {#labbmiljo}
---------------------------------

*(ca: 2-4 studietimmar)*

Det första du behöver göra är att installera en labbmiljö för kursen. Om detta är din första dbwebb-kurs så kan det innebära en hel del jobb och en del nya tekniker. Se till att du har gott om tid när du gör detta.

Om du vill ha en introduktion till det som händer i steg 2-4 så kikar du på videon "[Mikael installerar dbwebb-cli som en del av labbmiljön](https://www.youtube.com/watch?v=vlZRW2OZamE)".

1. Du kan börja med att [installera labbmiljön](./../labbmiljo) som behövs för kursen.

1. Fortsätt med sektionen för att [installera kommandot `dbwebb`](dbwebb-cli/kom-igang-och-installera). Kommandot används under hela kursen för att jobba med kursmaterialet.

1. När du har installerat kommandot så fortsätter du med sektionen för att [konfigurera kommandot `dbwebb`](dbwebb-cli/konfiguration).

1. Du kan nu [ladda ned (klona) ditt lokala kursrepo `python`](dbwebb-cli/clone) som innehåller kursmaterial för kursen. Här kommer du att skriva all kod till övningar och uppgifter.



Läsanvisningar  {#lasanvisningar}
---------------------------------

*(ca: 4-6 studietimmar)*


### Kurslitteratur  {#kurslitteratur}

Läs följande:

Kursens huvudbok ger förståelse och bakgrunden till att klara övningar och uppgifter.

1. [Python for Everybody: Exploring data in Python3](kunskap/boken-python-for-everybody-exploring-data-using-python3)
    * Ch1 Why should you learn to write programs?
    * Ch2 Variables, expressions and statements

<!--
1. [Think Python: How to Think Like a Computer Scientist](kunskap/boken-think-python-how-to-think-like-a-computer-scientist).
    * Ch1 The way of the program
    * Ch2 Variables, expressions and statements
-->



### Artiklar {#artiklar}

Efterhand som du lär dig Python kommer du att märka att du referensmanualen är en bra källa till kunskap. Bekanta dig därför med strukturen som finns på Pythons webbplats och gå igenom följande.

1. Bekanta dig översiktligt med [dokumentationen som finns på Pythons webbplats](https://www.python.org/doc/). Kika runt och orientera dig. Vi använder Python 3.

1. Se översikten av referensdokumentation för [Python 3.x Doc](https://docs.python.org/3/). Bekanta dig översiktligt med strukturen och se vilken typ av information som du kan hitta.

1. Läs första kapitlet i [The Python Tutorial](https://docs.python.org/3/tutorial/index.html). Det är mest för att du skall se vilken typ av information som finns i tutorialen och för att bekanta dig med den typen av material.



### Video  {#video}

Titta på följande:

1. I videoserien [Lär dig Python](https://www.youtube.com/playlist?list=PLKtP9l5q3ce93pTlN_dnDpsTwGLCXJEpd) hittar du videor som är tätt kopplad till kursmaterialet. Kika på de videor som börjar med 0 och 1. Det är korta videor som tar upp delar som är relevanta i respektive kursmoment.

1. Följande videor följer med och kompletterar kurslitteraturen. Det är författaren som har föreläsningar kopplade till bokens kapitel.
    * [Python for Informatics: Chapter 1 - Introduction part 1](https://youtu.be/fvhNadKjE8g?list=PLlRFEj9H3Oj7Bp8-DfGpfAfDBiblRfl5p)
    * [Python for Informatics: Chapter 1 - Introduction part 2](https://youtu.be/VQZTZsXk8sA?list=PLlRFEj9H3Oj7Bp8-DfGpfAfDBiblRfl5p)
    * [Python for Informatics: Chapter 1 - Introduction part 3](https://youtu.be/LLzFNlCjTSo?list=PLlRFEj9H3Oj7Bp8-DfGpfAfDBiblRfl5p)
    * [Python for Informatics: Chapter 1 - Introduction part 4](https://youtu.be/gsry2SYOFCw?list=PLlRFEj9H3Oj7Bp8-DfGpfAfDBiblRfl5p)
    * [Python for Informatics: Chapter 2 - Introduction part 1](https://youtu.be/7KHdV6FSpo8?list=PLlRFEj9H3Oj7Bp8-DfGpfAfDBiblRfl5p)
    * [Python for Informatics: Chapter 2 - Introduction part 2](https://youtu.be/kefrGMAglGs?list=PLlRFEj9H3Oj7Bp8-DfGpfAfDBiblRfl5p)


Som en generell introduktion till programming och vissa av de tekniker och konstruktioner vi går igenom under kursen rekommenderas följande video. Föreläsningen är från Harvard kursen CS50 som ges som världens största [MOOC](https://en.wikipedia.org/wiki/Massive_open_online_course).

[YOUTUBE src=qDbsiVWA2Ag caption="David J. Malan introducerar programmering och teknikerna bakom."]




###Lästips {#lastips}

Hur man löser valideringsfelet "line-to-long" med [radbrytning i Python](coachen/radbrytning-i-python).

Om du känner att du har tid och lust.



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 6-10 studietimmar)*



### Övningar {#ovningar}

Genomför följande övning för att träna dig och förbereda inför uppgifterna.

1. Kom igång och gör ditt första program i Python tillsammans med artikeln "[Kom igång med ditt första program i Python](kunskap/kom-igang-med-ditt-forsta-program-i-python-v2)". De exempelprogram du gör kan du spara i ditt kursrepo under `me/kmom01/hello`.

1. Jobba igenom artikeln "[Introduktion till variabler och datatyper](kunskap/introduktion-till-variabler-och-datatyper)" som hjälper dig att komma igång med grunderna i programmering med Python.  De exempelprogram du gör kan du spara under `me/kmom01/hello`.



### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör laborationen "[Python med värden och variabler](uppgift/python-med-varden-och-variabler)" för att träna på grunderna i Python. Spara alla filer under `me/kmom01/lab1`.

1. Gör uppgiften "[Ditt första Python-skript](uppgift/ditt-forsta-python-skript)" för att visa att du har koll på grunderna. Spara alla filer under `me/kmom01/plane`.

1. Gör uppgiften "[Skapa en me-sida för Python-kursen](uppgift/skapa-en-me-sida-till-python-kursen)" så du kan skriva dina redovisningstexter. Spara alla filer under `me/redovisa`.



### Extra {#extra}

Det finns inga extra uppgifter.



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

* Vad är en variabel?
* Vilken utvecklingsmiljö använder du?
* Är du bekant med programmering och problemlösning och/eller Python sedan tidigare?
* Är du bekant med terminalen och Unix-kommandon sedan tidigare?
* Gick det bra att komma i gång med kursmomentet, fanns det svårigheter som du fastnade på?
* Vilken del av kursmaterialet (böcker, artiklar, videor, etc) uppskattade du mest, använde du dem alla?
