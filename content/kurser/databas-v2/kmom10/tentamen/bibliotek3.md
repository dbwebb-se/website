---
author:
    - mos
category:
    - kurs databas
    - examination
revision:
    "2025-06-05": "(C, mos) Examinationen 5 juni 2025."
    "2021-08-27": "(B, mos) Examinationen 27 augusti 2021."
    "2019-05-31": "(A, mos) Examinationen 31 maj 2019."
...
Examination 5 juni 2025
=======================================

Detta är den individuella examinationen som är en del av kmom10.

<!--
Du kan läsa detta dokumentet i webbläsaren via länken "[Examination 27 augusti 2021](https://dbwebb.se/kurser/databas-v1/kmom10/tentamen/bibliotek3)"
-->

Uppgifterna skall lösas individuellt och du får inte be om hjälp, prata, diskutera eller chatta med någon (förutom läraren). Fråga läraren om något är oklart med uppgifterna. Du kan använda kursens Discord-kanal eller mail/meddelande för att ställa allmänna frågor till läraren.

Det är inte tillåtet att låta AI generera eller skapa din kod.

Övriga hjälpmedel är tillåtna, inklusive egen dator, tillgång till Internet och tidigare kursmoment inklusive ditt kursrepo.

Examinationen är begränsad till 5 timmar om inget annat överenskommits.

Du kan maximalt få 30 poäng. Du behöver samla minst 18 poäng (60%) för att bli godkänd på tentamen. Samla fler poäng för att nå ett högre slutbetyg på kursen.

<!--more-->


Du har troligen redan gjort `dbwebb exam checkout try2` (annars gör du det).

Spara all kod i `me/kmom10/try2`.

Innan du börjar, läs igenom hela detta dokument så att du får en uppfattning om uppgifterna, poängfördelningen och vad uppgifterna omfattar.

Missa inte att läsa sista stycket om hur du skall lämna in din examination.



Inledning {#inledning}
---------------------------------------

Du har fått ett jobb i källaren på Kungliga Biblioteket och du jobbar i deras hemliga källare för att hantera böcker som har blivit klassificerade som icke läsbara för den stora allmänheten. Det är första veckan på jobbet och du vill framstå som en god databasprogrammerare.

Den ansvarige bibliotikarien har gett dig [ett excelark med lite data](https://docs.google.com/spreadsheets/d/1H4TD8Xb7iSlhIdiHmVpd8UkQNQJM2_F-kW-pGDOVnYw/) och bett dig att göra "en databas" för de hemliga böckerna.

Excelarket innehåller fyra (4) flikar med data där varje flik är en tabell med kolumner och rader.

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

[bok] Det finns ett antal böcker med id, titel och författare.

[kategori] Det finns kategorier som anger varför en bok är bedömd som icke läsbar för allmänheten.

[klassificering] Det finns en koppling mellan böckerna och kategorierna, böckerna är klassificerade enligt en eller flera kategorier. Klassificeringen berättar varför boken är icke läsbar.

[hylla] Det finns även en förteckning där respektive bok är angedd med en hyllplacering i bokhyllan, det är så att man kan hitta boken. Här anges även om boken är utlånad och vilket datum den skall lämnas tillbaka. Det finns enbart ett exemplar av varje bok.

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

1. Skapa routen `/exam/visa` som visar en rapport över databasens innehåll med de böcker (id, titel, författare) som finns, på vilken hylla de är placerade, om de är utlånade eller inte (ange datum då de skall lämnas tillbaka) samt ange bokens klassificering (typ, anledning).



### Terminalklient {#terminalklient}

1. Bygg ett terminalprogram och spara main-funktionen i `cli.js`. Terminalprogrammet skall startas med `node cli.js`.

1. All access från klienten mot databasen skall gå via lagrade procedurer.

1. Ditt terminalprogram skall fungera som en oändlig kommandoloop där man kan skriva in kommandon som programmet utför. Det skall finnas ett kommando `menu` som visar menyn med samtliga kommandon. När man skriver kommandot `exit` skall programmet avslutas.

1. Skapa kommandot `visa` som visar samma rapport som kan ses i webbklienten via länken `/exam/visa`.

1. Lägg till kommandot så det syns när man kör `menu`.

1. Presentera rapporten i tabellform.



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

Man skall kunna söka på delsträngar i rapporten som du visat upp (författare, titel, kategori, anledning), eller på bokens id eller på hyllans id.

1. I webbklienten, skapa routen `exam/search` där man i ett formulär kan ange en söksträng. Visa samma rapporter som du skapade tidigare, men visa enbart de rader som matchar söksträngen.

1. Lägg till länken i navbaren.

1. I terminalklienten, skapa kommandot `search <str>` som visar motsvarande.

1. Lägg till kommandot så det syns när man kör `menu`.



Uppgift 3 (5p) {#u2}
---------------------------------------

Denna uppgift är lite svårare och kan tvinga dig att pilla lite extra med din SQL-konstruktion. Kanske behöver du till och med googla fram lite nya kunskaper i SQL eller leta lite extra i minnet från tidigare delar av kursen, eller bara söka i manualen.

Chefen är stressad och sent på fredagseftermiddagen, typ kvart i fem, så kommer snubben och ber dig att uppdatera databasen och dubbelklassifiera boken 3333 och lägga till så att den även är kategoriserad enligt kategorin 'myt' och sen ber hen om en mycket specifik rapport. Han säger "rapporten måste se ut EXAKT som den jag visar här". Du gör som chefen säger, även om rapporten ser aningen udda ut.

Studera utskriften nedan extra noggrant, skriv sedan SQL-kod som löser EXAKT samma rapport med EXAKT samma innehåll (samma rubriker, samma rader, samma ordning på raderna, samma innehåll i respektive kolumn).

Det är rapportens innehåll som är viktigt, inte hur du skriver ut det i tabellformatet, det är som vanligt godtyckligt tabellformat.

Ett tips är att kopiera tabellen nedan till ett eget dokument så att du kan se det i sin helhet.

```text
+---------------------------------------------+----------------+------------+  
| Bok                                         | Klassificering | Utlånad    |  
+---------------------------------------------+----------------+------------+  
| Bankeryd  1976 - 1977 (Bilgruppen Femman)   | gdpr           | 2019-08-30 |  
| Bilbo - En Hobbits Äventyr (JRR Tolkien)    | myt & brott    |            |  
| Så länge vi båda andas (Stephenie Meyer)    | myt            |            |  
| Dåfinkar och Dönickar (Ulf Stark)           | brott          | 2019-06-25 |  
+---------------------------------------------+----------------+------------+  
```

1. I terminalklienten, skapa kommandot `rapport` som visar ovan rapport.



Inlämning {#inlamning}
---------------------------------------

Checka av varje punkt innan du är klar.

1. Du kan kontrollera din inlämning med `dbwebb test try2`.

1. Uppdatera din databasbackup i `sql/exam/backup.sql` så att den är aktuell.

1. Lämna in genom att göra `dbwebb exam seal try2`.

1. När du är helt klar så går du in på Canvas och berättar att du "lämnat in" tentan genom att skriva "KLAR!" följt av din akronym. Om det är något särskilt som läraren behöver veta om din inlämning så skriver du det.

Vid problem, gör en `dbwebb upload` och maila sedan mos@bth.se och berätta vad som hänt och ange ditt namn och studentakronym.
