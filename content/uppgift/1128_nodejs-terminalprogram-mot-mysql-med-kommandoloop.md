---
author: mos
category:
    - javascript
    - nodejs
    - mysql
    - kursen dbjs
    - kursen databas
revision:
    "2020-01-28": "(E, mos) Förtydligande om backuphanteringen."
    "2019-02-15": "(D, mos) länk till tips om vad UPDATE returnerar."
    "2019-02-12": "(C, mos) Förtydliga vilken databas som används för testkörning."
    "2019-01-28": "(B, mos) Uppdaterad inför vt19."
    "2018-01-05": "(A, mos) Första utgåvan."
...
Node.js terminalprogram mot MySQL med kommandoloop
==================================

Du skall bygga ett menydrivet terminalprogram med JavaScript i Node.js som jobbar mot en MySQL databas.

Du jobbar mot en databas du har sedan tidigare och ditt program skapar rapporter från databasen och kan uppdatera data i tabellerna.

Terminalklienten bygger du som ett program som har en inbyggd meny där användaren kan välja vilka operationer som skall utföras mot databasen.

<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har tidigare löst uppgiften "[Node.js terminalprogram mot MySQL (v2)](uppgift/nodejs-terminalprogram-mot-mysql-v2)" där du har kod som jobbar mot databasen. Du kan jobba vidare på den koden nu.

Du har jobbat igenom artikeln "[Gör en kommandoradsklient i Node.js (v2)](kunskap/gor-en-kommandoradsklient-i-node-js-v2)" vilken gav dig upplägget om hur du gör ett menysystem i terminalklienten tillsammans med en oändlig loop som läser in kommandon från terminalen.

Du har jobbat igenom delen "Mer SQL" av guiden "[Kom igång med SQL i MySQL (Mer SQL)](guide/kom-igang-med-sql-i-mysql-v2/mer-sql)".



Introduktion {#intro}
-----------------------

Du skall skriva terminalprogram som jobbar mot databasen "skolan". Ditt program skall kunna presenterar rapporter från databasens innehåll. Programmet skall också kunna uppdatera data i tabellerna i databasen.

Försök att skapa en god kodstruktur, använd filer, moduler, funktioner. Försök separera kod som är relaterad till databasen från kod som är relaterad till Node.js terminalprogram.

Försök, så gott det går, se till att använda moduler som du importerar till ditt main-program. Strukturera ditt main-program, main-modulen, så att du delar in koden i funktioner.

Det är nu tillåtet att använda externa moduler för att skriva ut texttabeller, till exempel [`console.table`](https://www.npmjs.com/package/console.table) eller liknande moduler.

Om du använder externa moduler så måste de finnas i `me/package.json`, annars går det inte testköra ditt program.



Provkörning {#prov}
-----------------------

Ditt program testkörs mot din egen databas som återskapas via backup-filen `me/skolan/skolan.sql`.

Instruktioner för hur du skapar en sådan backupfil finns i guiden "[Ta backup av databasen](guide/kom-igang-med-sql-i-mysql-v2/ta-backup-av-databasen)"

Var därför noggrann att gör en databasdump med den allra senaste versionen av din databas, innan du lämnar in uppgiften.

Tänk på att stora och små bokstäver hanteras olika på Windows, Mac och Linux. Det är av den anledningen som vi följer en SQL-kodstandard som enbart använder sig av små bokstäver på tabeller och kolumner.

Ett av de vanligaste problemen med rättningen är att man varit inkonsekvent med att hantera stora och små bokstäver i SQL-koden och i JavaScript-koden. Av den enkla anledningen är det smidigast att alltid följa [SQL-kodstandardens rekommendationer](https://www.sqlstyle.guide/) och enbart använda små bokstäver.



Krav {#krav}
-----------------------

1. Skapa din main-funktion för programmet i filen `index.js`. Detta är ditt mainprogram och det skall vara så litet som möjligt, resten av koden fördelar du i moduler eller klasser som du importerar till mainprogrammet.

1. Skapa katalogen `src/` och placera där de moduler/klasser du använder i ditt program. Du skall minst använda en modul, gärna flera.

1. Inloggningsdetaljer till databasen skall sparas i `config.json` och läsas in av programmet.

1. Om du använder externa moduler för att skriva ut texttabeller så måste modulen finnas i din `me/package.json`.

1. Ditt program skall fungera som en oändlig kommandoloop där man kan skriva in kommandon som programmet utför. Det skall finnas ett kommando `menu` som visar menyn med samtliga kommandon. När man skriver kommandot `exit` skall programmet avslutas. Du skall använda readline.prompt med callbackhanterare.

1. I din meny, skapa kommandot `larare` som visar all information om lärare, inklusive deras ålder. Minns att du har en vy för detta.

1. Skapa kommandot `kompetens` som visar en rapport hur kompetensen ändrats i senaste lönerevisionen.

1. Skapa kommandot `lon` som visar en rapport hur lönen ändrats i senaste lönerevisionen.

1. Skapa kommandot `sok <sokstrang>` som söker bland all information hos läraren och visar de lärare som matchar söksträngen.

1. Skapa kommandot `nylon <akronym> <lon>` som tar argumenten för lärarens akronym samt den nya lönen och uppdaterar lärarens lön.

1. Validera din kod och testa din inlämning.

```text
# Flytta till kurskatalogen
dbwebb validate terminal2

dbwebb test terminal2
```

Rätta eventuella fel som dyker upp och publisera igen. När det ser grönt ut så är du klar.



Tips från coachen {#tips}
-----------------------

En UPDATE-sats returnerar inte ett resultset likt SELECT, lär om vad som returneras i tipset "[Vad returnerar en SQL UPDATE i Node.js och MySQL/MariaDB?](coachen/vad-returnerar-en-sql-update-i-node-js-och-mysql)".
