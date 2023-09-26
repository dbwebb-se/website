---
author:
  - aar
  - moc
category: python
revision:
  "2023-06-22": (C, aar) FLytta runt på menyval och la till create_ssn.
  "2022-08-26": (B, aar) Delade upp marvin koden i marvin1 och marvin2 moduler.
  "2021-03-30": (A, moc) Ny version för att introducerar automaträttning.
created: "2021-03-30 11:19"
...
Din egen chattbot - Marvin - steg 2
==================================

Programmering och problemlösning i Python. Strukturera koden i egna funktioner.

<!--more-->

Nu ska ni strukturerar upp er Marvinkod i fler filer och funktioner.

[ASCIINEMA src=416124 caption="Marvin del 2"]


<!-- Introduktion {#intro}
-----------------------

-->


Förkunskaper {#forkunskaper}
-----------------------

Du kan grunderna i Pythons stränghantering och du har gjort den [första delen](uppgift/din-egen-chattbot-marvin-steg-1-v4) av Marvin.



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

2. Byt namn filen `marvin.py` till `main.py` och skapa filen `marvin1.py`. `main.py` ska innehålla koden för att starta ditt program och while-loopen som som utgör menyn. Skapa **funktionen** `main` och lägg all kod som var i filen i `main()`funktionen. Din main fil skall sedan kalla på `main` funktion i blocket för villkoret `if __name__ == "__main__"` som du lägger längst ner i `main.py`.

3. Koden för dina menyval ska nu flyttas till olika funktioner i `marvin1.py`. Med "koden för menyval" menas koden som utgör funktionaliteten för ett menyval, t.ex.

    ```python
elif choice == "1":
        # koden mellan kommentarerna här. Start
        name = input("What is your name? ")
        print("\nMarvin says:\n")
        print(f"Hello {name} - your awesomeness!")
        print("What can I do you for?!")
        # Slut
    elif choice == "2":
    
    ```

    Importera `marvin1.py` i `main.py` och strukturera om koden för de gamla menyvalen så att de läggs i en varsin funktion, med **nedanstående namn**. Dessa funktionerna har i `dbwebb test` utöver sitt menyval som tag också "marvin1" som tag.
    * Menyval 1 - `greet`
    * Menyval 2 - `celcius_to_fahrenheit`
    * Menyval 3 - `points_to_grade`
    * Menyval 4 - `sum_and_average`
    * Menyval 5 - `hyphen_string`
    * Menyval 6 - `compare_numbers`
    * Menyval 7 - `validate_ssn`
    * Menyval 8 - `robber_language`

    Om du har gjort några av extrauppgifterna från föregående kursmoment så kan du döpa dem till ett valfritt namn.

    Till exempel för menyval 1 blir det.

    ```python
#main.py
    elif choice == "1":
        marvin1.greet()
    ```

    ```python
#marvin1.py
    def greet():
        name = input("What is your name? ")
        print("\nMarvin says:\n")
        print(f"Hello {name} - your awesomeness!")
        print("What can I do you for?!")
    ```



    **Alla** `input()` och `print()` som används i menyvalen skall ligga i funktionen för menyvalet och inte i main funktionen.  
    Det är OK att bryta ut din kod till flera mindre funktioner så länge de används i funktionen som efterfrågas.


    - Tags: `struct`. Det går att använda `struct` som tag i `dbwebb test kmom03 --tags=struct` för att köra testerna som kollar att man har rätt filer på rätt plats.


4. Skapa filen `marvin2.py`. Koden för de nya menyvalen nedanför ska du skriva i `marvin2.py`. Importera filen i `main.py`.



5. För alla **nya** menyval ska dina `input` anrop ligga i "main.py" filen och du ska skicka dem som argument till de specifika menyvals funktionerna. Varje input anrop för ett menyval motsvarar ett argument till funktionen. Funktionerna ska också returnera resultatet så att utskriften görs i `main.py`. Exempel:

    ```python

    ...
    elif choice == "11":
        string = input("Enter a string to randomize: ")
        print(randomize_string(string))
    ```



7. Menyval **9** - `create_ssn`: Skapa de fyra sista siffrorna till ett födelsedatum. Skapa ett nytt menyval där Marvin ber om en sträng som innehåller ett födelse datum, t.ex. `"910813"`. Din funktion ska skap de fyra sista siffrorna till det, `"910813-NNNN"`. För att skapa dem, använda [random modulen](https://docs.python.org/3.8/library/random.html) och slumpa fram de tre första siffrorna. Använd sen Luhnalgoritmen för att räkna ut den fjärde. Den funkar nästa på samma sätt som i menyval 7. 

 Algoritmen funkar på så sätt att varannan siffra multipliceras med 2 och 1, med start på första siffran i personnumret. Om något tal vid multiplikationen blir större än 9 ersätts det talet med dess siffersumma. Därefter summeras alla tal och här skiljer sig funktionen från menyval 7. Sista siffran erhålls genom att summan subtraheras från närmaste högre tiotal. Exempel med `811218-987`:

    ```
   8  1 1 2 1 8  9 8  7
    *  2  1 2 1 2 1  2 1  2
    -------------------------
    ^  ^ ^ ^ ^ ^  ^ ^  
       16 1 2 2 2 8 18 8 14
    ```

    Vilket blir `1 + 6 + 1 + 2 + 2 + 2 + 8 + 1 + 8 + 8 + 1 + 4 = 44`, `50 - 44 = 6`. Personnummret blir då `811218-9876`.

    För att subtrahera från närmsta tiotal kan man använda [modulu operatorn](https://sv.wikipedia.org/wiki/Modul%C3%A4r_aritmetik), `%`.

    Som du läst finns det funktionalitet som är samma mellan menyval 7 och 9. Därför ska du skapa en ny funktion som används i koden för menyval 7 och 9. Skapa `create_ssn` som tar emot födelsedatumet och skapar tre siffror. Skapa sen `calculate_luhna_sum` som tar emot en sträng med födelsedatumet och de tre siffrorna, utan `-`, `"811218987"`. Funktionen ska räkna ut summan och returnera den, `44`. I `create_ssn` använd summan och räkna ut sist siffran och returnera hela personnummret, med `-`, `811218-9876`.

    Uppdatera sen koden för menyval 7 så att du använder `calculate_luhna_sum` i den koden också, för att räkna ut summan som ska kollas om den är delbar med 10. Koll om talet är delbart med 10 i menyval 7 funktionen, inte i `calculate_luhna_sum`. Genom att återanvända funktioner på flera ställen kan vi få mer [DYR kod](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself).

 Exempel:

    ```python

    input: "910813"     output: "910813-2201".
    ```

 Eftersom tre siffror slumpas fram kommer ni inte få samma sista som i exemplet. Men om ni använder det i menyval 7 ska det vara ett giltigt personnumer




6. Menyval **10** - `get_acronym`: Akronymskapare. Marvin ska be om en sträng och skapa en akronym för den genom att plocka ut alla stora bokstäver och sätta ihop till en ny sträng. Tips, [isupper()](https://docs.python.org/3/library/stdtypes.html#str.isupper). Exempel:
    
    ```python

    input: "BRöderna Ivarsson Osby"             output: "BRIO"
    input: "Ingvar Kamprad Elmtaryd Agunnaryd"  output: "IKEA"
    ```



5. Menyval **11** - `randomize_string`: Kasta om bokstäver. Marvin ska be dig skriva in ett ord som sedan slumpmässigt kastas om. Funktionen `randomize_string` ska **bara** returnera det nya slumpade ordet. Svaret ska sedan skrivas ut i formatet `<orginal sträng> --> <slumpad sträng>`, från `main.py`. Lösningen ska vara case-sensitive, med andra ord `A != a`. Tips [random modulen](https://docs.python.org/3.8/library/random.html).

    ```python

    input: "Hej"                        output: "Hej --> jHe"
    input: "Borde inte bli samma igen"  output: "Borde inte bli samma igen --> eel gn rtm dBmibo saiiane"
    ```



8. Menyval **12** - `find_all_indexes`: Hitta alla index. Marvin ska be om två strängar, där den andra strängen är en del-sträng av den första. Funktionen ska returnera en kommaseparerad sträng med  alla indexplatser där den andra strängen finns med i den första. Det ska inte vara ett kommatecken på slutet av strängen. Om strängen som skickas in som andra argument inte finns i första argumentet ska funktionen returnera en tom sträng.

    Använd sträng funktionen funktionen [index()](https://docs.python.org/3/library/stdtypes.html#str.index) för att hitta indexplatser, notera att `index()` returnerar bara ett index åt gången, så även om en sträng finns med på två ställen returneras bara den första. För att komma runt detta och hitta alla index behöver ni anropa `index()` flera gånger och skicka med ett extra argument, `start`. `start` markera vilken index position funktionen ska börja leta från. Notera också att `index` funktionen lyfter ett `ValueError` om en söksträngen inte finns. Ni ska använda er av try-except i er funktion för att förhindra programmet från att krascha när det inträffar.

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

* Menyval **b1** - `has_strings`: Gör så Marvin kan ta emot fyra strängar, den första strängen ska jämföras med de andra tre. Kolla om den första strängen börjar med den andra, innehåller den tredje och slutar med den sista. Lösningen ska vara case-sensitive, med andra ord `A != a`. Tips, [startswith()](https://docs.python.org/3/library/stdtypes.html#str.startswith), [endswith()](https://docs.python.org/3/library/stdtypes.html#str.endswith) Exempel:

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
