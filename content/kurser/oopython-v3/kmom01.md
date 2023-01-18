---
author: 
    - aar
    - grm
revision:
    "2023-01-09": (A, aar, grm) Skapat och uppdaterat inför vt23.
...
Kmom01: Kom igång med objekt och UML
====================================

Vi ska börjar kursen med grunderna om objekt och UML. Vi installerar labbmiljön och kommer igång med 
objektorienterad python. 

<!--more-->

[INFO]

Gör `dbwebb update` och `dbwebb init` innan ni börjar jobba med kursmomentet.

[/INFO]

[FIGURE src=/image/oopython/kmom02/diagrams/fullExample_class.png?w=w2 caption="Ett exempel på ett klassdiagram i UML med 1 kund som kan göra 0 eller flera ordrar."]



<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Labbmiljön  {#labbmiljo}
---------------------------------

*(ca: 2-4 studietimmar)*

Det finns en [längre beskrivning om kursens labbmiljö](./../installera-labbmiljo). Läs den om du är osäker på vad som skall göras, eller om detta är din första dbwebb-kurs.

Den korta varianten är att du behöver [installera labbmiljön](./../labbmiljo), uppdatera [dbwebb-cli](dbwebb-cli) samt klona och initiera kursrepot.

```text
# Gå till din katalog för dbwebb-kurser
dbwebb selfupdate
dbwebb clone oopython
cd oopython
dbwebb init
```



Läsanvisningar  {#lasanvisningar}
---------------------------------

*(ca: 8-10 studietimmar)*



###Kurslitteratur  {#kurslitteratur}

Läs följande:

1. [Python 3 Object-oriented Programming](kunskap/boken-python3-object-oriented-programming-v3)  
    * Ch 1 - Object-oriented Design  
        - Introducing object-oriented --- Specifying attributes and behaviors.
    * Ch 2 - Objects in Python  
        - Creating Python classes



###Artiklar {#artiklar}

Läs följande:

1. Fräscha upp minnet med [Python 3.x Doc](https://docs.python.org/3/). Kika runt lite och orientera dig.

Följande artiklar är korta och bra att läsa:  
1. [Motivation for obejct-oriented](https://atomicobject.com/resources/oo-programming/introduction-motivation-for-oo).

1. [The object-oriented paradigm](https://atomicobject.com/resources/oo-programming/the-oo-paradigm).

1. [Naming conventions](https://atomicobject.com/resources/oo-programming/naming-conventions).

1. [Messaging](https://atomicobject.com/resources/oo-programming/messaging).

1. [Abstraction and identity](https://atomicobject.com/resources/oo-programming/abstraction-and-identity).



###Video  {#video}

Titta på följande:  

1. Videoserien [Lär dig objektorienterad Python](https://www.youtube.com/playlist?list=PLKtP9l5q3ce8cmKXE9Gw1Ra0GaYufGbN7) är tätt kopplat till kursmaterialet. Kika på de videor som börjar med 1.

1. Titta på de första 7-minuterna av [Object-oriented programming](https://www.youtube.com/watch?v=lbXsrHGhBAU).  

1. Tips från en tidigare student på en bra video [What is object-oriented programming?](https://www.youtube.com/watch?v=xoL6WvCARJY).


Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 8-10 studietimmar)*



###Labbmiljö {#labbmiljo}

Installera labbmiljön för kursen.

1. [Installera labbmiljön](oopython/labbmiljo) som behövs för kursen.

1. [Installera kommandot `dbwebb`  samt kursrepot för kursen](dbwebb-cli/clone).

Om detta är din första dbwebb-kurs så läser du också igenom hela [manual-sidan för kommandot `dbwebb`](dbwebb-cli).



###Övningar {#ovningar}

Genomför följande övning för att träna dig.

1. Läs på om "[UML och klassdiagram](kunskap/intro_till_klassdiagram)".

2. Läs igenom "Intro till guiden" och "Objekt och klasser" i guiden "[Kom igång med objektorienterad programmering i Python](guide/kom-igang-med-objektorienterad-programmering-i-python)".



###Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[Python med objekt och klasser](uppgift/python-med-objekt-och-klasser2)" (lab 1)



###Extra {#extra}

Det finns inga extrauppgifter.


Lämna in  {#resultat}
-----------------------------------------------

Läs [Lämna in och redovisa uppgift](./../redovisa) för att ta reda på hur ni lämna in era uppgifter när ni är klara.

