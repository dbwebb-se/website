---
author: mos
revision:
    "2021-03-03": "(A, mos) Första utgåva inför kursstart VT2021."
...
Index och prestanda i databasen
====================

En genomgång som startar med en allmän diskussion av de delar som påverkar den upplevda prestandan av en databas och sedan fortsätter med index för att se hur de kan användas för att ge databasens frågeoptimerare optimala förutsättningar för att genomföra sitt arbete så att vi kan undvika "full table scans".

Denna föreläsning är bra att se på som en del i förberedelserna inför att jobba med kmom06.

Videon är 42 minuter lång.

[YOUTUBE src="IfoqhfONnCY" width=700 caption="Index och prestanda i databasen (med Mikael)."]

Du kan själv bläddra igenom [de HTML slides som används i presentationen](kursmaterial/databas/forelasning/v1/f06-index-och-prestanda/slide.html).



Resurser
------------------------

Följande resurser används i olika omfattning i föreläsningen.

* Artikel om "[Index och prestanda i MySQL](kunskap/index-och-prestanda-i-mysql)".

* MySQL manualen om index och prestanda.
    * [Chapter 8 Optimization](https://dev.mysql.com/doc/refman/8.0/en/optimization.html)
    * [8.3 Optimization and Indexes](https://dev.mysql.com/doc/refman/8.0/en/optimization-indexes.html)
    * [8.3.1 How MySQL Uses Indexes](https://dev.mysql.com/doc/refman/8.0/en/mysql-indexes.html)
    * [8.8.1 Optimizing Queries with EXPLAIN](https://dev.mysql.com/doc/refman/8.0/en/using-explain.html)
    * [13.1.15 CREATE INDEX Statement](https://dev.mysql.com/doc/refman/8.0/en/create-index.html)
    * [13.7.7.22 SHOW INDEX Statement](https://dev.mysql.com/doc/refman/8.0/en/show-index.html)
