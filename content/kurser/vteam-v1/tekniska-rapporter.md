---
views:
    flash:
        region: flash
        template: default/image
        data:
            src: "image/vteam/logo.png"
author: mos
revision:
    "2023-11-06": "(C, mos) Fixade brustna länkar samt lade till första rapporten för 2023."
    "2023-11-06": "(B, mos) Stycke om hur man gör studie."
    "2022-12-01": "(A, mos) Flyttad från tips o trix till eget dokument."
...
Tekniska studier & rapporter
=========================

En teknisk studie är (i vårt sammanhang) när man undersöker en viss sak/feature och skriver ned resultatet i någon form av dokument som kan spridas.

Här är några av de tekniska studier som förekommit under kursens historia.



Hur gör jag en teknisk studie och rapport? {#hur}
-----------------------

Börja med att klura ut vad du vill undersöka och formulera de frågor du vill ha svar på. Använd det för att skapa en **Titel** och en **Introduktion** till din tekniska studie.

Många studier kan dokumenteras i ett repo. Skapa gärna ett eget repo för din studie och använd filen `README.md` för att dokumentera den. När du är klar blir detta din "tekniska rapport".

När du "skriver av dig" så kan du rikta dig till dina team-medlemmar och ditt fokus är att utbilda dem. Besvara de frågor du ställde inledningsvis och visa med bilder och kod hur du jobbar.

En studie kan dokumenteras snabbt och lite slarvigt, den kan även dokumenteras prydligt med länkar och referenser. Välj det som lämpar sig bäst och fundera på hur mycket tid du har till att genomföra studien.

När du är klar så sprider du studien och gör dig redo för att eventuellt uppdatera den, korrigera eller komplettera beroende på vilka kommentarer du får av läsarna.



2023 {#2023}
-----------------------

Här följer tekniska studier (och liknande) som utfördes under 2023.

1. [Jämför snabbheten mellan olika operationer i mariadb eller mongodb](https://github.com/p0ntan/tec-db). Ett verktyg att testa olika datatyper och dess hastighet i olika databaser.

1. [Typesafe JavaScript with JSDoc and TypeScript](https://github.com/kiwijos/vteam-ts-jsdoc-study) om att använda JSDoc och TypeScript för att säkra sin vanliga JavaScript.



2022 {#2022}
-----------------------

Här följer tekniska studier (och liknande) som utfördes under 2022.

1. [Teknisk studie RabbitMQ](https://github.com/blajban/vteam-rabbitmq) som meddelandehanterare, "message brokern".

1. [Hur man använder github i ett team](https://github.com/FalkenDev/V-Team-SparkRentals/blob/dev/Technical%20analyses/github.md)

1. [Teknisk studie om Load Balancers för REST API](https://github.com/FalkenDev/V-Team-SparkRentals/blob/dev/Technical%20analyses/load-balancer.md)

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

<!--
ministudie på paketet node-cache. 
https://github.com/Stenbergcool/cacheStudie
-->


<!--
gokväll! om man vill göra life-like rutter för simuleringen kan jag tipsa om detta API:

https://openrouteservice.org/dev/#/api-docs/introduction

för de av er som gillar GIS finns det också en plugin till QGIS som gör att man kan plutta ut lite punkter från och lite punkter till och batcha iväg till API:t för att få tillbaka lite goa rutter

man behöver regga sig för att få en api-key, och finns lite begränsningar i antalet req man kan göra, men räcker för att snurra upp det som behövs för oss

sen kan man också tanka hem en färdig (förutom config) docker-container och bygga ihop backend för detta api själv, inte jätteknepigt men kräver att man plockar hem OSM-data att rutta på vilket kan vara pilligt kanske. men då kan man ropa hur mycket man vill på api såklart

---

Coolt! Tack för tipset. Vi, eller snarare @John.Fredriksson, hittade denna http://project-osrm.org/. Behövs ingen registrering eller api-key men detta gäller:  Persistent connections are limited to 512 requests per connection and allow no more then 5 seconds between requests. Inte säker på vad det har för konsekvenser. Har funkat bra hittills när vi jobbat med simuleringen med många cyklar i alla fall.

-->


2021 {#2021}
-----------------------

Här följer ett par tekniska studier (och liknande) som utfördes under 2021.

1. [OAuth Technical Study](https://github.com/mosbth/oauth-tec-study/blob/main/OAuth_Technical_Study.md) (exempel från mos hur en teknisk rapport kan skrivas)

1. [Technical study - Cordova plugin for scanning QR-code](https://github.com/jeso20BTH/Electric-Scooter-BTH-Pattern-Group-13/blob/main/qr-scanner-study.md)

1. [Git sandbox, frågor och svar om Git flow](https://github.com/datalowe/pattern-git-sandbox)


