---
author: aar
category:
    - oopython
revision:
    "2024-01-19": (E, aar) Nya versionen som bygger mer på kmom03.
    "2022-01-28": (D, aar) Bytte från bank2 till yahtzee3.
    "2021-01-25": (C, moc) La in bank2 och ändrade war uppgiften till klassdiagram.
    "2019-01-19": (B, aar) Tog bort uppgifter om sekvensdiagram.
    "2017-12-13": (A, lew) New version for v2.
...
Kmom04: Session och unittest
====================================

I Flask lär vi oss hantera formulär med _GET_ och _POST_ och spara data i Session. Vi kollar också mer på enhetstestning.

<!--more-->

I Yahtzee bygger vi ett gränssnitt åt klasserna som skapades i kmom03 och bygger ihop det hela till ett fungerande spel.

[INFO]
Gör `dbwebb update` och `dbwebb init` innan du startar med kursmomentet.
[/INFO]

<!-- Flytta nedan text till eget dokument/vy/block -->

<small>*(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka 20 studietimmar inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)*</small>



Läsanvisningar  {#lasanvisningar}
---------------------------------

*(ca: 8-10 studietimmar)*


###Kurslitteratur  {#kurslitteratur}

Läs följande:

[Python 3 Object-oriented Programming](kunskap/boken-python3-object-oriented-programming-v3)  
    * Ch 3 - When Objects Are Alike  
    * Ch 5 - When to use Object-oriented Programming  
    * Ch 12 - Testing Object-oriented Programs


###Artiklar {#artiklar}

Läs följande:

1. [The art of unit testing](http://artofunittesting.com/definition-of-a-unit-test/)  

1. [Visualizing program execution](https://atomicobject.com/resources/oo-programming/visualizing-program-execution)

1. [UML basics på IBM](http://www.ibm.com/developerworks/rational/library/769.html)  



###Video  {#video}

Titta på följande video:  

1. Video om unittester: [Python Functions 2: Unit Testing](https://www.youtube.com/watch?v=F7a0iUH6kVA)

1. Längre video om testning i Python: [Testing is Fun in Python!](https://www.youtube.com/watch?v=Sb2tz9Hlbp8)



###Lästips {#lastips}

1. [OO development process](https://atomicobject.com/resources/oo-programming/oo-development-process)

1. [CRC cards](https://atomicobject.com/resources/oo-programming/crc-cards)



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 8-10 studietimmar)*



###Övningar {#ovningar}

Genomför följande övningar för att träna dig.

1. "[Mer om enhetstester](kunskap/unittest-i-python_2)".

1. Jobba igenom artikeln som handlar om "[GET, POST i Flask](kunskap/flask-get-post-session)".



### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Kopiera lab2 från kmom03. Om du gjorde labben i kmom03 behöver du inte göra mer. Det är för att labben ska följa med när vi rättar.

    ```bash
# stå i root katalogen för kursen
    cp -r me/kmom03/lab2/. me/kmom04/lab2
    ```

1. Gör uppgiften "[Yahtzee3](uppgift/yahtzee3-v3)". Spara koden i mappen `me/kmom04/yahtzee3/`.


### Extra {#extra}

Det finns inga extrauppgifter.


Lämna in  {#resultat}
-----------------------------------------------

Läs [Lämna in och redovisa uppgift](./../redovisa) för att ta reda på hur ni lämna in era uppgifter när ni är klara.
