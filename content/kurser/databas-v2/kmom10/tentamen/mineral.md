---
author:
    - mos
category:
    - kurs databas
    - examination
revision:
    "2025-03-27": "(A, mos) Examinationen 27 mars 2025."
...
Examination 27 mars 2025
=======================================

Detta är den individuella examinationen som är en del av kmom10.

<!--
Du kan läsa detta dokumentet i webbläsaren via länken "[Examination 27 mars 2025](https://dbwebb.se/kurser/databas-v2/kmom10/tentamen/mineral)"
-->

Uppgifterna skall lösas individuellt och du får inte be om hjälp, prata, diskutera eller chatta med någon (förutom läraren). Fråga läraren om något är oklart med uppgifterna. Du kan använda kursens Discord-kanal eller mail/meddelande för att ställa allmänna frågor till läraren.

Det är inte tillåtet att låta AI generera eller skapa din kod.

Övriga hjälpmedel är tillåtna, inklusive egen dator, tillgång till Internet och tidigare kursmoment inklusive ditt kursrepo.

Examinationen är begränsad till 5 timmar om inget annat överenskommits.

Du kan maximalt få 30 poäng. Du behöver samla minst 18 poäng (60%) för att bli godkänd på tentamen. Samla fler poäng för att nå ett högre slutbetyg på kursen.

<!--more-->


Du har troligen redan gjort `dbwebb exam checkout try1` (annars gör du det).

Spara all kod i `me/kmom10/try1`.

Innan du börjar, läs igenom hela detta dokument så att du får en uppfattning om uppgifterna, poängfördelningen och vad uppgifterna omfattar.

Missa inte att läsa sista stycket om hur du skall lämna in din examination.



