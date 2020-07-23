---
author: lew
revision:
    "2019-08-20": "(A, lew) First edition."
...
Matching {#matching}
=======================

We look at some examples of how we can use sed.



### Matching of strings/numbers {#matching-101}

We got the [textfile](https://github.com/dbwebb-se/vlinux/blob/master/example/sed/courses.txt) to begin with.

Let us say we want to get the information about the course `OOPython`:
```
$ sed '/OOPython/p' < courses.txt
Kenneth Lewenhagen is the teacher in the course VLinux (DV1611).
Andreas Arnesson is the teacher in the course OOPython (DV1437).
Andreas Arnesson is the teacher in the course OOPython (DV1437).
Emil Folino is the teacher in the course Webbapp (DV1609).
Mikael Roos is the teacher in the course OOPHP (DV1608).
```

Oh well, now we got all the lines and one of them twice...

We break down the events:

**/OOPython/** matches all text that is exactly *OOPython*.  
**p** is a flag (command) that tells the program we want to print the result.

Sed works line by line and automatically prints all processed lines. We try the flag `-n`, that disables that behaviour:

```
$ sed -n '/OOPython/p' < courses.txt
Andreas Arnesson is the teacher in the course OOPython (DV1437).
```

That is better. If we had not known what the course is called then? We take a look at *character classes*.



### Character classes {#char-class}

A character class is defined by brackets, `[...]`. Inside them, we can decide which letter should be matched.

**[a-z]** matches all lowercase letters between a and z.  
**[A-Z]** matches all capital letters between A and Z.  
**[a-zA-Z]** matches all letters, capital and lowercase.  
**[a-g]** matches all lowercase letters between a and g.  
**[0-9]** matches all digits between 0 and 9.  
**[3-5]** matches all digits between 3 and 5.  
**[exmpl]** matches any of the defined letters.

We will try the sample file again. The course was called something like `OOP ...`:

```
$ sed -n '/OOP[a-z]\+/p' < courses.txt
Andreas Arnesson is the teacher in the course OOPython (DV1437).
```

*Tip: Copy the text and regex into [https://regex101.com/](https://regex101.com/) to see how it works.*

Nice! Note that we had to escape the plus-sign (+). To avoid this we can use an option, -E which turns on *extended regular expressions*:

```
$ sed -E -n '/OOP[a-z]+/p' < courses.txt
Andreas Arnesson is the teacher in the course OOPython (DV1437).
```

Now the following happens:

**OOP** matches all lines with the word OOP.  
**[a-z]** matches all lowercase letters, in other words `ython` and not `HP`, which was Mikael's course.  
**+** indicates that there must be one or more letters in a row.

If we had wanted Mikael's course, we can change the brackets a little to match both:

```
$ sed -E -n '/OOP[a-zA-Z]+/p' < courses.txt
Andreas Arnesson is the teacher in the course OOPython (DV1437).
Mikael Roos is the teacher in the course OOPHP (DV1608).
```
