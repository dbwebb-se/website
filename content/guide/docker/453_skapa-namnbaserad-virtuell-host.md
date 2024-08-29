---
author: lew
revision:
    "2020-03-11": "(A, lew) Första versionen."
...
Skapa en namnbaserad virtuell host {#namn}
-------------------------------------------

Vi skapar en struktur lokalt för att underlätta hanteringen. Kom ihåg hur mappningen sker i den virtuella hosten. Vi passar även på att skapa en .html-fil så vi kan visa upp något.

```console
$ mkdir vhosts
$ mkdir me.vlinux.se
$ touch me.vlinux.se/index.html
$ echo "<h1>It's working</h1>" > me.vlinux.se/index.html
$ touch vhosts/me.vlinux.se.conf
$ touch Dockerfile
```

Sedan är det dags att editera config-filen `vhosts/me.vlinux.se.conf`.


### Konfigurera den virtuella hosten {#config}

Vi fyller på filen med följande konfiguration, editera den så den blir din egna:

```html
<VirtualHost *:80>
    Define site me.vlinux.se
    Define path /var/www/vhosts

    ServerAdmin klw@dbwebb.se

    ServerName ${site}
    ServerAlias www.${site}

    DocumentRoot ${path}/${site}

    ErrorLog  ${path}/${site}/error.log
    CustomLog ${path}/${site}/access.log combined

    <Directory />
        Options Indexes FollowSymLinks
        AllowOverride All
        Order allow,deny
        Allow from all
        Require all granted
    </Directory>
</VirtualHost>

```



### Kopiera in och aktivera hosten {#copy-host}

Nu har vi en tom Dockerfile och en Apache2 configfil. Vi editerar Dockerfile och kopierar in configen till rätt plats:

```text
FROM ubuntu:24.04

RUN apt update && apt install -y apache2

COPY vhosts/me.vlinux.se.conf /etc/apache2/sites-available/me.vlinux.se.conf

RUN a2ensite me.vlinux.se.conf

RUN echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf

CMD apachectl -D FOREGROUND
```

Vi passar även på att aktivera den med kommandot `a2ensite` (add to enabled sites).

Nu bygger vi imagen: `$ docker build -t apachetest .`



### Starta containern {#start-container}

Låt säga att vi har byggt imagen med namnet "apachetest" med ovan Dockerfile.

Det som återstår nu är att snurra igång containern och ge servern något att visa. Vi behöver ange port, volym samt lägga till hosten i `/etc/hosts` inuti containern. Mycket att hålla reda på.

När vi bygger en Dockerimage har vi inte rättigheter att ändra i filen `/etc/hosts` i containern. Till vår hjälp har vi istället ett option vi kan köra antingen till `build`-kommandot eller `run`-kommandot:

```console
$ docker build --add-host <host:ip> ...
$ docker run --add-host <host:ip> ...
```

För att snurra igång containern och kunna visa våra filer blir hela run-kommandot då:

```console
$ docker run -it -p 8080:80 -v $(pwd)/me.vlinux.se:/var/www/vhosts/me.vlinux.se --add-host me.vlinux.se:127.0.0.1 apachetest
```

<!-- Det enda vi behöver göra nu för att kunna nå den utifrån containern är att lägga till `127.0.0.1    me.vlinux.se` i vår lokala hosts-fil. Var var den nu igen?

```text
Linux/MacOS: /etc/hosts
Windows: C:\Windows\system32\drivers\etc\hosts
``` -->
