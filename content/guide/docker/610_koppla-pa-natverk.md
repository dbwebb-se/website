---
author: lew
revision:
    "2019-04-30": "(A, lew) Första versionen."
...
Använda nätverket
=======================

Vi har ett nu ett "eget" nätverk att använda. Hur gör vi då för att använda det och koppla på en container?



### En server {#en-server}

Om vi utgår från att vi har en container med en webbserver som lyssnar på porten 1337 kan vi ansluta den på följande sätt:

```
$ docker run --rm -p 8080:1337 --name myserver --net dbwebb username/imagename:tag
```

Vi kan med fördel använda *--name* och ge containern ett namn. Vi kopplar på containern med *--net* följt av nätverkets namn. När vi ansluter en till container kommer den kunna använda porten 1337, men för att kunna nå servern via webbläsaren behöver vi mappa en port i run-kommandot.

Vi kan nu nå servern via webbläsaren på `localhost:8080`.

Om vi enbart hade behövt att nå servern via en annan container hade vi kunnat använda `EXPOSE 1337` i Dockerfile.



### En klient via ip-adress {#en-klient-via-ip}

Vi kikar på hur vi ansluter en container till som använder servern via dess ip-adress.

Vi utgår från ett enkelt Bash-skript som kopieras in i en container. Bash-skriptet gör en [curl](https://curl.haxx.se/) till servern. Dockerfilen för klienten ser ut på följande sätt:

```
FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y curl

WORKDIR /client

COPY client.bash ./

RUN ["bash"]
```

Vi tar reda på vilken ip-adress servern har i nätverket:

```
$ docker network inspect dbwebb
...
"ConfigOnly": false,
    "Containers": {
        "16a2df5ea236e1a24e4401f6e0b6729ff42d22f144468446ce69c154fbc707a1": {
            "Name": "myserver",
            "EndpointID": "dc35212bf7116d01dcb9f25452b5f7201b50409fc01d17914d0942295a18b006",
            "MacAddress": "02:42:ac:13:00:02",
            "IPv4Address": "172.19.0.2/16",
            "IPv6Address": ""
        }
    },

...
```

Under nyckeln *Containers* kan vi se vilka containrar som är anslutna och vilken ip-adress de fått tilldelade, i detta fallet har servern 172.19.0.2.

Vi lägger raden `curl 172.19.0.2:1337` i Bash-skriptet och bygger den. Vi startar den sedan med:

```
$ docker run -it --name myclient --net dbwebb username/imagename:tag
```

Nu kan vi köra skriptet i containern `root@bb207ef41364:/client# ./client.bash` och nå servern.



### En klient via namn {#en-klient-via-namn}

Det kan vara lite pilligt att hålla på med ip-adresser hit och dit. Vi har ju namn på containrarna så vi bör ju kunna använda dem istället? Svaret är ja, självklart! Vi kör samma utgångsläge som innan men backar lite.

Vi uppdaterar Bash-skriptet och byter ut ip-adressen till `curl server:1337` där *server* är det tänkta namnet på containern. Vi bygger om imagen och i klientens `docker run`-kommando lägger vi till ett option:

```
$ docker run -it --name myclient --net dbwebb username/imagename:tag
```

