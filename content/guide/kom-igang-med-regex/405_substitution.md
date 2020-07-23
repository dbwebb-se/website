---
author: lew
revision:
    "2019-03-08": "(A, lew) Första versionen."
...
Substitution {#sub}
=======================

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
