---
author: lew
revision:
    "2020-05-12": "(A, lew) First version."
...
Validate input
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

It is the operator `=~` which says that we want to use a regular expression. It will work if we use *new test*: double `[[`.

```
[[ string =~ pattern ]]
```

**[0-9]+** only matches numeric values ​​0-9, one or more times.  
**^ and $** makes sure that there are only numeric characters from *beginning* to *end*.



Sometimes you get a prompt asking the user to choose y or n for example:

```bash
Are you sure? [y/N]
```

In most cases, one of the options is uppercase and is the option that is selected if you just press Enter. The code behind the validation may look like this:

```bash
re="^[yY]|yes$"

read -r -p "Are you sure [y/N]: " answer

[[ $answer =~ $re ]] || exit 0

# The rest of the code...

```

Here the user can enter *y*, *y* or the word *yes*. If you do not do this, the program ends.
