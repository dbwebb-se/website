---
author: mos
category:
    - php pdo
    - databas
    - sqlite
    - kurs webtec
revision:
    "2022-10-06": "(B, mos) Info om databas i wsl."
    "2022-09-23": "(A, mos) Första utgåvan inför webtec-v2."
...
Kom igång med PHP PDO och databasen SQLite
==================================

[FIGURE src=image/webtec/pdo1/search-result.png?w=c5&a=0,50,50,0 class="right" caption="PHP PDO och SQLite."]

Att bygga webbplatser innebär ofta kopplingar mot databaser och när det gäller PHP så är det numer gränssnittet PDO som är det som främst används. Detta är en guide för att stegvis komma igång med PHP PDO tillsammans med databasen SQLite.

Guiden hanterar grunderna i hur du använder PHP PDO för att koppla upp dig mot en SQLite-databas. Därefter visas hur du kan ställa frågor mot databasen och visa upp resultatet i en webbsida. Det sista vi gör är att skapa ett HTML formulär som söker i databasen och visar resultat, ungefär som en sökmotor.

<!--more-->

Bästa sättet att gå igenom guiden är att genomföra varje övning på egen hand. Gör precis som jag gjort, fast på egen hand. Kopiera eller skriv om kodexemplen, det viktiga är att du återskapar koden i din egna miljö. Läsa är bra men man måste göra själv, "kan själv", för att lära sig.



