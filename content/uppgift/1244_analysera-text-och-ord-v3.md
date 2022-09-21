---
author:
    - aar
    - efo
category: python
revision:
    "2022-09-19": (C, aar) Tog bort krav om egen modul för menyn och la till extrauppgift.
    "2020-05-25": (B, aar) Skrev om uppgifter för hantera automaträttning.
    "2020-03-30": (A, moc) Ny version för att introducerar automaträttning.
...
Analysera text och ord
==================================

[FIGURE src=image/python/old-book.jpg?w=c5 class="right"]

Vi har i Marvin byggt ett program bestående av två moduler och ett antal funktioner som samverkar för att Marvin kan svara på frågor. Vi har även bekantat oss med `dictionary` där vi kan spara nyckel-värde par.  Vi ska i denna uppgift skapa ett Marvin liknande program som tar emot inmatning och kan analysera en text.

<!--more-->




Förkunskaper {#forkunskaper}
-----------------------

Du har en bra förståelse för `dictionary` och har jobbat igenom "[Python med dictionaries och tupler](uppgift/python-med-dictionaries-och-tupler-v2)" och [Att läsa filer som listor i Python](kunskap/att-lasa-filer-i-python-v2).



Introduktion {#intro}
-----------------------

I kursrepot finns en del av "Phil, the Fiddler", [`example/text/phil.txt`](https://github.com/mosbth/python/blob/master/example/text/phil.txt). Du skall använda den texten och låta ditt CLI-program analysera den.

Vill du lära dig mer om vad textanalys kan innebära "på riktigt" så läser du lite om [text analys och text mining på Wikipedia](https://en.wikipedia.org/wiki/Text_mining).

Du kommer göra en övning med ordfrekvens, läs gärna om det på [Wikipedia Letter Frequency](https://en.wikipedia.org/wiki/Letter_frequency) och studera bilden som visar bokstävernas procentuella förekomst i det engelska språket.

För samtliga uppgifter gäller att ett ord består av bokstäverna [A-z]. Ett tips är att konvertera alla ord till enbart små bokstäver [a-z], det kan göra uppgiften enklare.

Googla "online word counter" eller "online letter counter" så hittar du verktyg som gör precis det du skall göra. Testa att köra in texten i ett av dem och se hur det ser ut. Då får du en referens och mental bild som kan hjälpa dig att se om du är på rätt väg eller ej.

Du ska i uppgiften göra ett program som analyserar en text från en fil. Det kan se ut på detta sättet när vi kör programmet:

[ASCIINEMA src=416107]


Försök gärna skriva DRY kod, funktioner som kan återanvändas för mer än 1 menyval.



Krav {#krav}
-----------------------
[INFO]
Alla taggar har samma namn som menyvalen. Så för att testa "change" kan man skicka med `--tags=change` osv.
[/INFO]


Börja med att kopiera text-filen `phil.txt`.

```bash
# Ställ dig i kursrepo katalogen
# rsync används för att kopiera filer och mappar
rsync -a example/text/ me/kmom06/analyzer/
cd me/kmom06/analyzer
```

Se till att din katalog `analyzer` innehåller filen `phil.txt` och `lorum.txt`. `phil.txt` ska vara **FÖRVALT** i programmet när man startar det.

1. Ni får inte använda externa moduler för att göra analyzen. T.ex. får ni inte använda `collections` modulen. Ni ska skriva koden själva. Däremot får ni använda t.ex. `itemgetter` för att sortera er data.

1. Ditt program ska bestå av två moduler: `main.py` och `analyzer.py`.

1. Du skall skapa funktioner för textanalysering i modulen `analyzer.py`.

1. Filen `main.py` skall enbart innehålla kommandoloopen, tänk while-loopen i marvin, och använda sig av modulen `analyzer` för att lösa uppgiften. Koden ska ligga i en funktion som heter `main`. **Glöm inte `if __name__ == "__main__"` i main.py för att starta programmet**.

1. Analysera antal rader (ej tomma), ord och bokstäver med menyvalen `lines`, `words` och `letters`. Skriv minst en funktion för varje kommando i `analyzer.py`.

    ```python

    input: "lines"       output: "17"
    input: "words"       output: "199"
    input: "letters"     output: "907"
    ```

    - Tags: `count` (gemensam för alla tre), `words`, `lines`, `letters`. 



1. Analysera även ord- och bokstavsfrekvensen och skriv ut de sju mest förekommande orden och bokstäverna. Använd menyvalen `word_frequency` och `letter_frequency`. Ange frekvensen i % av totala mängden ord eller bokstäver. Avrunda till en (1) decimal. Använd strukturen `"<bokstav/ord>: <antal> | <procent>%"` i utskriften. Utskriften ska vara sorterad i storleks ordning och bokstavsordning sjunkande. Om två ord har 5 ska orden sorteras i bokstavsordning sjunkande. Skriv minst en funktion för varje kommando i `analyzer.py`.

    ```python

    input: "word_frequency"       output: "the: 12 | 6.0%
                                           to: 8 | 4.0%
                                           and: 7 | 3.5%
                                           of: 6 | 3.0%
                                           street: 5 | 2.5%
                                           him: 5 | 2.5%
                                           he: 5 | 2.5%" 
    input: "letter_frequency"     output: "e: 108 | 11.9%
                                           t: 91 | 10.0%
                                           o: 77 | 8.5%
                                           h: 67 | 7.4%
                                           n: 66 | 7.3%
                                           i: 64 | 7.1%
                                           a: 64 | 7.1%"
    ```

    - Tags: `freq` (gemensam för alla båda), `word_frequency`, `letter_frequency`. 



1. Ditt program skall klara av menyvalet `all` som kör alla analyserings funktioner i följd och skriver ut resultatet. Utskriften ska vara sorterad i storleks ordning och bokstavsordning sjunkande. Om två ord har 5 ska orden sorteras i bokstavsordning sjunkande tips (använd er av en lista och tupler för att göra sorteringen).

    ```python

    input: "all"       output: "17
                                199
                                907
                                the: 12 | 6.0%
                                to: 8 | 4.0%
                                and: 7 | 3.5%
                                of: 6 | 3.0%
                                street: 5 | 2.5%
                                him: 5 | 2.5%
                                he: 5 | 2.5%" 
                                e: 108 | 11.9%
                                t: 91 | 10.0%
                                o: 77 | 8.5%
                                h: 67 | 7.4%
                                n: 66 | 7.3%
                                i: 64 | 7.1%
                                a: 64 | 7.1%"
    ```

    - Tags: `freq` (gemensam för alla båda), `word_frequency`, `letter_frequency`. 

1. Ditt program ska klara av menyvalet `change`. Det ska användas för att byta ut vilken fil som används vid övriga menyval. Använd ett input anrop för att fråga användaren om vad den nya filen heter som ska användas. Ni kan testa byta mellan `phil.txt` och `lorum.txt` för att kolla att det fungerar.

    - Tags: `change`.
    
    PS. följande är rätt svar för `all` med `lorum.txt`filen:

    ```python

    input: "all"       output: "3
                                25
                                140
                                dolor: 2 | 8.0%
                                vivamus: 1 | 4.0%
                                vitae: 1 | 4.0%
                                varius: 1 | 4.0%
                                urna: 1 | 4.0%
                                sit: 1 | 4.0%
                                pellentesque: 1 | 4.0%
                                i: 18 | 12.9%
                                e: 16 | 11.4%
                                u: 12 | 8.6%
                                a: 12 | 8.6%
                                t: 10 | 7.1%
                                l: 10 | 7.1%
                                s: 9 | 6.4%"
    ```

1. Gör menyvalet `q` som avslutar programmet.

1. Testa, validera och publicera din kod enligt följande.

```bash
# Flytta till kurskatalogen
dbwebb test analyzer
dbwebb validate analyzer
dbwebb publish analyzer
```



Extrauppgift {#extra}
-----------------------

1. Bygg ut ditt program så att det även kan skriva ned resultatet i en fil. Lägg till menyvalet `write [choice]` där `[choice]` är något av de andra menyvalen. Ditt program ska skriva ner resultatet i en fil som heter `output.txt`. Om filen redan innehåller ett värde ska det skrivas över med det nya värdet.

    ```python

    input: "write lines"       file content: "17"
    input: "wirte words"       file content: "199"
    ```



Tips från coachen {#tips}
-----------------------

Försök att återanvända dina funktioner, det underlätta i många fall och skapar bra kodstruktur.

Lär dig felsöka med debuggern, använd den när du får problem. Komplettera med utskrifter av `print()`.

Validera ofta. Så slipper du en massa valideringsfel i slutet av övningen.

Lycka till och hojta till i forumet om du behöver hjälp!
