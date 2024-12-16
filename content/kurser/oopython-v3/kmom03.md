---
author: aar
revision:
    "2024-01-17": (F, aar) Delade upp så bara OO medan alla flask är i nästa kmom.
    "2023-01-27": (E, aar) Bytt ut uppgift och get/post övning.
    "2022-01-21": (D, aar) Bytt ut bank omt yahtzee2.
    "2021-01-18": (C, moc) Bytt ut frågorsport uppgift mot bank.
    "2018-12-18": (B, aar) Bytt ut form uppgift mot frågorsport.
    "2017-11-24": (A, lew) oopython v2.
    "2017-11-10": (PE1, mos) Utkast till v2.
...
Kmom03: Arv och andra klassrelationer
====================================

[FIGURE src=/image/oopython/kmom02/kmom02-class-relations.png class="right"]

Kom igång med _arv_ och andra klassrelationer. Vi ska titta närmare på klassrelationer och hur de kan implementeras. När vi lär oss mer om klassrelationer behöver vi också lära oss hur vi visar det i klassdiagram.

Vi ska fortsätta med Yahtzee uppgiften, i detta kursmomentet ska ni skapa klasser för att få poäng baserat på vilka tärningar som finns i en hand. I kmom04 skriver vi Flask koden.

<!--more-->
[WARNING]
Kursmomentet är under uppdatering!

Påbörja inte fören denna gula ruta är borta!
[/WARNING]
[INFO]
Ni behöver göra `dbwebb update` och `dbwebb init` i kursrepot innan ni startar med kursmomentet!
[/INFO]

<!-- Flytta nedan text till eget dokument/vy/block -->

<small>*(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka 20 studietimmar inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)*</small>



Läsanvisningar  {#lasanvisningar}
---------------------------------

*(ca: 8-10 studietimmar)*


###Kurslitteratur  {#kurslitteratur}

Läs följande:

1. [Python 3 Object-oriented Programming](kunskap/boken-python3-object-oriented-programming-v3)  
    * Ch 1 - Object-oriented Design
        - Hiding details and creating the public interface --- Summary
    * Ch 2 - Objects in Python
        - Who can access my data?
        - Case study - Summary
    * Ch 3 - When Objects Are Alike  



###Artiklar {#artiklar}

1. [Klass relationer](https://atomicobject.com/resources/oo-programming/oo-class-relationships)

1. [Aggregation](https://atomicobject.com/resources/oo-programming/object-oriented-aggregation)

1. [Arv](https://atomicobject.com/resources/oo-programming/object-oriented-interitance)

1. [Visualizing program execution](https://atomicobject.com/resources/oo-programming/visualizing-program-execution)

1. [UML basics på IBM](http://www.ibm.com/developerworks/rational/library/769.html)  



###Video  {#video}

Titta på följande:  

1. Videoserien [Lär dig objektorienterad Python](https://www.youtube.com/playlist?list=PLKtP9l5q3ce8cmKXE9Gw1Ra0GaYufGbN7) är tätt kopplat till kursmaterialet. Kika igenom videorna som börjar med 2.

1. Titta på resten av [Object-oriented programming](https://www.youtube.com/watch?v=lbXsrHGhBAU) (7.45 och fram).

1. Videos 12-22 i spellistan [Software Development Process: Part 2 of 3](https://www.youtube.com/watch?v=pZ9-ujSP_48&index=12&list=PLAwxTw4SYaPm8PAGH7ov2Bj-nG4sXgCtJ) om class diagrams. Det är många videor men de är bara mellan 1 och 3 minuter långa.

1. Videom klassdiagram: [UML Class Diagram Tutorial](https://www.youtube.com/watch?v=UI6lqHOVHic)



###Lästips {#lastips}

1. [Objektorienterad programmering och klass relationer](https://python-textbok.readthedocs.io/en/1.0/Object_Oriented_Programming.html)

1. [UML class relationships](http://creately.com/blog/diagrams/class-diagram-relationships/)



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 8-10 studietimmar)*



###Övningar {#ovningar}

Genomför följande övning för att träna dig.

1. Jobba igenom "Klass relationer" i guiden "[Kom igång med objektorienterad programmering i Python](guide/kom-igang-med-objektorienterad-programmering-i-python)".

1. Läs igenom artikeln "[Hur vi visar olika relationer mellan klasser i ett klassdiagram](kunskap/relationer_klassdiagram)".

1. "Mer objektorientering" i guiden "[Kom igång med objektorienterad programmering i Python](guide/kom-igang-med-objektorienterad-programmering-i-python)".




### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[Python med klass relationer](uppgift/python-med-klass-relationer)" (lab 2)

1. Gör uppgiften "[Yahtzee2](uppgift/yahtzee2-v3)". Spara koden i mappen `me/kmom03/yahtzee2/`.


**PS!** Det är inte någon inlämning denna veckan. Bara ett quiz!


### Extra {#extra}

1. Jobba igenon "Extra material för de som vill lära sig mer" i guiden "[Kom igång med objektorienterad programmering i Python](guide/kom-igang-med-objektorienterad-programmering-i-python/extra)".