Förkunskaper {#for}
--------------------------------------

Du bör ha förkunskaper om databaser och specifikt SQLite motsvarande de som hanteras i guiden "[Kom igång med SQL och databasen SQLite med terminalklienten sqlite3](kunskap/kom-igang-med-sql-och-databasen-sqlite-med-terminalklienten-sqlite3)".

Du kan grunderna i PHP med arrayer och funktioner samt HTML formulär med GET.



Exempelkod {#exempelkod}
--------------------------------------

Denna artikel har exempelkod i kursrepot för webtec under [`example/pdo`](https://github.com/dbwebb-se/webtec/tree/main/example/pdo). Men skriv helst din egna kod när du jobbar igenom artikeln. Det brukar löna sig i längden. Att göra för mycket copy & paste är inte bra när man försöker lära sig nya saker, men det kan vara bra att ha en livlina med färdig kod att kika på vid behov.



Kom igång {#komigang}
--------------------------------------

För att vi skall ha en databas att jobba med i artikeln så använder vi en som ligger i kursrepot under [`example/database`](https://github.com/dbwebb-se/webtec/tree/main/example/database). Du kan läsa information om den databasen i README.md.

Du kan kopiera databasen så här.

```text
# Stå i rooten av kursrepot
# Skapa övningskatalogen om den inte finns
install -d me/kmom05/pdo
```

Nu skapar vi ytterligare en katalog `me/kmom05/pdo/db` för databasen och kopierar dit den. 

```text
install -d me/kmom05/pdo/db
cp -i example/database/db.sqlite me/kmom05/pdo/db
```

För att undvika problem med rättigheter när vi (och webbservern Apache) vill skriva till databasen så sätter vi följande rättigheter på katalogen och på databasfilen.

```text
chmod 777 me/kmom05/pdo/db
chmod 666 me/kmom05/pdo/db/db.sqlite
```

Har vi fel rättigheter så kommer vi att få felmeddelande, då kan vi rätta upp det med ovan rättigheter.

Så här ser det ut när du är redo. I texten kan du översätta filrättigheterna likt 7=rwx, 5=r-x och 6=rw-.

```text
$ tree -p me/kmom05/pdo           
[drwxr-xr-x]  me/kmom05/pdo       
└── [drwxrwxrwx]  db              
    └── [-rw-rw-rw-]  db.sqlite   
                                  
1 directory, 1 file               
```



Om PHP PDO och SQLite {#om}
--------------------------------------

Via PHP kan man komma åt informationen i en SQLite-databas. Det finns olika PHP-interface för att jobba mot SQLite, det finns [sqlite](http://php.net/manual/en/book.sqlite.php), [sqlite3](http://php.net/manual/en/book.sqlite3.php) eller [pdo-sqlite](http://php.net/manual/en/ref.pdo-sqlite.php).

Vi kommer att använda interfacet PDO för att jobba mot SQLite. Databasen SQLite vi använder är i version 3.

Läs den korta [introduktionen om PHP PDO](http://php.net/manual/en/intro.pdo.php).

PHP Data Objects (PDO) är ett generiskt gränssnitt för att jobba mot olika underliggande databaser. Det ger ett gemensamt gränssnitt, oavsett vilken databas man använder. PDO stödjer även databaser som MySQL, PostgreSQL och Microsoft SQL Server.

En PDO driver krävs för att PDO ska kunna prata med den valda databasen. En PDO driver sköter den specifika kommunikationen mellan PDO och databasen. I manualen finns en [lista över de PDO driver som finns](http://php.net/manual/en/pdo.drivers.php).



Finns PDO och PDO SQLite installerat? {#install}
--------------------------------------

Med PHP-kod kan du kontrollera om din PHP-installation har stöd för PDO och SQLite.

Lägg följande kod i en PHP-fil `status.php` och kör den på din webbserver för att se om det finns stöd för PDO och SQLite.

```php
if (class_exists('PDO')) {
    echo "<p>PDO exists and the following PDO drivers are loaded.<pre>";
    print_r(PDO::getAvailableDrivers());
}

if (in_array("sqlite", PDO::getAvailableDrivers())) {
    echo "<p style='color:green'>sqlite PDO driver IS enabled";
} else {
    echo "<p style='color:red'>sqlite PDO driver IS NOT enabled";
}
```

Så här kan det se ut när skriptet säger att PHP-installationen har stöd för PDO och SQLite.

[FIGURE src=image/webtec/pdo1/status.png?w=w3 caption="Installationen har stöd för PHP PDO och PDO extension för SQLite finns installerad."]

Du kan testköra skriptet på [studentservern](http://www.student.bth.se/~mosstud/repo/htmlphp/example/pdo-sqlite/check-if-available.php). Det kan se ut ungefär så här.

[FIGURE src=image/webtec/pdo1/student-status.png?w=w3 caption="PDO och SQLite finns på studentservern."]

Använd nu ovanstående PHP-kod för att kontrollera att PHP PDO och SQLite är installerat på din egen maskin.



Koppla ett PHP-skript till en SQLite-databas med PDO {#connect}
--------------------------------------

Vi gör ett minsta möjliga skript som kopplar sig mot en SQLite databas via PHP PDO. Följande skript döper jag till `connect.php`.

```php
// Create a DSN for the database using its filename
$fileName = "db/db.sqlite";
$dsn = "sqlite:$fileName";

// Open the database file and set some attributes on interface
// and catch the exception if it fails.
try {
    $db = new PDO($dsn);
    $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Failed to connect to the database using DSN:<br>'$dsn'<br>";
    throw $e;
}

// Print out the success
echo "<p>The database at '$dsn' is now connected.<p>Dumping the database connection:<pre>";
var_dump($db);
```

Det bör se ut ungefär så här när du kör skriptet.

[FIGURE src=image/webtec/pdo1/connect.png?w=w3 caption="Det gick bra att koppla sig mot databasen."]

Databasfilen ligger i underkatalogen `db` och sökvägen dit är `db/db.sqlite`.

En DSN är en sträng som innehåller informationen för att koppla dig till databasen. En DSN ser olika ut för varje databas. I vårt fall består den av strängen `sqlite:` följt av filens sökväg.

Du kan läsa lite om DSN i metoden för att koppla upp sig mot databasen, [PDO::__construct()](http://php.net/manual/en/pdo.construct.php), kika under stycket om *Parameters*. Du kan också kort [läsa om DSN på Wikipedia](https://en.wikipedia.org/wiki/Data_source_name).

[INFO]

Om du sitter i en Windows-miljö och har installerat XAMPP i Windows men sparar ditt kursrepo och filer i WSL/Ubuntu så behöver du göra enlingt följande tips för att få det att fungera.

* [Kmom05 och felmeddelande med att läsa från databasen Windows/WSL/Ubuntu](https://github.com/dbwebb-se/webtec/issues/17)

[/INFO]



Felmeddelande om PDO inte har skrivrättigheter i katalogen {#err-open}
--------------------------------------

Om du skriver fel sökväg till databasen, eller om databasfilen inte finns, så försöker PDO att skapa databasfilen. För att lyckas med det så behöver PDO ha skrivrättigheter i den katalogen där databasfilen skall ligga.

I vårt exempel så har vi redan databasfilen så det bör inte bli ett problem.

Men, om vi till exempel stavar fel på databasfilen eller dess sökväg så kan det se ut så här.

> *"Fatal error: Uncaught PDOException: SQLSTATE[HY000] [14] unable to open database file in /app/me/kmom05/pdo/connect.php:10 ... in /app/me/kmom05/pdo/connect.php on line 10"*

[FIGURE src=image/webtec/pdo1/connect-failed.png?w=w3 caption="Misslyckades med att koppla sig, eller skapa den felstavade databasen."]

Det som skrivs ut är dels vår egen felsökningstext som visar sökvägen/dsn och dels felmeddelandet från PHP om det fel som kastades.

Kom ihåg att det alltid är det översta felet som är intressant, resten av felen är ofta följdfel och fixar man det första så kan de försvinna.

> *"Lös alltid det översta felet först och lös ett fel i taget."*

Om du vill att databasen skall skapas automatiskt så behöver du ge användaren som kör webbservern skrivrättigheter till katalogen. Ett enkelt sätt att göra det är kommandot `chmod`.

```bash
chmod 777 db
```

Notera att ovan problem med rättigheter inte nödvändigtvis inträffar på Windows. Men på Mac OS och Unix-baserade operativsystem så är det desto viktigare. Studentservern kör på Debian/Linux så där är det väldigt viktigt att ha koll på rättigheterna.

När du gör `dbwebb publish` mot studentservern så sätts automatiskt rättighteterna på kataloger som heter `db` och filer som slutar på `.sqlite`. Du bör alltså inte få problem med rättigheter när du publicerar mot studentservern.



Skapa en funktion för att koppla mot databasen {#connect-func}
--------------------------------------

Att koppla sig mot databasen gör man varje gång man vill göra något med databasen. Koden för att koppla sig är alltså bra om man lägger i en funktion, ungefär så här.

```php
/**
 * Exception handler to print out a HTML message with details on the exception,
 * useful to deal with uncaught exceptions.
 *
 * @return object as the database connection object.
 */
function connectToDatabase(string $dsn): object
{
    try {
        $db = new PDO($dsn);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        echo "Failed to connect to the database using DSN:<br>'$dsn'<br>";
        throw $e;
    }

    return $db;
}
```

Nu kan vi uppdatera vårt skript så att det använder funktionen. Koden för att inkludera funktionsfilen är inte med, den behöver du lägga till.

```php
// Connect to the database
$dsn = "sqlite:db/db.sqlite";
$db = connectToDatabase($dsn);

// Print out the success
echo "<p>The database at '$dsn' is now connected.<p>Dumping the database connection:<pre>";
var_dump($db);
```



Ställ en fråga till databasen {#stall-fraga}
--------------------------------------

Vi gör nu en databasfråga som vi skall ställa mot databasen. Låt oss ta följande SELECT-sats.

```sql
SELECT
    rowid,
    *
FROM namnlista
WHERE
    namn = 'Mikael'
    OR namn = 'Magnus'
    OR namn = 'Carina'
;
```

Kolumnen "rowid" är en kolumn specifik för SQLite och den anger ett unikt id på en rad i en tabell.

Om vi kör den i terminalklienten `sqlite3` kan resultatet se ut så här.

```text
sqlite> SELECT
   ...>     rowid,
   ...>     *
   ...> FROM namnlista
   ...> WHERE
   ...>     namn = 'Mikael'
   ...>     OR namn = 'Magnus'
   ...>     OR namn = 'Carina'
   ...> ;
rowid       namn        datum       namnlangd
----------  ----------  ----------  ----------
464         Carina      7/5         Ja
876         Magnus      19/8        Ja
1004        Mikael      29/9        Ja
```

Då skall vi köra samma SELECT sats i ett PHP skript med PDO.

Vi behöver göra följande för att det skall fungera.

1. Skapa en DSN.
1. Koppla oss mot databasen via dess DSN.
1. Skapa SQL-satsen.
1. Förbereda SQL-satsen så att den kan köras.
1. Kör SQL-satsen mot databasen.
1. Hämta resultatet, kallas också "resultset", från databasfrågan.
1. Visa innhåller i resultsetet.

Så här kan det översättas i ren kod i skriptet `select.php`. Observera att skriptet förutsätter att du har en aktiv databaskoppling i variabeln `$db`, det är kod du måste lägga till själv.

```php
// Create the SQL statement
$sql = <<<EOD
SELECT
    rowid,
    *
FROM namnlista
WHERE
    namn = 'Mikael'
    OR namn = 'Magnus'
    OR namn = 'Carina'
;
EOD;

// Prepare the SQL statement so it can be executed
$stmt = $db->prepare($sql);

// Execute the SQL statement towards the database
$stmt->execute();

// Get the resultset and print it out
$res = $stmt->fetchAll();
echo "<pre>", print_r($res, true), "</pre>";
```

Det kan se ut så här när du kör skriptet.

[FIGURE src=image/webtec/pdo1/select.png?w=w3 capition="Utskrift av resultatet från databasfrågan."]

Svaret kommer som en array, där varje rad i arrayen är en rad från databasen. Det är en array som innehåller arrayer. Man kallar det även för en tvådimensionell array. Du kan använda en `foreach`för att loopa igenom ditt resultset och skriva ut det på ett lite snyggare sätt.



Prepared statements och SQL injections {#sqlinjections}
--------------------------------------

Ovan använde vi något som kallas "Prepared statements" som är en feature som stöds av många databaser. Prepared statements har ett säkert sätt att hantera argument, ett sätt som undviker säkerhetshål som SQL injections.

Läs snabbt det inledande stycket om [prepared statements och studera översiktligt exemplen](http://www.php.net/manual/en/pdo.prepared-statements.php). Där får du en kort introduktion till hur prepared statements fungerar.

Låt oss säga några ord om säkerhetshål och SQL injections innan vi fortsätter.

[FIGURE src=http://imgs.xkcd.com/comics/exploits_of_a_mom.png caption="Strip om SQL injections från [http://xkcd.com/327/](http://xkcd.com/327/)."]

SQL injections är ett sätt för en "cracker" att "bryta sig in" i en webbapplikation genom att via URL:en, eller formulär, modifiera SQL-satserna som körs av webbapplikationen. Ett sådant säkerhetshål kan ge en inbrytare tillgång till alla användare och lösenord i en databas.

Läs lite snabbt (och översiktligt) om [SQL injections på Wikipedia](http://en.wikipedia.org/wiki/SQL_injection).

Låt oss kika på hur vi kan uppdatera vår SQL fråga ovan för att den ska bli helt korrekt som ett prepared statement med argument.



Prepared statement med argument {#prep-argument}
--------------------------------------

När man använder prepared statements använder man `?` för att ersätta det som vi kan kalla "argument" i vår SELECT fråga. Titta på följande exempel och jämför det med din tidigare kod.

```php
// Create the SQL statement
$sql = <<<EOD
SELECT
    rowid,
    *
FROM namnlista
WHERE
    namn = ?
    OR namn = ?
    OR namn = ?
;
EOD;

// Prepare the SQL statement so it can be executed
$stmt = $db->prepare($sql);

// Execute the SQL statement towards the database
$args = ['Mikael', 'Magnus', 'Carina'];
$stmt->execute($args);

// Get the resultset and print it out
$res = $stmt->fetchAll();
echo "<pre>", print_r($res, true), "</pre>";
```

Den viktiga delen är följande.

```text
    namn = ?
    OR namn = ?
    OR namn = ?
```

Dessa tre frågetecken är placeholders för argumenten som skickas till execute satsen.

```php
// Execute the SQL statement towards the database
$args = ['Mikael', 'Magnus', 'Carina'];
$stmt->execute($args);
```

När frågan körs kommer varje frågetecken att ersättas med respektive argument, i den ordning de kommer. Internt kommer då PDO att kolla vilken datatyp det är och även escapa eventuellt farliga tecken som skulle kunna öppna upp för SQL injections. Gör man så här är man alltså säker mot SQL injections när det gäller denna biten.

Använd alltid frågetecken `?` och skicka med argumenten `stmt->execute(['Mikael', 'Magnus', 'Carina'])` när frågan exekveras. Då är du säker mot SQL injektioner.



Visa innehållet i en tabell {#tabell}
--------------------------------------

Om vi vill ha en snyggare utskrift av vårt resultset så kan vi skriva ut det i en tabell med en foreach sats. Låt oss kika på hur det kan se ut om vi lägger följande kod i filen `table.php`. Vi förutsätter att du har exekverat en fråga så att det finns ett resultset att hämta.

```html
// Get the resultset and print it out
$res = $stmt->fetchAll();

?><style>
table, th, td {
    border: 1px solid black;
}
</style>
<table>
    <tr>
        <th>Id</th>
        <th>Namn</th>
        <th>Datum</th>
        <th>Namnlängd</th>
    </tr>

<?php foreach ($res as $row) : ?>
    <tr>
        <td><?= $row['rowid'] ?></td>
        <td><?= $row['namn'] ?></td>
        <td><?= $row['datum'] ?></td>
        <td><?= $row['namnlangd'] ?></td>
    </tr>
<?php endforeach ?>
```

Det kan se ut så här om du kör skriptet.

[FIGURE src=image/webtec/pdo1/table.png?w=w3 caption="Resultatet från SELECT utskrivet i en HTML-tabell."]

Då har vi koll på hur man ställer en databasfråga med SELECT och hämtar ett resultset och skriver ut det.



Visa enbart en rad från tabellen {#single}
--------------------------------------

Låt oss skapa en sida `single.php` som enbart visar en rad från tabellen genom att vi skickar in radens id (rowid) som en query parameter.

Så här är tanken att länken ser ut.

```
# Generic format
single.php?id=<id>

# Specific for a certain row
single.php?id=1004
```

Om man inte anger ett id så ger sidan ett felmeddelande, så här.

[FIGURE src=image/webtec/pdo1/single-no-id.png?w=w3 caption="Skriptet avslutas med ett felmeddelande när querysträngen inte innehåller rätt parametrar."]

Om man skickar in ett id så är tanken att raden visas.

[FIGURE src=image/webtec/pdo1/single.png?w=w3 caption="Raden och dess kolumners värden visas."]

Flödet för hanteringen i `single.php` kan se ut så här.

```php
// Get details from the query string
// Exit the script if the id is missing
// Connect to the database
// Create the SQL statement
// Prepare the SQL statement so it can be executed
// Execute the SQL statement towards the database
// Get the resultset
// Include the view that shows the row
```

Först kollar vi om sidan är rätt anropad med rätt argument i querysträngen.

```php
// Get details from the query string
$id = $_GET['id'] ?? null;

// Exit the script if the id is missing
if (!$id) {
    die("You have accessed this page without entering an is through the query string.");
}
```

Sedan hämtar vi informationen från databasen, med hjälp av det angivna id:et.

```php
// Connect to the database
$dsn = "sqlite:db/db.sqlite";
$db = connectToDatabase($dsn);

// Create the SQL statement
$sql = <<<EOD
SELECT
    rowid,
    *
FROM namnlista
WHERE
    rowid = ?
;
EOD;

// Prepare the SQL statement so it can be executed
$stmt = $db->prepare($sql);

// Execute the SQL statement towards the database
$args = [$id];
$stmt->execute($args);

// Get the resultset
$res = $stmt->fetch();
```

Här använder vi metoden [`fetch()`](https://www.php.net/manual/en/pdostatement.fetch.php) som enbart hämtar en rad. I detta fallet har vi ju ett resultset som bara är tänkt att innehålla en rad och då behöver vi inte använda `fetchAll()`.

Vi kan också kontroller att resultsetet verkligen innehåller något värde, annars kan vi avbryta med ett felmeddelande.

```php
// If empty resultset
if (!$res) {
    die("The query did not find a match in the database table, empty resultset.");
}
```

Avslutningsvis inkluderar vi den vy som skapar, eller "renderar", själva sidan.

```php
// Include the view that shows the row
require "view/single.php";
```

Själva "utskriften" av resultatet kan göras på många olika sätt, här skrivs informationen ut i ett formulär med ifyllda formulärelement. Som information kan du studera koden som hanterar utskriften.

```html
$id         = htmlentities($res['rowid'] ?? "");
$name       = htmlentities($res['namn'] ?? "");
$date       = htmlentities($res['datum'] ?? "");
$nameLength = htmlentities($res['namnlangd'] ?? "");

$checked = $nameLength === "Ja" ? 'Checked="Checked"' : null;


?><h1>Show specific row from database</h1>

<form>
    <fieldset>
        <legend>Row with id '<?= $id ?>'</legend>

        <p>
            <label>Id:
                <input type="text" name="id" value="<?= $id ?>" readonly="readonly">
            </label>
        </p>

        <p>
            <label>Name:
                <input type="text" name="name" value="<?= $name ?>" readonly="readonly">
            </label>
        </p>

        <p>
            <label>Date:
                <input type="text" name="date" value="<?= $date ?>" readonly="readonly">
            </label>
        </p>

        <p>
            <label>Namnlängd:
                <input type="checkbox" name="nameLength" value="Ja" <?= $checked ?> disabled="disabled">
            </label>
        </p>
    </fieldset>
</form>
```

Nu har vi en sida som kan visa innehållet i en rad, om man bifogar dess id.

Fundera lite på om du kan uppdatera sidan så att den även kan ta `single.php?name=Mikael` som ett alternativ. Då kan du skriva en SQL-sats som antingen använder id:et för att söka, eller använder namnet för att söka. Ta det som en övning att uppdatera ditt skript på det sättet.



Gör ett GET sökformulär med SELECT {#select-form}
--------------------------------------

Låt oss se hur vi kan kombinera ett formulär med en databasfråga och skapa ett sökformulär som låter användaren ställa frågor till databasen. Koden jag skriver sparar jag i `search.php`.

Formulärets struktur är ett "Self submitting form", det submittas alltså till sig själv. Samma skript hanterar två lägen (state), antingen där man besöker sidan utan att söka, och man besöker sidan efter att ha klickat på "Sök"-knappen.

Så här kan det se ut när det är klart.

Först ett formulär där vi kan skriva in en söksträng. Likt SQL så använder vi här `%` som *wildcard* för att söka på delsträngar.

[FIGURE src="image/webtec/pdo1/search.png?w=w3" caption="Skriv in en söksträng, med eller utan `%`."]

För att prova tar vi en söksträng `mik%` och sedan klickar vi på "Sök"-knappen och resultatet visar sig.

[FIGURE src="image/webtec/pdo1/search-result.png?w=w3" caption="Resultatet från sökningen presenteras."]

Låt nu se hur vi kan tänka kring hur vi bygger upp detta.



### Skapa en mental bild av flödet {#mental-search}

Nu blandar vi in formulärhantering med en databasfråga. Nu gäller det att ha den mentala bilden av hur skriptet exekveras. Var skall koden för formuläret vara och var kollar vi om formuläret är postat och var skriver vi databasfrågan? Här är ett par viktiga saker i hur exekveringen av PHP-skriptet sker. Övning ger färdighet så bygg upp din mentala bild av hur exekveringen sker.

Så här kan man bygga upp sin mentala bild av flödet i sidan som är en "self-submitting" sidkontroller.

1. Börja med att läsa av GET arrayen och spara undan inkommande värden från querysträngen.
    1. Nu har vi variabler som visar om formuläret är submittat eller ej.
1. Visa sidan, med sökformuläret, detta sker alltid, oavsett om formuläret är submittat eller ej.
1. Kontrollera nu om formuläret var submittat.
    1. Om nej, gå vidare och avsluta skriptet.
    1. Om ja, koppla mot databasen databasen och ställ en fråga mot den, hämta resultsetet.
1. Skriv ut resultsetet.

Sen behöver man översätta den skissen till riktig kod.



### Kodens flöde bit för bit {#mental-search-kod}

Så här ser koden ut, om vi tar den bit för bit.

Vi börjar med att läsa av GET arrayen för att hämta värden från det submittade formuläret. Om formuläret inte är submittat så får de defaultvärden.

Därefter inkluderas en vy som visar upp sökformuläret. PHP/HTML koden för att visa upp formuläret har jag lagt i en separat fil och jag väljer att inte visa den här.

```php
// Get details if the form is posted or not
$doit  = $_GET['doit'] ?? null;
$query = $_GET['query'] ?? null;

// Include the view that shows the search form
require "view/searchForm.php";
```

Sedan kontrollerar vi om formuläret är postat och isåfall gör vi databasfrågan för att hämta hem resultsetet.

Om formuläret inte är postat så exkluderas all databaskod i if-satsen, då finns ingen anledning att skapa en koppling till databasen.

```php
// Do the search query, if the form is submitted or if there is a query
if ($doit || $query) {

    // Connect to the database
    // Prepare and execute the SQL statement
    // Prepare the SQL statement so it can be executed
    // Execute the SQL statement towards the database
    // Get the resultset
    // Print out the resultset
}
```

Den databaskoden som inuti if-satsen utför frågan och hämtar resultsetet kan se ut så här.

```php
// Do the search query, if the form is submitted or if there is a query
if ($doit || $query) {

    // Connect to the database
    $dsn = "sqlite:db/db.sqlite";
    $db = connectToDatabase($dsn);

    // Prepare and execute the SQL statement
    $sql = <<<EOD
    SELECT
        rowid,
        *
    FROM namnlista
    WHERE
        namn LIKE ?
        OR datum LIKE ?
        OR namnlangd LIKE ?
        OR rowid = ?
    ;
    EOD;

    // Prepare the SQL statement so it can be executed
    $stmt = $db->prepare($sql);

    // Execute the SQL statement towards the database
    $args = [$query, $query, $query, $query];
    $stmt->execute($args);

    // Get the resultset
    $res = $stmt->fetchAll();

    // Print out the resultset
    require "view/table.php";
}
```

Det som är lite speciellt med SELECT-satsen är hur man använder den postade söksträngen för att jämföra mot flera olika kolumner i tabellen. I vårt fall har vi tre strängar och en integer och PDO löser så att koden bakom jämför med rätt typer. Vi måste bara ha koll på att LIKE fungerar med strängkolumner och inte med siffror.

PS. Det är konstruktionen LIKE som använder sig av % för att kunna söka på delsträngar. Använder man = så måste strängarna se exakt likadana ut.



### Felmeddelande om antalet parametrar är fler än frågetecknen {#err-param}

Det är vikigt att antalet frågetecken i SQL-frågan matchar antalet parametrar i arrayen. Annars kan du se följande felmeddelande.

> *Fatal error: Uncaught exception 'PDOException' with message 'SQLSTATE[HY000]: General error: 25 bind or column index out of range' in /home/mos/git/htmlphp/example/pdo-sqlite/select-form.php on line 43*

Om felmeddelandet dyker upp så vet du nu att du måste kontrollräkna antalet parametrar mot antalet frågetecken. Du har skickat in fler parametrar än du har frågetecken.

Var uppmärksam på att om du skickar in för få parametrar så ger det inget felmedelande, men ditt resultset kan ju bli inkorrekt jämfört med det som du förväntade dig.



Vanliga felmeddelanden med PHP PDO och SQLite {#fel}
--------------------------------------

Här följer fler vanliga felmeddelande som kan förekomma när du jobbar med PHP PDO och SQLite. Tillsammans med felmeddelandet finner du tips på hur du kan åtgärda felen.

*Felmeddelande "unable to open database file"*

> *Fatal error: Uncaught exception 'PDOException' with message 'SQLSTATE[HY000] [14] unable to open database file' in /home/mos/git/htmlphp/example/pdo-sqlite/init.php on line 14*

Lösning: Katalogen som databas-filen skall ligga i är skrivskyddad och databasen kan inte skapas. Ändra rättigheterna på katalogen till 777.

Lösning: Dubbelkolla att du har rätt sökväg till databasfilen så att den ligger i den katalogen du förväntar dig.

*Felmeddelande "write a readonly database"*

> *Fatal error: Uncaught exception 'PDOException' with message 'SQLSTATE[HY000]: General error: 8 attempt to write a readonly database' in /home/mos/git/htmlphp/example/pdo-sqlite/init.php on line 29*

Lösning: Databas-filen är skrivskyddad. Ändra rättigheterna till 666 så det går att skriva till filen.



Avslutningsvis {#avslutning}
--------------------------------------

Vi har gått igenom grunderna i hur man använder PHP PDO för att koppla upp sig och ställa frågor mot en SQLite databas.

Nu kan du behöver programmera på egen hand för att se om det du lärt dig har fastnat.
