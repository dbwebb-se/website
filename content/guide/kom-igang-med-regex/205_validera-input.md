---
author: lew
revision:
    "2020-05-12": "(A, lew) Första versionen."
...
Validera input
=======================
<!--
read -n 1 = one is enough
read -s = silent
read -a array -->


```bash
re="^[0-9]+$"

read -r -p "Enter a digit: " digit

if [[ $digit =~ $re ]]
then
    echo "$digit is a digit."
else
    echo "$digit is NOT a digit."
fi
```

Det är operatorn `=~` som talar om att vi vill använda ett reguljärt uttryck. Den fungerar om vi använder *new test*: dubbla `[[`.

```
[[ string =~ pattern ]]
```

**[0-9]+** matchar som bekant enbart numeriska värden 0-9 samt en eller flera gånger.  
**^ och $** ser till så det enbart är numeriska tecken från början till slut.



Ibland får man upp en prompt som ber användaren välja y eller n till exempel:

```bash
Are you sure? [y/N]
```

I de flesta fall är det ena alternativet med versaler och är det alternativ som väljs om man bara trycker Enter. Koden bakom valideringen kan se ut så här:

```bash
re="^[yY]|yes$"

read -r -p "Are you sure [y/N]: " answer

[[ $answer =~ $re ]] || exit 0

# The rest of the code...

```

Här kan användaren skriva in *y*, *Y* eller ordet *yes*. Gör man inte det så avslutas programmet.
