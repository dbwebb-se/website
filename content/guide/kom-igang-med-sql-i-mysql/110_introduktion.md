---
author: mos
revision:
    "2019-01-10": "(C, mos) Flyttade delar till Inledning samt nya länkar till installation och kom igång med klienter."
    "2018-03-20": "(B, mos) Bort med referens till BTHs labbmiljö."
    "2017-12-27": "(A, mos) Första versionen, uppdelad av större dokument."
...
Introduktion
==================================

Denna guide/övning/laboration handlar om att komma igång med SQL mot databasen MySQL/MariaDB. Den består av övningar där du får börja skapa tabeller, fylla dem med innehåll och därefter ställa SQL-frågor för att söka ut och bearbeta innehållet. Övningen tar dig igenom de vanliga förekommande konstruktionerna som du behöver känna till. Lär dig dem och du kommer att ha en god grund för att behärska databaser. De första övningarna är enkla och övningarna mot slutet lite mer utmanande.

Övningen är utvecklad för MySQL och kompatibel med MariaDB och visar både på standard SQL och på databasspecifika frågor av mer databasadministrativ karaktär.

När det finns hänvisningar till referensmanualen så avses [referensmanualen för MySQL](http://dev.mysql.com/doc/refman/8.0/en/).

Om du använder [MariaDB så har de en motsvarande referensmanual](https://mariadb.com/kb/en/library/documentation/).

Du kan välja att göra övningen i valfri klient. Jag har gjort övningen i MySQL Workbench och kommandoradsklienten.



Förkunskaper {#forkunskaper}
----------------------------------

Du behöver ha tillgång till en [databasserver för MySQL och klienter som Workbench och terminalklienten](labbmiljo/mysql-med-workbench).

Du behöver ha grundläggande kunskap om hur du använder terminalerna och hur du kopplar dig till databasen. Behöver du hjälp så jobbar du igenom artikeln "[Introduktion till databasen MySQL/MariaDB, dess klienter och SQL](kunskap/introduktion-till-mysql-mariadb-dess-klienter-och-sql)".

Mitt förslag är att du jobbar lokalt mot en egen databasserver och använder terminalklienten `mysql` samt desktopklienten MySQL Workbench. Glöm inte att spara allt du gör i filer.
