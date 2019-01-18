---
author: mos
category:
    - databas
    - mysql
    - mariadb
    - debian/linux
    - docker
revision:
    "2019-01-10": "(B, mos) Lade till hänvisning till komplett exempel."
    "2019-01-09": "(A, mos) Första utgåvan."
...
Kör MySQL Server och MySQL WorkBench via Docker
==================================

[FIGURE src=image/snapvt19/docker-compose-db-initiated.png?w=c5 class="right"]

Vi skapar en egen lokal utvecklingsmiljö för databasen MySQL/MariaDB genom att använda Docker för att köra databasservern.

Vi använder terminalklienten `mysql`, inuti en separat docker-kontainer, för att koppla oss mot databasen.

<!--more-->



Förberedelse {#prep}
--------------------------------------

Du har Debian/Linux installerat. Eventuellt kan/bör detta fungera även på macOS och Windows 10, men jag har inte testat den persistenta lagringen.

Du är bekant med terminalen.

Du har installerat docker och docker-compose och du är bekant med verktygen.




Kör MySQL server via docker {#docker}
--------------------------------------

Jag utgår från den [docker image som finns för MySQL](https://hub.docker.com/_/mysql/). Där finns också exempel på hur man använder MySQL med docker.

Som alternativ kan du använda motsvarande [docker image för MariaDB](https://hub.docker.com/_/mariadb).

Jag kan starta senaste versionen av MySQL i en kontainern med namnet "mysql" och med lösenordet "password" till root-användaren samt kopplar den lokala porten 13306 till porten 3306 i kontainern.

```text
docker run --name mysql -p 13306:3306 -e MYSQL_ROOT_PASSWORD=password -d mysql:latest
```

Du kan stoppa kontainern, och starta den igen.

```text
docker stop mysql
docker start mysql
```

Du kan koppla dig mot kontainern och köra terminalklienten `mysql`.

```text
docker exec -it mysql bash
```

Det kan se ut så här.

[FIGURE src=image/snapvt19/docker-exec-mysql-client.png?w=w3 caption="Med hjälp av mysql i docker-kontainern kan du koppla dig mot databasen."]

Du kan radera kontainern när du inte vill ha den kvar längre.

```text
docker stop mysql
docker rm mysql
```

Ovan sparas ingen data i databasen mellan körningarna, låt oss se hur det kan lösas med volymer.



Kör MySQL server via docker-compose {#docker-compose}
--------------------------------------

Låt oss använda `docker-compose` och skapa en konfiguration som använder volymer så att databasen kan vara persistent.

Börja med att skapa filen `docker-compose.yaml`. Vi gör en konfiguration med en databasserver "mysql" och en klient "mysql-client". Databasservern använder en volym för att lagra datan persistent.

<!--
#container_name: mysql
#container_name: mysql-client
command: --default-authentication-plugin=mysql_native_password
MYSQL_DATABASE: "db"
MYSQL_USER: "user"
MYSQL_PASS: "pass"
-->

```text
version: "3"
services:
    mysql:
        image: mysql:latest
        restart: always
        ports:
            - "13306:3306"
        environment:
            MYSQL_ROOT_PASSWORD: "password"
        volumes:
            - mysql_data:/var/lib/mysql

    mysql-client:
        image: mysql:latest

volumes:
    mysql_data: {}
```

Vi kan kan nu intiera och starta tjänsten "mysql".

```text
docker-compose up -d mysql
```

Vi kan nu stoppa och starta tjänsten, vid behov.

```text
docker-compose stop mysql
docker-compose start mysql
```

Vi kan använda tjänsten "mysql-client" för att köra terminalklienten och koppla upp oss mot databasservern i tjänsten "mysql".

```text
docker-compose run mysql-client bash
```

Vi kan nu öppna terminalklienten för mysql och koppla oss mot databasservern i tjänsten "mysql" med följande kommando.

```text
mysql -u root -p -h mysql
```

Det kan se ut så här.

[FIGURE src=image/snapvt19/docker-compose-client-connected.png?w=w3 caption="Klienten kopplad mot databasserver med hjälp av docker-compose."]

Du kan ta bort kontainern och dess volym, när du är klar och inte vill använda kontainern och volymen mer. All data försvinner då från databasen.

```text
docker-compose down -v
```



Initialisera databasservern {#init}
--------------------------------------

När kontainern för databasservern startas för första gången så letar den igenom en katalog efter filer att exekvera, där kan du lägga filer med ändelsen `.sql` och de kommer att exekveras så att du kan bygga upp en databas i din kontainer.

Du kan uppdatera din `docker-compose.yaml` och montera en lokal katalog. Du behöver sedan bara placera dina SQL-filer i katalogen och de läses upp varje gång som kontainern initieras.

Så här kan den nya delen med ytterligare en volym se ut.

```text
version: "3"
services:
    mysql:
        volumes:
            - ./sql.d:/docker-entrypoint-initdb.d
```

För att testa så skapar vi en fil `sql.d/init.sql` som skapar en databas, en användare och en tabell med innehåll.

```sql
CREATE USER 'doe'@'%' IDENTIFIED BY 'pass';
GRANT ALL PRIVILEGES ON doe.* TO 'doe'@'%';

CREATE DATABASE doe;
USE doe;

CREATE TABLE doe ( namn CHAR(10) );
INSERT INTO doe VALUES ("Jane Doe"), ("John Doe");
```

Vi kan du rensa volymnerna från kontainern "mysql" och intiera den på nytt.

```text
docker-compose down -v
docker-compose up -d mysql
```

Nu är databasservern initierad och vi kan koppla upp oss med klienten för att se att tabellen ligger på plats och att vi kan koppla upp oss med användaren mot databasen "doe".

```text
docker-compose run mysql-client bash
mysql -u doe -p -h mysql doe
```

Sedan kan vi kolla om det finns något i tabellen.

```sql
SELECT * FROM doe;
```

Det kan se ut så här.

[FIGURE src=image/snapvt19/docker-compose-db-initiated.png?w=w3 caption="Databasen kan initieras med innehåll."]



Komplett exempel {#exempel}
--------------------------------------

I kursrepot för kursen databas finns en katalog med ett komplett exempel som är anpassat till MySQL och delvis förberett för MariaDB. Exemplet innehåller en `docker-compose.yaml` för både MySQL och MariaDB, server och klienter. Det finns en katalog `sql.d/` där man lägger startupfiler och exemplet är konfigurerat så att man kan koppla upp sig med externa klienter.

Du hittar exempelkoden i [example/docker](https://github.com/dbwebb-se/databas/tree/master/example/docker) och det finne en README som beskriver hur du kan jobba med exempelkoden.

Förslagsvis kan du utgå från det exemplet om du vill komma igång och jobba mer aktivt med databasservern körandes i en docker-kontainer.



Avslutningsvis {#avslutning}
--------------------------------------

Detta var några exempel på hur du kan köra MySQL Server med hjälp av Docker och hur du kan koppla dig med klienten mot databasservern.

Denna artikel har en [egen forumtråd](t/8173) som du kan ställa frågor i, eller ge tips.
