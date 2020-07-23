---
author: lew
revision:
    "2019-03-08": "(A, lew) Första versionen."
...
Matchning {#matching}
=======================

Vi tittar på några exempel på hur vi kan använda sed.



### Matchning av sträng/siffror {#matching-101}

Vi har [textfilen](https://github.com/dbwebb-se/vlinux/blob/master/example/sed/courses.txt) att utgå ifrån.

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

Det såg bättre ut. Om vi inte hade vetat vad kursen heter då? Vi kikar på *character classes*.



### Character classes {#char-class}

En character class definieras av hakparenteser, `[...]`. I dem kan vi bestämma vilka bokstäver som ska matchas.

**[a-z]** matchar alla små bokstäver mellan a och z.  
**[A-Z]** matchar alla stora bokstäver mellan A och Z.  
**[a-zA-Z]** matchar alla bokstäver, stora som små.  
**[a-g]** matchar alla små bokstäver mellan a och g.  
**[0-9]** matchar alla siffor mellan 0 och 9.  
**[3-5]** matchar alla siffor mellan 3 och 5.  
**[exmpl]** matchar någon av bokstäverna definierade.

Vi provar exempelfilen igen. Kursen hette något med `OOP...`:

```
$ sed -n '/OOP[a-z]\+/p' < courses.txt
Andreas Arnesson is the teacher in the course OOPython (DV1437).
```

*Tips: Kopiera gärna in texten och uttrycket i [https://regex101.com/](https://regex101.com/) så ser du hur det fungerar.*

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
