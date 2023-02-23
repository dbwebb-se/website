---
author: mos
category:
    - javascript
    - nodejs
    - mysql
    - express
    - er-modellering
    - kursen databas
revision:
    "2023-02-23": "(G, mos) Bort med kravet DELETE på trigger."
    "2022-02-22": "(F, mos) Uppdaterade skrivningen om kravet invadd."
    "2022-02-11": "(E, mos) Genomgången och justerad inför v2."
    "2019-03-13": "(D, mos) Tips om optionella argument."
    "2019-03-11": "(C, mos) Förtydligande och hjälptext om kodstandard, backup och tips till hur testa."
    "2019-02-25": "(B, mos) Tips om GROUP_CONCAT och dump av procedurer."
    "2019-02-18": "(A, mos) Första utgåvan, sammanslagen av tre andra uppgifter och vidarutvecklad."
...
Bygg databasen till en Eshop (del 1)
==================================

Du har utfört en ER-modellering av en databas för en Eshop och nu skall du påbörja implementationen av databasen.

Du skall fylla databasen med visst innehåll och du skall skapa två klienter, en webbaserad klient och en terminalklient, som jobbar mot databasen.

Du kan utföra denna uppgift enskilt, eller i samma grupp som utförde ER-modelleringen.

<!--more-->

Alla lämnar in en egen lösning i sitt kursrepo, även om man jobbat i grupp.



