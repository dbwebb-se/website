---
author: efo
category:
    - bash
    - lab
revision:
    "2019-05-15": (B, lew) Ny video inför HT19.
    "2016-12-20": (A, efo) Första utgåvan av lab1 i linux.
...
VLinux lab 1, introduktion till bash
==================================

Laboration för att träna grunderna i bash. Du kommer jobba med apache konfigurations mappen från en linux server.

<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har installerat labbmiljön för kursen [labbmiljön för kursen vlinux](kurser/vlinux-v1/labbmiljo).

Du har tillgång till kommandot `dbwebb` och du har clonat kursrepot för linux-kursen.



Videoserie {#video}
-----------------------

Det finns en [video](https://youtu.be/gm8vnMdL02o) i spellistan som hjälper dig komma igång med labben.



Hämta labben {#hamta}
-----------------------

Labben automatgenereras för dig. Gör så här för att checka ut din personliga labb.

Gå till din kurskatalog i terminalen och kör följande kommando.

```bash
# Flytta till kurskatalogen
dbwebb create bash1
```

Materialet till labben skapas nu och sparas i din kurskatalog enligt följande.

| Fil                | Innehåll                                                              |
|--------------------|-----------------------------------------------------------------------|
| `instruction.html` | Beskrivning av labben och de uppgifter som skall göras.               |
| `answer.bash`      | Här skall du skriva din kod för att lösa respektive uppgift i labben. |
| `apache2`          | Katalogen som uppgifterna ska utföras i.                              |


Öppna filen `instruction.html` i en webbläsare och läs igenom de uppgifter som labben omfattar.

Öppna filen `answer.bash` i din texteditor och koda ihop svaren på uppgifterna.

Skriv din bash kod inom `$( )` för att den ska exekveras och returnera svaret, ex.:

```bash
ANSWER=$( find . -name 'filename' )
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
dbwebb validate bash1
dbwebb publish bash1
```

Rätta eventuella fel som dyker upp och publisera igen. När det ser grönt ut så är du klar.



Extrauppgift {#extra}
-----------------------

Det finns ingen extra uppgift.



Tips från coachen {#tips}
-----------------------

Lycka till och hojta till i Discord om du behöver hjälp!
