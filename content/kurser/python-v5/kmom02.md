---
author:
    - mos
revision:
    "2019-06-10": (I, aar) Förlängde kursmomentet till 40h.
    "2018-06-08": (prel, mos) Nytt dokument inför uppdatering av kursen.
    "2017-06-14": (H, efo) Rensade i kurslitteratur och länkade in nytt material.
    "2016-03-15": (G, mos) Tog bort videoserie MonkeyLords och NewBoston.
    "2016-02-22": (F, mos) Lade till videoserien "Lär dig Python".
    "2015-01-30": (E, mos) Länk till läsanvisning appendix 2.
    "2015-01-08": (D, mos) Bort blå ruta med kursutveckling pågår.
    "2014-10-01": (C, mos) Ändrade länken till redovisa-instruktionen.
    "2014-09-03": (B, mos) Första officiella versionen.
    "2014-08-27": (A, mos) Första utgåvan för python kursen.
...
Kmom02: Villkor och loopar
==================================

Vi har bekantat oss med värden, datatyper och variabler och det är nu dags för en introduktion till hur vi kan styra flödet av data i våra program. Först tittar vi på booleska operatorer och hur vi kan använda sant eller falsk för att exekverera olika delar av koden. Efter det introduceras loopar som kan användas för upprepa delar av koden. Till slut är det dags att skriva ditt första lite större program där Marvin skall få lite intelligens när han svarar på frågor.

