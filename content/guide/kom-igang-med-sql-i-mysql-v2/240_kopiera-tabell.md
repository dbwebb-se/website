---
author: mos
revision:
    "2023-01-15": "(F, mos) Bort med felaktigt dml_copy, skall vara ddl_copy."
    "2022-01-04": "(E, mos) Genomgången inför v2 och MariaDB."
    "2019-01-15": "(E, mos) Genomgången och testad."
    "2018-03-27": "(D, mos) Uppdaterad med dml_update_lonerevision.sql."
    "2018-02-09": "(C, mos) Fixade återställningen och hur man kör alla filerna i sekvens."
    "2018-02-05": "(B, mos) Uppdaterade vilka lönesummor som gäller efter olika steg, fix #63."
    "2017-12-29": "(A, mos) Första versionen, uppdelad av större dokument."
...
Kopiera tabell
==================================

Vi skall skapa en ny tabell genom att kopiera en befintlig tabell.

Spara den SQL-kod du skriver i filen `ddl-copy.sql`.

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
mariadb --table skolan < ddl-larare.sql
mariadb --table skolan < insert-larare.sql
mariadb --table skolan < ddl-alter.sql
mariadb --table skolan < dml-update.sql
mariadb skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare;"
```

Du kan dubbelkolla att du har rätt innehåll genom att kontrollera lönesumman och kompetensen.

```text
+------------+-----------+
| Lönesumma  | Kompetens |
+------------+-----------+
|     305000 |         8 |
+------------+-----------+
```

Bra, då är vi i läget precis innan lönerevisionen där alla lärare har en grundlön.



Kopiera tabell {#copy}
----------------------------------

Alla uppdateringar i lönerevisionen ligger i filen `dml-update-lonerevision.sql`, men innan vi kör dem så tar vi en kopia, eller backup, av tabellen. Vi vill spara hela tabellen som den är, innan vi utför lönerevisionens ändringar.

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
mariadb skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare_pre;"
+------------+-----------+
| Lönesumma  | Kompetens |
+------------+-----------+
|     305000 |         8 |
+------------+-----------+
```

Då kan vi göra lönerevision.



Utför lönerevisionen {#revision}
----------------------------------

Då utför vi lönerevisionen genom att köra filen `dml-update-lonerevision.sql`.

```text
mariadb --table skolan < dml-update-lonerevision.sql
```

Nu har vi tabellen larare med nya löner och tabellen larare_pre med gamla löner. Vi dubbelkollar att det ser okey ut.

Vi kontrollerar att tabellen larare innehåller rätt värden.

```text
mariadb skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare;"
+------------+-----------+
| Lönesumma  | Kompetens |
+------------+-----------+
|     330242 |        19 |
+------------+-----------+
```

Bra, då har vi en tabell med värden innan lönerevisionen, och en tabell med värden efter lönerevisionen.



Kontrollera filen {#filen}
----------------------------------

Låt oss kontroller att våra filer fungerar som de ska. För att återskapa förutsättningarna inför denna övningen, inklusive backup-tabellen, gör vi följande.

Du kan göra det genom att köra följande kommandon.

```text
mariadb --table skolan < ddl-larare.sql
mariadb --table skolan < insert-larare.sql
mariadb --table skolan < ddl-alter.sql
mariadb --table skolan < dml-update.sql
mariadb --table skolan < ddl-copy.sql
mariadb --table skolan < dml-update-lonerevision.sql
mariadb --table skolan < dml-view.sql
```

Vi kan kontrollera att lönesummorna stämmer. Det bör se ut så här.

Först i tabellen larare, efter lönerevisionen.

```text
mariadb skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare;"
+------------+-----------+
| Lönesumma  | Kompetens |
+------------+-----------+
|     330242 |        19 |
+------------+-----------+
```

Sedan i tabellen larare_pre, som har värdena innan lönerevisionen där alla lärare har sin grundlön och ingen har NULL i lön.

```text
mariadb skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare_pre;"
+------------+-----------+
| Lönesumma  | Kompetens |
+------------+-----------+
|     305000 |         8 |
+------------+-----------+
```

Allt som allt så handlade det alltså om att ta en backup på tabellens data, innan vi utförde lönerevisionen. Det är en variant av hur man kan hantera nyare och äldre data i samma databas.

Nu är vi redo att slå samman de båda tabellerna i en rapport.
