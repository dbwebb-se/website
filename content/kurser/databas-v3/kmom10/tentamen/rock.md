---
author:
    - mos
category:
    - kurs databas
    - examination
revision:
    "2020-03-26": "(C, mos) Artistens namn skall visas i rapporten för u1."
    "2020-03-26": "(B, mos) Excelark innehåller 4 flikar, inte tre."
    "2020-03-26": "(A, mos) Examinationen 26 mars 2020."
...
Examination 26 mars 2020
=======================================

Detta är den individuella examinationen som är en del av kmom10.

<!--
Du kan läsa detta dokumentet i webbläsaren via länken "[Examination 26 mars 2020](https://dbwebb.se/kurser/databas-v1/kmom10/tentamen/rock)"
-->

Uppgifterna skall lösas individuellt och du får inte be om hjälp, prata, diskutera eller chatta med någon (förutom läraren). Fråga läraren om något är oklart med uppgifterna. Du kan använda kursens Gitter-kanal, eller forumet, för att ställa allmänna frågor till läraren.

Övriga hjälpmedel är tillåtna, inklusive egen dator, access till Internet och tillgång till tidigare kursmoment och ditt kursrepo.

Examinationen är begränsad till 5 timmar om inget annat överenskommits.

Du kan maximalt få 30 poäng. Du behöver samla minst 18 poäng (60%) för att bli godkänd på tentamen. Samla fler poäng för att nå ett högre slutbetyg på kursen.

<!--more-->


Du har troligen redan gjort `dbwebb exam checkout try1`.

Spara all kod i `me/kmom10/try1`.

Innan du börjar, läs igenom hela dokumentet så att du får en uppfattning om uppgifterna, poängfördelningen och vad uppgifterna omfattar.

Missa inte att läsa sista stycket om hur du skall lämna in din examination.



