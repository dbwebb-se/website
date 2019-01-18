---
author: efo
category:
    - ramverk2
    - verktyg
revision:
    "2018-12-19": "(A, efo) La till information om installation av verktygen nginx, node, tmux och git."
    "2018-11-07": "(A, efo) Första utgåvan för ramverk2 version 2 av kursen."
...
GitHub Education Pack och en server på Digital Ocean
==================================

[FIGURE src=/image/ramverk2/do.png class="right"]

Vi kommer i denna artikel titta på hur vi skaffar oss en Linux-baserad server på Digital Ocean genom att använda GitHub Education Pack.

<!--more-->

Vi använder GitHub Education Pack för att skaffa en gratis server på Digital Ocean och en del andra verktyg, som är bra att ha. Sedan skaffar vi en server och ser till att säkra upp denna servern genom att använda SSH-nycklar för inloggning, brandväggen `ufw` och verktyget `fail2ban`.



Förutsättning {#pre}
--------------------------------------

Du har din student e-postadress nära till hands då den behövs för att få tillgång till GitHub Education Pack.



GitHub Education Pack {#gep}
--------------------------------------

För att få tillgång till rabatter och rabattkoder som erbjuds i [GitHub Education Pack](https://education.github.com/pack) behöver du GitHub veta att du är student. Gå till den länkade sidan och tryck på den blåa knappen "Get your Pack". Viktigt att du använder din student mail när du registrerar dig då mailen måste vara kopplat till en undervisningsinstitution.



Digital Ocean {#do}
--------------------------------------

När du är verifierad via GitHub får du tillgång till en rabattkod för Digital Ocean. Efter det går du till [Digital Ocean Sign Up](https://cloud.digitalocean.com/registrations/new) och skapar ett konto. Du behöver ange ett kreditkort, men vi kommer sedan använda rabattkoden så det kommer inte kosta något.

När du har skapat kontot gå till Account längst upp till höger under din användare logga. Gå sedan till Billing fliken och scrolla ner till Promo Code. Här lägger du in rabattkoden du fick från Github Education Pack när du tryckte på länken 'request your offer code'.

Gå sedan till första sidan och tryck 'Get started with a Droplet'. Instruktioner i kommande stycken och resten av kursen kommer utgå från en Debian Stretch (9.x) droplet, så en stark rekommendation är att välja en sån droplet. Jag rekommenderar att ni kör en 10$/månad droplet, då man får bra prestanda och samtidigt inte använder hela rabatten under kursens gång. Välj Frankfurt eller London som region och lägg till din `id_rsa.pub` SSH nyckel så du kan logga in på servern.



Första 10 minuter på en server {#first10}
--------------------------------------

Med utgångspunkt i artiklar som [My First 5 Minutes On A Server; Or, Essential Security for Linux Servers](https://plusbryan.com/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers) och [My First 10 Minutes On a Server - Primer for Securing Ubuntu](https://www.codelitt.com/blog/my-first-10-minutes-on-a-server-primer-for-securing-ubuntu/) ska vi i följande stycke titta på hur vi säkrar upp en Linux-baserad server av Ubuntu eller Debian variant.



### Logga in på servern {#login}

Vi loggar in på servern genom att använda SSH via terminalen med kommandot. `ssh root@[IP]` ersätt din [IP] med den IP som visas för din droplet.



### Lösenord {#password}

Än så länge har vi inte ens ett lösenord till vår `root` användare så låt oss se till att sätter ett lösenord. Välj ett säkert lösenord och med säkert lösenord menas ett slumpat och komplext lösenord. Jag rekommenderar starkt att använda en Password Manager och skapa lösenordet med hjälp av denna Password Manager inställt på den mest komplexa inställningen du kan hitta. För Mac och Linux rekommenderas [pass](https://www.passwordstore.org) och för Windows verkar [LastPass](https://www.lastpass.com) vara det mest använda gratis programmet som finns.

När du har skapat ett slumpmässigt och komplext lösenord skriv följande kommando och följ instruktionerna.

```bash
passwd
```



### Uppdatera servern {#update}

Nästa steg är att uppdatera serverns programvara till senaste version genom att använda verktyget `apt-get`.

```bash
apt-get update
apt-get upgrade
```



### Skapa din egen användare {#user}

Vi vill aldrig logga in som `root` då `root` har tillgång till för mycket. Så vi skapar en egen användare `deploy` med följande kommandon. Du kan byta ut `deploy` mot vad som helst, men då ska du göra det i alla följande kommandon. De två första kommandon är för att rensa bort en befintlig användare Digital Ocean lägger till när debian installeras.

```bash
apt-get remove --purge unscd
userdel -r debian
useradd deploy
mkdir /home/deploy
mkdir /home/deploy/.ssh
chmod 700 /home/deploy/.ssh
```

Vi passar på att i samma veva ställa in vilken förvald terminal vår nya använda ska använda, vi väljer `bash` då vi är vana vid den.

```bash
usermod -s /bin/bash deploy
```



### Stänga av inloggning med lösenord {#passwd}

Lösenord kan knäckas.

Därför använder vi istället SSH nycklar för att autentisera oss mot servern. Skapa och öppna filen med kommandot `nano /home/deploy/.ssh/authorized_keys` och lägg innehållet av din lokala `.ssh/id_rsa.pub` nyckel i den filen på en rad.

När du har lagt till nyckeln kör du följande två kommandon för att sätta korrekta rättigheter på katalogen och filen.

```bash
chmod 400 /home/deploy/.ssh/authorized_keys
chown deploy:deploy /home/deploy -R
```

Testa nu att logga in i ett nytt terminalfönster med kommandot `ssh deploy@[IP]`. Vi har kvar terminal fönstret där vi loggade in som root om något skulle gå fel.

Vi skapar sedan ett lösenord för `deploy` användaren från root terminalfönstret, `passwd deploy`, använd igen ett långt och slumpmässigt lösenord. Och vi lägger till `deploy` som sudo användare med kommandot `usermod -aG sudo deploy`.

Som vi sagt tidigare vill vi bara kunna logga in med SSH nycklar. Vi gör detta genom att ändra tre rader i filen `/etc/ssh/sshd_config`. Öppna filen med din texteditor på din server till exempel nano med kommandot `nano /etc/ssh/sshd_config`.

Hitta raderna nedan och se till att ändra från yes till no. Raderna ligger inte på samma ställe i filer, så ibland får man leta en liten stund. Den sista raden nedan får du skriva in själv.

```bash
PermitRootLogin no
PasswordAuthentication no
AllowUsers deploy
```

Spara filen och starta om SSH med hjälp av kommandot `service ssh restart`. Testa nu att logga ut och in i ditt andra terminal fönster där du tidigare var inloggat som `deploy`.



### Brandvägg {#firewall}

Först stänger vi ner uppkopplingen för användaren root genom att skriva exit i terminalfönstret. Alla kommandon vi kommer köra från och med nu körs som användaren deploy.

Vi använder oss av brandväggen `ufw` för att stänga och öppna portar till vår server. Installera med kommandot `sudo apt-get install ufw`.

Vi vill nu öppna upp för trafik på 3 portar 22 för SSH, 80 för HTTP och 443 för HTTPS. Vi gör det med hjälp av följande kommandon.

```bash
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 443
sudo ufw disable
sudo ufw enable
```



### Automagiska uppdateringar {#unattended}

Vi vill inte hålla på att manuellt uppdatera vår server, men vi vill inte heller sakna en patch när de kommer så vi kommer använda oss av verktyget unattended-upgrades. Vi installerar med `sudo apt-get install unattended-upgrades`.

Uppdatera filen `/etc/apt/apt.conf.d/10periodic` så den innehåller nedanstående.

```bash
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Download-Upgradeable-Packages "1";
APT::Periodic::AutocleanInterval "7";
APT::Periodic::Unattended-Upgrade "1";
```

Uppdatera även filen `/etc/apt/apt.conf.d/50unattended-upgrades` så den ser ut som nedan.

```bash
Unattended-Upgrade::Allowed-Origins {
    "${distro_id}:${distro_codename}";
    "${distro_id}:${distro_codename}-security";
    "${distro_id}ESM:${distro_codename}";
    //"${distro_id}:${distro_codename}-updates";
};
```



### fail2ban {#fail2ban}

Vårt sista steg är att installera verktyget fail2ban som används för att automatiskt kolla logfiler och stoppa aktivitet som vi inte vill ha på vår server. Vi installerar och låter ursprungsinställningarna göra sitt jobb. Vi installerar med `sudo apt-get install fail2ban`.



En domän till din server {#domain}
--------------------------------------

Som en del av Github Education Pack får du som student även ett domän-namn på top-domänen .me från registratorn namecheap gratis under ett år. Om du vill använda en annan registrator är det fritt fram.

För att använda namecheap tryck på länken "Get access by connecting your GitHub account on Namecheap" och knyta ihop ditt GitHub konto med namecheap och skapa en användare.

När du har kopplat din användare kommer du till en sida där du skapar ditt domännamn. Skriv in din text i kommande bilder har jag använt det domännamn jag valda 'jsramverk.me'.

[FIGURE src=/image/ramverk2/namecheap-nameservers.png?w=w3 caption="Fyll i nameservers hos namecheap."]

Gå sedan till Digital Ocean och välj Networking>Domains. Här Väljer du att skapa den valda domänen.

[FIGURE src=/image/ramverk2/do-domains.png?w=w3 caption="Skapa domän på Digital Ocean."]

Vi vill sedan peka domänen till vår droplet och för att komma åt root-domänen anger vi @. Vill vi ange en subdomän anger vi subdomänen.

[FIGURE src=/image/ramverk2/do-domain-names.png?w=w3 caption="Peka domän till droplet på Digital Ocean."]



Installera nginx {#nginx}
--------------------------------------

Vi installerar webbservern nginx med hjälp av kommandot `sudo apt-get install nginx`. Du ska nu kunna gå till din domän-adress och där se Welcome to nginx! Ibland kan det ta en liten stund innan alla ändringar slå igenom, så nu är att bra tillfälle att hämta kaffe eller gå en runda om det inte fungerar direkt.



Installera nodejs och npm {#nodejs}
--------------------------------------

Vi vill ha nodejs och npm installerat så vi kan köra en backend på vår server. Vi installerar LTS (Long Term Support) versionen då detta är vår produktionsserver. Vi kommer i kommande kursmoment se hur vi kan testa i olika versioner av nodejs. Vi installerar nodejs och npm med följande kommandon.

```bash
sudo apt update
sudo apt install curl
cd ~
curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs
nodejs -v
```

Här ska du gärna se en utskrift med ett versionsnummer som inledas med `v10.`.

Om du kör kommandot `npm -v` ser du att du även har Node Package Manager npm installerat med ett versionsnummer över 6. För att vissa program ska kunna installeras via npm behöver vi även installera build-essentials. Vi gör det med kommandot `sudo apt install build-essential`.



Installera tmux {#tmux}
--------------------------------------

tmux är ett oerhört trevligt verktyg att använda om man vill komma tillbaka till samma vy när man loggar in på en server från ett antal olika servrar. Installera med kommandot `sudo apt-get install tmux`.

Du öppnar en tmux session genom att skriva `tmux` i terminalen. I sitt grundutförande är Ctrl-b kommandotangenten, du trycker alltså in Ctrl-b släpper och en knapp till för att utföra kommandot. Du kan skapa nya fönster med Ctrl-b följd av c, du kopplar ner från sessionen med Ctrl-b d och vill du tillbaka till sessionen kan du skriva `tmux a -t 0`. Bra och smidigt när man vill logga in från flera olika datorer, men ändå se samma bild.



Installera git {#git}
--------------------------------------

För att lättare kunna driftsätta våra git-repon installerar vi även git med kommandot `sudo apt-get install git`.



Avslutningsvis {#avslutning}
--------------------------------------

Djupt andetag. Det var en rejäl omgång, men vi är nu på gång på riktigt med en egen server med nginx och node. Vi ska i kommande artiklar titta på hur vi kan skapa ett API som skickar data vid förfrågningar.
