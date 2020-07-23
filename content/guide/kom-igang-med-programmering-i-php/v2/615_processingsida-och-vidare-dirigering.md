---
author: mos
revision:
    "2018-09-07": "(A, mos) Första versionen."
...
Processingsida och vidare dirigering
=======================

Vi har gått igenom grunderna i formulärhantering. När man senare blir mer avancerad och skriver formulär som postas och skall uppdatera en databas så brukar man använda metoden POST och då krävs att man använder en processingsida som gör en vidare dirigering, en _redirect_, till en resultatsida.

Låt oss kika på vad det konceptet innebär.



Varning vid ompostning av formulär {#ompost}
------------------------------

Låt oss först ta problematiken som uppträder när man försöker ladda om en sida dit man nyss postat ett formulär via metoden post.

Du kan själv testa via exempelprogrammet `example/guide-php/06/post-self.php`.

Börja med att posta formuläret och tgör sedan en omladdning, reload av webbsidan.

Resultatet blir så här, en varningsruta kommer upp.

[FIGURE src=image/snapht18/post-reload.png?w=w3 caption="Varningsruta kommer upp som varnar att formuläret kommer att postas igen."]

Eftersom post-formuläret skickar sin data i http-protokollets body, så behöver hela http-request skickas en gång till så att webbserver kan rendera ett nytt resultat. Ofta är det inget konstigt i det och kan man lugnt klicka "Resend". Men som programmerare vill man inte att ens användare skall se den typen av varningar så man väljer att strukturera koden så att liknande varningar undviks.

Lösningen är en processingsida som processar svaret och sedan skickar vidare till en resultatsida.



En processingsida {#processing}
-----------------------------

En processingsida är vårt namn på en sida vars ansvar är att ta hand om ett postat formulär och sedan skickar vidare till en annan sida som visar resultatet. Sidan som visar resultatet kan vara den ursprungliga sidan, eller en tredje sida.

Du kan själv testa via exempelprogrammet `example/guide-php/06/post.php`.

Låt oss se hur processingsidan ser ut, det handlar här om att dela upp den ursprungliga sidan som postar till sig själv, i två delar.

Sidan `post.php` innehåller nu endast formuläret och postar svaret till sidan `post-process.php`.

Här är grunden i sidan `post.php`.

```html
<!doctype html>
<meta charset="utf-8">
<title>POST form to processing page</title>
<form method="post" action="post-process.php">
    <fieldset>
        <label>POST form to processing page</label>
        <p>
            <label for="title">Title:</label>
            <input id="title" type="text" name="title" value="<?= htmlentities($_POST["title"] ?? null) ?>">
        </p>
        <p>
            <input type="submit" name="create" value="Create">
            <input type="reset" value="Reset">
        </p>
    </fieldset>
</form>
```

Sidan `post-process.php` innehåller nu den delen som tar emot och bearbetar svaret från det postade formuläret.

```html
<?php if ($_POST["create"] ?? false) : ?>
<output>
    <p>This is the content of the posted form.</p>
    <pre>
        <?= var_dump($_POST) ?>
    </pre>
</output>
<?php endif; ?>
```

Att enbart lägga till en processingsida löser dock inte problematiken med reload. Man får fortfarande varningen om man försöker ladda om sidan som visar resultatet.

[FIGURE src=image/snapht18/post-reload-processing.png?w=w3 caption="Man får fortfarande problem vid omladdning av processingsidan."]

Vi behöver lägga till en redirect, en omdirigering, i slutet av processingsidan. Det löser problemet.



Omdirigering till resultatsida {#resultatsida}
-----------------------------

En omdirigering handlar om att processingsidan inte har till ansvar att visa en komplett html-sida. Dess ansvar är enbart att processa formuläret och sedan skicka vidare till en annan sida som visar upp en html-sida.

Vi tar ett exempel. Vi tar en likadan formulärsida i `post-updated.php`, som postar till den uppdaterade processingsidan `post-process-redirect.php`.

I den nya `post-process-redirect.php` så simulerar vi att vi lagrar information i databasen och sedan gör vi en redirect via php-metoden [`header()`](http://fi2.php.net/manual/en/function.header.php).

```php
/**
 * A processing page that does a redirect.
 */
if ($_POST["create"] ?? false) {
    // Do some processing of the form data
    // for example write to the database.
}

// Redirect to a result page.
$url = "post-result.php";
header("Location: $url");
```

Tänk på att processingsidan är en sidkontroller i sig. Den kan behöva tillgång till samma miljö som en vanlig sidkontroller vilket kan inkludera att göra include på filer som `config.php` och `src/functions.php`.

Speciellt viktigt är det att sessionen startas även i en processingsida, om man använder sessioner. Men om man startar sessionen på en plats, till exempel i en `config.php`, så löser det sig. Vi har inte riktigt pratat om vad sessionen är, men det kommer i nästa kapitel.

Om man kör exempelprogrammet så ser man nu två sidor, först formulärsidan.

[FIGURE src=image/snapht18/redirect-form.png?w=w3 caption="Formulärsidan som kommer posta till processingsidan."]

När man submittar (postar) formuläret så är nästa steg man ser resutatsidan.

[FIGURE src=image/snapht18/redirect-result.png?w=w3 caption="Resultatsidan som tackar, processingsidan visas aldrig för användaren."]

Vi ser aldrig processingsidan, den händer i bakgrunden och visar inget synligt resultat till webbläsaren.

Vill man debugga en processingsida som gör en redirect så kan man först och främst kommentera bort raden för redirecten, sedan kan man göra echo och var_dump som vanligt för att skriva ut saker eller bara för att se eventuella felmeddelanden. Resultatet blir att processingsidan blir som en vanlig sidkontroller som visar en webbsida.



Säkerhet vid uppdateringar av webbplatsens innehåll {#sec}
-----------------------------

När man uppdaterar innehåll i en webbplats databas, så skall man alltid använda POST som formulär-metod.

GET-metoden innebär att webbläsaren kan cacha sidorna vilket kan göra att det dynamiska resultatet inte visas. Det som visas är av webbläsaren cachat resultat och man får lurigheter med att veta vad som är verkligt och vad som är cachat resultat.

En GET-länk kan laddas om när som helst av användaren (eller en annan användare) och då kan varje omladdning innebära att ny data skickas till databasen. Ett sådant förfarande öppnar upp säkerhetshål. Tänk om någon kunde få dig att klicka en en GET-länk som flyttar pengar från ditt bankkonto. Om man inte använder POST för viktiga uppdateringar så kan det bli  farligt om ens webbplats är öppen för [Cross-site scripting (XSS)](https://www.owasp.org/index.php/Cross-site_Scripting_(XSS)).

Vi gör det enkelt för oss och säger att alla uppdateringar av data på en webbplats skall göras med POST.

En annan säkerhetsrelaterad konstruktion när det gäller formulär är [Cross-Site Request Forgery (CSRF)](https://www.owasp.org/index.php/Cross-Site_Request_Forgery_(CSRF)). Här handlar det om att säkerställa att det formuläret som är postat också initialt utgår från ens egen webbplatsen. Man vill inte att en extern part sätter upp ett formulär och postar till din webbplats.

Enkelt sagt så handlar det om en lösning att lägga en identitet i varje formulär man skapar. Till exempel ett dolt fält.

```html
<input type="hidden" name="csrf" value="hemlig-nyckel-för-varje-formulär">
```

När sedan användaren postar formuläret så kräver man att den delen finns med och man kontrollerar mot sin databas eller mot sessionen att värdet stämmer för just denna användaren. Det höjer säkerheten och gör det svårare för en angripare att posta dumma saker till din webbplats.
