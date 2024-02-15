---
author:
    - aar
revision:
    "2023-02-23": (B, aar) La till dunder metoderna som extrauppgifter.
    "2023-01-21": (A, aar) Första upplagan.
category:
    - oopython
...
Fortsättning på Yahtzee spelet - del 4
===================================

Som i alla spel behöver vi veta vem som är bäst, i denna uppgifter ska vi lägga till en topplista över spelares poäng.
<!--more-->

[FIGURE src="/image/oopython/kmom05/yahtzee4-addwinner.png" caption="Lägg till poäng i topplistan"]

Ni ska skapa en ny vi där vi kan se vilka poäng spelare har fått. Poängen ska sparas i en fil och använda er egna UnorderedList.



Förkunskaper {#forkunskaper}
-----------------------

Du har läst artikeln "[Exceptions](kunskap/exceptions)".  
Du har läst artikeln "[Datastrukturer](kunskap/datastrukturer)".  
Du har läst artikeln "[Hantera datan som utgör objekten](guide/kom-igang-med-objektorienterad-programmering-i-python/hanter_data)"



Introduktion {#intro}
-----------------------

Spelet ska följa de internationella reglerna och inte svenska reglerna. Här kan ni hitta [reglerna](https://gamerules.com/rules/yahtzee-dice-game/).

Nytt i denna uppgiften är att skapa en LeaderBoard klass som använder en UnorderedList och spara data i en fil.

Era klasser ska uppfylla beskrivningarna nedanför. Beskrivningarna är vad som måste finnas, ni får och är **rekommenderade** att skapa ytterligare metoder och attribut där ni tycker att det behövs.

[YOUTUBE src="Zze3YPVxUes" caption="Andreas visar hur en färdig lösning kan se ut."]

[FIGURE src="/image/oopython/kmom05/yahtzee4_full.png" caption="Klassdiagram för Yahtzee."]



### Unordered list {#unordered-list}

Vi ska skapa en egen datastruktur, en "Unordered list", som en klass. Unordered list kan liknas vid en vanlig lista i Python. Det ska gå att lagra element i den. En representation av en unordered list kan se ut såhär:

[FIGURE src=/image/oopython/kmom05/list1.png]

Nedanför ser vi ett klassdiagram för en UnorderedList klass. Under diagrammet beskrivs varje metod. Diagrammet ska uppfyllas av er implementation.

[FIGURE src=/image/oopython/kmom05/yahtzee4_2l.png caption="klassdiagram för UnorderedList och Node"]

- `__init__`: Skapa en tom lista.
- `append`: Lägg till nytt element/nod sist i listan.
- `set`: Skriv över element med ny data som finns på index. Om index inte finns lyft `MissingIndex` exception.
- `size`: Returnera antalet element i listan. En tom lista har storleken 0.
- `get`: Returnera värde på index. Om index inte finns lyft `MissingIndex` exception.
- `index_of`: Om data finns i listan returnera dess index. Om värdet inte finns lyft `MissingValue` exception.
- `print_list`: Skriv ut listans innehåll.
- `remove`: Ta bort nod med samma data. Om värdet inte finns lyft `MissingValue` exception. Om det finns flera noder med värdet, ta bara bort första.

**TIPS** skapa `append` och `get` tidigt, de behövs för testerna.

**TIPS** För att exekvera er UnorderedList kod separat från resten av koden kan ni skriva `python3 -m src.unorderedlist`. Det kan ni använda för att testa köra koden när ni utvecklar den.



### Leaderboard {#scoreboard}

Denna klassen ska innehålla hur många poäng olika spelare har fått när de har spelat klart. Ni ska använda er av UnorderedList för att hålla namn och poäng för varje klart spel som har sparats.

[FIGURE src="/image/oopython/kmom05/yahtzee4_2r.png" caption="Klassen Leaderboard"]

Metoderna i diagrammet **måste** finnas, i övrigt får ni själva bestämma hur klassen ska implementeras. Konstruktorn får ni själva bestämma vad som behövs för att skapa ett nytt objekt. Ni kan också lägga till fler metoder och attribut.

#### Attribut {#attr}

- `entries`- Ska innehålla ett UnorderedList objekt.



#### Metoder {#met}

- `__init__(entries=None)` - Konstruktorn ska skapa UnorderedList objektet. Parametern `entries` ska ha default värdet `None`. Det ska kunna ta ett vanligt `list` objekt med sparade name och poäng. Om en lista skickas med ska ni ta elementen från listan och lägga i ert UnorderedList objekt.

- `load(filename)` - Ska vara en klassmetod. Metoden ska läsa upp data från fil med filnamnet, skapa ett `Leaderboard` objekt med data från filen och sen returnera det skapade `Leaderboard`objektet.

- `save(filename)` - Metoden ska spara datan från `enteries` till fil med filnamnet. Datan ska vara strukturerad i filen så att ni kan läsa upp den i `load()` och återskapa `Leaderboard` objektet. **PS** Om du får `permission denied` på studentservern, kör `sudo chmod 777 din-fil` lokalt och gör dbwebb publish igen.

- `add_entry(name, score)` - Metoden ska lägga till namn och poäng i `entries`.

- `remove_entry(index)` - Metoden ska ta bort elementet med index värde från `entries`.


Tips! I `app.py`, för ert `Leaderboard` objekt ska ni inte spara något i `session`. Nu ska ni använda `save()` och `load()` för att spara och läsa data från fil istället. På det sättet kan vi göra datan permanent.


Krav {#krav}
-----------------------

1. Kopiera er kod från `me/kmom04/yahtzee3` till `me/kmom05/yahtzee4`.

1. Implementera `Node` klassen i `yahtzee4/src/node.py`.

1. Implementera Exception klasserna `MissingIndex` och `MissingValue` i `yahtzee4/src/errors.py`

1. Implementera `UnorderedList` klassen i `yahtzee4/src/unorderedlist.py`.

2. Implementera `Leaderboard` klassen i  `yahtzee4/src/leaderboard.py`. Ett `UnorderedList` objekt ska användas för att hålla spelare och dess poäng. Tips, använd en tuple för att hålla namn och poäng som ett element.

3. Använd en fil för att spara data från `Leaderboard` klassen.

4. När spelaren har använt alla regler och vunnit ska spelaren se hur många poäng den fick och få upp ett formulär där användaren kan skriva in sitt namn. Formuläret ska skickas till en route där namnet och dess poäng läggs till i ett `Leaderboard` objekt. Spara ner den uppdatera datan till fil.

5. Skapa en ny vy för att visa upp topplistan, använd en tabell för att visa namn och poäng spelare har fått. I er template fil **ska** ni jobba mot ett `UnorderedList` objekt, ni får inte plocka ut data från det, lägga i en vanlig lista och sen jobba mot den vanliga listan.

6. I tabellen för topplistan ska man kunna välja att radera ett inlägg i topplistan, då ska det även tas bort från filen.

7. I topplista vyn ska det skrivas ut hur många sparade inlägg som finns.

8. Lägg till tester för följande saker. Kolla på [Testa exceptions](https://youtu.be/ePkZEOHhk-s) för att se hur man fångar exceptions i ett test:
    - UnorderedList klassen:
        - `get()` - kolla att exception lyfts om index inte finns.
        - `get()` - kolla att rätt värde returneras om index finns.
        - `remove()` - kolla att exceptions lyfts om värde saknas.
        - `remove()` - kolla att listan är korrekt efter element har tagits bort om värdet finns.

9.  Testa, validera och publicera applikationen på studentservern.



```bash
# Ställ dig i kurskatalogen
dbwebb test yahtzee4
dbwebb publish yahtzee4
```

Rätta eventuella fel som dyker upp och validera igen. När det ser grönt ut så är du klar.



Extrauppgift {#extra}
-----------------------

1. Använd `datetime` modulen för att spara dag och tid som spelaren fick sin poäng. Visa upp det i topplista routen också.

1. Implementera den [magiska metoden __len__](https://docs.python.org/3/reference/datamodel.html#object.__len__) för din UnorderedList. Gör så `len(list)` fungerar.

1. Implementera den [magiska metoden __str__](https://docs.python.org/3/reference/datamodel.html#object.__str__) för din UnorderedList. Gör så `print(list)` och `str(list)` fungerar.

1. Implementera den [magiska metoden __getitem__](https://docs.python.org/3/reference/datamodel.html#object.__getitem__) för din UnorderedList. Gör så `list[0]` fungerar.

1. Implementera den [magiska metoden __setitem__](https://docs.python.org/3/reference/datamodel.html#object.__setitem__) för din UnorderedList. Gör så `list[0] = 4` fungerar.



Tips från coachen {#tips}
-----------------------

Lär dig felsöka med debuggern, använd den när du får problem. Komplettera med utskrifter av `print()`.

Validera ofta. Så slipper du en massa valideringsfel i slutet av övningen.

Lycka till och hojta till i forumet om du behöver hjälp!
