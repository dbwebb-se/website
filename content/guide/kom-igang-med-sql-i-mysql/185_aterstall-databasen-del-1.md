---
author: mos
revision:
    "2019-01-31": "(D, mos) Kommentar om unix radslut."
    "2019-01-11": "(C, mos) Stycke om hur man blir av med varningen."
    "2018-03-27": "(B, mos) Lade till dml_update_lonerevision.sql."
    "2018-02-09": "(A, mos) Tillagd för att fokusera på hur man återställer databasen."
...
Återställ databasen (del 1)
==================================

Vi skall se hur vi kan förenkla återställandet av databasen. Vi skall lägga allt som har med återställningen att göra, i ett skript som kan exekveras.

Spara det du nu gör i filen `reset_part1.bash`. Det är ett bash-skript, en textfil som blir ett kommandoskript som kan köra en godtycklig mängd kommandon.

Vi vill återställa databasen genom att köra ett kommando, så här.

```text
$ bash reset_part1.bash
```



Vilka filer behövs köras? {#filer}
----------------------------------

Följande är de filer som behöver köras för att återställa databasen.

| Fil               | Vad gör den?         |
|-------------------|----------------------|
| `setup.sql`       | Kör som root för att skapa om databasen och skapa användaren user:pass. |
| `ddl.sql`         | Skapa tabellen för lärare. |
| `dml_insert.sql`  | Lägg till rader i tabellen lärare. | 
| `ddl_migrate.sql` | Alter table lärare och lägg till kompetensen. |
| `dml_update.sql`  | Förbered lönerevisionen, alla lärare har grundlön. |
| `dml_update_lonerevision.sql`  | Utför lönerevisionen. |

Det kan se ut så här om du kör varje SQL-skript i terminalen (exklusive utskrifter). Notera att setup.sql måste köras som din root-användare och resten körs som användaren user.

```text
mysql -uroot -p skolan < setup.sql
mysql -uuser -ppass skolan < ddl.sql
mysql -uuser -ppass skolan < dml_insert.sql
mysql -uuser -ppass skolan < ddl_migrate.sql
mysql -uuser -ppass skolan < dml_update.sql
mysql -uuser -ppass skolan < dml_update_lonerevision.sql
```

När du har kört igenom alla så kan du dubbelkolla att du har den korrekta lönesumman.

```text
mysql -uuser -ppass skolan -e "SELECT SUM(lon) AS Lönesumma, SUM(kompetens) AS Kompetens FROM larare;"
```

Det ser ut så här.

```text
$ mysql -uuser -ppass skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare;"
+------------+-----------+
| Lönesumma  | Kompetens |
+------------+-----------+
|     330242 |        19 |
+------------+-----------+
```

Låt se hur vi kan samla dessa kommandon till ett bash-skript.



Ett bash-skript för många kommandon {#bash}
----------------------------------

Ett bash-skript är en textfil med kommandon som kan exekveras. De kommandon du skriver i terminalen kan du skriva i ett bash-skript. Inuti ett bash-skript kan du även skriva programmeringskod, variabler, loopar och funktioner. Bash är alltså ett programmeringsspråk i sig, man brukar kalla den typen av programmeringsspråk för "skriptspråk".

Grunden till bash-skriptet ser ut så här. Börja med att lägga koden nedan i dit t bash-skript.

```text
#!/usr/bin/env bash
#
# Recreate and reset the database to be as after part I.
#
echo ">>> Check Lönesumman = 330242, Kompetens = 19."
mysql -uuser -ppass skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare;"
```

Den första raden kallas shebang och säger att alla raderna i filen skall exekveras med kommandot bash. Brädgården `#` på rad 2-4 är kommentar och echo skriver ut texten som omges av dubbelfnuttar.

Den sista raden exekverar en SQL-sats i terminalklienten mysql och skriver ut resultatet. Det kan se ut så här när man kör programmet via kommandot `bash reset_part1.bash`. Tecknet `$` representerar din prompt.

```text
$ bash reset_part1.bash
>>> Check Lönesumman = 330242, Kompetens = 19.
+------------+-----------+
| Lönesumma  | Kompetens |
+------------+-----------+
|     330242 |        19 |
+------------+-----------+
```

Det är viktigt att din fil har Unix style radslut, de kallas ofta NL eller `\n`. Du kan använda din [texteditor för att sätta radslutet](kunskap/installera-texteditorn-atom#lineending).

Bra, då lägger vi in resten av kommandona, för att återställa databasen, i skriptet.



Komplett skript för att återställa databasen {#reset}
----------------------------------

Här kan du se hur mitt skript ser ut, du kan använda det rakt av och det bör fungera för dig. Gå igenom skriptet och se att det kör alla SQL-filerna för att återställa databasen. I slutet kör den SQL-satsen som hjälper dig att dubbelkolla att lönesumman ser korrekt ut.

```text
#!/usr/bin/env bash
#
# Recreate and reset the database to be as after part I.
#
echo ">>> Reset skolan to after part 1"
echo ">>> Recreate the database (as root)"
mysql -uroot -p skolan < setup.sql > /dev/null

file="ddl.sql"
echo ">>> Create tables ($file)"
mysql -uuser -ppass skolan < $file > /dev/null

file="dml_insert.sql"
echo ">>> Insert into larare ($file)"
mysql -uuser -ppass skolan < $file > /dev/null

file="ddl_migrate.sql"
echo ">>> Alter table larare ($file)"
mysql -uuser -ppass skolan < $file > /dev/null

file="dml_update.sql"
echo ">>> Förbered lönerevision, grundlön larare ($file)"
mysql -uuser -ppass skolan < $file > /dev/null

file="dml_update_lonerevision.sql"
echo ">>> Utför lönerevision ($file)"
mysql -uuser -ppass skolan < $file > /dev/null

echo ">>> Check Lönesumman = 330242, Kompetens = 19."
mysql -uuser -ppass skolan -e "SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare;"
```

Konstruktionen `file="filnamnet"` är en variabel `file` som tilldelas en sträng `"filnamnet"` som sedan nås via `$file`.

Konstruktionen `> /dev/null` gör så att alla utskrifter inte syns, det enda som kommer synas är de eventuella felmeddelande som skripten ger. Felmeddelanden vill du se för att kunna felsöka.

När jag kör mitt program får jag följande utskrift, du bör få motsvarande.

```text
$ bash reset_part1.bash
>>> Reset skolan to after part 1
>>> Recreate the database (as root)
Enter password:
>>> Create tables (ddl.sql)
>>> Insert into larare (dml_insert.sql)
>>> Alter table larare (ddl_migrate.sql)
>>> Förbered lönerevision, grundlön larare (dml_update.sql)
>>> Utför lönerevision (dml_update_lonerevision.sql)
>>> Check Lönesumman = 330242, Kompetens = 19.
+------------+-----------+
| Lönesumma  | Kompetens |
+------------+-----------+
|     330242 |        19 |
+------------+-----------+
```

Du får gärna modifiera och vidarutveckla ditt bash-skript. Men det räcker om det fungerar som jag visar ovan och det skall återställa databasen till läget så här långt in i guiden.



Bli av med varningen för lösenord i klartext {#warning}
---------------------------------

Troligen får du en irriterande varning av att inte ange lösenord i klartext. Visst är det en fullt rimlig varning, men i sammanhanget så är den mest störande.

Du kan bli av med den om du lägger in användaren user med lösenordet pass i din konfigurationsfil `~/.my.cnf`. Följande konstruktion i den filen anger ett defaultlösenord för en användare.

```text
[client]
user=user
password=pass
```

Detta är ju ingen exemplarisk lösning, men det fungerar i sammanhanget. Man vill ju sällan spara lösenord i klartext, det måste vi komma ihåg. Men man får också ta in sammanhanget i beräkningen.

Här följer en kodrad som du kan exekvera i terminalen för att skapa, eller lägga till, informationen i konfigurationsfilen `.my.cnf`. Markera koden och kör den i din terminal som ett kommando.

```text
echo -e "[client]\nuser=user\npassword=pass\n" >> ~/.my.cnf \
    && chmod 600 ~/.my.cnf \
    && cat ~/.my.cnf
```

Nu kan du koppla dig mot databasen utan att ange lösenordet som hämtas från filen.

```text
mysql -uuser skolan
```

Om du nu uppdaterat ditt bash-skript, ta bort optionen `-ppass`, så kan du bli av med varningen. Den är ju lite irriterande.
