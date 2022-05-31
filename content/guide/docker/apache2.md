---
author: lew
revision:
    "2022-05-11": "(B, lew) Uppdatering inför HT22."
    "2019-03-14": "(A, lew) Första versionen."
...
Apache2
=======================

Vi har redan sett hur vi installerar Apache i Ubuntu. För att få igång det i Docker via en Dockerfile gör vi i stort sett likadant, fast med hjälp av kommandot `RUN`.



### Installera Apache2 {#install-apache2}

Vi börjar med att kika på hur vi installerar Apache.

```
FROM ubuntu:22.04

RUN apt-get update && \
    apt-get -y install apache2

CMD apachectl -D FOREGROUND
```

Med nyckelordet `CMD` talar vi om vilket kommando som ska köras vid uppstart. I detta fallet vill vi starta servern.

Vi bygger imagen med `$ docker build -t username/imagename:tag .`.

Vi kan i `docker run`-kommandot specificera vilken port vi vill mappa mot Apache:

`$ docker run --rm -it -p 8080:80 username/imagename:tag`

Här talar vi om att vi vill mappa den lokala porten 8080 till containerns port 80, vilket är default för webbservern. Om det enbart hade varit en annan Docker-container som behövt access till servern hade vi kunnat skippa flaggan -p i `docker run`-kommandot och använt `EXPOSE 80` i Docker-filen istället. Men vi vill ju kunna nå den via webbläsaren och behöver då använda flaggan.

Vi har dock inga filer att visa eller tillgång till några. Vi tittar på hur vi kan skicka in våra egna filer på olika sätt.



### Apache's default mapp {#apache-default-mapp}

Som bekant servar Apache filerna från `/var/www/html/`. Om vi inte vill ändra i konfigurationsfilen kan vi enbart lägga vår kod i den mappen, förutsatt att vi har mappen `example-site` lokalt:

```
FROM ubuntu:22.04

RUN apt-get update && \
    apt-get -y install apache2

COPY example-site/ /var/www/html/

CMD apachectl -D FOREGROUND
```

Nu når vi sidan i webbläsaren med `localhost:8080`.



### Config-fil {#config-file}

I början av kursen jobbade vi med Apache's konfigurationsfil. Ett alternativ är att ha den lokalt och sedan byta ut den mot den vi utgick från när vi gjorde detta i VirtualBox, `000-default.conf`. Ibland räcker inte Apache's egna fil, utan vi vill såklart ha kontroll över den själva.

I exempelmappen finns en mall för en [konfigurationsfil](https://github.com/dbwebb-se/vlinux/blob/master/example/apache/config-template.conf). Det förutsätts även att du har en lokal mapp med samma namn som den definierade `site`-variabeln, där någon index.html-fil finns.


Dockerfile:

```
FROM ubuntu:22.04

RUN apt-get update && \
    apt-get -y install apache2

COPY example-site/ /var/www/html/
COPY ./example-site.conf /etc/apache2/sites-enabled/000-default.conf

CMD apachectl -D FOREGROUND
```

Här kopierar vi först in vår kod och lägger den i default-mappen, där Apache automatiskt servar sina filer. Sedan kopierar vi in vår egna konfigfil och byter ut konfigurationsfilen som Apache skapat, rakt in i `sites-enabled/`.



### Bygga och köra {#build-n-run}

Nu har vi allt på plats för att bygga vår image...

`$ docker build -t username/imagename:tag .`

...och köra den:

`$ docker run --rm -p 8080:80 username/imagename:tag`

Nu kan vi peka webbläsaren mot `localhost:8080`.
