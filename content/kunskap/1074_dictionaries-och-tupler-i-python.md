---
author: efo
category: python
revision:
  "2022-09-13": (C, aar) La till del där data är uppdelat i olika dicts.
  "2018-06-27": (B, efo) Uppdaterad med sortering baserad på value.
  "2017-06-21": (A, efo) Första utgåvan inför kursen python H17.
...
Dictionaries och tupler i Python
==================================

[FIGURE src=image/python/dictionary.jpg?w=c5 class="right"]

Vi har tidigare bekantat oss med listor som ett sätt att spara data som har ett samband. Vi har sett att varje element i listan får ett numerisk index och att vi kan hämta ut data med hjälp av detta index. Vi har även sett att det går att stega sig igenom listan med till exempel en `for`-loop. Ibland vill man inte använda sig av ett numerisk index, men däremot en nyckel som pekar ut ett värde och i denna övning ska vi titta på hur vi kan göra detta med hjälp av dictionaries.



<!--more-->



Kodexempel från denna övningen finns i kursrepot för [python-kursen](https://github.com/dbwebb-se/python/tree/master/example/dictionary) och här på [dbwebb](repo/python/example/dictionary).



Nycklar och värden {#nyckel}
--------------------------------------

I övningen [Kom igång med datatypen lista i Python](kunskap/kom-igang-med-datatypen-lista-i-python) skapade vi listor för att representera en shoppinglista. Vi ska i denna övning flytta fokus från den som handlar till butikens lager och titta på hur vi med hjälp av en dictionary, även kallat `dict`, kan representera lagret. Dictionaries finns i många olika programmeringsspråk och kallas även associativa arrayer eller hashmaps.

Vår råa data ser ut på följande sätt:

```bash
20 st. köttfärs
80 st. grädde
33 st. krossade tomater
42 st. gul lök
```

Vi har alltså en vara men även ett antal av den specifika varan. Vi vill alltså koppla ihop varan (vår nyckel) med antalet av den varan (vårt värde). Låt oss titta på hur vi gör detta med en dictionary.

```python
warehouse = {
    "köttfärs" : 20,
    "grädde" : 80,
    "krossade tomater": 33,
    "gul lök" : 42
}

print(warehouse["krossade tomater"])

# skriver ut: 33
```

Vi definerar en dictionary med hjälp av `{}` sen anges nyckeln, ett kolon och sen värdet. Mellan varje nyckel-värde par har vi ett komma för att separera paren. Efter att vi har definerat `warehouse` hämtar vi ut lagersaldot för krossade tomater. Detta görs genom att använda `[]` med nyckeln och vi får då tillbaka värdet.

Varje måndag får vår lilla butik leverans av nya varor och då måste lagersaldot uppdateras och nya nyckel-värde par måste läggas i.

```python
warehouse["krossade tomater"] = 58

warehouse["röd lök"] = 7

print(warehouse)

# skriver ut: {'grädde': 80, 'köttfärs': 20, 'krossade tomater': 58, 'röd lök': 7, 'gul lök': 42}
```

Vi ser ovan att både uppdatering av befintliga nyckel-värde par och skapande av nya görs med samma kommando. Finns nyckeln uppdateras värdet annars läggs det till ett nytt nyckel-värde par. Precis som med listor har vi möjligheten att stega oss igenom en dictionary. Vi använder funktionen `items()` för att hämta ut nyckel och värde samtidigt.

```python
for key, value in warehouse.items():
    print(key, value)

# skriver ut:
# krossade tomater 58
# köttfärs 20
# gul lök 42
# röd lök 7
# grädde 80
```

Vi noterar att nyckel-värde paren skrivs ut i en konstig ordning, inte alls som vi skrev in paren ovan. Detta är för att datastrukturen dictionary är osorterat och vi kan aldrig räkna med ordningen i en dictionary.

[INFO]
Från och med python 3.6 är dictionaries ["insertion ordered"](https://docs.python.org/3.6/whatsnew/3.6.html#new-dict-implementation). Det betyder att nyckel-paren är sparade i ordningen de läggs in i dictionaryn. Som när man gör append() på en lista för att lägga till nya värden.

Om någon är intresserad av hur det är implementerat kan ni läsa en [överskådlig förklaring](https://stackoverflow.com/a/39980744).
[/INFO]



### Sortering av dictionary {#sort}

Om vi vill ha ut värdena sorterat använder vi oss av funktionen `keys()` som returnerar alla nycklar. Vi kan sedan sortera nycklerna med samma sorteringsfunktioner som vi använde för listor. I exemplet nedan använder vi nyckeln för att hämta ut värdet från `warehouse`.



#### Sortering på key {#sort-key}

```python
for key in sorted(warehouse.keys()):
    print(key, warehouse[key])

# skriver ut:
# grädde 80
# gul lök 42
# krossade tomater 58
# köttfärs 20
# röd lök 7
```

`warehouse.keys()` funktionen returnerar `['köttfärs', 'grädde', 'krossade tomater', 'gul lök']`. Som vi sorterar med `sorted()` och loopar igenom, då kan vi använda nycklarna i loopen för att plocka ut värdena. Vilket ger oss dictionariens innehåll sorterat på nycklarnas värde i bokstavsordning.

Om vi istället vill sortera på antal varor, value, för att se vilka varor vi har flest av kräver det lite mer. Vi kan använda funktionen [itemgetter](https://docs.python.org/3/library/operator.html#operator.itemgetter) från den inbyggda modulen [operator](https://docs.python.org/3/library/operator.html#module-operator).



#### Sortering på value {#sort-value}

Vi behöver göra om vår dictionary till en sekvens där värdet också ingår, och inte bara nycklarna. Det kan vi göra med `.items()` funktionen.

```python
print(warehouse.items())
# skriver ut: dict_items([('köttfärs', 20), ('grädde', 80), ('krossade tomater', 33), ('gul lök', 42)])
print(list(warehouse.items())[0])
# skriver ut: ('köttfärs', 20))
print(list(warehouse.items())[0][0])
# skriver ut: 'köttfärs'
```

Vi får tillbaka en speciell lista, `dict_items` för dictionary items, den är itererbar (funkar i for-loopar) men inte indexerbar. Därför, om man vill hämta ut ett element med index måste man först göra om den till en lista. Värdena i listan är Tupler, också en speciell typ av lista som ni ska läsa om längre ner, där första elementet är nyckeln och det andra elementet är värdet kopplat till den nyckeln. För tillfället kan vi se Tupler som en lista. Så `warehouse.items()` returnerar en nästlad lista där varje element är en lista som innehåller ett nyckel och värde par.

Nu vill vi sortera denna listan på värdena, vi använder oss fortfarande av `sorted()` men vi behöver ett sätt att få sorted att sortera på det andra elementet i varje tuple istället för det första. Här kommer `itemgetter` in i bilden. Med itemgetter kan vi säga till sorted vilket index den ska använda på våra tupler för att få ut ett värde att sortera på. För en mer detaljerad förklaring, kolla på videon nedanför.

[YOUTUBE src="Hcl5FSnu360" caption="Hur man sorterar dictionaries på värdet"]

I koden nedanför säger vi till `sorted()` att använda 1 som index på tuplerna i `warehouse.items()` och sortera tuplerna efter det värdet. Sorterat från högt till lågt.

```python
from operator import itemgetter

warehouse_as_list = warehouse.items()
warehouse_sorted_on_values = sorted(warehouse_as_list, key=itemgetter(1), reverse=True)
for key, value in warehouse_sorted_on_values:
    print(key, value)

# skriver ut:
# grädde 80
# krossade tomater 58
# gul lök 42
# köttfärs 20
# röd lök 7
```

Hade vi angett `key=itemgetter(0)` hade vi sorterat på nyckeln istället. Vi använder `reverse=True` för att sortera i fallande ordning. `reverse=False` sorterar i stigande ordning.


##### Plocka ut bara värden {#values}

Gör en inflikning för att påpeka att det finns också en funktion som heter `.values()`. Den returnerar alla värden i en dictionary som en lista där varje element är ett värde från dictionarin.

```python
print(warehouse.values())
# skriver ut:
# dict_values([20, 80, 33, 42])
```



### Dictionaries i dictionaries {#dic-in-dict}

På ett riktigt lager räcker det inte bara med antal varor som är kvar, vi vill även ha en möjlighet att ange priset. Med dictionaries, precis som med listor, har vi möjligheten att skapa dictionaries i dictionaries, så kallade nästlade dictionaries. Detta gör att vi kan ha både antalet och ett pris för varje vara. Vi kan nu skriva ut en sorterad lista med pris på följande sätt.

```python
warehouse_deluxe = {
    "köttfärs" : { "stock" : 20, "price" : 50 },
    "grädde" : { "stock" : 80, "price" : 20 },
    "krossade tomater": { "stock" : 33, "price" : 10 },
    "gul lök" : { "stock" : 42, "price" : 5 }
}

for key in sorted(warehouse_deluxe.keys()):
    print(key, warehouse_deluxe[key]["price"])

# skriver ut:
# grädde 20
# gul lök 5
# krossade tomater 10
# köttfärs 50
```

För de som är intresserade finns ett litet exempel i Pythons [dokumentation för dictionaries](https://docs.python.org/3/tutorial/datastructures.html#dictionaries).



Tupler {#tuples}
--------------------------------------
Ibland vill man ha en sekvens av data som inte ska eller kan ändras. I Python använder man tupler (tuples på engelska) för att åstadkomma detta. Tupler är en sekvens av data som kan vara av olika typer och vi skapar en tupel med hjälp av `()`. Tupler kan inte ändras men vi kan hämta ut data med hjälp av index för datat med samma notation (`[index]`) som för en lista. I vårt lager vill vi att varje vara ska ha en streckkod och en lager plats, dessa ska aldrig ändras så vi väljer att använda en tupel för denna data. I exemplet nedan har vi definierat en nyckel `ids` i varje element i `warehouse_deluxe` och som värde för nyckeln har vi en tupel. Vi lägger igen till "röd lök" i vårt lager och vi avslutar exemplet med att skriva ut en formaterad sträng med alla varor i lagret.

```python
warehouse_deluxe = {
    "köttfärs" : { "stock" : 20, "price" : 50, "ids" : (1234, "K14") },
    "grädde" : { "stock" : 80, "price" : 20, "ids" : (3141, "L12") },
    "krossade tomater": { "stock" : 33, "price" : 10, "ids" : (4224, "E13") },
    "gul lök" : { "stock" : 42, "price" : 5, "ids" : (2742, "D02") }
}

warehouse_deluxe["röd lök"] = {}
warehouse_deluxe["röd lök"]["stock"] = 7
warehouse_deluxe["röd lök"]["price"] = 9
warehouse_deluxe["röd lök"]["ids"] = (6314, "D04")

for key in sorted(warehouse_deluxe.keys()):
    print("{product} costs {price} and we have {stock} in stock. It has barcode {barcode} and location {location_id}.".format(
        product=key,
        price=warehouse_deluxe[key]["price"],
        stock=warehouse_deluxe[key]["stock"],
        barcode=warehouse_deluxe[key]["ids"][0],
        location_id=warehouse_deluxe[key]["ids"][1]
    ))

# skriver ut:
# grädde costs 20 and we have 80 in stock. It has barcode 3141 and location L12.
# gul lök costs 5 and we have 42 in stock. It has barcode 2742 and location D02.
# krossade tomater costs 10 and we have 33 in stock. It has barcode 4224 and location E13.
# köttfärs costs 50 and we have 20 in stock. It has barcode 1234 and location K14.
# röd lök costs 9 and we have 7 in stock. It has barcode 6314 and location D04.
```

För de som är intresserade finns ett litet exempel i Pythons [dokumentation för tupler](https://docs.python.org/3/tutorial/datastructures.html#tuples-and-sequences).




### Söka i nästlade datastrukturer {#search}

Vi kollar också på hur vi kan jobba med nästlade datastrukturer för att hitta ett element med ett värde. Vi vill kunna söka på varors `location` för att få fram vilken vara det är kopplat till. Då kan vi passa på att utnyttja hur Python kan använda tupler vi tilldelning.

Vi har redan sett att hur vi kan tilldela värden till två variabler i en for-loop med enumerate.

```python
for ind, value in enumerate(["ko", "apa","häst"]):
    print(ind, value)

# skriver ut:
# 0 ko
# 1 apa
# 2 häst
```

enumerate() returnerar en lista där varje element är en tuple och varje tuple innehåller index värdet och värdet från listan. I loopen packas varje tuple upp så att första elementet tilldelas till första variabeln, `ind`, och det andra elementet tilldelas till den andra variabeln, `value`.

Det funkar likadan om vi förser loopen men en lista som innehåller tupler. Om ni har varit uppmärksamma än så länge så har ni märkt att vi redan har gjort det.

```python
>>> print(warehouse_deluxe.items())

dict_items([
    ('köttfärs', {'stock': 20, 'price': 50, 'ids': (1234, 'K14')}),
    ('grädde', {'stock': 80, 'price': 20, 'ids': (3141, 'L12')}),
    ('krossade tomater', {'stock': 33, 'price': 10, 'ids': (4224, 'E13')}),
    ('gul lök', {'stock': 42, 'price': 5, 'ids': (2742, 'D02')})
])
```

`.items()` ger oss en lista med tupler som vi kan använda i for-loopen för att lägga varan i en variabeln och datan om varan i en annan.

```python
for item, data in warehouse_deluxe.items():
    print(item, data)
# skriver ut
köttfärs {'stock': 20, 'price': 50, 'ids': (1234, 'K14')}
grädde {'stock': 80, 'price': 20, 'ids': (3141, 'L12')}
krossade tomater {'stock': 33, 'price': 10, 'ids': (4224, 'E13')}
gul lök {'stock': 42, 'price': 5, 'ids': (2742, 'D02')}
```

Nu kan vi i loopen kolla om ett visst stock id finns och då skriva ut varans namn.

```python
search_for = "E13"
for item, data in warehouse_deluxe.items():
    if data["ids"][1] == search_for:
        print(item)

# skriver ut
# krossade tomater
```



### Jobba med data uppdelat i två olika strukturer {#split-data}

Ibland finns vår data utspridd på olika ställen, det kan vara t.ex. på olika servrar eller i olika filer. Då måste vi kunna samla ihop datan och presentera den på ett samman hängande sätt.

Nedanför har jag delat upp datan så det ligger i två olika dictionaries. Varornas hyllplats finns nu i en separat dictionary, där `id` i `warehouse_deluxe` används som nyckel i den nya dictionary:n.

```python
warehouse_deluxe = {
    "köttfärs": { "stock": 20, "price": 50, "id": 1234 },
    "grädde": { "stock": 80, "price": 20, "id": 3141 },
    "krossade tomater": { "stock": 33, "price": 10, "id": 4224 },
    "gul lök": { "stock": 42, "price": 5, "id": 2742 },
}

stock_locations = {
    1234: "K14",
    3141:"L12",
    4224:"E13",
    2742:"D02",
}
```

Nu vill vi göra en fin utskrift där all data för varje produkt finns med. Vi behöver hämta ut `id` från `warehouse_deluxe` och använda som nyckel i `stock_locations` för att kunna slå ihop all data för en produkt.

```python
def merge_data(warehouse, locations):
    """
    merge data from two dicts into a list with tuples
    """
    all_data = []
    for name, data in warehouse.items():
        all_data.append(
            (name, data, locations[data["id"]])
        )
    return all_data

def print_all(products_list):
    """
    Print all the data
    """
    for name, data, location in products_list:
        print(
            f"{name} costs {data['price']} and we have {data['stock']} in stock. It has barcode {data['id']} and location {location}."
        )

merged_data = merge_data(warehouse_deluxe, stock_locations)
print_all(merged_data)
```

I `merge_data` lägger jag datan i en ny datastruktur så att originalet är oförändrat. Så att den funktionen inte påverkar någon annan funktionalitet jag kan ha i mitt program. Jag strukturerar datan i en tuple i listan, för då går det lätt att använda den i en for-loop.



Avslutningsvis {#avslutning}
--------------------------------------

Vi har i denna övning skapat ett oerhört simpelt lager där vi kan hålla koll på vad som finns i vår lilla butik med hjälp av en dictionary. Till slut använde vi även tupler för data som vi inte vill ändra. Dictionaries och liknande datastrukturer i andra programmeringsspråk är oerhört användbara för att spara data där vi har en nyckel vi vill koppla till et värde.
