---
author: lew
category: linux
revision:
  "2022-05-09": (A, lew) Första utgåvan inför kursen vlinux ht22.
...

[INFO]
Notera att den här artikeln ska du enbart läsa igenom. Du behöver inte installera Apache2 lokalt på din maskin, utan det gör du senare i Docker.
[/INFO]

# Kom igång med Apache

Apache är en webbserver utvecklad av Apache Software Foundation. Apache har funnits med sedan 1995 och är en av världens mest använda webbservermjukvaror för webbinnehåll via HTTP.

<!-- more -->

### Installera Apache {#install}

Vi behöver webbservern Apache. Så här installerar du Apache och testar att det fungerar. Om du installerar som rootanvändare behöver du inte använda `sudo`. Det gäller genomgående genom artikeln.

```console
$ sudo apt install apache2
$ sudo apachectl start
$ sudo apachectl status
```

`apachectl` är en frontend för att administrera servern. Via den kan vi bland annat starta, stoppa och se status.

Apache sparar sina loggfiler i `/var/log/apache2`. I filen `access.log` loggas varje _request_ till webbplatsen. I filen `error.log` loggas felaktigheter, till exempel om något i en configurationsfil gör så att servern inte kan startas.

Du kan starta ett kommando `tail -f` som skriver ut saker som hamnar i slutet av en loggfil. Det kan vara ett bra sätt att kolla om något skrivs till loggen. För att titta i loggfilerna så måste man vara root. Så här man kan skriva för att logga innehåll som skrivs till filen `error.log`.

```bash
$ sudo tail -f /var/log/apache2/error.log
```

I standardinstallationen så lägger Apache sina configfiler i `/etc/apache2/` och webrooten ligger i `/var/www/html/`. Om du vill testa att lägga till en ny sida så gör du det. Det är alltid bra att känna att man har kontroll på saker och ting.

### Eventuella warningar och fel {#warnings}

När du kör `$ apachectl start` kan du få varningen:

```console
AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
```

Vi kan sätta variabeln `ServerName` globalt så slipper vi se varningen. Editera filen `/etc/apache2/apache2.conf`:

```console
$ sudo nano /etc/apache2/apache2.conf
```

Gå längst ner i filen och lägg till följande:

```console
ServerName 127.0.0.1
```

Ipadressen pekar på `localhost`.

När du kör `$ apachectl status` kan du stöta på felet:

```console
/usr/sbin/apachectl: 113: www-browser: not found
'www-browser -dump http://localhost:80/server-status' failed.
Maybe you need to install a package providing www-browser or you
need to adjust the APACHE_LYNX variable in /etc/apache2/envvars
```

Det handlar om att det inte finns en webbläsare för terminalen installerad. Det finns flera att välja mellan men någon av följande fungerar:

```console
$ apt install w3m
# Alternativt:
$ apt install lynx
```

Nu kan Apache göra en "http request" till den lokala webbservern och visa status med kommandot `$ apachectl status`.

Om du nu har möjlighet att nå `localhost` kan du se default filerna som webbservern skapat i mappen `/var/www/html`.

### Skapa en namnbaserad virtuell host {#vh}

Låt oss nu skapa en Apache Name-based Virtual Host. Ponera att vi har en kund och vi skall skapa deras webbplats vlinux.dbwebb.se. Men, vi vill först testa den i vår egen utvecklingsmiljö, genom att köra samma domän via en namnbaserad virtuell host i Apache.

Det finns en katalog `/etc/apache2/sites-available` där man lägger configfilerna för de virtuella hostar man har. Sedan _enablar_ man de virtuella hostar som Apache skall använda. Då länkas filerna i katalogen `sites-enabled`.

I katalogen `sites-available` ligger en configfil som man kan utgå ifrån. Den brukar heta `000-default.conf`.

Följ dessa steg för att "enabla" en virtuell namnbaserad host för `vlinux.dbwebb.se`. Jag använder nano som editor.

```bash
$ cd /etc/apache2/sites-available
$ sudo cp 000-default.conf vlinux.dbwebb.se.conf
$ sudo nano vlinux.dbwebb.se.conf
```

Den färdiga filen `vlinux.dbwebb.se.conf` kan se ut så här. Du kan behöva ändra sökvägarna så de passar till ditt system.

```html
<VirtualHost *:80>
    ServerAdmin klw@vlinux.dbwebb.se

    ServerName vlinux.dbwebb.se
    ServerAlias www.vlinux.dbwebb.se

    DocumentRoot /var/www/vhosts/vlinux.dbwebb.se/

    ErrorLog  /var/www/vhosts/linux.dbwebb.se/error.log
    CustomLog /var/www/vhosts/linux.dbwebb.se/access.log combined

    <Directory />
        Options Indexes FollowSymLinks
        AllowOverride All
        Order allow,deny
        Allow from all
        Require all granted
    </Directory>
</VirtualHost>
```

