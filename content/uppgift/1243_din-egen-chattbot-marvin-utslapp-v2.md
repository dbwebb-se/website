---
author: aar
category: python
revision:
  "2021-05-11": (B, aar) Uppdaterade texten med de nya uppgifterna.
  "2021-03-30": (A, moc) Ny version för att introducerar automaträttning.
...
Din egen chatbot - Marvin - Utsläpp
==================================

I denna uppgiften ska vi bygga ut Marvin så att vi kan analysera hur mycket koldioxidutsläpp länder släpper ut.

<!--more-->

Vi har tillgång till utsläpp data för världens länder för åren 1990, 2005 och 2017. Det finns även data för ländernas antal invånare och yta.



Förkunskaper {#forkunskaper}
-----------------------

Du kan grunderna i funktioner, listor och du har gjort övningen [Dictionaries och tupler i Python](kunskap/dictionaries-och-tupler-i-python).



Introduktion {#intro}
-----------------------

I mappen "[example/emission_data](https://github.com/dbwebb-se/python/tree/master/example/emission_data)" finns modulen `emission_data.py` och innehåller all data om utsläpp och länderna. Modulen innehåller fyra variabler:

`emission_1990`: En dictionary med mängden koldioxid (i megaton, multiplicera med 1 000 000 för att få i ton) som varje land släppte ut år 1990.
  
`emission_2005`: En dictionary med mängden koldioxid (i megaton, multiplicera med 1 000 000 för att få i ton) som varje land släppte ut år 2005.
  
`emission_2017`: En dictionary med mängden koldioxid (i megaton, multiplicera med 1 000 000 för att få i ton) som varje land släppte ut år 2017.

`country_data`: En dictionary med antalet invånare varje land har, landets storlek (i KM2) och ett heltals id som används för att identifiera länderna i ovanstående dictionaries.

Exempel på `emission_xxxx` dictionary:

```python
emission_1990 = {
    0: 2.546,
    1: 6.583,
}
```
Nyckeln är heltals id:et som används för att identifiera landet i `country_data`. Landet med id 0 släppte ut 2.546 megaton (2,546,000 ton) koldioxid 1990.

Exempel på `country_data`:

```python
country_data = {
    'Afghanistan': 
    {
        'area': 652864.0,
        'id': 0,
        'population': (12412311, 25654274, 36296111)
    },
    'Albania': 
    {
        'area': 28748.0,
         'id': 1,
         'population': (3286070, 3086810, 2884169)
     },
}
```

Här kan vi se att landet med id 0 är Afghanistan. Vi kan också se att nycklarna är ländernas namn och att värdet är en till dictionary, dictionary i dictionaries. Varje land har en egen dictionary med nycklarna `area`, `id` och `population`. Area är landets storlek, id är kopplingen till utsläpp datan och population är en tuple där första elementet är landets antal invånare för år 1990, andra elementet år 2005 och sista elementet år 2017.

För att få ut Albaniens folkmängd 2005 skriver vi `country_data["Albania"]["population"][1]`. När ni ska räkna ut utsläpp/capita/area behöver ni multiplicera utsläppen med 1,000,000 för att uträkningarna ska bli korrekt.

**Filen** `emission_data_small.py` som ligger i samma mapp innehåller en delmängd av datan från `emission_data.py`. Ni kan använda den i början för att bekanta er med datan och strukturen. Ni **måste** använda `emission_data.py` när ni rättar er kod och lämnar in.

**Notera** att alla länder inte har area, population eller utsläpps data.

[ASCIINEMA src=416110]



Krav {#krav}
-----------------------

1. Kopiera din Marvin från föregående kursmoment och utgå från den koden. Kopiera sen utsläpps modulen.

```bash
cd me
cp -ri kmom04/marvin3/* kmom05/marvin4/
cp ../example/emission_data/*.py kmom05/marvin4/

cd kmom05/marvin4
```

2. Skapa en ny modul `emission_functions.py`, i den ska du skriva funktionerna som har med utsläppen att göra. I kraven när det står att du ska skapa en specifik funktion ska du skapa den i filen `emission_functions.py`.

    - Tags: `struct`



3. Menyval **13**: Användaren ska kunna söka efter vilka länder som finns i `country_data`.  Sökningen ska vara case insensitive och det ska gå att söka på hela namn och delar av namn. Ett input anrop ska tas emot som innehåller söksträngen. Alla länder som matchar sökningen ska skrivas ut. Gör utskriften i `main.py`.

    Skapa funktionen `search_country(search_word)`. Den ska ta emot en sträng som argument, vilket är sökordet för att hitta länder. I funktionen hitta alla länder som matchar sökordet och returnera dem i en lista.

    ```python

    arguments: "sweden"       return: ["Sweden"]
    arguments: "we"           return: ["Sweden", "Western Sahara", "Zimbabwe"]
    ```

    Om sökordet inte matchar något land ska du lyfta ett `ValueError` i funktionen och sen fånga det ute i meny-koden som har anropat funktionen och då skriva ut `"Country does not exist!"`.

    Exempel för menyvalet:

    ```python

    input: "sweden"       output: "Following countries were found: Sweden"
    input: "we"           output: "Following countries were found: Sweden, Western Sahara, Zimbabwe"
    input "atlantis"      output: "Country does not exist!"
    ```

    - Tags: `13`, `search_menu` (testar meny valet), `search_func` (testar funktionen)




4. Menyval **14**: Menyvalet ska skriva ut hur ett lands utsläpp har förändrats i procent mellan två år. Menyvalet ska ta emot ett input anrop där input kommer vara kommaseparerad , `country,year1,year2`. Du behöver plocka ut argumenten från den strängen. Resultat utskriften ska vara formaterad som `"Country_name:change"`. Du ska skapa två funktioner `get_country_year_data_megaton(country, year)` och `get_country_change_for_years(country, year1, year2)`. Om användaren skriver ett felaktigt år ska du skriva ut `"Wrong year!"`. För utskrifterna i `main.py`.

    ```python

    input: "Sweden,1990,2017"       output: "Sweden:-12.46%"
    input: "Sweden,1000,2017"       output: "Wrong year!"
    ```

    I `get_country_year_data_megaton(country, year)` funktionen ska du returnera hur mycket utsläpp ett land gjorde ett specifikt år, i måttet ton (du behöver multiplicera datan med `1000000`.). Funktionen tar emot två argument, första argumentet ska vara en sträng med landets namn och det andra argumentet ska vara en sträng med året.  
    Om årtalet som skickas in inte finns ska funktionen lyfta ett `ValueError`.

    ```python

    arguments: "Sweden", "1990"      return: 58117000.0
    ```

    `get_country_change_for_years(country, year1, year2)` Funktionen ska räkna ut och returnera skillnaden för ett lands utsläpp mellan två år. Första argumentet ska vara en sträng med landets namn, andra argumentet en sträng med ett år som en sträng och tredje argumentet en sträng med ett år som en sträng. Räkna ut med hur många procent utsläppen har ändrats mellan `year1` och `year2` och avrunda till två decimaler. Använd dig av funktionen `get_country_year_data_megaton` för att hämta ut utsläpps datan för de båda åren.

    ```python

    arguments: "Sweden", "1990", "2017"       return: -12.46 # Utsläppen har minskat med -12.46% från 1990 till 2017
    ```

    - Tags: `14`, `change_menu`, `change_func`



5. Menyval **15**: Menyvalet ska samla all data för ett land och skriva ut den. Som input ska menyvalet be om ett land. Du ska skapa två funktioner `get_country_data(country_name)` och `print_country_data(data)`. Använd `print_country_data` för att skriva ut datan du får från `get_country_data`. **Obs** Anropa inte `print_country_data` i `get_country_data`. Utan returnera data till main.py och anropa `print_country_data` där.

    Funktionen `get_country_data(country_name)` ska ta emot en sträng som argument vilket är namnet på landet. I funktionen ska du bygga upp en dictionary med data och returnera. Om landet saknar populations data, sätt värdet `None` för den nyckeln. Använd de tidigare funktionerna `get_country_change_for_years` och `get_country_year_data_megaton` för att hämta ut utsläpps data. Nedanför kan ni se strukturen på vad som ska returneras.

    ```python

    {
        'name': '<name>',
        '1990': {'emission': <utsläpp i ton>, 'population': <antal eller None>},
        '2005': {'emission': <utsläpp i ton>, 'population': <antal eller None>},
        '2017': {'emission': <utsläpp i ton>, 'population': <antal eller None>},
        'emission_change': (<skillnad mellan 1990-2005>, <skillnad mellan 2005-2017>)
    }
    ```

    Exempel:

    ```python

    arguments: "Sweden"     return:{
                                'name': 'Sweden',
                                '1990': {'emission': 58117000.0, 'population': 8567375},
                                '2005': {'emission': 55877000.0, 'population': 9038627},
                                '2017': {'emission': 50874000.0, 'population': 9904895},
                                'emission_change': (-3.85, -8.95)
                            }

    arguments: "Greenland"  return: {
                                'name': 'Greenland',
                                '1990': {'emission': 3000.0, 'population': None},
                                '2005': {'emission': 631000.0, 'population':None},
                                '2017': {'emission': 518000.0, 'population': None},
                                'emission_change': (20933.33, -17.91)
                            }
    ```

    Funktionen `print_country_data(data)` ska ta emot en dictionary med data om ett land och skriva ut den. Formatera utskriften av datan enligt:

    ```bash

    "<landets namn>"
    "<år>: <utsläpp för det året i ton>"
    "<år>: <antal invårare för det året>"
    "<år>-<år>: <förändring av utsläpp i procent>"
    ```

    Om invånare data saknas (är `None`) skriv ut `"Missing population data!"` istället för `<år>: <antal invånare>`.

    Övrig formatering runt om kvittar, men de specifika värdena ska använda formateringen ovanför.

    ```python

    arguments: "sweden"       output: 
    Sweden
    Emission          - 1990: 58117000.0    2005: 55877000.0        2017: 50874000.0
    Emission change   -   1990-2005: -3.85%        2005-2017: -8.95%
    Population        - 1990: 8567375       2005: 9038627   2017: 9904895
    ```

    - Tags: `15`, `data_menu`, `data_func`



6. Testa, validera och publicera din kod enligt följande.

```bash
# Flytta till kurskatalogen
dbwebb test marvin4
dbwebb validate marvin4
dbwebb publish marvin4
```

Rätta eventuella fel som dyker upp och publicera igen. När det ser grönt ut så är du klar.



Extrauppgift {#extra}
-----------------------

I följande menyval, om ett land saknar någon av datan som behövs för utskriften, hoppa över det landet. Låtsas som att det inte finns.

1. Menyval **e1**: Skriv ut hur mycket CO2 varje land släpper ut för ett av åren i storleks ordning, mest utsläpp först, avrunda till 2 decimaler. Be Användaren om input där användaren skriver in vilket år som ska användas, t.ex. `"1990"` . Det ska även gå att skriva in hur många länder som ska visas, t.ex. `"1990 10"`, då ska bara de 10 högsta länderna skrivas ut. Utskriften ska ha formatet `<land>: <utsläpp>` med ett land per rad.

    ```python

    input: "1990 2"     output: "United States of America: 5085897000.0
                                European Union: 4409339000.0"
    ```

    - Tags: `e1`



2. Menyval **e2**: Användaren ska skriva in ett år och få utskriften varje lands utsläpp per capita, sortera i storleksordning, avrunda till 2 decimaler. Det ska även gå att skriva in hur många länder som ska skriva ut. Om användaren enbart skriver in ett år ska alla länder skrivas ut.

    ```python

    input: "2017 4"     output: "Curaçao: 46.42
                                Qatar: 35.89
                                Trinidad and Tobago: 27.27
                                Kuwait: 23.95"
    ```

    - Tags: `e2`



4. Menyval **e3**: Användaren ska skriva in ett år och få utskriften varje lands utsläpp per landyta, sortera i storleksordning, avrunda till 2 decimaler. Det ska även gå att skriva in hur många länder som ska skriva ut. Om användaren enbart skriver in ett år ska alla länder skrivas ut.



    ```python

    input: "1990 2"     output: "Singapore: 43829.52
                                Bahrain: 15664.45"
    ```

    - Tags: `e3`

<!-- 5. För menyval 13, 14 och 15, ska det även gå att skriva in en range på hur många länder som ska skrivas ut. T.ex. med input `2005 21-30`, då ska datan för 2005 användas och skriva ut länderna på plats 21 till och med 30 i det sorterade resultatet.

6. För menyval 13, 14 och 15, ska det även gå att skriva in ett land för att endast få ut det landets värde. -->



Källor {#sources}
------------------------

CO2 utsläpp: [Fossil CO2 emissions by country/region](https://en.wikipedia.org/wiki/List_of_countries_by_carbon_dioxide_emissions#Fossil_CO2_emissions_by_country/region)  
Länders storlek: [List of countries by population in 2015](https://en.wikipedia.org/wiki/List_of_countries_by_population_in_2015)  
Länders folkmängd:  
[Population size per country 1990](https://www.populationpyramid.net/population-size-per-country/1990/)  
[Population size per country 2005](https://www.populationpyramid.net/population-size-per-country/2005/)  
[Population size per country 2017](https://www.populationpyramid.net/population-size-per-country/2017/)  
[Population, total - European Union](https://data.worldbank.org/indicator/SP.POP.TOTL?locations=EU)



Tips från coachen {#tips}
-----------------------

Försök identifiera data som används till flera menyval och skapa en funktion som returnerar den datan i en ny datastruktur. T.ex. en ny lista eller dictionary som bara innehåller den datan som behövs för menyvalen.

Dela upp koden för ett menyval i flera funktioner. Då är det lättare att hitta funktioner som går att använda för flera menyval.

För att se att dina uträkningar stämmer någorlunda kan du jämföra dina uträkningar för 2017 med de som finns i tabellen "[Fossil CO
2 emissions by country/region](https://en.wikipedia.org/wiki/List_of_countries_by_carbon_dioxide_emissions#Fossil_CO2_emissions_by_country/region)". Det kommer inte stämma 100% den använder olika källor för landytor och befolkningsmängd men det ska vara snarlika resultat.


Felsöka med debuggern/Thonny och komplettera med utskrifter av `print()`.

Validera ofta. Så slipper du en massa valideringsfel i slutet av övningen.

Lycka till och hojta till i forumet om du behöver hjälp!
