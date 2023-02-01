---
author:
    - aar
    - grm
revision:
    "2022-01-21": (A, grm) Första upplagan.
category:
    - oopython
...
Fortsättning på Yahtzee spelet
===================================

I denna uppgiften ska ni binda ihop Yahtzee spelet så att ni får ett fungerade Yahtzee för en spelare.

<!--more-->

[FIGURE src="/image/oopython/kmom03/yahtzee3.png" caption="Färdigt Yahtzee3"]

I denna uppgiften vi styra upp hur många gånger man får kasta om tärningar och avgöra när spelet är slut.



Förkunskaper {#forkunskaper}
-----------------------

Ni har gått igenom hela guiden "[Kom igång med objekt](guide/kom-igang-med-objektorienterad-programmering-i-python)".

Ni har jobbat igenom övningen "[Flask, POST och GET](kunskap/flask-get-post)".

Ni har jobbat igenom övningen "[Introduktion till sekvensdiagram](kunskap/intro_till_sekvensdiagram)" och "[Mer om enhetstester](kunskap/unittest-i-python_2)".



Introduktion {#intro}
-----------------------

Spelet ska följa de internationella reglerna och inte svenska reglerna. Här kan ni hitta [reglerna](https://gamerules.com/rules/yahtzee-dice-game/).

Nytt i denna uppfiften är att lägga till checkboxar bredvid tärningarna för att på så sätt visa vilka som ska slås om. Vi vill också se en resultattavla med regler och poäng enligt bilden ovanför. Vi vill kunna välja regel, om du använder samma regel 2 gånger vill vi se ett felmeddelande. När du är klar, så vill vi se ett meddelande som säger att spelet är slut.

Era klasser ska uppfylla beskrivningarna nedanför. Beskrivningarna är vad som måste finnas, ni får och är **rekommenderade** att skapa ytterligare metoder och attribut där ni tycker att det behövs.

[YOUTUBE src="dO_o01YomTM" caption="Andreas visar hur en färdig lösning kan se ut i Flask."]

[FIGURE src="/image/oopython/kmom04/yahtzee3.png" caption="Klassdiagram för Yahtzee."]

PS. Jag har lagt en kompositions pil mellan Rule och Scoreboard, ni måste inte göra en sån implementation jag ritade den för att visa att Scoreboard behöver objekt från alla regel klasser. Egentligen borde det vara en pil både från Scoreboard och Hand till varje regel klass men jag det blir för rörigt då, därför har jag bara dragit till Rule klassen.


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

- `from_dict(points)` - Det ska vara en **classmethod** som används för att skapa ett nytt Scoreboard objekt. Metoden ska ta emot en dictionary där nycklarna är namn på regler och värdena är hur många poäng som de reglerna har fått. Värdet `-1` används för att markera att en regel inte har använts för att få några poäng. **Tips** skapa denna metoden tidigt, testerna använder sig av den för att skapa objekt att testa på.



Krav {#krav}
-----------------------

### Krav för alla {#krav-alla}

1. Kopiera er kod från `me/kmom03/yahtzee2` till `me/kmom04/yahtzee3`.

1. Ni ska inte längre visa föregående tärningar.

1. Implementera `Scoreboard` klassen.

1. Använd session för att spara er data för Scoreboard.

1. När spelaren har använt alla regler en gång ska ni skriva ut en text där det står att spelet är slut och hur många poäng spelaren fick.

1. Det ska gå att kasta om specifika tärningar. T.ex. kasta om tärning 1 och 3, då ska tärningarna 2, 4 och 5 inte kastas om.

1. Begränsa hur många gånger man kan slå om tärningarna innan man väljer en regel.
    - Man får max kasta om tärningarna **två** gånger, sen måste man välja en regel att få poäng för med nuvarande hand. Man kan få 0 som poäng med en Hand.

1. På webbsidan ska ni visa vilka regler som finns, hur många poäng nuvarande hand är värde för varje regel och om spelaren redan har använt regeln för att få poäng ska den poängen visas. Kolla på bilden för att se exempel på hur det kan se ut.

1. Om användaren väljer en regel som redan har använts för att få poäng ska ni skriva ut ett meddelande där det står att regeln redan är använd. Tärningarna ska inte slås om, utan användaren behöver välja en ny regel för samma Hand för att fortsätta spela.

1. I Die klassen, gör om metoden `get_value()` till en get property med namnet `value`.

1. Lägg till tester för följande saker:
    - Hand klassen:
        - `roll()` - Att anropa med en lista som argument och kolla att det slår om rätt tärningar.
        - `roll()` - Att anropa utan argument och kolla att den slår om alla tärningar.
        - `roll` - Använd er av mockning för att bli av med på beroendet `random.randint()` i Die klassen. Gör så att `randint` alltid returnerar 100. Kolla att handen innehåller fem tärningar med värdet 100.
        - `to_list()` - Att kolla att den returnerar en lista med tärningarnas värde.
    - Scoreboard klassen:
        - `add_points` - Lägg till poäng för en regel och kolla att blir rätt poäng.
        - `add_points` - Lägg till poäng för en regel som redan har poäng, kolla att exception lyfts.

1. Skapa ett sekvensdiagram för flödet när spelaren har valt att få poäng för regeln Fives. Ni kan utgå från bilden nedanför och bygga ut det. Glöm inte visa loopar och if-satser. Spara bilden i mappen `yahtzee3`.

[FIGURE src="/image/oopython/kmom03/sequence_add_points.png" caption="Början av ett sekvensdiagram"]

1. Testa, validera och publicera applikationen på studentservern.



```bash
# Ställ dig i kurskatalogen
dbwebb test yahtzee3
dbwebb publish yahtzee3
```

Rätta eventuella fel som dyker upp och validera igen. När det ser grönt ut så är du klar.



Extrauppgift {#extra}
-----------------------

1. Istället för att skriva ut ett felmeddelande när du väljer samma regel igen, så kan du designa ditt spel så att du inte kan välja samma regel igen. När en regel är vald, så ska inte den kunna väljas igen och regelns poäng ska inte skrivas ut.



Tips från coachen {#tips}
-----------------------

Lär dig felsöka med debuggern, använd den när du får problem. Komplettera med utskrifter av `print()`.

Validera ofta. Så slipper du en massa valideringsfel i slutet av övningen.

Lycka till och hojta till i forumet om du behöver hjälp!
