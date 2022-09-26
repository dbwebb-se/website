---
author: lew
category:
    - bash
    - vlinux
    - regex
    - lab
revision:
    "2022-09-26": (B, lew) Uppdaterad inför HT22.
    "2019-05-24": (A, lew) Ny inför HT19.
...
VLinux lab 4, reguljära uttryck
==================================

Laboration för att träna grunderna i regex med verktyget sed. Du kommer jobba med verktyget sed och diverse textfiler. Till din hjälp har du en [regex guide](/kunskap/regex).

<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har installerat labbmiljön för kursen [labbmiljön för kursen vlinux](kurser/vlinux-v1/labbmiljo).

Du har tillgång till kommandot `dbwebb` och du har clonat kursrepot för vlinux-kursen.



Hämta labben {#hamta}
-----------------------

Labben automatgenereras för dig. Gör så här för att checka ut din personliga labb.

Gå till din kurskatalog i terminalen och kör följande kommando.

```bash
# Flytta till kurskatalogen
dbwebb create sed1
```

Materialet till labben skapas nu och sparas i din kurskatalog enligt följande.

| Fil                | Innehåll                                                              |
|--------------------|-----------------------------------------------------------------------|
| `instruction.html` | Beskrivning av labben och de uppgifter som skall göras.               |
| `answer.bash`      | Här skall du skriva din kod för att lösa respektive uppgift i labben. |
| `emails.txt`          | textfil för vissa av uppgifterna.                              |
| `numbers.txt`          | textfil för vissa av uppgifterna.                              |
| `quotes.txt`          | textfil för vissa av uppgifterna.                              |
| `substitution.txt`          | textfil för vissa av uppgifterna.                              |


Öppna filen `instruction.html` i en webbläsare och läs igenom de uppgifter som labben omfattar.

Öppna filen `answer.bash` i din texteditor och koda ihop svaren på uppgifterna.

Skriv din bash kod inom `$( )` för att den ska exekveras och returnera svaret, ex.:

```bash
ANSWER=$( sed -E -n '/regex/p' < filename.txt )
```

Du kan testa dina lösningar genom att köra programmet `answer.bash` i din terminal.

```bash
$ ./answer.bash
```



Krav {#krav}
-----------------------

1. Gör de uppgifter som finns i labben `instruction.html`.

2. Skriv dina lösningar, på rätt plats, i filen `answer.bash`.

3. Testkör din labb genom att köra filen `answer.bash`.

4. Ladda upp, validera och publicera labben genom att göra följande kommando i kurskatalogen i terminalen.

```bash
# Flytta till kurskatalogen
dbwebb validate sed1
dbwebb publish sed1
```

Rätta eventuella fel som dyker upp och publisera igen. När det ser grönt ut så är du klar.



Extrauppgift {#extra}
-----------------------

Det finns ingen extra uppgift.



Tips från coachen {#tips}
-----------------------

I uppgiften om epostadreserna är det endast de i den tillhörande filen som ska matchas, inte alla tänkbara adresser.
 
Använd [https://regex101.com/](https://regex101.com/) för att snabbt testa och följa uttrycken. Tänk på att det kan skilja lite mellan programmen som hanterar regex.



Lycka till och hojta till i forumet om du behöver hjälp!
