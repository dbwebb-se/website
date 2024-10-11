---
author: bbe
category: python
revision:
  "2024-10-11": (A, bbe) Första utgåvan. Tillägg till befintliga övningar.
...
Absoluta och relativa sökvägar
==================================

När vi arbetar med filer så lagras dessa i en katalog (eng folder). Vi har delat in vårt lagringsutrymme i en trädstruktur och vi kan ofta välja var i denna trädstruktur vi vill placera våra filer (vissa filer har dock en bestämd placering). Om man skriver `pwd` (print working directory) i Unix-terminalen får vi **sökvägen** till den aktuella katalogen, ex-vis `/home/bbe/dbwebb-kurser/python/tester` vilket innebär att katalogen `tester` är den aktuella katalogen och den finns i, dvs är en underkatalog till, `python` som är en underkatalog till `dbwebb-kurser` osv. 


När vi med Python-kod skapar en text-fil som vi skriver till kan det ex-vis se ut så här  
```python
filename = "my_friends.txt"
friends = "Anna\nSven\nPia\nLinda\nKaj\n"
with open(filename, "w") as file_handler:
    file_handler.write(friends)

```
Filen namngiven `"my_friends.txt"` skapas då i den katalog som är arbetskatalog (current working directory). Om vi t.ex har startat `VS code` i katalogen `python`, som därmed blir arbetskatalogen, kommer filen med namnet `"my_friends.txt"` att placeras i denna katalog.   


Om vi i stället vill placera en fil i katalogen `tester`, som finns en nivå ner, kan vi göra det genom att ange den **relativa sökvägen** eller den **absoluta sökvägen**. 


Vi börjar med den **relativa sökvägen**, vilken motsvaras av att den utgår från aktuella katalog. Som i detta fall är `python` och skriver filen i `tester`som är en underkatalog 

```python
filename = "tester/my_friends.txt" 
friends = "Anna\nSven\nPia\nLinda\nKaj\n"
with open(filename, "w") as file_handler:
    file_handler.write(friends)
```

Och fortsätter med den **absoluta sökvägen**, vilken motsvaras av att den utgår från rot-katalog och innehåller hela vägen avseende katalogstrukturen.

```python
filename = "/home/bbe/dbwebb-kurser/python/tester/my_friends.txt"
friends = "Anna\nSven\nPia\nLinda\nKaj\n"
with open(filename, "w") as file_handler:
    file_handler.write(friends)
```
<!--more-->

Path
--------------------------------------

I python finns det en datatyp (som är en sk. klass) namngiven `Path`. Genom att använda `Path` kan man bl.a skapa kataloger, ta reda sökvägen till en fil etc. För att få tillgång till Path behöver vi `importer Path från pathlib`

```python
from pathlib import Path
...
```

Vi kikar på några exempel:  
Katalogstrukturen vi utgår ifrån är  
Folder  
&emsp;&emsp;|  
&emsp;&emsp;SubFolder_1  
&emsp;&emsp;|&emsp;&emsp;|  
&emsp;&emsp;|&emsp;&emsp;file_in_subfolder.txt  
&emsp;&emsp;|  
&emsp;&emsp;SubFolder_2  
&emsp;&emsp;|&emsp;&emsp;|  
&emsp;&emsp;|&emsp;&emsp;SubFolder_2_1     
&emsp;&emsp;|  
&emsp;&emsp;file_in_folder.txt  
  
där aktuell katalog är Folder.

Nu vill vi undersöka den `relativa` resp den `aktuella sökvägen`

```python
from pathlib import Path

path = Path('.') #skapar en path-variabel för aktuell folder/katalog
print(path) #skriver ut relativa sökvägen, dvs '.'
print(path.absolute()) # skriver ut absoluta sökvägen, ex-vis \\wsl.localhost\Ubuntu\home\bbe\Folder

```
Ett exempel
--------------------------------------

Anta att vi har ett system (implementerat i `python`) i vilket ett antal text-filer används. Från vissa delar i systemet behöver man läsa från dessa filer och från andra delar i systemet skapas och skrivs till dessa filer. 

Katalogstrukturen vi utgår ifrån är

MainDirectory  
&emsp;&emsp;|  
&emsp;&emsp;Test  
&emsp;&emsp;|&emsp;&emsp;|  
&emsp;&emsp;|&emsp;&emsp;example.py   
&emsp;&emsp;|  
&emsp;&emsp;Articles  
&emsp;&emsp;|&emsp;&emsp;|  
&emsp;&emsp;|&emsp;&emsp;Books     

Den fil vi ska implementera är `"example.py"` (se ovan) och i denna ska vi skapa en funktion som ska hantera att skapa och skriva till textfiler som placeras i katalogen `Books` (se ovan).   
Vi kör VS Code från `MainDirectory`, dvs detta är vår arbetskatalog.

Funktionen ska ta emot filnamnet och en lista med den data som ska skrivas på filen. Varje element i listan ska skrivas på separat rad i filen.

Vi börjar med att importera `Path` och skapa huvudet till funktion

```python
#filen example.py
from pathlib import Path

def writeBookInfoOnFile(filename, book_info):
    """ writes the content in the list book_info on the file with the name contained in
        the variable filename
    """
    pass
```
Det första vi gör är att ta reda på sökvägen till arbetskatalogen (MainDirectory) genom att använda `Path`. Vi gör det genom att anropa funktionen `cwd()` via `Path`. Eftersom det är första gången vi gör detta är det lämpligt att göra en utskrift för att bekräfta resultatet.

