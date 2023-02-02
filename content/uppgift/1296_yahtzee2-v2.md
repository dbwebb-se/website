---
author:
    - aar
    - grm
revision:
    "2023-01-27": (A, aar) Första upplagan.
category:
    - oopython
...
Yahtzee spelet del 2
===================================

I denna uppgiften ska ni fortsätta med Yahtzee spelet ni började på i kmom01.

<!--more-->

Ni kommer att fortsätta utveckla spelet igenom flera kursmoment. I denna uppgiften skapar vi alla regler och anger vilken regel som ska användas. Poängsumman sparar vi och visar liksom föregående tärningsslag.



Förkunskaper {#forkunskaper}
-----------------------

Ni har gått igenom delarna “Intro till guiden” och “Klass relationer” i guiden "[Kom igång med objekt](guide/kom-igang-med-objektorienterad-programmering-i-python)".

Ni har jobbat igenom övningen "[Flask, POST och GET](kunskap/flask-get-post-session)".

Ni har jobbat igenom övningen med UML del 2.

Om ni har gjort övningarna så har ni nästan kommit i mål med uppgiften.



Introduktion {#intro}
-----------------------

Ni ska som sagt utveckla ett Yahtzee spel över flera kursmoment.

Spelet ska följa de internationella reglerna och inte svenska reglerna. Här kan ni hitta [reglerna](https://gamerules.com/rules/yahtzee-dice-game/). Denna veckan ska vi skapa klasserna för reglerna. Vi ska kunna välja regel och visa dess poängsumman. Vi ska dessutom visa föregående tärningsslag.

Era klasser ska uppfylla beskrivningarna nedanför. Beskrivningarna är vad som måste finnas, ni får och är **rekommenderade** att skapa ytterligare metoder och attribut där ni tycker att det behövs.



### Die {#die}

Lägg till en ny metod.

- `__eq__(die:Die/value:int)` ska kunna ta emot ett Die objekt eller ett heltal. Om tärningarna innehåller samma värde ska `True` returneras, annars `False`. Samma gäller om heltaltet är samma som tärningens värde.



#### Hand {#hand}

Lägg till en ny metod.

- `to_list()` ska returnera en lista som innehåller värdet (`int`) på alla tärningarna i Hand objektet.



### Rule {#rule}

Denna klassen är en **abstrakt** klass och representerar en regel. Det ska finnas en subklass för varje sätt att få poäng.

[FIGURE src="/image/oopython/kmom02/yahtzee2-rules.png" caption="Klassen Rule och dess subklasser"]

#### Attributen {#rule-attr}

Inga.

#### Metoderna {#rule-met}

- `points(hand: Hand)` - metoden är abstrakt och ska innehålla `pass`. Syftet med metoden är att räkna ut hur många poäng man får med en Hand med en regel.



### SameValueRule {#same-value-rule}

Denna klassen ärver från `Rule` och representerar reglerna i övre delen, antalet 1:or, 2:or, 3:or etc. Se klassdiagrammet "Klassen Rule och dess subklasser" ovan.

#### Attributen {#same-value-rule-attr}

- `name` - Ska innehålla namnet på regeln, t.ex. "Ones" för regeln Ones osv.
- `value` - Ska innehålla värdet för regeln, t.ex. 1 för regeln Ones, 2 för regeln Twos.

#### Metoderna {#same-value-rule-met}

- `__init__(name:str, value: int)` - inga defaultvärden
- `points(hand: Hand)` - ska ta emot ett Hand objekt som argument. Metoden ska räkna ut hur många av tärningarna som har samma värde som värdet i `value` och returnera vad det blir i poäng. T.ex. 3 för 3 stycken 1:or om det är i subklassen Ones.



### Ones {#ones}

Denna klassen ärver från `SameValueRule` och representerar regeln med 1:or. Se klassdiagrammet "Klassen Rule och dess subklasser" ovan.

#### Attributen {#ones-attr}

Inga.

#### Metoderna {#ones-met}

- `__init__()` - anropar basklassens konstruktor. Se kodexempel.
```python
...
def __init__(self):
    super().__init__(1, "Ones")
...       
```

**Klasserna** `Twos`, `Threes`, `Fours`, `Fives` och `Sixes` är uppbyggda på samma sätt.


### ThreeOfAKind {#three-of-a-kind}

Denna klassen representerar regeln minst 3 likadana tärningar. Se klassdiagrammet "Klassen Rule och dess subklasser" ovan.

#### Attributen {#three-of-a-kind-attr}

- `name` - Ska innehålla namnet på regeln, t.ex. "Three Of A Kind".

#### Metoderna {#three-of-a-kind-met}

- `__init__()` - sätter namnet på regeln. Se kodexempel.
```python
...
def __init__(self):
    self.name = "Three of a kind"
...       
```
- `points(hand: Hand)` - ska returnera poängsumman för regeln. Om handen innehåller minst 3 tärningar med samma värde blir poängen summan av alla tärningar i handen. Oavsett vilket värde det finns 3 av så blir poängen summan av alla 5 tärningar.



### Resterande regler {#rest}

De andra klasserna för de andra reglerna FourOfAKind, FullHouse, SmallStraight, LargeStraight, Yahtzee och Chance är uppbyggda på samma sätt som ThreeOfAKind.

#### FourOfAKind {#four-of-a-kind}

FourOfAKind poäng sätts likadant som ThreeOfAKind, om man har minst fyra likadana tärningar så blir poängen summan av alla tärningar.

#### FullHouse {#full-house}

För att ha FullHouse behöver tärningarna vara två av samma tal och triss av ett annat tal. Poängen för en FullHouse är alltid 25, oavsett vilka tärningar det är. T.ex. handen `[1, 1, 6, 6, 6]` är värd 25 poäng.

#### SmallStraight {#small-straight}

För att ha SmallStraight behöver handen innehålla fyra sekventiella värden och en SmallStraight är alltid värd 30 poäng, oavsett vilka tärningar som utgör den. T.ex. `[6, 1, 3, 2, 4]` är värd 30 poäng.

#### LargeStraight {#large-straight}

För att ha LargeStraight behöver alla värden i handen vara i sekventiell ordning och en LargeStraight är alltid värd 40 poäng, oavsett vilka tärningar som utgör den. T.ex. `[5, 1, 3, 2, 4]` är värd 40 poäng.

#### Yahtzee {#yahtzee}

För att ha Yahtzee måste alla tärningar i handen ha samma värde och en Yahtzee är alltid värd 50 poäng, oavsett vilka tärningar som utgör den. T.ex. `[1, 1, 1, 1, 1]` är värd 50 poäng.

Vi **skippar** Yahtzee bonus regeln som står med i regel dokumentet som är länkat i början.

#### Chance {#chance}

Chance innebär att summan av alla tärningar i handen blir hur mycket poäng regeln är värd. T.ex. `[1, 1, 1, 1, 1]` är värd 5 poäng



Krav {#krav}
-----------------------

När ni är färdiga kan det se ut så här:

[FIGURE src="/image/oopython/kmom02/yahtzee2.png" caption="Bild efter 1 slag och regeln Threes vald"]

1. Kopiera er kod från `me/kmom02/yahtzee1` till `me/kmom03/yahtzee2`.

1. Implementera de nya metoderna för Die och Hand.

1. Gör nya klassdiagram för Die och Hand, inkludera relation och kardinalitet. Spara dem som `uml.png` i `yahtzee2` mappen. Rita gärna i [draw.io](https://www.draw.io/). Ni kan utgå från diagrammen som finns i [Yahtzee1 uppgiften](uppgift/yahtzee1-v2#die).

1. Lägg till ett test för Die klassen i `me/kmom03/yahtzee2/tests/test_die.py`. Testa följande saker i Die klassen:
    1. Att `__eq__()` returnerar rätt vi jämförelse med ett annat Die objekt.

1. Skapa tester för Hand klassen i `me/kmom03/yahtzee2/tests/test_hand.py`. Testa följande saker i Hand klassen:
    1. Att skapa ett objekt utan skicka argument till konstruktorn.
    1. Att skapa ett objekt och skicka lista med tärningsvärden till konstruktorn.

1. Implementera koden för Rule enligt klassdiagrammen ovanför. Spara alla klasser i filen `me/kmom03/yahtzee2/src/rules.py`.

1. Lägg till radiobuttons för de olika reglerna i ett formulär med en submit-knapp. Bredvid en radiobutton för en viss regel ska namnet på regeln skrivas ut, t.ex. "Three of a kind". Här kan ni se hur man gör [radiobuttons i ett formulär](https://www.w3schools.com/tags/tryit.asp?filename=tryhtml5_input_type_radio).

1. Vid varje regel ska det också visas hur många poäng respektive regel är värd men nuvarande hand.

1. Varje gång användaren använder formuläret för att få poäng för en regel, spara den totala poängsumman i session och visa upp den på sidan.

1. Använd session för att spara värdet på föregående hand och visa upp det överst på webbsida, "Last die rolls". Spara nuvarande värde på tärningarna med `to_list()` till sessionen innan du slår om tärningarna.

1. Lägg till en route `reset` som nollställer sessionen och därmed startar om spelet. Lägg till den i navbaren.

1. Testa, validera och publicera applikationen på studentservern.



```bash
# Ställ dig i kurskatalogen
dbwebb test yahtzee2
dbwebb publish yahtzee2
```

Rätta eventuella fel som dyker upp och validera igen. När det ser grönt ut så är du klar.



Extrauppgift {#extra}
-----------------------

Det finns inga extrauppgifter.



Tips från coachen {#tips}
-----------------------

Lär dig felsöka med debuggern, använd den när du får problem. Komplettera med utskrifter av `print()`.

Validera ofta. Så slipper du en massa valideringsfel i slutet av övningen.

Lycka till och hojta till i forumet om du behöver hjälp!
