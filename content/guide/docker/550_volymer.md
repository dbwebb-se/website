---
author: lew
revision:
    "2019-04-12": "(A, lew) Första versionen."
...
Volymer
=======================

Istället för att kopiera in datan och bygga om imagen varje gång vi ändrar något kan vi använda volymer. En lokal mapp kan då mappas mot en virtuell mapp inuti containern. Vi kikar på hur det ser ut med en enkel sida.


### Utgångsläge {#utgangslage}

Utgångsläget är att vi har en mapp med filerna som ska servas, `example-site/`. I den har vi en index-fil. Mappen `example-site/` ska mappas mot `/var/www/html/` i servern.



### Dockerfile {#dockerfile}

Dockerfilen kan se ut "som vanligt". Vi sköter volymen när vi kör containern.

Dockerfile:

```
FROM debian:buster-slim

RUN apt-get update && \
    apt-get install -y apache2

CMD apachectl -D FOREGROUND
```



### Bygga och köra {#build-n-run}

Nu har vi allt på plats för att bygga vår image...

```
$ docker build -t username/imagename:tag .
```

... och kör den med:

```
$ docker run -p 8083:80 -v $(pwd)/example-site/:/var/www/html/ username/imagename:tag
```

Flaggan -v talar om att vi vill använda volymer. Det sätts i formatet `källa:mål`.  
`$(pwd)` returnerar sökvägen till den mappen vi står i. Använder du Windows (cmd) kan du istället använda *%cd%* för att få fram sökvägen. Vi pekar sedan mappen `example-site/` mot den interna `/var/www/html/`.
