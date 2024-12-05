---
author:
    - nik
    - efo
category:
    - design
    - pico
revision:
    "2024-12-05": (B, efo) Uppdaterad HT2024.
    "2020-11-19": (A, nik) Skapad inför HT2020.
...

Sätt upp session i Pico
==================================

För att Pico ska kunna veta om den ska ladda in ert vanliga tema eller det mörka temat så behöver vi sätta upp en session. Vi tar vara på våra kunskaper ifrån webtec och sätter upp det i Pico. Artikeln är uppdelad i ett par olika delar där varje del är filer ni behöver uppdatera.



<!--more-->



Config {#config}
--------------------------------------

Vi börjar med att sätta upp konfigureringsfilen för sessionen. I `config/`-mappen så kan det vara så att ni har en `config.php`, beroende på när ni började jobba med kursen. Vi vill i vilket fall att den ska finnas där och se ut såhär:

```php
<?php
if (session_status() == PHP_SESSION_NONE) {
    $name = preg_replace("/[^a-z\d]/i", "", __DIR__);
    session_name($name);
    session_start();
}
```

Vi startar sessionen om den inte är igång med samma unika sessionsnamn som i webtec. Den bygger på sökvägen till filen, så på studentservern behövs detta för att ni ska få en unik session.



Index {#index}
--------------------------------------

Nästa fil vi ska in i är `index.php`, den som driver hela ramverket. Vi ska lägga till lite egen kod där, men vi kan börja med hur den ser ut innan så ni är med på vilken fil jag menar.

```php
/* index.php */
<?php
if (is_file(__DIR__ . '/vendor/autoload.php')) {
    require_once(__DIR__ . '/vendor/autoload.php');
} else {
    die("Cannot find 'vendor/autoload.php'. Run `composer install`.");
}

require_once(__DIR__ . "/config/config.php");

// instance Pico
$pico = new Pico(
    __DIR__,    // root dir
    'config/',  // config dir
    'plugins/', // plugins dir
    'themes/'   // themes dir
);

// override configuration?
//$pico->setConfig(array());

// run application
echo $pico->run();
```

Här ska vi börja med att uppdatera "Override configuration". Anledningen till detta är för att vi behöver nå sessionen i våra `.twig`-filer och på detta sätt så kan vi skapa en variabel, likt `{{ theme_url }}`, som vi kan jobba med. Vi lägger till att sessionen ska laddas in under variabeln `session`.

```php
// override configuration?
$pico->setConfig(array(
    'session' => $_SESSION
));
```

Sådär, nu är vår session igång och rullar och vi kan nå den vart som i våra `.twig`-filer genom att hämta den såhär: `{{ config.session }}`.



Formulär {#forms}
--------------------------------------

Men vi har inget sätt att uppdatera vår session och det känns onödigt att bygga formulär för det. Jag löser det istället med hjälp av två länkar som använder sig utav GET, en för att uppdatera temat och en för att nollställa sessionen. Den sista är en bra sak att ha.

I och med att vi laddar in vår `config/config.php` så väljer jag att lägga logiken för sessionen där. Vi börjar med att lägga till en if-sats som kollar ifall `$_GET["action"]` är satt:

```php
if (isset($_GET["action"])) {

}
```

Där i väljer jag att bygga vidare med de två länkar jag ska hantera, `?action=theme` som uppdaterar temat och `?action=session_destroy` som nollställer sessionen. Vi börjar med `?action=theme`:

```php
if (isset($_GET["action"])) {
    if ($_GET["action"] == "theme") {
        $previousValue = isset($_SESSION["theme"]) ? $_SESSION["theme"] : null;

        if ($previousValue == "dark") {
            unset($_SESSION["theme"]);
        } else {
            $_SESSION["theme"] = "dark";
        }

        $url = $_SERVER["REQUEST_SCHEME"] . "://" . $_SERVER["HTTP_HOST"] . $_SERVER["PHP_SELF"];
        $url = preg_replace("/index.php\//", "", $url);
        header("Location: $url");
    }
}
```

Andra raden kollar ifall `$_SESSION["theme"]` är satt och använder den ifall den är det, annars sätts den till `null`. Vi använder `$previousValue` för att veta om vi ska byta tillbaka till ljus tema eller om vi ska sätta den till mörkt. I slutet bygger vi en URL som gör att länken skickar tillbaka dig till samma sida som du var på.

Sen vill vi även kunna nollställa sessionen helt (`?action=session_destroy`), det gör vi med nedanstående kod:

```php
if ($_GET["action"] == "session_destroy") {
    session_destroy();
    $url = $_SERVER["REQUEST_SCHEME"] . "://" . $_SERVER["HTTP_HOST"] . $_SERVER["PHP_SELF"];
    $url = preg_replace("/index.php\//", "", $url);
    header("Location: $url");
}
```

Hela `config.php` ser alltså ut så här nu:

```php
<?php
if (session_status() == PHP_SESSION_NONE) {
    $name = preg_replace("/[^a-z\d]/i", "", __DIR__);
    session_name($name);
    session_start();
}

if (isset($_GET["action"])) {
    if ($_GET["action"] == "theme") {
        $previousValue = isset($_SESSION["theme"]) ? $_SESSION["theme"] : null;

        if ($previousValue == "dark") {
            unset($_SESSION["theme"]);
        } else {
            $_SESSION["theme"] = "dark";
        }

        $url = $_SERVER["REQUEST_SCHEME"] . "://" . $_SERVER["HTTP_HOST"] . $_SERVER["PHP_SELF"];
        $url = preg_replace("/index.php\//", "", $url);
        header("Location: $url");
    }

    if ($_GET["action"] == "session_destroy") {
        session_destroy();
        $url = $_SERVER["REQUEST_SCHEME"] . "://" . $_SERVER["HTTP_HOST"] . $_SERVER["PHP_SELF"];
        $url = preg_replace("/index.php\//", "", $url);
        header("Location: $url");
    }
}
```

Nu kan vi, oavsett vilken sida vi står på, uppdatera temat genom att lägga till `?action=theme` på vår URL eller nollställa sessionen genom att lägga till `?action=session_destroy`. En bra start, men rimligen vill vi göra det mer användarvänligt så i nästa del löser vi det genom att göra två knappar.



Twig & Meta {#twig}
--------------------------------------

Jag väljer att lägga mina länkar i min footer med hjälp av `content/_meta.md`, men ni kan själva välja att lägga länkarna varsom med hjälp av följande:

```html
<!-- Länkarna om ni inte vill ha dem i er footer --->
<a href="?action=session_destroy">Destroy Session</a>
<a href="?action=theme">Swap theme</a>
```

Jag lägger till mina i min `_meta.md`, så den ser ut såhär:

```
---
Logo: image/me.jpeg
Tagline: University Lecturer
icon: fas fa-snowflake
Social:
    - title: Link till sidans github repo.
      url: https://github.com/AuroraBTH/design-example
      icon: fab fa-github
    - title: Dark Mode
      url: ?action=theme
      icon: fas fa-moon
    - title: Destroy Session
      url: ?action=session_destroy
      icon: fas fa-trash-alt
---
```

Sådär, nu har jag tillgång till mina länkar, men jag behöver uppdatera så min sida håller koll på vilken stylesheet den ska ladda in. I min `header.twig`-fil har jag följande länk som laddar in temat:

```html
<link rel="stylesheet" href="{{ theme_url }}/css/style.min.css" type="text/css" />
```

Jag behöver bygga om denna så den laddar in `style.min.css` (eller `style.css`) om jag har det ljusa temat och `style-dark.min.css` (eller `style-dark.css`) om det mörka temat är aktiverat. Jag skriver till en snygg if-sats som kollar det mot sessionen, som jag kan nå med `config.session`:

```html
{% if config.session.theme == "dark" %}
    <link rel="stylesheet" href="{{ theme_url }}/css/style-dark.min.css" type="text/css" />
{% else %}
    <link rel="stylesheet" href="{{ theme_url }}/css/style.min.css" type="text/css" />
{% endif %}
```

Trycker ni nu på länken för att byta tema så borde ni ha en sida utan tema alls. Tryck igen för att få tillbaka ert vanliga tema.



SCSS {#scss}
--------------------------------------

Nu behöver jag fixa mina `.scss` filer så att allt det här fungerar. Jag börjar med att skapa en ny fil i mitt tema, `kmom02/scss/style-dark.scss` som ska ligga till grund för mitt tema. Min `style-dark.scss` får i nuläget vara en kopia på min `style.scss`, utöver att jag lägger in följande regel för att se att det fungerar.

```scss
/* Längst ner i min style-dark.scss */
.main {
    background-color: yellow;
}
```

För slippa behöva köra två kommandon uppdaterar jag mina script i `package.json`. Såhär ser nu hela min script ut:

```json
"scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "lint": "stylelint \"**/*.scss\"",
    "watch": "sass kmom02/scss/style.scss:kmom02/css/style.css kmom02/scss/style-dark.scss:kmom02/css/style-dark.css --no-source-map --watch",
    "watch-min": "sass kmom02/scss/style.scss:kmom02/css/style.min.css kmom02/scss/style-dark.scss:kmom02/css/style-dark.min.css --no-source-map --watch --style compressed",
    "style": "npm run style-light && npm run style-dark",
    "style-min": "npm run style-light-min && npm run style-dark-min",
    "style-dark": "sass kmom02/scss/style-dark.scss kmom02/css/style-dark.css --no-source-map",
    "style-dark-min": "sass kmom02/scss/style-dark.scss kmom02/css/style-dark.min.css --no-source-map --style compressed",
    "style-light": "sass kmom02/scss/style.scss kmom02/css/style.css --no-source-map",
    "style-light-min": "sass kmom02/scss/style.scss kmom02/css/style.min.css --no-source-map --style compressed"
},
```

Jag kan då köra `npm run style` för att bygga både mitt ljusa och mörka tema och jag har även uppdaterat min watch så den kollar båda filerna efter ändringar. Och vi kan köra `npm run style-min` för att bygga de komprimerade `.min.css` filerna. Se till att köra rätt script för att bygga det Stylesheet du har laddat i din `header.twig`.



@use och @forward {#use}
--------------------------------------

Då `@import` börjar närma sig pensionsåldern och har blivit _deprecated_, tittar vi i detta stycke på hur vi kan ersätta `@import` från ovan.

Vi skapar först en `variables`-katalog i vår scss katalog i temat vi vill jobba med, i detta exempel använder jag `kmom02` som tema namn. Jag skapar alltså katalogen `me/portfolio/themes/scss/variables`. I `variables`-katalogen skapar jag två filer `_index.scss` och `_variables.scss`. Jag har i detta exempel filträdet:

```bash
├── blockquotes.scss
├── code.scss
├── container.scss
├── footer.scss
├── gallery.scss
├── header.scss
├── style-dark.scss
├── style.scss
├── tables.scss
├── technology.scss
├── typography.scss
└── variables
    ├── _index.scss
    └── _variables.scss
```

I filen `variables.scss` definierar jag mina variabler och använder nyckelordet `!default` för att i ett senare skede kunna skriva över dessa variabler.

```scss
// themes/kmom02/variables/_variables.scss
$main-background-color: #fff !default;
$main-font-color: #333 !default;
```

I filen använder vi nyckelordet `@forward` för att "vidarebefordra" våra variabler och göra de tillgängliga i andra filer.

```scss
// themes/kmom02/variables/_index.scss
@forward 'variables';
```

Nu kan vi i `style.scss`-filen använda våra variabler genom att ladda in de globalt med hjälp av `as *`.

```scss
// themes/kmom02/style.scss
@use 'variables' as *;

@use 'typography';
@use 'container';

@use 'header';
@use 'footer';

@use 'blockquotes';
@use 'code';

@use 'technology';
@use 'tables';

@use 'gallery';
```

Sedan kan vi i till exempel `typography.scss` använda variablarna genom att även ladda de där.

```scss
// themes/kmom02/typography.scss
@use 'variables' as *;

body {
    line-height: 1.4;
    font-family: "Montserrat", sans-serif;
    color: $main-font-color;
}

p {
    font-size: 1.4em;
    margin-bottom: 1.96rem;
}
```

För att sedan skapa det mörka temat har vi filen `style-dark.scss`. Här börjar vi med att använda konstruktionen `with` för att skriva över våra variabler för det mörka temat.

```scss
// themes/kmom02/style-dark.scss
@use 'variables' as * with (
    $main-background-color: #333,
    $main-font-color: #fff
);

@use 'typography';
@use 'container';

@use 'header';
@use 'footer';

@use 'blockquotes';
@use 'code';

@use 'technology';
@use 'tables';

@use 'gallery';
```

När vi nu kompilerar om våra stylesheet bör vi alltså få olika värden för de två variabler beroende på vilken av de resulterande filerna vi kollar i.



Avslutningsvis {#avslut}
--------------------------------------

Vi har nu möjlighet att köra ett mörkt tema tillsammans med vårt vanliga tema, det känns bra. Hojta till om något är oklart!
