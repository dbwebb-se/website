---
author: lew
revision:
    "2022-04-13": "(B, lew) Uppdatering inför HT22."
    "2020-06-23": "(A, lew) Första versionen."
...
Göra containern exekverbar
=======================

Intruktionerna *RUN*, *CMD* och *ENTRYPOINT* används för att exekvera någonting, ett kommando eller ett script. Containern blir med andra ord *exekverbar*. Korfattat är skillnaden att:

* RUN exekverar kommandon i nya lager och skapar en ny *image*.  
* CMD sätter default kommandon som kan skrivas över via `docker run ...`.  
* ENTRYPOINT används oftast för att konfigurera en exekverbar container.  

De olika instruktionerna kan skrivas på två olika sätt: *shell form* eller *exec form*.



### shell form {#shell}

`<instruction> <command>`

När vi använder shell form kommer kommandot exekveras i `/bin/sh -c`.

```
FROM ubuntu:24.04

RUN apt update

CMD echo "Hello dbwebb"

ENTRYPOINT echo "Hello dbwebb"
```



### exec form {#exec}

`<instruction> ["executable", "param1", "param2", ...]`

Den här formen är att föredra för CMD och ENTRYPOINT. Om vi inte specificerar ett shell med exec form kommer inget shell att användas då vi kallar på det exekverbara programmet direkt.

```
FROM ubuntu:24.04

RUN apt update

CMD ["/bin/echo", "Hello dbwebb"]

ENTRYPOINT ["/bin/echo", "Hello dbwebb"]
```

Vill vi använda till exempel bash som shell kan vi specificera det:

```
FROM ubuntu:24.04

RUN apt update

ENTRYPOINT ["/bin/bash", "-c", "echo Hello dbwebb"]
```



### Kombinerat {#combined}

Vi kan även kombinera formerna och via CMD ge parametrar till ENTRYPOINT.

```
FROM ubuntu:24.04

RUN apt update

ENTRYPOINT ["/bin/echo", "Hello"]

CMD ["dbwebb"]
```

Kör vi ovan så ser vi att CMD läggs till ENTRYPOINT:
```bash
$ docker run imagename
Hello dbwebb
```


Då CMD även är i exec form kan vi skriva över den via docker run-kommandot:

```bash
$ docker run imagename Kenneth
Hello Kenneth
```
