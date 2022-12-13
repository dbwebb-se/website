---
author: aar
category:
    - devops
    - verktyg
revision:
    "2022-10-20": "(A, aar) Första utgåvan."
...
Första 10 minuter på en server
==================================

Vi kommer i denna artikel titta på hur vi skapar en ny användare och säkrar upp en server.

<!--more-->

Med utgångspunkt i artiklar som [My First 5 Minutes On A Server; Or, Essential Security for Linux Servers](https://plusbryan.com/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers) och [My First 10 Minutes On a Server - Primer for Securing Ubuntu](https://www.codelitt.com/blog/my-first-10-minutes-on-a-server-primer-for-securing-ubuntu/) ska vi i följande stycke titta på hur vi säkrar upp en Linux-baserad server av Ubuntu eller Debian variant.



Förutsättning {#pre}
--------------------------------------

Du har en server med ett operativsystem installerat.



Logga in på servern {#login}
-------------------------------

Vi loggar in på servern genom att använda SSH via terminalen med kommandot. `ssh -i ~/.ssh/azure azureuser@[IP]` ersätt din [IP] med den IP som din server har eller ditt domännamn.

När du är inne på servern byt till root användaren med `sudo su`.



### Lösenord {#password}

Än så länge har vi inte ens ett lösenord till vår `azureuser` användare så låt oss se till att sätter ett lösenord. Välj ett säkert lösenord och med säkert lösenord menas ett slumpat och komplext lösenord.

Skriv följande kommando och följ instruktionerna.

```bash
passwd
```



### Uppdatera servern {#update}

Nästa steg är att uppdatera serverns programvara till senaste version genom att använda verktyget `apt-get`. Men först vill vi berätta för Debian vilken teckenkodning ([locale](https://wiki.debian.org/Locale)) som ska användas, annars får vi en varning av `apt-get`.

```bash
localectl set-locale LANG=en_US.UTF-8
apt-get update
apt-get upgrade
```




Skapa din egen användare {#user}
-------------------------------------

Vi vill aldrig logga in som `azureuser` eller `root`. `azureuser` är standard namnet för alla servrar som skapas i Azure, så hackare försöker använda det namnet för att komma åt vår server. `root` användaren har för mycket rättigheter. Så vi skapar en egen användare `deploy` med följande kommandon. Du kan byta ut `deploy` mot vad som helst, men då ska du göra det i alla följande kommandon. Senare ska vi ta bort `azureuser` användaren.

```bash
useradd -s /bin/bash -m deploy
mkdir /home/deploy/.ssh
chmod 700 /home/deploy/.ssh
```

I `useradd` används `-s /bin/bash` för att välja terminal åt användaren. `-m` gör att en home mapp skapas åt användaren.



### Stänga av inloggning med lösenord {#passwd}

Lösenord kan knäckas.

Därför använder vi istället SSH nycklar för att autentisera oss mot servern. Skapa och öppna filen med kommandot `nano /home/deploy/.ssh/authorized_keys` och lägg innehållet av din lokala `.ssh/azure.pub` nyckel i den filen på en rad.

När du har lagt till nyckeln kör du följande två kommandon för att sätta korrekta rättigheter på katalogen och filen.

```bash
chmod 400 /home/deploy/.ssh/authorized_keys
chown deploy:deploy /home/deploy -R
```

Testa nu att logga in i ett nytt terminalfönster med kommandot `ssh deploy@[IP]`. Vi har kvar terminal fönstret där vi loggade in som azureuser om något skulle gå fel.

Vi skapar sedan ett lösenord för `deploy` användaren från azureuser terminalfönstret, `passwd deploy`, använd igen ett långt och slumpmässigt lösenord. Och vi lägger till `deploy` som sudo användare med kommandot `usermod -aG sudo deploy`.

Som vi sagt tidigare vill vi bara kunna logga in med SSH nycklar. Vi gör detta genom att ändra tre rader i filen `/etc/ssh/sshd_config`. Öppna filen med din texteditor på din server till exempel nano med kommandot `nano /etc/ssh/sshd_config`.

Hitta raderna nedan och se till att ändra från yes till no. Raderna ligger inte på samma ställe i filer, så ibland får man leta en liten stund. Den sista raden nedan får du skriva in själv.

```bash
PermitRootLogin no
PasswordAuthentication no
AllowUsers deploy
```

Spara filen och starta om SSH med hjälp av kommandot `service ssh restart`. Testa nu att logga ut och in i ditt andra terminal fönster där du tidigare var inloggat som `deploy`.



### Ta bort azureuser {#deluser}

Först stänger vi ner uppkopplingen för användaren azureuser genom att skriva `exit` i terminalfönstret. Alla kommandon vi kommer köra från och med nu körs som användaren `deploy`.

Logga in på servern igen som `deploy` användaren och kör kommandot:

```
sudo userdel -r azureuser
```



### Brandvägg {#firewall}


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

Vårt sista steg är att installera verktyget fail2ban som används för att automatiskt kolla loggfiler och stoppa aktivitet som vi inte vill ha på vår server. Vi installerar och låter ursprungsinställningarna göra sitt jobb. Vi installerar med `sudo apt-get install fail2ban`.



Installera tmux {#tmux}
--------------------------------------

tmux är ett oerhört trevligt verktyg att använda om man vill komma tillbaka till samma vy när man loggar in på en server från ett antal olika servrar. Installera med kommandot `sudo apt-get install tmux`.

Du öppnar en tmux session genom att skriva `tmux` i terminalen. I sitt grundutförande är Ctrl-b kommandotangenten, du trycker alltså in Ctrl-b släpper och en knapp till för att utföra kommandot. Du kan skapa nya fönster med Ctrl-b följd av c, du kopplar ner från sessionen med Ctrl-b d och vill du tillbaka till sessionen kan du skriva `tmux a -t 0`. Bra och smidigt när man vill logga in från flera olika datorer, men ändå se samma bild.



Installera git {#git}
--------------------------------------

För att lättare kunna driftsätta våra git-repon installerar vi även git med kommandot `sudo apt-get install git`.



Avslutningsvis {#avslutning}
--------------------------------------

Nu har ni en server som är redo att användas till det mesta.
