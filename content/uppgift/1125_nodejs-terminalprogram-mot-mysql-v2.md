---
author: mos
category:
    - javascript
    - nodejs
    - mysql
    - kursen dbjs
    - kursen databas
revision:
    "2019-01-29": "(C, mos) Förtydliga modulkravet samt tydligare om förväntade utskrifter."
    "2019-01-21": "(B, mos) Genomgången och uppdaterad inför vt19, aningen nya uppgifter."
    "2018-01-02": "(A, mos) Uppdaterad version från tidigare dokument."
...
Node.js terminalprogram mot MySQL (v2)
==================================

Du skall bygga terminalprogram med JavaScript i Node.js som skapar rapporter och söker i en MySQL databas.


<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har jobbat igenom första delarna av guiden "[Kom igång med SQL i MySQL](guide/kom-igang-med-sql-i-mysql/grunderna)".

Du har jobbat igenom artikeln "[MySQL och Node.js (v2)](kunskap/mysql-och-nodejs-v2)".



Introduktion {#intro}
-----------------------

Du skall skriva ett par skript med JavaScript i Node.js. Skripten söker i databasen "skolan" och presenterar rapporter från dess innehåll.

Du har i guiden "Kom igång med SQL i MySQL" skapat SQL-satser som du nu skall återanvända och lägga in i din egna "terminalklient" som du bygger med JavaScript och Node.js.



### Resultatet {#res}

När du är klar så har du en samling program som ger en textbaserad utskrift liknande denna.

```text
$ node teacher.js
+---------+---------------------+------+-------+------+------------+
| Akronym | Namn                | Avd  |  Lön  | Komp | Född       |
|---------|---------------------|------|-------|------+------------+
| ala     | Alastor Moody       | DIPT | 27594 |    1 | 1943-04-02 |
| dum     | Albus Dumbledore    | ADM  | 85000 |    7 | 1941-03-31 |
| fil     | Argus Filch         | ADM  | 27594 |    3 | 1946-04-05 |
| gyl     | Gyllenroy Lockman   | DIPT | 27594 |    1 | 1952-05-01 |
| hag     | Hagrid Rubeus       | ADM  | 30000 |    2 | 1956-05-05 |
| hoc     | Madam Hooch         | DIDD | 37580 |    1 | 1948-04-07 |
| min     | Minerva McGonagall  | DIDD | 49880 |    2 | 1955-05-04 |
| sna     | Severus Snape       | DIPT | 45000 |    2 | 1951-04-30 |
|---------|---------------------|------|-------|------+------------+
```

Och dessa sökningar.

```text
$ node search.js
What to search for? 7
Searching for: 7
+---------+---------------------+------+-------+------+------------+
| Akronym | Namn                | Avd  |  Lön  | Komp | Född       |
|---------|---------------------|------|-------|------+------------+
| dum     | Albus Dumbledore    | ADM  | 85000 |    7 | 1941-03-31 |
|---------|---------------------|------|-------|------+------------+
```

```text
$ node search.js
What to search for? al
Searching for: al
+-----------+---------------------+-----------+----------+------+------------+ 
| Akronym   | Namn                | Avdelning |   Lön    | Komp | Född       | 
|-----------|---------------------|-----------|----------|------+------------+ 
| ala       | Alastor Moody       | DIPT      |     27594|     1| 1943-04-03 | 
| dum       | Albus Dumbledore    | ADM       |     85000|     7| 1941-04-01 | 
| min       | Minerva McGonagall  | DIDD      |     49880|     2| 1955-05-05 | 
+-----------+---------------------+-----------+----------+------+------------+ 
```

Liksom dessa jämförelser.

```text
$ node between.js
Enter minimum value? 30000
Enter maximum value? 40000
Searching for values between 30000 - 40000
+---------+---------------------+------+-------+------+------------+
| Akronym | Namn                | Avd  |  Lön  | Komp | Född       |
|---------|---------------------|------|-------|------+------------+
| hag     | Hagrid Rubeus       | ADM  | 30000 |    2 | 1956-05-05 |
| hoc     | Madam Hooch         | DIDD | 37580 |    1 | 1948-04-07 |
|---------|---------------------|------|-------|------+------------+
```

```text
$ node between.js
Enter minimum value? 3
Enter maximum value? 7
Searching for values between 3 - 7
+-----------+---------------------+-----------+----------+------+------------+
| Akronym   | Namn                | Avdelning |   Lön    | Komp | Född       |
|-----------|---------------------|-----------|----------|------+------------+
| dum       | Albus Dumbledore    | ADM       |     85000|     7| 1941-04-01 |
| fil       | Argus Filch         | ADM       |     27594|     3| 1946-04-06 |
+-----------+---------------------+-----------+----------+------+------------+
```

### Strukturera i modul {#modul}

I uppgiften finns det ett krav om att du skall strukturera din kod i minst en modul. Tanken är att lägga funktioner i externa moduler och göra require på dem in i main-modulen.

Vi vill ha små main-moduler och lyfta ut de funktioner som är möjliga. De är potentiellt kandidater till att dela mellan olika main-moduler.

Du lärde dig om hur man skapar moduler i stycket "[Skapa funktioner i filer i artikeln JavaScript och Node.js](https://dbwebb.se/kunskap/javascript-och-nodejs#funcfil)". Gå tillbaka dit och läs om du behöver stöd för att skapa dina moduler.



Krav {#krav}
-----------------------

1. Varje fil du skapar skall innehålla ett filhuvud med ett kommentarsstycke där du anger dig själv som författare.

1. Du får inte använda någon extra extern npm-modul för att lösa uppgiften, förutom de moduler som krävs för databasen MySQL.

1. Du skall strukturera din kod i egna moduler och använda funktioner och/eller klasser. Main-filen skall vara så liten som möjligt och göra anrop till klasser/funktioner som i sin tur anropar databasen och skapar rapporterna. Du måste ha minst en modul.

1. Inloggningsdetaljer till databasen skall sparas i `config.json` och läsas in av respektive fil/main-program.

1. Skapa filen `teacher.js` som skall visa information om lärare, inklusive akronym, namn, avdelning, lön, kompetens och födelsedatum (YYYY-MM-DD).

1. Skapa filen `search.js` som visar samma information som `teacher.js`, men man kan söka/filtrera i alla fält (utom nödvändigtvis datumfältet) på en söksträng som matas in från tangentbordet.

1. Skapa filen `between.js` som visar samma information som `search.js`, men man kan söka/filtrera och visa alla värden mellan två värden. Man låter användaren mata in `min` och `max` och visar sedan alla löner och kompetenser som är mellan dessa två värden.

1. Validera din kod.

```bash
# Flytta till kurskatalogen
dbwebb validate terminal1
```

Rätta eventuella fel som dyker upp och validera igen. När det ser grönt ut så är du klar.



Extrauppgift {#extra}
-----------------------

Gör följande om du har tid och lust.

1. Kan du göra en mer flexibel utskrift av textabellen, så att man kan skriva ut godtyckligt antal kolumner och där kolumner har olika bredd? Det hade gjort att din tabellutskrift kan användas i andra sammanhang.



Tips från coachen {#tips}
-----------------------

[Hur formatterar man ett datum i JavaScript?](t/8220)

[Formattera datum i (My)SQL](t/8222)

Lycka till och hojta till i forumet om du behöver hjälp!
