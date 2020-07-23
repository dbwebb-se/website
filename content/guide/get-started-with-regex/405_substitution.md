---
author: lew
revision:
    "2019-08-20": "(A, lew) First edition."
...
Substitution {#sub}
=======================

We take a look at how we can change the information in the file using substitution. We intend for the course codes to be replaced and in the meantime we need to remove the existing ones. We replace them with "not available":

```
$ sed -E -n 's/[A-Z]+[0-9]{4}/not available/p' < courses.txt
Kenneth Lewenhagen is the teacher in the course VLinux (not available).
Andreas Arnesson is the teacher in the course OOPython (not available).
Emil Folino is the teacher in the course Webapp (not available).
Mikael Roos is the teacher in the course OOPHP (not available).
```

We only match the course code and replace it with "not available".

**s/** indicates that we want to use *substitution*.  
**/not available/** is the second part of the expression, called *replacement*. We replace the match with this.


It becomes even more powerful if we throw groups into the mix.
