---
author: mos
revision:
    "2022-04-25": "(A, mos) Första utgåva inför kursstart vt22."
...
Database ORM - Object Relational Mapping
====================

Som en del i en Zoom-session från 2021 hölls en föreläsning om "Database ORM - Object Relational Mapping" och det ger en bra introduktion till vad detta kmom handlar om.

Videon är 39 minuter lång.

[YOUTUBE src="tCbb3ahGGpA" width=700 caption="Database ORM - Object Relational Mapping."]

Du kan själv bläddra igenom [de HTML slides som används i presentationen](https://dbwebb-se.github.io/mvc/lecture/L05-orm/slide.html).



Om PHP PDO och ORM
------------------------

I PHP erbjuder PHP PDO ett _data access lager (DAL)_ som är lika oavsett databas. De metoder man använder för att koppla sig mot databasen och ställa frågor är lika oavsett vilken databas som används. Man har "unifierat" gränssnittet mot olika databaser.

PDO erbjuder inte ett _database access lager (DBAL)_ som ger möjligheten att skriva samma SQL-frågor, oavsett databas. Ett DBAL interface är _databas agnostiskt_ och kommunicerar på exakt samma sätt, oavsett vilken databas som ligger bakom. Ett sådant gränssnitt översätter normalt SQL-frågorna så att de blir lika och fungerar oavsett underliggande databas men det är inget som applikationsprogrammeraren behöver bry sig om.

Ett lager av ORM kan bygga vidare på ett lager DBAL och låter dig behandla relationsdatabasens innehåll som objekt. Några av de vanligaste designmönster som är implementerade i ett ORM är Active record och Repository, andra varianter som kan förekomma är bland annat Table Data Gateway, Row Data Gateway samt Data Mapper. Implementationerna skiljer mellan olika leverantörer av ORM.



Resurser
------------------------

Följande resurser används i olika omfattning i samband med föreläsningen. Kika på dem för att lära dig mer om det område som föreläsningen täcker.

PHP manualen.

* [PHP PDO](https://www.php.net/manual/en/book.pdo.php)

Wikipieda.

* [Data access layer](https://en.wikipedia.org/wiki/Data_access_layer)
* [Database abstraction layer](https://en.wikipedia.org/wiki/Database_abstraction_layer)
* [Object Relational Mapping](https://en.wikipedia.org/wiki/Object%E2%80%93relational_mapping)

Designmönster för data access och object-to-relational mapping.

* [Data Access Patterns: The Features of the Main Data Access Patterns Applied in Software Industry](https://medium.com/mastering-software-engineering/data-access-patterns-the-features-of-the-main-data-access-patterns-applied-in-software-industry-6eff86906b4e), en kort artikel om olika designmönster som finns för data access.
* [Catalog of Patterns of Enterprise Application Architecture](https://www.martinfowler.com/eaaCatalog/index.html) innehåller beskrivningen av flera designmönster relaterade till ett ORM, till exempel följande.
    * [Query Object](https://www.martinfowler.com/eaaCatalog/queryObject.html)
    * [Data Mapper](https://www.martinfowler.com/eaaCatalog/dataMapper.html)
    * [Active Record](https://www.martinfowler.com/eaaCatalog/activeRecord.html)
    * [Repository](https://www.martinfowler.com/eaaCatalog/repository.html)
