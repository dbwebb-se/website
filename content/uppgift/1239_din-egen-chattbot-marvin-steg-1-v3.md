---
author:
  - moc
  - aar
category: python
revision:
  "2022-08-17": (B, aar) La till uppgift om rövarspråket.
  "2021-03-29": (A, moc) Ny version för att introducerar automaträttning.
created: "2021-03-29 15:54"
...
Din egen chattbot - Marvin - steg 1
==================================

Programmering och problemlösning i Python, du skall bygga en chattbot Marvin som kan svara på "alla" dina frågor.

<!--more-->

[ASCIINEMA src=360066 caption="Marvin del 1"]



Förkunskaper {#forkunskaper}
-----------------------

Du har jobbat igenom artikeln "[Villkor och loopar](kunskap/villkor-och-loopar)" och gjort labben [Python med villkor och loopar](uppgift/python-med-villkor-och-loopar).



Introduktion {#intro}
-----------------------

Kopiera grundkoden för din Marvin enligt följande.

```bash
# Ställ dig i kurskatalogen
cp -i example/marvin/marvin.py me/kmom02/marvin1/
```

Gå till katalogen och testkör Marvin.

```bash
cd me/kmom02/marvin1/
./marvin.py
```

Öppna koden i en texteditor och titta igenom hur `marvin.py` fungerar.

Nu kan du börja jobba.



Krav {#krav}
-----------------------
[INFO]
Taggarna för varje uppgift motsvarar själva menyvalet. För att testa Menyval **1 och 2** kan man då använda `--tags=1,2`, för Menyval **a1** `--tags=a1` osv.
[/INFO]

1. Sök på bilder på [Asciiworld](http://www.asciiworld.com/) (eller motsvarande) och hitta din egen bild på "Marvin". Lägg in din bild i programmet och ersätt den med bilden på Marvin.


1. Organisera din kod i `if`-satsen inuti `while`-loopen. Samla all kod i filen `marvin.py`. Se till att dina menyval har samma namn som den **markerade** texten.


1. Uppdatera menyval **1** för att berätta vad du heter. Byt ut hälsningsfrasen mot en annan. Du kan även byta namnet på din "Marvin", om du vill.

1. Menyval **q**: Avsluta programmet. Använd **inte** `exit()` för att avsluta programmet. Använd istället `break` för att avsluta loopen så att programmet stängs när för att all kod har blivit exekverad.

1. Menyval **2**: Celsius till Fahrenheit. Marvin ska fråga efter en temperatur i Celsius och sedan skriva ut en sträng som skall innehålla motsvarande i Fahrenheit. Värdet skall avrundas till två decimaler.

```python
input: 135.205     output: "275.37"
```

1. Menyval **3**: Ordmultiplicering. Här skall Marvin ta emot två `input()`, den första skall be om ett ord och den andra skall be om en siffra. Marvin skall sedan skriva ut det givna ordet så många gånger.

```python
input: "hej"
input: 3        output: "hejhejhej"
```

1. Menyval **4**: Summa och medel: Marvin ska fråga efter tal tills du skriver “done” och sedan ska Marvin skriva ut en sträng som skall innehålla summan och medelvärdet för dessa tal. Avrunda dina värden till två decimaler. Exempel:
```python
input: 1
input: 2
input: 3
input "done"     output: "The sum of all numbers are 6 and the average is 2"
```

8. Menyval **5**: Marvin ska fråga efter en sträng och skriva ut en ny sträng där varje karaktär har ökat med +1 och är separerad med "-". Exempel:
```python
input: "apa"      output: "a-pp-aaa"
input: "kassler"  output: "k-aa-sss-ssss-lllll-eeeeee-rrrrrrr"
```

9. Menyval **6**: Gör så Marvin kan kolla om ett ord är ett isogram. Ett ord är ett isogram om det inte innehåller några återupprepande bokstäver, både i följd och icke i följd. Det är OK om den är case-sensitive, a != A. Exempel:
```python
input: "apa"      output: "No match!"
input: "Dansk"    output: "Match!"
```


7. Menyval **7**: Lägg till så att Marvin frågar efter tal och för varje tal angivet så ska Marvin skriva ut “larger!” om det nya talet är större, “smaller!” om det var mindre eller “same!” om talet som skrev in hade samma värde som det föregående talet. Första gången man startar menyvalet kommer Marvin inte ha något tal att jämföra med, då skall den be användaren att mata in två tal. Detta ska göras tills användaren skriver “done”. Använd try-except för att hantera om användaren skriver in något som inte är en siffra. Om användaren gör det ska programmet inte krascha. Istället ska det skriva ut `"not a number!"` och sen fortsätta med loopen så att användaren kan fortsätta skriva in siffror.

    Exempel:

    ```python
    input: 1
    input: 2         output: "larger!"
    input: 2         output: "same!"
    input: 1         output: "smaller!"
    input: "hej"       output: "not a number!"
    input: 3         output: "larger!"
    input "done"
    ```

8. Menyval **8**: Gör så Marvin kan tala [rövarspråket](https://sv.wikipedia.org/wiki/R%C3%B6varspr%C3%A5ket). Marvin ska använda ett input anrop för att ta emot ett ord och sen skriva ut ordet översatt till rövarspråket.

    Exempel:

    ```python
    input: "b"      output: "bob"
    input: "apa"    output: "apopa"
    ```


10. [Testa](dbwebb-cli/python), validera och publicera din kod enligt följande.


```bash
# Ställ dig i kurskatalogen
dbwebb test marvin1
dbwebb publish marvin1
```

Rätta eventuella fel som dyker upp och publicera igen. När det ser grönt ut så är du klar.



Extrauppgift {#extra}
-----------------------
[INFO]
För att inkludera dina extrauppgifter i testerna behöver du skicka med `-e` eller `--extra` i test kommandot.
[/INFO]



* Menyval **a1**: Gör ett val där Marvin tar emot två `input()` i from av strängar. Den skall sedan kolla om alla karaktärer i den andra strängen finns i den första. Varje bokstav räknas bara en gång. Exempel:
```python
input: "Python", "phno"        output: "Match!"
input: "Programming", "gram"   output: "Match!"
input: "kassler", "kusl"       output: "No match!"
input: "mister", "misse"       output: "No match!"
```

* Menyval **a2**: Dubblera tills det innehåller alla siffror, gör ett menyval där Marvin räknar ut hur många gånger ett tal behöver multipliceras med två för att talet ska innehålla alla siffror mellan 0 och 9 minst en gång. Menyvalet ska ta två inputs, ett som är talet som ska multipliceras och ett input som är hur många gånger den ska försöka multiplicera innan den ger upp. Om den inte lyckas innan den ska ge upp returnera -1. Exempel:
```python
input: 1, 1000              output: "Answer: 68 times"  (295147905179352825856)
input: 1234567890, 1000     output: "Answer: 0 times"
input: 555, 10              output: "Answer: -1 times"
```

* Menyval **a3**: Ersätt tab med mellanslag, gör ett menyval där Marvin tar emot en sträng som innehåller minst en tab, ersätt varje tab med 3 mellanslag. En tab representeras av `\t`, det räknas som en karaktär, `if letter == \t`. När du skriver in input strängen till programmet använd tab tangenten, skriv inte `\t`. Skriv ut den nya strängen med mellanslag istället för tabbar. Exempel:
```python
input: "Hello\t\tworld"              output: "Hello     world"
input: "The \tWheel of\tTime\tturns" output: "The    Wheel of   Time   turns"
```

* Menyval **a4**: Slå ihop namn, gör ett menyval där Marvin tar emot två namn, du kan räkna med att båda namnen bara innehåller små bokstäver. Slå ihop namnen till ett, ex. "brad" och "angelina" blir "brangelina". I det första namnet hitta ska du hitta första vokalen och spara alla konsonanter framför den, ex. "brad" blir "br" och "ben" blir "b". I det andra namnet ta bort alla konsonanter från början till första vokalen, ex. "brad" blir "ad", "angelina blir "angelina" och "sheldon" blir "eldon". Konkatenera sen den sparade delen från det första namnet med den sparade delen från det andra namnet. Vokalerna är `"a e i o u y"`, vi räknar inte med `"å ä ö"`. Exempel:
```python
input: "brad", "angelina"   output: "brangelina"
input: "sheldon", "amy"     output: "shamy"
input: "ross", "rachel"     output: "rachel"
input: "britain", "exit"    output: "brexit"
```

* Menyval **a5**: Räkna poäng, gör ett menyval där Marvin tar emot en input som ska vara en lång sträng med där varannan karaktär är en bokstav och varannan är en siffra, ex `"a2b4A5s3B1"`. En bokstav representerar en spelare och efterföljande siffra är dess poäng. Om bokstaven är liten, får spelaren poäng, om det är en stor bokstav förlorar spelaren poäng. Räkna ut och skriv ut varje spelares totala poäng. Notera att utskriften ska vara formatterad som i exemplet nedanför, inget mellanrum före första bokstaven och inget komma efter sista siffran. Exempel:
```python
input: "a2b4A5s3B1"     output: "a -3, b 3, s 3"
input: "g3l1H5l2G3l1"   output: "g 0, l 4, h -5"
```
Tip, nästla två for-loopar.


Tips från coachen {#tips}
-----------------------

Debugga och felsök med `pdb`.

Validera ofta. Så slipper du en massa valideringsfel i slutet av övningen.

Lycka till och hojta till i forumet om du behöver hjälp!
