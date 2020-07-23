---
author: mos
category: python
revision:
  "2020-05-07": (F, aar) La till förkunskapskrav och fixade copy kommandot.
  "2017-06-31": (E, efo) Rensade uppgiften så den inte är .cgi.
  "2016-03-17": (D, mos) hur man kopierar plane.py.
  "2015-08-25": (C, mos) Uppdaterade till dbwebb v2.
  "2014-08-25": (B, mos) Rättade fleaktig filnamn vid kopiering.
  "2014-08-21": (A, mos) Första utgåvan i samband med kursen python.
updated: "2017-06-31 14:22:45"
created: "2014-07-03 07:30:36"
...
Ditt första Python-skript
==================================

Skriv ett av dina första enklare program i Python genom att konvertera mellan olika typer av värden.

<!--more-->


Förkunskaper {#forkunskaper}
-----------------------

Du har jobbat igenom artikeln "[Installera en labbmiljö till Python](kunskap/installera-en-labbmiljo-till-python)" och "[Introduktion till variabler och datatyper](kunskap/introduktion-till-variabler-och-datatyper)".

<!-- Du har även skapat en me-sida enligt ["En me-sida i python som cgi-skript"](uppgift/en-me-sida-i-python-som-cgi-skript). -->



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



Krav {#krav}
-----------------------

1. Kopiera ditt program `greeting.py` och utgå från det. Spara ditt resultat i filen `me/kmom01/plane/plane.py`.

```bash
# Ställ dig i roten av kurskatalogen python
cp -i example/hello/hello.py me/kmom01/plane/plane.py
cd me/kmom01/plane
ls
```

2. Skriv programmet så att det fungerar enligt introduktionen ovan.

3. Ladda upp och publicera uppgiften genom att göra följande kommandon i kurskatalogen i terminalen.

```bash
# Ställ dig i roten av kurskatalogen python
dbwebb validate plane
dbwebb publish plane
```

Rätta eventuella fel som dyker upp och publicera igen. När det ser grönt ut så är du klar.

[INFO]
Dina uppladdade python filer syns inte på studentservern. Vill du dubbelkolla att dina filer finns på studentservern kan du använda kommandot: `dbwebb inspect kmom01`. Med kommandot `dbwebb inspect kmom01` ser du dina inlämningar på samma sätt som de som rättar.
[/INFO]



Extrauppgift {#extra}
-----------------------

Det finns ingen extra uppgift.



Tips från coachen {#tips}
-----------------------

Lycka till och hojta till i forumet om du behöver hjälp!
