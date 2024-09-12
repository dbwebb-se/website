---
author: lew
revision:
    "2019-05-02": "(A, lew) Första versionen."
...
Compose och nätverk via ip-adress
=======================

Vi fortsätter med föregående exempel. Vi vill nu ha en container till som kan köra skript och använda curl för att nå servern via dess ip-adress. Vi kan själva bestämma ett subnät och tilldela ip-adresser. Det skapas automatiskt ett nätverk melan de services som vi start samtidigt med kommandot `$ docker compose up`, men för att vi ska se hur det går till, specificerar vi det själva. Vi börjar från slutet med filen docker-compose.yml. Fil strukturen ser nu ut så här:

```
.
├── client
│   ├── Dockerfile
│   └── myscript.bash
├── docker-compose.yml
└── server
    ├── docker-compose.yml
    ├── Dockerfile
    └── html
        └── index.html

3 directories, 6 files
```

Vi delar upp filerna så servern och klienten bor i varsin mapp med tillhörande Dockerfile.



### docker-compose-yml {#docker-compose}

Den färdiga compose-filen ser ut så här:

```
networks:
    dbwebb:
        ipam:
            driver: default
            config:
                - subnet: 172.28.0.0/16
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
                ipv4_address: 172.28.0.6
        restart:
            "always"
    client:
        image: username/imagename:tag
        container_name: "simple-client"
        networks:
            dbwebb:
        depends_on:
            - server
```

Först skapar vi nätverket *dbwebb*. Till det väljer vi default-drivern (bridge) och sätter ett subnät (subnet) där vi kan dela ut adresser.

Efter det kommer de olika *services* som ska köras. Servern har vi redan kikat på. Det som är ändrat är sökvägen till mappen `html/`, då vi utgår från en mapp högre upp. Vi kan göra inställningar för containern i nätverket under:
```
networks:
    dbwebb:
        ipv4_address: 172.28.0.6
```

Vi säger här att den ska tillhöra nätverket `dbwebb` och tilldelas ip-adressen 172.28.0.6.

Nästa service är klienten. Där räcker det med att vi talar om vilket nätverk den ska kopplas upp på.



### Skriptet {#skriptet}

Nu vet vi vilken ip-adress skriptet ska curla. Vi lägger till en rad i skriptet i mappen `client/`:

```bash
#!/usr/bin/env bash

curl 172.28.0.6
```

Vi skapar en Dockerfile i `client/`-mappen och fyller den med lite informaton:

```
FROM debian:stretch-slim

RUN apt-get update && \
    apt-get -y install curl

WORKDIR /script

COPY myscript.bash ./

CMD ["bash", "myscript.bash"]
```



### Starta olika services {#starta-sevices}

När vi har byggt våra images kan vi hoppa till docker-compose.yml. Det finns några tillhörande kommandon:

* `$ docker compose up` startar alla services som är definierade.
* `$ docker compose up <service>` startar upp den angivna services.
* `$ docker compose down` stänger ner alla services. Först stängs containrarna ned, sedan tas de bort och till sist tas nätverket bort. Mycket stiligt.
* `$ docker compose up -d <service>` startar services i bakgrunden.
* `$ docker compose up -d` startar alla services i bakgrunden.

Vi gör bäst i att köra servern i bakgrunden och sedan starta upp klienten:

```
$ docker compose up -d server
Creating network "compose_dbwebb" with the default driver
Creating simple-server ... done
```

Vi är åter i vår terminal och kan starta klienten. Servern ligger och snurrar i bakgrunden. Vi kan se den med `$ docker ps`. Nätverket får prefixet *mappnamn_*.

Nu kan vi sparka igång klienten:

```
$ docker compose up client
Recreating simple-client ... done
Attaching to simple-client
simple-client |   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
simple-client |                                  Dload  Upload   Total   Spent    Left  Speed
100   201  100   201    0     0   242k      0 --:--:-- --:--:-- --:--:--  196k
simple-client | <!doctype html>
simple-client | <html lang="sv">
simple-client | <head>
simple-client |     <meta charset="utf-8">
simple-client |     <title>Started with docker-compose</title>
simple-client | </head>
simple-client | <body>
simple-client |     <h1>Hello! I am started with docker compose up</h1>
simple-client | </body>
simple-client | </html>
simple-client exited with code 0
```

Allt fungerar och när vi stänger ned, görs det snyggt och prydligt:

```
$ docker compose down
Stopping simple-server ... done
Removing simple-client ... done
Removing simple-server ... done
Removing network compose_dbwebb
```

Gå vidare för att se hur vi kan jobba med namngivning istället för ip-adresser.
