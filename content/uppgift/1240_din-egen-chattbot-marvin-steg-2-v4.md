---
author:
  - moc
  - aar
category: python
revision:
  "2022-08-26": (B, aar) Delade upp marvin koden i marvin1 och marvin2 moduler.
  "2021-03-30": (A, moc) Ny version för att introducerar automaträttning.
created: "2021-03-30 11:19"
...
Din egen chattbot - Marvin - steg 2
==================================

Programmering och problemlösning i Python. Strukturera koden i egna funktioner.

<!--more-->

Nu ska ni strukturerar upp er marvin kod i fler filer och funktioner.

[ASCIINEMA src=416124 caption="Marvin del 2"]


<!-- Introduktion {#intro}
-----------------------

-->


Förkunskaper {#forkunskaper}
-----------------------

Du kan grunderna i Pythons stränghantering och du har gjort den [första delen](uppgift/din-egen-chattbot-marvin-steg-1-v3) av Marvin.



Krav {#krav}
-----------------------
[INFO]
Taggarna för varje uppgift motsvarar själva menyvalet. För att testa Menyval **9** kan man då använda `--tags=9`, för Menyval **b1** `--tags=b1` osv.
[/INFO]


1. Kopiera din Marvin från föregående kursmoment och utgå från den koden.

    ```bash
    # Flytta till kurskatalogen
    cd me
    cp -ri kmom02/marvin1/marvin.py kmom03/marvin2/
    cd kmom03/marvin2
    ```

2. Skapa filen `main.py`, den skall innehålla koden för att starta ditt program. Skapa **funktionen** `main` som innehåller koden för din while-loop. Din main fil skall sedan kalla på `main` funktion i blocket för villkoret `if __name__ == "__main__"` som du lägger längst ner i main.py.

3. Koden för dina menyval ska nu ligga i `marvin1.py`. Flytta all kod för dina nuvarande menyval till `marvin1.py`, dessa skall sparas i funktioner som du kallar på när ett menyval ha gjorts i programmet. Importera `marvin1.py` i `main.py` och strukturera om koden för de gamla menyvalen så att de läggs i en varsin funktion, med **följande namn**. Dessa funktionerna har utöver sitt menyval som tag också "marvin1" som tag.
  * Menyval 1 - `greet`
  * Menyval 2 - `celcius_to_farenheit`
  * Menyval 3 - `word_manipulation` * Tips, gör denna i samband med menyval **11**, (krav 7).
  * Menyval 4 - `sum_and_average`
  * Menyval 5 - `hyphen_string`
  * Menyval 6 - `is_isogram`
  * Menyval 7 - `compare_numbers`
  * Menyval 8 - `robber_language`

    Om du har gjort några av extrauppgifterna från föregående kursmoment så kan du döpa dem till ett valfritt namn.

    **Alla** `input()` och `print()` som används i menyvalen skall ligga i funktionen för menyvalet och inte i main programmet.  
    Det är OK att bryta ut din kod till flera mindre funktioner så länge de används i funktionen som efterfrågas.


    - Tags: `struct`. Kör tester som kollar att "marvin1.py" och "main.py" finns och att funktionen "main()" finns i "main.py". Kollar även att "marvin2.py" finns. 



4. För alla nya menyval ska dina `input` anrop ligga i "main.py" filen och du ska skicka dem som argument till de specifika menyvals funktionerna. Varje input anrop för ett menyval motsvarar ett argument till funktionen. Funktionerna ska också returnera resultatet så att utskriften görs i "main.py". Exempel:

    ```python

    ...
    elif menychoice == "9":
        string = input("Enter a string to randomize: ")
        print(randomize_string(string))
    ```

5. Skapa filen `marvin2.py`. Koden för de nya menyvalen nedanför ska du skriva i `marvin2.py`. Importera filen i `main.py`.


5. Menyval **9** - `randomize_string`: Kasta om bokstäver. Marvin ska be dig skriva in ett ord som sedan slumpmässigt kastas om. Det omkastade ordet ska sedan skrivas ut i formatet `<orginal sträng> --> <slumpad sträng>`. Lösningen ska vara case-sensitive, med andra ord `A != a`. Tips [random modulen](https://docs.python.org/3.8/library/random.html).

    ```python

    input: "Hej"                        output: "Hej --> jHe"
    input: "Borde inte bli samma igen"  output: "Borde inte bli samma igen --> eel gn rtm dBmibo saiiane"
    ```

6. Menyval **10** - `get_acronym`: Akronym skapare. Marvin ska be om en sträng och skapa en akronym för den genom att plocka ut alla stora bokstäver och sätta ihop till en ny sträng. Tips, [isupper()](https://docs.python.org/3/library/stdtypes.html#str.isupper). Exempel:
    
    ```python

    input: "BRöderna Ivarsson Osby"             output: "BRIO"
    input: "Ingvar Kamprad Elmtaryd Agunnaryd"  output: "IKEA"
    ```

7. Menyval **11** - `mask_string`: Sträng maskering. Skapa ett nytt val där Marvin ber om en sträng och ersätter alla utom de fyra sista karaktärerna med “#”. Exempel:

    ```python

    input: "4556364607935616"     output: "############5616"
    input: "64607935616"          output: "#######5616"
    ```

    Till detta menyvalet ska du också skapa funktionen `multiply_str`. `multiply_str` funktionen ska ta emot två argument, det första ska vara en sträng och det andra ett heltal. Funktionen ska multiplicera strängen med heltalet och returnera strängen som skapas.

    Skriv koden i `mask_string` så att `multiply_str` används för att skapa delen av strängen med `#`.

    Använd också `multiply_str` för att lösa menyval **3**. I `word_manipulation` anropa `multiply_str` för att bygga upp strängen (du behöver importera marvin2 i marvin1 för det).



8. Menyval **12** - `find_all_indexes`: Hitta alla index. Marvin ska be om två strängar, där den andra strängen är en del-sträng av den första. Funktionen ska returnera en kommaseparerad sträng med  alla index platser där den andra strängen finns med i den första. Det ska inte vara ett kommatecken på slutet av strängen. Om strängen som skickas in som andra argument inte finns i första argumentet ska funktionen returnera en tom sträng.

    Använd sträng funktionen funktionen [index()](https://docs.python.org/3/library/stdtypes.html#str.index) för att hitta index platser, notera att funktionen returnerar bara ett index åt gången, så även om en sträng finns med på två ställen returneras bara den första. För att komma runt detta och hitta alla index behöver ni anropa funktionen flera gånger och skicka med ett extra argument, `start`. `start` markera vilken index position funktionen ska börja leta från. Notera också att `index` funktionen lyfter ett `ValueError` om en söksträngen inte finns. Ni ska använda er av try-except i er funktion för att förhindra programmet från att krascha när det inträffar.

    Exempel:

    ```python

    input: "axaaczaa44aa4", "a"     output: "0,2,3,6,7,10,11"
    input: "axaaczaa33aa3", "aa"    output: "2,6,10"
    input: "axaaczaa55aa5", "y"     output: ""
    ```


9. Testa, validera och publicera din kod enligt följande.

    ```bash

    # Flytta till kurskatalogen
    dbwebb test marvin2
    dbwebb validate marvin2
    dbwebb publish marvin2
    ```

Rätta eventuella fel som dyker upp och publicera igen. När det ser grönt ut så är du klar.



Extrauppgift {#extra}
-----------------------
[INFO]
För att inkludera dina extrauppgifter i testerna behöver du skicka med option `-e` eller `--extra`.
[/INFO]


* Menyval **b1** - `points_to_grade`: Poäng till betyg, Marvin ska fråga efter maxpoäng samt dina poäng och sedan ska Marvin skriva ut vilket betyg dina poäng motsvarade. Använd betygsskalan:

    ```python

    Score   Grade
    >= 90%    A
    >= 80%    B
    >= 70%    C
    >= 60%    D
    <  60%    F
    ```

    Formatera output enligt `score: <betyg>`.

    ```python
    input: "100"
    input: "59"     output: "score: F"

    input: "70"
    input: "50"     output: "score: C"
    ```

* Menyval **b2** - `has_strings`: Gör så Marvin kan ta emot fyra strängar, den första strängen ska jämföras med de andra tre. Kolla om den första strängen börjar med den andra, innehåller den tredje och slutar med den sista. Lösningen ska vara case-sensitive, med andra ord `A != a`. Tips, [startswith()](https://docs.python.org/3/library/stdtypes.html#str.startswith), [endswith()](https://docs.python.org/3/library/stdtypes.html#str.endswith) Exempel:

    ```python

    input: "anagram"
    input: "ana"
    input: "agr"
    input: "am"        output: "Match"

    input: "isogram"
    input: "is"
    input: "gra"
    input: "m"          output: "Match"

    input: "Palindrom"
    input: "par"
    input: "ind"
    input: "rom"        output: "No match"
    ```


Tips från coachen {#tips}
-----------------------

Felsöka med debuggern/Thonny och komplettera med utskrifter av `print()`.

Validera ofta. Så slipper du en massa valideringsfel i slutet av övningen.

Lycka till och hojta till i forumet om du behöver hjälp!
