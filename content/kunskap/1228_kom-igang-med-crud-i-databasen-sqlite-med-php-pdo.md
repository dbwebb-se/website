---
author: mos
category:
    - php pdo
    - databas
    - sqlite
    - kurs webtec
revision:
    "2022-10-04": "(B, mos) Lade till vilka lösenord som doe/admin har."
    "2022-10-03": "(A, mos) Första utgåvan inför webtec-v2."
...
Kom igång med CRUD i databasen SQLite med PHP PDO
==================================

[FIGURE src=image/webtec/crud/create_user_login.png?w=c5&a=0,50,50,0 class="right" caption="CRUD med PHP PDO och SQLite och inloggning."]

Vi skall titta på begreppet CRUD som i vårt fall innebär att man bygger ett gränssnitt för att lägga till, uppdatera och ta bort data från en databas. C står för Create att skapa ny data (INSERT), R står för Read att läsa (SELECT), U står för att uppdatera data (UPDATE) och D står för att radera data (DELETE).

I webbsammanhang handlar CRUD ofta om att administrera data som ligger i en databas via ett användargränssnitt som byggs upp av webbsidor.

Denna artikel visar hur man kan göra CRUD med PHP PDO och SQLite och exemplet vi jobbar igenom har med användarhantering att göra, när vi jobbat igenom artikeln har vi en hantering för användare och inloggning som vi kan integrera i vår webbplats.

<!--more-->

Bästa sättet att gå igenom guiden är att genomföra varje övning på egen hand. Gör precis som jag gjort, fast på egen hand. Kopiera eller skriv om kodexemplen, det viktiga är att du återskapar koden i din egna miljö. Läsa är bra men man måste göra själv, "kan själv", för att lära sig.



