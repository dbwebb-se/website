---
author:
    - aar
revision:
    "2023-02-17": (A, aar) Första upplagan.
category:
    - oopython
...
Fortsättning på Yahtzee spelet - del 5
===================================

Vad är poängen med en topplista om man inte tydligt kan se vem som har högst poäng?
<!--more-->

[FIGURE src="/image/oopython/kmom06/yahtzee5.png" caption="Yahtzee5 välj antal spelare."]

Ni ska skapa en ny vi där vi kan se vilka poäng spelare har fått. Poängen ska sparas i en fil och använda er egna UnorderedList.



Förkunskaper {#forkunskaper}
-----------------------

Du har gjort uppgiften "[Skapa lista](uppgift/skapa-lista)".  
Du har läst artikeln "[Klassiska sorteringsalgoritmer](kunskap/sorteringsalgoritmer-v2)".  
Du har läst artikeln "[Datastrukturer](kunskap/datastrukturer)".  



Introduktion {#intro}
-----------------------

Utöver att sortera topplistan ska ni också lägga till stöd för flera spelare.

[YOUTUBE src="9b0SbqyAWFM" caption="Andreas visar hur en färdig lösning kan se ut."]

<!-- [FIGURE src="/image/oopython/kmom06/yahtzee5.png" caption="Yahtzee5."] -->



Krav {#krav}
-----------------------

1. Kopiera er kod från `me/kmom05/yahtzee4` till `me/kmom06/yahtzee5`.

1. Skapa filen `src/sort.py` och kopiera in insertion sort från [artikeln](kunskap/sorteringsalgoritmer-v2#insertion-sort).  
`src/sort.py` ska inte innehålla någon klass. Det räcker med enbart funktion för algoritmen.

1. Justera Insertion sort funktionen så den kan sortera din `UnorderedList`. PS! När ni skapar sorterings algoritmerna **ska** ni använda er av metoderna på `Unorderdlist` objektet för att flytta på element. Ni ska **inte** hämta `head` och traversera noder med den i era algoritmer eller gör om det till en inbyggd lista.

2. I `src/sort.py` skapa en **rekursiv insertion** sort algoritm som kan sortera din lista. Döp den till `recursive_insertion`.

3. Använd din insertion sort för att sortera UnorderedList i topplista vyn. Sortera på antalet poäng.

4. Lägg till stöd för flera spelare med hjälp av en kö för att hålla koll på vilken spelares tur det är. Ni gör det genom att använda dequeue/peek för att få ut nuvarande spelare och enqueue för att lägga till spelare sist igen.
    - Om ni gjorde extrakravet i kmom05 och implementerade en egen Queue klass, kopiera in den filen i `src` och använd den. Annars, kopiera koden från [Datastrukturer#Queue](kunskap/datastrukturer#queue) och lägg i `src/queue.py`.
    - Jag rekommenderar att skapa en `to_list()` metod i `Queue` klassen så ni enkelt kan få ut datan för att spara i session.

5. Det är upp till er själva hur ni implementerar flera spelar i spelet. Tänk på att ni **ska** skriva objektorienterad kod och vi vill minimera mängden kod i `app.py`. Ni får skapa nya klasser och uppdatera de som redan finns.

6. Spelet ska ta slut när alla spelare har valt alla regler. I den nya vinnar vyn ska bara den som fick höst poäng få skriva in sitt namn till topplistan.

7. Försök jobba mot era objekt så mycket som möjligt i template filerna.

8. Lägg till tester för följande saker.
    - minst två "värdefulla" tester för din rekursiva insertion sort i `tests/test_sort.py`.

9. Testa, validera och publicera applikationen på studentservern.



```bash
# Ställ dig i kurskatalogen
dbwebb test yahtzee5
dbwebb publish yahtzee5
```

Rätta eventuella fel som dyker upp och validera igen. När det ser grönt ut så är du klar.



Extrauppgift {#extra}
-----------------------

1. Uppdatera klassdiagrammet så det stämmer med din nya kod, nya klasser, relationer och ändrade klasser. Här kan ni hitta en [draw.io fil för klassdiagrammen](/kursmaterial/oopython/yahtzee.drawio).

1. I din sorteringsalgoritm, gör så man kan skicka med `reverse` och använd det så att topplistan sorteras från högst till lägst.

1. I funktionen `insertion_sort` stöd att särskilja på heltal och strängar. Om en lista innehåller strängar och heltal ska heltalen sorteras till vänster och strängarna till höger, för sig.
Exempel [3, "b", 1, "a", 2] –> [1, 2, 3, "a", "b"].

1. Gör en implementation av Bubbel sort med rekursion, skapa funktionen `recursive_bubble` i `src/sort.py`.



Tips från coachen {#tips}
-----------------------

Lär dig felsöka med debuggern, använd den när du får problem. Komplettera med utskrifter av `print()`.

Validera ofta. Så slipper du en massa valideringsfel i slutet av övningen.

Lycka till och hojta till i forumet om du behöver hjälp!