Inledning {#inledning}
---------------------------------------

Du har blivit rekryterad till organisationen Svensk Rock som håller en stor musikfestival under försommaren och du som databasexpert har blivit ansvarig för att skapa en databas för att presentera deras artister och visa upp det i snyggt format.

Det är första veckan på jobbet och du vill framstå som en god databasprogrammerare.

Chefen har gett dig [ett excelark med lite data](https://docs.google.com/spreadsheets/d/106AgMc8mPa0W1bBfTtTPxizyMV2MvZDAPzJvxmNo30k/edit?usp=sharing) och bett dig att göra en databas för artisterna.

Excelarket innehåller tre (4) flikar med data där varje flik är en tabell med kolumner och rader.

Du är redo, du har gjort sånt här förut, du tar datat från excelarket och påbörjar arbetet att bygga en databas, här tänker du glänsa.



Uppgift 1 (20p) {#u1}
---------------------------------------

Bygg en databas med en webbklient och en terminalklient.



### Kodstandard små bokstäver {#sma}

Kom ihåg att vi använder en rekommenderad kodstandard som säger små bokstäver på tabeller, vyer, procedurer, triggers och kolumnnamn, eventuellt separerade med understreck/underscore \_.

Vad du än gör, var noggrann och konsekvent i hur du använder stora/små bokstäver, annars riskerar du att din inlämning inte kan rättas.



### Generella krav {#generellt}

1. Din katalog innehåller en `package.json` med samtliga externa moduler som används.

1. Inloggningsdetaljer till databasen skall sparas i `config/db/exam.json`.

1. Javascript-kod som delas mellan klienterna, liksom extra moduler, placerar du i katalogen `src`.



### Databasmodell {#databasmodell}

Du tittar i Excelfilen och skapar dig en bild av informationen.

Det finns ett artister med id, namn, ort och landskod.

Det finns en översikt av landskod och landets namn.

Det finns speldagar med id, namn och datum.

Det finns spelning som kopplar artisten till en spelningsdag och tid.

1. Rita ett logiskt ER diagram över databasens tabeller. Spara diagrammet som `doc/er.pdf`.



### Databas {#databas}

Skapa databasen och fyll den med data.

1. SQL-filer lägger du i `sql/exam`. Skapa filen `setup.sql` för att skapa databasen och användaren. Låt din databas heta `exam` och ge användaren `user` med lösenordet `pass` full tillgång till databasen.

1. Skapa filen `ddl.sql` där du samlar all kod som skapar tabeller, vyer, procedurer, triggers och liknande. Använd den filen för att skapa databasens schema.

1. Skapa filen `insert.sql` med SQL-kod för att lägga in innehåll i tabellerna, motsvarande det som syns i Excelfilen. Innehållet kan du läsa in från CSV-filer eller manuellt via egenskapade INSERT-satser. CSV-filerna sparar du i samma katalog som sql-filerna (tänk på radbrytningar alá LF).

1. Om du skapar extra SQL-kod för att testa tabellerna, till exempel vanlig SELECT, så sparar du den koden i `dml.sql`.



### Webbklient {#webbklient}

Bygg en webbklient.

1. Skapa en webbklient med Express. Servern startas via `node index.js` och skall snurra på porten 1337.

1. Alla sidor skall ha en navigeringsdel så det går att klicka sig fram mellan sidorna, via navigeringen.

1. I webbklienten, skapa routen `/exam/index` som visar en välkomstssida. Välj något passande att visa på förstasidan.

1. All access från klienten mot databasen skall gå via lagrade procedurer.

1. Skapa routen `/exam/visa` som visar en rapport över samtliga artister, deras namn, id och vilken ort, land samt landskod de har tillsammans med information om eventuella tider de har spelningar en viss speldag (namn, datum).

1. Lägg till länken i navbaren.



### Terminalklient {#terminalklient}

1. Bygg ett terminalprogram och spara main-funktionen i `cli.js`. Terminalprogrammet skall startas med `node cli.js`.

1. All access från klienten mot databasen skall gå via lagrade procedurer.

1. Ditt terminalprogram skall fungera som en oändlig kommandoloop där man kan skriva in kommandon som programmet utför. Det skall finnas ett kommando `menu` som visar menyn med samtliga kommandon. När man skriver kommandot `exit` skall programmet avslutas.

1. Skapa kommandot `visa` som visar en snygg tabell med samma rapport som kan ses i webbklienten via länken `/exam/visa`.

1. Lägg till kommandot så det syns när man kör `menu`.



### Backup med lagrade procedurer {#backproc}

Skapa en backup av din databas och spara den i `sql/exam/backup.sql`.

Så här gör du för att få med de lagrade procedurerna.

```text
mysqldump -udbwebb -p --routines exam > backup.sql
# alterativt
mysqldump -udbwebb -p --routines --result-file=backup.sql exam
```

Om du använder en specifik CHARSET/COLLATION när du gör CREATE DATABASE, så behöver du ta din backup så här.

```text
mysqldump -udbwebb -p --routines --add-drop-database --databases exam > backup.sql
# alterativt
mysqldump -udbwebb -p --routines --add-drop-database --result-file=backup.sql --databases exam
```

Är din backup felaktig går det inte att rätta din inlämning.

Inspektera gärna din backupfil innan du känner dig nöjd. Titta på den i texteditorn och/eller ladda upp den mot en alternativ databas.



Uppgift 2 (5p) {#u2}
---------------------------------------

Chefen kommer förbi och hävdar bestämt att det behövs en sökfunktion i ditt verktyg som visar artisternas spelningar. Man skall kunna söka på delsträngar i rapporten som du visat upp (artist id, namn, ort, landskod, land samt speldagens namn och tiden för spelningen).

1. I webbklienten, skapa routen `exam/search` där man i ett formulär kan ange en söksträng. Visa samma rapport som du skapade tidigare, men visa enbart de rader som matchar söksträngen.

1. Lägg till länken i navbaren.

1. I terminalklienten, skapa kommandot `search <str>` som visar motsvarande.

1. Lägg till kommandot så det syns när man kör `menu`.



Uppgift 3 (5p) {#u3}
---------------------------------------

Denna uppgiften är lite svårare och kan tvinga dig att pilla lite extra med din SQL-konstruktion, kanske till och med googla lite ny information eller leta i minnet från tidigare delar av kursen.

Chefen är stressad och sent på fredagseftermiddagen, typ kvart i fem, så kommer hen och ber dig att "fixa" en rapport enligt nedan exempel. Chefen säger "rapporten måste se ut EXAKT som den jag visar här". Du gör som chefen säger, det känns säkrast, även om du är lite skeptisk.

Studera utskriften nedan extra noggrant, skriv sedan SQL-kod som löser EXAKT samma rapport med EXAKT samma innehåll (samma rubriker, samma rader, samma ordning på raderna, samma innehåll i respektive kolumn).

Det är rapportens innehåll som är viktigt, inte hur du skriver ut det i tabellformatet, det är som vanligt godtyckligt tabellformat.

```text
+---------------------+-----------------------+------------------+----------+-------+
| Artist              | Ort                   | Dag              | Spelning | Tid   |
+---------------------+-----------------------+------------------+----------+-------+
| Honeburst           | Halmstad/Sverige(SE)  | NULL             | NULL     | NULL  |
| Death By Horse      | Skåne/Sverige(SE)     | Onsdag Prepare   | 3rd June | 15:00 |
| Mass Worship        | Stockholm/Sverige(SE) | Onsdag Prepare   | 3rd June | 21:00 |
| Death By Horse      | Skåne/Sverige(SE)     | Torsdag Hardtime | 4th June | 15:00 |
| Browsing Collection | Skövde/Sverige(SE)    | Torsdag Hardtime | 4th June | 19:00 |
| Mass Worship        | Stockholm/Sverige(SE) | Torsdag Hardtime | 4th June | 21:00 |
| Death By Horse      | Skåne/Sverige(SE)     | Fredag Laidback  | 5th June | 15:00 |
| Browsing Collection | Skövde/Sverige(SE)    | Fredag Laidback  | 5th June | 19:00 |
| Elden               | Karlstad/Sverige(SE)  | Fredag Laidback  | 5th June | 21:00 |
| NULL                | NULL                  | Lördag All-In    | 6th June | NULL  |
+---------------------+-----------------------+------------------+----------+-------+
10 rows in set (0.00 sec)
```

1. I terminalklienten, skapa kommandot `report` som visar ovan rapport.



Inlämning {#inlamning}
---------------------------------------

Läs noggrant, checka av varje punkt innan du är klar.

1. Innan du lämnar in så skall du se till att din kod validerar via `dbwebb validate`. Varje valideringsfel kan ge avdrag med 1 poäng.

1. Uppdatera din databasbackup i `sql/exam/backup.sql` så att den är aktuell.

1. Lämna in genom att göra `dbwebb exam seal try1`.

1. När du är helt klar så går du in på Canvas och berättar att du "lämnat in" tentan genom att skriva "KLAR!" följt av din akronym. Om det är något särskilt som läraren behöver veta om din inlämning så skriver du det.

Vid problem, gör en `dbwebb upload` och maila sedan mos@bth.se och berätta vad som hänt och ange ditt namn och studentakronym.
