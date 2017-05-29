---
author: mos
category: php
revision:
  "2016-01-21": (B, mos) Gör så att destroy session validerar.
  "2015-06-03": (A, mos) Första utgåvan inför htmlphp version 2.
updated: "2016-01-21 14:42:47"
created: "2015-05-20 14:58:07"
...
Att bygga en styleväljare till sin webbplats
==================================

[FIGURE src=/image/snapvt15/stylechooser.png?w=c5&a=20,50,50,0 class="right" caption="En styleväljare i PHP."]

Tanken är att bygga en styleväljare som du kan inkludera på din webbplats. Styleväljaren skall erbjuda en möjlighet att byta stylesheet för att testa olika utseenden på webbplatsen. 

För att lyckas med detta behöver vi använda sessioner och ett formulär. Sedan har vi en infrastruktur som vi kan lägga till vår webbplats, som gör det enkelt att testa och utvärdera olika stylesheets. 

<!--more-->



Förutsättningar {#forutsattning}
--------------------------------------

Exempelkoden bygger på en multisida, det står om multisida i artikeln "[Bygg en multisida med PHP](kunskap/bygg-en-multisida-med-php)".



Exempel på en styleväljare {#exempel}
--------------------------------------

I kursrepot finns ett [exempel på en styleväljare](https://github.com/mosbth/htmlphp/tree/master/example/stylechooser). Du kan testa det i [kursrepot på dbwebb](/repo/htmlphp/example/stylechooser).

Låt nu se hur denna stylesheetväljare är uppbyggd.



En stylesheet-väljare med PHP och sessioner {#php-stylesheet}
------------------------------------------------------------------------------

Hur skall stylesheet väljaren fungera?

> Stylesheetväljaren skall ha ett formulär där man kan välja mellan de stylesheets som finns på webbplatsen. Via formuläret bestämmer man vilken stylesheet som skall användas. Den valda stylesheeten lagras i sessionen. Om man inte valt någon stylesheet så används webbplatsens standard stylesheet.

Hur löser man detta? 

Kika på min lösning så ser du hur det är tänkt att fungera när det är integrerad i en webbplats.

[YOUTUBE src=kSlrZk9RoNk width=630 caption="En styleväljare på Mikaels me-sida."]

När allt är på plats så fungerar det smidigt. Men hur ser delarna ut? För att visa så skapar jag en multisida och visar varje del för sig.



Använd sessionen för att komma ihåg saker {#session}
------------------------------------------------------------------------------

Anrop till en webbsida är [*stateless*](https://en.wikipedia.org/wiki/Stateless_protocol), anropet minns inget från föregående anrop. Det finns inget minne. Men, att ge sin webbplats ett minne kan man göra med en session. 

Sessionen lagras på webbservern. Sessionsdatat kan lagras i en fil eller i en databas. För att komma åt sessionsdatan så används en sessionsnyckel. Nyckel skapas av webbservern och skickas till webbläsaren. När webbläsaren hämtar nästa webbsida så bifogas nyckeln och servern vet vilken sessionsdata som är kopplad till anropet.

Du förstår att sessionens nyckel är viktig, om någon får tag på den så kan de ta över din session på servern. De som skriver serverkoden har olika sätt att hantera sånt för att öka säkerhet och hindra stöld av sessionsnycklar. Att köra trafiken över HTTPS är ett sätt att skydda sig. Ett annat sätt är att koppla extra information till sessionen, till exempel vilken ip-adress som användes och vilken webbläsare som används. Om något inte stämmer överens så tvingar man användaren att logga in igen.



###Starta och namnge sessionen {#start}

Du startar sessionen med PHP-kod, och du kan ge sessionen ett internt namn. Det är bra att ge sessionen ett namn så det inte krockar med andra sessioner på samma server. Det är annars en risk. Samma namn på samma server har samma innehåll.

Så här startar du och namnger en session med PHP.

```php
$name = "mysessionname1";
session_name($name);
session_start();
```

Namnet på sessionen får enbart bestå av [alfanumeriska tecken](https://sv.wikipedia.org/wiki/Alfanumerisk), det vill säga bokstäver a-z och siffror 0-9. Namnet får inte bestå enbart av siffror.

För att göra det enkelt så kan du automatgenerera namnet på sessionen. Här är en konstruktion som skapar namnet på sessionen utifrån sökvägen till nuvarande katalog och max 30 tecken.

```php
//$name = "mysessionname1";
$name = substr(preg_replace('/[^a-z\d]/i', '', __DIR__), -30);
```

Nu blir det enklare och dina sessioner i dina olika exempelprogram krockar inte på studentservern.

[INFO]Felmeddelandet "A session had already been started..."

Om du får det här felmeddelandet på studentservern kan du kontrollera innehållet i `$name` för att se om det innehåller ditt akronym eller inte. Ibland är sökvägen så lång att max 30 tecken inte räcker till och då får man ändra på koden så att det fungerar.[/INFO]



###Hämta och sätt värden i sessionen {#set}

Sessionsdatat görs tillgänglig i en global array som heter `$_SERVER`. Här är kod som räknar upp en räknare med ett för varje gång en sida laddas.

```php
// Get current value of the counter, if it exists, else init it to zero
$counter = isset($_SESSION['counter']) ? $_SESSION['counter'] : 0;

// Increment the counter
$counter += 1;

// Store the countervalue in the session
$_SESSION['counter'] = $counter;
```

Om du lägger koden i en sida kan det se ut så här (ungefär). 

[FIGURE src=/image/snapvt15/session-raknare.png?w=w2 caption="En räknare i sessionen som ökar med ett för varje gång sidan laddas om."]

Här är ett [exempel där du kan testa koden](/repo/htmlphp/example/session). Ladda om sida och se om räknaren ökas på med ett för varje omladdning.



Förstör en session {#destroy}
----------------------------------------------------------------

Ibland vill man förstöra sessionen, det är speciellt behändigt när man testar och är lite osäker på om man gör rätt eller inte. Här är kod från manualen om [`session_destroy()`](http://php.net/manual/en/function.session-destroy.php) som raderar hela sessionen och inte bara innehållet i `$_SESSION`.

```php
// Unset all of the session variables.
$_SESSION = array();
 
// If it's desired to kill the session, also delete the session cookie.
// Note: This will destroy the session, and not just the session data!
if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(
        session_name(),
        '',
        time() - 42000,
        $params["path"],
        $params["domain"],
        $params["secure"],
        $params["httponly"]
    );
}
 
// Finally, destroy the session.
session_destroy();
```

Se till att du har denna koden nära tillhands för att förstöra sessionen, om du får bekymmer när du utvecklar. Du kan till exempel lägga koden i en egen fil och döpa den till `destroy-session.php`. Sedan är det bara att peka webbläsaren på den filen vid behov.



Felmeddelande "Cannot send session cache limiter..." {#session-fel}
----------------------------------------------------------------

Ibland blir det fel. Kanske så här.

[FIGURE src=/image/snapvt15/can-not-send-session-cache-limiter.png?w=w2 caption="Felmeddelande om att sessionen inte kan startas."]

Det som är viktigt att tänka på i samband med sessionen är att sessionens id skickas som en del av HTTP headern, tillsammans med hur länge sessionen skall gälla. HTTP headern skapas så fort man skriver ut första delen av webbsidan. Det räcker med en tom rad eller ett mellanslag för att det skall hända. 

Det är alltså viktigt att starta sessionen, innan man skriver ut något. Bäst är att starta sessionen så tidigt som möjligt. Då undviker man problem.

Felmeddelandet säger att den inte kan skriva detaljer om sessionens regler för cachen. Det är en del av HTTP headern.
 
Så här kan man kika, med Firebug, på varje HTTP-request och se vad HTTP headern innehåller.

[FIGURE src=/image/snapvt15/session-part-of-header.png?w=w2 caption="Felmeddelande om att sessionen inte kan startas."]

För tillfället räcker det att du inser att denna möjligheten till felsökning finns. I framtiden kan detta vara ett viktigt felsökningsverktyg för dig.



Exempelprogram med sessionen {#session-exempel}
----------------------------------------------------------------

I kursrepot för htmlphp finns exempelprogram för sessionen. Här kan du se dess [källkod](https://github.com/mosbth/htmlphp/tree/master/example/session) och här kan du [testa dem](/repo/htmlphp/example/session/).

Testa, studera källkoden. Se hur det är uppbyggt och fungerar.

Se hur `$_GET` används för att förstöra och sätta värden i sessionen.

Nu har vi ordning på sessionen. Då går vi vidare till en styleväljare, hur kan vi implementera den med sessionen?



Spara värdet på stylesheeten i sessionen {#style-session}
----------------------------------------------------------------

Så, nu fokus på styleväljaren. Jag skapar två stylesheets. En normal och en för att testa.

Sedan gör jag en multisida, men följande menyval.

* Skriv ut nuvarande värde på stylesheeten.
* Länkar som via `$_GET` kan byta stylesheet, till exempel `?style=XXX`.
* Ett formulär, med en dropdown, för att byta stylesheet.

Exempel i sin helhet kan [testas på dbwebb](/repo/htmlphp/example/stylechooser) och [källkoden beskådas på GitHub](https://github.com/mosbth/htmlphp/tree/master/example/stylechooser).

Ta och testa det exemplet så du vet hur det fungerar.

Så här fungerar dess delar.



Spara namnet på stylesheeten i sessionen {#save-style}
----------------------------------------------------------------

Först skapar jag en array med de stylesheet jag har. En array kommer hjälpa mig att hantera säkerheten, så att ingen bråkar med mig och försöker skicka in felaktiga filnamn på stylesheeten.

```php
// Valid stylesheets and valid values to store in the session
$stylesheets = [
    "default" => "css/style.css",
    "second" => "css/second.css",
];
```

När jag hämtar värdet på stylesheeten från sessionen, så hanterar jag att det kan vara tomt. Har användaren inte satt ett värde på stylesheeten så finns inget i sessionen, då använder jag default-stylen.

```php
// Get current stylesheet from the session, or use default
$key = isset($_SESSION['stylesheet'])
    ? $_SESSION['stylesheet']
    : "default";
```

Så, nu ska jag bara använda värdet från sessionen, för att hämta stylesheeten från arrayen.

```php
// See it the key actually matches a stylesheet
if (isset($stylesheets[$key])) {
    $stylesheet = $stylesheets[$key];
} else {
    die("The value of key='$key' does not match a valid stylesheet.");
}
```

Är det krångligt? Ja, lite granna kanske. Det kan bli lite mycket att ha koll på vad som finns i sessionen, veta vad som är nyckel i arrayer och så vidare. Men det handlar inte om så mycket kod, så det är överskådligt. Lägg tid på att förstå de olika delarna av koden, även om det kanske känns lite *ruskigt*. 

Så här skulle man kunna läsa koden:

> Variabeln `$key` är nyckel till stylesheeten, antingen fanns den i sessionen eller så har de standardvärdet. Jag använder den som nyckel till arrayen som innehåller de stylesheets som finns. Om nyckeln `$key` finns i arrayen `$stylesheets` så tar jag dess värde, som är sökvägen till stylesheeten, och sparar undan i en variabel `$stylesheet`.

Är du osäker på vad en variabel innehåller? Skriv ut dess innehåll med `echo`.

Är du osäker på om koden i if-satsen exekveras eller ej? Skriv ut något i if-satsen så ser du om koden exekveras.

Är du osäker? Skriv ut.



Skriv ut värdet på stylesheeten i `header.php` {#headerphp}
----------------------------------------------------------------

Nu har vi värdet på stylesheet-filen i variabeln `$stylesheet`. Då skriver vi ut den i HTML-koden, i delen där `<head>` finns. Så här.

```php
<link href="<?=$stylesheet?>" rel="stylesheet">
</head>
```

Bra. Tittar man på sidans källkod i webbläsaren så ser man att sökvägen till stylesheeten finns på plats. Det kan se ut så här när `$key = "default"`.

```html
<link href="css/style.css" rel="stylesheet">
```

Använd alltid *högerklicka och visa källkod* för att se vilken HTML-kod som din PHP-kod genererat.



Sätt värdet på sessionen med `$_GET` {#form-get}
----------------------------------------------------------------

Nu vill vi ha möjligheten att ändra stylesheeten. Vi gör det med enkla länkar och `$_GET`.

Först skapar jag länkarna.

```html
<ul>
    <li><a href="?page=get&amp;style=default">Set the default style</a></li>
    <li><a href="?page=get&amp;style=second">Set the second style</a></li>
</ul>
```

Sedan, överst i samma sida, så kontrollerar jag om `$_GET['style']` har ett värde och isåfall tar jag det värdet och uppdaterar innehållet i sessionen.

Så här.

```php
// Check if style is changed
$style = isset($_GET['style'])
    ? $_GET['style']
    : null;

// Update the session, if $style is set
if ($style !== null) {
    echo "Updated the session with '" . htmlentities($style) . "' Reload to se the change.";
    $_SESSION['stylesheet'] = $style;
}
```

Nu kan jag med länkar och `$_GET` ändra stylesheeten.

 

Sätt värdet på sessionen med en dropdown {#form-dropdown}
----------------------------------------------------------------

En annan variant på att ändra stylesheeten är att använda en dropdown, en `<select>` `<option>`, i ett formulär.

Själva formuläret kan se ut så här.

```html
<form>
    <input type="hidden" name="page" value="dropdown">
    <label>Select the stylesheet.<br>
        <select name="style">
            <option value="default">Default style</option>
            <option value="second">Second style</option>
        </select>
    </label>
    <input type="submit" name="doIt" value="Change the stylesheet">
</form>
```

När formuläret postas med submit-knappen så skickas värdena som en del av länken och hamnar i `$_GET`-arrayen. När du testar exempelkoden så kan du se att länken innehåller allt som är i formuläret.

Så här kan länken se ut när formuläret submittats:

```text
?page=dropdown&style=default&doIt=Change+the+stylesheet
```

Detta är alltså en variant på hur man kan posta ett formulär, via länkens *querystring*, som en key/value-lista efter ?-tecknet, separerade med &-tecknet.

Du ser kanske klurigheten att vi skickar med ett *hidden* fält som innehåller namnet på multisidan, annars hamnar vi inte på rätt undersida. Man måste skapa hela querysträngen, och det löser vi med formulärets dolda fält.

Här kan du se en översikt av de olika [formulärelement som finns i HTML](form).



Använd POST som metod för att posta formuläret {#form-post}
----------------------------------------------------------------

I exemplet ovan postades formuläret enligt GET-metoden som skickade formulärets parametrar via querysträngen. Det finns ett annat sätt att posta ett formulär, POST, vilket gör att formulärets data skickas som en del av HTTP-requesten istället.

Så här ser det ut.

```html
<form method="post" action="?page=post-dropdown">

    <label>Select the stylesheet.<br>
        <select name="style">
            <option value="default">Default style</option>
            <option value="second">Second style</option>
        </select>
    </label>

    <input type="submit" name="doIt" value="Change the stylesheet">

</form>
```

Skillnaden är alltså `method="post"` som säger sättet som formulärets data skall skickas. Säger man inget så blir det default `method="get"`.

Den andra skillnaden är att jag nu kan säga till vilken sida som formuläret skall postas. Det är konstruktionen `action="?page=post-dropdown"` som löser det. Om man utelämnar `action` så postas det till samma sida som man är på. Det  kallas också för ett *self submitting form*.

På serversidan tar vi emot formulärets data i arrayen `$_POST`. Det fungerar på samma sätt som med arrayen `$_GET`.

```php
$style = isset($_POST['style'])
    ? $_POST['style']
    : null;
```

Om `$_POST['style']` har ett värde så är formuläret postat och vi kan använda det värdet för att byta stylesheeten.

Som tidigare behöver du ladda om sidan för att se ändringarna. Det är lite jobbigt i längden. Kan vi göra det bättre?



Låt en processingsida hantera formulärets data {#form-proc}
----------------------------------------------------------------

När du postar formuläret och sedan gör reload så dyker det upp en popup som ser ut ungefär så här.

[FIGURE src=/image/snapvt15/form-reload-confirm.png?w=w2 caption="En popup visas när du försöker ladda om en sida i samband med att formuläret postats."]

Vad popupen säger är att formulärets data måste skickas en gång till för att sidan skall kunna laddas. Det beror på att formuläret skickar datan som en del av HTTP headern. Så den ger oss en liten varning. Ibland skulle detta kunna innebära dubbla postningar. Säg att du gör en betalning på webben, dyker denna rutan upp så skulle det innebära att du gör samma betalning en gång till.

För att undvika detta så skickar man det postade formuläret till en *processingsida*. Denna sida genomför endast det som skall göras. Till exempel skriva till databasen, utföra betalningen, eller i vårt fall ändra stylesheeten. Därefter så skickar processingsidan vidare till en *resultatsida* som visar resultatet, eller *den vanliga webbsidan*.

Så här kan flödet se ut.

[FIGURE src=/image/snapvt15/post-form-process.png caption="Flödet mellan sida som visar formuläret och sida som processar det postade formuläret."]

En fördel att göra så här, i detta fallet, är att vi nu slipper omladdningen av sidan för att vi skall se effekten av bytet av stylesheet. Sessionen uppdateras nu i processingsidan och när den skickar vidare till visningssidan så är den redan uppdaterad och vi upplever att ändringen av stylesheeten är direkt.

Vi ändrade egentligen bara flödet i hur sakerna händer. Men resultatet ser bättre ut.

Först ändrar jag formuläret och berättar att det skall postas till processingsidan.

```html
<form method="post" action="postform-process.php">
```

Här väljer jag att göra processingsidan som en egen sida och inte som en del av multisidan. Det har att göra med att anropet till `header()` måste ske innan någon utskrift har skett till webbläsaren. Eftersom multisidorna exekveras, inkluderas, efter att utskriften har påbörjats, så kan jag inte göra anropet till `header()` i en multisida. Därför blir det en egen sida `postform-process.php`.

Nu flyttar jag PHP-koden för att processa formuläret och lägger den i processingsidan.

```php
// Start the session
$name = substr(preg_replace('/[^a-z\d]/i', '', __DIR__), -30);
session_name($name);
session_start();

// Check if style is changed and then set it
$style = isset($_POST['style'])
    ? $_POST['style']
    : null;

if ($style !== null) {
    $_SESSION['stylesheet'] = $style;
}

// Redirect to the resultpage
header("Location: chooser.php?page=postform");
```

Som du ser så måste jag starta sessionen i varje sida som använder den. När detta skedde i multisidan så var det inget problem, men nu måste jag starta den även i processingsidan. Annars kan jag inte ändra värden i sessionen.

Det som kan vara lite klurigt är att debugga en processingsida. Eftersom den utför ett arbete och sen skickar vidare till en annan sida så kan man inte direkt använda `echo` för att skriva ut och se vad som händer. 

För egen del brukar jag lite brutalt skriva ut saker och sen avbryta exekveringen i processingsidan, så här.

```php
// To debug a processingpage, before it does its redirect
var_dump($_SESSION);
die();
```

Det är en god taktik som fungerar för mig.



Avslutningsvis {#avslutning}
--------------------------------------

Det var grunderna i sessioner och vi såg hur vi kunde skapa en styleväljare genom att använda sessionen. 

Dessutom fick du prova på formulär med både GET och POST samt se hur en processingsida kan förbättra hanteringen av ett postat formulär.

Om du stöter på problem så kan du alltid [fråga i forumet](forum).
