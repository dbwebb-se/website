---
author: mos
revision:
    "2021-02-10": "(A, mos) Första utgåva inför kursstart VT2021."
...
Transaktioner i databaser - ACID
====================

En genomgång av transaktionsbegreppet i databasen och vad ACID innebär samt lite om hur storage engines och låsningsstrategier kan påverka transaktionereras prestanda och pålitlighet.

Denna föreläsning är bra att se på som en del i förberedelserna inför att jobba med kmom04.

Videon är 36 minuter lång.

[YOUTUBE src="_iCPaJIvlmw" width=700 caption="Transaktioner i databaser - ACID (med Mikael)."]

Du kan själv bläddra igenom [de HTML slides som används i presentationen](kursmaterial/databas/forelasning/v1/f04-transaktioner/slide.html).



Resurser
------------------------

Följande resurser används i olika omfattning i föreläsningen.

* MySQL manualen om transaktioner, storage engines och låsningsstrategier.
    * "[MySQL Transactional and Locking Statements](https://dev.mysql.com/doc/refman/8.0/en/commit.html)"
    * "[MySQL InnoDB Locking and Transaction Model](https://dev.mysql.com/doc/refman/8.0/en/innodb-locking-transaction-model.html)"
    * "[The InnoDB Storage Engine](https://dev.mysql.com/doc/refman/8.0/en/innodb-storage-engine.html)"
    * "[Alternative Storage Engines](https://dev.mysql.com/doc/refman/8.0/en/storage-engines.html)"
* Boken Databasteknik med webbkursen "[Transaktioner](http://www.databasteknik.se/webbkursen/transaktioner/index.html)".
* [Manualen för npm mysql](https://www.npmjs.com/package/mysql).
