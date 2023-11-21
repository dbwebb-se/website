---
author: mos
category:
    - kurs mvc
revision:
    "2023-04-20": "(B, mos) Genomgången inför vt23."
    "2022-04-18": "(A, mos) Första utgåvan i mvc-v2."
...
Enhetstesta dina klasser med PHPUnit i Symfony
===================================

Du skall jobba med enhetstestning mot din kod från kortspelet i Symfony. Dina testobjekt är alltså de klasser som du har i kortspelet. Vi kan inledningsvis exkludera controller-klasser och enbart fokusera på modell-klasserna.

Du skall skapa en testsuite av testfall som testar så mycket som möjligt och rimligt i dina testobjekt.

Tanken är att du försöker nå så hög kodtäckning som är möjligt och rimligt

<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du kan grunderna i enhetstestning med phpunit.

Du har installerat Xdebug och kan mäta kodtäckning med phpunit.



Introduktion och förberedelse {#intro}
-----------------------

Börja med att installera PHPUnit på det viset som Symfony rekommenderar att det görs tillsammans med en Symfony applikation. Du kan se hur man gör i artikeln "[Run unittests with PHPUnit in Symfony](https://github.com/dbwebb-se/mvc/tree/main/example/phpunit-symfony)".



Krav {#krav}
-----------------------

Kraven är uppdelade i sektioner.



### Installera och konfigurera {#phpunit}

1. Installera phpunit och lägg till det som ett skript `composer phpunit`.

1. Gör så att kodtäckningsrapport för HTML genereras till katalogen `docs/coverage`.



### Bygg en test suite {#testsuite}

1. Skapa en test suite för ditt kortspel.

1. Dina modellklasser är dina testobjekt och varje modellklass skall ha minst en testklass med testfall.

1. Varje testfall har minst en assertion.

1. Du har en kodtäckning som överträffar 70% på varje testobjekt men sikta mot att nå över 90% kodtäckning.

1. Det är helt okey om du vill uppdatera din källkod för att göra den bättre eller mer testbar. Code refactoring (att skriva om sin kod för att förbättra den) är ofta ett bra alternativ.

[OPTIONELLT] Som en extra utmaning kan du se om dina controllers är testbara med phpunit och i vilken mån du kan testa dem eller vad som krävs för att du skall kunna testa dem.



### Dokumentera kod {#dockblock}

1. Välj ut minst en av dina klasser och lägg till kommentarer med PHP DockBlock. Dina kommentarer skall minst innehålla en rads beskrivning av vad metoderna och klassen gör.

1. Generera dokumentationen till katalogen `docs/api` med kommandot `composer phpdoc`.



### Utvecklingsmiljö {#miljo}

1. Fixa till din kod enligt den kodstil du kör genom att köra `composer csfix`.

1. Kolla din kod hur den matchar dina linters genom att köra `composer lint`.

1. Dubbelkolla att dina testfall passerar med `composer phpunit`.

1. Generera documentation av din kod med `composer phpdoc`.



### Publicera {#publicera}

1. Committa alla filer och lägg till en tagg 4.0.0. Om du gör uppdateringar så ökar du taggen till 4.0.1, 4.0.2, 4.1.0 eller liknande.

1. Kör `dbwebb test kmom04` för att kolla att du inte har några fel.

1. Pusha upp repot till GitHub, inklusive taggarna.

1. Gör en `dbwebb publishpure report` och kontrollera att att det fungerar på studentservern.



<!--
Extrauppgift {#extra}
-----------------------

Lös följande extrauppgifter om du har tid och lust.

-->



Tips från coachen {#tips}
-----------------------

Lycka till och hojta till i chatt och forum om du behöver hjälp!
