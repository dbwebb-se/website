---
author: aar
revision:
    "2022-02-18": (E, grm) Tog bort kapitlet om redovisning.
    "2020-02-21": (D, aar) Added optional dictionary material.
    "2019-02-22": (C, aar) Changed to be about Binary Search Tree.
    "2018-02-12": (B, aar) First version v2.
    "2017-11-10": (PB1, mos) Utkast till v2.
    "2017-02-14": (A, lew) First version.
...
Kmom07: Datastrukturen träd
====================================

Vi jobbar vidare med datastrukturer, algoritmer och rekursion genom att kolla på träd strukturer. Mer specifikt ska vi lära oss skapa ett Binärt sökträd och skapa algoritmer som kan traversera trädet rekursivt.

[WARNING]
Kursmomentet är under utveckling. Börja inte med materialet innan denna gula ruta är borta!
[/WARNING]

<!--more-->

[INFO]

Gör `dbwebb update` och `dbwebb init` innan du startar med kursmomentet.
[/INFO]

[FIGURE src=/image/oopython/kmom06/bst.svg caption="Ett binärt sökträd."]

Det finns två valfria delar i detta kmom som är repetition av Dictionaries från den första Pythonkursen. Detta är för att friska upp minnet av hur man jobbar med key/value par i datastrukturer och för projektet i kmom10 kan man välja mellan att använda sig av listor eller dictionaries. Tidigare år har det framkommit att många inte känner sig säkra på Dictionaries och därför valde alla att använda listor. Därför har jag lagt till material så man kan friska upp sitt minne av dictionaries, vilket förhoppningsvis gör att ni kan välja den metod som ni tycker verkar bäst/lättast och inte bara välja listor för att ni inte kommer ihåg dictionaries.


<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Läsanvisningar  {#lasanvisningar}
---------------------------------

*(ca: 1 studietimmar)*

###Kurslitteratur  {#kurslitteratur}

Läs följande:

Inget att läsa.



###Artiklar {#artiklar}

1. Läs vilka [fördelar som finns med BST över hash tables](https://www.geeksforgeeks.org/advantages-of-bst-over-hash-table/).

1. Läs om de olika [fördelarna med som finns för olika datastrukturer](http://careerdrill.com/blog/coding-interview/choosing-the-right-data-structure-to-solve-problems/).



###Video  {#video}

Titta på följande:

1. Kolla på de video som börjar med [kmom07 i spellistan](https://www.youtube.com/playlist?list=PLKtP9l5q3ce_PJCiQrnRxGtrfSFRBLvap).

1. [Gammal föreläsning](https://youtu.be/9NMhvR3jY6w?t=1951). Pratar allmänt om programmering, bl.a. att plugga programmering VS. jobba med programmering. Prata också om för- och nackdelar med objektorientering. Kolla från tidsstämpeln.



###Lästips {#lastips}

1. [How to use the Python debugger](https://www.digitalocean.com/community/tutorials/how-to-use-the-python-debugger). Lär er använda Pythons debugger för att stega igenom koden.



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 19 studietimmar)*



###Övningar {#ovningar}

1. Valfritt, friska upp minnet av dictionaries med övningen [Dictionaries och tuple i Python](kunskap/dictionaries-och-tupler-i-python).

1. Gör övningen [Träd datastrukturer](kunskap/trad-datastruktur).



###Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Valfritt, gör labben "[Dictionaries i Python](uppgift/python-med-dictionaries-i-oopython)"

1. Gör uppgiften "[Skapa ett Binary Search Tree](uppgift/binary-search-tree)"



###Extra {#extra}

Det finns inga extrauppgifter.

<!--Big O analys av deras kod!!!! kanske som vanlig uppgift om det går snabbt för dem med den smo finns -->


Lämna in  {#resultat}
-----------------------------------------------

Läs [Lämna in och redovisa uppgift](./../redovisa) för att ta reda på hur ni lämna in era uppgifter när ni är klara.
