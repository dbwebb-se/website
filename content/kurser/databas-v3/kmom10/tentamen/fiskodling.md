---
author:
    - mos
category:
    - kurs databas
    - examination
revision:
    "2022-03-24": "(A, mos) Examinationen 24 mars 2022."
...
Examination 24 mars 2022
=======================================

Detta är den individuella examinationen som är en del av kmom10.

<!--
Du kan läsa detta dokumentet i webbläsaren via länken "[Examination 24 mars 2022](https://dbwebb.se/kurser/databas-v2/kmom10/tentamen/fiskodling)"
-->

Uppgifterna skall lösas individuellt och du får inte be om hjälp, prata, diskutera eller chatta med någon (förutom läraren). Fråga läraren om något är oklart med uppgifterna. Du kan använda kursens Discord-kanal eller mail/meddelande för att ställa allmänna frågor till läraren.

Övriga hjälpmedel är tillåtna, inklusive egen dator, tillgång till Internet och till tidigare kursmoment inklusive ditt kursrepo.

Examinationen är begränsad till 5 timmar om inget annat överenskommits.

Du kan maximalt få 30 poäng. Du behöver samla minst 18 poäng (60%) för att bli godkänd på tentamen. Samla fler poäng för att nå ett högre slutbetyg på kursen.

<!--more-->


Du har troligen redan gjort `dbwebb exam checkout try1` (annars gör du det).

Spara all kod i `me/kmom10/try1`.

Innan du börjar, läs igenom hela detta dokument så att du får en uppfattning om uppgifterna, poängfördelningen och vad uppgifterna omfattar.

Missa inte att läsa sista stycket om hur du skall lämna in din examination.



