---
author: mos
category:
    - kurs mvc
revision:
    "2021-04-27": "(B, mos) Stryk kravet om tärningssida, räcker med att man portar spelet."
    "2021-04-16": "(A, mos) Första utgåvan."
...
Analysera PHP ramverk och välj ut ett att använda
===================================

Du kommer att få tips om ett par av de mest välkända PHP ramverken och du skall aktivt analysera dem för att välja ut ett av dem. Det du väljer skall du implementera en enklare webbplats i.

<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har PHP i din path i terminalen och du har installerat composer.

Du kan grunderna i hur ett PHP ramverk fungerar och du är bekväm i terminologin som används



<!--
Genomgång {#genom}
------------------------

Här är en video som "pratar" dig igenom uppgiftens upplägg och visar hur du kommer igång.

[YOUTUBE src="gKzwQTG9eCI" width=700 caption="Kurs mvc kmom03 tisdagsgenomgång, del 3/3 uppgiften (Zoom med Mikael)."]
-->



Introduktion och förberedelse {#intro}
-----------------------

Gör följande steg för att förbereda dig för uppgiften.



### Spara filerna i me {#me}

Alla filerna sparar du i ditt kursrepo under `me/framework/` (skapa katalogen om den inte finns).



### Git och GitHub/GitLab {#git}

När du är klar så skall du göra ett Git-repo av dina filer och ladda upp dem på GitHub/Lab.



### Läs på om ramverk {#ramverk}

Följande ramverk rekommenderas att du tittar på. Du är dock inte begränsad till dessa utan du kan välja andra om du finner det intressant.

* Symfony
* Laravel
* Yii
* Laminas

Du finner [läsanvisningar om ramverken i kursmomentet mvc/kmom04](kurser/mvc-v1/kmom04#resurser).



Krav {#krav}
-----------------------

Kraven är uppdelade i sektioner.



### Installera ramverket {#installera}

1. Installera och skapa en landningssida med en meny så man kan förflytta sig mellan sidorna på din webbplats.

1. <s>Skapa en sida där man kan rulla din tärning och eller tärningshand.</s> Gör denna som övning, inte nödvändig när du väl lyckats porta ditt spel.

1. Porta spelet 21 och/eller Yatzy till ramverket. Välj båda om du känner att du har koll på det här.

1. Du får gärna skriva om din kod så att den passar ihop bra med ramverkets tankar om hur man skriver kod.



### Kopiera din utvecklingsmiljö {#utvmiljo}

Följande bör du klara av på egen hand. Om du av någon anledning får ont om tid eller inte klarar av detta så kan du hoppa över denna delen för tillfället och ändå lämna in ditt kursmoment. Men du bör notera eventuella problem och hinder och skapa issue om det i kursrepot.

1. Kopiera din `Makefile` till ramverket och döp den till `Makefile.mvc`. Namnbytet är så att den inte krockar med någon annan Makefile som eventuellt redan ligger på plats. OBS! Om du vill använda den här filen med `make`-kommandot måste du ange filnamnet på det här sättet: `make -f Makefile.mvc phpunit`.

1. Kopiera över alla konfigurationsfiler för validatorerna, men se till så att du inte skriver över någon fil som redan ligger i ramverket. Konfigurationsfilerna är de som heter `.php*` i din katalog `me/game`.

1. Kopiera över dina enhetstester i katalogen `test/` och försök att integrera dem i ramverket.



### Kopiera din utvecklingsmiljö {#utvmiljo}

Följande bör du klara av på egen hand. Om du av någon anledning får ont om tid eller inte klarar av detta så kan du hoppa över denna delen för tillfället och ändå lämna in ditt kursmoment. Men du bör notera eventuella problem och hinder och skapa issue om det i kursrepot.

1. Uppdatera din `htaccess` och publicera din lösning på studentservern.



### Publicera {#publicera}

1. När du är klar, kör `make test` för att köra alla testerna mot ditt repo. När man kör `make test` så bör det passera utan allvarliga felmeddelanden.

1. Dubbelkolla att webbplatsen fungerar på studentservern genom att göra en `dbwebb publishpure me` och testköra den.

1. Committa alla filer till ditt repo och lägg till en ny tagg (1.0.\*). Öka versionnumret om du lägger till ändringar (1.0.1, 1.0.2 och så vidare). Rättaren kommer normalt sett att använda din senaste tagg som är >= 1.0.0 och < 2.0.0.

1. Pusha upp repot till GitHub/GitLab, inklusive taggarna.



<!--
Extrauppgift {#extra}
-----------------------

Lös följande extrauppgifter om du har tid och lust.

test

make, validators

21, yatzy

-->



Tips från coachen {#tips}
-----------------------

Använd de manualer och lärresurser som varje ramverk erbjuder.

Försök uppdatera din kod så att den blir mer "ramverksmässig". varje ramverk kan ha sin egen tolkning av vad det innebär.

Lycka till och hojta till i chatt och forum om du behöver hjälp!
