---
author: mos
category: python
revision:
  "2020-06-29": (I, ) Uppdaterad inför V3 HT20.
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
Din egen chattbot - Marvin - steg 3
==================================

Programmering och problemlösning i Python. Strukturera koden i egna funktioner.

<!--more-->


<!-- Introduktion {#intro}
-----------------------

-->


Förkunskaper {#forkunskaper}
-----------------------

Du kan grunderna i Pythons stränghantering och du har gjort den [andra delen](uppgift/din-egen-chattbot-marvin-steg-2-v3) av Marvin.



Krav {#krav}
-----------------------

1. Kopiera din Marvin från föregående kursmoment och utgå från den koden.

```bash
# Flytta till kurskatalogen
cd me
cp -ri kmom03/marvin2/marvin.py kmom04/marvin3/
cd kmom04/marvin3
```

2. Skriv om koden så att menyn och varje menyval finns i en egen funktion.

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

6. **Menyval 11**: Filtrera listor. Marvin ska ta emot en sträng med olika nummer. Dessa skall omvandlas till en lista som endast innehåller värden över `10`. Tips, [filter()](https://docs.python.org/3/library/functions.html#filter). Exempel:
```python
input: "6 9 10 11 8 12 15"     output: [ 11, 12, 15 ]
```

7. Validera och publicera Marvin genom att göra följande kommandon i kurskatalogen i terminalen.

```bash
# Flytta till kurskatalogen
dbwebb validate marvin3
dbwebb publish marvin3
```

Rätta eventuella fel som dyker upp och publicera igen. När det ser grönt ut så är du klar.



Extrauppgift {#extra}
-----------------------

* **Menyval B1**: Poäng till betyg, Marvin ska fråga efter maxpoäng samt dina poäng och sedan ska Marvin skriva ut vilket betyg dina poäng motsvarade. Kika på övning 3.3 i boken [Python for Informatics](kunskap/boken-python-for-informatics-exploring-information).

* **Menyval B2**: Gör så Marvin kan ta emot fyra strängar, den första strängen ska jämföras med de andra tre. Kolla om den första strängen börjar med den andra, innehåller den tredje och slutar med den sista. Tips, [startswith()](https://docs.python.org/3/library/stdtypes.html#str.startswith), [endswith()](https://docs.python.org/3/library/stdtypes.html#str.endswith) Exempel:
```python
input: "anagram", "ana", "agr", "am"        output: "Match"
input: "isogram", "is", "gra", "m"          output: "Match"
input: "Palindrom", "par", "ind", "rom"     output: "No match"
```


Tips från coachen {#tips}
-----------------------

Felsöka med debuggern och komplettera med utskrifter av `print()`.

Validera ofta. Så slipper du en massa valideringsfel i slutet av övningen.

Lycka till och hojta till i forumet om du behöver hjälp!
