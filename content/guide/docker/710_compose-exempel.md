---
author: lew
revision:
    "2019-05-02": "(A, lew) Första versionen."
...
Exempel på en Compose-fil
=======================

Vi tar en hel del saker på en gång nu. Vi utgår från föregående kapitel, när vi skapade ett nätverk.



### Dockerfile {#dockerfile}

Vi har en server vars Dockerfil ser ut så här:

```
FROM debian:stretch-slim

RUN apt-get update && \
    apt-get -y install apache2

CMD apachectl -D FOREGROUND
```

Filstrukturen:
```
.
├── Dockerfile
└── html
    └── index.html

1 directory, 2 files
```

Containern startar vi med:
```
docker run --rm -it -p 8080:80 --name simple-server -v $(pwd)/html/:/var/www/html/ username/imagename:tag
```

Nu kan vi se innehållet i index.html i webbläsaren via `localhost:8080`.



### Compose {#compose}

Vi skapar nu en fil, `docker-compose.yml` och försöker mappa den mot run-kommandot ovan:

```
services:
    server:
        image: username/imagename:tag
        container_name: "simple-server"
        ports:
            - "8080:80"
        volumes:
            - "./html/:/var/www/html/"
        restart:
            "always"
```

Om vi hade behövt konfigurera den image vi utgår ifrån kan vi välja att bygga den via Docker Compose. Istället för `image: username/imagename:tag` hade vi kunnat använda *build*: `build: .`, där `.` representerar den aktuella mappen. Det krävs då en Dockerfile tillgänglig där.

Nåväl, istället för att behöva skriva långa run-kommandon kan vi nu starta containern med:

```
$ docker compose up
```

Vill vi köra servern i bakgrunden lägger vi på flaggan `-d`.

Vi går vidare och kikar på hur docker compose fungerar med nätverk.
