---
author: mos
revision:
    "2019-02-12": "(E, mos) Felstavad ddl_copy.sql."
    "2019-01-29": "(D, mos) Rättade valideringsfel i reset_part2.bash."
    "2019-01-15": "(C, mos) Genomgången och uppdaterad med felutskrifter och saknad v_lon."
    "2018-03-27": "(B, mos) Add function to bash reset."
    "2018-02-09": "(A, mos) Tillagd för att fokusera på hur man återställer databasen efter andra delen."
...
Återställ databasen (del 2)
==================================

Vi skall återställa databasen till det läget som gäller efter denna delen av guiden.

Spara din kod i filen `reset_part2.bash`.

Vi vill återställa databasen genom att köra ett kommando, så här.

```text
$ bash reset_part2.bash
```



Vilka filer behövs köras? {#filer}
----------------------------------

Vi utgår från [filen som återskapar databasen efter första delen av guiden](./../aterstall-databasen-del-1), `reset_part1.bash`. Jag tar en kopia av den och modifierar så att den fungerar för både del 1 del och del 2 av guiden.

Det gäller nu att hålla ordning på vilka filer som jag gjort DDL i under denna delen.

Här är filerna som behövs, och ordningen de körs i. Ordningen är viktig. Man behöver ha koll på sin datamängd och vad som gör vad.

| Fil               | Vad gör den?         |
|-------------------|----------------------|
| `setup.sql`       | Kör som root för att skapa om databasen och skapa användaren user:pass. |
| `ddl.sql`         | Skapa tabellen för lärare. |
| `dml_insert.sql`  | Lägg till rader i tabellen lärare. | 
| `ddl_migrate.sql` | Alter table lärare och lägg till kompetensen. |
| `dml_update.sql`  | Förbered lönerevisionen, alla lärare har grundlön. |
| `ddl_copy.sql`    | Kopiera till larare_pre innan lönerevisionen. |
| `dml_update_lonerevision.sql`  | Utför lönerevisionen. |
| `dml_view.sql`    | Skapa vyerna v_namn_alder och v_larare. |
| `dml_join.sql`    | Skapa vyn v_lonerevision. |

Därefter kan vi testa datamängden, till exempel genom att dubbelkolla lönesumman och kompetensen i tabellerna larare och larare_pre.

När du har modifierat ditt skript så kan du testköra det.

När vi ändå håller på så kan vi träna lite på att skriva mer bash-skript.



Komplett skript för att återställa databasen del 2 {#reset}
----------------------------------

Jag valde att göra skriptet lite annorlunda, med en funktion som tar argumenten och sedan utför kommandot mot databasen.

Du kan hålla fast i ditt gamla skript, eller så prövar du min nya konstruktion som kan vara mer lämpad när det blir allt fler filer att ha koll på.

Följande bash-skript innehåller allt som återställer databasen till och med del 2 i guiden.

```text
#!/usr/bin/env bash
# shellcheck disable=SC2181

#
# Load a SQL file into skolan
#
function loadSqlIntoSkolan
{
    echo ">>> $4 ($3)"
    mysql "-u$1" "-p$2" skolan < "$3" > /dev/null
    if [ $? -ne 0 ]; then
        echo "The command failed, you may have issues with your SQL code."
        echo "Verify that all SQL commands can be exeucted in sequence in the file:"
        echo " '$3'"
        exit 1
    fi
}

#
# Recreate and reset the database to be as after part II.
#
echo ">>> Reset skolan to after part 2"
loadSqlIntoSkolan "root" "" "setup.sql" "Initiera database och användare"
loadSqlIntoSkolan "user" "pass" "ddl.sql" "Create tables"
loadSqlIntoSkolan "user" "pass" "dml_insert.sql" "Insert into larare"
loadSqlIntoSkolan "user" "pass" "ddl_migrate.sql" "Alter table larare"
loadSqlIntoSkolan "user" "pass" "dml_update.sql" "Grundlön larare"
loadSqlIntoSkolan "user" "pass" "ddl_copy.sql" "Kopiera till larare_pre"
loadSqlIntoSkolan "user" "pass" "dml_update_lonerevision.sql" "Utför lönerevision"
loadSqlIntoSkolan "user" "pass" "dml_view.sql" "Skapa vyer för larare"
loadSqlIntoSkolan "user" "pass" "dml_join.sql" "Skapa vy för lönerevisionen"

echo ">>> Check larare_pre: Lönesumman = 305000, Kompetens = 8."
mysql -uuser -ppass skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare_pre;"

echo ">>> Check larare: Lönesumman = 330242, Kompetens = 19."
mysql -uuser -ppass skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare;"
```

När jag kör mitt program får jag följande utskrift, du bör få motsvarande.

```text
$ bash reset_part2.bash 
>>> Reset skolan to after part 2
>>> Initiera database och användare (setup.sql)
Enter password: 
>>> Create tables (ddl.sql)
>>> Insert into larare (dml_insert.sql)
>>> Alter table larare (ddl_migrate.sql)
>>> Grundlön larare (dml_update.sql)
>>> Kopiera till larare_pre (ddl_copy.sql)
>>> Utför lönerevision (dml_update_lonerevision.sql)
>>> Skapa vyer för larare (dml_view.sql)
>>> Skapa vy för lönerevisionen (dml_join.sql)
>>> Check larare_pre: Lönesumman = 305000, Kompetens = 8.
+------------+-----------+
| Lönesumma  | Kompetens |
+------------+-----------+
|     305000 |         8 |
+------------+-----------+
>>> Check larare: Lönesumman = 330242, Kompetens = 19.
+------------+-----------+
| Lönesumma  | Kompetens |
+------------+-----------+
|     330242 |        19 |
+------------+-----------+
```

Du får gärna modifiera och vidarutveckla ditt bash-skript. Men det räcker om det fungerar som jag visar ovan och återställer databasen så här långt i guiden.

Om du får varningen så kan du se hur du [löste det tidigare](./../aterstall-databasen-del-1#warning).

> _"Warning: Using a password on the command line interface can be insecure."_
