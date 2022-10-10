---
author:
    - aar
category:
    - python
revision:
    "2020-08-24": (a, aar) Skapad inför python-v3.
...
Läsa och skriva filer i python
==================================

Vi ska i denna laboration träna på läsa och skriva data till filer i Python.

<!--more-->


Förkunskaper {#forkunskaper}
-----------------------

Du har jobbat igenom artikeln "[Att läsa filer som listor i Python](kunskap/att-lasa-filer-i-python-v2)" och "[Att läsa filer som strängar i Python](kunskap/att-lasa-filer-i-python-strings-v2)".



Hämta labben {#hamta}
-----------------------

Labben automatgenereras för dig. Gör så här för att checka ut din personliga labb.

Gå till din kurskatalog i terminalen.

```bash
# Flytta till kurskatalogen
dbwebb create lab6
```

Materialet skapas nu och läggs i en underkatalog till din katalog `me`.

| Fil                | Innehåll                                                              |
|--------------------|-----------------------------------------------------------------------|
| `instruction.html` | Beskrivning av labben och de uppgifter som skall göras, öppna och läs via en webbläsare.               |
| `answer.py`        | Här skall du skriva din kod för att lösa respektive uppgift i labben. |
| `Dbwebb.py`        | Används av `answer.py` för att testa din labb.                        |
| `.answer.json`     | Används av `Dbwebb.py` för att testa din labb.                        |
| `quotes.txt`       | Fil med data som du ska jobba med i labben.                        |
| `passwords.txt`    | Fil med data som du ska jobba med i labben.                        |

Öppna filen `instruction.html` i en webbläsare och läs igenom de uppgifter som labben omfattar.

Öppna filen `answer.py` i din texteditor och koda ihop svaren på uppgifterna.

Du kan testa dina lösningar genom att köra programmet `answer.py` som ett vanligt Python-program. Labben rättar sig själv.

```python
$ python3 answer.py
```

Glöm inte att validera ofta, då slipper du bekymmer i slutet.

Hamnar du i bekymmer så finns det ledtrådar som du kan få. Du aktiverar ledtrådarna för respektive uppgift i filen `answer.py`.

Du behöver göra ett visst antal uppgifter för att bli godkänd på labben. Sedan finns extra uppgifter du kan utföra om du så väljer. [Varför skall jag göra extrauppgiftena](kurser/faq/varfor-gora-extra-uppgifter)?



Krav {#krav}
-----------------------

1. Gör de uppgifter som finns i labben `instruction.html`.

2. Skriv dina lösningar, på rätt plats, i filen `answer.py`.

3. Testkör din labb genom att köra filen `answer.py`.

4. Ladda upp och validera labben genom att göra följande kommando i kurskatalogen i terminalen.

```bash
# Flytta till kurskatalogen
dbwebb validate lab6
```

Rätta eventuella fel som dyker upp och validera igen. När det ser grönt ut så är du klar.



Tips från coachen {#tips}
-----------------------

Debugga och felsök `pdb` och `breakpoints`.

Testa att köra labben i debuggern och stega igenom hur den validerar dina svar.

Validera ofta. Så slipper du en massa valideringsfel i slutet av övningen.

Lycka till och hojta till i forumet om du behöver hjälp!
