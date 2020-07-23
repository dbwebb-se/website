---
author: lew
revision:
    "2019-04-11": "(A, lew) Första versionen."
...
Installera program
=======================

Vi vet att vi kan exekvera kommandon via instruktionen `RUN`. Vi använder det för att köra ytterligare kommandon i containern. Låt säga att vi vill installera *nano*, *cowsay* och *fortune*.

```
FROM debian:buster-slim

RUN apt-get update && \
    apt-get -y install nano \
    cowsay \
    fortune

WORKDIR scripts

COPY scripts/ /scripts/

RUN chmod +x /scripts/*.bash
```

För att kunna installera fler program behöver vi först uppdatera pakethanterarens listor. Sedan är det bara att installera.
