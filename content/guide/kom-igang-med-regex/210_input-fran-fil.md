---
author: lew
revision:
    "2020-05-12": "(A, lew) Första versionen."
...
Input från fil
=======================

Ibland vill vi ju använda en fil istället. I exemplet nedan har vi en fil med en massa bilmärken, listade en per rad. Filen kan du hitta i [exempelmappen](https://github.com/dbwebb-se/vlinux/blob/master/example/regex/cars.txt).


```bash
filename="cars.txt"
re="^[C-E].*$"
IFS=$'\n'

for car in $(< "$filename"); do
    [[ $car =~ $re ]] && echo "$car"
done
```

Ovan matchar vi de bilar som börjar på C, D eller E. Då bilarna kan ha namn separerade med space sätter vi IFS till endast nyrad.

För att slippa ändraIFS fär hela omgivningen kan vi strukturera om koden så vi endast ändrar IFS för `read` kommandot:

```bash
filename="cars.txt"
re="^[C-E].*$"

while IFS=$'\n' read -r car; do
    [[ $car =~ $re ]] && echo "$car"
done < $filename
```
