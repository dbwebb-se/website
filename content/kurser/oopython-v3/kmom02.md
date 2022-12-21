---
author: aar
revision:
    "2022-01-14": (C, aar, grm) Bytt uppgift och lagt till övningar.
    "2018-11-16": (B, aar) Uppdaterat länkar och redv. frågor.
    "2017-11-10": (PB1, mos) Utkast till v2.
    "2017-01-06": (A, mos) Lade till CGI på studentservern.
...
Kmom01: Kom igång med objekt och Flask
====================================

Vi ska börjar kursen med grunderna om objekt och klasser. Vid sidan av ska vi arbeta med ett mini-ramverk, "Flask". Vi kommer jobba mer med Flask-appen genom kursens gång, samt titta på mer tekniker och strukturer angående objektorienterad programmering.

<!--more-->

[WARNING]
Kursmomentet är under utveckling. Börja inte med materialet innan denna gula ruta är borta!
[/WARNING]

[INFO]

Gör `dbwebb update` och `dbwebb init` innan ni börjar jobba med kursmomentet.

[/INFO]

[FIGURE src=/image/oopython/kmom01/flask1.png?w=w2 caption="En enkel me-sida med Flask."]



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

1. [Python 3 Object-oriented Programming](kunskap/boken-python3-object-oriented-programming)  
    * Ch 1 - Object-oriented Design  
        - Introducing object-oriented --- Specifying attributes and behaviors.
    * Ch 2 - Objects in Python  
        - Creating Python classes



###Artiklar {#artiklar}

Läs följande:

1. Fräscha upp minnet med [Python 3.x Doc](https://docs.python.org/3/). Kika runt lite och orientera dig.

1. Titta på [Flasks hemsida](http://flask.pocoo.org/). Försök få en snabb överblick av vad Flask är.

Följande artiklar är korta och bra att läsa:  
1. [Motivation for obejct-oriented](https://atomicobject.com/resources/oo-programming/introduction-motivation-for-oo).

1. [The object-oriented paradigm](https://atomicobject.com/resources/oo-programming/the-oo-paradigm).

1. [Naming conventions](https://atomicobject.com/resources/oo-programming/naming-conventions).

1. [Messaging](https://atomicobject.com/resources/oo-programming/messaging).

1. [Abstraction and identity](https://atomicobject.com/resources/oo-programming/abstraction-and-identity).



###Video  {#video}

Titta på följande:  

1. Videoserien [Lär dig objektorienterad Python](https://www.youtube.com/playlist?list=PLKtP9l5q3ce8cmKXE9Gw1Ra0GaYufGbN7) är tätt kopplat till kursmaterialet. Kika på de videor som börjar med 1.

1. Titta på följande videos om Flask av "TheNewBoston":  

    * [Basic app](https://www.youtube.com/watch?v=ZVGwqnjOKjk)  
    * [Routing](https://www.youtube.com/watch?v=27Fjrlx4s-o)

1. Titta på de första 7-minuterna av [Object-oriented programming](https://www.youtube.com/watch?v=lbXsrHGhBAU).  

1. Tips från en tidigare student på en bra video [What is object-oriented programming?](https://www.youtube.com/watch?v=xoL6WvCARJY).

###Lästips {#lastips}

Om du känner att du har tid och lust.

1. [Python 3 Object-oriented Programming](kunskap/boken-python3-object-oriented-programming)  
    * Ch 4 - Expecting the Unexpected.

1. Kika på [Jinja2's dokumentation](http://jinja.pocoo.org/).



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

3. Läs igenom artikeln om enhetstester "[Introduktion till enhetstester](kunskap/unittest-i-python_1)".

**Tips** från coachen, gör lab1 innan ni fortsätter med resten av övningarna.

4. Introducera dig själv med pip och venv, "[Python pakethantering med venv](kunskap/python-virtuel-miljo)".

5. Kom igång och gör din första webbapplikation i Python tillsammans med övningen "[Flask och Jinja2](kunskap/flask-med-jinja2)".

6. Gör din [Flask applikation som ett CGI-skript](coachen/flask-som-cgi-script) och publicera på studentservern med `dbwebb publish`. Ni behöver inte göra sista delen `Lägg till CGI i Apache webbserver` för detta behöver bara fungera på studentservern, **alltså inte lokalt**.



###Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[Python med objekt och klasser](uppgift/python-med-objekt-och-klasser2)" (lab 1)

2. Gör uppgiften "[Grunden för ett Yahtzee spel](uppgift/yahtzee1)".



###Extra {#extra}

Det finns inga extrauppgifter.


Lämna in  {#resultat}
-----------------------------------------------

Läs [Lämna in och redovisa uppgift](./../redovisa) för att ta reda på hur ni lämna in era uppgifter när ni är klara.

