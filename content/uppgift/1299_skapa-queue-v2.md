---
author: aar
revision:
    "2023-02-10": (A, aar) Första versionen.
category:
    - oopython
...
Skapa queue
===================================

Vi ska bygga om datastrukturen "queue".  
Utgå från koden för en Queue från övningen om datastrukturer och skriv om den så den inte använder Pythons inbyggda lista utan istället använder Node objekt för att hålla datan.

<!--more-->

[YOUTUBE src=1Kj1qVpRD50 width=630 caption="Så här kan det se ut när det är färdigt."]



Förkunskaper {#forkunskaper}
-----------------------

Du har läst artikeln "[Exceptions](kunskap/exceptions)".  
Du har läst artikeln "[Datastrukturer](kunskap/datastrukturer)".  


Krav {#krav}
-----------------------

Alla kraven är för de som jobbar i grupp och ensamma. Det är inga specifika krav för de som jobbar i grupp.

1. Börja med att kopiera koden som ligger i [example/queue](https://github.com/dbwebb-se/oopython/tree/master/example/queue). Filen `main.py` är ett färdigt cli program som redan är implementerat och använder Pythons inbyggda kö. För att förstå hur programmet är uppbyggt kan ni kolla på [Skapa en menu loop utan if-satser](https://www.youtube.com/watch?v=7JSIjlAo9l4).


```bash
# Ställ dig i kurskatalogen
# börja med att uppdatera mappen med senaste exempelkoden
dbwebb update
cp -ri example/queue me/kmom05/
cd me/kmom05/queue
mkdir src
```

2. Skapa en fil med namnet `src/queue.py` i "queue" mappen. Kopiera koden [för en Queue](kunskap/datastrukturer#queue) och klistra in i queue.py filen.

1. Skapa en fil med namnet `src/node.py` i "queue" mappen. Kopiera koden [för en Node](kunskap/datastrukturer#nod) och klistra in i node.py filen.

1. Pythons inbyggda lista ska inte användas längre. Varje element i kön ska ligga i ett Node objekt och bilda en liststruktur.  
Byt namn på instans attributet `items` till `head` i Queue klassen. Använd `head` för att referera till första noden i kön.

1. Det är helt OK att lägga till fler metoder/attribut om man vill det i Queue klassen.

1. Skapa en fil med namnet `src/errors.py` i "queue" mappen. Här skall du skapa ett eget exception med namnet `EmptyQueueException`. Denna skall lyftas när man använder `peek()` eller `dequeue()` på en tom kö.

1. Byt ut så att `main.py` använder er egna Queue istället för Pythons.


```bash
# Ställ dig i kurskatalogen
dbwebb test queue --extra
dbwebb publish queue
```

Rätta eventuella fel som dyker upp och validera igen. När det ser grönt ut så är du klar.



Extrauppgift {#extra}
-----------------------

<!-- 1. Skapa ett sekvensdiagram över flödet som sker vid en valfri input från användaren. Spara det som "sekvens.png" i "queue" mappen. -->

1. Skapa ett klassdiagram över Queue klassen. Spara det som "klass.png" i "queue" mappen.

Tips från coachen {#tips}
-----------------------

Validera ofta. Så slipper du en massa valideringsfel i slutet av övningen.

Lycka till och hojta till i forumet om du behöver hjälp!
