---
author: mos
category:
    - databas
    - mysql
    - windows
revision:
    "2019-01-15": "(C, mos) Förtydliga hur man skapar my.cnf på WSL."
    "2019-01-08": "(B, mos) Nu enbart för Windows."
    "2018-01-12": "(A, mos) Första utgåvan för Windows, macOS och Linux."
...
Installera MySQL Server och MySQL WorkBench på Windows 10
==================================

[FIGURE src=image/snapvt19/win-workbench.show-databases.png?w=c5 class="right"]

Vi skapar en egen lokal utvecklingsmiljö för databasen MySQL tillsammans med desktopklienten MySQL Workbench på Windows 10.

Vi använder också terminalklienten `mysql` för att koppla oss mot databasen och lägger in sökvägen till terminalprogrammen i vår PATH så att det går att starta direkt i terminalen.

<!--more-->



Förberedelse {#prep}
--------------------------------------

Du har Windows 10 installerat och uppdaterat.

Du kan ha installerat Unix-terminalerna Debian/Bash och/eller Cygwin. Det rekommenderas att du installerar terminalklienten i den Unix-terminal du valt att använda.



MySQL produkter {#download}
--------------------------------------

Jag går till [nedladdningssidan för MySQLs produkter](https://dev.mysql.com/downloads/) för att kolla läget, innan vi startar med installationen.

De produkter jag vill åt heter "MySQL Community Server" och "MySQL Workbench". 

MySQL Community Server innehåller databasservern och terminalbaserade klientprogram.

MySQL Workbench är en desktopklient du kan använda för att jobba mot databasservern, som ett alternativ och komplement till de terminalbaserade klienterna.

För Windows finns paketet "MySQL on Windows" som är en paketering som innehåller både Community Server och Workbench.



Installera MySQL på Windows 10 {#server-wb}
--------------------------------------

För Windows finns en [speciell nedladdningssida med MySQL produkter](https://dev.mysql.com/downloads/windows/). Jag väljer "MySQL Installer" som är en paketering av alla produkter för MySQL.

I installationsprogrammet väljer jag en custom installation och där väljer jag att enbart installera "MySQL Community Server" och "MySQL Workbench". Inuti installationsprogrammet får jag även hjälp att installera de extra verktyg som eventuellt behövs.

Jag väljer en custom installation.

[FIGURE src=image/snapvt19/mysqlinstaller-windows-custom.png?w=w3 caption="Välj Custom Installation."]

Jag väljer att enbart installera "MySQL Community Server" och "MySQL Workbench".

[FIGURE src=image/snapvt19/mysqlinstaller-select-products.png?w=w3 caption="Välj att installera servern och workbench."]

MySQL är beroende av paketet "Microsoft Visual C++ Redistributable Package" och jag får hjälp att installera det via installationsprogrammet. Klicka på "Execute" innan du går vidare.

[FIGURE src=image/snapvt19/mysqlinstaller-additional.png?w=w3 caption="Välj att installera servern och workbench."]

För övriga inställningar väljer jag de som är förinställda i installationsprogrammet.

Jag väljer ett lösenord för databasens root-användaren när jag ombeds göra det av installationsprogrammet.

Jag väljer att starta servern direkt efter installationen, Databasen MySQL installeras som en _service_  Windows och kan stoppas och startas via Window Services. Normalt startar MySQL server när du bootar om din dator.

Jag väljer att starta workbench direkt efter installationen. Via workbench kan jag koppla mig mot databasen och testa att det fungerar. Jag behöver ange lösenordet för root-användaren.

[FIGURE src=image/snapvt19/mysql-workbench-installed-windows.png?w=w3 caption="Du kan nu koppla dig direkt mot databasen, via Workbench."]

Jag kan nu utföra kommandot för att visa vilka databaser som finns.

```
SHOW DATABASES;
```

Så här ser det ut i workbench.

[FIGURE src=image/snapvt19/win-workbench.show-databases.png?w=w3 caption="Nu fungerar både Workbench och MySQL databasserver."]

Vi har nu installerat MySQL Community Server tillsammans med MySQL Workbench och kopplingen mellan dem fungerar.



Använd terminalklienten i cmd {#terminal}
--------------------------------------

Vi kan använda terminalklienten för MySQL via Windows terminal `cmd`.

Du kan öppna en windows terminal genom att trycka `Windows key + r` och skriva in `cmd`.

Nu kan du starta terminalklienten för MySQL genom att ange dess absoluta sökväg, eller genom att flytta till katalogen där den finns installerad. 

Sökvägen till din installation är beroende av den version du nyss installerat. Du kan använda kommandot `dir` tillsammans med `cd` för att leta reda på installationskatalogen. Alternativt använder du filväljaren `explorer` för att hitta installationskatalogen för MySQL. I mitt fall var det 8.0 så sökvägen till min installation - och katalogen bin - blev följande.

```text
C:\Program Files\MySQL\MySQL Server 8.0\bin>
```

Jag flyttar till den katalogen med hjälp av kommandot `cd` och där kan jag nu starta terminalklienten `mysql`.

Terminalklienten startas med följande kommando där jag anger att jag vill vara användaren "root" och jag vill ange dess lösenord.

```text
mysql -uroot -p
```

[FIGURE src=image/snapvt19/win-cmd-mysql.png?w=w3 caption="Startar MySQL terminalklient i Windows cmd-terminal."]

Om du skriver in ett felaktigt kommando så kan du lägga till ett `;` så avslutas inmatningen av kommandot.

Du kan använda piltangenter tillbaka/fram för att redigera det du skriver in och du kan nå föregående kommando med pil upp/ned.

Du rensar skärmen med `ctrl-l`.

Du kan avsluta genom att skriva `exit`.

Då vet vi att terminalklienten fungerar som den ska.



### Terminalklienten till PATH {#path}

Du kan lägga till alla terminalkommandon för MySQL till din PATH. Då blir det enklare att starta programmet, oavsett vilken katalog du står i.

Så här gör du. Börja med att starta programmet `control system` via `Windows key + r`.

Klicka sedan på "Change settings".

[FIGURE src=image/snapvt19/mysql-path-1.png?w=w3 caption="Klicka på Change Settings."]

Du får upp ett fönster för "System Properties", välj fliken "Advanced" och klicka på "Environment Variables".

[FIGURE src=image/snapvt19/mysql-path-2.png caption="Öppna fönstret för Environment Variabels."]

Du får upp ett fönster för Environment Variables.

Välj "System variables -> Path" i listan och klicka "Edit...".

[FIGURE src=image/snapvt19/mysql-path-3.png caption="Välj att editera systemvariabeln för Path."]

Lägg till sökvägen till den katalog som innehåller din installation av terminalprogrammet mysql. I mitt fall var sökvägen `C:\Program Files\MySQL\MySQL Server 8.0\bin`.

Klicka på "New" och lägg dit sökvägen. Klicka därefter på "Ok".

[FIGURE src=image/snapvt19/mysql-path-4.png caption="Välj att editera systemvariabeln för Path."]

Spara allt genom att klicka ned programmen du nyss öppnat.

Starta om din terminal `cmd` så att sökvägen och miljövariabeln PATH uppdateras.

Nu bör du kunna starta `mysql` direkt i terminalen via följande kommando.

```text
mysql -uroot -p
```

Nu har du en fungerande terminalklient `mysql`.



Skapa en ny användare i databasen {#createuser}
--------------------------------------

Innan vi går vidare så skapar vi en ny användare i databasen, denna användare kan ha fulla rättigheter till alla databaser.

Vi öppnar terminalklienten och skriver följande SQL-kod för att skapa en användare. Jag döper min användare till "mos", du väljer ditt egna användarnamn och ditt egna lösenord.

```text
CREATE USER 'mos'@'localhost'
IDENTIFIED WITH mysql_native_password
BY 'password';
```

Kommandot [`CREATE USER` finns beskrivet i manualen](https://dev.mysql.com/doc/refman/8.0/en/create-user.html).

Vi ger nu denna användare fullständiga rättigheter på alla databaser `*.*`, det blir i princip samma rättigheter som root-användaren.

```text
GRANT ALL PRIVILEGES ON *.* TO 'mos'@'localhost';
```

Kommandot [`GRANT` finns beskrivet i manualen](https://dev.mysql.com/doc/refman/8.0/en/grant.html).

Bra, då har vi en användare som har samma rättigheter som root-användaren. En anledning till att vi gör detta nu är att det finns olika kryptering på lösenorden och denna användare vi nu skapade är mer kompatibel mellan versioner, mer kompatibel än den root-användare som skapades.

Detta är en lösning på problemet som inträffar när äldre klienter kopplar sig mot nyare databaser (från och med version 8.0.4). Felmeddelandet som visas är ofta följande.

> "ERROR 2059 (HY000): Authentication plugin 'caching_sha2_password' cannot be loaded: /usr/lib/x86_64-linux-gnu/mariadb18/plugin/caching_sha2_password.so: cannot open shared object file: No such file or directory"

Du kan läsa om problematiken på StackOverflow och "[Authentication plugin 'caching_sha2_password'](https://stackoverflow.com/questions/49963383/authentication-plugin-caching-sha2-password)".

Då kan vi gå vidare och eventuellt installera klienten `mysql` i andra terminaler.



Installera terminalklienten i Debian/Bash {#win10bash}
--------------------------------------

Om du använder Debian/Bash på Windows kan du installera mysql terminalkommandon och använda dem via terminalen.

Du kan installera klienten via pakethanteraren. Du kan välja att installera `mysql-client` eller dess motsvarighet `mariadb-client`. Båda fungerar på samma sätt. 

Starta din bash terminal och installera sedan klienten du väljer.

```text
sudo apt-get install mysql-client
```

Du kan sedan starta terminalklienten, som vanligt.

```text
mysql -uroot -p
```

Eventuellt får du problem med följande felmeddelande.

> ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2 "No such file or directory")

Pröva då att ange vilken host du vill connecta till. Databasservern ligger på samma host så vi anger `-h127.0.0.1`.

```text
mysql -uroot -p -h127.0.0.1
```

Om du får problem med 'caching_sha2_password' så använder du din alternativa användare.

> "ERROR 2059 (HY000): Authentication plugin 'caching_sha2_password' cannot be loaded: /usr/lib/x86_64-linux-gnu/mariadb18/plugin/caching_sha2_password.so: cannot open shared object file: No such file or directory"

Min alternativa användare hette "mos".

```text
mysql -umos -p -h127.0.0.1
```

Det kan se ut så här.

[FIGURE src=image/snapvt19/mysql-debian-bash.png?w=w3 caption="Startar terminalklienten på Debian/Bash i Windows 10."]

Bra, då kan vi använda Debian/Bash för att köra terminalklienten, och koppla oss mot databasservern som är installerad i Windows.



Installera terminalklienten i Cygwin {#win10cygwin}
--------------------------------------

Om du vill köra terminalklienten i Cygwin så gör du bäst i att installera den direkt i Cygwin. Även om du kan köra den klienten som du installerade i Windows, så fungerar den inte så bra i Cygwin, man kan starta den men inget skrivs ut. Det har att göra med att Windowsinstallationen och Cygwinterminalen inte är riktigt kompatibla.

Du kan istället göra en lokal installation av `mysql` i Cygwin med pakethanteraren.

```text
apt-cyg install mysql
```

Det kan sedan se ut så här när du testar och startar klienten.

[FIGURE src=image/snapvt19/mysqli-cygwin.png?w=w3 caption="Startar terminalklienten i Cygwin på Windows."]

Även här behövde vi ange hosten till 127.0.0.1 (se installationen av Debian/Bash ovan), samt min optionella användare, för att det skulle gå att göra uppkopplingen från klienten till databasservern.



Alltid koppla sig till en viss host (.my.cnf) {#mycnf}
--------------------------------------

Vi kan undvika att skriva in hostens namn och istället lägga till den i en konfigurationsfil `.my.cnf`. Det är en bra idé om du kör på Windows med Bash eller Cygwin.

Du skapar en konfigurationsfil `.my.cnf` och lägger i din hemmakatalog.

På Bash och Cygwin kan du skapa filen så här.

```text
touch $HOME/.my.cnf && chmod 600 $HOME/.my.cnf
```

Sedan kan du fylla filen med innehåll, så här. `$HOME` är samma sak som `~`, båda pekar på din användares hemmakatalog.

```text
echo -e "[client]\nhost=127.0.0.1\nprotocol=tcp" >> ~/.my.cnf
```

Du kan nu titta på filen med följande kommandon. Först lista filen för att se dess storlek och rättigheter och sedan göra cat för att visa filens innehåll.

```text
ls -l ~/.my.cnf
cat ~/.my.cnf
```

Filen skall innehålla följande.

```text
[client]
host=127.0.0.1
protocol=tcp
```

Så här kan det se ut när du kör kommandona.

[FIGURE src=image/snapvt19/wsl-create-mycnf-without-editor.png?w=w3 caption="Du har nu skapat en konfigurationsfil som terminalklienten läser in."]

Alternativt kan du använda en texteditor för att skapa och redigera filen, [dock fungerar texteditorn inte så bra med filsystemet på WSL](t/8203).

Nu kan du testa att starta terminalklienten, utan att ange host.

Terminalklienten kopplar nu alltid upp mot den valda hosten, om inte annat anges.

Jag väljer att även lägga till protokollet eftersom det sägs att vissa installationer av Cygwin kan behöva det för att uppkopplingen skall fungera.

Om du får felmeddelande som påpekar att konfigurationsfilens rättigheter är alltför vidlyftiga, så löser du det genom att ändra filens rättigheter.

Felmeddelandet kan säga följande.
 
> "mysql: [Warning] World-writable config file '/home/mos/.my.cnf' is ignored."

Ändra filens rättigheter så att bara du som är dess ägare kan läsa den.

```text
chmod 600 $HOME/.my.cnf
```

Nu skall det fungera. Denna konfigurationsfilen är bra att ha och jobbar man mycket med terminalprogrammen så kan det underlätta att spara viss konfigurationsinformation i filen.



Alternativ till installation {#alternativ}
--------------------------------------

Du kan använda [MariaDB](https://mariadb.org/download/) som ett alternativ till MySQL.

Du kan använda den versionen av MySQL/MariaDB som följer med XAMPP.



Avslutningsvis {#avslutning}
--------------------------------------

Detta var de steg som krävs för att installera databasen MySQL, dess terminalklienter i PATH och desktopklienten MySQL Workbench på Windows 10.

Denna artikel har en [egen forumtråd](t/8165) som du kan ställa frågor i, eller ge tips.