Inledning {#inledning}
---------------------------------------

Du har fått ett konsultuppdrag från organisationen "Hungry Miners (HM)" som exploaterar fyndigheter för mineraler. De vill ha en översyn av de viktiga mineraler som finns och var de finns någonstans och vilka aktörer som finns på världsmarknaden.

Det är första veckan på uppdraget och du vill framstå som en god databasprogrammerare.

Chefen har gett dig [ett excelark med flikar och lite data](https://docs.google.com/spreadsheets/d/1z4weablhFYCTEgsLZlOpTgZqmt7x02iZ6MntBzf-Z94/) och bett dig att göra en databas.

Excelarket innehåller fem (5) flikar med data där varje flik är en tabell med kolumner och rader.

Du är redo, du har gjort sånt här förut, du tar datat från excelarket och påbörjar arbetet att bygga en databas, här tänker du glänsa.



Uppgift 1 (20p) {#u1}
---------------------------------------

Bygg en databas med en webbklient och en terminalklient.



### Kodstandard små bokstäver {#sma}

Kom ihåg att vi använder en rekommenderad kodstandard som säger små bokstäver på tabeller, vyer, procedurer, triggers och kolumnnamn, eventuellt separerade med understreck/underscore \_.

Vad du än gör, var noggrann och konsekvent i hur du använder stora/små bokstäver, annars riskerar du att din inlämning inte kan rättas.



### Generella krav {#generellt}

1. Ditt projekt innehåller en `package.json` med samtliga externa moduler som används (`me/package.json`).

1. Inloggningsdetaljer till databasen skall sparas i `config/db/exam.json`.

1. Javascript-kod som delas mellan klienterna, liksom extra moduler, placerar du i katalogen `src`.



### Databasmodell {#databasmodell}

Du tittar i Excelfilen och skapar dig en bild av informationen.

[mineral] En översikt av de viktiga mineraler som betraktas som extra viktiga.

[country] Länder som är kändra för mineralfyndigheter.

[mineral2country] Kopplingstabell mellan "mineral" och "country".

[miner] Kända företag som exploaterar mineral-fyndigheter.

[miner2mineral] Kopplingstabell mellan "miner" och "mineral" som också innehåller produktionen per år för en viss mineral och en miner.


1. Rita ett logiskt ER diagram över databasens tabeller och dess relationer. Inkludera kolumner, datatyper, primär- och främmande nycklar. Visa hur tabellerna är kopplade till varandra (relationerna). Spara diagrammet som `doc/er.pdf`.



### Databas {#databas}

Skapa databasen och fyll den med data.

1. SQL-filer lägger du i `sql/exam`. Skapa filen `setup.sql` för att skapa databasen. Låt din databas heta `exam`. Använd din användare `maria` eller `dbadm` när du jobbar med databasen.

1. Skapa filen `ddl.sql` där du samlar all kod som skapar tabeller, vyer, procedurer, triggers och liknande. Använd den filen för att skapa databasens schema.

1. Ange samtliga primärnycklar och främmande nycklar i tabellerna.

1. Skapa filen `insert.sql` med SQL-kod för att lägga in innehåll i tabellerna, motsvarande det som syns i Excelfilen. Innehållet kan du läsa in från CSV-filer eller manuellt via egenskapade INSERT-satser. CSV-filerna sparar du i samma katalog som sql-filerna (tänk på radbrytningar alá LF).

1. Skapa filen `dml.sql` och spara SQL kod du gör för att testa din databas, till exempel SELECT och CALL.



### Webbklient {#webbklient}

Bygg en webbklient.

1. Skapa en webbklient med Express. Servern startas via `node index.js` och skall snurra på porten 1337.

1. Alla sidor skall ha en navigeringsdel så det går att klicka sig fram mellan sidorna, via navigeringen.

1. I webbklienten, skapa routen `/exam/index` som visar en välkomstsida. Välj något passande att visa på förstasidan.

1. All access från klienten mot databasen skall gå via lagrade procedurer.

1. Skapa routen `/exam/visa` som visar en rapport över databasens innehåll. Visa samtliga detaljer om samtliga mineraler och vilka eventuella länder de finns i. Försäkra dig om att samtliga mineraler visas i rapporten, även om koppling till land saknas.

1. Du behöver inte visa själva länkarna i tabellutskriften, de tar för mycket plats och ger inget mervärde.

1. Gör så att mineralens namn blir en klickbar länk som leder till mer information om mineralen. Gör samma sak för landet namn.



### Terminalklient {#terminalklient}

1. Bygg ett terminalprogram och spara main-funktionen i `cli.js`. Terminalprogrammet skall startas med `node cli.js`.

1. All access från klienten mot databasen skall gå via lagrade procedurer.

1. Ditt terminalprogram skall fungera som en oändlig kommandoloop där man kan skriva in kommandon som programmet utför. Det skall finnas ett kommando `menu` som visar menyn med samtliga kommandon. När man skriver kommandot `exit` skall programmet avslutas.

1. Skapa kommandot `visa` som visar samma rapport som kan ses i webbklienten via länken `/exam/visa`.

1. Lägg till kommandot så det syns när man kör `menu`.

1. Presentera rapporten i tabellform.

1. Exkludera webblänkarna från rapporten så att utskriften blir snyggare i terminalklienten.



### Backup med lagrade procedurer {#backproc}

Skapa en backup av din databas och spara den i `sql/exam/backup.sql`.

Skapa din backup på exakt samma sätt som du gjort tidigare i kursen.

```text
# Med mysqldump
mysqldump --routines --result-file=backup.sql exam

# Med mariadb-dump
mariadb-dump --routines --result-file=backup.sql exam
```

Är din backup felaktig går det inte att rätta din inlämning.

Inspektera gärna din backupfil innan du känner dig nöjd. Titta på den i texteditorn och/eller ladda upp den mot en alternativ databas.



Uppgift 2 (5p) {#u2}
---------------------------------------

Chefen kommer förbi och hävdar bestämt att det behövs en sökfunktion i ditt verktyg.

Man skall kunna söka på delsträngar i mineralers samtliga kolumner, förutom "url". Man skall också kunna söka på delsträngar av alla kolumner i country, förutom "url".

<!-- Lägg till delsträngar i developer -->

1. I webbklienten, skapa routen `exam/search` där man i ett formulär kan ange en söksträng. Visa samma rapporter som du skapade tidigare, men visa enbart de rader som matchar söksträngen.

1. Lägg till länken i navbaren.

1. I terminalklienten, skapa kommandot `search <str>` som visar motsvarande.

1. Lägg till kommandot så det syns när man kör `menu`.



Uppgift 3 (5p) {#u3}
---------------------------------------

Denna uppgift är lite svårare och kan tvinga dig att pilla lite extra med din SQL-konstruktion. Kanske behöver du till och med googla fram lite nya kunskaper i SQL eller leta lite extra i minnet från tidigare delar av kursen, eller bara söka i manualen.

Chefen är stressad och sent på fredagseftermiddagen, typ kvart i fem, så kommer hen och ber dig att "fixa" en rapport enligt nedan exempel. Chefen säger "rapporten måste se ut EXAKT som den jag visar här". Du gör som chefen säger, det känns säkrast, även om du är lite skeptisk.

Studera utskriften nedan extra noggrant, skriv sedan SQL-kod som löser EXAKT samma rapport med EXAKT samma innehåll (samma rubriker, samma rader, samma ordning på raderna, samma innehåll i respektive kolumn).

Det är rapportens innehåll som är viktigt, inte hur du skriver ut det i tabellformatet, det är som vanligt godtyckligt tabellformat.

Ett tips är att kopiera tabellen nedan till ett eget dokument så att du kan se det i sin helhet.

```text
+---------------------------+------------------------------------+-------------------------------------------+--------+
| Mineral                   | Uses                               | Miner                                     | Amount |
+---------------------------+------------------------------------+-------------------------------------------+--------+
| NULL                      | NULL                               | [NONE] No miners global environment       |   NULL |
| Graphite (C)              | Battery anodes, lubricants         | [JDOE] John and Jane Doe Family of Miners |   8888 |
| Lithium (Li)              | EV batteries, energy storage       | [TRMP] Tramp mining cooperation           |   5555 |
| Cobalt (Co)               | EV batteries, high-strength alloys | [PLTN] Paltin exploratory group of miners |   4445 |
| Rare Earth Elements (REE) | Magnets, electronics               | NULL                                      |   NULL |
+---------------------------+------------------------------------+-------------------------------------------+--------+
```

1. I terminalklienten, skapa kommandot `report` som visar ovan rapport.



Inlämning {#inlamning}
---------------------------------------

Checka av varje punkt innan du är klar.

<!--
1. Innan du lämnar in så skall du se till att din kod validerar via `dbwebb validate`. Valideringsfel kan ge poängavdrag.
-->

1. Du kan kontrollera din inlämning med `dbwebb test try1`.

1. Uppdatera din databasbackup i `sql/exam/backup.sql` så att den är aktuell.

1. Lämna in genom att göra `dbwebb exam seal try1`.

1. När du är helt klar så går du in på Canvas och berättar att du "lämnat in" tentan genom att skriva "KLAR!" följt av din akronym. Om det är något särskilt som läraren behöver veta om din inlämning så skriver du det.

Vid problem, gör en `dbwebb upload` och maila sedan mos@bth.se och berätta vad som hänt och ange ditt namn och studentakronym.
