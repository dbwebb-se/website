---
views:
    flash:
        region: flash
        template: default/image
        data:
            src: "image/vteam/logo.png"
author: mos
revision:
    "2022-12-01": "(A, mos) Flyttad från tips o trix till eget dokument."
...
Tekniska studier & rapporter
=========================

En teknisk studie är (i vårt sammanhang) när man undersöker en viss sak/feature och skriver ned resultatet i någon form av dokument som kan spridas.

Här är några av de tekniska studier som förekommit under kursens historia.



2022
-----------------------

Här följer ett par tekniska studier (och liknande) som utfördes under 2022.

1. [Teknisk studie RabbitMQ](https://github.com/blajban/vteam-rabbitmq) som meddelandehanterare, "message brokern".

1. [Hur man använder github i ett Team](https://github.com/FalkenDev/V-Team-SparkRentals/blob/dev/github.md)

1. [Teknisk studie om Load Balancers för REST API](https://github.com/FalkenDev/V-Team-SparkRentals/blob/dev/load-balancer.md)

1. [Hantering av geodata i databas/backend](https://github.com/virtuella-team/vteam-sds/blob/main/teknisk-analys-geo/teknisk_analys_geo.md)

1. [Prestandatester](https://github.com/virtuella-team/vteam/tree/tzLocal), i har gjort några CRU(inget D) tester för att se hur backend reagerar på en stor mängd anrop på kort tid. 

1. [Docker technical study with React, Node and MariaDB](https://github.com/virtuella-team/vteam-sds/blob/main/teknisk_analys_docker/docker_technical_study.md)

1. [Guide: GitHub Projects](https://gist.github.com/jf-Lindberg/2146bf666c71ca78f7d685f023ad6728), introducera Github Projects och ge en grundläggande översikt över hur man kan använda det i ett team.

1. Vi har gjort en teknisk studie kring docker och react-native då det krånglade lite extra. I repot finns ett miniexempel med en simpel react-native app som hämtar lokalt från en express-server.
    * [Trying out react-native in Docker-container](https://github.com/eriknastesjo/dockerized-react-native)

1. En Teknisk studie / Guide som går igenom hur vi kan tackla en utmaning att generera flera tusen falska men samtidigt "legitima" användare. Vi använder här Python och modulen Faker för att skapa DML-filer som kan läsas in av t.ex. MYSQL.

    * [Dummy data for dummies - Users](https://github.com/johnfredriksson/tech-studies/blob/main/dummy-data-for-dummies/dummy-data-for-dummies-users.md)

1. Här kommer ytterligare en Teknisk Studie / Guide i samma tema som ovan (Dummy data). Här kikar vi på ett sätt att "lansera" en stad. Staden ska ha verkliga positioner, laddstationer och cyklar. Artikeln går igenom hur vi kan skapa DML-filer med Python som tillsammans skapar ~1600 stationer med ~8400 laddplatser och ~8400 cyklar runtom Stockholm. Artikeln är inte tänkt för att ge läsaren färdig kod att implementera utan snarare visa ett sätt att producera stora mängder falsk men ändå "äkta" data. Denna Studie är rätt "matig", men målet är att producera data till flera tabeller med fokus på relationer i form av främmande nycklar mellan tabeller.

    * [Dummy data for dummies - Relationships](https://github.com/johnfredriksson/tech-studies/blob/main/dummy-data-for-dummies/dummy-data-for-dummies-relations.md)

1. Här kommer en ny Teknisk Studie som handlar om Redis. Det blir en första introduktion till vad Redis är och varför det används. Sedan skapar vi en Redis-server i en docker container som vi manipulerar med Redis-klienten. Där provar vi på datatyper och metoder. I den andra halvan av Artikeln så försöker vi hitta ett syfte för Redis i vårt projekt. Vi går sedan vidare med att inkludera vår Redis-container i den befintliga 'docker-compose.yml' för projektet. Redis byggs in som ett lager mellan en route och databasen för att cacha undan datan som hämtas.

    * [Meet Redis, the first introduction to the in-memory cache](https://github.com/johnfredriksson/tech-studies/blob/main/redis/meet-redis.md)



2021
-----------------------

Här följer ett par tekniska studier (och liknande) som utfördes under 2021.

1. [OAuth Technical Study](https://github.com/mosbth/oauth-tec-study/blob/main/OAuth_Technical_Study.md) (exempel från mos hur en teknisk rapport kan skrivas)

1. [Technical study - Cordova plugin for scanning QR-code](https://github.com/jeso20BTH/Electric-Scooter-BTH-Pattern-Group-13/blob/main/qr-scanner-study.md)

1. [Git sandbox, frågor och svar om Git flow](https://github.com/datalowe/pattern-git-sandbox)


