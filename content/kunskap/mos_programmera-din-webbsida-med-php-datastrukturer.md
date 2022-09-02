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



Array numerisk {#arrayn}
---------------------------------

Låt oss titta på hur vi kan använda en array för att konstruera svenska namn på veckodagar och månader. Vi börjar med en array som innehåller namnen på veckodagarna.

```php
$weekday = [
    "Måndag",
    "Tisdag",
    "Onsdag",
    "Torsdag",
    "Fredag",
    "Lördag",
    "Söndag"
];

$dayNumToday = date("N");

$dayToday = $weekday[$dayNumToday - 1];
```

När vi placerar veckodagarna i arrayen så hamnar det första värdet på position 0 och så vidare till det sista värdetsom här hamnar på position 6. Detta är en "numerisk array" då den har nummer som nycklar för att referera en viss position i arrayen.

När vi sedan hämtar värdet på dagen i veckan har det värdet 1 till 7, så vi behöver minska det med ett för att hamna på rätt position i arrayen.

Nu kan vi skriva ut detaljerna om veckodagarna och dagens namn.

```html
<p>Här är en array med veckodagar på position 0 till 6.</p>

<pre><?= print_r($weekday, true) ?></pre>

<p>Idag är det veckodag: '<?= $dayToday ?>' (veckodag nummer <?= $dayNumToday ?>).</p>
```

Vi kan göra ett liknande exempel med månadens dagar. Här gör vi lite annorlunda och väljer att först definiera en tom array och sedan stoppar vi in första månaden på position 1. Resterande månader får första tillgängliga positionen, det vill säga 2, 3, 4 och så vidare upp till 12.

```php
$monthName = [];
$monthName[1] = "Januari";
$monthName[] = "Februari";
$monthName[] = "Mars";
$monthName[] = "April";
$monthName[] = "Maj";
$monthName[] = "Juni";
$monthName[] = "Juli";
$monthName[] = "Augusti";
$monthName[] = "September";
$monthName[] = "Oktober";
$monthName[] = "November";
$monthName[] = "December";

$monthNames = implode(", ", $monthName);

$monthNumToday = date("n");

$monthToday = $monthName[$monthNumToday];
```

Eftersom vi nu har "preppat" och förberett arrayen lite bättre så slipper vi att minska med ett när vi hämtar ut värdet. Konstruktionen `date("n")` ger oss månadernas värde som 1 till 12.

Man kan spara en del kodande om man "preppar sina datastrukturer" så att det är lätt att hantera värdena i dem. Vad som är en bra struktur får man tänka på från fall till fall.

Funktionen `implode()` skriver ut alla värden i en array i en sträng. Det finns en annan funktion `explode()` som gör tvärtom, den delar en sträng i delar och placerar delarna i en array.

Nu kan vi skriva ut detaljer om arrayen och månadens namn.

```html
<p>Vi har en array med månadernas namn, vi kan använda "implode()" på den för att skriva ut den som en sträng.</p>

<p><?= $monthNames ?>.</p>

<p>Idag är det månad: '<?= $monthToday ?>' (månadens nummer <?= $monthNumToday ?>).</p>
```

När vi är klara med denna övningen kan vår sida se ut så här.

[FIGURE src=image/webtec/phpstruct/array_date.png?w=w3 caption="Namn på veckodag och månad med hjälp av en numerisk array."]

På detta sättet kan vi skapa en struktur för att jobba med anpassade svenska namn på veckodagar och datum.



Array key/value {#arraykv}
---------------------------------

En annan variant på arrayen är en så kallad key-value array (nyckel - värde). Det är samma array i grund och botten, men man väljer att ge värdet en strängnyckel, istället för en numerisk position.

Om vi tänker att vi skall bygga ett galleri och visa bilder och vi har sparat alla bilder i en array där nyckeln är bildens namn och värdet är sökvägen till filen, då kan en sådan array se ut så här.

```php
$paintings = [
    "Jean-Léon Gérôme" => "img/The_leap_of_Marcus_Curtius_(1850-55),_by_Jean-Léon_Gérôme.jpg",
    "Justus Sustermans" => "img/BMVB1452-Justus_Sustermans-La_familia_de_Darius_davant_Alexandre_el_Gran.jpeg",
    "Matthias Laurenz Gräff" => "img/Matthias_Laurenz_Gräff,__Traum_Österreich_-_Vorstellung_und_Wirklichkeit_.jpg",
    "Sebastiano Ricci" => "img/Sebastiano_Ricci_-_A_Recusa_de_Arquimedes.jpg",
];

$paintings["Niels Simonsen"] = "img/Episoden_af_Træfning_ved_Sankelmark,_den_6._Februar.jpg";
$paintings["Gustave Moreau"] = "img/Moreau_-_Thomyris_et_Cyrus,_Inv._13978.jpg";
```



```html
<h2>Key/value array: Gissa artisten</h2>

<p>Här är ett galleri med historiska målningar. Försök gissa vilken konstnär eller 
    målning det är. När du håller musen över bilden så framträder svaret.</p>

<div class="gallery">
<?php foreach ($paintings as $key => $value) : ?>
    <img src="<?= $value ?>" title="<?= $key . " " . $value ?>" alt="<?= $value ?>">
<?php endforeach; ?>
</div>
```

Läs innehåll från fil, tex redovisa sidan

Finns markdown via allt i en fil?

galleri

(next/prev)



Array i en array {#array2}
---------------------------------



Loopa arrayens innehåll med foreach {#foreach}
---------------------------------



Datastrukturer {#datastrukturerallmant}
---------------------------------

Allmänt om datastrukturer.
Koppla snygg kod.




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
