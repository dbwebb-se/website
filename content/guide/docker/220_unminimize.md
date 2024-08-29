---
author: lew
revision:
    "2022-04-12": "(B, lew) Uppdatering inför HT22."
    "2019-03-14": "(A, lew) Första versionen."
...
unminimize {#unminimize}
=======================

En image kommer som oftast så nedbantad den kan vara för att spara på diskutrymme. Tanken är ju att det ska vara så kompakt som möjligt och enbart innehålla det som behövs. När vi laddar ner imagen, i vårt fall `ubuntu:24.04` är den väldigt liten, ca 70mb. Den innehåller till exempel ingenting som en användare behöver då grundtanken inte är att man ska logga in med olika användare. Vi vill dock kunna använda delar som "manualen" (`man`). Vi kan köra ett kommando som packar upp imagen och installerar de delar som behövs:

```console
$ unminimize
```

En kort beskrivning av scriptet:

> This script restores content and packages that are found on a default
Ubuntu server system in order to make this system more suitable for
interactive use.


Nu ska vi först uppdatera paketlistorna innan vi kan installera något program.

```console
$ apt update
```

När det är klart installerar vi med kommandot:

```console
$ apt install man
```
