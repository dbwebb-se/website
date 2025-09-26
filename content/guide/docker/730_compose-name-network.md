---
author: lew
revision:
    "2019-05-02": "(A, lew) Första versionen."
...
Compose och nätverk via namngivning
=======================

Vi kan återigen slippa krångla med ip-adresser. Vi kan i compose-filen länka till en annan service. Vi tar bort en del från "network" och lägger till en länk under klienten:

```
networks:
    dbwebb:
services:
    server:
        image: username/imagename:tag
        container_name: "simple-server"
        ports:
            - "8080:80"
        volumes:
            - "./server/html/:/var/www/html/"
        networks:
            dbwebb:
        restart:
            "always"
    client:
        image: username/imagename:tag
        container_name: "simple-client"
        networks:
            dbwebb:
       # links: # Could be deprecated
       #     - server:myserver
```



[INFO]
Nedan kan vara utdaterat...

```
links:
    - server:myserver
```

Här talar vi om att servicen "server" ska vara nåbar via namnet "myserver". Nu uppdaterar vi skriptet och kör `curl myserver` och bygger om imagen.
[/INFO]

Nu kan vi starta som vanligt med:

```
$ docker compose up -d server
...
$ docker compose up client
...
$ docker compose down
...
```
