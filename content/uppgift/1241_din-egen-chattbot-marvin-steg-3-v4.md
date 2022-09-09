---
author:
  - moc
  - aar
category: python
revision:
  "2022-09-09": (B, aar) La till nytt extra krav för pick.
  "2020-03-30": (A, moc) Ny version för att introducerar automaträttning.
...
Din egen chattbot - Marvin - steg 3
==================================

Programmering och problemlösning i Python. Jobba vidare med Marvin och implementera ny funktionalitet som använder listor.

<!--more-->


Förkunskaper {#forkunskaper}
-----------------------

Du kan grunderna i Python och stränghantering, funktioner och du har byggt [andra delen](uppgift/din-egen-chattbot-marvin-steg-2-v4) av Marvin.



Introduktion {#intro}
-----------------------

Du skall bygga en ryggsäck till Marvin med hjälp av **listor**.

Du skall kommunicera med Marvin via text och inte via ett menyval.

Se hur det kan se ut när uppgiften är klar:

[ASCIINEMA src=B7hLyjHGlGbUwj9c6JoTnONRB]



Krav {#krav}
-----------------------

1. Kopiera din Marvin från föregående kursmoment och utgå från den koden.

```bash
# Flytta till kurskatalogen
cd me
cp -ri kmom03/marvin2/* kmom04/marvin3/
cd kmom04/marvin3
```

2. Skapa en ny fil `inventory.py` där du lägger **alla nya** funktioner för inventory kommandona. Importera inventory.py i main.py. Skapa en lista i main.py som ska fungera som en ryggsäck.

3. Lär Marvin att hantera listor. Skapa funktionen `pick` som tar emot tre argument, den första skall vara ryggsäcken, den andra skall vara saken man skall plocka upp och den tredje skall vara en optionell parameter som säger vilken position (index) saken skall lägga sig i. Funktionen ska lägga till saken i listan, om position skickas med ska saken tryckas in på den platsen (du ska inte skriva över det som redan ligger på den platsen, de sakerna ska flyttas ett index åt höger). Om position inte skickas med ska saken läggas till sist i ryggsäcken. Funktionen skall returnera den uppdaterade ryggsäcken.

   I `main.py` skall du lägga till stöd för kommandot **"inv pick"** enligt tabellen nedan. Om allt gick bra skall du skriva ut ett passande meddelande som innehåller vad som lades till i ryggsäcken och på vilken position om ett index är givet. Meddelandet skall skivas ut i funktionen och inte main programmet.

    - Tags: `pick`

4. Skapa funktionen `inventory` som tar emot ett argument, ryggsäcken. Funktionen skall inte returnera någonting. Den skall skriva ut ett meddelande som innehåller hur många saker som befinner sig i ryggsäcken och alla saker som ligger där inne. I `main.py` lägger du till stöd för kommandot **inv** som exekverar funktionen.
    - Tags: `inv`

5. Skapa funktionen `drop` som skall kasta bort en sak från ryggsäcken. Den skall ta emot två argument, första är ryggsäcken och den andra är saken som skall slängas. Funktionen skall returnera den uppdaterade ryggsäcken. I `main.py` skall du lägga till stöd för kommandot **"inv drop"** enligt tabellen nedan. Om allt gick bra skall du skriva ut ett passande meddelande som innehåller saken som kastades. Meddelandet skall skivas ut i funktionen och inte main programmet.
    - Tags: `drop`

6. Skapa funktionen `swap` som skall ta emot tre argument, den första är ryggsäcken, den andra och tredje är själva sakerna som skall byta plats. Funktionen skall returnera den uppdaterade ryggsäcken. I `main.py` skall du lägga till stöd för kommandot **"inv swap"** enligt tabellen nedan. Om allt gick bra skall du skriva ut ett passande meddelande med de sakerna som bytte plats. Meddelandet skall skivas ut i funktionen och inte main programmet.
    - Tags: `swap`

7. Felhantering. Lägg till felhantering för kommandona **"inv drop"**, **"inv swap"** och **"inv pick"** som ändrar utsikten och det värdet som skall returneras. Om en sak man vill kasta eller byta plats på inte finns i ryggsäcken skall du skriva ett passande felmeddelande som innehåller ordet "Error" och saken som inte existerar i ryggsäcken.

    Om man anger ett för högt index i pick kommandot skall den inte plocka upp något. Du skall istället skriva ut ett passande meddelande som innehåller ordet "Error" och den givna positionen.

    När ett av dessa fel uppstår skall funktionerna returnera den originella ryggsäcken.

    - Tags: `error`

Följande kommandon skall fungera. Notera att Marvin ska kunna plocka upp vad som helst. Nedan visas `flower`, `book` och `0` **enbart som exempel**, `bag` motsvarar Marvins ryggsäck.

| Kommando               | Vad händer                                                                  | Kallar på                     | Listans innehåll efter |
|------------------------|:----------------------------------------------------------------------------|-------------------------------|------------------------|
| inv                    | Marvin skall skriva ut hur många saker om finns i listan samt skriva ut dem | `inventory(bag)`              | []                     |
| inv pick flower        | Plocka upp en "flower" och lägg den på slutet av listan                     | `pick(bag, "flower")`         | ["flower"]             |
| inv pick book 0        | Plocka upp en "book" och på index "0"                                       | `pick(bag, "book", 0)`        | ["book", "flower"]     |
| inv swap flower book   | Byter plats på "flower" och "book"                                          | `swap(bag, "flower", "book")` | ["flower", "book"]     |
| inv drop flower        | Kasta bort "flower"                                                         | `drop(bag, "flower")`         | ["book"]               |

7. Testa, validera och publicera din kod enligt följande.

```bash
# Flytta till kurskatalogen
dbwebb test marvin3
dbwebb validate marvin3
dbwebb publish marvin3
```

Rätta eventuella fel som dyker upp och publicera igen. När det ser grönt ut så är du klar.



Extrauppgift {#extra}
-----------------------


- Utöka menyval **inv** med stöd för en sekvens. Utöver att fungera som tidigare ska det också gå att skriva `inv <start> <stop>`, där `<start>` och `<stop>` är heltal. Ändra `inventory(bag)` så du kan skicka med start och stop, `inventory(bag, start, stop)`. I funktionen använd dig av slice på din lista för att hämta ut alla element från start till stop. Om man inte skickar med start och stop ska `inv` fungera som vanligt.

    ```python
    # med inventory ["ko", "lo", "apa"]
    input: "inv 1 3"        output: "lo, apa"

    input: "inv -1 3"       output: "apa"
    ```

    - Tags: `inv`, `range`


- Utöka menyval **pick** med stöd för en sekvens. Utöver att fungera som tidigare ska det också gå att skriva `inv pick <sak>,<sak>,<sak> <position>`, där sekvensen med saker är ord med komma i mellan och `<position>` är heltal. Ändra `pick(bag, what, where)` så du kan kan ta emot en sträng med flera saker. Precis som med vanliga `pick` så ska `position` vara optionellt. Om man inte skickar med en position ska alla saker läggas till sist i ryggsäcken. Om man skickar med position ska de läggas in på det index, utan att ta bort sakerna som redan finns där. `pick` ska fortfarande funka som vanlig om man inte skicka en en sträng med kommatecken i.

    ```python
    # med inventory ["ko", "lo", "apa"]
    input: "inv pick mus,tjur"        returnerar: ["ko", "lo", "apa", "mus", "tjur"]

    input: "inv pick mus,tjur 1"       returnerar: ["ko", "mus", "tjur", "lo", "apa"]
    ```

    - Tags: `pick`




Tips från coachen {#tips}
-----------------------

Felsöka med debuggern.

Validera ofta. Så slipper du en massa valideringsfel i slutet av övningen.

Lycka till och hojta till i forumet om du behöver hjälp!
