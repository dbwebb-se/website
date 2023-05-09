---
author: mos
category:
    - kurs mvc
revision:
    "2023-05-02": "(C, mos) Ändra library/reset till optionellt."
    "2023-04-28": "(B, mos) Uppdaterad inför ht23 och optionell inloggnin gborttagen."
    "2022-04-25": "(A, mos) Första utgåvan till mvc-v2."
...
Kom igång med Doctrine ORM i Symfony
===================================

Du har sedan tidigare ett Symfony projekt och skall nu koppla en databas till det.

Du skall använda Doctrine ORM som är ett fristående projekt och väl integrerat med Symfony.

Du skall skapa en databas med en eller flera tabeller och bygga en Symfony applikation som utför CRUD (Create, Read, Update, Delete) mot databasen.

Du kan välja att använda databasen SQLite eller MariaDB/MySQL.

<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har sedan tidigare ett Symfony projekt som du kan jobba vidare på.

Du bör ha jobbat igenom någon övning som visar hur Symfony fungerar tillsammans med Doctrine.

Du kan använda SQLite eller MariaDB/MySQL.



Introduktion och förberedelse {#intro}
-----------------------

Du skall göra en mindre CRUD applikation i Symfony med Doctrine. Du kan välja fokus för din applikation. Standardfokuset på uppgiften är "Bibliotek med böcker" men du kan ändra fokus och spara andra saker i din databas.

Du kan välja mellan SQLite och MariaDB. Om du väljer SQLite så ligger hela databasen i en fil och följer med till produktionsmiljön (studentservern). Du har alltså samma databas lokalt och på produktionsmiljön. Om du jobbar med MariaDB så har du en databas lokalt och en annan databas på produktionsservern. Det blir lite mer "riktigt" men också lite mer konfiguration att hantera. Är du osäker så kan du börja med SQLite och den enklare vägen. Du kan alltid byta databas i ett senare skede.



Krav {#krav}
-----------------------

Kraven är uppdelade i sektioner.



### Bibliotek CRUD {#crud}

1. Skapa en landningssida `library/` för din "Bibliotek" applikation. Placera landningssidan i din navbar.

1. Skapa en databas som innehåller en tabell med böcker. Lägg in minst tre böcker (riktiga eller påhittade) med deras titel, ISBN och författare samt en bild som representerar boken.

1. [CREATE] Skapa en möjlighet att lägga till en ny bok. Man skall kunna mata in detaljer om boken i ett formulär.

1. [READ ONE] Skapa en webbsida där man kan se detaljer om en viss bok.

1. [READ MANY] Skapa en webbsida där man kan se samtliga böcker i en HTML tabell (eller liknande). Man skall kunna klicka på en bok och komma vidare till en sida som enbart visar detaljer om den boken.

1. [UPDATE] Man skall kunna uppdatera detaljer om en bok. Det skall finnas en sida som visar bokens detaljer i ett formulär och man skall kunna uppdatera bokens detaljer och spara dem.

1. [DELETE] Man skall kunna radera en bok.

1. Använd GET och POST. Kom ihåg att alltid använda POST när du gör en uppdatering i databasen.

1. Alla delar av "Biblioteket" skall fungera tillsammans som en applikation. Det finns länkar och formulär som är sammankopplade och man får en "user experience" av att applikationen hänger ihop.

1. [OPTIONELLT] Inkludera möjligheten att återställa databasen till sitt ursprungliga innehåll via routen `library/reset`.



### Bibliotek JSON {#json}

1. I din landningssida för `api/` lägger du till routen `api/library/books` som visar upp samtliga böcker i biblioteket i en JSON struktur.

1. Lägg till routen `api/library/book/<isbn>` där man kan se en av böckerna via dess ISBN nummer. Lägg till ett exempel som länkar direkt till en av böckerna i biblioteket. 



<!--
### Användare och login {#anv}

Detta kravet är OPTIONELLT och du gör det om du har tid, energi och lust. Du kan också göra delar av kravet för att prova på.

(Eventuellt har du nytta av kravet i projektet, men det är ingen garanti på det.)

1. Gör en CRUD för användare till din webbplats. Man skall kunna lägga till, visa, uppdatera och ta bort användare.

1. Detaljer du kan spara om användaren är epost, akronym, namn, lösenord och typ av användare (vanlig eller administratör).

1. Lägg till minst två användare från början. Döp dem till admin med lösenord admin och doe med lösenord doe.

1. Lägg till en bild till användaren som genereras utifrån epostadressen och använder [Gravatar](https://sv.gravatar.com/) för att visa bilden.

1. Spara användarens lösenord med [`password_hash()`](https://www.php.net/manual/en/function.password-hash.php).

1. Gör en inloggningssida där användaren kan logga in på din webbplats. Använd [`password_verify()`](https://www.php.net/manual/en/function.password-verify.php) när du kontrollerar användarens lösenord.

1. Gör en profilsida för användaren som bara kan visas när användaren är inloggad och den visar enbart information om den inloggade användaren.

1. Gör så att en inloggad användare kan uppdatera sin egen profilinformation.

1. Gör så att det bara är användaren som är administratör som kommer åt att visa, skapa, uppdatera och radera samtliga användare på webbplatsen.

1. Administratören kan även uppdatera rollen för en användare.

1. Lägg till så att en ny användare kan registrera sig själv på webbplatsen och därefter kan logga in direkt.
-->



### Utvecklingsmiljö {#miljo}

1. Fixa till din kod enligt den kodstil du kör genom att köra `composer csfix`.

1. Kolla din kod hur den matchar dina linters genom att köra `composer lint`.

1. Dubbelkolla att dina testfall passerar med `composer phpunit`.

1. Generera dokumentation av din kod med `composer phpdoc`.



### Publicera {#publicera}

1. Committa alla filer och lägg till en tagg 5.0.0. Om du gör uppdateringar så ökar du taggen till 5.0.1, 5.0.2, 5.1.0 eller liknande.

1. Kör `dbwebb test kmom05` för att kolla att du inte har några fel.

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
