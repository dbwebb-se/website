---
author: mos
revision:
    "2018-09-14": "(A, mos) Första versionen."
...
Användningsområden för sessioner
=======================

Vi ser på ett par exempel av hur sessionen kan användas för att lösa saker i vår webbplats.



Logga in och logga ut {#login}
------------------------

Många webbplatser innehåller inslaget där användaren kan logga in på webbplatsen för att få personlig information, presentation och en möjlighet att lägga till och redigera information på webbplatsen.

För att lösa inloggning behövs ett formulär där användare matar in sin inloggning, det behövs en processingsida som kontrollerar om användaren har skrivit rätt lösenord och jämföra användarnamnet och lösenordet mot sin "databas" över användare.

Om vi hoppar över hur man gör med formuläret och lösenordet så handlar det sedan om att lägga till information i sessionen om vem som är inloggad.

Så här.

```php
$_SESSION["acronym"] = "mos";
```

Nu kan man kontrollera om en användare är inloggad.

```php
$isAuthenticated = $_SESSION["acronym"] ?? null;

if ($isAuthenticated) {
    echo "The user is logged in as user {$_SESSION["acronym"]}.";
} else {
    echo "The user is not logged in.";
}
```

När användaren loggar ut så kan man nollställa akronymen.

```php
$_SESSION["acronym"] = null;
```

Det finns ett exempelprogram i kursrepot för htmlphp under `example/login` som [visar en multisida som hanterar inloggning](https://github.com/dbwebb-se/htmlphp/tree/master/example/login).



Styleväljare {#style}
------------------------

En styleväljare handlar om att användaren kan välja en specifik stylesheet för sin egen del. Valet syns bara för den inloggade användaren.

Grundtanken är att man gör ett formulär och visar de olika alternativen för användaren som sedan väljer ett av valen och sedan aktiveras den stylesheeten som en personlig style för användaren.

Om vi hoppar över delen med formuläret så handlar det om att spara information om den valda stylesheeten i sessionen.

```php
$_SESSION["style"] = "dark";
```

Här behöver vi vara försiktiga att inte mappa direkt mot en verklig fil på disk. Det riskerar att öppna säkerhetsrisker (_remote file inclusion_) då användaren kan modifiera informationen som skickas i ett formulär.

Men om vi använder ett id mot en vald style så kan vi använda en array för att mappa id mot den verkliga stylesheetfilen. Detta är samma teknik vi använder i multisidan för att mappa `?page=index` mot en verklig fil `session/index.php`.

```php
$styles = [
    "default" => "css/stylesheet.css",
    "dark" => "css/dark.css",
    "colorful" => "css/colorful.css",
];
```

När denna informationen finns så kan man slutligen välja att skriva ut den valda stylesheeten i sin `view/header.php` inom elementet `<head>`.

Det kan se ut så här.

Först i `view/header.php`.

```php
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title><?= $title ?></title>
    <!-- <link rel="stylesheet" type="text/css" href="css/style.css"> -->
    <?php include __DIR__ . "/stylechooser.php"; ?>
</head>

<body>
```

Här väljer jag att lägga all koden för stylechoosern i en egen vy `view/stylechooser.php`.

```php
/**
 * Generate a stylesheet <link based on the content of the session,
 * to implement a stylechooser.
 * <link rel="stylesheet" type="text/css" href="css/style.css">
 */
// Get the style from session, or set a default style
$style = $_SESSION["style"] ?? null;

$styles = [
    "default" => "css/stylesheet.css",
    "dark" => "css/dark.css",
    "colorful" => "css/colorful.css",
];

// Map the style towards the available styles, and use a default style
$stylesheet = $styles[$style] ?? $styles["default"];

?><link rel="stylesheet" type="text/css" href="<?= $stylesheet ?>">
```

Det finns ett exempelprogram i kursrepot för htmlphp under `example/stylechooser` som [visar en multisida som exemplifierar en stylechooser](https://github.com/dbwebb-se/htmlphp/tree/master/example/stylechooser).



Flashminne {#flash}
------------------------

Ett flashminne, i sammanhanget php och webbsidor, kan vara möjligheten att skicka ett meddelanden mellan två sidoanrop. Ta ett exempel där du precis valt en stylesheet, eller loggat in, och formuläret skickar dig till en processingsida som verkställer ändringen och sedan skickar dig vidare till en resultatsida för att presentera svaret.

I processingsidan vet du om det gick bra eller ej och du vill skicka med ett svar, någon form av feedback "Tack för din ändring av stylesheeten" eller "Du är nu inloggad".

Sådan information kan man skicka via sessionen och i resultatsidan läser man av meddelandet, skriver ut det och sedan nollställer man värdet i sessionen. Vi kan kalla det ett "read once flash message".

Säg att processingsidan innehåller följande del som sätter meddelandet som skall visas.

```php
$_SESSION["flashmessage"] = "Du är nu inloggad.";
```

I resultatsidan kan då följande vy `view/flashmessage.php` inkluderas i sidans header och alltid visa meddelandet, förutsatt att det har ett värde.

Först inkluderar vi vyn i `view/header.php`.

```php
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title><?= $title ?></title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
<?php include __DIR__ . "/flashmessage.php"; ?>

```

Sedan skriver vi koden i `view/flashmessage.php`.

```php
/**
 * Generate a flashmessage on one page load , based on information in the
 * session, then remove the information from the session.
 */
$message = $_SESSION["flashmessage"] ?? null;

// Clear the message, it should only be used once
$_SESSION["flashmessage"] = null;

// Return if no message
if (!$message) {
    return;
}

?><div class="flashmessage">
    <p><?= $message ?></p>
</div>
```

Det finns ett exempelprogram i kursrepot för htmlphp under `example/flashmessage` som [visar en multisida som exemplifierar ett flashmeddelande](https://github.com/dbwebb-se/htmlphp/tree/master/example/flashmessage).
