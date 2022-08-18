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



Datastrukturer {#datastrukturerallmant}
---------------------------------

Allmänt om datastrukturer.
Koppla snygg kod.



Array {#array}
---------------------------------

foreach



Array numerisk {#arrayn}
---------------------------------

galleri

(next/prev)



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
