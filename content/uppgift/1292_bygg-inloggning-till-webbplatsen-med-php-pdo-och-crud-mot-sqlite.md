---
author: mos
category:
    - kurs webtec
revision:
    "2022-10-03": "(A, mos) Första utgåvan till webtec-v2."
...
Bygg inloggning till webbplatsen med PHP PDO och CRUD mot SQLite
===================================

Du skall bygga en inloggning till din webbplats samt möjlighet att lägga till nya användare, redigera detaljer om en användare och radera användare. Denna funktionalitet kan sammanfattas med CRUD för Create, Read, Update och Delete.

Det blir en del formulärhantering och databasaccess. TÄnk på att en del av koden är rätt lik och i vissa fall kan det vara bra att skapa funktioner som gör det lättare att återanvända delar av koden.

<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har jobbat igenom övningen "[Kom igång med CRUD i databasen SQLite med PHP PDO](kunskap/kom-igang-med-crud-i-databasen-sqlite-med-php-pdo)" och du har därmed fått en riktigt bra start inför uppgiften och du har en stor del av koden på plats.



<!--
Genomgång {#genom}
------------------------

Här är en video som "pratar" dig igenom uppgiftens upplägg och visar hur du kommer igång.

[YOUTUBE src="gKzwQTG9eCI" width=700 caption="Kurs mvc kmom03 tisdagsgenomgång, del 3/3 uppgiften (Zoom med Mikael)."]
-->



Introduktion och förberedelse {#intro}
-----------------------

Om du har jobbat igenom övningen så är du förberedd för uppgiften och du har tränat på de begrepp som används för att lösa uppgiften.



### Struktur {#struktur}

Du jobbar vidare med strukturen med sidkontrollers och vyer när du löser uppgiften.

Du skall också organisera din kod i funktioner, om och när du anser att det passar.



### Kom igång {#komigang}

Du skall skriva din kod i `me/report` och du skall ha en katalogstruktur likt den du använde i övningen. Följande kataloger och filer är relevanta.

```text
# Databasfilen
me/report/db/user.sqlite

# Funktioner
me/report/src/

# Sidkontrollers och processingsidor
me/report/public/

# Vyer
me/report/view/
```

I övningen visades hur du kom igång med databasen som ligger i ditt kursrepo under `example/pdo_crud/user.sqlite`.



### Färdiga användare i databasen {#admin_doe}

I databasen finns ett par färdiga användare som behöver finnas där för att det skall gå att rätta din inlämning. Det är användaren admin som skall ha lösenordet 'admin' och det är användaren doe som skall ha lösenordet 'doe'.

Dessa måste alltid finnas i din databas.



<!--
### Tips, trix och livlinor {#livlina}

I GitHub issuen "[Tips och trix till kmom04 och fotokalendern](https://github.com/dbwebb-se/webtec/issues/16)" finns det en del inspiration och tips och trix till hur man kan tänka och vilka eventuella svårigheter som finns i uppgiften.
-->



Krav {#krav}
-----------------------

Utför följande krav.

<!--
* Förtydliga vilka sökvägar som skall gälla, ange en sidkontroller och ange var databasfilen skall ligga.
-->

### Krav 1: Loginhantering på webbplatsen {#K1}

Det skall finnas en sida där man kan logga in till din webbplats. Från denna sida skall man även kunna klicka på en länk för att skapa ett nytt konto till webbplatsen.

Länken till login-sidan skall finnas i navbaren.

När användaren har loggat in skall navbaren ändras så att man kan se vilken användare som är inloggad och få länkar till användarens profil samt en länk så att man kan logga ut.

När man klickar på användarens profil så landar man på en sida där alla detaljer om användaren visas upp.

Det skall finnas en möjlighet för användaren att uppdatera detaljer såsom namn, avatar och signatur.

Användaren skall kunna byta lösenord.

Användaren skall kunna radera sitt eget konto via en länk från sin profilsida. När användaren raderar kontot skall användaren även loggas ut. Man kan bara radera sitt eget konto när man är inloggad.

Använd funktioner för att organisera kod som återkommer på flera sid- och processing-kontrollers.

Använd flash-meddelanden för att berätta för användaren vad som händer.

Använd redirects så att det blir ett bra flöde för användaren.



#### Testa min kod {#testK1}

För att testa din egen kod så kan du till exempel utföra följande.

* Logga in med admin/admin, se profilen, logga ut.
* Logga in med doe/doe, se profilen, logga ut.
* Skapa en ny användare.
* Logga in med den nya användaren.
* Se profilen.
* Uppdatera profilens namn/avatar/signatur.
* Byt lösenord och prova logga in med det nya lösenordet
* Radera användaren.



### Krav 2: OPTIONELLT Administration av användare {#K2}

Detta krav är optionellt och valfritt att genomföra. Du kan välja att göra hela kravet eller endast delar av det. 

Skapa en möjlighet för de användare som har rollen 'admin' att administrera samtliga användare på webbplatsen.

En admin skall kunna göra följande.

* Visa alla användare i en tabell.
* Klicka på en användare för att komma till dess profil.
* Via profilen se alla detaljer om användaren.
* Skapa en ny användare.
* Uppdatera detaljer om en användare.
* Radera en användare.



### Övriga krav {#krav}

1. Kontrollera att dina sidkontroller passerar Unicorn validatorn. Om du har några valideringsfel på CSS kan det ibland vara okey, men du bör inte ha något valideringsfel på HTML.


<!--
Extrauppgift {#extra}
-----------------------

Gör följande extrauppgifter om du har tid, lust och energi.

1. 
-->



Publicera {#publicera}
-----------------------

Avsluta uppgiften så här.

1. Kontrollera för dig själv att du har utfört samtliga krav.

1. Validera din PHP-kod med `dbwebb validate report`, rätta de valideringsfel du har.

1. När du är klar kan du publicera resultatet med `dbwebb publish report`. Se till att du inte har några valideringsfel.

1. Testa ditt resultat så att det passerar de automatiska testerna med `dbwebb test kmom06`.