```python
from pathlib import Path

def writeBookInfoOnFile(filename, book_info : list):
    cwd = Path.cwd() #sökvägen till aktuell arbetskatalog, dvs till MainDirectory
    print(cwd)

#testkör
writeBookInfoOnFile("Emil.txt", ['Astrid Lindgren', 'ISBN: 9789129729887', '229 SEK'])
```
Detta ger (i mitt fall) utskriften 
'\\wsl.localhost\Ubuntu\home\Folder\MainDirectory'
Det är alltså hela sökvägen från roten, dvs den absoluta sökvägen.

Nu vill vi se till att filen hamnar i katalogen `Books` som är underkatalog till `Articles`.
Vi kan återigen använda Path för att skapa en sökväg dit. 
Vi skriver dessutom ut resultatet för att se att det stämmer

```python
from pathlib import Path

def writeBookInfoOnFile(filename, book_info : list):
    """ writes the content in the list book_info on the file with the name contained in
        the variable filename
    """
    cwd = Path.cwd() 
    abs_path = Path(cwd/'Articles'/'Books') #observera att / används 
    print(abs_path)

#testkör
writeBookInfoOnFile("Emil.txt", ['Astrid Lindgren', 'ISBN: 9789129729887', '229 SEK'])
```
Detta ger (i mitt fall) utskriften 
'\\wsl.localhost\Ubuntu\home\Folder\MainDirectory\Articles\Books'

Det finns bl.a en möjlighet att kontrollera om en sökväg existerar genom att anropas funktionen `exist()` som returnerar 'True' eller 'False'. Den kan vi använda här.

```python
from pathlib import Path

def writeBookInfoOnFile(filename, book_info : list):
    """ writes the content in the list book_info on the file with the name contained in
        the variable filename
    """
    cwd = Path.cwd()
    abs_path = Path(cwd/'Articles'/'Books')
    if abs_path.exists():
        pass: #här kan man göra en utskrift för att se att det är ok

#testkör
writeBookInfoOnFile("Emil.txt", ['Astrid Lindgren', 'ISBN: 9789129729887', '229 SEK'])
```
Nu är det dags att skapa filen. Då behöver vi hela sökvägen följt av filnamnet som en sträng.
Vi behöver omvandla `abs_path` till en sträng och addera `'/'` vilket vi fixar genom att konkatenera absoluta sökvägen med `'/'` och filnamnet.  

```python
from pathlib import Path

def writeBookInfoOnFile(filename, book_info : list):
    """ writes the content in the list book_info on the file with the name contained in
        the variable filename
    """
    cwd = Path.cwd()
    abs_path = Path(cwd/'Articles'/'Books')
    if abs_path.exists():
        total_path = str(abs_path) + '/' + filename

#testkör
writeBookInfoOnFile("Emil.txt", ['Astrid Lindgren', 'ISBN: 9789129729887', '229 SEK'])
```
Nu är det dags att öppna filen och skriva innehållet i listan radvis.

```python
from pathlib import Path

def writeBookInfoOnFile(filename, book_info : list):
    """ writes the content in the list book_info on the file with the name contained in
        the variable filename
    """
    cwd = Path.cwd()
    abs_path = Path(cwd/'Articles'/'Books')
    if abs_path.exists():
        total_path = str(abs_path) + '/' + filename
        with open(str(total_path), "w") as filehandler:
            for item in book_info:

#testkör
writeBookInfoOnFile("Emil.txt", ['Astrid Lindgren', 'ISBN: 9789129729887', '229 SEK'])
```
Nu kan vi kontrollera att filen `'Emil.txt'` finns i katalogen Books och har innehållet  
Astrid Lindgren  
ISBN: 9789129729887  
229 SEK  

Slutligen fixar vi att `lyfta ett undantag` om sökvägen inte finns.

```python
from pathlib import Path

def writeBookInfoOnFile(filename, book_info : list):
    """ writes the content in the list book_info on the file with the name contained in
        the variable filename
    """
    cwd = Path.cwd()
    abs_path = Path(cwd/'Articles'/'Books')
    if abs_path.exists():
        total_path = str(abs_path) + '/' + filename
        with open(str(total_path), "w") as filehandler:
            for item in book_info:
                filehandler.write(item  + '\n')
                    filehandler.write(item  + '\n')
    else:
        raise FileNotFoundError("Could not find " + str(abs_path))
        
#testkör        
writeBookInfoOnFile("Emil.txt", ['Astrid Lindgren', 'ISBN: 9789129729887', '229 SEK'])
```
För dig som vill veta lite mer ....
--------------------------------------

För att undersöka vilka kataloger resp filer som finns i en katalog kan vi använda funktioner som finns i Path, t.ex `iterdir()`
```python
...
path = Path('.')
for item in path.iterdir(): # itererar över innehållet i path, dvs katalogen 'Folder'
    print(item)
```
Här visas alla filer och kataloger som finns i aktuella katalogen.  
Men vi kan även selektera ut enbart kataloger genom att använda funktionen `is_dir()`

```python

for item in path.iterdir():
    if item.is_dir():
        print("Folder: " + str(item))
```
Här visas endast katalogerna. 
Vill vi istället selektera ut enbart filer använder vi funktionen `is_file()`

```python
...
for item in path.iterdir():
    if item.is_file():
        print("File: " + str(item))
```

Avslutningsvis {#avslutning}
--------------------------------------
Vi har i denna övning haft fokus på sökvägar, både relativa och absoluta. 

Alla kodexempel från denna övningen finns i kursrepot för [python-kursen](https://github.com/dbwebb-se/python/tree/master/example/flow).