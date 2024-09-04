---
author:
    - aar
    - efo
category: python
revision:
    "2021-05-27": (G, aar) Bytte från karaktär till tecken.
    "2020-05-07": (F, aar) La till videor.
    "2019-05-24": (E, efo, aar) La till stycke om isinstance.
    "2018-06-21": (D, efo) Genomgång inför HT18 med fler exempel.
    "2017-06-09": (C, efo, aar) Gemensam genomgång innan publish.
    "2017-06-05": (B, efo) Genomläsning och korrektion av stavfel.
    "2017-05-29": (A, aar) Första utgåvan inför kursen python.
...
Introduktion till variabler och datatyper
==================================

I denna artikel ska vi lära oss vad värden och variabler är i programmering. Vi ska titta på hur man skriver ut information till terminalen och hur man kan mata in information till programmet från terminalen. När du har jobbat igenom artikeln har du gjort ett program som tar emot ett namn och en ålder från användaren. Åldern används bland annat till att räkna ut födelseår. Namn, ålder och födelseår skrivs ut i terminalen som en del av en hälsning. Vi kommer gå igenom hur man skriver kod i en fil och kör den koden från terminalen.

Du kan hitta koden för detta exempel på [Github](https://github.com/dbwebb-se/python/tree/master/example/greeting) och i `example/greeting`.



<!--more-->

# Ordlista {#ordlista}
* Interpretator: Verktyg som gör om din kod så datorn förstår.
* Exekvera: Interpretatorn kör din kod.
* Funktion: En återanvändbar del av koden.
* Argument: Ett värde som skickas med till en funktion.
* Syntax: En uppsättning regler över hur koden ska skrivas.



Förkunskap {#forkunskap}
--------------------------------------

Du har gjort övningen [Kom igång med ditt första program i python](kunskap/kom-igang-med-ditt-forsta-program-i-python-v2).



Introduktion {#introduktion}
--------------------------------------

När du programmerar skapar du ett program som har ett specifikt syfte. Du har en startpunkt och en slutpunkt. Det är viktigt att veta vad du börjar med och hur det ska fungera när du är klar. För att ta dig från punkt A till punkt B kan vi bland annat använda oss av värden och variabler.

Vi ska börja med att skriva ett program som skriver ut en hälsning och en ålder. Sen utvecklar vi programmet så det tar emot inmatning (input) från användaren under tiden som programmet körs. Ett namn och en ålder ska skickas in och användas i hälsningen. Vi avslutar med att även räkna ut vilket år personen föddes.


Värden och typer {#varden-och-typer}
--------------------------------------

Inom programmering används värden, t.ex. heltalet 4 (Integer) eller en sträng "Hello world" (String). Värden är av olika typer, vilket ger dem olika egenskaper i koden. Nedan fyra av de vanliga typerna som finns i programmeringsspråk.



### Heltal (Integer) {#heltal}

Vi kan använda oss av heltal, även kallat _Integer_ på engelska (förkortas med __int__), för att bland annat att göra [matematiska operationer](https://docs.python.org/3/library/stdtypes.html#numeric-types-int-float-complex).

Följande kod är exekverad i Python-interpretatorn, du startar interpretatorn genom att skriva `python3` i din terminal. När du läser nedanstående kodexempel rekommenderar vi att du själv har en interpretator öppen och kodar med. För att lämna Python-interpretatorn trycker du `ctrl + d` eller skriver `exit()`.

```python
>>> 4 + 4
8
>>> 0 * 8
0
>>> 5 % 2
1
>>> 3 + 4 + 4 * 2
15
>>> 3 + (4 + 4) * 2
19
```

Vi ser alltså här att vi som förväntat kan skriva in vanliga heltal och att Python interpretatorn fungerar som en miniräknare där vi med hjälp av matematiska operatorer addera, subtrahera, multiplicera och så vidare. Vid [operationer](https://sv.wikipedia.org/wiki/Operation_(matematik)) (+ , - , / ...) följer Python den matematiska konventionens prioriteringar:

1. Paranteser.
1. Upphöjning (exponentiering).
1. Multiplikation och division.
1. Addition och subtraktion.
1. Operatorer med samma prioritering exekveras från vänster till höger.

Notera att den tredje beräkningen i exemplet ovan använder sig av modulusoperatorn `%`. Modulus är resten som är kvar vid heltalsdivision. Vår beräkning av `5 % 2` får resultatet 1, dvs om vi gör en heltalsdivision med 5 och 2 är resten 1. Detta kan till exempel användas om vi vill avgöra siffran är jämn eller udda. Får vi resultatet 1 vet vi att siffran är udda och är resultatet av uttrycket 0, dvs ingen rest i heltalsdivisionen, är talet ett jämnt tal.

[YOUTUBE src=tDl04edpj5w caption="Hur Python exekverar operationer och matteregler."]




### Decimaltal (Float) {#decimaltal}

Ibland räcker inte heltal till. Om vi till exempel vill representera ett pris `19,90 kr`, en vikt på `3,5 kg` eller om vi till exempel vill beräkna arean av en cirkel behövs PI, som vi i detta fallet visar med två decimaler `3,14`. Dessa tal är decimaltal, vilket kallas _Float_ på engelska. Decimaltal (Float) precis som heltal (Integer) kan användas för att göra matematiska operationer. Det går även att blanda decimaltal och heltal i aritmetiska operationer, det resulterar i ett nytt decimaltal.

Då vi programmerar på engelska i Python använder vi oss det engelskspråkiga decimaltecken '.' (punkt) istället för att skriva siffrorna med ',' (komma). Så ska vi skriva de tre siffrorna från ovan i Python skriver vi `19.90`, `3.5` och `3.14`. Vi provar oss fram i interpretatorn:

```python
>>> 3.14 + 3.14
6.28
>>> 3.14 + 3
6.140000000000001
>>> 2.5 * 4
10.0
>>>
```

Ibland vill vi bara visa några få decimaler genom att avrunda decimaltalen. I Python kan detta göras med hjälp av funktionen `round()`. Vi skickar först in siffran som ska avrundas och sedan antalet decimaler vi vill ha efter ett kommatecken. Om vi inte skickar in hur många decimaler vi vill ha så avrundas siffran till ett heltal, dvs inga decimaler alls.

```python
>>> 3.14 + 3
6.140000000000001
>>> round(3.14 + 3)
6
>>> round(3.14 + 3, 2)
6.14
```



### Sträng (String) {#strang}

Textvärden heter [_sträng_](https://docs.python.org/3/library/stdtypes.html#text-sequence-type-str) på svenska och _string_ på engelska (förkortas med __str__). En sträng är en sekvens av tecken omslutna av enkla (') eller dubbla (") citattecken. Vi vet att `"Hello world"` är en sträng för att den är omsluten av citattecken. En sträng kan inte innehålla samma typ av citattecken som den är omsluten av ochen sträng avslutas så fort ett likadant citattecken påträffas i sekvensen.

I koden nedan visas vårt första felmeddelande. Felmeddelanden visas när något går fel i vårt program, då avslutas programmet och ett felmeddelande visas. I detta fall får vi ett felmeddelande när vi försöker skriva värdet `"It"s Learning"`, alltså en sträng skapad med `"` som innehåller en `"` som en del av värdet. Kolla på felmeddelandet och se om du förstår vad felet är, jag förklarar felet i texten under koden.

```python
>>> "3.14"
'3.14'

>>> "It's Learning"
"It's Learning"

>>> 'It"s Learning'
'It"s Learning'

>>> "It"s Learning"
  File "<stdin>", line 1
    "It"s Learning"
        ^
SyntaxError: invalid syntax
```

Python interpretatorn klarar bara av att exekvera kod som följer dess struktur. När vi skriver `"It"s Learning"` skapar vi en sträng som innehåller tecknen `It`. När den andra `"` påträffas i koden avslutas strängen och då blir de efterföljande tecknen inte en del av strängen. Python interpretatorn klarar inte av att det kommer ett `s` efter en sträng och då stoppas programmet och interpretatorn visar felet som vi ser ovanför, ett så kallat syntaxfel. Syntaxfel betyder att koden inte är korrekt skriven. Vi kan även se att koden är på rad 1 och en "^" som pekar på vart felet är.

Om vi har två strängar som vi vill lägga ihop till en lång kan detta med ett "+" mellan två strängar. Detta kallas att konkatenera strängar, den engelska översättningen är 'concatenate'.

```python
>>> "Hello" + "World!"
'HelloWorld!'
>>> "Hello " + "World!"
'Hello World!'
>>> "Hello" + " "  + "World!"
'Hello World!'
```



### Boolean {#boolean}

[Boolean](https://docs.python.org/3/library/stdtypes.html#boolean-values) (förkortas __bool__) är en datatyp som endast kan vara sann eller falsk. Även värden av andra typer kan vara falska eller sanna. Vi kan kolla om ett värde räknas som True eller False med funktionen _[bool()](https://docs.python.org/3/library/functions.html#bool)_. `bool()` är en inbyggd funktion i Python som tar emot ett argument (ett värde) och returnerar True eller False beroende på om värdet räknas som sant eller falskt. Skicka in ett värde inom funktionens paranteser och då skickar den tillbaka True eller False.

```python
>>> bool(0)
False
>>> bool(1)
True
>>> bool(-41)
True
>>> bool(53)
True
>>> bool("")
False
>>> bool("Hej!")
True
>>> bool(0.0)
False
>>> bool(0.1)
True
```
Heltalet 0, decimaltalet 0.0 och en tom sträng räknas som `False` medans alla andra heltal och decimaltal, inklusive negativa, och icke tomma strängar räknas som `True`.



### Kontrollera typen av värdet {#type}

För att kolla vilken typ ett värde har kan vi använda den inbyggda funktionen `type()`. Till `type()` kan vi skicka ett värde i paranteserna (en parameter) så returnerar den vilken typ värdet har.

```python
>>> type(4)
<class 'int'>

>>> type("hej")
<class 'str'>

>>> type('hej')
<class 'str'>

>>> type("4")
<class 'str'>

>>> type(3.14)
<class 'float'>

>>> type(False)
<class 'bool'>
```



### Jämföra värde och datatyp {#equal}

Om vi istället vill jämföra ett värde och en datatyp använder vi funktionen `isinstance()`. `isinstance()` tar emot ett värde och en datatyp och jämför sedan dessa och svarar med sant eller falskt.

```python
>>> isinstance("hej hopp", str)
True
>>> isinstance("hej hopp", int)
False
>>> isinstance(42, int)
True
>>> isinstance(42.42, int)
False
>>> isinstance(42.42, float)
True
>>> isinstance(False, bool)
True
```



Vårt program del 1 {#program-del1}
--------------------------------------
Än så länge har vi bara skrivit kod i Python interpretatorn i terminalen, den är bra för att testa små enskilda saker som vi har gjort nu. Men nu ska vi skriva ett sammanhängande program som består av flera rader och då underlättar det att skriva all [kod i en fil](https://www.youtube.com/watch?v=LokzBtJ-ssY&index=2&list=PLKtP9l5q3ce93pTlN_dnDpsTwGLCXJEpd), vi kan sedan exekvera filen i terminalen. När du skriver kod i en fil, till skillnad från i Python interpretatorn, så skrivs inte saker ut av sig själv. Vi måste använda oss av funktionen `print()` för att specifikt skriva ut något i terminalen.

Programmet vi ska skapa har ett syfte: att skriva ut en hälsning. Vilken kod behövs för att uppnå det? Vi behöver en hälsning, alltså ett värde, som måste vara en sträng eftersom hälsningen ska innehålla bokstäver. Sen behöver vi möjligheten att skriva ut värdet i terminalen.

Gå till kurskatalogen i din terminal och skapa en ny fil som heter "greeting.py". Öppna sedan filen med VSCode. Vi använder kommandot `touch` för att skapa filen.

```bash
# Gå till ditt kursrepo python
$ cd me/kmom01/hello
$ touch greeting.py
$ code .
```

Skriv följande kod i filen.

```python
#!/usr/bin/env python3
print("Hej Jack Black, du är 48 år gammal.")
```

I koden använder vi oss av den inbyggda funktionen `print()`. `print()` tar emot ett argument, vi skickar in strängen "Hej Jack Black, du är 48 år gammal.". `print()` skriver ut värdet i terminalen som startade programmet.

Starta exekvering av programmet med kommandot:

```bash
$ python3 greeting.py
```

Då börde du få följande utskrift.

```bash
Hej Jack Black, du är 48 år gammal.
```

I nästa version av programmet ska vi göra så att användaren som startar programmet får skriva in namn och ålder. För att kunna skriva ut vad användaren skriver in måste vi använda oss av _variabler_ för att spara värdet som skrivs in.



Variabler {#variabler}
--------------------------------------

Variabler används för att lagra värden som vi kan referera till och manipulera. Fördelen med variabler är att vi kan ge dem förklarande namn, så det är lätt att veta vad de gör när man läser koden, och vi kan återanvända och ändra värdet genom att använda variabeln. Vi leker lite i python3 interpretatorn i terminalen. Tänk alltid på att använda förklarande variabelnamn.

```python
>>> an_integer = 23
>>> print(an_integer)
23
>>> type(an_integer)
<class 'int'>
```

[FIGURE src=/image/python/variable-memory1.png class="right" caption="an_integer refererar till värdet 23 i minnet."]

Jag börjar med att tilldela heltalet 23 till variabeln `an_integer`. Precis som med värden kan vi använda funktionen `type()` för att kolla vilken datatyp variabeln har och som förväntat är det ett heltal (int). Vi fortsätter med att skapa några fler variabler.

<div style="overflow:auto;">

```python
>>> a_bool = True
>>> a_string = "en sträng"
>>> a_float = 3.14
```
</div>
[FIGURE src=/image/python/variable-memory2.png class="right" caption="Flera variabler refererar till värden i minnet."]

Nu har jag skapat tre variabler till, en som innehåller en bool, en med en sträng och en som innehåller ett decimaltal. Vi kan byta de värden variablerna har.

```python
>>> a_bool = False
>>> print(a_bool)
False
>>> a_float = a_string
>>> print(a_float)
'en sträng'
```

[FIGURE src=/image/python/variable-memory3.png class="right" caption="Flera variabler refererar till värden i minnet."]

Först ändrar jag värdet på `a_bool` till False. Sen sätter jag `a_float` till värdet av `a_string`, då får a_float en kopia av `a_string`s värde.

Precis som med värden kan vi med variabler utföra matematiska operationer i och med att variabler refererar till värden.

```python
>>> a_float = 3.14
>>> an_integer = 6
>>> the_sum = a_float + an_integer
>>> print(the_sum)
9.14
```

[FIGURE src=/image/python/variable-memory8.png caption="Flera variabler refererar vill värden i minnet."]

[YOUTUBE src=6Ru8gJOV4bo caption="Hur variabler kopplas till värden i minnet"]




## Namngivning och Keywords {#namngivning_keywords}

När du namnger variabler ska det vara på engelska, beskrivande och dokumentera vad variabeln används till. Variabelnamn kan innehålla både bokstäver, siffror och vissa andra tecknen men får inte börja på siffror. Om ditt namn ska innehålla flera ord bör du seperera dem med ett "\_" och det är inte tillåtet med mellanrum (" ") i variabelnamn.

Vi kikar på några variabelnamn.

```python
>>> 23_number = 23
  File "<stdin>", line 1
    23_number = 23
            ^
SyntaxError: invalid syntax
```

Variabelnamnet `23_number` börjar på en siffra och då får vi ett SyntaxError. Det betyder att interpretatorn inte kan läsa din kod, den är skriven på fel sätt.

```python
>>> number 23 = 23
  File "<stdin>", line 1
    number 23 = 23
            ^
SyntaxError: invalid syntax
```

Ett till SyntaxError för att namnet innehåller ett mellanrum.

Vissa ord går inte att använda då de är så kallade "keywords", det betyder att Python har reserverat dem och de betyder speciella saker i koden. Följande keywords finns i python3.

```python
'False',    'None',     'True',     'and',      'as',
'assert',   'break',    'class',    'continue', 'def',
'del',      'elif',     'else',     'except',   'finally',
'for',      'from',     'global',   'if',       'import',
'in',       'is',       'lambda',   'nonlocal', 'not',
'or',       'pass',     'raise',    'return',   'try',
'while',    'with',     'yield'
```

Detta betyder att vi till exempel inte kan döpa en variabel till `and` men ett variabelnamn kan fortfarande innehålla "and", t.ex. `android`.

```python
>>> android = "Mitt namn kan innehålla and"
>>> and = "Jag kan inte heta and"
  File "<stdin>", line 1
    and = "Jag kan inte heta and"
      ^
SyntaxError: invalid syntax
```

Jag får ett SyntaxError när jag försöker döpa variabeln till keywordet `and`.

<!-- Uttryck {#uttryck}
--------------------------------------

Ett uttryck, _Expression_ på engelska, kan vara ett värde, en operation eller en variabel. Man kan säga att det är något som resulterar i ett värde. I följande kod är varje rad ett uttryck.

```python
True
"Hej" + " då"
2 / 3
round(3.14)
```

På sista kodraden använder jag en till inbyggd funktion, `round()` tar emot ett argument, ett decimaltal, och skickar tillbaka (returnerar) värdet avrundat. "round(3.14)" resulterar i "3".



Sats {#sats}
--------------------------------------

En sats, _Statement_ på engelska, är något som gör något. Ett program består av en sekvens av minst en sats. Det kan vara svårt att veta skillnaden på ett uttryck och en sats då ett uttryck också är en sats och definitionen att ett "uttryck producerar ett värde" och "en sats gör något" inte alltid stämmer. Vi tittar på några statements.

```python
print(43)
x = "heej"
print(x)
5 + 5 / 3
```

Sista raden är både ett uttryck och en sats. -->

Nu har vi en grundläggande förståelse för vad en variabel är och hur vi kan spara värden med hjälp av variabler. Vi ska i nästa del titta på hur vi kan använda variabler för att förbättra vårt program `greeting.py`.



Vårt program del 2 {#program-del2}
--------------------------------------

Vi går tillbaka till vår fil `greeting.py` och fortsätter utvecklingen av vårt program. Nästa steg är att be användaren skriva in ett namn och en ålder och använda det i hälsningen. Vad behöver vi i koden? Vi behöver input från användaren (namn och ålder), spara värdena så vi kan använda dem, bygga hälsningssträngen med värdena och skriva ut hälsningen.

Först ska vi dock kommentera koden vi redan har så andra utvecklare och du själv vet vad den gör.



### Kommentera {#kommentera}

Kommentarer används för att förklara vad kod och program gör så att du själv och andra utvecklare lätt vet vad saker ska göra. Om det var länge sedan du jobbade med ett program och sen återvänder kan det vara svårt att komma ihåg vad all kod gör, då är det bra om du har kommenterat den. Tecknet "#" används för att kommentera en rad. När Python interpretatorn läser en "#" vet den att allt som kommer efter på samma rad är en kommentar och låter bli att exekvera det som kod.

Vårt program innehåller inte mycket än så länge men vi kan lägga en kommentar överst i filen som förklarar vad programmet ska göra.

```python
# Programmet skriver ut en hälsning till Jack Black

print("Hej Jack Black, du är 48 år gammal.") # Skriver ut ett sträng värde
```

Du kan testa köra programmet igen för att se att kommentaren inte har påverkat programmet.

```bash
$ python3 greeting.py
Hej Jack Black, du är 48 år gammal.
```

Det finns en till typ av kommentar som kallas _Docstring_. Den brukar användas överst i filer för att förklara vad koden i filen gör eller när en kommentar är flera rader lång. Docstring görs med trippla citattecken `"""`.

```python
"""
Programmet skriver ut en hälsning till Jack Black
"""

print("Hej Jack Black, du är 48 år gammal.") # Skriver ut ett sträng värde
```



### Inmatning {#inmatning}

Python är ett såkallat sekventiellt programmeringsspråk. Det betyder att när vi kör programmet kör vi det ovanifrån och ner, en rad i taget. Vi vet alltid att vi är klara med raden ovan när vi börjar på nästa rad.

Funktionen "[input()](https://docs.python.org/3/library/functions.html#input)" gör att användaren kan mata in ett strängvärde till programmet. Vi testar att använda `input()` i vår fil `greeting.py`.

```python
"""
Programmet skriver ut en hälsning till Jack Black
"""
input()
print("Hej Jack Black, du är 48 år gammal.") # Skriver ut ett sträng värde
```

Kom ihåg att koden exekveras uppifrån och ner och en rad åt gången. När vi testar programmet kommer programmet börja med att vänta på att användaren ska skriva något i terminalen och klicka "enter". Sen exekveras nästa rad som skriver ut vår hälsning. Nedan ser vi hur programmet står och väntar på inmatning från användaren innan hälsningen skrivs ut.

[ASCIINEMA src=250775]

Om du testade köra koden själv märkte du att du inte får någon utskrift när du ska mata in en sträng, jag skrev 'test' som inmatning. I fall du vill få en utskrift när du ska skriva in kan du skicka en sträng som ett argument till "input()" funktionen som skrivs ut när användaren ska skriva in. Låt oss testa.

```python
"""
Programmet skriver ut en hälsning till Jack Black
"""

input("Skriv något, klicka sen enter: ")
print("Hej Jack Black, du är 48 år gammal.") # Skriver ut ett sträng värde
```

Testa starta ditt program.

```bash
$ python3 greeting.py
Skriv något, klicka sen enter: skriver något igen
Hej Jack Black, du är 48 år gammal.
```

Jag skrev in "skriver något igen". Än så länge gör vi inget med värdet vi har skrivit in. `input()` är en funktion som skickar tillbaka (även kallat returnerar) värdet vi skriver in. Om vi vill spara värdet i en variabel behöver vi tilldela en variabel vad `input()` returnerar. Tänk dig att när `input()` returnerar skickas värdet till vänster och sparas i variabeln. Vi ändrar koden igen och ber användaren skriva in namnet, som programmet ska hälsa till, och skriver ut namnet med `print()`.

```python
"""
Programmet skriver ut en hälsning till Jack Black
"""

name = input("Skriv ett namn, klicka sen enter: ")
print(name) # Skriver ut ett sträng värde
```

Nu skapar vi variabeln `name` och tilldelar den värdet av vad `input()` returnerar.

[FIGURE src=/image/python/variable-memory4.png caption="variabeln 'name' har värdet av det vi matade in till input()."]



Nedan ser vi hur det kan se ut när vi kör programmet.

```bash
$ python3 greeting.py
Skriv ett namn, klicka sen enter: Jack Black
Jack Black
```

[ASCIINEMA src=250774]



### Konkatenera inmatningen med en annan sträng

Nu kan vi testa konkatenera (lägga ihop två strängar) namnet och hälsningen.

```python
"""
Programmet skriver ut en hälsning till Jack Black
"""

name = input("Skriv ett namn, klicka sen enter: ") # Ber användaren mata in ett namn
greeting = "Hej " + name + ", du är 48 år gammal." # Sätter ihop "Hej", name och ", du är 48 år gammal." till ett värde.
print(greeting) # Skriver ut ett sträng värde

greeting = "test" + 24 # Testar konkaternera en sträng med ett heltal bara för att se vad som händer.
```

Vi skapar variabeln `greeting` och tilldelar den värdet av vad som finns till höger om "=" tecknet. Vi har ett uttryck till höger som resulterar i ett nytt strängvärde som tilldelas till variabeln `greeting`. Exekvera koden och se vad som händer. Vad tror du kommer hända när sista raden exekveras?

```bash
$ python3 greeting.py
Skriv ett namn, klicka sen enter: Jack Black
Hej Jack Black, du är 48 år gammal.
Traceback (most recent call last):
  File "greeting.py", line 6, in <module>
    greeting = "test" + 24 # Testar konkaternera en sträng med ett heltal bara för att se vad som händer.
TypeError: Can\'t convert \'int\' object to str implicitly
```

[FIGURE src=/image/python/variable-memory5.png class="right" caption="Variablerna 'name' och 'greeting' har värden i minnet."]

Nu gick något fel i programmet. Läs felmeddelandet (Traceback) uppifrån och ner. I filen `greeting.py` på rad 6 finns felet, sen har raden som ger felet skrivits ut så vi lätt kan se vilken rad det är. Sist får vi reda på vad för typ av fel vi har, vårt fel är ett `TypeError`. Interpretatorn kan inte göra om en sträng till ett heltal av sig själv. Vi får felet för att vi försöker skapa en ny sträng, av en sträng och ett heltal. Utöver den raden fungerar programmet som det ska. Namnet vi skrev in användes i hälsningen. Vi tar bort den sista raden igen och går vidare.

Nu kan användaren bestämma namnet, nästa steg är att bestämma åldern. Då behöver vi ytterligare en `input()`. Allt `input()` returnerar är av typen sträng, så även om vi skriver in siffror i terminalen blir de inte ett heltal utan en sträng.

```python
"""
Programmet skriver ut en hälsning till Jack Black
"""

name = input("Skriv ett namn, klicka sen enter: ") # Ber användaren mata in ett namn
age = input("Skriv en ålder, klicka sen enter: ") # Ber användaren mata in en ålder
greeting = "Hej " + name + ", du är " + age + " år gammal." # Sätter ihop "Hej", name, ", du är ", age och " år gammal." till ett värde.
print(greeting) # Skriver ut ett sträng värde
```

Vårt program frågar nu efter ett namn följt av en ålder. Vi sparar namnet och åldern i två variabler, båda av typen sträng. Variablerna används för att skapa en ny sträng som sparas i variabeln `greeting`. Vi avslutar med att skriva ut innehållet av `greeting` till terminalen.

```bash
$ python3 greeting.py
Skriv ett namn, klicka sen enter: Bo Burnham
Skriv en ålder, klicka sen enter: 27
Hej Bo Burnham, du är 27 år gammal.
```

[FIGURE src=/image/python/variable-memory6.png class="right" caption="Variablerna 'name' och 'greeting' har värden i minnet."]

[YOUTUBE src=zH8j_GZkkT4 caption="Hur input() och string konkatenering exkeveras i Python"]


Nu börjar det likna något, vi har kvar att räkna ut året då personen föddes och lägga till det i utskriften.

Titta över koden en extra gång och se till att du förstår alla delar. Undrar du över något kan du alltid hojta till i forum eller chatt.



Vårt program del 3 {#program-del3}
--------------------------------------

Vi kan räkna ut vilket år personen föddes med hjälp av åldern som användaren skriver in och ett _hårdkodat_ värde för vilket år det är nu. Ett hårdkodat värde skapas i koden, det kommer inte från inmatning.
I vår kod behövs ett heltalsvärde för vilket år det är nu, räkna ut födelseåret och lägga in det i hälsningen.

Jag tar bort kommentarerna på gammal kod för att det ska bli luftigare i koden och lättare för dig att läsa den nya.

```python
year = 2018 # Hårdkodat värde för vilket år det är

name = input("Skriv ett namn, klicka sen enter: ")
age = input("Skriv en ålder, klicka sen enter: ")

year_born = year - age # Födelseår räknas ut. (2018 - inmatat värde)

greeting = "Hej " + name + ", du är " + age + " år gammal och föddes år " + year_born
print(greeting)
```

Läs igenom koden noggrant så du förstår vad som händer och starta sen programmet.

```bash
$ python3 greeting.py
Skriv ett namn, klicka sen enter: Bo Burnham
Skriv en ålder, klicka sen enter: 27
Traceback (most recent call last):
  File "greeting.py", line 11, in <module>
    year_born = year - age # Födelseår räknas ut. (2018 - inmatat värde)
TypeError: unsupported operand type(s) for -: 'int' and 'str'
```

Var du beredd på felet? Jag skrev tidigare att allt `input()` returnerar är av typen sträng och vi har sett att vi inte kan blanda strängar och heltal i operationer. Därför får vi ett TypeError fel på rad 11 i `greeting.py` när vi försöker göra `2018 - "27"`.

### Typkonvertering {#typkonvertering}

För att kunna använda värdet ålder vi får från `input()` behöver vi ändra dess typ från sträng till heltal. Vi har redan gjort detta med boolean värden. Då använde vi funktionen `bool()`, nu ska vi använda funktionen `int()`. `int()` tar emot ett argument, ett värde, och returnerar det värdet med typen heltal.

```python
year = 2018 # Hårdkodat värde för vilket år det är

name = input("Skriv ett namn, klicka sen enter: ")
age = input("Skriv en ålder, klicka sen enter: ")

year_born = year - int(age) # Födelseår räknas ut. Gör om age från string till integer med int()

greeting = "Hej " + name + ", du är " + age + " år gammal och föddes år " + year_born
print(greeting)
```

Nu räknar vi ut `year_born` med `year` (2018) minus `age` (inmatat värde). Kan du se nästa fel?

```bash
$ python3 greeting.py
Skriv ett namn, klicka sen enter: Bo Burnham
Skriv en ålder, klicka sen enter: 27
Traceback (most recent call last):
  File "greeting.py", line 13, in <module>
    greeting = "Hej " + name + ", du är " + age + " år gammal och föddes år " + year_born # Sätter ihop "Hej", name, ", du är ", age och " år gammal." till ett värde.
TypeError: Can\'t convert \'int\' object to str implicitly
```

Läs felmeddelandet uppifrån och ner. I filen `greeting.py` på rad 13 har vi ett `TypeError`, kan inte konvertera från heltal till sträng av sig själv. Med andra ord behöver vi göra om `year_born` till en sträng, med funktionen `str()`, för att kunna konkatenera `year_born` med resten av strängarna.
Vi kan göra konverteringen på olika ställen beroende på vad du föredrar. Nedanför visar jag olika ställen i koden vi kan göra konkateneringen.

```python
greeting = "Hej " + name + ", du är " + age + " år gammal och föddes år " + str(year_born) # version 1

year_born = str(year_born) # version 2

year_born = str(year - int(age)) # version 3
```

Nedanför förklarar jag de olika sätten. Tänk på operations prioriteringarna, paranteser räknas ut först. Jag utgår från värdena jag matade in senast jag testade programmet, Bo Burnham och 27.

**Version 1**, vi gör om "year_born" till en sträng när vi konkatenerar den med resten av strängarna.

1. "year_born" konverteras till en sträng.
1. 'Hej' läggs ihop med "Bo Burnham".
1. 'Hej Bo Burnham ' konkateneras med ", du är".
1. 'Hej Bo Burnham, du är ' konkateneras med "27".
1. 'Hej Bo Burnham, du är 27' konkateneras med ' år gammal och föddes år '.
1. 'Hej Bo Burnham, du är 27 år gammal och föddes år ' konkateneras med "1991".

**Version 2**, vi gör om "year_born" till en sträng efter uträkningen.

1. "year_born" konverteras till en sträng.
1. Strängen tilldelas till variabeln "year_born".

**Version 3**, vi gör om "year_born" till en sträng när vi gör uträkningen:

1. "age" blir ett heltal.
1. Räknar ut year - age.
1. Resultatet görs om till en sträng.
1. "year_born" tilldelas strängen.

Jag väljer att använda version 3 i min kod.

```python
year = 2018 # Hårdkodat värde för vilket år det är

name = input("Skriv ett namn, klicka sen enter: ")
age = input("Skriv en ålder, klicka sen enter: ")

year_born = str(year - int(age)) # Födelseår räknas ut. Gör om age från string till integer med int()

greeting = "Hej " + name + ", du är " + age + " år gammal och föddes år " + year_born
print(greeting)
```

Nu borde vi vara färdiga med programmet, det tar namn och ålder som input, räknar ut födelseåret och skriver ut en hälsning med namn, ålder och födelseår. Testa köra programmet och kolla så det fungerar.

```bash
$ python3 greeting.py
Skriv ett namn, klicka sen enter: Bo Burnham
Skriv en ålder, klicka sen enter: 27
Hej Bo Burnham, du är 27 år gammal och föddes år 1991
```

[FIGURE src=/image/python/variable-memory7.png caption="Variabler refererar till värden i minnet."]

[YOUTUBE src=BZRYlIlH0vw caption="Typkonvertering och korta ner rad i Python"]




Avslutningsvis {#avslutning}
--------------------------------------
Vi har nu fått en grund till värden och variabler i python. Vi har sett olika datatyper heltal, decimaltal, strängar och boolska värden (sant eller falskt). Vi vet hur vi sparar värden i variabler och hur vi ändrar och skriver ut värdena med hjälp av `print()`. Vi har skapat ett program som tar emot indata från användaren och skriver ut både strängar och heltal efter typkonvertering från heltal till sträng.
