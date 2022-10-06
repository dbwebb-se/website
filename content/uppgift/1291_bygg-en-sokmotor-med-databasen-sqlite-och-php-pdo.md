---
author: mos
category:
    - kurs webtec
revision:
    "2022-09-29": "(B, mos) Förtydliga så att man inte tror det behövs en JOIN."
    "2022-09-23": "(A, mos) Första utgåvan till webtec-v2."
...
Bygg en sökmotor med databasen SQLite och PHP PDO
===================================

Du skall bygga en sökmotor till din webbplats där du kan söka efter namn och deras betydelse och eventuellt mer information relaterat till datum och namn.

Du kommer jobba med HTML formulär via GET och du kopplar dig till en befintlig SQLite databas via PHP PDO.

Du jobbar i din tidigare struktur av sidkontrollers och vyer och bygger ut din befintliga webbplats.

<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har jobbat igenom övningen "[Kom igång med PHP PDO och databasen SQLite](kunskap/kom-igang-med-php-pdo-och-databasen-sqlite)" och du har därmed fått en bra start inför uppgiften.



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
me/report/db/db.sqlite

# Funktioner
me/report/src/

# Sidkontrollers
me/report/public/

# Vyer
me/report/view/
```

I övningen visades hur du kopierade databasfilen, den ligger i ditt kursrepo under `example/database/db.sqlite`.



### Tabeller i databasen {#tabeller}

I databasen finns ett antal tabeller och de är beskrivna i filen [`example/database/README.md`](https://github.com/dbwebb-se/webtec/tree/main/example/database).

I uppgiften kommer du att jobba mot två tabeller.

* namnlista - Svenska akademins almanacka, namnlängd och namnlista.
* namnbetydelse - Svenska akademin - Namnens ursprung och betydelse.

Du skall söka detaljer om namn och visa upp i webbsidan.

Databasen innehåller fler tabeller som du kan använda som extrauppgift.



### Tips, trix och livlinor {#livlina}

I GitHub issuen "[Tips och trix till kmom05 och sökmotorn med namn](https://github.com/dbwebb-se/webtec/issues/18)" finns det en del inspiration och tips och trix till hur man kan tänka och vilka eventuella svårigheter som finns i uppgiften.



Krav {#krav}
-----------------------

Utför följande krav.

PS. När du hämtar data från två olika databastabeller så går det bra att göra två frågor, först mot den ena tabellen och därefter mot den andra tabellen.



### Krav 1: Sidkontroller name.php {#K1}

Sidkontrollern `name.php` behöver inte ligga i navbaren.

Sidkontrollern skall söka efter **ett** namn i de båda tabellerna och visa detaljer om det namnet.

Man skall kunna nå sidkontrollern via `name.php` och då visas ett meddelande att "du måste fylla i querysträngen".

När man går till sidan via `name.php?query=<namn>`, det vill säga till exempel om man söker på "Mikael" så ser länken ut så här `name.php?query=Mikael`, i detta fallet skall detaljer om namnet visas i sidan. Hämta detaljer från båda databas-tabellerna och presentera dem. Du kan först söka i den ena tabellen och sedan i den andra tabellen.

Om det inte finns detaljer om det namnet man söker efter så skall det inte visas några felutskrifter, det skall bara stå att "ingen information om namnet kunde hittas".

**EXTRA**

Hämta detaljer från fler tabeller i databasen om valt namn.



### Krav 2: Sidkontroller search.php {#K2}

Sidkontrollern `search.php` placeras i navbaren.

Sidkontrollern skall söka efter namn och delar av namn i de båda tabellerna och visa upp en lista likt en sökmotors träffar (jämför Google/Bing) för de namn som matchar sökningen. 

Det går bra att först söka i ena tabellen och därefter i andra tabellen (två databasfrågor), och sedan skriva ut alla träffar man får.

För varje sökresultat skall det visas vilket namn som matchade. Detta namn skall vara klickbart, om användaren klickar på länken så kommer man till sidan som visar mer detaljer om namnet.

Med andra ord, för varje sökträff skall man kunna klicka sig vidare till sidkontrollern `name.php` som visar än mer detaljer om namnet.

Om det inte finns detaljer om det namnet man söker efter så skall det inte visas några felutskrifter, det skall bara stå att "ingen information om namnet kunde hittas".

**EXTRA**

Sök på namnet i fler tabeller i databasen.



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

1. Testa ditt resultat så att det passerar de automatiska testerna med `dbwebb test kmom05`.
