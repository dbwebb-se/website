---
author: lew
revision:
    "2020-05-12": "(A, lew) First version."
...
Input from file
=======================

Sometimes we want to use a file instead. In the example below we have a file with a lot of car brands, listed one per line. You can find the file in [examplefolder](https://github.com/dbwebb-se/vlinux/blob/master/example/regex/cars.txt).


```bash
filename="cars.txt"
re="^[C-E].*$"
IFS=$'\n'

for car in $(< "$filename"); do
    [[ $car =~ $re ]] && echo "$car"
done
```

Above we match the cars that start with C, D or E. Since the cars can have names separated by space, we set IFS to newline.

To avoid changing IFS in the entire environment, we can restructure the code so that we only change IFS for the `read` command:

```bash
filename="cars.txt"
re="^[C-E].*$"

while IFS=$'\n' read -r car; do
    [[ $car =~ $re ]] && echo "$car"
done < $filename
```
