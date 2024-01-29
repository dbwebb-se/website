---
author:
    - aar
    - grm
revision:
    "2024-01-17": (A, aar) Första upplagan.
category:
    - oopython
...
Yahtzee spelet del 2 - klasser
===================================

I denna uppgiften ska ni fortsätta med Yahtzee spelet ni började på i kmom02.

<!--more-->

Ni kommer att fortsätta utveckla spelet igenom flera kursmoment. I denna uppgiften skapar vi alla regler ger spelaren möjlighet att välja regler. Vi jobbar inte något med Flask och det grafiska, det sparar vi till nästa vecka.



Förkunskaper {#forkunskaper}
-----------------------

Ni har gått igenom guiden "[Kom igång med objekt](guide/kom-igang-med-objektorienterad-programmering-i-python)".



Introduktion {#intro}
-----------------------

Ni ska som sagt utveckla ett Yahtzee spel över flera kursmoment.

Spelet ska följa de internationella reglerna och inte svenska reglerna. Här kan ni hitta [reglerna](https://gamerules.com/rules/yahtzee-dice-game/). Denna veckan ska vi skapa klasserna för reglerna. Vi ska kunna välja regel och visa dess poängsumman. Vi ska dessutom visa föregående tärningsslag.

Era klasser ska uppfylla beskrivningarna nedanför. Beskrivningarna är vad som måste finnas, ni får och är **rekommenderade** att skapa ytterligare metoder och attribut där ni tycker att det behövs.


#### Diagram {#uml}

Klassdiagram över klasserna ni ska skapa. **Dia** och **Hand** är tomma för de klassdiagrammen ska ni fylla i själva.

[FIGURE src="/image/oopython/kmom03/yahtzee2-v2.png" caption="Klassen Rule, dess subklasser och Scoreboard"]

PS. Jag har lagt en kompositions pil mellan Rule och Scoreboard, ni måste inte göra en sån implementation jag ritade den för att visa att Scoreboard behöver objekt från alla regel klasser. Egentligen borde det vara en pil både från Scoreboard och Hand till varje regel klass men jag det blir för rörigt då, därför har jag bara dragit till Rule klassen.



### Die {#die}

Lägg till en ny metod.

- `__eq__(die:Die/value:int)` ska kunna ta emot ett Die objekt eller ett heltal. Om tärningarna innehåller samma värde ska `True` returneras, annars `False`. Samma gäller om heltaltet är samma som tärningens värde.



#### Hand {#hand}

Lägg till en ny metod.

- `to_list()` ska returnera en lista som innehåller värdet (`int`) på alla tärningarna i Hand objektet.



### Rule {#rule}

Denna klassen är en **abstrakt** klass och representerar en regel. Det ska finnas en subklass för varje sätt att få poäng.

#### Attributen {#rule-attr}

Inga.

#### Metoderna {#rule-met}

- `points(hand: Hand)` - metoden är abstrakt och ska vara tom. Syftet med metoden är att räkna ut hur många poäng man får med en Hand med en regel.



### SameValueRule {#same-value-rule}

Denna klassen ärver från `Rule` och representerar reglerna i övre delen, antalet 1:or, 2:or, 3:or etc. Se klassdiagrammet "Klassen Rule och dess subklasser" ovan.

#### Attributen {#same-value-rule-attr}

- `value` - Ska innehålla värdet för regeln, t.ex. 1 för regeln Ones, 2 för regeln Twos.
- `name` - Ska innehålla namnet på regeln, t.ex. "Ones" för regeln Ones osv.

#### Metoderna {#same-value-rule-met}

- `__init__(value: int, name:str)` - inga defaultvärden
- `points(hand: Hand)` - ska ta emot ett Hand objekt som argument. Metoden ska räkna ut hur många av tärningarna som har samma värde som värdet i `value` och returnera vad det blir i poäng. T.ex. 4 för 2 stycken 2:or om det är i subklassen Twos.



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



### Scoreboard {#scoreboard}

Denna klassen ska innehålla hur många poäng spelaren har samlat på sig och vilka regler som spelaren har fått poäng för. Hur ni implementerar denna klassen är inte lika reglerat som i tidigare uppgifter. Ni får göra lite egna val.

[FIGURE src="/image/oopython/kmom03/uml_scoreboard.png" caption="Klassen Scoreboard"]

Metoderna i diagrammet **måste** finnas, i övrigt får ni själva bestämma hur klassen ska implementeras. Konstruktorn får ni själva bestämma vad som behövs för att skapa ett nytt objekt. Ni kan också lägga till fler metoder och attribut.

#### Attribut {#attr}

Det är upp till er själva vilka attribut ni vill ha. Datan som ska finnas i ett objekt är de olika reglerna och hur många poäng spelaren har fått för de olika reglerna.

Attributet ni väljer att använda för att hålla poängen, ska vara **privat**.



#### Metoder {#met}

- `get_total_points()` - Metoden ska returnera hur många poäng spelaren har samlat på sig än så länge.

- `add_points(rule_name, hand)` - Metoden ska lägga till poäng för en hand för en specifik regel. **Om** spelaren redan har fått poäng för den regeln ska ett `ValueError` lyftas och inga poäng ges.

- `get_points(rule_name)` - Metoden ska returnera hur många poäng spelaren har fått för en regel. Om regeln inte har använts för att ge poäng, returnera `-1`.

- `finished()` - Metoden ska returnera `True` om alla regler har använts en gång för att få poäng, annars `False`.

- `from_dict(points)` - Det ska vara en **classmethod** som används för att skapa ett nytt Scoreboard objekt. Metoden ska ta emot en dictionary där nycklarna är namn på regler och värdena är hur många poäng som de reglerna har fått. Värdet `-1` används för att markera att en regel inte har använts för att få några poäng. Här finns ett exempel på en [dictionary som kan användas som argument](https://gist.github.com/AndreasArne/8e4bb6d5ca5392d4c9a763346c7e02dd). **Tips** skapa denna metoden tidigt, testerna använder sig av den för att skapa objekt att testa på.



Krav {#krav}
-----------------------

1. Kopiera er kod från `me/kmom02/yahtzee1` till `me/kmom03/yahtzee2`.

1. Implementera de nya metoderna för Die och Hand.

1. Lägg till ett test för Die klassen i `me/kmom03/yahtzee2/tests/test_die.py`. Testa följande saker i Die klassen:
    1. Att `__eq__()` returnerar rätt vi jämförelse med ett annat Die objekt.

1. Skapa tester för Hand klassen i `me/kmom03/yahtzee2/tests/test_hand.py`. Testa följande saker i Hand klassen:
    1. Att skapa ett objekt utan skicka argument till konstruktorn.
        - För att verifiera att det funkar som det ska räcker det **inte** med att bara kolla att ni har skapat ett objekt.
        - Använd `random.seed()` för att kunna verifiera att ett objekt har skapats på korrekt sätt.
    1. Att skapa ett objekt och skicka lista med tärningsvärden till konstruktorn.
    1. Att `to_list()` returnerar en lista med tärningarnas värde.

1. Implementera koden för Rule enligt klassdiagrammen ovanför. Spara alla klasser i filen `me/kmom03/yahtzee2/src/rules.py`.

1. Implementera koden för Scoreboard enligt klassdiagrammen ovanför. Spara koden i filen `me/kmom03/yahtzee2/src/scoreboard.py`.

1. Gör nya klassdiagram för Die och Hand, inkludera relation och kardinalitet. Spara dem som `uml.png` i `yahtzee2` mappen. Rita gärna i [draw.io](https://www.draw.io/). Ni kan utgå från diagrammen som finns i [Yahtzee1 uppgiften](uppgift/yahtzee1-v2#die).

1. Testa, validera och publicera applikationen på studentservern.



```bash
# Ställ dig i kurskatalogen
dbwebb test yahtzee2
dbwebb publish yahtzee2
```

Rätta eventuella fel som dyker upp och validera igen. När det ser grönt ut så är du klar.



Extrauppgift {#extra}
-----------------------

1. I Die klassen, gör om metoden `get_value()` till en get property med namnet `value`.


Tips från coachen {#tips}
-----------------------

Lär dig felsöka med debuggern, använd den när du får problem. Komplettera med utskrifter av `print()`.

Validera ofta. Så slipper du en massa valideringsfel i slutet av övningen.

Lycka till och hojta till i forumet om du behöver hjälp!
