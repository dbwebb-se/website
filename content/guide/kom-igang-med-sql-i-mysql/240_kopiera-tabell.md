---
author: mos
revision:
    "2019-01-15": "(E, mos) Genomgången och testad."
    "2018-03-27": "(D, mos) Uppdaterad med dml_update_lonerevision.sql."
    "2018-02-09": "(C, mos) Fixade återställningen och hur man kör alla filerna i sekvens."
    "2018-02-05": "(B, mos) Uppdaterade vilka lönesummor som gäller efter olika steg, fix #63."
    "2017-12-29": "(A, mos) Första versionen, uppdelad av större dokument."
...
Kopiera tabell
==================================

Vi skall skapa en ny tabell genom att kopiera en befintlig tabell.

Spara den SQL-kod du skriver i filen `ddl_copy.sql`.

När vi utförde [lönerevisionen](./../uppdatera-varden-lonerevision#ej) så var det ett par frågor vi inte kunde svara på.

1. Visa de lärare som inte har fått en löneökning om minst 3%.
1. Gör en rapport som visar hur många % respektive lärare fick i löneökning.

Men, om vi hade tagit en backup av tabellen och tabellens data, innan vi utförde lönerevisionens alla UPDATE-satser, så hade vi haft en möjlighet att besvara frågorna.

Låt se om vi kan lösa det nu. Nu gäller det att du har ordning på dina filer.



Återskapa databasen innan lönerevisionen {#pre}
----------------------------------

Först behöver vi återskapa databasen med dess innehåll **innan** vi utför lönerevisionen.

Du kan göra det genom att köra följande kommandon.

```text
mysql -uuser -ppass skolan < ddl.sql
mysql -uuser -ppass skolan < dml_insert.sql
mysql -uuser -ppass skolan < ddl_migrate.sql
mysql -uuser -ppass skolan < dml_update.sql
```

Du kan dubbelkolla att du har rätt innehåll genom att summera lönesumman och kompetensen med följande kommando.

```text
mysql -uuser -ppass skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare;"
```

Det kan se ut så här när du kör det.

```text
$ mysql -uuser -ppass skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare;"
+------------+-----------+
| Lönesumma  | Kompetens |
+------------+-----------+
|     305000 |         8 |
+------------+-----------+
```

Bra, då är vi i läget precis innan lönerevisionen där alla lärare har en grundlön. Det är alltid bra att veta hur man kan återställa en databas till ett önskat läge.

Ett tips är att du redigerar ditt skript `reset_part1.bash` och skapar ett skript `reset_pre_lonerevision.bash` som utför ovan åtgärder. Då blir det enkelt att återställa databasen till önskat läge.



Kopiera tabell {#copy}
----------------------------------

Alla uppdateringar i lönerevisionen ligger i filen `dml_update_lonerevision.sql`, men innan vi kör dem så tar vi en kopia, eller backup, av tabellen. Vi vill spara hela tabellen som den är, innan vi utför lönerevisionens ändringar.

```sql
--
-- Make copy of table
--
DROP TABLE IF EXISTS larare_pre;
CREATE TABLE larare_pre LIKE larare;
INSERT INTO larare_pre SELECT * FROM larare;

-- Check the content of the tables, for sanity checking
SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare;
SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare_pre;
```

Principen är att skapa en ny tabell med den gamla som mall. Sedan kan man lägga till rader i den nya tabellen genom att selecta dem från den gamla tabellen.

Följande kopierar värden från ena tabellen till den andra.

```sql
INSERT INTO larare_pre SELECT * FROM larare;
```

Vi kan dubbelkolla att lönesumman i vår kopierade tabell är densamma som i orginaltabellen.

```text
mysql -uuser -ppass skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare_pre;"
+------------+-----------+
| Lönesumma  | Kompetens |
+------------+-----------+
|     305000 |         8 |
+------------+-----------+
```

Då kan vi göra lönerevision.



Utför lönerevisionen {#revision}
----------------------------------

Då utför vi lönerevisionen genom att köra filen `dml_update_lonerevision.sql`.

```text
mysql -uuser -ppass skolan < dml_update_lonerevision.sql
```

Nu har vi tabellen larare med nya löner och tabellen larare_pre med gamla löner. Vi dubbelkollar att det ser okey ut.

Först i tabellen larare.

```text
mysql -uuser -ppass skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare;"
+------------+-----------+
| Lönesumma  | Kompetens |
+------------+-----------+
|     330242 |        19 |
+------------+-----------+
```

Bra, då har vi en tabell med värden innan lönerevisionen, och en tabell med värden efter lönerevisionen.



Kontrollera filen {#filen}
----------------------------------

Låt oss kontroller att våra filer fungerar som de ska. För att återskapa denna övningen, inklusive backup-tabellen, gör vi följande.

Du kan göra det genom att köra följande kommandon.

```text
mysql -uuser -ppass skolan < ddl.sql
mysql -uuser -ppass skolan < dml_insert.sql
mysql -uuser -ppass skolan < ddl_migrate.sql
mysql -uuser -ppass skolan < dml_update.sql
mysql -uuser -ppass skolan < ddl_copy.sql
mysql -uuser -ppass skolan < dml_update_lonerevision.sql
```

Vi kan kontrollera att lönesummorna stämmer. Det bör se ut så här.

Först i tabellen larare, efter lönerevisionen.

```text
mysql -uuser -ppass skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare;"
+------------+-----------+
| Lönesumma  | Kompetens |
+------------+-----------+
|     330242 |        19 |
+------------+-----------+
```

Sedan i tabellen larare_pre, som har värdena innan lönerevisionen där alla lärare har sin grundlön och ingen har NULL i lön.

```text
mysql -uuser -ppass skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare_pre;"
+------------+-----------+
| Lönesumma  | Kompetens |
+------------+-----------+
|     305000 |         8 |
+------------+-----------+
```

Allt som allt så handlade det alltså om att ta en backup på tabellens data, innan vi utförde lönerevisionen. Det är en variant av hur man kan hantera nyare och äldre data i samma databas.

Nu vore det trevligt om vi kunde slå samman raderna från de båda tabellerna och få en visuell översikt av resultatet för lönerevisionen, hur många % fick varje lärare i löneökning?

Vi tar det i nästa stycke.
