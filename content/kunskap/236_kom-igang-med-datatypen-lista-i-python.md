---
author: mos
category: python
revision:
  "2020-06-09": (B, aar) Uppdaterad inför HT20.
  "2016-02-29": (A, mos) Första utgåvan.
updated: "2020-06-09 10:17:35"
created: "2016-02-29 10:17:31"
...
Kom igång med datatypen lista i Python
==================================

[FIGURE src=/image/snapvt16/python-list-shopping.png?w=c5&a=0,75,75,0 class="right"]

Detta är en väldigt lång artikel, det finns mycket att gå igenom om listor. Tänk på att ta en bensträckare och dricka lite vatten under tiden så du kan hålla fokus.

Python är känt för sina datastrukturer och listor är en av de grundläggande datastrukturerna. Denna artikel introducerar listor och visar hur du kan jobba med dem. Datastrukturer används för att organisera, hanter och förvara data.  
Tidigare har vi pratat om datatyper som heltal och strängar, vi kan se dem som att vi skapar data och sen använder vi variabler för att referera till ett värde. Medan datastrukturer/listor är till för att förvara/hålla flera data värden, med datastrukturera kan vi gruppera relaterad data. Listor i Python kan innehålla värden av alla olika datatyper.

Du får se hur du skapar en lista, hur du lägger till, tar bort och flyttar runt innehållet i listan samt hur du loopar runt en lista.

<!--more-->



