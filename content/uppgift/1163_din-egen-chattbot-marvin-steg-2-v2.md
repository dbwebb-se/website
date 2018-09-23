---
author: mos
category: python
revision:
  "2018-06-13": (H, aar) Bytt ut vissa menyval och definierat vilka siffror valen är.
  "2017-06-13": (G, efo) Uppdaterade marvin menyval, la till funktioner och modul.
  "2015-08-25": (F, mos) Uppgraderade till dbwebb v2.
  "2015-01-29": (E, mos) Sökväg för cd-kommandot.
  "2014-10-24": (D, mos/sylvanas) Mindre omformulering krav 2 och krav 3.
  "2014-08-27": (C, mos) Genomgången och testad.
  "2014-08-03": (B, sylvanas) Uppdaterad med fler övningar.
  "2014-07-03": (A, mos) Första utgåvan i samband med kursen python.
updated: "2015-08-25 12:50:03"
created: "2014-07-03 07:52:26"
...
Din egen chattbot - Marvin - steg 2
==================================

Programmering och problemlösning i Python. Strukturera koden i en egen fil och lär Marvin ett spel samt att förstå flytande text.

<!--more-->


Förkunskaper {#forkunskaper}
-----------------------

Du kan grunderna i Python och stränghantering och du har byggt [första delen](uppgift/din-egen-chattbot-marvin-steg-1-v2) av Marvin.



<!-- Introduktion {#intro}
-----------------------

Spelet "Guess the number" är ett enkelt gissningsspel där någon tänker på ett tal mellan 1-100. Man har 6 gissningar på sig att gissa rätt tal. Vid varje gissning så får man svar om talet är "för lågt", "för högt" eller "rätt gissat".

Kapitel 4 i boken [Invent your games with Python](kunskap/boken-invent-your-own-computer-games-with-python) beskriver hur spelet "Guess the number" kan implementeras. -->



Krav {#krav}
-----------------------

1. Kopiera din Marvin från föregående kursmoment och utgå från den koden.

```bash
# Flytta till kurskatalogen
cd me
cp -ri kmom02/marvin1/marvin.py kmom03/marvin2/
cd kmom03/marvin2
```

2. Skriv om koden så att menyn och varje menyval finns i en egen funktion.

<!-- 3. Döp om nuvarande `marvin.py` till `main.py`. -->

<!-- 4. Skapa en ny fil `marvin.py` och lägg alla menyvalsfunktioner i denna nya Pythonmodul. Importera `marvin.py` i `main.py`. -->

<!-- 5. Menyval: Som löser spelet "Guess the number" där Marvin tänker på ett tal mellan 1-100 och spelaren ska gissa vilket det är. För varje gissning ska Marvin berätta om gissningen var högre eller lägre än det han tänkte på. Spelaren ska ha 6 gissningar på sig. -->

3. **Menyval 8**: Kasta om bokstäver. Marvin ska be dig skriva in ett ord som sedan slumpmässigt kastas om. Det omkastade ordet ska sedan skrivas ut.

4. **Menyval 9**: Anagram. Skapa ett val där marvin ber om två strängar och kollar om de är anagram. Ett anagram är när man kan få fram samma sträng genom att kasta om bokstäverna i den andra. Tips, [sorted()](https://docs.python.org/3/howto/sorting.html) och [lower()](https://docs.python.org/3/library/stdtypes.html#str.lower). Exempel:
```python
input: "Anagram", "Magarna"     output: "Match"
input: "Paris", "sirap"         output: "Match"
input: "Nope", "note"           output: "No Match"
```

5. **Menyval 10**: Akronym skapare. Marvin ska be om en sträng och skapa en akronym för den genom att plocka ut alla stora bokstäver och sätta ihop till en ny sträng. Tips, [isupper()](https://docs.python.org/3/library/stdtypes.html#str.isupper). Exempel:
```python
input: "BRöderna Ivarsson Osby"             output: "BRIO"
input: "Ingvar Kamprad Elmtaryd Agunnaryd"  output: "IKEA"
```

6. **Menyval 11**: Sträng maskering. Skapa ett nytt val där Marvin ber om en sträng och ersätter alla utom de fyra sista karaktärerna med "#". Bryt ut funktionaliteten som multiplicerar en sträng från menyval 3 till en egen funktion. Den nya funktionen ska användas av både detta menyvalet och menyval 3. Använd den för att skapa strängen med "#"s och lägg sen på de fyra sista karaktärerna. Exempel:
```python
input: "4556364607935616"     output: "############5616"
input: "64607935616"          output: "#######5616"
```

7. Validera och publicera Marvin genom att göra följande kommandon i kurskatalogen i terminalen.

```bash
# Flytta till kurskatalogen
dbwebb validate marvin2
dbwebb publish marvin2
```

Rätta eventuella fel som dyker upp och publicera igen. När det ser grönt ut så är du klar.



Extrauppgift {#extra}
-----------------------
<!-- * Kasta om bokstäver: Ha en fil med ett ord per rad och plocka fram ett av orden. Kasta om det och låt användaren gissa vilket det faktiska ordet är. -->

<!-- * Menyval: där Marvin i samma sträng skriver ut: dagens datum och nuvarande tid, hur han mår (slumpmässigt humör), ett heltal, samt ett floattal med 3 decimaler. Ge talen ett sammanhang i texten.
Strängen ska hämtas från en textfil som du själv skapar och formateras med ovanstående variabler. Notera att du i programmet inte ska ändra i filen. Kursrepot innehåller ett [exempel på strängformattering med fil](https://github.com/reechani/python/blob/master/example/marvin/format.py) som du kan använda som grund för denna uppgift. -->

* **Menyval B1**: Poäng till betyg, Marvin ska fråga efter maxpoäng samt dina poäng och sedan ska Marvin skriva ut vilket betyg dina poäng motsvarade. Kika på övning 3.3 i boken [Python for Informatics](kunskap/boken-python-for-informatics-exploring-information).

* **Menyval B2**: Gör så Marvin kan ta emot fyra strängar, den första strängen ska jämföras med de andra tre. Kolla om den första strängen börjar med den andra, innehåller den tredje och slutar med den sista. Tips, [startswith()](https://docs.python.org/3/library/stdtypes.html#str.startswith), [endswith()](https://docs.python.org/3/library/stdtypes.html#str.endswith) Exempel:
```python
input: "anagram", "ana", "agr", "am"        output: "Match"
input: "isogram", "is", "gra", "m"          output: "Match"
input: "Palindrom", "par", "ind", "rom"     output: "No match"
```


Tips från coachen {#tips}
-----------------------

Lär dig felsöka med debuggern, använd den när du får problem. komplettera med utskrifter av `print()`.

Validera ofta. Så slipper du en massa valideringsfel i slutet av övningen.

Lycka till och hojta till i forumet om du behöver hjälp!
