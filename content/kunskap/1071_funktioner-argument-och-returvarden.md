---
author: efo
category: python
revision:
  "2022-08-26": (C, aar) La till rubrik vid default värde.
  "2018-06-18": (B, aar) La till ett simpelt exempel av hur en funktion kan se ut.
  "2017-05-31": (A, efo) Första utgåvan inför kursen python H17.
...
Funktioner, argument och returvärden
==================================

[FIGURE src=image/python/function.png?w=c5 class="right"]

Vi har i tidigare övningar och uppgifter introducerats till variabler, matematiska operationer, `if`-satser och loopar. Vi ska i denna övning bekanta oss med ett sätt att dela in kod, som gör det möjligt att återanvända delar av program. Vi ser hur vi skapar funktioner, hur vi kan skicka med data till funktioner och hur funktionerna kan skicka tillbaka resultat.



<!--more-->



Vi rekommenderar att du kodar med i denna övning så du själv får känna på hur det är att skriva Python kod.



Introduktion {#introduktion}
--------------------------------------

Funktioner används för att dela upp och kategorisera delar av vår kod som gör det möjligt att återanvända koden på flera ställen i våra program. Funktioner finns i nästan alla programmeringsspråk och är en av de viktigaste verktygen vi har som programmerare. Låt oss se hur en funktion ser ut.

En funktion är kod som ligger i ett *block*. Vi har tidigare sätt block som i `if`-satser, `for` och `while`-loopar. Ett funktionsblock definieras med nyckelordet *def* och tilldelas ett namn som vi kan anropa funktionen med. När vi anropar funktionen exekveras koden som ligger i funktionens block. Låt oss kolla på ett simpelt exempel där vi skriver ut "Hello" från en funktion.
```python
def say_hello():
    print("Hello")

print("Simon says hello")
say_hello()
# Simon says hello
# Hello
```

Nu har vi skapat vår första egna funktion och anropat den med funktionsnamnet följt av parenteser. Parenteserna är inte en del av namnet utan det är en del av syntaxen för att anropa funktioner.

En tidigare student gillade metaforen att lika funktioner med hur en bok fungerar. När vår kod exekveras läses den uppi från och ner, en rad åt gången. Precis som hur vi läser en bok, uppi från och ner en rad åt gången. I en bok kan vi pausa vår läsning och hoppa till en annan sida, läsa den sidan och sen gå tillbaka till sidan vi var på. Vi använder sido nummer för att ha kolla på vilken sida vi var på och vilken vi vill hoppa till för att läsa.  
Vi kan se funktioner på ett liknande sätt. Vi kan dela in vår kod i funktioner och kan likna funktionsnamn med sidnummer. I koden kan vi hoppa till koden som ligger i funktionerna med funktionsnamnen och när den koden är färdig exekverad hoppar programmet tillbaka till raden där vi gjorde pausen och hoppade till funktionen.

Nedan följer ett större exempel på hur man använder och skapar funktioner.



Funktioner {#funktioner}
--------------------------------------
Vi kommer i denna övning utgå ifrån kod utan funktioner och sakta men säkert delar vi upp koden i återanvändbara delar. I exemplen nedan utgår vi från ett verkligt problem och bygger vår kod utifrån det samtidigt som vi delar upp och återanvänder vår kod genom att introducera funktioner.

> Två kollegor ska äta lunch tillsammans och har båda med lunchlådor. Dansken Emil har med Rød Pølse och Svensken Andreas har med köttbullar med mos. Emil värmer sin mat i microvågsugnen på 800W i 2,5 minuter och Andreas värmer också sin mat på 800W, men i 3,5 minuter. Hur mycket energi går det åt till att värma varje maträtt? Vad kostar det att värma maten med ett kWh pris på 78.04 öre per kWh?

Vilken data får vi i uppgiften?

Emil värmer i 2,5 minuter på 800W.
Andreas värmer i 3,5 minuter på 800W.
kWh pris för el på 78,04 öre per kWh.

Vi kan även formeln för att beräkna energiåtgången i kWh om vi kan tiden och effekten:

> energi = effekt * tiden i timmar / 1000

Låt oss se hur vi översätter detta till pythonkod.

```python
emil_time = 2.5 / 60
andreas_time = 3.5 / 60

emil_energy = 800 * emil_time / 1000
andreas_energy = 800 * andreas_time / 1000

print("Emil använder " + str(emil_energy) + " kWh")
print("Andreas använder " + str(andreas_energy) + " kWh")

price_per_kwh = 78.04

emil_cost = emil_energy * price_per_kwh / 100
andreas_cost = andreas_energy * price_per_kwh / 100

print("Emils lunch kostar " + str(emil_cost) + " kr")
print("Andreas lunch kostar " + str(andreas_cost) + " kr")

# skriver ut:
# Emil använder 0.033333333333333326 kWh
# Andreas använder 0.04666666666666666 kWh
# Emils lunch kostar 0.02601333333333333 kr
# Andreas lunch kostar 0.03641866666666667 kr
```

Vi noterar att beräkningarna på raderna 4 och 5 är lika förutom att de använder olika variabler. Detsamma gäller raderna 12 och 13. Vi ser här en möjlighet att skapa delar av koden som är återanvändbara med hjälp av funktioner. Hur ser då en funktion ut i Python?

```python
def calculate_energy():
    """
    Calculates the energy consumption i kWh
    """
    emil_energy = 800 * emil_time / 1000
    print("Emil använder " + str(emil_energy) + " kWh")
```

På första raden använder vi `def` för att tala om för Python att vi vill definiera ett namn som vi kan återanvända. Efter `def` skriver vi funktionens namn, som vi använder när vi vill köra den kod som finns inuti funktionen. Efter namnet anger vi `()` för att markera att detta är en funktion. Raden avslutas med `:`, precis som en `if`-sats eller en `for`-loop. Efter att vi har definierat vår funktion lägger vi till en "docstring" som dokumenterar vad funktionen gör.



Argument {#argument}
--------------------------------------
Ovanstående exempel på funktion beräknar bara energiåtgången för Emils tillagning, inte Andreas, så än så länge har vi ingen vinst av att skapa funktionen. Men med hjälp av argument till funktionen kan vi använda samma kod för både Emil och Andreas. Argument är värden som vi skickar in till en funktion. Värdena blir automatiskt till variabler som existerar enbart inuti funktionens kod. I kodexemplet nedan är `time_in_microwave` och `name` argument till funktionen. Dessa blir variabler inne i funktionen och bara där.

```python
def calculate_energy(time_in_microwave, name):
    """
    Calculates the energy consumption i kWh
    And prints the consumption together with the name
    """
    energy = 800 * time_in_microwave / 1000
    print(name + " använder " + str(energy) + " kWh")

emil_time = 2.5 / 60
calculate_energy(emil_time, "Emil")

andreas_time = 3.5 / 60
calculate_energy(andreas_time, "Andreas")

# skriver ut:
# Emil använder 0.033333333333333326 kWh
# Andreas använder 0.04666666666666666 kWh
```


### Fördefinierade värde (default value) {#default}

Vi har nu kapslat in vår kod för att beräkna energiåtgången. Denna koden kan återanvändas för nya personer som ska värma mat så låt oss titta på ett sådant exempel.

> Emil och Andreas kollegor Mikael och Kenneth köper mat i restaurangen. Men hissen upp till matsalen är långsam så deras mat hinnar kallna innan de är uppe. Båda värmer maten, men bara på 600W i 30 sek.

Vi måste nu skriva om funktionen lite grann då vi förutom tiden och namnet även vill kunna ta emot effekten som maten ska värmas med. Vi definierar alltså ett nytt argument `effect`. I och med att vi oftast vill värma vår mat på 800W kan vi lägga till ett fördefinierat värde, som argumentet får om man inte anger ett annat värde när man använder funktionen. Det fördefinierade värdet definieras med ett lika-med tecken (`=`) efter argumentet. Vi kan nu använda funktionen med antingen två eller tre argument. Om vi använder två argument får variabeln `effect` värdet 800.

```python
def calculate_energy(time_in_microwave, name, effect=800):
    """
    Calculates the energy consumption i kWh
    And prints the consumption together with the name
    """
    energy = effect * time_in_microwave / 1000
    print(name + " använder " + str(energy) + " kWh")

emil_time = 2.5 / 60
calculate_energy(emil_time, "Emil")

andreas_time = 3.5 / 60
calculate_energy(andreas_time, "Andreas")

kenneth_and_mikael_time = 0.5 / 60
calculate_energy(kenneth_and_mikael_time, "Mikael", 600)
calculate_energy(kenneth_and_mikael_time, "Kenneth", 600)

# skriver ut:
# Emil använder 0.033333333333333326 kWh
# Andreas använder 0.04666666666666666 kWh
# Mikael använder 0.005 kWh
# Kenneth använder 0.005 kWh
```



Returvärden {#returvarden}
--------------------------------------
I vårt ursprungliga exempel använde vi den beräknade energiåtgången till att beräkna kostnaden för att värma maten. Det enda vi gör i vår funktion är att skriva ut ett meddelande och vårt beräknade värde finns enbart inne i funktionen. För att resten av vårt program ska kunna ta del av det beräknade värdet måste vi skicka tillbaka det till programmet, eller som det heter inom programmering: returnera. Vi använder oss av konstruktionen `return` för att skicka tillbaka värdet. Notera att vi har tagit bort argumentet `name` då den inte längre behövs för utskriften.

```python
def calculate_energy(time_in_microwave, effect=800):
    """
    Calculates the energy consumption i kWh
    Resturns the consumption
    """
    energy = effect * time_in_microwave / 1000
    return energy

emil_time = 2.5 / 60
emil_energy = calculate_energy(emil_time)
```

Vår variabel `emil_energy` innehåller nu värdet från variabeln `energy` inne i funktionen. Vi kan nu definiera ytterligare en funktion som beräknar kostnaden av elen utifrån en energiåtgång för att vårt program ska fungera som tidigare.

```python
def calculate_energy(time_in_microwave, effect=800):
    """
    Calculates the energy consumption i kWh
    Returns the consumption
    """
    energy = effect * time_in_microwave / 1000
    return energy

def calculate_cost(energy, price_per_kwh=78.04):
    """
    Calculates the cost for a given energy consumption
    Returns the cost in kr
    """
    cost = energy * price_per_kwh / 100
    return cost

emil_time = 2.5 / 60
emil_energy = calculate_energy(emil_time)
emil_cost = calculate_cost(emil_energy)

print("Emil använder " + str(emil_energy) + " kWh och detta kostar " + str(emil_cost) + " kr")
# skriver ut:
# Emil använder 0.033333333333333326 kWh och detta kostar 0.02601333333333333 kr
```

Vi har nu två funktioner som kan återanvändas. Vi skickar in argument både med och utan fördefinierat värde och returnerar värden från våra funktioner.



Formattering för bättre utskrifter {#format}
--------------------------------------
Vi har ett fungerande program men det finns nästan alltid små detaljer vi kan förbättra. I detta fallet tycker jag att utskrifterna blir tråkiga med alla dessa decimaler, så låt oss titta på ett sätt att få bättre utskrifter från våra program i Python. Vi ska använda Pythons strängformaterare `format`. Vi använder `{}` för de värden vi vill ersätta med beräknade värden. Sen tilldelar vi ett namn så vi kan tilldela rätt värde till den del av strängen vi vill ersätta. Inom parentesen anger vi vilka värden vi vill koppla till formateringsvariablerna `{energy}` och `{cost}`.

```python
emil_time = 2.5 / 60
emil_energy = calculate_energy(emil_time)
emil_cost = calculate_cost(emil_energy)

nice_string = "Emil använder {energy} kWh och detta kostar {cost} kr".format(
    energy=emil_energy,
    cost=emil_cost
)
# skriver ut:
# Emil använder 0.033333333333333326 kWh och detta kostar 0.02601333333333333 kr
```

Vi har nu kopplat `emil_energy` till `{energy}` och `emil_cost` till `{cost}` i strängen. Vi har dock fortfarande en ful utskrift så vi använder ett formateringsargument. Vi vill ha 4 decimaler efter punkten i våra flyttal så vi använder formateringen: `:.4f`. Formateringsargument läggs efter värdet med ett kolon. För decimaltal kan vi ange att vi vill ha ett visst antal decimaler, detta görs med `.` följd av antalet decimaler och ett f för float.

```python
emil_time = 2.5 / 60
emil_energy = calculate_energy(emil_time)
emil_cost = calculate_cost(emil_energy)

nice_string = "Emil använder {energy:.4f} kWh och detta kostar {cost:.4f} kr".format(
                energy=emil_energy,
                cost=emil_cost
)

print(nice_string)
# skriver ut:
# Emil använder 0.0333 kWh och detta kostar 0.0260 kr
```

Vi nöjer oss med detta enkla exempel än så länge, men för de som vill läsa på om strängformattering är [pythons dokumentation](https://docs.python.org/3.5/library/string.html#format-string-syntax) ett bra ställe att börja.



Avslutningsvis {#avslutning}
--------------------------------------
Funktioner är en av de viktigaste byggstenarna i programmering. Funktioner ger oss möjligheten att kapsla in kod som vi kan återanvända. Vi kan dessutom ge logiska namn åt delar av koden som gör att utomstående mycket lättare kan förstå hur du har tänkt när du skrev programmet.

Alla kodexempel från denna övningen finns i kursrepot för [python-kursen](https://github.com/dbwebb-se/python/tree/master/example/functions) och här på [dbwebb](https://dbwebb.se/repo/python/example/functions). Funktions- och argumentnamnen har ändrats i kodexemplen då funktioner i samma modul måste ha unika namn.
