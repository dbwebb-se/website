---
author: efo
category: python
revision:
  "2020-09-09": (C, aar) Uppdatera villkor med and till pythonic kod.
  "2020-05-12": (B, aar) Uppdaterad inför H20.
  "2017-05-29": (A, efo) Första utgåvan inför kursen python H17.
...
Villkor och loopar
==================================

[FIGURE src=image/python/loop.jpg?w=c5 class="right"]

Vi har nu bra koll på variabler och datatyper i python. Vi känner till stränger, heltal, flyttal och boolska värden (sant eller falskt). Vi ska i denna övning titta på hur data flödar igenom våra program. Vi kommer titta på villkors-satsen `if` och på två olika sätt, `for` och `while`, för att upprepa delar av koden.



<!--more-->



Vi rekommenderar att du kodar med i denna övning så du själv får känna på hur det är att skriva Python-kod.



Villkor {#villkor}
--------------------------------------
Ofta vill vi ta reda på om våra variabler uppfyller vissa krav. Det kan vara om en heltalsvariabel är större än 10 eller om en strängvariabel är lika med en annan sträng. För att undersöka om våra variabler uppfyller dessa krav kan vi använda oss av en `if`-sats. Låt oss titta på hur en `if`-sats ser ut i Python.

```python
number_of_apples = 13

if number_of_apples > 10:
    print("Du har mer än 10 äpplen")

# skriver ut: Du har mer än 10 äpplen
```

I kodexemplet ovan definierar vi först en variabel `number_of_apples` och sätter den lika med heltalet 13. Vi gör sedan en jämförelse mellan vår variabel `number_of_apples` och heltalet 10. Om vi läser ut raden, där vi gör jämförelsen, blir det ungefär "om antalet äpplen är större än 10 skriver vi ut 'Du har mer än 10 äpplen'".

Som vi ser ovan är raden som skriver ut 'Du har mer än 10 äpplen' inflyttat ett snäpp. Detta kallas för indentering. I Python används indentering som ett sätt att avgränsa det som hör till `if`-satsen. I exemplet nedan ser vi hur vi kan 'avsluta' if-satsen genom att flytta ut koden längst till vänster.

```python
number_of_apples = 13

if number_of_apples > 10:
    print("Du har mer än 10 äpplen")

print("Nu är vi klara med if-satsen")

# skriver ut:
# Du har mer än 10 äpplen
# Nu är vi klara med if-satsen
```


I kodexemplet ovan skrivs det inte ut nått från if-satsen om vi har 10 eller färre äpplen, men det vore ju trevligt om vårt program även skrev ut ett meddelande till de med få äpplen. Så låt oss äta 4 äpplen och titta på nedanstående exempel.

```python
number_of_apples = 9

if number_of_apples > 10:
    print("Du har mer än 10 äpplen")
else:
    print("Du har nog varit hungrig och ätit upp dina äpplen")

print("Nu är vi klara med if-satsen")

# skriver ut:
# Du har nog varit hungrig och ätit upp dina äpplen
# Nu är vi klara med if-satsen
```

Om vi läser upp ovanstående exempel blir det ungefär: "om antalet äpplen är större än 10 skriver vi ut 'Du har mer än 10 äpplen', annars skriver vi ut 'Du har nog varit hungrig och ätit upp dina äpplen'". Om vi istället vill kolla att antalet äpplen ligger inom ett intervall kan vi använda ytterligare ett villkor i vår `if`-sats. Detta gör vi genom att använda konstruktionen `elif`.

```python
number_of_apples = 9

if number_of_apples > 10:
    print("Du har mer än 10 äpplen")
elif 5 < number_of_apples <= 10:
    print("Du blev snabbt mätt och åt bara upp några av dina äpplen")
else:
    print("Du har nog varit hungrig och ätit upp dina äpplen")

print("Nu är vi klara med if-satsen")

# skriver ut:
# Du blev snabbt mätt och åt bara upp några av dina äpplen
# Nu är vi klara med if-satsen
```

Notera `5 < number_of_apples <= 10`, i många andra programmeringsspråk funkar inte det. Då behöver man istället använda `and`, `number_of_apples > 5  and number_of_apples <= 10`

Vi har även möjligheten att kombinera villkor för att få ett mer avancerat flöde i våra program. Om vi nu också vill kolla vilken sorts frukt vi har kan det se ut på följande sätt.

```python
type_of_fruit = "päron"
number_of_fruits = 13

if number_of_fruits > 10:
    if type_of_fruit == "äpple":
        print("Du har mer än 10 äpplen")
    else:
        print("Du har mer än 10 frukter")

    print("Nu är vi klara med den inre if-satsen")

print("Nu är vi klara med den yttre if-satsen")

# skriver ut:
# Du har mer än 10 frukter
# Nu är vi klara med den inre if-satsen
# Nu är vi klara med den yttre if-satsen
```

Vi har nu tittat på hur en `if`-sats kan se ut i python och hur det kan styra flödet av data i våra program. Ett sätt att få en överblick över flödet är att rita så kallade flödesdiagram (flow charts). Det enklaste sättet är att rita på ett blankt papper och det ger en bra möjlighet för att tänka över det problem, som vi löser med Python-kod. Ett exempel på flödesdiagram för ett kodexempel syns nedan.

```python
number_of_apples = 9

if number_of_apples > 10:
    print("Du har mer än 10 äpplen")
else:
    print("Du har nog varit hungrig och ätit upp dina äpplen")

print("Nu är vi klara med if-satsen")

# skriver ut:
# Du har nog varit hungrig och ätit upp dina äpplen
# Nu är vi klara med if-satsen
```

[FIGURE src=image/python/flow-if.png caption="Flödesdiagram för en if-sats."]

Ytterligare ett bra sätt att förstå hur en if-sats exekveras är att använda vi rekommenderade i kmom01. Nedan finns exemplet i visualiseringsverktyget.

<iframe width="727" height="500" frameborder="1" src="https://pythontutor.com/iframe-embed.html#code=number_of_apples%20%3D%209%0A%0Aif%20number_of_apples%20%3E%2010%3A%0A%20%20%20%20print%28%22Du%20har%20mer%20%C3%A4n%2010%20%C3%A4pplen%22%29%0Aelse%3A%0A%20%20%20%20print%28%22Du%20har%20nog%20varit%20hungrig%20och%20%C3%A4tit%20upp%20dina%20%C3%A4pplen%22%29%0A%0Aprint%28%22Nu%20%C3%A4r%20vi%20klara%20med%20if-satsen%22%29&codeDivHeight=400&codeDivWidth=350&cumulative=false&curInstr=0&heapPrimitives=nevernest&origin=opt-frontend.js&py=3&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe>

<a href="https://www.pythontutor.com/visualize.html#code=number_of_apples%20%3D%209%0A%0Aif%20number_of_apples%20%3E%2010%3A%0A%20%20%20%20print%28%22Du%20har%20mer%20%C3%A4n%2010%20%C3%A4pplen%22%29%0Aelse%3A%0A%20%20%20%20print%28%22Du%20har%20nog%20varit%20hungrig%20och%20%C3%A4tit%20upp%20dina%20%C3%A4pplen%22%29%0A%0Aprint%28%22Nu%20%C3%A4r%20vi%20klara%20med%20if-satsen%22%29&cumulative=false&curInstr=0&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=3&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank">Exemplet i fullskärm</a>.

[YOUTUBE src=LfzF3frs3AY caption="Andreas visar hur if-else exekveras."]



For-loop {#for}
--------------------------------------
Nu har vi tittat på hur vi kan styra flödet av data genom våra program med villkor och programmeringskonstruktionen if-satser. I detta avsnitt ska vi kolla på hur vi kan upprepa delar av koden med hjälp av konstruktionerna `for`, `range` och `in`. En `for`-loop är en konstruktion för att upprepa en del av koden ett bestämt antal gånger. Så vet vi till exempel att vi vill skriva ut en text 10 gånger är `for`-loopen ett perfekt verktyg istället för att manuellt använda `print()` 10 gånger.

```python
for i in range(10):
    print(i)

print("Jag är klar med loopen")

# skriver ut:
# siffrorna 0-9 i följd
# Jag är klar med loopen
```

Vi noterar att vi skriver ut siffrorna 0-9 och kanske inte som väntat 1-10. I Python och många andra programmeringsspråk är talföljder och liknande konstruktioner 0-indexerade. Det viktigaste är att vi vet om det och vi kommer senare under kursens gång titta mer på detta. Vi ser även att vi här, precis som med if-satser, använder indentering för att avgränsa det som hör till `for`-loopen.

Vi har alltså nu en konstruktion som upprepar det som finns inuti `for`-loopen ett bestämt antal gånger. Om vi kombinerar detta med det vi lärde oss om `if`-satser kan vi redan nu skapa avancerade flöden i våra program. Om vi anger två siffror till `range()` får vi siffrorna däremellan till svar. Här räknas `number_of_apples`-variabeln upp från 3 till 15 och med hjälp av `if`-satsen skriver vi ut olika meddelanden.

```python
for number_of_apples in range(3, 15):
    if number_of_apples > 10:
        print("Du har mer än 10 äpplen")
    elif 5 < number_of_apples <= 10:
        print("Du blev snabbt mätt och åt bara upp några av dina äpplen")
    else:
        print("Du har nog varit hungrig och ätit upp dina äpplen")
```


<iframe width="727" height="500" frameborder="1" src="https://pythontutor.com/iframe-embed.html#code=for%20number_of_apples%20in%20range%283,%2015%29%3A%0A%20%20%20%20if%20number_of_apples%20%3E%2010%3A%0A%20%20%20%20%20%20%20%20print%28%22Du%20har%20mer%20%C3%A4n%2010%20%C3%A4pplen%22%29%0A%20%20%20%20elif%20number_of_apples%20%3C%3D%2010%20and%20number_of_apples%20%3E%205%3A%0A%20%20%20%20%20%20%20%20print%28%22Du%20blev%20snabbt%20m%C3%A4tt%20och%20%C3%A5t%20bara%20upp%20n%C3%A5gra%20av%20dina%20%C3%A4pplen%22%29%0A%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20print%28%22Du%20har%20nog%20varit%20hungrig%20och%20%C3%A4tit%20upp%20dina%20%C3%A4pplen%22%29&codeDivHeight=400&codeDivWidth=350&cumulative=false&curInstr=0&heapPrimitives=nevernest&origin=opt-frontend.js&py=3&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe>

<a href="https://www.pythontutor.com/visualize.html#code=for%20number_of_apples%20in%20range%283,%2015%29%3A%0A%20%20%20%20if%20number_of_apples%20%3E%2010%3A%0A%20%20%20%20%20%20%20%20print%28%22Du%20har%20mer%20%C3%A4n%2010%20%C3%A4pplen%22%29%0A%20%20%20%20elif%20number_of_apples%20%3C%3D%2010%20and%20number_of_apples%20%3E%205%3A%0A%20%20%20%20%20%20%20%20print%28%22Du%20blev%20snabbt%20m%C3%A4tt%20och%20%C3%A5t%20bara%20upp%20n%C3%A5gra%20av%20dina%20%C3%A4pplen%22%29%0A%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20print%28%22Du%20har%20nog%20varit%20hungrig%20och%20%C3%A4tit%20upp%20dina%20%C3%A4pplen%22%29&cumulative=false&curInstr=0&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=3&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank">Exemplet i fullskärm</a>.



Om vi bara vill göra något ett bestämt antal gånger utan att bry oss om index `i` kan vi använda oss av `_` istället för `i` enligt nedan. Detta gör att vi inte behöver skapa en variabel som tar plats i minnet på datorn och som förvirrar personer som läser koden.

```python
for _ in range(5):
    print("Python är ett spännande programmeringsspråk")

# skriver ut:
# Python är ett spännande programmeringsspråk 5 gånger
```

Vi kan även loopa över annat än talföljder och vi kommer senare i kursen lära oss många olika konstruktioner som vi kan loopa över. I nedanstående exempel loopar vi igenom en sträng bokstav för bokstav med hjälp av samma `in` konstruktion som vi använde för talföljderna.

```python
for letter in "räksmörgås":
    if letter in "åäö":
        print(letter)

#skriver ut:
# ä
# ö
# å
```

Notera att vi använder `in` konstruktionen även i en `if`-sats för att kolla om bokstaven finns i en annan sträng. `in` kan alltså användas på olika sätt tillsammans med både villkor och loopar. Vi kommer under kursens gång tillbaka till `in` flertalet gånger och ser många användningsområden. Så om det känns lite magiskt nu kommer det att sätta sig under kursens gång.


För att kolla om ett värde **inte** finns kan vi använda nyckelordet `not` tillsammans med `in`.

```python
non_letters = ""
for letter in "räksmörgås":
    if letter not in "åäö":
        non_letters += letter
print(non_letters)

#skriver ut:
# rksmrgs
```

[YOUTUBE src=CKvtLiRIK_s caption="Andreas visar hur for-loopar exekveras."]



#### For-loop med input {#for-inp}

Försök själv att skriva ett program som gör följande. Be användaren skriva en ett ord, skapa en ny sträng som innehåller ordet användaren skrev in fast med en punkt efter varje bokstav och skriv sen ut den nya strängen. T.ex. om användaren skriver in "apa" ska programmet skriva ut "a.p.a.".

Om du undrar hur man kan lösa den eller har fastnat kan du kolla på videon där Andreas löser uppgiften.

[YOUTUBE src=huygMa6EbU0 caption="Andreas löser problemställningen."]



While-loop {#while}
--------------------------------------
Vi använde `for`-loopen för att upprepa delar av ett program ett bestämt antal gånger. Om vi inte på förhand vet exakt hur många gånger vi vill upprepa kan vi använda oss av en `while`-loop. Vi måste dock ha ett villkor som är sant så länge vi vill upprepa den specifika delen av programmet. I nedanstående kodexempel loopar vi så länge `number` är mindre än 20 och varje gång vi fortsätter loopen dubblerar vi `number`.

```python
number = 2

while number < 20:
    print(number)
    number = number + number

# skriver ut: 2 4 8 16
```

Det viktiga med en `while`-loop är att vi någon gång avslutar loopen för annars kommer den fortsätta i all oändlighet eller tills datorn stängs av. Vi avslutar loopen genom att ändra så att villkoret är falskt. I exemplet ovan avslutar vi alltså loopen när `number` blir 20 eller större.

`while`-loopar kan även användas för att ta emot indata från användaren. Om vi vill ta emot indata tills användaren skriver in ett specifikt värde kan vi använda `break` när användaren skriver in detta värde.

[YOUTUBE src=auOg4s3pJU8 caption="Andreas visar hur while-loopar fungerar."]


Vi har tidigare sett hur vi använder `input` och hur vi konverterar data från en sträng till ett heltal. I `while`-loopen bryter vi mot regeln ovan att vi skulle ha ett villkor som någon gång avslutas. Villkoret `True` blir aldrig falskt och då avslutas while-loopen aldrig, men vi använder konstruktionen `break` för att avsluta. Inne i loopen är det första vi gör att kolla om användaren har skrivit in värdet för avslut (q), om användaren har gjort det avslutar vi programmet. Annars skriver vi ut ett meddelande baserat på de `if`-satser vi har sett tidigare.

```python
while True:
    user_input = input("Skriv in antal äpplen (eller q för avslut): ")
    if user_input == "q":
        print("Du är nu klar med att äta äpplen.")
        print("Hej då!")
        break
    else:
        number_of_apples = int(user_input)
        if number_of_apples > 10:
            print("Du har mer än 10 äpplen")
        elif 5 < number_of_apples <= 10:
            print("Du blev snabbt mätt och åt bara upp några av dina äpplen")
        else:
            print("Du har nog varit hungrig och ätit upp dina äpplen")
```

På rad 8 i koden ovan gör vi om variabeln `user_input` från en sträng till ett heltal med hjälp av `int()`. Då data som finns i variabeln kommer från en användare kan vi inte lita på att variabeln innehåller ett heltal. Om vi skriver in något annat än ett heltal (till exempel bokstaven 'g') får vi följande fel i python.

```bash
Traceback (most recent call last):
  File "while.py", line 23, in <module>
    number_of_apples = int(user_input)
ValueError: invalid literal for int() with base 10: 'g'
```

I python finns en konstruktion som kan rädda oss från såna fel. Konstruktionen heter try-except och fungerar så att vi har två delar ungefär som en `if`-sats. En del när allt går som vanligt och en del för när det går åt skogen.

```python
try:
    number_of_apples = int(user_input)
except ValueError:
    print("Oj! Du skrev inte in en siffra.")
```

I koden ovan försöker vi omvandla `user_input` till ett heltal, om detta inte går får vi ett `ValueError` som vi såg i felmeddelandet. I `except` skriver vi bara ut att det blev fel och fortsätter. Ett uppdaterat kodexempel med felhantering ses nedan. Notera att vi använder `continue` för att hoppa till nästa upprepning i `while`-loopen. Vi har tidigare sett `break` som avslutar hela loopen, `continue` avslutar bara den nuvarande upprepning och fortsätter sedan med nästa upprepning.

```python
while True:
    user_input = input("Skriv in antal äpplen (eller q för avslut): ")
    if user_input == "q":
        print("Du är nu klar med att äta äpplen.")
        print("Hej då!")
        break
    else:
        try:
            number_of_apples = int(user_input)
        except ValueError:
            print("Oj! Du skrev inte in en siffra.")
            continue

        if number_of_apples > 10:
            print("Du har mer än 10 äpplen")
        elif 5 < number_of_apples <= 10:
            print("Du blev snabbt mätt och åt bara upp några av dina äpplen")
        else:
            print("Du har nog varit hungrig och ätit upp dina äpplen")
```


<iframe width="727" height="510" frameborder="1" src="https://pythontutor.com/iframe-embed.html#code=while%20True%3A%0A%20%20%20%20user_input%20%3D%20input%28%22Skriv%20in%20antal%20%C3%A4pplen%20%28eller%20q%20f%C3%B6r%20avslut%29%3A%20%22%29%0A%20%20%20%20if%20user_input%20%3D%3D%20%22q%22%3A%0A%20%20%20%20%20%20%20%20print%28%22Du%20%C3%A4r%20nu%20klar%20med%20att%20%C3%A4ta%20%C3%A4pplen.%22%29%0A%20%20%20%20%20%20%20%20print%28%22Hej%20d%C3%A5!%22%29%0A%20%20%20%20%20%20%20%20break%0A%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20try%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20number_of_apples%20%3D%20int%28user_input%29%0A%20%20%20%20%20%20%20%20except%20ValueError%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20print%28%22Oj!%20Du%20skrev%20inte%20in%20en%20siffra.%22%29%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%0A%20%20%20%20%20%20%20%20if%20number_of_apples%20%3E%2010%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20print%28%22Du%20har%20mer%20%C3%A4n%2010%20%C3%A4pplen%22%29%0A%20%20%20%20%20%20%20%20elif%20number_of_apples%20%3C%3D%2010%20and%20number_of_apples%20%3E%205%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20print%28%22Du%20blev%20snabbt%20m%C3%A4tt%20och%20%C3%A5t%20bara%20upp%20n%C3%A5gra%20av%20dina%20%C3%A4pplen%22%29%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20print%28%22Du%20har%20nog%20varit%20hungrig%20och%20%C3%A4tit%20upp%20dina%20%C3%A4pplen%22%29&codeDivHeight=400&codeDivWidth=350&cumulative=false&curInstr=0&heapPrimitives=nevernest&origin=opt-frontend.js&py=3&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe>

<a href="https://www.pythontutor.com/visualize.html#code=while%20True%3A%0A%20%20%20%20user_input%20%3D%20input%28%22Skriv%20in%20antal%20%C3%A4pplen%20%28eller%20q%20f%C3%B6r%20avslut%29%3A%20%22%29%0A%20%20%20%20if%20user_input%20%3D%3D%20%22q%22%3A%0A%20%20%20%20%20%20%20%20print%28%22Du%20%C3%A4r%20nu%20klar%20med%20att%20%C3%A4ta%20%C3%A4pplen.%22%29%0A%20%20%20%20%20%20%20%20print%28%22Hej%20d%C3%A5!%22%29%0A%20%20%20%20%20%20%20%20break%0A%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20try%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20number_of_apples%20%3D%20int%28user_input%29%0A%20%20%20%20%20%20%20%20except%20ValueError%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20print%28%22Oj!%20Du%20skrev%20inte%20in%20en%20siffra.%22%29%0A%20%20%20%20%20%20%20%20%20%20%20%20continue%0A%0A%20%20%20%20%20%20%20%20if%20number_of_apples%20%3E%2010%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20print%28%22Du%20har%20mer%20%C3%A4n%2010%20%C3%A4pplen%22%29%0A%20%20%20%20%20%20%20%20elif%20number_of_apples%20%3C%3D%2010%20and%20number_of_apples%20%3E%205%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20print%28%22Du%20blev%20snabbt%20m%C3%A4tt%20och%20%C3%A5t%20bara%20upp%20n%C3%A5gra%20av%20dina%20%C3%A4pplen%22%29%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20print%28%22Du%20har%20nog%20varit%20hungrig%20och%20%C3%A4tit%20upp%20dina%20%C3%A4pplen%22%29&cumulative=false&curInstr=0&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=3&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank">Exemplet i fullskärm</a>.



#### Ett simpelt tärningsspel {#dice_game}

Skapa ett litet program som slår två tärningar och skriver ut dess värden, tills användaren säger till programmet att sluta. Du kan använda dig av modulen `random` för att representera tärningarna. Du kan slumpa fram ett värde mellan 1 och 6 på fölajnde sätt.

```python
import random

MIN = 1
MAX = 6

dice_value1 = random.randint(MIN, MAX)
print(dice_value1)
```

Första raden inkluderar färdig kod för att slumpa värden. `random.randint(MIN, MAX)` anropar funktionen `randint` som ligger i random modulen, den returnerar ett slumpmässigttal mellan de två heltalen som skickas in till funktionen. I vårt fall 1 och 6.

Gör detta två gången i en loop och skriv ut de slumpade värdena fram tills användaren indikerar att programmet ska avslutas.

Om du fastnar eller bara vill se en lösning kan du kolla på videon nedanför där Andreas skriver koden för programmet.

[YOUTUBE src=vZh_PPiLvS4 caption="Andreas visar hur man kan skapa ett simpelt tärningsspel."]



Avslutningsvis {#avslutning}
--------------------------------------
Vi har i denna övning tittat på konstruktioner i python som låter oss styra flödet av data i våra program. Vi använder `if` för att jämföra värden och beroende på utfallet av jämförelsen körs olika delar av programmet. `for`-loopen används för att upprepa en del av koden ett bestämt antal gånger och vi kan loopa genom talföljder och strängar. `while`-loopen används för att loopa tills ett villkor går från sant till falskt. När villkoret är falskt avslutas upprepningen. Vi har även tittat på hur vi kontinuerligt kan ta emot indata från användaren tills användaren skriver in ett bestämt värde och då bryta loopen med hjälp av `break`.

`if`, `for` och `while` konstruktioner finns i de flesta programmeringsspråken. Dessa konstruktioner används för att styra flödet av data och utgör stora delar av de program vi kommer skriva i resten av kursen och vidare fram i programmet.

Alla kodexempel från denna övningen finns i kursrepot för [python-kursen](https://github.com/dbwebb-se/python/tree/master/example/flow).
