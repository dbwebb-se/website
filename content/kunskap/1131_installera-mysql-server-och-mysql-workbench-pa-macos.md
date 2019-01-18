---
author: mos
category:
    - databas
    - mysql
    - macOS
revision:
    "2019-01-17": "(C, mos) Bytte från .bash_profile till .bash_profile."
    "2019-01-09": "(B, mos) Nu enbart för macOS."
    "2018-01-12": "(A, mos) Första utgåvan."
...
Installera MySQL Server och MySQL WorkBench på macOS
==================================

[FIGURE src=image/snapvt19/macos-system-preferences-mysql-server.png?w=c5 class="right"]

Vi skapar en egen lokal utvecklingsmiljö för databasen MySQL tillsammans med desktopklienten MySQL Workbench på macOS.

Vi använder också terminalklienten `mysql` för att koppla oss mot databasen och lägger in sökvägen till terminalprogrammen i vår PATH så att det går att starta direkt i terminalen.

<!--more-->



Förberedelse {#prep}
--------------------------------------

Du har macOS installerat och uppdaterat.

Du är bekant med terminalen i macOS.



MySQL produkter {#download}
--------------------------------------

Jag går till [nedladdningssidan för MySQLs produkter](https://dev.mysql.com/downloads/) för att kolla läget, innan vi startar med installationen.

De produkter jag vill åt heter "MySQL Community Server" och "MySQL Workbench". 

MySQL Community Server innehåller databasservern och terminalbaserade klientprogram.

MySQL Workbench är en desktopklient du kan använda för att jobba mot databasservern, som ett alternativ och komplement till de terminalbaserade klienterna.



Installera MySQL Server {#server}
--------------------------------------

Jag hämtar hem "MySQL Community Server" via nedladdningssidan, jag väljer DMG-varianten.

Jag installerar servern via installationsprogrammet.

Jag väljer ett lösenord för databasens root-användare när jag ombeds göra det av installationsprogrammet.

I "System Preferences" skapas en ikon för MySQL, via den kan man starta upp eller stoppa servern.

[FIGURE src=image/snapvt19/macos-system-preferences-mysql-server.png caption="System Preferences innehåller en egen del för MySQL server där den kan stoppas och startas."]

Se till att databasservern är startad.



Installera MySQL WorkBench {#wb}
--------------------------------------

Jag hämtar hem "MySQL Workbench" via nedladdningssidan och installerar via installationsprogrammet.

Starta MySQL Workbench. Det finns en koppling till din lokala databas.

[FIGURE src=image/snapvt19/macos-workbench-connections.png?w=w3 caption="Du kan nu koppla dig direkt mot databasen, via Workbench."]

Klicka på kopplingen och ange lösenordet för root-användaren.

Jag kan nu utföra kommandot för att visa vilka databaser som finns.

```
SHOW DATABASES;
```

Så här ser det ut i workbench.

[FIGURE src=image/snapvt19/macos-workbench-show-databases.png?w=w3 caption="Nu fungerar både Workbench och MySQL databasserver."]

Vi har nu installerat MySQL Community Server tillsammans med MySQL Workbench och kopplingen mellan dem fungerar.



Använd terminalklienten mysql {#terminal}
--------------------------------------

Starta en terminal.



### Hitta sökvägen till terminalklienten {#var}

Du kan starta terminalklienten `mysql` som ligger installerad i följande katalogen-struktur.

```text
/usr/local/[mysql]/bin/
```

Exakt vad `[mysql]` är kan variera mellan installationer. Det kan vara `mysql` eller så kan det vara (som i mitt fall) `mysql-8.0.13-macos10.14-x86_64`. Den exakta sökvägen är alltså beroende av din miljö och du behöver själv ta reda på vilken sökväg som gäller för dig.

Eventuellt kan följande kommando hjälpa dig att klura ut sökvägen. Kör det i din terminal och se om du får fram en sökväg.

```text
( cd /usr/local/mysql*/bin && pwd )
```

Kommandot försöker flytta till en katalog som börjar på `mysql*`, och om den finns så skrivs dess sökväg ut.

Om det inte fungerar så får du öppna din filväljare för att finna rätt sökväg, alternativt använder du kommandona `ls` och `cd` för att kontrollera rätt sökväg. 

Till exempel kan du skriva följande för att se vilka kataloger som matchas av `mysql*`.

```text
ls /usr/local/mysql*
```



### Starta terminalklienten {#start}

När du hittat rätt sökväg så kan du flytta till den katalogen för att köra terminalklienten för `mysql`. I mitt fall skrev jag följande i en terminal för att först flytta till katalogen och sedan starta terminalen och koppla mig mot databasen med användaren "root" samt att jag vill ange lösenordet. Byt ut `[mysql]` mot rätt katalog för din miljö.

```text
cd /usr/local/[mysql]/bin
./mysql -uroot -p
```

Det kan se ut så här.

[FIGURE src=image/snapvt19/macos-terminal-mysql-connected.png?w=w3 caption="MySQL terminalklient startad i en terminal."]

Om du skriver in ett felaktigt kommando så kan du lägga till ett `;` så avslutas inmatningen av kommandot.

Du kan använda piltangenter tillbaka/fram för att redigera det du skriver in och du kan nå föregående kommando med pil upp/ned.

Du rensar skärmen med `ctrl-l`.

Du kan avsluta genom att skriva `exit`.

Då vet vi att terminalklienten fungerar som den ska.



### Terminalklienten till PATH {#path}

Du kan lägga till alla terminalkommandon för MySQL till din PATH. Då blir det enklare att starta programmet, oavsett vilken katalog du står i.

Det du behöver göra är att uppdatera din startupfil `.bash_profile` så att sökvägen till terminalprogram för MySQL finns med i din PATH. Det handlar om att lägga till följande rad i `.bash_profile`.

Glöm inte byta ut `[mysql]` mot din exakta sökväg.

```text
PATH="/usr/local/[mysql]/bin:$PATH"
```

Du kan redigera din fil `~/.bash_profile` i en texteditor eller så kan du exekvera följande kommando som utför åtgärden.

```text
echo 'PATH="/usr/local/[mysql]/bin:$PATH"' >> ~/.bash_profile
```

När du är klar så kan du aktivera sökvägen genom att läsa in din fil `~/.bash_profile`.

```text
source ~/.bash_profile
```

Du kan kontrollera att det fungerar genom att se vilket program som motsvaras av `mysql`. Tecknet `$` är en del av prompten och inte en del av kommandot.

Så här ser det ut för mig.

```text
$ which mysql
/usr/local/mysql-8.0.13-macos10.14-x86_64/bin/mysql
```

Det kan se ut så här när du utför alla kommandon.

[FIGURE src=image/snapvt19/macos-terminal-path-updated.png?w=w3 caption="MySQL terminalklient ligger nu i din sökväg, din PATH."]

Nu kan du köra alla MySQL terminalprogram direkt i din terminal, pröva genom att bara skriva `mysql -uroot -p`.



Alternativ till installation {#alternativ}
--------------------------------------

Du kan använda [MariaDB](https://mariadb.org/download/) som ett alternativ till MySQL.

Du kan installera MySQL Community Server, eller MariaDB, via pakethanteraren brew.

Du kan använda den versionen av MySQL/MariaDB som följer med XAMPP.



Avslutningsvis {#avslutning}
--------------------------------------

Detta var de steg som krävs för att installera databasen MySQL, dess terminalklienter i PATH och desktopklienten MySQL Workbench i macOS.

Denna artikel har en [egen forumtråd](t/8170) som du kan ställa frågor i, eller ge tips.
