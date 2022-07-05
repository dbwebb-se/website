---
author: aar
category: python
revision:
  "2021-03-22": (A, aar) Ny version för att introducerar automaträttning.
...
Ditt första Python-skript
==================================

Skriv ett av dina första enklare program i Python genom att konvertera mellan olika typer av värden.

<!--more-->


Förkunskaper {#forkunskaper}
-----------------------

Du har jobbat igenom artikeln "[Introduktion till variabler och datatyper](kunskap/introduktion-till-variabler-och-datatyper)".

Du har även läst om [dbwebb test](dbwebb-cli/python) och förstår hur du kan rätta uppgiften när du är klar med den.



Introduktion {#intro}
-----------------------

Du har säkert suttit på ett flygplan och sett på skärmen hur högt planet flyger, vilken hastighet det har, temperaturen utanför och hur långt det är till destinationen och vad klockan är för tillfället.

Det är siffror som omväxlande visas i meter, km/h och Celsius och sedan växlar det till feet, mph och Farenheit.

Du skall nu göra ett program som ber användaren mata in följande värden:

* Höjd över havet (meter)
* Hastighet (km/h)
* Temperatur utanför flygplanet (Celsius)

Sedan skall programmet skriva ut motsvarande värden enligt:

* Höjd över havet (feet)
* Hastighet (mph)
* Temperatur utanför flygplanet (Farenheit)

1 meter är 3.28084 [feet](http://en.wikipedia.org/wiki/Foot_(unit)).

1 kilometer är 0.62137 [miles](http://en.wikipedia.org/wiki/Miles).

För att konvertera från Celcius till [Farenheit](http://en.wikipedia.org/wiki/Farenheit) används följande formel:

```text
[°F] = [°C] * 9 / 5 + 32
```

Exempel på hur det kan se ut när man kör progrmmet:

[ASCIINEMA src=416115]

Det är viktigt att ditt program följer instruktionerna i kraven annars kommer inte testerna fungera och då rättas inte er inlämning.



Krav {#krav}
-----------------------

1. Om du vill kan du kopiera exempel programmet `hello.py` och utgå från det. Spara ditt resultat i filen `me/kmom01/plane/plane.py`.

```bash
# Ställ dig i roten av kurskatalogen python
cp -i example/hello/hello.py me/kmom01/plane/plane.py
cd me/kmom01/plane
ls
```

2. `plane.py` skall innehålla kod för att omvandla tre värden, som beskrivs i texten ovanför, höjd, hastighet och temperatur. 

3. Gör ett `input()` anrop för att omvandla höjd från meter till feet.

    Exempel input och output värde:

    ```python

    input: "59"       output: "193.57"
    ```

    - Tags: `height`

4. Gör ett `input()` anrop för att omvandla hastighet, från km/h till mph.

    Exempel input och output värde:

    ```python

    input: "23.23"       output: "14.43"
    ```

    - Tags: `speed`

5. Gör ett `input()` anrop för att omvandla temperatur, från °C till °F.

    Exempel input och output värde:

    ```python

    input: "135.205"       output: "275.37"
    ```

    - Tags: `temp`

6. Skriv ut alla omvandlade värden avrundade till två decimaler.

7. [Kör testerna](dbwebb-cli/python) och validera koden för att kolla att du är godkänd.

8. Ladda upp och publicera uppgiften genom att göra följande kommandon i kurskatalogen i terminalen.

```bash
# Ställ dig i roten av kurskatalogen python
dbwebb test plane
dbwebb publish plane
```

Rätta eventuella fel som dyker upp och publicera igen. När det ser grönt ut så är du klar.



Extrauppgift {#extra}
-----------------------

Det finns ingen extra uppgift.



Tips från coachen {#tips}
-----------------------

Lycka till och hojta till i chatten om du behöver hjälp!