[FIGURE src=/image/python/py-marvin.png?w=w2 caption="Marvin i Python."]

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **40 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Läsanvisningar  {#lasanvisningar}
---------------------------------

*(ca: 4-8 studietimmar)*


### Kurslitteratur  {#kurslitteratur}

Läs följande:

1. [Python for Everybody: Exploring data in Python3](kunskap/boken-python-for-everybody-exploring-data-using-python3)
    * Ch3 Conditional execution
    * Ch5 Iteration
    * Ch6 Strings

<!-- 2. [Invent your games with Python](kunskap/boken-invent-your-own-computer-games-with-python)
    * [Appendix A - Differences Between Python 2 and 3](http://inventwithpython.com/appendixa.html)


Det räcker om du läser ovanstående, men vill du ha lite till och samtidigt lite repetition, så läser du motsvarande kapitel i Think Python.

1. [Think Python: How to Think Like a Computer Scientist](kunskap/boken-think-python-how-to-think-like-a-computer-scientist)
    * Ch3 Functions
    * Ch5 Conditionals and recursion
    * Ch6 Fruitful functions
    * Ch7 Iteration  -->



### Artiklar {#artiklar}

Läs följande:

1. Läs [Hur man tänker som en programmerare och problemlösare](/coachen/tank-som-programmerare). Sammanfattning av en artikel som diskuterar hur man tänker som en programmerare.

1. Kolla på bilden [My code isn't working](/image/python/code_not_working.jpg). Spara bilden för att underlätta när saker går fel.

1. Läs om de olika sätten vi kan formatera strängar i [Python String Formatting Best Practices](https://realpython.com/python-string-formatting/). I kursen använder vi "New Style" eller "f-Strings".



### Video  {#video}

Titta på följande:

1. Videoserien [Lär dig Python](https://www.youtube.com/playlist?list=PLKtP9l5q3ce93pTlN_dnDpsTwGLCXJEpd) är tätt kopplat till kursmaterialet. Kika på de videor som börjar med 2.

2. De videor som följer med och kompletterar kurslitteraturen.

    * [Python for Informatics: Chapter 3 - Conditional execution part 1](https://youtu.be/2aA3VBdcl6A?list=PLlRFEj9H3Oj7Bp8-DfGpfAfDBiblRfl5p)
    * [Python for Informatics: Chapter 3 - Conditional execution part 2](https://youtu.be/OczkNrHPBps?list=PLlRFEj9H3Oj7Bp8-DfGpfAfDBiblRfl5p)
    <!-- * [Python for Informatics: Chapter 4 - Functions](https://www.youtube.com/watch?v=Wdi6lhcrtBU) -->
    * [Python for Informatics: Chapter 5 - Iteration part 1](https://youtu.be/FzpurxjwmsM?list=PLlRFEj9H3Oj7Bp8-DfGpfAfDBiblRfl5p)
    * [Python for Informatics: Chapter 5 - Iteration part 2](https://youtu.be/5QDrj5ogPYc?list=PLlRFEj9H3Oj7Bp8-DfGpfAfDBiblRfl5p)
    * [Python for Informatics: Chapter 5 - Iteration part 3](https://youtu.be/xsavQp8hd78?list=PLlRFEj9H3Oj7Bp8-DfGpfAfDBiblRfl5p)
    * [Python for Informatics: Chapter 5 - Iteration part 4](https://youtu.be/yjlMMwf9Y5I?list=PLlRFEj9H3Oj7Bp8-DfGpfAfDBiblRfl5p)
    * [Python for Informatics: Chapter 6 - Strings part 1](https://youtu.be/dr98iM4app8?list=PLlRFEj9H3Oj7Bp8-DfGpfAfDBiblRfl5p)
    * [Python for Informatics: Chapter 6 - Strings part 2](https://youtu.be/bIFpJ-qZ3Cc?list=PLlRFEj9H3Oj7Bp8-DfGpfAfDBiblRfl5p)



### Lästips {#lastips}

1. [Hur ber man om hjälp med kod i chatten?](coachen/hur_fraga_hjalp)

1. [Exempel och förklaringar av valideringsfel](https://github.com/dbwebb-se/python/issues/46)

1. Hur man löser valideringsfelet "line-to-long" med [radbrytning i Python](coachen/radbrytning-i-python).

1. [Think Python: How to Think Like a Computer Scientist](kunskap/boken-think-python-how-to-think-like-a-computer-scientist)
    * App A Debugging

<!--
1. Bekanta dig kort med verktyget [Pylint](http://www.pylint.org/).

3. Läs de två inledande kapitlen i [Python styleguide](http://legacy.python.org/dev/peps/pep-0008/). Läs så att du får en känsla för vad en styleguide är för ett programmeringsspråk. Använd sedan styleguiden som uppslagsverk.
-->



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 12-16 studietimmar)*


###Övningar {#ovningar}

1. Jobba igenom artikeln/övningen "[Jämförelseoperatorer och booleska värden](kunskap/booleans-och-jamforelseoperatorer)" för att träna på hur värden jämförs i Python. Python-interpretatorn används för att testa koden. Vill du spara någon del av koden så gör du det under `me/kmom02/flow`.

1. Jobba igenom artikeln/övningen "[Villkor och loopar](kunskap/villkor-och-loopar)" för att öva in hur vi kan styra flödet i våra program. De exempelprogram du gör kan du spara i ditt kursrepo under `me/kmom02/flow`.

1. Läs igenom och kolla på videorna för del 1 till 3 i "[Debugger i Python](kunskap/python-debugger)" för att lära dig felsöka och förstå din kod med debuggern. Kan ersättas av Thonny. Thonny fungerar som en grafisk debugger.

1. Läs igenom artikeln/övningen "[Felhantering i Python](kunskap/felhantering_python)". Vänta med att läsa denna artikeln till andra veckan i kmom02 eller när du börjar bli klar med Marvin uppgiften. I den lär du dig att hantera fel som uppstår under exekvering och förhindra ditt program från att krascha.



###Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

<!--
Värden och variabler
Villkor och loopar
Funktioner och strängar
Listor
Dictionaries och Tupler

1. Gör laborationen "[Python med värden och variabler](uppgift/python-med-varden-och-variabler)" för att träna på grunderna i Python. Spara alla filer under `me/kmom02/lab2`.
-->

1. Gör uppgiften "[Python med villkor och loopar](uppgift/python-med-villkor-och-loopar)" för att träna på `if`-satser, `for`- och `while`-loopar. Spara alla filer under `me/kmom02/lab2`.

1. Gör uppgiften "[Din egen chattbot - Marvin - steg 1](uppgift/din-egen-chattbot-marvin-steg-1-v3)", ditt första lite större Pythonprogram där du lär Marvin att svara på frågor. Spara alla filer under `me/kmom02/marvin1`.



###Extra {#extra}

Det finns inga extra uppgifter.



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall lämna in och redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

* Hur känns syntaxen i Python?
* Är det enkelt att se programmets struktur och vad det gör?
* Har du fått en förståelse för hur loopar och villkor fungerar?
* Vad är skillnaden på en while-loop och en for-loop?
* Hur går det med valideringen av uppgifterna?
* Är du överens med pylint om eventuella felmeddelanden vid valideringen?
* Hur gick det att utföra uppgifterna, var de enkla eller svåra?
* Gjorde du någon av extrauppgifterna? Berätta om det arbetet isåfall.
