---
author:
    - lew
category:
    - unix
    - linux
    - regex
revision:
    "2023-09-12": (B, lew) Uppdaterad inför HT23.
    "2021-04-12": (A, lew) Skapad inför HT2021.
...

Text processering {#intro}
=======================================================

Då vi jobbar i terminalen på kommandoraden behöver vi lära oss verktyg för att hantera textmassor. En textmassa kan vara från en fil, inmatning från en användare eller resultatet av ett exekverat kommando. De verktygen vi ska titta på är:

* Grep
* Sed
* Awk

På ytan kan man tycka att de gör samma sak, men de har trots det olika användingsområden och skiljer sig åt rejält. För att förenkla kan vi lära oss några grundskillnader:

**Grep** fungerar bäst vid enkla, snabba matchningar och filtreringar. **Sed** briljerar när vi dessutom vill manipulera datan med grupper eller "substitution". **Awk** är ett helt programmeringsspråk och har helt andra möjligheter än de tidigare två, speciellt med tabulär data från tex en .csv fil. Många kommandon ger oss även ett resultat i formatet med rader och kolumner, tex `ls` och `top`.

I den här artikeln tas det upp Grep och Sed. Awk är mer omfattande och har en egen plats i [guiden](https://dbwebb.se/guide/kom-igang-med-awk). Alla verktygen hanterar reguljära uttryck (regex). Vi tar det ett steg i taget och blandar in det när vi kommer till Sed.



Grep {#grep}
-------------------

Grep är ett verktyg som låter oss snabbt och relativt enkelt söka i textmassor. Vi använder grep på kommandoraden och det används oftast i slutändan av en "pipe" `|` för att filtrera ett resultat av ett annat kommando.

Syntaxen för grep är:

```
grep [OPTIONS] PATTERN [FILE...]
```

PATTERN är ett reguljärt uttryck som vi ska kika på senare i kursen. För att vända på det kan vi trigga det med:

```
command | grep [OPTIONS] PATTERN
```

Grep är inte ett avancerat kommando, inte på den nivån vi ska använda det i alla fall.

Vi behöver ett utgångsläge och vi kan använda [presidents.txt](https://github.com/dbwebb-se/vlinux/blob/master/example/grep/presidents.txt) i exempelmappen. Som vanligt tittar vi även i manualen om vi behöver: `$ man grep`.



### Exempel {#grep-example}

Vi tittar på hur vi enklast kör grep.

```
$ cat presidents.txt | grep "alk"
George Herbert Walker Bush, 1989-1993
George Walker Bush, 2001-2009
```

Vi kan se att vi enbart får se dem som har substrängen "alk" i raden. Grep jobbar med andra ord rad för rad och ger tillbaka det som matchar ditt så kallade *pattern*.



### Före/Efter {#before-after}

Med ett enkelt option kan vi styra vad vi får för resultat. Vi använder **-B**efore eller **-A**fter. Låt säga att vi vill veta vem som var president innan Harry S. Truman:

```
$ cat presidents.txt | grep "Harry S. Truman" -B 1
Franklin Delano Roosevelt, 1933-1945
Harry S. Truman, 1945-1953
```

Här ser vi att vi med `-B [NUM]` kan få vårt resultat och [NUM] rader före det. På samma sätt kan vi få reda på vem som till exempel vilka Thomas Jefferson's tre efterföljare var:

```
$ grep "Thomas Jefferson" -A 3 presidents.txt
Thomas Jefferson, 1801-1809
James Madison, 1809-1817
James Monroe, 1817-1825
John Quincy Adams, 1825-1829
```



### Invertering {#invert}

Ibland vet man vad man inte vill ha med. Vi kan då invertera matchningen med `-v`. Vi vet att vi inte vill ha med presidenter som har bokstäverna `u,s,a` i namnet:

```
$ grep -v "[usa]" presidents.txt
John Tyler, 1841-1845
Joe Biden, 2021-
```

Där fick vi se lite regex och en så kallad "character class" `[]`. Uttrycket säger att matchningen ska gälla alla bokstäverna inne i hakparentesen.

Grep är mycket mer än vad vi sett men vi stannar här i denna kursen. Det fungerar utmärkt att filtrera kommandon som till exempel `ls` eller `top`. Vi kan som vi såg även blanda in mer reguljära uttryck i vårt PATTERN.



Sed {#sed}
-----------------------

Sed är en *Stream Editor* som kan söka efter, matcha, gruppera och byta ut strängar från en ström med text. Sed jobbar med options och flaggor, vilka vi ska titta mer på. Det som gör Sed till ett kraftfullare verktyg än tex Grep är möjligheten att jobba med "substitution" och att kunna editera direkt i filer, "inplace". Vi blandar även in lite reguljära uttryck.

I de exempel som nu följer så används en textfil, `courses.txt` med innehållet:

```
Kenneth Lewenhagen is the teacher in the course VLinux (DV1611).
Andreas Arnesson is the teacher in the course OOPython (DV1437).
Emil Folino is the teacher in the course Webbapp (DV1609).
Mikael Roos is the teacher in the course OOPHP (DV1608).
```

Vi kan använda filen på följande sätt: `sed command courses.txt`. Vill du testa själv finns filen i [exempelmappen](https://github.com/dbwebb-se/vlinux/blob/master/example/sed/courses.txt).

[INFO]Vi kan använda ett option, -E, när vi arbetar med `sed` för att slippa escapa backslashes och vissa andra speciella karaktärer.[/INFO]



### Versioner av sed {#sed-versions}

Sed bör vara installerat per default. Det finns dock olika versioner av programmet och den vi ska använda är GNU's version. I skrivande stund utgår guiden från:

```
$ sed --version
sed (GNU sed) 4.8
...
```



### Matchning av sträng/siffror {#matching-101}

Vi har [textfilen](https://github.com/dbwebb-se/vlinux/blob/master/example/sed/courses.txt) att utgå ifrån.

*Tips: Kopiera gärna in texten och uttrycket i [https://regex101.com/](https://regex101.com/) så ser du hur det fungerar.*

Låt säga att vi vill ha tag i informationen om kursen `OOPython`:
```
$ sed '/OOPython/p' < courses.txt
Kenneth Lewenhagen is the teacher in the course VLinux (DV1611).
Andreas Arnesson is the teacher in the course OOPython (DV1437).
Andreas Arnesson is the teacher in the course OOPython (DV1437).
Emil Folino is the teacher in the course Webbapp (DV1609).
Mikael Roos is the teacher in the course OOPHP (DV1608).
```

Oj då, nu fick vi alla raderna samt en av dem två gånger...

Vi bryter ned händelserna:

**/OOPython/** mathar all text som är exakt *OOPython*.  
**p** är en flagga (kommando) som talar om att vi vill skriva ut resultatet.

Sed jobbar rad för rad och skriver automatiskt ut alla processerade rader. Vi provar lägga till flaggan `-n`, som stänger av det beteendet:

```
$ sed -n '/OOPython/p' < courses.txt
Andreas Arnesson is the teacher in the course OOPython (DV1437).
```

Det såg bättre ut. Om vi inte hade vetat vad kursen heter då? Vi blandar in *character classes*. Vi provar exempelfilen igen och kursen hette något med `OOP...`:

```
$ sed -n '/OOP[a-z]\+/p' < courses.txt
Andreas Arnesson is the teacher in the course OOPython (DV1437).
```

Snyggt! Notera att vi behövde escapa +-tecknet. För att slippa det kan vi använda ett option, -E vilket slår på *extended regular expressions*:

```
$ sed -E -n '/OOP[a-z]+/p' < courses.txt
Andreas Arnesson is the teacher in the course OOPython (DV1437).
```

Nu händer följande:

**OOP** matchar alla rader med ordet OOP.  
**[a-z]** matchar alla små bokstäver, med andra ord `ython` och inte `HP`, vilket var Mikaels kurs.  
**+** talar om att det ska finnas en eller flera bokstäver i följd.

Om vi hade velat ha med Mikaels kurs kan vi ändra lite vid hakparenteserna för att matcha båda:

```
$ sed -E -n '/OOP[a-zA-Z]+/p' < courses.txt
Andreas Arnesson is the teacher in the course OOPython (DV1437).
Mikael Roos is the teacher in the course OOPHP (DV1608).
```



### Substitution {#sub}

Ett viktigt kommando i sed är "s"-kommandot (*substitution*). Det möjliggör att vi kan byta ut matchningen mot något annat, antingen ren text eller en hel grupp. Vi tar och kikar på hur det kan se ut. Strukturen för kommandot är:

```
's/regexp/replacement/flags'
```

Vi kikar på hur vi kan ändra på informationen i filen med hjälp av substitution. Vi tänker oss att kurskoderna ska bytas ut och under tiden behöver vi ta bort de som finns. Vi byter ut dem mot "not available":

```
$ sed -E -n 's/[A-Z]+[0-9]{4}/not available/p' < courses.txt
Kenneth Lewenhagen is the teacher in the course VLinux (not available).
Andreas Arnesson is the teacher in the course OOPython (not available).
Emil Folino is the teacher in the course Webapp (not available).
Mikael Roos is the teacher in the course OOPHP (not available).
```

Vi matchar enbart kurskoden och byter ut den mot "not available".

**s/** talar om att vi vill använda *substitution*.  
**/not available/** är den andra delen av uttrycket, kallat *replacement*. Vi byter ut matchningen mot detta.


Än mer kraftfullt blir det om vi blandar in grupper i mixen.



### Grupper {#grupper}

För att markera en grupp använder vi parenteser runt matchningen, `(...)`. Vi kan återanvända en grupp med `\1`, `\2` etc. Låt säga att vi vill få tag på namnet på den person som har kursen Webapp tillsammans med kurskoden:

```
$ sed -E -n 's/(^[a-zA-Z]+\s[a-zA-Z]+).*Webapp.*([A-Z]{2}[0-9]{4}).*/\1 \2/p' < courses.txt
Emil Folino DV1609
```

Nu blev det rörigt! Vi tar det bit för bit så klarnar det:

**(^[a-zA-Z]+\s[a-zA-Z]+)**: Parenteserna talar om att det ska vara en grupp.  
Insättningstecknet ^ (moroten) markerar början på raden.  
Sedan följer en karaktärsklass som fångar alla bokstäver följt av ett plus (+) då vi vill att det ska upprepas minst en gång.   Sedan kommer ett mellanslag (\\s) följt av en karaktärsklass till.  
Nästa plustecken tar alla bokstäver fram till något annat dyker upp, som till exempel ett mellanslag. Detta blir grupp 1 (namnet).  
**.\*Webapp.\***: Konstruktionen .\* matchar vilket tecken som helst, noll eller flera gånger fram till ordet *Webapp*. Sedan tar vi allt som kommer i vår väg igen.  
**([A-Z]{2}[0-9]{4}).\***: Vi vet hur en kurskod ser ut så vi stannar inte förrän vi kommer till den andra gruppen. Kurskoden är två stora bokstäver följt av 4 siffror. Måsvingarna, `{2}`, talar om att det som sker i karaktärsklassen ska matchas 2 gånger följt av 4 siffror. Där stänger vi gruppen och plockar resten av raden med `.*`.  
**/\1 \2/**: Den andra delen av uttrycket är delen som talar om vad som ska ersätta matchningen. Nu har vi ju fångat upp de grupper som vi vill återanvända så vi petar in dem där.



Avslutningsvis {#avslutning}
------------------------------
