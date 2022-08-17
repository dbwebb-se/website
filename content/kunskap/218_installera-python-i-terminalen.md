---
author:
    - mos
category:
    - python
    - labbmiljö
revision:
    "2022-08-17": (E, aar) Flyttade ner cygwin instruktionen, då bash är standard på windows.
    "2021-01-19": (D, aar) La till länk till kändda fel FAQ på github issues.
    "2017-05-30": (C, mos) Uppdaterad inför ht17.
    "2016-02-22": (B, mos) Modifierad med nya videor och flyttade IDLE och python på studservern till egna tips.
    "2015-08-25": (A, mos) Flyttad från äldre artikel.
...
Installera Python i terminalen
==================================

[FIGURE src=/image/snapht15/python-logo.png?w=c5 class="right"]

Denna artikel visar hur du kommer igång och installerar python i terminalen.

<!--more-->



Förutsättning {#pre}
-------------------------------

Artikeln förutsätter att du har en terminal med tillhörande pakethanterare installerad. 



Installera Python i terminalen {#terminal}
-------------------------------

Ett vanligt sätt att utveckla med Python är att ha det installerat och tillgängligt via terminalen. Det är det alternativet som vi kommer att jobba med under kursens gång.

Installera nu Python version 3 (python3) i din terminal.

Bash på Windows:

```bash
apt-get install python3
```

Mac OS:

```bash
brew install python3
```

Linux (debian):

```bash
apt-get install python3
```

Cygwin på Windows:

```bash
apt-cyg install python3
```

Verifiera att installationen gick bra genom att kontrollera vilken version av python3 som du har installerad.

```bash
python3 --version
```

Nu har du Python3 installerad på din dator. Om kommandot inte fungerade, kolla in [Kända fel och lösningar](https://github.com/dbwebb-se/python/issues/44).

Du kan pröva att exekvera ett Python-kommando som skriver ut strängen "Hello World".

```bash
$ python3 -c "print('Hello World')"
Hello World
```

*$-tecknet ovan representerar prompten och är inte en del av kommandot.*



Alternativt sätt att installera Python {#alt}
-------------------------------

Via [hemsidan för Python](https://www.python.org/downloads/) kan du ladda ned senaste versionen av Python och installera det. Det kan ge dig en senare version av Python än den version som du får installerad via pakethanteraren.

Kom ihåg att det är version 3 av Python som vi använder.



Python intepretator {#intepret}
-------------------------------

Python är ett interpreterande språk som kan exekveras rad för rad och vi kan pröva att skriva kodkonstruktioner i Pythons intepretator.

Du startar intepretatorn genom att skriva `python3` i terminal. Vill du avsluta skriver du sedan `exit()` eller `ctrl d`.

```python
$ python3
Python 3.6.1 (default, Mar 21 2017, 21:49:16)
[GCC 5.4.0] on cygwin
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

Du kan se vilken version av Python som används och du får fram en prompt där du nu kan du skriva Python-kod. Du kan pröva att skriva ut strängen "Hello World" via kodkonstruktionen `print("Hello World")`, så här.

```python
>>> print("Hello World")
Hello World
```

Du kan också skriva matematiska uttryck.

```python
>>> 40+2
42
```

Interpretatorn är bra för att testa och debugga kodkonstruktioner eller skriva enkla uttryck.

Allt du skriver i interpretatorn tolkas som Python-kod. Skriver du rätt körs koden annars får du ett felmeddelande.



Python-kod i filer och exekvera {#filer}
-------------------------------

Här följer ett par videor där du kan se Kenneth ta ett par första stapplande steg med Python och när han kör Python i interpretator och genom att spara koden i en fil och sedan exekvera den.
 
[YOUTUBE src=UttaDaPfnI0 width=630 caption="Kenneth kör Python i terminalen."]

[YOUTUBE src=EQAbz4alLzE width=630 caption="Kenneth kör Python via editor, fil och terminal."]



Resurser och manualer {#resurser}
-------------------------------

Via Pythons [officiella webbplats](https://www.python.org/) får vi också tillgång till [referensdokumentationen](https://docs.python.org/3/) till Python.

När man läser dokumentationen så behöver man vara uppmärksam på att man läser rätt version. Kodkonstruktioner och vad som stöds kan skilja mellan versioner.

Det är smart att bekanta sig med dokumentationen och försöka se vad som skiljer sig i innehåll mellan Tutorial (kom igång), Library Reference (inbyggda funktioner) och Language Reference (språkets uppbyggnad).

Pröva att använda sökfunktionen och söka efter funktionen `print`. Du bör hamna i manualen Library Reference och en beskrivning av [den inbyggda funktionen `print()`](https://docs.python.org/3/library/functions.html?highlight=print#print).

Detta är källan till din kunskap i Python. Bli vän med manualen och återvänd dit när du har funderingar.

Du kan googla och du kommer hitta bra tips på Stack Overflow, men dubbelkolla alltid att tipsen är på rätt version av Python. Det finns många tips på Python 2 och de kan skilja sig från hur man gör i Python 3.



Python 2 eller Python 3 {#py23}
-------------------------------

Python finns i många versioner men det finns en större skillnad mellan Python 2 och Python 3. I de flesta operativsystem är det fortfarande version 2 som används när man skriver `python`. Man behöver explicit skriva `python3` för att använda version 3.

Du kan läsa om [skillnaderna mellan Python 2 och Python 3](https://wiki.python.org/moin/Python2orPython3). I denna kursen använder vi Python 3. Mest märkbart är hur man skriver `print` och `input`.

Som Python-programmerare behöver man kunna använda både version 2 och 3, så det är bara att gilla att läget är på detta viset. Egentligen är det en vardag för en programmerare att bemästa skillnaderna i olika versioner av samma programmeringsspråk.



Avslutningsvis {#avslutning}
------------------------------

Du har nu grunderna som krävs för att sätta igång och programmera med Python.

Har du fler förslag eller tips så kan vi ta det i [forumet för Python-frågor](forum/viewforum.php?f=44). 

[Python finns installerat på studentservern](coachen/python-finns-pa-studentservern). Troligen behöver du inte använda det men det kan vara bra att veta om.