Inledning {#inledning}
---------------------------------------

Du har fått ett konsultuppdrag från en lantbrukare som avser utöka sin näringsverksamhet hållbar produktion av en fiskodling enligt Akvaponik där man odlar fisk på land i bassänger. Tanken är att fiskarnas vatten bildar ett kretslopp tillsammans med odling av grödor. Du som databasexpert har blivit ansvarig för att skapa en databas för att hantera och visa upp detaljer om fiskeodlingen i första hand.

Det är första veckan på uppdraget och du vill framstå som en god databasprogrammerare.

Chefen har gett dig [ett excelark med flikar och lite data](https://docs.google.com/spreadsheets/d/1UqVWX01Mn7smr32ESoD0Y2_QdM3Vbdzg1dsooCav5s8) och bett dig att göra en databas.

Excelarket innehåller fyra (4) flikar med data där varje flik är en tabell med kolumner och rader.

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

[fisk] Det finns fiskar med namn och vetenskapliga namn (latin). Fiskarna tillhör en familj. Fiskarna har ett antal månader från de är yngel till de är slaktmässiga och de har en min och max temperatur de mår bäst i. Som extra info finns en länk till fiskens sida på Wikipedia.

[familj] Fiskarnas familj har ett namn och ett vetenskapligt namn (latin) samt en länk till familjens wikipedia sida.

[tank] Fiskodlingen består av ett antal vattentankar fördelade på olika lokaler. Varje lokal har ett antal vattentankar där varje tank rymmer maximalt ett antal kubikmeter (m3) vatten. Om man multiplicerar antalet tankar och dess kubikmeter får man totalt antal kubikmeter vatten per lokal.

[odling] Det finns fiskeodlingar som innebär att en lokal med dess tankar är fyllda med yngel från en viss fiskart. Varje odling har ett startdatum och antal kg fisk som finns i tankarna. Det finns också en temperaturmätare som anger aktuell temperatur i tankarna.

1. Rita ett logiskt ER diagram över databasens tabeller och dess relationer. Inkludera kolumner, datatyper, primär- och främmande nycklar. Spara diagrammet som `doc/er.pdf`.



### Databas {#databas}

Skapa databasen och fyll den med data.

1. SQL-filer lägger du i `sql/exam`. Skapa filen `setup.sql` för att skapa databasen. Låt din databas heta `exam`. Använd din användare `maria` eller `dbadm` när du jobbar med databasen.

1. Skapa filen `ddl.sql` där du samlar all kod som skapar tabeller, vyer, procedurer, triggers och liknande. Använd den filen för att skapa databasens schema.

1. Ange primärnycklar och främmande nycklar i tabellerna.

1. Skapa filen `insert.sql` med SQL-kod för att lägga in innehåll i tabellerna, motsvarande det som syns i Excelfilen. Innehållet kan du läsa in från CSV-filer eller manuellt via egenskapade INSERT-satser. CSV-filerna sparar du i samma katalog som sql-filerna (tänk på radbrytningar alá LF).

1. Skapa filen `dml.sql` och lägg där den SQL kod du gör för att testa din databas, till exempel SELECT och CALL.



### Webbklient {#webbklient}

Bygg en webbklient.

1. Skapa en webbklient med Express. Servern startas via `node index.js` och skall snurra på porten 1337.

1. Alla sidor skall ha en navigeringsdel så det går att klicka sig fram mellan sidorna, via navigeringen.

1. I webbklienten, skapa routen `/exam/index` som visar en välkomstssida. Välj något passande att visa på förstasidan.

1. All access från klienten mot databasen skall gå via lagrade procedurer.

1. Skapa routen `/exam/visa` som visar en rapport över samtliga fiskar (namn, latin, manader, max, min temp) och deras familjer (namn, latin) samt om fiskarna ingår i en odling (start, kg) och vilken lokal odlingen finns i (hus, rum).

1. Gör så att fiskens namn blir en klickbar länk som leder till fiskens wikipedia sida. Gör samma sak med familjens namn.



### Terminalklient {#terminalklient}

1. Bygg ett terminalprogram och spara main-funktionen i `cli.js`. Terminalprogrammet skall startas med `node cli.js`.

1. All access från klienten mot databasen skall gå via lagrade procedurer.

1. Ditt terminalprogram skall fungera som en oändlig kommandoloop där man kan skriva in kommandon som programmet utför. Det skall finnas ett kommando `menu` som visar menyn med samtliga kommandon. När man skriver kommandot `exit` skall programmet avslutas.

1. Skapa kommandot `visa` som visar en snygg tabell med samma rapport som kan ses i webbklienten via länken `/exam/visa`. Exkludera dock webblänkarna från rapporten så att rapporten blir lite snyggare i terminalklienten.

1. Lägg till kommandot så det syns när man kör `menu`.



### Backup med lagrade procedurer {#backproc}

Skapa en backup av din databas och spara den i `sql/exam/backup.sql`.

Skapa din backup på exakt samma sätt som du gjort tidigare i kursen.

```text
# Med mysqldump
mysqldump --routines --result-file=backup.sql exam

# Med mariadb-dump
mariadb-dump --routines --result-file=backup.sql exam
```

<!--
Om du använder en specifik CHARSET/COLLATION när du gör CREATE DATABASE, så behöver du ta din backup så här.

```text
mysqldump -udbwebb -p --routines --add-drop-database --databases exam > backup.sql
# alterativt
mysqldump -udbwebb -p --routines --add-drop-database --result-file=backup.sql --databases exam
```
-->

Är din backup felaktig går det inte att rätta din inlämning.

Inspektera gärna din backupfil innan du känner dig nöjd. Titta på den i texteditorn och/eller ladda upp den mot en alternativ databas.



Uppgift 2 (5p) {#u2}
---------------------------------------

Chefen kommer förbi och hävdar bestämt att det behövs en sökfunktion i ditt verktyg. Man skall kunna söka på delsträngar i fiskarnas namn, familjernas namn och lokalernas namn.

1. I webbklienten, skapa routen `exam/search` där man i ett formulär kan ange en söksträng. Visa samma rapport som du skapade tidigare, men visa enbart de rader som matchar söksträngen.

1. Lägg till länken i navbaren.

1. I terminalklienten, skapa kommandot `search <str>` som visar motsvarande.

1. Lägg till kommandot så det syns när man kör `menu`.



Uppgift 3 (5p) {#u3}
---------------------------------------

Denna uppgiften är lite svårare och kan tvinga dig att pilla lite extra med din SQL-konstruktion. Kanske behöver du till och med googla fram lite nya kunskaper i SQL eller leta lite extra i minnet från tidigare delar av kursen.

Chefen är stressad och sent på fredagseftermiddagen, typ kvart i fem, så kommer hen och ber dig att "fixa" en rapport enligt nedan exempel. Chefen säger "rapporten måste se ut EXAKT som den jag visar här". Du gör som chefen säger, det känns säkrast, även om du är lite skeptisk.

Studera utskriften nedan extra noggrant, skriv sedan SQL-kod som löser EXAKT samma rapport med EXAKT samma innehåll (samma rubriker, samma rader, samma ordning på raderna, samma innehåll i respektive kolumn).

Det är rapportens innehåll som är viktigt, inte hur du skriver ut det i tabellformatet, det är som vanligt godtyckligt tabellformat.

Ett tips är att kopiera tabellen nedan till ett eget dokument så att du kan se det i sin helhet.

```text
+----------------+------------+------------+-------+------------+-----------+-----------------------------------------------------+-------------------------+----------+--------------+
| Lokal          | Start      | Klar       | kg    | Temperatur | Varning   | Namn                                                | Familj                  | Månader  | Optimal Temp |
+----------------+------------+------------+-------+------------+-----------+-----------------------------------------------------+-------------------------+----------+--------------+
| NULL           | NULL       | NULL       |  NULL |       NULL |           | Niltilapia (Oreochomis niloticus)                   | ciklider (Cichlidae)    |        6 | 21-36        |
| Hönshuset/304  | NULL       | NULL       |  NULL |       NULL |           | NULL                                                | NULL                    |     NULL | NULL         |
| Ladan/102      | 2021-10-01 | 2022-04-01 | 11000 |         23 |           | Tilapia (Oreochromis sp)                            | ciklider (Cichlidae)    |        6 | 21-36        |
| Svinstian/201  | 2021-11-15 | 2022-05-15 | 24400 |         20 | Låg temp  | Clariasmal (afrikansk ålmal) (Clarias gariepinus)   | clariidae (Clariidae)   |        6 | 21-34        |
| Svinstian/202  | 2021-11-15 | 2022-05-15 | 16500 |         24 |           | Clariasmal (afrikansk ålmal) (Clarias gariepinus)   | clariidae (Clariidae)   |        6 | 21-34        |
| Ladan/101      | 2021-10-01 | 2022-10-01 |  5500 |         24 | Hög temp  | Regnbåge (Onchorhynchus mykiss)                     | laxfiskar (Salmonidae)  |       12 | 10-20        |
| Hönshuset/303  | 2021-12-01 | 2022-12-01 |  2300 |         18 |           | Sibirisk stör (Acipenser baeri)                     | störar (Acipenseridae)  |       12 | 1-26         |
+----------------+------------+------------+-------+------------+-----------+-----------------------------------------------------+-------------------------+----------+--------------+
7 rows in set (0.000 sec)
```

1. I terminalklienten, skapa kommandot `report` som visar ovan rapport.



Inlämning {#inlamning}
---------------------------------------

Checka av varje punkt innan du är klar.

1. Innan du lämnar in så skall du se till att din kod validerar via `dbwebb validate`. Varje valideringsfel kan ge avdrag med 1 poäng.

1. Du kan kontrollera din inlämning med `dbwebb test try1`.

1. Uppdatera din databasbackup i `sql/exam/backup.sql` så att den är aktuell.

1. Lämna in genom att göra `dbwebb exam seal try1`.

1. När du är helt klar så går du in på Canvas och berättar att du "lämnat in" tentan genom att skriva "KLAR!" följt av din akronym. Om det är något särskilt som läraren behöver veta om din inlämning så skriver du det.

Vid problem, gör en `dbwebb upload` och maila sedan mos@bth.se och berätta vad som hänt och ange ditt namn och studentakronym.
