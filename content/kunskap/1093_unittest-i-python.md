---
author: lew
revision:
    "2019-01-12": (B, aar) Uppdaterade koden för phone och testerna.
    "2017-12-12": (A, lew) Updated for v2.
category:
    - oopython
...
Att skriva enhetstester
===================================

[FIGURE src=/image/oopython/kmom02/test_top.png class="right"]

Enhetstester, eller *unittester*, används för att testa att enskilda metoder eller funktioner gör vad vi förväntar oss. Till exempel om en metod ska returnera bool-värdet `True`, så ska den aldrig kunna returnera `False`.  

Vi ska titta lite närmare på de olika delarna av pythons inbyggda testramverk *unittest*. Vi hoppar inte i den djupa delen av bassängen, utan vi håller oss vid det grundläggande delarna.
Vill du läsa mer kan du kika på [docs.python.org](https://docs.python.org/3/library/unittest.html).

<!--more-->



Förutsättning {#pre}
-------------------------------

Du kan grunderna i Python och du vet vad variabler, typer och funktioner innebär.



Varför ska man skriva enhetstester? {#varfor-ska-man-skriva-enhetstester}
------------------------------

Enhetstester skrivs som sagt av anledningen att minimera risken för "trasig" kod och för att validera funktionaliteten. I många lägen handlar det inte enbart om att du ska förstå koden, utan det kan finnas andra utvecklare som tar över ditt projekt eller bara ska hjälpa till. Då är det bra om det är testat ordentligt. Om man har svårt att förstå vad en funktion gör enbart av att läsa koden hjälper det ofta om det finns tester man kan köra och kolla vad olika inputs får för output.

Du vill även skriva tester för din egna skull, att ha bra tester på plats gör att när du skriver om kod eller lägger till ny kan du försäkra dig om att den gamla koden fortfarande gör vad vi förväntar oss. Det är också ett bra sätt att ha koll på buggar, varje gång du hittar en bugg i din kod skapar du ett testfall so kollar att buggen inte introduceras på nytt.



Vad är ett enhetstest? {#vad-ar-enhetstest}
------------------------------

Man kan säga att ett enhetstest är en metod som testar en liten del av en applikation för att verifiera delens beteende oberoende från andra delar av applikationen. Ett enhetstest har oftast tre delar:

* **Arrange** - Initiera en del av applikation till ett eftersökt tillståndet, t.ex. skapa variabler eller initiera objekt. För enklare tester behöver man inte denna delen.

* **Act** - Utför handlingen som vi vill testa, t.ex. anropar en metod.

* **Assert** - Sist kontrollerar vi att handlingen vi utförde genomfördes som vi förväntade oss. Oftast genom att göra en "assert" på en funktions returvärde eller kolla värdet på ett objekts attribut.

Om det observerade genomförandet är vad vi förväntade oss passerar testet, annars fallerar det. Om det fallerade indikerar det att något är fel i koden.


###Pythons testramverk {#pythons-testramverk}

Python kommer med en inbygg modul, ett ramverk kallat "unittest". Inspirationskällan till det kommer från Javans [JUnit](http://junit.org/junit4/). Vi ska framför allt titta på basklassen *TestCase* som tar hand om enskilda tester på bland annat metoder.



###Kom igång med ett enhetstest {#kom-igang-med-ett-enhetstest}

Artiklen utgår från filerna som vi hittar i [exempelmappen](https://github.com/dbwebb-se/oopython/tree/master/example/unittest). Där hittar vi klassen _Phone_ i `phone.py` och en tillhörande testfil, `test.py`. Det är testfilen som vi skriver våra enhetstester i. Testerna kör man med:

 ```python
 >>> python3 test.py
 ```

Då så. Vi tittar på grundstrukturen i `test.py`:

```python
#!/usr/bin/env python3
""" Module for unittests """

import unittest

class TestPhone(unittest.TestCase):
    """ Submodule for unittests, derives from unittest.TestCase """

    # omitted code in explanation purpose

if __name__ == '__main__':
    unittest.main(verbosity=3)
```

Vi importerar modulen och skapar en subklass av _unittest.TestCase_. Blocket med _unittest.main()_ kör igång ett interface för testskriptet och producerar en bra utskrift. Notera att vi har med docstrings nu. Docstrings som används i metoderna kommer skrivas ut när testfilen körs.

Ett enkelt test på den inbyggda funktionen *.upper()* kan se ut så här:

```python
#!/usr/bin/env python3
""" Module for unittests """


import unittest

class Testcase(unittest.TestCase):
    """ Submodule for unittests, derives from unittest.TestCase """

    def test_upper(self):
        """ Test builtin uppercase """
        result = 'programmering'.upper()# Act
        self.assertEqual(result, 'PROGRAMMERING')# Assert

if __name__ == '__main__':
    unittest.main(verbosity=3)
```

Vi använder metoden _assertEqual_ för att jämföra om två värden är lika. Följande tabell är hämtad från [docs.python.org](https://docs.python.org/3/library/unittest.html) och visar överskådligt de vanligaste typerna av enhetstester.


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

```text
.
----------------------------------------------------
Ran 1 test in 0.000s

OK


>>> python3 test.py -v
test_upper (__main__.Testcase)
Test builtin uppercase ... ok

----------------------------------------------------------------------
Ran 1 test in 0.000s

OK
```

Med flaggan `-v` ser vi att vi får en tydligare utskrift, där testerna skrivs ut med. Det fungerar bara om man döper testmetoderna med "test_" i början. Vi ser även docstringen utskriven. Det är trevligt med fina utskrifter så vi kör vidare på det.



###Enhetstesta objekt {#enhetstesta-objekt}

Nu är det dags att titta på hur vi skriver några enhetstester för vår klass, _Phone_. Klassen ligger i filen `phone.py`.

Vi öppnar `test.py` och kikar några delar av koden. Med hjälp av _doc-strings_ får vi som sagt bättre utskrifter:

En viktig del av att skriva enhetstester är att olika tester inte ska vara beroende av varandra. Med vetskapen att testerna exekverar i bokstavsordning vill vi *inte* döpa tester till specifika namn för att få dem att exekveras i en viss ordning. T.ex. att i ett test lägga till en kontakt och i nästa test testa en annan metod som har ett beroende på kontakten från förra testet. Då är testerna inte oberoende av varandra, vilket vi vill att de ska vara. Om vi vill att något ska ha skett innan ett test ska vi använda "arrange" fasen för att skapa rätt förutsättningar för testet. I exemplet med Phone klassen behöver vi t.ex. alltid ha ett Phone objekt skapat innan vi kan testa dess metoder. Istället för att skapa ett Phone objekt överst i test filen och låta alla tester använda det objektet ska vi skapa ett nytt Phone objekt till varje testfall.

När det finns gemensamma steg för alla testfall kan vi använda en `setUp()` metod som körs före varje testmetod exekveras. I den kan vi utföra de steg som alla har gemensamt, i vårt fall skapa ett Phone objekt. Sen kan vi använda metoden `tearDwon()`, som exekveras efter varje testmetod, för att städa upp efter varje test så det inte finns något kvar från ett tidigare test som kan påverka nästa.

```python
import unittest
from phone import Phone

class TestPhone(unittest.TestCase):
    """Submodule for unittests, derives from unittest.TestCase"""

    def setUp(self):
        """ Create object for all tests """
        self.phone = Phone("Samsung", "Galaxy S8", "Android")

    def tearDown(self):
        """ Remove dependencies after test """
        self.phone = None



    def test_default_owner(self):
        """Test that default value if correct for owner"""
        self.assertEqual(self.phone.get_owner(), "No owner yet")

    def test_set_owner(self):
        """Test changing owner of a Phone"""
        self.phone.change_owner("Pelle")
        self.assertEqual(self.phone.get_owner(), "Pelle")

    def test_empty_phonebook(self):
        """Test that contacts are empty"""
        self.assertFalse(self.phone.has_contacts())

    def test_validate_valid_numbers(self):
        """Test validating valid numbers"""
        valid = self.phone.validate_number("070-354 78 00")
        self.assertTrue(valid)

        valid = self.phone.validate_number("153-222 78 00")
        self.assertTrue(valid)

    def test_validate_non_valid_numbers(self):
        """Test validating non valid numbers"""
        not_valid = Phone.validate_number("xxx-xxx xx xx")
        self.assertFalse(not_valid)

        not_valid = Phone.validate_number("073456129-")
        self.assertFalse(not_valid)

        not_valid = Phone.validate_number("073-456 12 9a")
        self.assertFalse(not_valid)

    def test_add_contacts(self):
        """Test adding contacts"""
        self.phone.add_contact("Andreas", "070-354 78 00")
        self.phone.add_contact("Emil", "073-456 12 99")

        self.assertTrue(self.phone.has_contacts())
        self.assertEqual(self.phone.get_contacts_length(), 2)

    def test_get_contact(self):
        """Test that can get added contact"""
        self.phone.add_contact("Andreas", "079-244 07 80")
        self.assertEqual(self.phone.get_contact("Andreas"),
                         ("Andreas", "079-244 07 80"))

    def test_get_contact_not_exist(self):
        """
        Test that correct value is returned
        when getting contact that does not exist
        """
        self.assertFalse(self.phone.get_contact("Kenneth"))

        self.phone.add_contact("Andreas", "079-244 07 80")
        self.assertFalse(self.phone.get_contact("Emil"))



if __name__ == '__main__':
    unittest.main()
```

Vi vill bara skriva värdefulla tester, så även om vi har en metod `get_model(self)` i Phone klassen så har vi inget testfall för den. Metoden bara returnerar ett attribut, det utförs egentligen inget i den och vi kan inte påverka vad som sker i metoden på något sätt. Så då finns det inget jätte stort värde i att ha ett test för den. Phone innehåller tre metoder av större värde att testa, det är `add_contact()`, `validate_number()` och `get_contact()`. Det är i dem vi har kod som faktiskt utför något.

Vi kan ta `get_contact()` som exempel:

```python
def get_contact(self, name):
    """ Returns tuple with name and number """
    for person in self.phonebook:
        if person[0] == name:
            return person
    return False
```

Vad kan påverka resultatet av den metoden? Den innehållet en for-loop vilket kan bete sig olika beroende på om listan är tom eller inte och if-satsen kan vara True eller False. För att testa metoden skapar vi två test metoder, en som testar att allt går bra och en där det går dåligt. Först ett test när listan är tom och ett när listan har innehåll men vi skriver fel namn. 

```python
    def test_get_contact(self):
        """Test that can get added contact"""
        self.phone.add_contact("Andreas", "079-244 07 80")
        self.assertEqual(self.phone.get_contact("Andreas"),
                         ("Andreas", "079-244 07 80"))

    def test_get_contact_not_exist(self):
        """
        Test that correct value is returned
        when getting contact that does not exist
        """
        self.assertFalse(self.phone.get_contact("Kenneth"))

        self.phone.add_contact("Andreas", "079-244 07 80")
        self.assertFalse(self.phone.get_contact("Emil"))
```

Om vi kör alla tester i testfilen får vi resultatet:

```bash
>>> python3 test.py -v

test_add_contacts (__main__.TestPhone)
Test adding contacts ... ok
test_default_owner (__main__.TestPhone)
Test that default value if correct for owner ... ok
test_empty_phonebook (__main__.TestPhone)
Test that contacts are empty ... ok
test_get_contact (__main__.TestPhone)
Test that can get added contact ... ok
test_get_contact_empty (__main__.TestPhone) ... ok
test_set_owner (__main__.TestPhone)
Test changing owner of a Phone ... ok
test_validate_non_valid_numbers (__main__.TestPhone)
Test validating non valid numbers ... ok
test_validate_valid_numbers (__main__.TestPhone)
Test validating valid numbers ... ok

----------------------------------------------------------------------
Ran 8 tests in 0.000s

OK
```

Om ett test inte går igenom visas en tydlig utskrift på vad och var felet gäller. Vi rensar filen och lägger in ett test som genererar ett fel:

```python
#!/usr/bin/env python3
"""
Unittest file for Phone
"""

import unittest
from phone import Phone

class Testcase(unittest.TestCase):
    """Submodule for unittests, derives from unittest.TestCase"""

    ...

    # Tests if the objects are the same
    def test_error(self):
        """ Should return True, they are not the same """
        self.assertEqual(self.phone.get_model(), "iPhone X")



if __name__ == '__main__':
    unittest.main()
```

Nu kan vi läsa av felmeddelandet när vi kör filen:

```bash
>>> python3 test.py -v

test_error (__main__.Testcase)
Should return True, they are not the same ... FAIL

======================================================================
FAIL: test_error (__main__.Testcase)

Should return True, they are not the same
----------------------------------------------------------------------
Traceback (most recent call last):
  File "test.py", line 16, in test_error
    self.assertEqual(self.phone.get_model(), "iPhone X")
AssertionError: 'Galaxy S8' != 'iPhone X'
- Galaxy S8
+ iPhone X


----------------------------------------------------------------------
Ran 1 test in 0.001s

FAILED (failures=1)
```



Avslutningsvis {#avslutning}
------------------------------

Det här var lite om enhetstester och hur man kan gå tillväga för att testa sin kod. De flesta testerna är relativt självförklarande och kommer inte gås in djupare på. Läs gärna mer om enhetstester:  

* [docs.python.org](https://docs.python.org/3.5/library/unittest.html)  

* [docs.python-guide.org](http://docs.python-guide.org/en/latest/writing/tests/)