Jag tänker mig alltså att min virtuella host skall ligga i katalogen `/var/www/` under en katalogstruktur om `vhosts/vlinux.dbwebb.se`.

Så här fullföljer jag.

```bash
$ mkdir -p /var/www/vhosts/vlinux.dbwebb.se
```

Nu är det bara att _enabla_ den virtuella hosten och låta Apache ladda om configurationen.

```bash
sudo a2ensite vlinux.dbwebb.se
sudo apachectl restart
```

### Lägga till namnet i hosts filen {#hosts}

Webbservern svarar än så länge bara på `localhost`. För att lägga till vårt egna namn behöver vi uppdatera filen `/etc/hosts`. Den innehåller redan en koppling mellan namnet localhost och dess ipadress 127.0.0.1. Lägg till följande rad i filen:

```console
127.0.0.1   vlinux.dbwebb.se
```

Nu kommer inkommande trafik via namnet vlinux.dbwebb.se riktas om och gå mot localhost. Testa med någon av de terminalbaserade webbläsarna vi intallerade, tex `w3m`:

```console
$ w3m vlinux.dbwebb.se
```

Om vi nu har några filer i `/var/www/vhosts/vlinux.dbwebb.se/` kan vi förhoppningsvis se dem nu.

### Felsök configfilen {#felsok}

Om du får problem med configfilen så kan du titta i error-loggen för felutskrifter. Titta både i `/var/log/apache2` och i loggilerna för den virtuella hosten.

```bash
sudo tail -f /var/log/apache2/error.log
tail -f /var/www/vhosts/vlinux.dbwebb.se/error.log
```

Du kan också köra följande kommandon för att se status på apache och dess configfil.

```bash
# Check status of apache
sudo apachectl status

# Check configuration file for errors
apachectl configtest
apachectl -t

# List virtual hosts with settings
apachectl -S

# Stop and start the service
sudo apachectl start

sudo apachectl stop
```

### En snyggare configfil med variabler {#config}

En variant av configfilen skulle kunna se ut så här, om man väljer att använda en form av alias, variabel, som är tillgänglig i konfigurationsfilen. På [Apache-språk heter det Define](http://httpd.apache.org/docs/2.4/mod/core.html#define).

```html
<VirtualHost *:80>
    Define site vlinux.dbwebb.se
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

Pröva att använda denna varianten istället. Som du ser så är den klart enklare att duplicera när du vill skapa nya virtuella hostar. Du behöver bara ändra de två _Define_ i början på filen.

### Simulera ett hostnamn för servern {#sim-hostname}

Du har nu en virtuell host som kommer svara så fort den får ett anrop på namnet _vlinux.dbwebb.se_. Vad du behöver göra är att peka domännmamnet på serverns ipadress.

Normalt gör vi detta med DNS. Vi lägger så att maskinens namn kopplas mot en ipadress och DNS:en håller koll så vi hamnar på rätt plats. Om du gör detta exemplet och har en server ute på nätet, så använder du DNS:en för att den skall hamna rätt.

Men nu har vi en utvecklingsmiljö med en server i Docker som kan exponera en vald port där servern kan nås. Vi behöver dock alltså sätta upp lokalt, i vårt eget nätverk, att maskinen vlinux.dbwebb.se känns igen som 127.0.0.1 (localhost) och trafiken ska skickas dit via porten.

Vi behöver uppdatera hosts filen även på vår "riktiga" dator. På Linux finns filen på följande sökväg:

```console
$ sudo nano /etc/hosts
```

Följande rad lägger du till i filen.

```text
127.0.0.1   vlinux.dbwebb.se
```

På en klient med MacOS gör du på samma sätt.

Sitter du på Windows så heter filen följande. Glöm inte att du måste vara administratör för att redigera filen.

```text
C:\Windows\system32\drivers\etc\hosts
```

Nu kan jag komma åt den lokala maskinen via namnet istället. Låt säga att servern exponerar port 8080. Adressen `http://vlinux.dbwebb.se:8080` är numer samma som att skriva `http://localhost:8080` eller `http://127.0.0.1:8080`. Det är precis detta som Apache tittar på när den identifierar den namnbaserade virtuella hosten.

När jag nu använder `http://vlinux.dbwebb.se:8080` så kommer jag till Apache som identifierar namnet som en virtuell host och använder den DocumentRoot som är specificerad.

Klart. Magiskt. Så vida det inte strular förstås. Då får man felsöka och göra om - göra rätt. Det är en hård värld vi lever i.

### Avslutningsvis {#avslutning}

"Namnbaserade virtuella hostar" med Apache är ett bra sätt att köra flera webbplatser på en server. Det är också ett bra sätt att köra en utvecklingsserver med många webbplatser.

När man nu kombinerar detta med servar i Docker, så får du en möjlighet att köra många webbplatser och att köra dem på många olika servrar som kan vara konfigurerade på olika sätt. Det kan vara ett kraftfullt verktyg för en webbprogrammerare.