Förkunskaper {#for}
--------------------------------------

Du kan grunderna i PHP PDO och databsen SQLite med SQL, ungefär det som hanteras i artikeln "[Kom igång med PHP PDO och databasen SQLite](kunskap/kom-igang-med-php-pdo-och-databasen-sqlite)".



Exempelkod {#exempelkod}
--------------------------------------

Denna artikel har exempelkod i kursrepot för webtec under [`example/pdo_crud`](https://github.com/dbwebb-se/webtec/tree/main/example/pdo_crud). Men skriv helst din egna kod när du jobbar igenom artikeln. Det brukar löna sig i längden. Att göra för mycket copy & paste är inte bra när man försöker lära sig nya saker, men det kan vara bra att ha en livlina med färdig kod att kika på vid behov.



Kom igång {#komigang}
--------------------------------------

För att vi skall ha en databas att jobba med i artikeln så använder vi en som ligger i kursrepot under `example/pdo_crud/db/user.sqlite`.

Du kan kopiera databasen så här.

```text
# Stå i rooten av kursrepot
# Skapa övningskatalogen om den inte finns
install -d me/kmom06/crud/db
cp -i example/pdo_crud/db/user.sqlite me/kmom06/crud/db
```

För att undvika problem med rättigheter när vi (och webbservern Apache) vill skriva till databasen så sätter vi följande rättigheter på katalogen och på databasfilen.

```text
chmod 777 me/kmom06/pdo_crud/db
chmod 666 me/kmom06/pdo_crud/db/user.sqlite
```

Nu kan vi titta i databasfilen vad den innehåller för schema.

```text
$ sqlite3 db/user.sqlite 
SQLite version 3.37.2 2022-01-06 13:25:41
Enter ".help" for usage hints.
sqlite> .schema
CREATE TABLE user (
    acronym TEXT PRIMARY KEY,
    name TEXT,
    password TEXT,
    role TEXT,
    avatar TEXT,
    signature TEXT
);
sqlite> 
```

Det ser ut att vara en tabell för användare, tabellen ser ut att heta "user".



En databastabell för användare {#table}
--------------------------------------

Vi kan börja med att visa detaljer från de rader som ligger i tabellen, mest för att undersöka hur det ser ut.

Först tittar vi på alla användare som ligger i tabellen.

```text
sqlite> -- Show all users
SELECT
    acronym,
    name,
    role,
    avatar,
    signature
FROM user
;
acronym  name           role   avatar         signature       
-------  -------------  -----  -------------  ----------------
admin    Id Admin       admin  img/admin.png  /I decide it all
doe      John/Jane Doe  user   img/doe.png    /Who am I?      
mos      Mikael Roos    user   img/mos.jpg    ⠠⠵              
```

Vi kan modifiera SQL-satsen med en WHERE och plocka fram detaljer enbart om en specifik användare.

```text
sqlite> -- Show one user
SELECT
    acronym,
    name,
    role,
    avatar,
    signature
FROM user
WHERE
    acronym = 'admin'
;
acronym  name      role   avatar         signature       
-------  --------  -----  -------------  ----------------
admin    Id Admin  admin  img/admin.png  /I decide it all
```

Bra, då har vi koll på hur tabellen ser ut och hur vi kan jobba med den.



R:et i CRUD - Läsa från databasen {#read}
--------------------------------------

I en tidigare övning lärde vi oss hur man visar information från en databas med hjälp av PHP PDO. En bra start kan vara att återanvända den kunskapen och koden från de skripten vi då skrev för att visa upp alla användare som ligger i databasen.

Jag tänker mig en sidkontroller `users.php` som visar upp alla detaljer om samtliga användare och presenterar det i en HTML tabell (eller i en ul/li lista) samt en sidkontroller `profile.php?user=<acronym>` som visar detaljer om en specifik användare. Sedan kan vi länka från översikten till profilen för endast en användare.

Det skulle kunna se ut så här. Jag tror att du har kunskapen att skriva dessa två sidkontroller på din egen hand, eller så kan du gå tillbaka till föregående övning och se hur du gjorde där.



### Sidkontroller `users.php` {#users_php}

Här handlar det om att exekvera SELECT-frågan och ta hand om resultsetet och producera en HTML tabell i webbsidan. 

[FIGURE src=image/webtec/crud/users.png?w=w3 caption="Alla användare visas i en HTML tabell."]

Jag väljer att länka för varje användare så att man kan klicka på acronymen för att hamna på just den användarens profilsida.



### Sidkontroller `profile.php` {#profile_php}

Strukturen för denna webbsidan är i princip lika som föregående sidkontroller, det är detaljer i hur SELECT-frågan exekveras som skiljer.

Här valde jag att skriva ut innehållet i ett HTML-formulär.

[FIGURE src=image/webtec/crud/profile.png?w=w3 caption="Vald användare visas med detaljer om sin användare."]

Dessa två sidkontrollers visar på grunden i R:et i CRUD, att läsa från databasen och presentera resultatet i en webbsida.



Logga in på webbplatsen {#login}
--------------------------------------

En annan variant att "läsa från databasen" är att ställa en fråga för att se om en användare matchar med ett visst lösenord, det är så man kan göra för att implementera en inloggning på en webbsida.

När man bygger upp inloggning på en webbsida behövs det en handfull sidokontrollers som samverkar i ett flöde och där man väljer att spara i sessionen om användaren är inloggad eller ej.

Här är en grov översikt över d sidkontroller som jag nu avser utveckla för att bygga en hantering av inloggning på webbsidan.

* `login.php` som inloggningsformulär där man matar in sin acronym och lösenord.
    * `login_process.php` kontrollera inloggningen och sparar akronymen i sessionen om inloggningen var lyckad.
        * Gör redirect till sidan där alla användare visas om inloggningen var lyckad.
        * Gör redirect tillbaka till inloggningssida om inloggningen misslyckades.
* `user.php` för att visa detaljer om den inloggade användaren.
* `logout.php` för att ta bort användaren ut sessionen och logga ut, redirect till login-sidan.
* Uppdatera navbaren så att man ser om användaren är inloggad eller inte.
    * Lägg till länkar i navbaren om användaren inte är inloggad.
        * Länk till login.
    * Lägg till länkar i navbaren om användaren är inloggad.
        * Länk till profilen och logout.

Det kan låta mycket att implementera detta, men när vi är klara kommer du se att det inte handlar om speciellt mycket kod. Låt oss ta det steg för steg.

I databasen finns ett par färdiga användare som behöver finnas där för att det skall gå att rätta din inlämning. Det är användaren admin som har lösenordet 'admin' och det är användaren doe som har lösenordet 'doe'.



### Sidkontroller `login.php` {#login_php}

Ett inloggningsformulär är som ett vanligt formulär med två textfält och en knapp. Koden bakom formuläret kan se ut så här.

```html
<h1>Login</h1>

<form method="post" action="login_process.php">
    <fieldset>
        <legend>Login</legend>

        <p>
            <label>Acronym:
                <input type="text" name="acronym" placeholder="Enter your acronym">
            </label>
        </p>

        <p>
            <label>Password:
                <input type="password" name="password" placeholder="Enter the password">
            </label>
        </p>

        <p>
            <input type="submit" name="login" value="Login">
        </p>
    </fieldset>
</form>
```

Så här kan det se ut när man visar upp det i en webbsida.

[FIGURE src=image/webtec/crud/login.png?w=w3 caption="Ett inloggningsformulär där man anger sin acronym och sitt lösenord."]

Då behöver vi en processingsida som hanterar inloggningsformuläret.



### Sidkontroller `login_process.php` {#login_process_php}

Vi kan börja med grunden i processingsidan som hanterar inkommande POST formulär och förbereder att kontrollera i databasen om inloggningen är korrekt.

Det vi skall göra är att kontrollera inloggningen och se om acronymen och lösenordet matchar mot det som ligger i databasen. Om det matchar så sparar vi akronymen i sessionen och sedan gör vi en redirect till en resultatsida och här väljer jag profilsidan.

Om inloggningen misslyckades så sker en redirect tillbaka till inloggningssidan.



#### Steg 1, minsta möjliga processingsida {#minsta}

Om vi börjar **problemlösa stegvis med minsta möjliga kod** så kan vi göra en processingsida som alltid misslyckas och gör en redirect tillbaka till login-sidan tillsammans med ett flashmeddelande. Sen justerar vi så att inloggninen fungerar och gör en redirect till sidan för alla användare.

```php
// Include the config file
include("config/config.php");

// Get incoming POST data
$acronym = $_POST["acronym"] ?? "";
$password = $_POST["password"] ?? "";

// Check if the acronym and password matches
// This should be done using the database

/*
Here should be some database code to check if
the acronym and the password matches the values
stored in the database
*/
$success = false;

// If no not match, return to the login page
if (!$success) {
    // Do a redirect
    setFlashMessage("warning", "Login failed, wrong user or password!");
    header("Location: login.php");
    exit();
}

// The acronym and password did match, save the acronym in the session
$_SESSION["user"] = $acronym;

// Do a redirect
setFlashMessage("success", "Login successful, welcome $acronym!");
header("Location: users.php");
exit();
```

Vi startar sessionen i config-filen, det är viktigt så att alla sidor har samma namngiva session.

Vi plockar in värden från det postade formuläret.

Vi utelämnar databaskoden tills vidare. Här tänker vi att spara resultatet i en variabel `$success`, om inloggningen gick bra eller inte.

Nu kan vi simulera en felaktig inloggning genom att hårdkoda in värdet `false`. Då kan det se ut så här.

[FIGURE src=image/webtec/crud/login_failed.png?w=w3 caption="Inloggningen simulerades som misslyckad och gjorde en redirect tillbaka till inloggningsformuläret."]

Genom att ändra värdet till `true` så kan vi simulera en korrekt inloggning. Då kan det se ut så här.

[FIGURE src=image/webtec/crud/login_success.png?w=w3 caption="Inloggningen simulerades som lyckad och gjorde en redirect till sidan för alla användare."]

Nu har vi ett flöde som vi kan bygga vidare på. Nu skall vi bara lösa verfifieringen av acronym och lösenordet i databasen.



#### Steg 2, hantera lösenord i PHP {#php_pwd}

Först behöver vi veta lite om det rekommendera sättet att hantera lösenord i PHP. Här finns det en funktion som heter [`password_hash()`](https://www.php.net/manual/en/function.password-hash.php) som kan skapa en hash utifrån en textsträng och det finns en funktion [`password_verify()`](https://www.php.net/manual/en/function.password-verify.php) som kan verifiera att en textsträng verkligen matchar ett lösenord.

Ett lösenord sparas alltså inte i klartext, utan man sparar en hash av det.

Följande kod genererar två hashade representationer av lösenord, ett för admin och ett för doe. Lösenordet för admin är "admin" och lösenordet för doe är "doe".

```php
echo "Passwords:\n";

$thePasswordString = "admin";
echo "admin: " . password_hash($thePasswordString, PASSWORD_DEFAULT) . "\n";

$thePasswordString = "doe";
echo "doe: " . password_hash($thePasswordString, PASSWORD_DEFAULT) . "\n";
```

Om man kör programmet ovan kan utskriften se ut så här.

```text
Passwords:
admin: $2y$10$WfMUgKcUGYhVOR6v594YEO1CN0zyQeLEzbrZti0I7RNOVJG0yI1Jy
doe: $2y$10$KRxrymMsl3tz2YMjD30qauVxOha2QkVlKlleaCUaPa3DSRRIMmCkS
```

Vi har alltså de hashade representationen av lösenorden i strängen för admin '$2y$10$WfMUgKcUGYhVOR6v594YEO1CN0zyQeLEzbrZti0I7RNOVJG0yI1Jy' respektive strängen för doe '$2y$10$KRxrymMsl3tz2YMjD30qauVxOha2QkVlKlleaCUaPa3DSRRIMmCkS',

Det är på detta viset som de hashade lösenorden skall sparas i databasen. Vi kan kontrollera vilka hashade lösenord som ligger i databasen för tillfället.

```text
sqlite> -- Show users and passwords
SELECT
    acronym,
    password
FROM user;
acronym  password
-------  ------------------------------------------------------------
admin    $2y$10$WfMUgKcUGYhVOR6v594YEO1CN0zyQeLEzbrZti0I7RNOVJG0yI1Jy
doe      $2y$10$KRxrymMsl3tz2YMjD30qauVxOha2QkVlKlleaCUaPa3DSRRIMmCkS
mos      $2y$10$4Oqn764Puyr6Toio223mSuqeNWrILTBw13W5hY5KJJx.ybkNoxbeS
```

Hur kan man då verifiera att användaren skriver in rätt lösenord? Jo då använder man funktionen `password_verify()`.

Så här kan koden se ut för att verifiera att ett inmatat lösenord matchar en lösenordshash.

```php
$password = $_POST['password'];
$hash = // the hash stored in the database
$success = password_verify($password, $hash);
if ($success) {
    // the password matched the hash stored in the database
}
```

Då behöver vi kod för att hämta hashen som finns i databasen.



#### Steg 3, SQL för att verifiera ett lösenord {#sql_pwd}

Vi vet sedan tidigare hur man kan hämta detaljer om en användare i databasen. Nu vill vi hämta lösenordshashen för den användare som försöker logga in. Följande SELECT kan hämta lösenordet för användaren doe.

```text
-- Get the password for a acronym
SELECT
    password
FROM user
WHERE
    acronym = 'doe'
;
```

Vi kan prova att köra direkt mot databasen.

```text
sqlite> -- Get the password for a acronym
SELECT
    password
FROM user
WHERE
    acronym = 'doe'
;
password                                                    
------------------------------------------------------------
$2y$10$KRxrymMsl3tz2YMjD30qauVxOha2QkVlKlleaCUaPa3DSRRIMmCkS
```



#### Steg 4, koppla databasen och kontrollera lösenordet {#db_pwd}

Nu har vi alla delarna för att kunna verifiera att lösenordet matchar. Låt oss då sätta samman koden som hämtar detaljerna från databasen och verifierar om lösenordet matchar. Så här kan det se ut.

```php
// Check if the acronym and password matches
// This should be done using the database
$dsn = "sqlite:db/user.sqlite";
$db = connectToDatabase($dsn);

$sql = <<<EOD
-- Get the password for a acronym
SELECT
    password
FROM user
WHERE
    acronym = ?
;
EOD;

// Get the password hash from the database
$stmt = $db->prepare($sql);
$args = [$acronym];
$stmt->execute($args);
$res = $stmt->fetch();

// Verify the database hash
$hash = $res["password"];
$success = password_verify($password, $hash);
```

I koden ovan så kopplar vi oss mot databasen för at thämta lösenordshashen för den acronym som försöker logga in. Därefter så kontrollerar vi om det inmatade lösenordet (som kommer det postade formuläret och variabeln POST['password']) stämmer mot den lösenordshash som är sparad i databasen.

Om vi nu sätter samman allt i ett skript så kan vi logga in.

Om du får problem med flödet och inte lyckas att få ihop det så finns det ett exempel i filen `example/pdo_crud/login_process.php` men du kan säkert lösa det på egen hand. Försök alltid själv.



### Sidkontroller `user.php` {#user_php}

När användaren lyckas logga in så gör vi en redirect till users-sidan. Låt oss nu ersätta den sidan med en sida `user.php` som visar information om den inloggade användaren genom att hämta acronymen från sessionen.

Till stor del kan vi kopiera detaljerna från sidan `profile.php` med skillnaden att profil-sidan hämtar acronymen från querysträngen och `user.php` skall hämta acronymen från sessionen istället.

Här är koden som gör skillnaden.

```php
$user = $_SESSION["user"] ?? null;
if (!$user) {
    setFlashMessage("warning", "Only a logged in user can access the page user.php!");
    header("Location: login.php");
    exit();
}
```

Vad som skickas i querysträngen kan vem som helst påverka, men det som ligger i sessionen är skyddat och kan bara påverkas från serversidan. Sidan `user.php` skall man bara kunna nå om man är inloggad som en användare, annars skriver vi ut ett felmeddelande.

Så här kan det se ut när användaren inte är inloggad.

[FIGURE src=image/webtec/crud/user_not_login.png?w=w3 caption="Användaren är inte inloggad och får ett felmeddelande när den försöker nå sidan user samt redirectas till login-sidan."]

När användaren är inloggad kan vi visa detaljer om användaren.

[FIGURE src=image/webtec/crud/user_login.png?w=w3 caption="Användaren är inloggad och får detaljer om sin användare."]

Du kan alltid skriva ut innehållet i `$_SESSION` för att se vilken användare som är inloggad. Det kan vara ett bra sätt att debugga och se att sessionen innehåller rätt saker.

Du kan förstöra sessionen för att logga ut användaren. Det kan också vara ett bra sätt att debugga när du utvecklar koden.



### Sidkontroller `logout_process.php` {#logout_php}

För att genomföra en logout av användaren så handlar det om att ta bort den lagrade acronymen i sessionen. Det är den enda som påvisar om användaren är inloggad eller ej.

Följande kod tar bort ett värde från sessionen.

```php
unset($_SESSION["user"]);
```

När man loggar ut kan man välja en rimlig sida att göra redirect till, en variant är att göra redirect till login-sidan.

När koden är på plats så kan man alltså logga ut från webbplatsen genom att besöka länken `logout_process.php`.



### Uppdatera navbaren för inloggad användare {#navbar_login}

Nu har vi alla grunder för en komplett hantering av inloggning av en användare. Låt oss nu göra en navbar som visar länken till login-sidan när användaren inte är inloggad.

Koden för navbaren bygger på en if-sats som kontrollerar om användaren är inloggad eller ej.

```html
<nav>
    <a href="users.php">All users</a> | 

<?php if ($user) : ?>
    Logged in as '<?= $user ?> '
    <a href="user.php">Profile</a> | 
    <a href="logout_process.php">Logout</a> | 
<?php else: ?>
    <a href="login.php">Login</a>
<?php endif; ?>

</nav>
```

Att kontrollera om användaren verkligen är inloggad gör vi med sessionen.

```php
$user = $_SESSION["user"] ?? "";
```

Navbaren kan inledningsvis se ut så här.

[FIGURE src=image/webtec/crud/navbar_logout.png?w=w3 caption="Här kan vi se hur navbaren ser ut när användaren inte är inloggad."]

När användaren loggar in så vill vi att navbaren uppdaterar sig och nu visar länkar till användarens sida (`user.php`) och till logout-sidan.

En navbar för den inloggade användaren kan alltså se ut så här.

[FIGURE src=image/webtec/crud/navbar_login.png?w=w3 caption="Här kan vi se hur navbaren ser ut när användaren är inloggad."]

Nu har vi ett flöde där användaren kan logga in, se sin egna profil och sedan logga ut.



U:et i CRUD - Uppdatera användarens lösenord {#update}
--------------------------------------

För att uppdatera detaljer i databasen så använder vi SQL-satsen UPDATE. Låt oss bygga en sida där användaren kan ändra sitt lösenord. Vi kan lägga till en länk till sidan `change_password.php` från sidan `user.php`.



### Sidkontroller `change_password.php` {#change_password_php}

När man kommer till sidan för att byta lösenord får man ett formulär där man skall ange det nya lösenordet. Det nya lösenordet måste anges två gånger, så att användaren inte skriver in fel lösenord.

Sidan kan se ut så här.

[FIGURE src=image/webtec/crud/change_password.png?w=w3 caption="Ett formulär där användaren kan byta sitt egna lösenord."]



### SQL-kod för UPDATE {#sql_update}

När man ändrar värde i en eller flera kolumner i en rad i databasen så görs det med UPDATE. Vi behöver alltså en UPDATE-sats som kan uppdatera lösenordet.

Om vi skriver en sådan SQL-sats skulle det kunna se ut så här.

```text
-- Update details on a user
UPDATE user SET
    name = 'Mikael (mos) Roos'
WHERE
    acronym = 'mos'
;
```

Om vi kör den i databasen kan det se ut så här.

```text
sqlite> -- Update details on a user
UPDATE user SET
    name = 'Mikael (mos) Roos'
WHERE
    acronym = 'mos'
;
```

Sedan kan vi kontrollera att detaljerna om användaren uppdaterades.

```text
sqlite> SELECT acronym, name FROM user WHERE acronym = 'mos'; 
acronym  name             
-------  -----------------
mos      Mikael (mos) Roos
```

Det var alltså en generell UPDATE-sats.

Vill man uppdatera flera kolumner samtidigt så kan man lägga till dem i samma sats och separera dem med kommatecken.

```text
-- Update details on a user
UPDATE user SET
    name = 'Mikael (mos) Roos',
    avatar = 'https://some.where/great.png'
WHERE
    acronym = 'mos'
;
```

Nu återgår vi till att uppdatera lösenordet.



### Sidkontroller `change_password_process.php` {#change_password_process_php}

När formuläret postas till processingsidan så kan vi först kontrollera att de två lösenorden stämmer med varandra. Om de inte stämmer så skickar vi tillbaka användaren till samma sida med ett felmeddelande.

Så här kan denna delen av koden se ut.

```php
// Get the acronym from the session
$user = // Get the acronym from the session

// Get incoming from post form
$password1 = $_POST["password_new1"] ?? null;
$password2 = $_POST["password_new2"] ?? null;

// Check that passwords match
if ($password1 !== $password2) {
    setFlashMessage("warning", "The passwords did not match!");
    header("Location: change_password.php");
    exit();
}
```

Så här kan det se ut när lösenorden inte matchar.

[FIGURE src=image/webtec/crud/password_no_match.png?w=w3 caption="När lösenorden inte matchar så skrivs ett felmeddelande ut."]

Om lösenorden matchar så går vi vidare och genererar en lösenordshash för det nya lösenordet som skall sparas i databasen.

```php
// Generate a new password hash from the new password string
$hash = password_hash($password1, PASSWORD_DEFAULT);
```

Nu kan vi skriva till databasen med en UPDATE sats.

```php
// Connect to the database
$dsn = "sqlite:db/user.sqlite";
$db = connectToDatabase($dsn);

// Create the SQL statement
$sql = <<<EOD
UPDATE user SET
    password = ?
WHERE
    acronym = ?
;
EOD;

// Prepare the SQL statement so it can be executed
$stmt = $db->prepare($sql);

// Execute the SQL statement towards the database
$args = [$hash, $user];
$stmt->execute($args);
```

I UPDATE-satsen uppdaterar vi kolumnen för lösenordet för den specifika användaren. Vi skickar med två argument när SQL-satsen exekveras.Det är viktigt att vi placerar argumenten i rätt ordning.

En UPDATE-sats genererar inte ett resultset så det finns inget sådant att hämta. Istället förutsätter vi att SQL-satsen var korrekt och utförde sin uppdatering, annars borde vi få ett felmeddelande. Är vi osäkra kan vi alltid kontrollera med en SQL-sats vad som ligger i databasen.

Avslutningsvis så kan vi göra en redirect till användarens sida.

```php
// Redirect to the user page
setFlashMessage("success", "The password was changed in the database!");
header("Location: user.php");
exit();
```

Så här kan det se ut när lösenordet uppdaterades i databasen och flashmeddelandet visas på resultatsidan.

[FIGURE src=image/webtec/crud/password_changed.png?w=w3 caption="Nu är lösenordet updpaterat i databasen."]

Det var U:et i CRUD för UPDATE och att uppdatera detaljer i databasen.



C:et i CRUD - Skapa en ny användare {#create}
--------------------------------------

Låt oss nu lägga till möjligheten att skapa en ny användare så att nya användare kan ansluta och logga in på webbplatsen.

På loginsidan lägger vi till en ny länk "Create user" och länkar det till `create_user.php`.

[FIGURE src=image/webtec/crud/create_user_link.png?w=w3 caption="En länk som erbjuder en ny användare att skapa en användare."]



### Sidkontroller `create_user.php` {#create_user_php}

På sidan presenterar vi ett formulär där användaren kan ange en acronym och ett lösenord. Det är nästan som formuläret för att byta lösenord, men här kan man även ange en acronym.

Så här kan det se ut.

[FIGURE src=image/webtec/crud/create_user_form.png?w=w3 caption="Ett formulär där man kan ange acronym och lösenord för kontot man vill skapa."]

Nu behöver vi en processingsida.



### SQL-kod för INSERT {#sql_insert}

När man lägger till en rad i en tabell görs det med INSERT. Vi behöver alltså en INSERT-sats som kan lägga till en ny användare.

Om vi skriver en sådan SQL-sats skulle det kunna se ut så här.

```text
-- Insert a new user
INSERT INTO user
    (acronym, password, role)
VALUES
    ('mumin', 'hash', 'user')
;
```

Om vi kör den i databasen kan det se ut så här.

```text
sqlite> -- Insert a new user
INSERT INTO user
    (acronym, password, role)
VALUES
    ('mumin', 'hash', 'user')
;
```

Sedan kan vi kontrollera om användaren lades till.

```text
sqlite> SELECT * FROM user WHERE acronym = 'mumin';
acronym  name  password  role  avatar  signature
-------  ----  --------  ----  ------  ---------
mumin          hash      user                   
```

I detta läget bryr vi oss bara om att lägga till det viktigaste, de andra kolumnerna kan vi hantera senare.



### Sidkontroller `create_user_process.php` {#create_user_process_php}

Nu kan vi bygga upp processingsidan, det är som vanligt en hantering där vi börjar med att hämta inkommande värden från det postade formuläret.

```php
// Get incoming from post form
$acronym = $_POST["acronym"] ?? null;
$password1 = $_POST["password1"] ?? null;
$password2 = $_POST["password2"] ?? null;

// Check that passwords match
if ($password1 !== $password2) {
    setFlashMessage("warning", "The passwords did not match!");
    header("Location: create_user.php");
    exit();
}

// Generate a new password hash from the new password string
$hash = password_hash($password1, PASSWORD_DEFAULT);
```

Nu har vi acronymen och lösenordshashen och kan spara undan det i databasen med hjälp av en INSERT-sats.

```php
// Connect to the database
$dsn = "sqlite:db/user.sqlite";
$db = connectToDatabase($dsn);

// Create the SQL statement
$sql = <<<EOD
-- Insert a new user
INSERT INTO user
    (acronym, password, role)
VALUES
    (?, ?, 'user')
;
EOD;

// Prepare the SQL statement so it can be executed
$stmt = $db->prepare($sql);

// Execute the SQL statement towards the database
$args = [$acronym, $hash];
$stmt->execute($args);
```

I INSERT-satsen väljer vi att bara lägga till värden för kolumnerna acronym, password och role. De andra kolumnerna får ett defaultvärde som är NULL om vi inta har angivit något annat.

Avslutningsvis gör vi en redirect till loginsidan.

```php
// Redirect to the login page
setFlashMessage("success", "The user was created, you can now login!");
header("Location: login.php");
exit();
```

Nu är den nya användaren skapad och redo att logga in.

[FIGURE src=image/webtec/crud/create_user_success.png?w=w3 caption="Den nya användaren är nu skapad och sparad i databasen."]

Som en sista test så loggar vi in som den nya användaren och ser att den ligger i databasen.

[FIGURE src=image/webtec/crud/create_user_login.png?w=w3 caption="Den nya användaren är skapad och syns i översikten bland alla användare."]

Detta var alltså C:et i CRUD, att skapa nya rader i databasen med INSERT.



D:et i CRUD - Ta bort en användare {#delete}
--------------------------------------

Låt oss då skapa möjligheten för en användare att radera sitt eget konto från databasen. Här tänker jag mig att användaren måste först logga in och sedan skapar jag en länk på användarens sida där det går att radera kontot.

Så här kan länken se ut.

[FIGURE src=image/webtec/crud/delete_user_link.png?w=w3 caption="En länk där användaren kan radera sitt eget konto."]



### Sidkontroller `delete_user.php` {#delete_user_php}

I formuläret visar vi bara en knapp, om användaren trycker på den kommer vi till en processingsida som raderar den inloggade användaren från databasen.

[FIGURE src=image/webtec/crud/delete_user_form.png?w=w3 caption="Ett formulär för att radera sin egen användare."]



### SQL-kod för DELETE {#sql_delete}

För att radera en rad från databasen kan vi använda SQL-satsen DELETE. Det kan se ut så här när man tar bort en användare.

```text
-- Delete a user
DELETE FROM user
WHERE
    acronym = 'mumin'
;
```

Så här kan det se ut när vi kör det i databasklienten.

```text
sqlite> -- Delete a user
DELETE FROM user
WHERE
    acronym = 'mumin'
;
```

Om vi nu tittar i tabellen så finns inte användaren längre.

```text
sqlite> SELECT rowid, acronym FROM user;
rowid  acronym     
-----  ------------
1      admin       
2      doe         
3      mos         
5      mumintrollet
```

Då kan vi använda denna SQL-sats i processingsidan.



### Sidkontroller `delete_user_process.php` {#delete_user_process_php}

I processingsidan börjar vi med att kontrollera att formuläret är postat, det blir som en liten säkerhetsgrej så att användaren inte av misstag har nått till sidan.

```php
// Get the current user from the session
$user = // Get the user acronym from the session

// Get incoming from post form
$doit = $_POST["doit"] ?? null;

// Check if the form was submitted
if (!$doit) {
    exit("Direct access to this page is forbidden, the form was not submitted!");
}
```

Nu kan vi förbereda för en DELETE-sats och exekvera den.

```php
// Connect to the database
$dsn = "sqlite:db/user.sqlite";
$db = connectToDatabase($dsn);

// Create the SQL statement
$sql = <<<EOD
sqlite> -- Delete a user
DELETE FROM user
WHERE
    acronym = ?
;
EOD;

// Prepare the SQL statement so it can be executed
$stmt = $db->prepare($sql);

// Execute the SQL statement towards the database
$args = [$user];
$stmt->execute($args);
```

Det sista vi gör är att göra en redirect till sidan som loggar ut användaren. Användaren är ju raderad från databasen men den är fortfarande inloggad via sessionen så för säkerhetsskull återanvänder vi proccesingsidan som loggar ut användaren. 

```php
// Redirect to the login page
setFlashMessage("success", "The user was deleted!");
header("Location: logout_process.php");
exit();
```

När användaren är raderad och utloggad så hamnar vi på login-sidan, som resultatet från en redirect i logout_process-sidan och flash-meddelandet visar att allt gick bra.

[FIGURE src=image/webtec/crud/delete_user_success.png?w=w3 caption="Nu är användaren raderad från databasen och utloggad."]

Detta var alltså sista delen i CRUD, D för att radera saker ur databasen med DELETE.



Vanliga felmeddelanden med PHP PDO och SQLite {#fel}
--------------------------------------

Här följer fler vanliga felmeddelande som kan förekomma när du jobbar med PHP PDO och SQLite. Tillsammans med felmeddelandet finner du tips på hur du kan åtgärda felen.



### Felmeddelande kan inte öppna databasen {#err-open}

*Felmeddelande "unable to open database file"*

> *Fatal error: Uncaught exception 'PDOException' with message 'SQLSTATE[HY000] [14] unable to open database file' in /home/mos/git/htmlphp/example/pdo-sqlite/init.php on line 14*

Lösning: Katalogen som databas-filen skall ligga i är skrivskyddad och databasen kan inte skapas. Ändra rättigheterna på katalogen till 777.

Lösning: Dubbelkolla att du har rätt sökväg till databasfilen så att den ligger i den katalogen du förväntar dig.



### Felmeddelande kan inte skriva till databasen {#err-write}

*Felmeddelande "write a readonly database"*

> *Fatal error: Uncaught exception 'PDOException' with message 'SQLSTATE[HY000]: General error: 8 attempt to write a readonly database' in /home/mos/git/htmlphp/example/pdo-sqlite/init.php on line 29*

Lösning: Databas-filen är skrivskyddad. Ändra rättigheterna till 666 så det går att skriva till filen.



### Felmeddelande om antalet parametrar är fler än frågetecknen {#err-param}

Det är vikigt att antalet frågetecken i SQL-frågan matchar antalet parametrar i arrayen. Annars kan du se följande felmeddelande.

> *Fatal error: Uncaught exception 'PDOException' with message 'SQLSTATE[HY000]: General error: 25 bind or column index out of range' in /home/mos/git/htmlphp/example/pdo-sqlite/select-form.php on line 43*

Om felmeddelandet dyker upp så vet du nu att du måste kontrollräkna antalet parametrar mot antalet frågetecken. Du har skickat in fler parametrar än du har frågetecken.

Var uppmärksam på att om du skickar in för få parametrar så ger det inget felmedelande, men ditt resultset kan ju bli inkorrekt jämfört med det som du förväntade dig.



Avslutningsvis {#avslutning}
--------------------------------------

Vi har gått igenom grunderna i hur man använder PHP PDO för att jobba med CRUD mot en SQLite databas.

Nu kan du behöver programmera på egen hand för att se om det du lärt dig har fastnat.