Förkunskaper {#forkunskaper}
-----------------------

Du har utfört uppgiften "[Skapa ER-modell för en databas (logisk/fysisk)](uppgift/skapa-er-modell-for-en-databas-logisk-fysisk)" och du har SQL DDL för att skapa databas och tabeller.

Du har löst uppgiften "[Flytta pengar med terminalprogram och med Express](uppgift/flytta-pengar-med-terminal-program-och-med-express)" och du har därmed både terminalklient och webbklient att utgå ifrån samt har du koll på vad transaktioner är.

Du har jobbat igenom övningarna "[Lagrade procedurer i databas](kunskap/lagrade-procedurer-i-databas)" och "[Triggers i databas](kunskap/triggers-i-databas)" så du har koll på vad lagrade procedurer och triggers är.



Introduktion och förberedelse {#intro}
-----------------------

Du skall bygga en webbklient och en terminalklient. Du har tidigare kod som du kan utgå ifrån. Kopiera den för att komma igång snabbt.

Börja med att kopiera din fil `ddl.sql` från modelleringsuppgiften, till nuvarande katalog och utgå från den. Var redo på att du kan behöva modifiera tabellstrukturen för din databas, så att du kan lösa uppgiften.

När du fyller databasen med innehåll så kan du utgå från följande Excelark (om du vill), "[Databasen eshop, del 1, innehåll till tabeller](https://docs.google.com/spreadsheets/d/1yz0-C1SFYvNw_mN5CrZd9QrjKUXqKv3OhSlGUci8Mls/edit?usp=sharing)". Ta en egen kopia av arket och därefter kan du fritt modifiera innehållet i tabellerna och vilka kolumner som finns.



### Kodstandard små bokstäver {#sma}

Kom ihåg att vi använder en kodstandard som säger små bokstäver på tabeller, vyer, procedurer, triggers och kolumnnamn.

Ett av de vanligaste felen som ger komplettering är att man mixat stora och små bokstäver i namngivningen av databasobjekten och man är sedan inte konsikvent när man använder databasen i skript eller i JavaScript koden.



### Backup med lagrade procedurer {#backproc}

När du tar din backup måste du ange `--routines` så att dina lagrade procedurer följer med.

```text
# Utan lagrade procedurer
mysqldump --result-file=eshop.sql eshop

# Med lagrade procedurer
mysqldump --routines --result-file=eshop.sql eshop
```

Ett vanligt fel som leder till komplettering är att man missat skicka med de lagrade procedurerna i sin backupfil. Du kan alltid verifiera din backupfil mot en annan databas eller öppna den i texteditorn och skrolla längst ned i filen för att se att de lagrade procedurerna följde med.

<!--
Om du har sätter CHARSET/COLLATION på databasen så behöver du även se till att den informationen kommer med i backupfilen.
-->



### Testa din lösning {#test}

När du är helt klar med uppgiften så är det ett par saker som du kan göra för att testa din inlämning. Detta testar inte allt, men det är ett minimum av ett flöde som skall fungera.

I webbklienten:

1. Kolla översikt av kategorier.
1. Lägg till en ny produkt.
1. Redigera den nya produkten.
1. Visa produkten i översikten.

I terminalklienten.

1. Visa hyllor på lagret.
1. Visa vilka produkter som finns på hyllorna.
1. Visa produkterna så att den nya produkten syns
1. Lägg till den nya produkten på en godtycklig lagerhylla.
1. Se att produkten finns på lagret med rätt antal på rätt hylla.
1. Ta bort antalet produkter som du nyss lade till, men lämna kvar en.



Krav {#krav}
-----------------------

Uppgiften är indelad i tre huvudsakliga delar, en generell del inklusive databasdetaljer, en för webbklienten och en för terminalklienten.



### Generella krav {#gen}

1. Din katalog innehåller en `package.json` med samtliga externa moduler som används.

1. Inloggningsdetaljer till databasen skall sparas i `config/db/eshop.json`.

1. SQL-filer lägger du i `sql/eshop`. Skapa filen `setup.sql` för att skapa databasen. Låt din databas heta `eshop`.

1. Skapa filen `sql/eshop/ddl.sql` där du samlar all kod som skapar tabeller, vyer, procedurer, triggers och liknande. Använd den filen för att skapa databasens schema.

1. Skapa filen `sql/eshop/insert.sql` med SQL-kod för att lägga in minst 5 vardera, av följande: kunder, produkter, produktkategorier, lagerhyllor som du läser in från CSV-filer som du själv skapat. CSV-filerna sparar du i samma katalog som sql-filerna. Använd inte absoluta filvägar till CSV-filerna.

1. Försäkra dig om att samtliga produkter tillhör minst en produktkategori. Försäkra dig om att minst tre av produkterna tillhör två eller fler produktkategorier. Skriv kod i `insert.sql`, om det krävs.

1. Försäkra dig om att samtliga produkter finns på lagret, i någon omfattning. Skriv kod i `insert.sql`, om det krävs.

1. Skapa en SQL-fil som du kan använda för att återskapa hela databasen från början till slut, kalla den för `sql/eshop/reset.sql`.

1. Du skall ha en loggtabell som loggar intressanta händelser i systemet, via triggers. Du skall logga när någon gör INSERT och UPDATE på tabellen produkt. Du loggar tiden då något hände och en textsträng som beskriver händelsen och det objekt som var inblandat i händelsen. Till exempel så här.

| Tidstämpel | Händelse |
|------------|----------|
| 2019-02-18 16:01:01 | "Ny produkt lades till med produktid 'produkt1'." |
| 2019-02-18 16:02:01 | "Detaljer om produktid 'produkt1' uppdaterades." |



### Webbklient {#webb}

1. Skapa en webbklient med Express. Servern startas via `node index.js` och skall snurra på porten 1337.

1. All access från klienten mot databasen skall gå via lagrade procedurer.

1. Alla sidor skall ha samma sidlayout med gemensam header, footer och det skall gå att klicka sig fram mellan sidorna, via navigeringen.

1. Skapa en om-sida på `eshop/about` som visar namnen på de som jobbat (i gruppen) för att lösa uppgiften.

1. I webbklienten, skapa routen `/eshop/index` som visar en välkomstssida till din eshop. Välj själv vad du visar på förstasidan.

1. I webbklienten, skapa en sida `/eshop/category` som visar en tabell över de produktkategorier som finns.

1. I webbklienten, skapa en sida `/eshop/product` som visar en översikt av de produkter som finns. Visa (minst) produktens id, namn, pris och antal som finns i lagret. Visa även information om vilken kategori som produkten tillhör (TIPS GROUP_CONCAT).

1. Skapa CRUD för att lägga till, redigera, visa och radera produkter. Du behöver enbart redigera de delar som finns i tabellen kopplad till produkten. Du behöver inte redigera antal produkter på lagret, eller kopplingen till kategori.

1. Se till att det är smidigt att navigera i din produkt CRUD, via länkar och/eller formulär, man skall kunna klicka sig fram till det man vill göra.

<!--
OKLART?

Skapa sida som visar alla kunder (likt produktöversikten) (eshop2 gör CRUD kunder).

(ev extra) radera produkt med soft delete (kan återkomma i projektet)

(ev extra) Klicka på kategori och se alla produkter som är av den kategorin?
-->



### Terminalklient {#term}

1. Bygg ett terminalprogram och spara main-funktionen i `cli.js`. Eventuell övrig kod lägger du i moduler under katalogen `src/`. Terminalprogrammet skall startas med `node cli.js`.

1. All access från klienten mot databasen skall gå via lagrade procedurer.

1. Ditt terminalprogram skall fungera som en oändlig kommandoloop där man kan skriva in kommandon som programmet utför. Det skall finnas ett kommando `menu` som visar menyn med samtliga kommandon. När man skriver kommandot `exit` skall programmet avslutas.

1. Skapa kommandot `about` som visar namnen på de som jobbat (i grupp) för att lösa uppgiften.

1. Skapa kommandot `log <number>` som visar de `<number>` senaste raderna i loggtabellen.

1. Skapa kommandot `product` som visar alla producter som finns, inklusive produkternas id.

1. Skapa kommandot `shelf` som visar vilka lagerhyllor som finns på lagret.

1. Skapa kommandot `inv` (inventory) som visar en tabell över vilka produkter som finns var i lagret. Visa produktid, produktnamn, lagerhylla och antal.

1. Skapa kommandot `inv <str>` där det optionella argumentet `<str>` används för att filtrera det som skrivs ut. Filtrering sker på produktid, produktnamn, lagerhylla.

1. Skapa kommandot `invadd <productid> <shelf> <number>` som lägger till ett visst antal av en produkt på en lagerhylla. Om det redan finns samma produkt på lagerhyllan så kan man öka på antalet. (Tips: det finns en konstruktion som heter INSERT ON DUPLICATE KEY UPDATE.)

1. Skapa kommandot `invdel <productid> <shelf> <number>` som plockar bort ett visst antal produkter från en viss lagerhylla. Det behöver inte finnas någon kontroll om antalet produkter fortfarande är positivt.



### Lämna in {#lamnain}

1. När du är helt klar och har testkört ditt system mot din egen databas, så tar du en backup av databasen med mysqldump och sparar i `sql/eshop/backup.sql`. Använd optionen `--routines` så att procedurerna följer med. Verifiera att backup-filen fungerar och tänk att rättaren kan ladda denna databas för att testköra mot ditt system.

1. Testa och validera din kod.

```text
# Flytta till kurskatalogen
dbwebb test eshop1
dbwebb validate eshop1
```

Rätta eventuella fel som dyker upp och publisera igen. När det ser grönt ut så är du klar.



Extrauppgift {#extra}
-----------------------

Gör följande om du har tid och energi.

1. I webbklienten, gör så att man kan klicka på en kategori och sedan visas de produkter som finns i kategorin.

1. I webbklienten, gör så att man kan koppla en produkt till en eller flera produktkategorier (överkurs).



Tips från coachen {#tips}
-----------------------

Läs gärna på om **GROUP_CONCAT** som kan vara smidigt att använda när man vill göra en rapport som till exempel visar vilka kategorier som en produkt tillhör. Det finns ett [tips i forumet om GROUP_CONCAT](t/8366).

Du kan med GROUP_CONCAT skapa följande rapport, se kategorierna.

```
+----+-------+-------+-------------+
| id | name  | price | category    |
+----+-------+-------+-------------+
| p1 | Apple |  42.0 | fruit,red   |
| p2 | Pear  |  39.0 | fruit,green |
+----+-------+-------+-------------+
```

I forumet finns ett tips om hur du kan hantera **optionella argument** i terminalklienten, se "[Kommando med optionella argument (eshop1/2)](t/8431)".

Lycka till och hojta till i forumet om du behöver hjälp!
