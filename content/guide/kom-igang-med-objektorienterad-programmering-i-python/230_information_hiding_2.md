---
author: aar
revision:
    "2021-01-21": "(C, aar) La till stycke om hur name mangling funkar."
    "2020-01-24": "(B, aar) Tog bort del om private som nu är i eget dokument."
    "2018-11-27": "(A, aar) Första versionen, uppdelad av större dokument."
...
Information hiding del 2
==================================

Information hiding är när man gömmer intern data, så att den inte kan användas på fel sätt eller utanför den egna klassen. Låt oss säga att vi har en klass som har ett attribut som innehåller någon känslig data. Då vill vi inte att det ska gå att använda den hur som helst. Vi vill kanske kontrollera hur värdet sätts, man måste göra en speciell uträkning för att få ett nytt värde, eller att värdet bara är hemligt och man ska inte komma åt det utanför instansmetoder. Vi vill kunna begränsa tillgången till attribut eller metoder utanför klassdefinitionen.

I första delen gick vi igenom skyddad eller private, i denna delen ska vi kolla på "manglad" eller [name mangling](https://docs.python.org/3.7/tutorial/classes.html#private-variables). I tabellen nedanför finns en kort sammanfattning av vad de betyder.

| Implementation | Typ     | Syfte                                                                                 |
|----------------|---------|---------------------------------------------------------------------------------------|
| name           | publik  | Kan användas hur som helst, var som helst och av vem som helst.                       |
| _name          | skyddad | Använd inte om du inte vet vad du gör. Använd på egen risk                            |
| __name         | manglad | Hindra subklasser från att överskugga metoder och attribut.                           |



Name mangling {#nameMangling}
------------------------------

[INFO]
**Det räcker med att ni läser igenom denna** för att få ett hum om vad det är. Se det som en extrauppgift att jobba igenom och verkligen för stå det.

Det är inte rekommenderat att använda name mangling för generell utveckling. Det är mer för avancerad klass strukturer. På StackOverflow finns en bra förklaring på hur man kan tänka kring privata attribut och name mangling, [Should I use name mangling in Python?](https://stackoverflow.com/questions/7456807/should-i-use-name-mangling-in-python/7456865#7456865).
[/INFO]


Vi utgår från koden i första delen och lägger till ett privat attribut för omsättning.

[FIGURE src=/image/oopython/guide/vid-mov-priv-attr-property.png class="right" caption="Klassdiagram över Video och Movie med privat attribut."]

```python
class Video():

    def __init__(self, title, length, revenue):
        self.title = title
        self.length = length
        self._revenue = revenue
        
    ...
    
    @property
    def revenue(self):
        return self._revenue

class Movie(Video):

    def __init__(self, title, length, revenue, director, rating):
        super().__init__(title, length, revenue)

        self.director = director
        self.rating = rating

    ...
>>> charlie = Video("Charlie bit my finger", 1, 10000)
>>> dogs = Movie("Isle of Dogs", 101, 64241499, "Wes Anderson", 8.0)

>>> charlie.revenue
10000

>>> dogs.revenue
64241499
```

Även det privata attributet kommer vi åt i subklassen, inte så konstigt. Ibland dock vill man ha attribut eller metoder i en subklass 

Name mangling är då till för att förhindra en subklass från att använda/skriva över en metod/attribut i basklassen. Dock är det vanligt att utvecklare använder `__` för att göra attribut "privata", men det ska man inte.  
En metod med `__` i början kan "bara" användas i instansen den skapas i, med `self.__<namn>`. Detta är en egenskap privata attribut/metoder har i många andra programmeringsspråk, men inte i python, och därför är det lätt hänt att `__` används istället för `_`.

Jag tänker att man drar 30% av skatten på inkomster för alla typer av videos. Vi lägger till en publik metod för att öka inkomsten och en metod med name mangling för dra 30% på de nya intäkterna. I och med att vi inte kan komma åt metoden med name mangling utanför instansen behöver vi en publik metod som anropas den andra. Vi skapar dra skatt metoden med nameMangling så att man inte ska kunna skapa en ny i subklassen och sänka hur mycket skatt som dras.

```python
class Video():

    ...

    def __draw_tax(self, revenue):
        self._revenue += revenue * 0.7
        print("New revenue is: {}".format(self._revenue))

    def add_revenue(self, money):
        self.__draw_tax(money)



>>> charlie.__draw_tax(10000)
AttributeError: 'Video' object has no attribute '__draw_tax'

>>> charlie.add_revenue(10000)
New revenue is: 17000
```

Som ni ser kan vi komma åt `__draw_tax()` genom metoden `add_revenue()` i instansen med `self.__draw_tax()`.  
Vi testar att överskugga metoden i Movie för att sänka skatten:

[FIGURE src=/image/oopython/guide/vid-mov-name_mangl-property.png class="right" caption="Klassdiagram över Video och Movie med name mangling."]

```python
class Video():

    ...

    def __draw_tax(self, revenue):
        self._revenue += revenue * 0.7
        print("New revenue is: {}".format(self._revenue))

    def add_revenue(self, money):
        self.__draw_tax(money)

class Movie(Video):

    ...

    def __draw_tax(self, revenue):
        self._revenue += revenue * 0.9
        print("Lowered taxes and new revenue is: ".format(self._revenue))

>>> dogs.add_revenue(1500000)
New revenue is: 65291499
```

Utskriften visar att subklassen använder`__draw_tax()` metoden från basklassen även om det finns en metod med samma namn i subklassen. Jämför det med hur `print_info()` och `to_string()` fungerar.

```python
class Video():
    ...

    def to_string(self):
        return "{title} is {length} minute(s) long".format(
                title=self.title,
                length=self.length,
        )

    def print_info(self):
        print(self.to_string())

    def __draw_tax(self, revenue):
        self._revenue += revenue * 0.7
        print("New revenue is: {}".format(self._revenue))

    def add_revenue(self, money):
        self.__draw_tax(money)

class Movie(Video):

    ...

    def to_string(self):
        return "{base_msg}, has the director {dir} and a rating of {rating}".format(
            base_msg=super().to_string(),
            dir=self.director,
            rating=self.rating
        )

    def __draw_tax(self, revenue):
        self._revenue += revenue * 0.9
        print("Lowered taxes and new revenue is: {}".format(self._revenue))

>>> charlie.print_info()
Charlie bit my finger is 1 minute(s) long
>>> dogs.print_info()
Isle of Dogs is 101 minute(s) long, has the director Wes Anderson and a rating of 8.0
>>> charlie.add_revenue()
New revenue is: 17000.0
>>> dogs.add_revenue(1500000)
New revenue is: 65291499
```

För `to_string()` används den överskuggade metoden i subklassen medan för `__draw_tax()` används inte den "överskuggade" metoden i subklassen utan där används metoden från basklassen. Detta är för att vi inte har använt name mangling på `to_string()` och då kan vi faktiskt överskugga metoden från basklassen.



Varför heter det name mangling? {#why-name}
------------------------------------------

Ett konstigt namn kan man tycka, som inte beskriver vad det gör. Namnet är logiskt om man vet vad som sker i Python när man "manglar" ett attribut eller metod. Namnet beskriver hur Python uppnår "skyddet" och inte vad för "skydd" det ger.

I er kod, använd `dir()` på ett objekt av varje klass.

```python
>>> print(dir(charlie))
['_Video__draw_tax', '__class__', '__delattr__', '__dict__', '__dir__', '__doc__', '__eq__', '__format__', '__ge__', '__getattribute__', '__gt__', '__hash__', '__init__', '__init_subclass__', '__le__', '__lt__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', 'add_revenue', 'print_info', 'revenue']


>>> print(dir(dog))
['_Movie__draw_tax', '_Video__draw_tax', '__class__', '__delattr__', '__dict__', '__dir__', '__doc__', '__eq__', '__format__', '__ge__', '__getattribute__', '__gt__', '__hash__', '__init__', '__init_subclass__', '__le__', '__lt__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', 'add_revenue', 'print_info', 'revenue']
```

Det finns inga metoder som heter `__draw_tax` i utskrifterna. Däremot finns `_Video__draw_tax` i första och `'_Movie__draw_tax', '_Video__draw_tax'` i den andra.  Python "manglar" namnet när man skriver `__` framför, `_` och klassens namn läggs till framför.

```python
>>> charlie = Video("Charlie bit my finger", 1, 10000)
>>> dogs = Movie("Isle of Dogs", 101, 64241499, "Wes Anderson", 8.0)
>>> charlie._Video__draw_tax(1000)
New revenue is: 10700.0
>>> dogs._Video__draw_tax(1000)
New revenue is: 64242199.0
>>> dogs._Movie__draw_tax(1000)
Lowered taxes and new revenue is: 64243099.0
```

Så vad lärde vi oss här? Att vi kan fortfarande komma åt "manglade" attribut och metoder, det är bara svårare för att python automatisk gör om namnen.

I en instansmetod när vi anropar en manglad metod med self, lägger python på namnet på klassen som anropet sker ifrån. I vårt fall anropar vi `__draw_tax` från en metod i Video klassen, då blir anropet till `self._Video__draw_tax`. Även om self instansen är av klassen Movie.

Detta är inte något ni behöver ha koll på men jag tänkte att det kunde vara kul att få en inblick i hur det fungerar.
