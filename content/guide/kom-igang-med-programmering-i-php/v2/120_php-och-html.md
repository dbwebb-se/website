---
author: mos
revision:
    "2018-06-19": "(B, mos) Genomgången och uppdaterad."
    "2018-03-13": "(A, mos) Första versionen, uppdelad av större dokument."
...
PHP och HTML
=======================

Låt oss titta på hur PHP och HTML förhåller sig till varandra. Vi gör ett exempel och bygger en vanlig html-sida som vi sedan gör om till en dynamisk php-sida. Det ger oss en känsla av skillnaden mellan dem.



Först en vanlig html-sida {#html-mall}
-----------------------

Vi börjar med en html-sida som skriver ut ett enkelt meddelande.

Ta koden nedan och lägg i en fil `hello.html`.

```html
<!doctype html>
<html lang="en"> 
<head>
<meta charset="utf-8"/>
<title>A web page | Hello</title>
</head>
<body>
<h1>A web page</h1>
<p>Hello World!</p>
<hr>
<a href="http://validator.w3.org/unicorn/check?ucn_uri=referer&amp;ucn_task=conformance">Unicorn</a>
</body>
</html>
```

Öppna filen i din webbläsare (via din webbserver). Det kan se ut så här.

[FIGURE src=image/snapht18/webpage.png?w=w3 caption="En vanlig webbsida i ren HTML."]

Kontrollera gärna att din sida validerar i Unicorn (men du behöver publicera den på en publik webbplats först, till exempel via `dbwebb publish`).



Visa sidans källkod {#view-source}
-----------------------

Du har nu din fil `hello.html` som ligger på en plats där din webbserver når den.

När du refererar den filen, via en länk i din webbläsare, till exempel `http://localhost/hello.html`, så hämtas hela filen och läses in i webbläsaren som tolkar html-strukturen och bygger upp en sida som visas i webbläsaren.

Du kan se webbläsarens version av källkoden genom att föra muspekaren till webbläsaren och högerklicka och välja "View Page Source" (visa källkod). Då får du fram den källkod som webbläsaren har hämtat från webbservern.

[FIGURE src=image/snapht18/webpage-source.png?w=w3 caption="Källkoden till webbsidan, så som webbläsaren känner igen den."]

Det är detta som är källkoden ur webbläsarens perspektiv. När vi nu börjar jobba med php så måste vi skilja på hur källkoden ser ut på serversidan och hur den ser ut i webbläsaren. Det är två skilda saker och vid felsökning så har man nytta av båda varianterna.



Nu en php-sida {#php-mall}
-----------------------

Ta nu en kopia av filen `hello.html` och döp den till `hello.php`. Ändra i titeln så att du ser att det är din php-sida. Jag lähher till ordet "PHP". Öppna den sedan i din webbläsare, precis som du gjorde innan.

[FIGURE src=image/snapht18/webpage-php.png?w=w3 caption="Nu hanteras webbsidan som en php-sida och webbservern processar den med hjälp av PHP."]

Skillnaden mellan `hello.html` och `hello.php` är att sidan som slutar på ändelsen `.php` körs genom php's preprocessor. När preprocessorn hittar php-taggar, det vill säga `<?php` (starttag) och `?>` (sluttag), så tolkas detta som php-kod och exekveras. Allt som man då skriver ut i sin php-kod hamnar i den slutliga html-koden och skickas till webbläsaren.

Vår sida `hello.php` är fortfarande statisk och det finns ingen dynamisk php-kod i sidan.



Lägg till php-kod {#php-kod}
-----------------------

Vi lägger nu till en php-konstruktion i sidan. Vi tar en konstruktion som skriver ut texten "Hello my PHP-World" inom en html-paragraf.

```php
<p>
<?php echo "Hello my PHP-World"; ?>
</p>
```

Resultatet kan se ut så här.

[FIGURE src=image/snapht18/webpage-php1.png?w=w3 caption="En php-konstruktion skriver ut ett textstycke."]

Du kan studera sidans källkod i webbläsaren så ser du att php-konstruktionen ovan har ersatts med följande.

```php
<p>
Hello my PHP-World</p>
```

Det som låg inom starttaggen `<?php` och sluttagen `?>` har alltså processats som php-kod och resultatet, textsträngen som skrevs ut, blir kvar som en del av html-sidans källkod.

Här grunden för att omsluta den koden som processas som php-kod.

```php
<?php
// PHP starttag, efter denna så kommer PHPkod.
// Här skriver man sin PHP-kod.
// Nu kommer PHP sluttag.
?>
```

Nu har vi grunderna till ett testprogram för PHP. Då går vi vidare.
