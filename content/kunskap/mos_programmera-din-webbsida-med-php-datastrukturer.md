---
author: mos
category:
    - webbprogrammering
    - html
    - css
    - php
    - kurs webtec
revision:
    "2022-08-18": "(A, mos) Första utgåvan inför webtec-v2."
...
Programmera din webbsida med PHP datastrukturer
==================================

[FIGURE src=image/webtec/programmera/html_form_2.png?w=c5 class="right" caption="Programmera webbsidan med PHP."]

Vi skall gå igenom datastrukturen array i PHP och titta på numeriska arrayer och på key/value arrayer. Vi tittar vidare på hur arrayer används som PHP super globals, ett antal globala arrayer som innehåller detaljer om den request som finns när webbsidan anropas.

Vi kikar på HTML formulär med metoden POST och ser hur formulär kan posta information till en webbsida.

Vi tittar på hur SESSION kan användas för att spara information mellan sidanrop och vi bygger ett embryo till en inloggningsfunktion till en webbplats med hjälp av formulär och sessionen.

Vi kikar också kort på hur PHP funktioner kan hjälpa oss att strukturera vår kod på ett bättre sätt.

<!--more-->



Förutsättningar {#pre}
---------------------------------

Du har installerat en labbmiljö likt den som beskrivs i dokumentet om [labbmiljö för kursen webtec](kurser/webtec-v2/installera-labbmiljo). Det innefattar bland annat en webbserver med stöd för PHP.

Du har jobbat igenom kmom03 i kursen webtec och du är bevandrar i det sätt som används för att skapa webbsidor med PHP där du har en katalogstruktur.

Du har jobbat igenom kmom03 och du har en motsvarande webbplats som du kan bygga vidare på.

Du har bekantat dig med begreppen PHP arrayer och PHP funktioner via föreläsningar eller annat liknande översiktligt material.

Du kan hitta koden som används i denna artikel, i ditt kursrepo under `example/me/kmom04`, använd den som referens om du fastnar.



<!--
Översikt av artikeln {#video}
---------------------------------

Det finns en videoserie som visar hur jag själv jobbar igenom artikeln. Du kan titta igenom videoserien samtidigt som du själv jobbar igenom artikeln.

Du hittar spellistan för videoserien under "[Skapa en webbsida med HTML, CSS och PHP](https://www.youtube.com/playlist?list=PLKtP9l5q3ce8WodX3eGvV1CO8wQEuI85C)".

[YOUTUBE src="XXX" list="PLKtP9l5q3ce8WodX3eGvV1CO8wQEuI85C" width=700 caption="Videoserie som ger dig en översikt och genomgång av artikeln."]
-->



Skriv egen kod {#skrivkod}
---------------------------------

När du jobbar igenom denna artikeln så är tanken att du skriver din egen kod utifrån de exempel som finns. De första exemplen är enklare och de kan du skriva av för att komma igång, längre ned i artikeln får du möjlighet att skriva egen kod, men du kommer också se lösningen på uppgiften.

Det är också bättre att skriva av koden och inte kopiera. Det gör att du tränar upp dig på att skriva koden och du får troligen med ett par fel som du kommer tvingas felsöka.



Sidkontroller och vyer för testprogram {#sidkontroller}
---------------------------------

Vi bygger vidare på den webbplatsen vi har och skapar en ny sidkontroller i filen `public/datastructure.php` där vi kan träna på att programmera PHP-kod och generera webbsidor.

Innehållet i `datastructure.php` bygger du upp liknande filen `play.php` som du har jobbat med tidigare.

Så här ser min fil ut.

```html
<?php
include('../config/config.php');

$title = 'PHP datastrukturer';

include('../view/header.php');
?>

<main class="main">
    <h1><?= $title ?></h1>

    <p>Exempelprogram för att prova PHP datastrukturer och hur de används för 
        att bygga webbplatser.</p>

    <?php include('../view/php/array.php') ?>
</main>

<?php include('../view/footer.php') ?>
```

Det kan se ut så här när det är klart.

[FIGURE src=image/webtec/phpstruct/start.png?w=w3 caption="Då är vi redo att börja koda."]

Då är vi redo att börja skriva exempelkoden i vår första vy-filen `view/php/array.php`.



Array {#array}
---------------------------------

Du hittar information om [datatypen array i manualen](https://www.php.net/manual/en/book.array.php), se till att ha den vid din sida.

Vi börjar med att skapa en array som innehåller detaljer om "mikael". Så här kan vi skapa arrayen med hjälp av konstruktionen `[]` samt spara alltihop i variabeln `$mikael`.

Vi kan skriva allt på en rad men det kan vara tydligare att skriva på flera rader.

```php
$mikael = [
    "Mikael",
    "Roos",
    1968,
    "Teacher",
    78.2
];
```

I en array kan man spara värden av olika datatyper. Det går att lägga till hur mycket detaljer man vill.

För att skriva ut innehållet i en array så kan man använda någon av de inbyggda funktionerna [print_r](https://www.php.net/manual/en/function.print-r.php) eller [var_dump](https://www.php.net/manual/en/function.var-dump.php). Båda dumpar innehållet i arrayen och var_dump visar även vilken upplevd typ som värdet har.

Det kan se ut så här i din vy.

```html
<h2>Array som datastrukturer</h2>

<p>Låt oss testa att använda en array.</p>

<pre><?= print_r($mikael, true) ?></pre>

<pre><?= var_dump($mikael) ?></pre>
```

När innehållet i arrayen skrivs ut så visas också på vilken position värdet ligger. Alla värden i arrayen ligger på en position. Första värdet hamnar på position 0 och sedan ökar det med ett per position. I arrayen ovan, som har 5 värden så stämmer alltså följande.

```php
$mikael[0] === "Mikael";
$mikael[4] === 78.2;
```

En array kan alltså vara en "kontainer" för olika värden. Det är en variabel som innehåller flera olika värden, varje position i variabeln har ett värde.

Vi kan räkna ut hur många värden som finns i en array med funktionen [count](https://www.php.net/manual/en/function.count.php).

```php
$items = count($mikael);
```

Om vi är osäkra på om en position i arrayen har ett värde så kan vi kontrollera det med funktionen [array_key_exists](https://www.php.net/manual/en/function.array-key-exists.php).

```php
array_key_exists($mikael[0]);

array_key_exists($mikael[10]);
```

Det finns många [inbyggda funktioner som kan hjälpa oss att jobba med arrayer](https://www.php.net/manual/en/ref.array.php), kika snabbt och översiktligt på dem.

Försök nu bygga en vy som testar din array, det kan se ut så här när du är klar.

[FIGURE src=image/webtec/phpstruct/array.png?w=w3 caption="Utskriften från när vi leker runt med en array."]

Ett litet PS är att det inte är lätt att skriva ut värder "TRUE" eller "FALSE" när man skriver ut en boolsk variabel i PHP. Man kan behöva konvertera det värdet till en sträng, annars får man '1' och '' (ingenting). Men du ser i min utskrift ovan att jag har löst det och skriver ut en representation av de boolska värdena.



Loopa arrayens innehåll med foreach {#foreach}
---------------------------------



Datastrukturer {#datastrukturerallmant}
---------------------------------

Allmänt om datastrukturer.
Koppla snygg kod.




Array numerisk {#arrayn}
---------------------------------

galleri

(next/prev)

datum på svenska, månad och dag på svenska via array?



Array key/value {#arraykv}
---------------------------------

Läs innehåll från fil, tex redovisa sidan

Finns markdown via allt i en fil?



HTML form med POST {#post}
---------------------------------

* Bygg formulär. (som övning?)
https://jonkopingenergi.se/privat/fiber/serviceavgift (använd även till databasen)


HTML form med POST och processingsida {#postproc}
---------------------------------


Formulär för inloggning {#loginform}
---------------------------------


Funktioner {#funktion}
---------------------------------

Kontrollera om användaren har skrivit in rätt användare/lösen.


Sessioner med SESSION {#session}
---------------------------------

+1

Gissa mitt nummer


Inloggad användare med SESSION {#loginsession}
---------------------------------



Kontrollera om användaren är inloggad eller ej {#logincheck}
---------------------------------

Funk för att kolla om användaren är inloggad



Navbaren med länkar för inloggning {#logincheck}
---------------------------------

Funk för att kolla om användaren är inloggad







Avslutningsvis {#avslutning}
--------------------------------------

Nu hoppas jag att du har kommit igång med grunderna i PHP och att du har en struktur som du kan följa för att skapa fler dynamiska PHP-sidor.

Glöm inte bort att "problemlösa" innan du sätter igång att programmera, så att du iallafall har en grov plan.

Glöm heller inte bort att det är bra att skapa små testprogram när man lär sig nya saker.

Använd echo och var_dump eller liknande för att skriva ut innehållet i en variabel, det underlättar när man felsöker.

Nu kan du behöver programmera lite på egen hand för att se om det du lärt dig har fastnat.
