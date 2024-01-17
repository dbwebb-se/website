---
author: aar
revision:
    "2020-01-16": "(B, aar) Finputsad inför VT20."
    "2018-11-18": "(A, aar) Första versionen, uppdelad av större dokument."
...


Pythonic get() och set() {#pythonic}
========================================

Vi skrev om vår kod i kapitlen ovan vilket gjorde att vi nu har flera metoder som inte längre fungerar. Det gör att vi behöver uppdatera våra metoder till att använda `_price` istället för `price`. Vi kan sätta detta i ett större perspektiv. Tänk om vi jobbar i ett stort system med 100+ klasser med 10+ utvecklare som skriver koden. Hur hade vår ändring ovanför påverkat alla andra klasser? All annan kod utanför vår Car klass som använde `price` attributet slutar också att fungera. Vilket gör att med vår ändring hade vi också behöver leta upp alla andra ställen i systemet som använder `price` och uppdatera den koden till att använda vår getter och setter metoder.

Stycket ovanför beskriver hur man gör i de flesta andra OO programmeringsspråken, privata attribut får en `get_attributename` och en `set_attributename` metod. Där get returnerar värdet och set ändrar värdet. Men det ställer ju till problem om vi gör en sen tidigare attribut publik till privat för då ändrar vi på det publika API:et för klassen. Python har så klart ett mer Pythonic sätt att göra det på som dessutom inte introducerar en ändring i det publika API:et.



## property decorator {#property}

Vi lär oss en till decorator, tidigare kollade vi på `@staticmethod` som gör att en metod blir statisk. Nu ska vi lära oss `@property` decorator.

Vi har den gamla lösningen med get och set.

```python
class Car():
    ...
    def __init__(self, model, price):
        ...
        self._price = price

    ...

    def get_price(self):
        return self._price

    def set_price(self, new_price):
        if float(new_price) / float(self._price) > 0.7:
            self._price = new_price
            print(f"New price is {self._price}")
        else:
            raise ValueError("New price is too low. You can max lower it with 30%")

```

Vi börjar med att göra get method pythonic med `@decorator`.

```python
class Car():
    ...

    @property
    def price(self):
        print("getter method called")
        return self._price

>>> car = Car("volvo", 200000)
>>> print(car.price)
getter method called
200000
>>> print(car._price)
200000
```

Magic!

`price()` metoden anropas utan att vi skriver med `()`. Det är en av effekterna av `@property` decorator. Vi har `_price` som ett privat attribut och skyddar det samtidigt som vi har kvar det publika API:et med `price`, fast det är egentligen en metod.

Vi gör också set metoden till en decorator.

```python
class Car():
    ...

    @property
    def price(self):
        print("getter method called")
        return self._price

    @price.setter
    def price(self, new_price):
        print("setter method called")
        if float(new_price) / float(self._price) > 0.7:
            self._price = new_price
            return "New price is " + str(self._price)
```

Här använder vi en annan decorator, `@price.setter`. När vi använder `@property` på `price` metoden skapas ett property objekt och `car.price` är egentligen det objektet och inte metoden. Fast det objektet anropar vår metod när koden försöker läsa objektet som ett värde, `car.price`. `@price.setter` gör att set moden för `price` läggs till i price objektet och anropas om koden tilldelar till det objektet, `car.price = x`.

Vi kollar hur det ser ut när vi använder det i koden.

```python
>>> car = Car("volvo", 200000)
>>> car.price = 180000
setter method called
>>> print(car.price)
getter method called
180000
>>> car.price = 50000
setter method called
ValueError: New price is too low. You can max lower it with 30%
```

Python anropar olika metoder baserat på hur vi använder attributet i koden, om vi läser eller tilldelar. Nu har vi samma funktionalitet som med get och set metoden samtidigt som vår kod har kvar det publika API:et vilket gör att vår ändring från publik till privat inte förstör annan kod som använder Car objekt. Även de andra metoderna som inte fungerade förut fungerar igen.

```python
class Car():
    wheels = 4
    car_count = 0

    def __init__(self, model, price):
        self.model = model
        self._price = price

        Car.car_count += 1
        self.car_nr = Car.car_count

    @property
    def price(self):
        print("getter method called")
        return self._price

    @price.setter
    def price(self, new_price):
        print("setter method called")
        if float(new_price) / float(self._price) > 0.7:
            self._price = new_price
        else:
            raise ValueError("New price is too low. You can max lower it with 30%")

    def present_car(self):
        return "The model {m} costs {p}$.".format(
            m=self.model, p=self._price
        )

    def __add__(self, other):
        if isinstance(other, Car):
            return self.price + other.price
        if isinstance(other, int):
            return self.price + other
        raise ValueError("Car doesn't not support addition with object")

    def __iadd__(self, other):
        if isinstance(other, Car):
            self.price += other.price
            return self
        if isinstance(other, int):
            self.price += other
            return self
        raise ValueError("Car doesn't not support addition with object")

    @staticmethod
    def calculate_price_reduction(price):
        return int(price * 0.66)

    def reduce_price(self):
        self.price = self.calculate_price_reduction(self.price)
        return "Priset för {m} är nu {p}.".format(m=self.model, p=self.price)

    @classmethod
    def wheel_message(cls):
        print("A car normally have {nr} wheels".format(nr=cls.wheels))


>>> car = Car("volvo", 200000)
>>> print(car.present_car())
The model volvo costs 200000$.
>>> print(car + 1000)
getter method called
201000
>>> car += 3100
getter method called
setter method called
>>> print(car.price)
getter method called
203100
```

Om ni har svårt att hänga med i alla anrop, kopiera in koden i **Thonny eller annan debugger** och stega igenom koden! Det kommer hjälpa er att förstå koden mycket bättre än att bara titta på den och exekvera den.

För en längre och lite mer djupgående förklaring av `@property` kan ni läsa [Python @property decorator](https://www.programiz.com/python-programming/property).
