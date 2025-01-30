---
author:
    - aar
    - grm
revision:
    "2023-01-11": (A, aar) Första upplagan.
category:
    - oopython
...
Skapa grunden för ett Yahtzee spel
===================================

I denna uppgiften ska ni börja lite smått med att skapa ett Yahtzee spel.

<!--more-->

Ni kommer att fortsätta utveckla spelet igenom flera kursmoment. I denna uppgiften skapar vi grunden med en tärningsklass och en hand (hållare för flera tärningar).



Förkunskaper {#forkunskaper}
-----------------------

Ni har gått igenom delarna “Intro till guiden” och “Objekt och klasser” i guiden "[Kom igång med objekt](guide/kom-igang-med-objektorienterad-programmering-i-python)".

Ni har jobbat igenom övningen "[Introduktion till enhetstester](https://dbwebb.se/kunskap/unittest-i-python_1)".

Ni har jobbat igenom övningen "[Flask och Jinja2](kunskap/flask-med-jinja2)".

Ni har också gjort din "[Flask applikation körbar via CGI](coachen/flask-som-cgi-script)".

Om ni har gjort övningarna så har ni nästan kommit i mål med uppgiften.



Introduktion {#intro}
-----------------------

Ni ska som sagt utveckla ett Yahtzee spel över flera kursmoment.

Spelet ska följa de internationella reglerna och inte de svenska reglerna. Här kan ni hitta [reglerna](https://gamerules.com/rules/yahtzee-dice-game/). I denna uppgiften kommer ni inte skapa någon logik för reglerna det kommer i senare uppgifter.

I denna uppgiften ska ni bara skapa grunden, vilket är tärningar, något att hålla tärningarna i (en hand) och visa upp vilka tärningar som har slagits.

Era klasser ska uppfylla beskrivningarna nedanför. Beskrivningarna är vad som måste finnas, ni får och är **rekommenderade** att skapa ytterligare metoder och attribut där ni tycker att det behövs.



### Die {#die}

Denna klassen ska representera tärning.

[FIGURE src="/image/oopython/kmom01/die.png" caption="Die klass"]

#### Attributen {#die-attr}

- `MIN_ROLL_VALUE` - Ska innehålla minsta värdet en träning kan slå. Ska användas när en tärning kastas.
- `MAX_ROLL_VALUE` - Ska innehålla största värdet en träning kan slå. Ska användas när en tärning kastas.
- `value` - Ska innehålla värdet en tärning har slagit.

#### Metoderna {#die-met}

- `__init__(value)` - `value` parametern ska ha ett default värde. 
    - Om man skickar med ett argument till `value` parametern i konstruktorn ska tärningen få det värdet. 
        - Om argumentet innehåller ett heltal som är större än `MAX_ROLL_VALUE`, tilldela `MAX_ROLL_VALUE` som värde på tärningen. 
        - Om argumentet innehåller ett heltal som är mindre än `MIN_ROLL_VALUE`, tilldela `MIN_ROLL_VALUE` som värde på tärningen. 
    - Om man **inte** skickar med ett argument ska det slumpas fram ett värde till tärningen.
- `get_name()` - ska returnera namnet på värdet tärningen har. En tärning med värdet 1 har namnet "one", värdet 2 har namnet "two" osv.
- `get_value()` - ska returnera värdet på tärningen.
- `roll()` - slumpa fram ett nytt värde på tärningen. Använd funktionen `randint` i modulen `random`. Eftersom att värden slumpas fram så kan en tärning få samma värde igen.
- `__str__()` ska returnera värdet som tärningen har som en sträng.



#### Hand {#hand}

Denna klassen ska representera en spelhand som ska ha fem tärningar den kan spela med.

[FIGURE src="/image/oopython/kmom01/yahtzee1-hand.png" caption="Hand klass"]

#### Attributen {#hand-attr}

- `dice` - en lista som ska innehålla fem Die objekten.

#### Metoderna {#hand-met}

- `__init__(dice_values)` - `values` parametern ska ha ett default värde. 
    - Om man inte skickar med ett argument så ska `dice` listan få fem Die objekt med slumpade värden.
    - Om man skickar in ett argument till parmetern i konstruktorn, så ska argumentet vara en lista som innehåller fem heltal.
        - De heltalen ska användas för att skapa en tärning med varje heltal. 
- `roll(indexes)` - `indexes` ska ha ett default värde. 
    - Om man skicka in ett argument till parametern ska det vara en lista med heltalen, heltalen ska vara index position för tärningar i `dice` listan. Då ska bara tärningarna med de index positionerna kastas om, de andra ska ha kvar sina värden.
    - Om man inte skickar med ett argument till parametern ska metoden kasta om alla tärningar som finns i `dice` attributet. 
- `__str__` - ska returnera en komma separerad sträng med värdet på alla tärningar i handen, t.ex. `"2, 4, 1, 5, 1"`.



Krav {#krav}
-----------------------

Ni ska lägga grunden för ett Yahtzee spel i webbläsaren med hjälp av Flask. När ni är klara ska ni ha följande filstruktur. OBS! Bilderna på tärningarna ska ligga under `static/img`.

[FIGURE src="/image/oopython/kmom01/yahtzee-flask-files.png" caption="Filer för Yahtzee i webbläsaren"]


1. Spara er kod i `me/kmom02/yahtzee1`.

1. Implementera koden för klassdiagrammen ovanför. Spara filerna i `me/kmom02/yahtzee1/src`.

1. Skriv tester för Die klassen i `me/kmom02/yahtzee1/tests/test_die.py`. Tänk på att era tester ska verifiera att er kod utför det ni förväntar er. Det betyder att testerna ska verifiera att er kod har utfört något specifikt. T.ex. Ändrat eller skapat ett värde. Testa följande saker i Die klassen:
    1. Använd er av `random.seed()` när ni testar funktionalitet som slumpar värden.
    1. Att skapa ett objekt utan skicka argument till konstruktorn.
    1. Att skapa ett objekt och skicka värde på tärningen till konstruktorn.
    1. Att skapa ett objekt och skicka ett otillåtet värde på tärningen, som till exempel 100, till konstruktorn. Verifiera att värdet på tärningen är `6`.
    1. Att `roll()` slumpar nytt värde.
    1. Att `get_name()` returnerar korrekt namn.
    1. För `roll()` och `Att skapa ett objekt utan skicka argument till konstruktorn.` som slumpar värden ska ni kolla exakt vilket värde tärningen får. Ni ska **inte** kolla att det är ett heltal eller att talet är mellan 1 och 6.

1. Startfilen ska heta `app.py` och vara körbar via `app.cgi`. `app.cgi` ska bara fungera på studentservern.

1. Du har installerat modulerna Flask i en [virtuell miljö](kunskap/python-virtuel-miljo).

1. Applikationen ska använda Bootstrap eller annat valfritt css ramverk.

1. Applikationen ska ha routen `main`. 
    - I den routen ska ni skapa ett Hand objekt med fem slumpade tärningar och ni ska skicka in **Hand objektet** till `render_template()`. 
    - På routens sida ska ni visa värdet på handens fem tärningar med hjälp av bilderna som finns i [exampel/yahtzee/img](https://github.com/dbwebb-se/oopython/tree/master/example/yahtzee/img). 
        - Det finns en bild för varje tärningsslag mellan 1 och 6, med namnen one.png, two.png, three.png, four.png, five.png och six.png. T.ex. om handen slog tärningarna 1, 4, 2, 4, 4 så ska ni visa bilderna one.png, four.png, two.png, four.png och four.png.

1. Ni ska också ha routen `about` där ni på sidan skriva era namn och akronymer.

1. header.html och footer.html ska inkluderas med Jinja2.

1. Er navbar ska innehålla ett namn på ert Yahtzee spel och länkar till båda routes.

1. Testa, validera och publicera applikationen på studentservern.



```bash
# Ställ dig i kurskatalogen
dbwebb test yahtzee1
dbwebb publish yahtzee1
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
