---
author:
    - aar
    - grm
revision:
    "2023-01-10": (B, grm) Uppdaterat till kmom02.
    "2022-01-12": (A, grm) Första versionen, utgått från "unittest_i_python".
category:
    - oopython
...
Introduktion till enhetstester
===================================

[FIGURE src=/image/oopython/kmom02/test_top.png class="right"]

Enhetstester, eller *unittester*, används för att testa att enskilda metoder eller funktioner gör vad vi förväntar oss. Till exempel om en metod ska returnera bool-värdet `True`, så ska den aldrig kunna returnera `False`.  

Vi ska titta lite på pythons inbyggda testramverk *unittest* och hur en katalogstruktur med kod och enhetstester kan se ut.
Vill du läsa mer kan du kika på [docs.python.org](https://docs.python.org/3/library/unittest.html).

<!--more-->



Förutsättning {#pre}
-------------------------------

Du kan grunderna i Python och du vet vad variabler, typer och funktioner innebär. Du har även gjort övningen "Intro till guiden" och "Objekt och klasser" i guiden "[Kom igång med objektorienterad programmering i Python](guide/kom-igang-med-objektorienterad-programmering-i-python)".


### Pythons testramverk {#pythons-testramverk}

Python kommer med en inbyggd modul, ett ramverk kallat "unittest". Inspirationskällan till det kommer från Javans [JUnit](http://junit.org/junit4/). Vi ska framför allt titta på basklassen *TestCase* som tar hand om enskilda tester på bland annat metoder.

### Kodstruktur med enhetstester {#kodstruktur-med-enhetstester}

Använd terminalen och ställ dig i "kmom02":
```bash
$ mkdir unittest
$ mkdir unittest/src
$ mkdir unittest/tests
$ touch unittest/src/__init__.py unittest/src/car.py
$ touch unittest/test.py
$ touch unittest/tests/__init__.py unittest/tests/test_car.py
```

[FIGURE src=/image/oopython/kmom01/tree_structure.png caption="Filstruktur."]

Kodstrukturen:

* /src med källkoden, filen med klassen Car
* /tests med koden för enhetstester, alla börjar med test_
* test.py är en testprogrammet som kör alla testfilerna i katalogen /tests tack vare filen "/tests/\_\_init\_\_.py" som gör att alla testfilerna hittas i /tests. Vill du läsa mer om "\_\_init\_\_.py" kan du kika på [docs.python.org](https://docs.python.org/3/reference/import.html#regular-packages).


### Klassen som ska testas {#klassen-som-ska-testas}

Lägg koden för klassen Car i /src/car.py.

```python
#!/usr/bin/env python3
"""
Contains the Car class.
"""
class Car():
    """ Car class that handles cars with model and price. """
    wheels = 4

    def __init__(self, model, price):
        """ Constuctor """
        self.model = model
        self.price = price

    def present_car(self):
        """ Returns a string presenting the car """
        return "This car is of model {m} and costs {p}$.".format(
            m=self.model, p=self.price)

```

### Skapa testprogrammet {#kom-igang-med-ett-enhetstest}

Lägg följande kod i test.py som är testprogrammet och kör alla testfiler som ligger i /tests.

```python
#!/usr/bin/env python3
"""
Main program for testing
"""
import unittest

if __name__ == '__main__':
    testsuite = unittest.TestLoader().discover('tests')
    unittest.TextTestRunner(verbosity=2).run(testsuite)

```

Flytta dig till unittest och kör följande
```bash
$ python3 test.py
```

[FIGURE src=/image/oopython/kmom01/result_no_testcases.png caption="Resultat från python3 test.py."]

### Kom igång med ett enhetstest {#kom-igang-med-ett-enhetstest}

Lägg följande kod i /tests/test_car.py. Observera att vägen till filen car.py pekas ut genom "src.car".

```python
#!/usr/bin/env python3
""" Module for testing the class Car """

import unittest
from src.car import Car

class TestCar(unittest.TestCase):
    """ Submodule for unittests, derives from unittest.TestCase """
    pass

```

Kör enhetstesterna igen.
```bash
$ python3 test.py
```

[FIGURE src=/image/oopython/kmom01/result_no_testcases.png caption="Resultat från python3 test.py."]

### Kom igång med ett enhetstest {#kom-igang-med-ett-enhetstest}

Då ska vi lägga till en metod i testklassen TestCar i /tests/test_car.py som testar att antalet hjul på en instans vi skapar av klassen Car är 4. Byt ut "pass" mot följande kod.

```python
def test_no_of_wheels_ok(self):
    """ Test if number of wheels is 4 """
    my_car = Car("Volvo", 50000) # Act
    self.assertEqual(my_car.wheels, 4)# Assert

```

Vi använder metoden _assertEqual_ för att jämföra om två värden är lika. Följande tabell är hämtad från [docs.python.org](https://docs.python.org/3/library/unittest.html) och visar överskådligt de vanligaste typerna av assert som finns för att säkerställa olika värden. De metoderna finns in basklassen, `TestCase`.


| Method                    |        Checks that   |
|---------------------------|:---------------------|
| assertEqual(a, b)	        | a == b	           |
| assertNotEqual(a, b)	    | a != b	           |
| assertTrue(x)	            | bool(x) is True	   |
| assertFalse(x)	        | bool(x) is False	   |
| assertIs(a, b)	        | a is b               |
| assertIsNot(a, b)	        | a is not b           |
| assertIsNone(x)	        | x is None            |
| assertIsNotNone(x)	    | x is not None        |
| assertIn(a, b)	        | a in b               |
| assertNotIn(a, b)	        | a not in b           |
| assertIsInstance(a, b)	| isinstance(a, b)     |
| assertNotIsInstance(a, b)	| not isinstance(a, b) |

Om vi nu kör testet får vi utskriften:

```bash
python3 test.py
```

[FIGURE src=/image/oopython/kmom01/result_1_testcase.png caption="Resultat från python3 test.py."]

### Testa en metod {#testa-en-metod}

Då ska vi lägga till en ny metod i testklassen TestCar i /tests/test_car.py som testar att metoden "present_car" ger rätt resultat för en Volvo som kostar 50000$. Lägg till följande kod.

```python
def test_present_car_ok(self):
    """ Test if the string is correct from present_car """
    my_car = Car("Volvo", 50000) # Act
    self.assertEqual(my_car.present_car(),
        "This bike is of model Volvo and costs 50000$.")# Assert

```
[FIGURE src=/image/oopython/kmom01/result_error.png caption="Resultat från python3 test.py."]

Aj, då det blev fel! Ändra från "bike" till "car" och testa igen.

[FIGURE src=/image/oopython/kmom01/result_2_testcases.png caption="Resultat från python3 test.py."]

### Testa med slumptal {#testa-med_slumptal}

När vi enhetstestar med slumptal, så vill vi inte behöva ändra i testfallet varje gång vi kör testen. Med hjälp av "random.seed()" så får vi samma slumpvärde varje gång vi kör testen.

```python
import random

random.seed("car")
print("First number: ", random.randint(1, 100))
print("Second number: ", random.randint(1, 100))

```

Här blir första slumptalet 11 och andra slumptalet 46 varje gång. Testa gärna!

Om vi vill att testa med slumptal i mer än ett testfall, så lägger vi det i en setup metod som körs före varje testfall. Så här ser hela testklassen ut med seed i en setup metod.

```python
#!/usr/bin/env python3
""" Module for testing the class Car """

import unittest
import random
from src.car import Car

class TestCar(unittest.TestCase):
    """ Submodule for unittests, derives from unittest.TestCase """

    def setUp(self):
        """ Setup that runs before every testcase """
        random.seed("car")

    def test_no_of_wheels_ok(self):
        """ Test if number of wheels is 4 """
        my_car = Car("Volvo", 50000) # Act
        self.assertEqual(my_car.wheels, 4)# Assert
    
    def test_present_car_ok(self):
        """ Test if the string is correct from present_car """
        my_car = Car("Volvo", 50000) # Act
        self.assertEqual(my_car.present_car(),
        "This bike is of model Volvo and costs 50000$.")# Assert

    def test_random_numbers(self):
        """ Test random numbers from 1 to 100 """
        print("First number: ", random.randint(1, 100))
        print("Second number: ", random.randint(1, 100))
        # Assert random number 1 and 2
```



### Testa privata attribut och metoder {#testa-privat}

Ibland har vi privata attribut eller metoder i en klass som vi ska testa. Då vill vi kunna använda dem utan att bry oss om att de är privata, vilket vi kan för att vi kodar i Python. Men vi kommer fortfarande få valideringsfel om vi gör det.

Ibland kan vi komma runt det genom att använda en `get_metod` för att läsa av ett privat attribut istället för att använda attributet direkt, `obj._attribut`. Men det passar inte alltid och då är den smidigaste lösning att stänga av valideringen som kollar om man använder privata attribut och metoder. Det gör vi genom att lägga till raden `#pylint: disable=protected-access` i början av filen med testerna. Då kommer pylint ignorera när vi skriver `obj._attribut`.



Avslutningsvis {#avslutning}
------------------------------

Detta var bara en kort introduktion om enhetstester i pythons *unittest*. Längre fram i kursen dyker vi ner mer i enhetstester.   

Det är viktigt med tester för att upprätthålla kvalitet i koden. Det finns företag som kör med testdriven utveckling. Då utvecklar man först enhetstesterna utifrån kraven som finns på koden. Därefter utvecklas den vanliga koden och du kan testa din kod under utveckling.
