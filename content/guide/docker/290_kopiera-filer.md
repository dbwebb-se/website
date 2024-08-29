---
author: lew
revision:
    "2022-04-13": "(A, lew) Ny inför HT22."
...
Kopiera filer till/från containern
===================================

För att vi ska kunna få tag på filerna vi skapar så kan vi kopiera filer och mappar hårddisken och en startad container.

Det enda vi behöver är containerns id.

```bash
$ docker ps
CONTAINER ID   IMAGE                   COMMAND                  CREATED         STATUS         PORTS                     NAMES
5490e0ab02da   ubuntu:24.04            "bash"                   9 seconds ago   Up 8 seconds                             nostalgic_mccarthy
```


### Kopiera från containern {#copy-from}

Om vi till exempel har en fil i mappen `/myfolder/myfile.txt` så kan vi köra kommandot:

```console
$ docker cp 5490e0ab02da:/myfolder/myfile.txt .
```

`:` markerar att vi börjar sökvägen inuti containern. `.` är som bekant den nuvarande mappen vi står i så filen kommer lägga sig där vi står när vi kör kommandot.


### Kopiera till containern {#copy-to}

För att kopiera in till containern vänder vi bara på kommandot:

```console
$ docker cp myfile.txt 5490e0ab02da:/myfolder/
```