Förutsättning {#pre}
-------------------------------

Du kan grunderna i Python och du vet vad variabler och typer innebär.



En shoppinglista i Python {#shopping}
------------------------------


Jag har fått i uppdrag att sköta helgens inhandling av mat. Som nybliven Python-programmerare så tänker jag lösa det på en programmerares sätt.

Här är min råa data.

```text
köttfärs
grädde
krossade tomater
gul lök
```

Jag börjar med en ansats där varje rad på shoppinglistan är en sträng och denna strängen lägger jag till en lista i Python.



###En lista `[]` som datastruktur {#datastruct}

Jag börjar med en tom lista. I Python representerar `[]` en tom lista.

```python
>>> shopping = []
>>> print(shopping)
[]
>>> type(shopping)
<class 'list'>    
```

Sådär, nu har jag en tom lista att utgå ifrån.

Det finns fler sätt att skapa en lista. Du kan till exempel använda en konstruktor `list()` eller skapa en färdig lista där du separerar värden med ett kommatecken.

```python
>>> alist = list()
>>> alist          
[]                 
>>> another_list = ["a", "b", "c"]
>>> print(another_list)                  
['a', 'b', 'c']                  
```

`another_list` innehåller här tre olika värden/strängar. Varje värde i en lista kallas ett element, `another_list` innehåller tre element. Det finns alltid varianter på hur man gör saker. En enkel variant vore att jag helt enkelt skapade hela min shoppinglistan på en gång.

```python
>>> shopping = ["köttfärs", "krossade tomater", "grädde", "gul lök", 'röd lök']
>>> print(shopping)                                                        
['köttfärs', 'krossade tomater', 'grädde', 'gul lök', 'röd lök']               
```



###En lista med positioner (index) {#pos}

När saker ligger i en lista så ligger det på en viss position (kallas även index). Positionerna i listan är numrerad från 0 till antal saker i listan minus ett. Inom programmering börjar man oftast räkna från noll och inte ett.

För att räkna ut antalet saker i listan så använder vi Pythons inbyggda funktion [`len()`](https://docs.python.org/3.5/library/functions.html?highlight=len#len).

```python
>>> shopping                                                     
['köttfärs', 'krossade tomater', 'grädde', 'gul lök', 'röd lök']
>>> print(len(shopping))
5  
```

[FIGURE src=/image/python/shopping_list.png]


Det första elementet, "grädde",  i listan `shopping` har position 0 och det sista elementet, "röd lök", har position 4 (antalet element - 1).

Det går att referera till individuella elementen/positioner i en lista, vilket man oftast vill göra för att kolla vilket värde som finns på positionen eller byta ut det. Syntaxen ser ut som följande, `list_variable[index]`.

Vi börjar med att kolla på det första och sista värdet som finns i `shopping`.

```python
>>> print(shopping[0])
'köttfärs'         
>>> print(shopping[4])
'röd lök'        
```

Det går att ändra värdet på en position på följande sätt.

```python
>>> print(shopping)                                                        
['köttfärs', 'krossade tomater', 'grädde', 'gul lök', 'röd lök']
>>> shopping[1] = "morötter"

>>> print(shopping)                                                        
['köttfärs', 'morätter', 'grädde', 'gul lök', 'röd lök']
```

Med hjälp av dessa konstruktioner kan vi nu byta plats på två element i listan. Säg jag vill byta plats på "grädde" och "köttfärs".

```python
>>> temp_item = shopping[0]                                      
>>> shopping[0] = shopping[2]                                   
>>> shopping[2] = temp_item                                      
>>> print(shopping)                                                    
['grädde', 'morötter', 'köttfärs', 'gul lök', 'röd lök']
```

Jag behöver mellanlagra värdet i variabeln `temp_item` och på det viset kan jag byta plats på två element i en lista.

Vi kollar lite snabbt på vad som händer om man försöker använda ett för stort index på listan.

```python
>>> print(shopping[5])
Traceback (most recent call last):                      
  File "<stdin>", line 1, in <module>    
IndexError: list index out of range
```



#### Negativa index {#neg_index}

I Python kan man även använda sig av negativa index. Det används för att utgå från sista elmenetet istället första.

```python
>>> print(shopping[-1])
'röd lök'
>>> print(shopping[-3])
'köttfärs'
>>> print(shopping[-5])
'grädde'
>>> print(shopping[-6])
Traceback (most recent call last):                      
  File "<stdin>", line 1, in <module>    
IndexError: list index out of range
```

Så, då kikar vi lite på vad vi kan göra med en lista. Vi börjar om med en tom lista och kollar på hur vi kan lägga till nya värden i den.

[YOUTUBE src=subD0Mhm7ks caption="Andreas introducerar listor."]



###Metoder för att jobba med en lista {#metoder}

En lista i Python är implementerad som en `<class 'list'>` och har ett antal metoder kopplade till sig. Vi kan läsa om dessa [metoder i manualen](https://docs.python.org/3.5/tutorial/datastructures.html), eller få fram information om dem direkt i terminalen.

```python
>>> shopping = []
>>> dir(shopping)
['__add__', '__class__', '__contains__', '__delattr__', '__delitem__', '__dir__', '__doc__
', '__eq__', '__format__', '__ge__', '__getattribute__', '__getitem__', '__gt__', '__hash_
_', '__iadd__', '__imul__', '__init__', '__iter__', '__le__', '__len__', '__lt__', '__mul_
_', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__reversed__', '__rmu
l__', '__setattr__', '__setitem__', '__sizeof__', '__str__', '__subclasshook__', 'append',
 'clear', 'copy', 'count', 'extend', 'index', 'insert', 'pop', 'remove', 'reverse', 'sort'
]
>>> help(shopping.insert)
Help on built-in function insert:

insert(...) method of builtins.list instance
    L.insert(index, object) -- insert object before index
```

Med funktionen `dir()` får jag fram en lista med attribut och metoder som kan användas när man jobbar med en lista. Jag ignorerar de som börjar med `__` och fokuserar på de metoder som är publika.

Jag hittar metoden `insert()` som verkar vara det jag letar efter. Låt testa och se.



### Lägga till innehåll i listan (insert/append) {#insert}

Jag testar att lägga till items i listan med hjälp av metoden `insert()`.

```python
>>> shopping.insert("köttfärs")                         
Traceback (most recent call last):                      
  File "<stdin>", line 1, in <module>                   
TypeError: insert() takes exactly 2 arguments (1 given)
>>> shopping.insert(2, "köttfärs")                      
>>> shopping                                            
['köttfärs']                                            
>>> shopping.insert(0, "grädde")                        
>>> shopping                                            
['grädde', 'köttfärs']                                  
>>> shopping.insert(1, "krossade tomater")              
>>> shopping                                            
['grädde', 'krossade tomater', 'köttfärs']              
```

Det visar sig att metoden `insert()` tar två parametrar, en som anger själva objektet, strängen i vårt fall, och en som anger positionen i listan.

Nu var jag inte intresserad av positionen i listan, jag ville bara lägga in dem i en viss ordning. Jag kollar om det finns en annan bättre metod och finner `append()`.

```python
>>> help(shopping.append)
Help on built-in function append:             

append(...)                                   
    L.append(object) -- append object to end  
```

Jag testar att använda metoden `append()` istället.

```python
>>> shopping                                          
['grädde', 'krossade tomater', 'köttfärs']            
>>> shopping.append("gul lök")                        
>>> shopping                                          
['grädde', 'krossade tomater', 'köttfärs', 'gul lök']
>>> shopping.append("röd lök")                                   
>>> shopping                                                     
['grädde', 'krossade tomater', 'köttfärs', 'gul lök', 'röd lök']
```

Ja, det var mer `append()` som jag hade tänkt mig. Det finns alltså olika sätt att lägga till saker till en lista.



###Radera saker ur listan {#radera}

Det visade sig att "röd lök" ligger i listan men det skall jag inte ha. Det vill jag ta bort. Vis av skillnanden mellan `insert()` och `append()` så läser jag nu i [manualen](https://docs.python.org/3.5/tutorial/datastructures.html) om de metoder som finns för att radera saker ur en lista. Jag finner `remove()` och `pop()` och väljer den senare.

```python
>>> shopping                                                    
['köttfärs', 'krossade tomater', 'grädde', 'gul lök', 'röd lök']
>>> remove = shopping.pop(4)                                    
>>> remove                                                      
'röd lök'                                                       
>>> shopping                                                    
['köttfärs', 'krossade tomater', 'grädde', 'gul lök']           
```

Metoden `remove()` tar bort en sak ur listan baserad på dess värde. Jag hade alltså kunnat använda den metoden, som ett alternativ.

```python
>>> shopping                                                    
['köttfärs', 'krossade tomater', 'grädde', 'gul lök']           
>>> shopping.append("röd lök")                                  
>>> shopping                                                    
['köttfärs', 'krossade tomater', 'grädde', 'gul lök', 'röd lök']
>>> shopping.remove("röd lök")                                  
>>> shopping                                                    
['köttfärs', 'krossade tomater', 'grädde', 'gul lök']           
```

Ibland lämpar sig den ena eller den andra bättre. Det är bara att välja, båda utför arbetet som önskas, att ta bort "röd lök" från shoppinglistan.

[YOUTUBE src=2H5ms6QZlPI caption="Andreas går igenom list metoder."]



###Loopa genom en lista {#loop}

Säg jag vill loopa igenom min shoppinglista och skriva ut varje värde. En `for`-sats hjälper mig med det.

```python
>>> for item in shopping:
...     print(item)       
...                       
köttfärs                  
krossade tomater          
grädde                    
gul lök                   
```

Säg nu att du vill ha listan numrerad. Du skulle kunna skapa en räknare som du inkrementerar för varje varv i loopen, det hade fungerat. Men låt mig visa dig en annan variant som är mer Python-lik.

```python
>>> for i, item in enumerate(shopping):      
...     print("{}. {}".format(i + 1, item));
...                                          
1. köttfärs                                  
2. krossade tomater                          
3. grädde                                    
4. gul lök                                   
```

Den inbyggda funktionen [`enumerate()`](https://docs.python.org/3.5/library/functions.html#enumerate) hjälper oss att få en siffra på varje iteration, så vi slipper en egen räknare. Det som returneras från `enumerate()` är en annan spännande datastruktur i Python, en *tuple*. Men den pratar vi mer om en annan dag.

Nu skall jag gå och handla med min shoppinglista.

[YOUTUBE src=nLANWlxXg3o caption="Andreas går igenom listor med loopar."]



### Pausa med en uppgift {#uppgift}

Ta en fem minuter bensträckare och försök dig sen på att lösa en liten uppgift.

Om du har gjort [Ett simpelt tärningsspel](kunskap/villkor-och-loopar#dice_game) i övningen i kmom02 kan du fortsätta på den koden. Nu ska du göra ett simpelt tärningsspel där användare ska skriva in hur många tärningar som ska slås, spara varje slag i en lista. Räkna sen ut medelvärde och totalsumma för slagen och skriv ut det och alla slag. Som extrauppgift ska programmet inte avslutas när utskriften är gjord utan istället ska användaren kunna skriva in ett till antal tärningslag eller välja att avsluta.

[YOUTUBE src=YU_1IK3Cbzs caption="Andreas löser uppgiften."]



### Slicing {#slicing}

Ibland vill man ha ut en sekvens element från en lista till en egen lista. Man kan använda sig av en for-loop för det till exempel om man vill ha element från index 2-4.

```python
>>> shopping = ['köttfärs', 'krossade tomater', 'grädde', 'gul lök', 'röd lök']
>>> new_list = []
>>> for i in range(2, 5):
....    new_list.append(shopping[i])

>>> print(new_list)
['grädde', 'gul lök', 'röd lök']
```

Det finns så klart smidigare sätt att göra detta i Python. Det vi gör i raden ovanför kan liknas med att bara hämta ett värde med ett index, fast vi vill ha flera värden istället för ett.

Vi ska använda något som kallas slicing `a_list[start:end]`, inom hakparenteserna skickar vi in ett start index och ett slut index och då returneras en ny lista med indexen från start upp till slut (tänk -1 som med range()). PS. slicing funkar även på strängar, för att hämta ut en substräng.

```python
>>> shopping = ['köttfärs', 'krossade tomater', 'grädde', 'gul lök', 'röd lök']
>>> new_list = shopping[2:5]
>>> print(new_list)
['grädde', 'gul lök', 'röd lök']
```

Smidigt! Så som vi använde slicing tar vi de tre sista elementen, i och med att vi tar upp till och med sista elementet behöver vi inte ha med slut indexet.

```python
>>> shopping = ['köttfärs', 'krossade tomater', 'grädde', 'gul lök', 'röd lök']
>>> new_list = shopping[2:]
>>> print(new_list)
['grädde', 'gul lök', 'röd lök']
```

`shopping[2:]` producerar samma som `shopping[2:5]`, för att fyra är sista index i listan. Det funkar likadant med start index, om man vill ha från första värdet upp till ett annat, behöver man bara slut index.

```python
>>> shopping = ['köttfärs', 'krossade tomater', 'grädde', 'gul lök', 'röd lök']
>>> new_list = shopping[:3] # samma som shopping[0:3]
>>> print(new_list)
['köttfärs', 'krossade tomater', 'grädde']
```



#### Kopiera lista {#copy}

Slicing används ofta för att kopiera listor, `a_list[:]` skapar en ny lista från index noll till det sista. Med andra ord kopierar en lista.

```python
>>> shopping = ['köttfärs', 'krossade tomater', 'grädde', 'gul lök', 'röd lök']
>>> new_list = shopping[:]
>>> print(new_list)
['köttfärs', 'krossade tomater', 'grädde', 'gul lök', 'röd lök']
```



#### Negativa index i slice {#negativ_slice}

Magin med Slicing slutar inte där, det funkar även med negativa index.

```python
>>> shopping = ['köttfärs', 'krossade tomater', 'grädde', 'gul lök', 'röd lök']
>>> new_list = shopping[2:-1]
>>> print(new_list)
['grädde', 'gul lök']
```

`-1` säger ta fram till sista värdet och därför får vi inte "röd lök".

```python
>>> shopping = ['köttfärs', 'krossade tomater', 'grädde', 'gul lök', 'röd lök']
>>> new_list = shopping[-3:]
>>> print(new_list)
['grädde', 'gul lök', 'röd lök']
```

`shopping[-3:]` börja med tredje sista elementet och ta sen resten.

[YOUTUBE src=KnNwrr6tMq8 caption="Andreas går igenom slicing."]



#### Append med slicing {#append_slice}

Det går även att lägga till element i en lista med slicing. Append med slicing används för att lägga till element från en lista i en annan. Vi kan se det som att slå ihop två listor. Man behöver tänka sig för när man ska göra det för att det kan också användas för att byta ut elementen i en lista mot en annan lista.

Exempel på att lägga in alla element från en lista först i en annan.

```python
>>> shopping_list = ['köttfärs', 'krossade tomater', 'grädde']
>>> other_list = ['gul lök', 'röd lök']
>>> shopping_list[0:0] = other_list
>>> print(shopping_list)
['gul lök', 'röd lök', 'köttfärs', 'krossade tomater', 'grädde']
```

`shopping_list[0:0] = other_list`, gör att alla element från `other_list` läggs in i `shopping_list`, från index 0 och framåt. Elementen som redan låg i `shopping_list` flyttades bak i listan. I exemplet användes `0:0` för att lägga till först, men det går att göra likadant för alla index i lista. Testa själv att använda t.ex. `2:2` istället.



#### Append och ersätt med slicing {#replace_slice}

Ovanför skrev jag att man behöver vara försiktigt med att använda slicing för att slå ihop listor. Det ska vi kolla på nu, istället för att använda samma index som start och stop i slicen ska vi använda en range.

```python
>>> shopping_list = ['köttfärs', 'krossade tomater', 'grädde']
>>> other_list = ['gul lök', 'röd lök']
>>> shopping_list[1:2] = other_list
>>> print(shopping_list)
['köttfärs', 'gul lök', 'röd lök', 'grädde']
```

`shopping_list[1:2] = other_list` gör att elementen från other list ersätter elementen från `shopping_list` som med index `1`, vilket blir "krossade tomater".

```python
>>> shopping_list = ['köttfärs', 'krossade tomater', 'grädde']
>>> other_list = ['gul lök', 'röd lök']
>>> shopping_list[1:3] = other_list
>>> print(shopping_list)
['köttfärs', 'gul lök', 'röd lök']
```

Här ersätter vi både index 1 och 2 med elementen från `other_list`. Testa själv med olika sekvenser i slicen för att se hur det påverkar.

[YOUTUBE src=AyFcjm1v74s caption="Andreas går igenom hur man kan slå ihop listor med slicing."]



### Listor och strängar {#string_list}

Listor är en typ av itterable, det går att litterera över värdena i en lista. T.ex. i en for-loop, strängar är också en itterable. En sträng är egentligen en sekvens av flera karaktärer. Det gör att det ofta går att jobba med listor och strängar på liknande sätt. T.ex. i for-loopar, indexering och slicing. Nu ska vi titta på hur man kan göra strängar till listor och listor till strängar.



#### Lista till sträng (join) {#join}

Den inbyggda funktionen [join()](https://docs.python.org/3/library/stdtypes.html?highlight=str%20join#str.join) hos strängar kan vi använda för att ta alla element och bygga ihop till en sträng. Man kallar `join()` på en sträng och skickar inte listan som argument till join. Värdet som finns i strängen läggs som separator mellan varje element från listan i strängen. Vi kollar på hur vi kan ta shopping listan och göra den till en sträng med ett space mellan varje element.

```python
>>> shopping_list = ['köttfärs', 'krossade tomater', 'grädde', 'gul lök', 'röd lök']
>>> shopping_str = " ".join(shopping_list)
>>> print(shopping_str)
"köttfärs krossade tomater grädde gul lök röd lök"
```

Det blev inte så tydligt vad som är vad i och med att vi har space i ingredienserna också. Vi kan lägga till ett kommatecken också för att göra det tydligare.

```python
>>> shopping_list = ['köttfärs', 'krossade tomater', 'grädde', 'gul lök', 'röd lök']
>>> shopping_str = ", ".join(shopping_list)
>>> print(shopping_str)
"köttfärs krossade, tomater, grädde, gul lök, röd lök"
```

Notera att värdet i join-strängen inte läggs till i början eller slutet av den nya strängen, det läggs bara i mellan elementen. Vi kan dela upp dem på varsin rad istället, med `\n`.

```python
>>> shopping_list = ['köttfärs', 'krossade tomater', 'grädde', 'gul lök', 'röd lök']
>>> shopping_str = "\n".join(shopping_list)
>>> print(shopping_str)
"köttfärs krossade
tomater
grädde
gul lök
röd lök"
```

Det är vanligt att använda join() när man vill göra en snygg utskrift av en lista.

[YOUTUBE src=An52yGM2Knw caption="Andreas går igenom join()"]




#### Sträng till lista (split) {#split}

För att göra tvärtom, dela upp en sträng till en lista använder vi [split()](https://docs.python.org/3/library/stdtypes.html#str.split). Om vi har strängen `"köttfärs krossade tomater grädde gul lök röd lök"` kan vi välja vad vi vill ha som delimeter. Delimeter avgör vad som kommer användas som skiljetecken för vad som ska bli egna element i den nya listan. Vi testar använda space som delimeter.

```python
>>> shopping_str = "köttfärs krossade tomater grädde gul lök röd lök"
>>> shopping_list = shopping_str.split(" ")
>>> print(shopping_str)
['köttfärs', 'krossade', 'tomater', 'grädde', 'gul', 'lök', 'röd', 'lök']
```

Python läser strängen från första bokstaven fram till första spacet, gör det till första elementet i listan, fortsätter läsa till nästa space och gör det till nästa element osv. Nu blev gul och lök uppdelat, vilket vi inte vill. Vi lägger till kommatecken i strängen igen och ändrar delimetern.

```python
>>> shopping_str = "köttfärs krossade, tomater, grädde, gul lök, röd lök"
>>> shopping_list = shopping_str.split(", ")
>>> print(shopping_str)
['köttfärs', 'krossade tomater', 'grädde', 'gul lök', 'röd lök']
```

Nu är delimetern `", "`, vi kan har flera tecken som delimeter. Kommatecken eller space var för sig tolkas inte som delimeter utan strängen som används som delimeter måste matcha i strängen som ska delas upp.

Det är vanligt att använda split() när man tar en input och vill göra den till en sträng för att lättare kunna jobba med specifika delar av input värdet.

[YOUTUBE src=8H9mkvdAoQQ caption="Andreas går igenom split()"]



### En längre uppgift {#uppgift_slice}

Vi avslutar artikeln med en till uppgift, den kommer vara lite svårare och längre än tidigare uppgifter men ni behöver använda det mesta av vad ni ska ha lärt er i kursen än så länge. Uppgiften är också uppdelad i tre delar. Du kan fortsätta på koden från den tidigare tärningsuppgiften.

Med koden från förra uppgiften skrivs tärningsslagen ut i ordningen som de slogs, dvs. troligen inte i storleksordning. Du ska lägga till kod så att användaren manuellt ska sortera listan med slagen. Efter alla slag är gjorda ska du skriva ut listan och sen låta användaren flytta runt på slagen i listan så de blir i storleksordning. Låt användare skriva in två index platser vars värde ska byta plats, tills listan är sorterad. Användaren får själv avgöra när listan är sorterad och ska då skriva in `q` för att avsluta. T.ex. om du har listan `[2,1,4,3]`.

```python
>>> Antal slag: 4
[2,1,4,3]

>>> Vilka index ska byta plats? 0,1
[1,2,4,3]

>>> Vilka index ska byta plats? 2,3
[1,2,3,4]

>>> Vilka index ska byta plats? q
```

[YOUTUBE src=H5pSDFlV1o0 caption="Andreas löser del 1"]

Det var del 1, nästa steg är att lägga till stöd för att flytta flera index samtidigt (med slicing). T.ex. om du har listan `[3,4,1,2,5]` vill vi flytta elementen `1,2` på en gång. För att detta ska fungera behöver du göra bytet i en specifik ordning. Uppdatera de bakre element först och sen det främre elementen. För att underlätta kan du ha som vana att alltid skriva input i samma ordning. Låga index först eller tvärt om. För pluspoäng, undersök varför varför det kan bli fel om du gör det i andra ordningen. Skriv varför i din redovisningstext.  
I denna delen av uppgiften behöver det inte vara möjligt att skicka in ett ensamt index. Utan för att indikera ett index använder vi fortfarande slicing notationen, t.ex. index 0 blir `[0-1]` med slicing. Så för tidigare exempel skriver vi in `0-1,2-4` för att sortera den korrekt. Flytta elementen med index 2 och 3 till index 0.

```python
>>> Antal slag: 5
[3,4,1,2,5]

>>> Vilka index ska byta plats? 2-4,0-1
[1,2,3,4,5]

>>> Vilka index ska byta plats? q
```

[YOUTUBE src=I5ZVvS_-hJs caption="Andreas löser del 2"]

I sista steget ska programmet klara av att hantera både enkla index och sekvens index. Med ovanstående exempel kan man istället skriva in `0,2-4`. Tänk på att följande kombination med inputs kan förekomma från användaren, `0,2-4`, `2-4,0`, `0,2`, `0-2,3-4`. Din kod behöver klara av alla fyra olika input typer från användaren.

```python
>>> Antal slag: 5
[3,4,1,2,5]

>>> Vilka index ska byta plats? 2-4,0
[1,2,3,4,5]

>>> Vilka index ska byta plats? q
```

[YOUTUBE src=a9wvTKoh5I8 caption="Andreas löser del 3"]



Tre i rad med en lista {#treirad}
------------------------------

Vill du ha lite mer kod som använder sig av listor så finns ett Tic Tac Toe spel i kursrepots exempel-katalog, närmare bestämt i [`example/list/tic-tac-toe.py`](https://github.com/mosbth/python/blob/master/example/list/tic-tac-toe.py). Det visar hur man kan använda en lista för att representera ett spel där man placerar ut brickor som liknar spelet tre i rad.

[ASCIINEMA src=37763]

Kika på exempelkoden och variabeln `board` som är en lista som representerar spelplanen.



###Överkurs {#overkurs}

Vill du se ett exempel på hur man kan jobba med flera dimensioner i listor, där en lista består av en lista? Då kan du kika på exempelprogrammet [example/matrix](https://github.com/mosbth/python/blob/master/example/matrix/do-matrix.py). Exempelprogrammet jobbar med en tvådimensionell lista som skrivs och läses från fil.

Men ta detta som ren överkurs och bara om du är bekväm med användandet av listor.



Avslutningsvis {#avslutning}
------------------------------

Detta var en introduktion till listor i Python. Har du frågor eller funderingar så tar vi det i [forumet för Python-frågor](forum/viewforum.php?f=44).
