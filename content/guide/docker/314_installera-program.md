---
author: lew
revision:
    "2022-04-13": "(B, lew) Uppdatering inför HT22."
    "2019-04-11": "(A, lew) Första versionen."
...
Installera program via Dockerfile
=======================

Vi vet att vi kan exekvera kommandon via instruktionen `RUN`. Vi använder det för att köra ytterligare kommandon i containern. Låt säga att vi vill installera *nano*, *cowsay*, *fortune* och *bsdmainutils* som används för `cal` kommandot.

```
FROM ubuntu:24.04

RUN apt update && \
    apt -y install nano \
    cowsay \
    fortune \
    bsdmainutils

WORKDIR scripts

COPY scripts/ .

RUN chmod +x ./*.bash
```

För att kunna installera fler program behöver vi först som bekant uppdatera pakethanterarens listor. Sedan är det bara att installera.
