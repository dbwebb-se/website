---
author: mos
category:
    - webbprogrammering
    - html
    - css
    - php
    - kurs webtec
revision:
    "2022-09-04": "(B, mos) Lade till stycke om funktioner."
    "2022-09-03": "(A, mos) Första utgåvan inför webtec-v2."
...
Programmera din webbsida med PHP datastrukturer
==================================

[FIGURE src=image/webtec/phpstruct/flash_success.png?w=c5 class="right" caption="Flashmeddelanden med session och ett HTML formulär med POST."]

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
array_key_exists(0, $mikael);

array_key_exists(10, $mikael);
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



Loopa arrayens innehåll med foreach {#foreach}
---------------------------------

I övningen ovan såg vi hur man kunde skriva ut innehållet i en array med implode som en variant att sätta ihop alla element i en array och sammanfoga dem med en sträng mellan dem.

Vi nämnde också att explode gjorde det omvända, det tog en sträng och delade upp den i delar och varje del placerades i en array.

Det går att använda loopar som if och while för att loopa igenom alla elementen i en numerisk array, man använder en variabel som man inkrementerar. Det förenklar möjligen om man vet på vilka positioner som man vill hämta värdena.

Det finns också en loop-konstruktion som heter [foreach](https://www.php.net/manual/en/control-structures.foreach.php) som kan användas för att loopa igenom alla elementen i en array, oavsett vilken position de ligger på. Med foreach kan man både plocka fram värdet och dess nyckel.

Så här ser de två varianterna ut när man använder foreach.

```php
$days = ["Måndag", "Tisdag", "Onsdag"];

// Only use the value
// Måndag, Tisdag, Onsdag, 
foreach ($days as $value) {
    echo "$value, ";
}

// Use both value and key
// Måndag (0), Tisdag (1), Onsdag (2), 
foreach ($days as $key => $value) {
    echo "$value ($key), ";
}
```

Då har du grunden i en foreach-loop.

Låt oss nu göra en liten programmeringsutmaning där problemet är följande.

> "Mumintrollet bor i det blå huset."

UTMANING. Skapa en variabel av texten ovan, använd explode för att splitta texten per mellanslag och placera orden i en array. Använd sedan en strängfunktion för att leta reda på hur många tecken varje ord innehåller. Skriv ut ordet, dess längd och dess position i texten, allt med hjälp av en foreach-loop.

Så här ser det ut i min webbsida när jag löste problemet.

[FIGURE src=image/webtec/phpstruct/foreach.png?w=w3 caption="En text som blivit uppdelad i beståndsdelar med hjälp av explode, en array och foreach."]

Som du kan se så räknar mitt exempel med punkten som en bokstav, det är inte helt rätt. Men hur kan man tänka om man skall försöka lösa det? Fundera en stund och se om du kan hitta en lösning, annars kan du sova på det.

Om du tyckte utmaningen var svår så kommer här min lösning på det.

```php
$text = "Mumintrollet bor i det blå huset.";
$words = explode(" ", $text);

$result = "<ul>\n";
foreach ($words as $position => $word) {
    $len = strlen($word);
    $result .= "<li>'$word' med $len bokstäver på position $position.</li>\n";
}
$result .= "</ul>\n";
```

Jag placerade texten i en variabel och använde explode för att splitta den på " " och alla orden hamnade i en array.

Sedan tog jag arrayen och använde foreach för att loopa igenom den. För varje ord tog jag reda på hur långt det var och sedan skrev jag ut ordet, dess längd och dess position i arrayen vilken är densamma som i texten (eventuellt med + 1 så jag inte börjar på noll).

Utskriften är nog relativt enkel, i mitt fall handlar det om två variabler.

```html
<h2>Foreach</h2>

<p>Här kommer texten uppdelad i dess beståndsdelar.</p>

<blockquote>"<?= $text ?>"</blockquote>

<?= $result ?>
```

Konstruktionen foreach är mycket användbar när man jobbar med arrayer.



Array associativ (key/value) {#arraykv}
---------------------------------

En variant på arrayen är en så kallad key-value array (nyckel - värde). Det är samma array i grund och botten, men man väljer att ge värdet en strängnyckel istället för en numerisk position. När man använder strängnycklar kallas det även för associativ array.

Principen för syntaxen är `$myArray = ["key" => value, "key2" => value2]` där nycklarna är strängvärden.

Låt oss göra en övning. Om vi tänker att vi skall bygga ett galleri och visa bilder och vi har sparat alla bilder i en array där nyckeln är bildens namn och värdet är sökvägen till filen, då kan en sådan array se ut så här.

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

I koden ovan skapar jag först en array med 4 key/value par. I varje par är det konstnärens namn som är nyckeln och värdet är sökvägen till bildfilen som innehåller tavlan.

De två sista raderna visar hur jag kan lägga till ytterligare två konstnärer som nycklar och tilldela dem var sitt värde.

Nu använder jag en foreach-loop med den alternativa syntaxen och skriver ut värdena från arrayen till html-sidan och försöker få det att se ut som ett galleri. Jag förbereder för att styla genom att lägga till en css-klass `gallery`.

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

Jag valde att döpa variablerna enligt `($paintings as $key => $value)`, det blir ju tydligt. Men jag kunde lika gärna valt att döpa dem till `($paintings as $artist => $imgPath)`, välj det som du anser blir mest tydligt och gör din kod mest läsbar.

Så här kan det se ut när det skrivs ut i webbsidan.

[FIGURE src=image/webtec/phpstruct/array_gallery.png?w=w3 caption="Ett galleri av konst med hjälp av en key/value array som datastruktur."]

Då har vi tränat på en key/value array.



Tankar om datastrukturen array {#array2}
---------------------------------

I grund och botten är alltså arrayen en och samma konstruktion. Den tillåter oss att använda antingen numeriska värden på en "key" (numerisk array) eller så använder vi ett strängvärde (associativ array).

Det är upp till oss att välja om vi vill använda en numerisk array eller en key/value array. Troligen beror det av sammanhanget och vilken data vi vill hantera och vilken struktur som lämpar sig bäst beroende av hur man vill använda datat.

Det finns inget som hindrar att man blandar numeriska nycklar och strängnycklar i en och samma array, det ser kanske inte så logiskt ut att göra det, men det är bra att veta om att man kan göra det.

Som ett värde i en array kan man ha vilken typ av värde som helst. Det kan vara enkla värden som int, sträng, double eller boolean. Man kan även ha mer komplexa datastrukturer och placera en array i en array. Fundera på följande struktur om den är läsbar och tydlig.

```php
$mikael = [
    "name" => "Mikael",
    "acronym" => "mos",
    "age" => 42
];

$marie = [
    "name" => "Marie",
    "acronym" => "mgr",
    "age" => 42
]

$teacherTeam = [$mikael, $marie];
```

Ovan har vi nu en array `$teacherTeam` som har två värden som båda är arrayer. Så här kan man nu accessa värdena i dessa arrayer.

```php
// Outputs "Mikael"
echo $teacherTeam[0]["name"];

// Outputs "Marie"
echo $teacherTeam[1]["name"];
```

Se om du kan göra ett enkelt exempelprogram av ovan, bara för att se att du kan hantera en array i en array.



Datastrukturer rent allmänt {#datastrukturerallmant}
---------------------------------

När man börjar lära sig om programmering så är man rätt upptagen med hur programmeringskoden fungerar och dess grundläggande konstruktioner. Men, när man blir mer erfaren är det troligare att du blir alltmer intresserad av hur du strukturerar din data i datastrukturer.

Det finns ett par kända talesätt om detta, här följer två av dem.

Eric Raymond, i skriften "The Cathedral and the Bazaar" om programvaruutveckling. Läs mer om detta i artikeln "[Objects have not failed](https://dreamsongs.com/ObjectsHaveNotFailedNarr.html)".

> "Show me your code and conceal your data structures, and I shall continue to be mystified. Show me your data structures, and I won't usually need your code; it'll be obvious."

Linus Torvalds har sagt följande.

> "Bad programmers worry about the code. Good programmers worry about data structures and their relationships."

Egentligen sa Linus även följande, som visar mer hur han tänkte.

> "...git actually has a simple design, with stable and reasonably well-documented data structures. In fact, I'm a huge proponent of designing your code around the data, rather than the other way around, and I think it's one of the reasons git has been fairly successful […] I will, in fact, claim that the difference between a bad programmer and a good one is whether he considers his code or his data structures more important."

I båda fallen pratar de om vikten av att strukturera sina datastrukturer så att de är lätta att komma åt, uppdatera och skapa. har man tänkt till lite extra när man gör sina datastrukturer så faller sig programmeringskoden mycket enklare.

Om man sitter med en kodbas och tycker att datastrukturena verkar jobbiga och leder till en massa extra kod, då kan det vara en signal om att man borde strukturera om sina datastrukturer.

Men, men, ovan resonemang är alltså mer relevant ju mer erfarenhet man har.



HTML formulär med POST {#post}
---------------------------------

Arrayer används när man postar ett formulär till en webbsida så låt oss nu byta ämne och titta på hur man kan jobba med HTML formulär och POST.

Vi har tidigare tittat på ett GET formulär och nu skall vi se skillnaden till ett POST formulär. I GET-formuläret postades all data som en del av querysträngen, men i POST så skickas all forumlärdata som en del i HTTP-bodyn och det är inte lika synligt som i fallet med GET.

Tanken är att vi nu bygger ett enklare HTML formulär och använder det som ett POST formulär vilket i princip innebär att vi startar formuläret så här.

```php
<form method="post">
```

Eftersom det är POST så kommer vi också att posta formuläret till en ny sida, vi kan kalla den processingsida. En processingsida har som ansvar att ta emot data från det postade formuläret och kontrollera att det som postats är rimligt och därefter hantera det. Vad "hantera" innebär skiljer från fall till fall, en kanske vill du spara informationen i en databas eller liknande.

Så här anger vi att formuläret skall postas till en processingsida.

```php
<form method="post" action="form_process.php">
```

Låt oss ta oss igenom exemplet steg för steg.

Först skapar vi ett formulär, det kan se ut så här när det är klart, inklusive lite styling.

[FIGURE src=image/webtec/phpstruct/form_post.png?w=w3 caption="Ett formulär som det kan se ut i en webbsida."]

Själva html-koden för formuläret kan se ut så här, det spelar inte så stor roll för exemplet.

```html
<form method="post" action="form_process.php">
    <fieldset>
        <legend>Anmäl dig!</legend>

        <p>
            <label>Namn:<br>
                <input type="text" name="name" placeholder="Skriv in ditt namn...">
            </label>
        </p>

        <p>
            <label>Adress:<br>
                <textarea name="address" placeholder="Skriv in din adress..."></textarea>
            </label>
        </p>

        <p>
            <label>
                Jag samtycker till allt, på heder och samvete.
                <input type="checkbox" name="check">
            </label>
        </p>

        <p>
            <input type="submit" value="Skicka" name="doit">
            <input type="reset" value="Rensa">
        </p>
    </fieldset>
</form>
```

Vi behöver nu skapa processingsidan och det kan du jämföra med en vanlig sidkontroller, iallafall till att börja med.

För att visa hur en processingsida fungerar så börjar jag med att skapa en så här. Notera att jag utelämnar header och footer. Det är med mening.

```php
<?php
include('../config/config.php');

// Get incoming values from posted form
$name     = $_POST["name"] ?? "";
$address  = $_POST["address"] ?? "";
$checkbox = $_POST["check"] ?? false;

$success = $name && $address && $checkbox;
```

Jag hämtar varje fält för sig från variabeln `$_POST`. Dessutom säger jag att alla delar av formuläret måste ha ett fält ifyllt om jag skall betrakta det som ett komplett ifyllt formulär.

När det är klart kan jag välja vad jag vill göra med formulärets data. I mitt exempel vill jag visa hur det kan fungera så jag väljer att skriva ut resultatet med html-kod.

```html
<h1>Form submission service</h1>

<p>Thank you for the submitted form! I got the following data from you!</p>

<?php if ($name) : ?>
    <p>Name:<br><?= htmlentities($name) ?></p>
<?php else: ?>
    <p>You did NOT enter your name!</p>
<?php endif; ?>

<?php if ($address) : ?>
    <p>Address:<br><?= htmlentities($address) ?></p>
<?php else: ?>
    <p>You did NOT enter your address!</p>
<?php endif; ?>

<?php if ($checkbox) : ?>
    <p>You DID check the terms. Nice, all terms apply!</p>
<?php else: ?>
    <p>You did NOT check the terms. Why is that? Try once more!</p>
<?php endif; ?>

<?php if ($success) : ?>
    <p>Success! All parts of the form are valid! You may proceed!</p>
<?php else: ?>
    <p>You failed to fill in some parts of your form, try once more!</p>
<?php endif; ?>
```

Om du kikar igenom koden så ser du ett antal if-satser som skriver ut värdena från det postade formuläret, förutsatt att användaren skrev in något i formuläret. Annars skrivs ett felmeddelande ut.

Du kan också notera att jag använder funktionen `htmlentities()` för att förhindra att användaren skickar in skadliga konstruktioner som jag skriver ut i webbsidan. Det är ett sätt att öka säkerheten och förhindra att en utomstående kan injecta potentiellt skadlig kod till din webbsida.

Då provar vi formuläret. Först fyller vi i formuläret men vi utelämnar någon del.

[FIGURE src=image/webtec/phpstruct/form_not_complete.png?w=w3 caption="Vi 'glömde' klicka i checkboxen."]

Missar man att fylla i något så kan processingsidan se ut så här.

[FIGURE src=image/webtec/phpstruct/processing_not_complete.png?w=w3 caption="Formuläret kunde inte processas då det inte var 'giltigt'."]

Här "kunde" processingsidan inte processa formuläret eftersom alla delar inte hade fyllts i. Vad som är ett korrekt och giltigt ifyllt formulär är något som du själv bestämmer genom den programmerignskod som du skriver i processingsidan. Du väljer själv vad användaren måste fylla i.

Om vi gör om och klickar i checkboxen så kommer processingsidan att hantera formuläret.

[FIGURE src=image/webtec/phpstruct/form_complete.png?w=w3 caption="Nu är allt ifyllt, låt se om det går bättre nu."]

Processingsidan säger att den nu kunde hantera det postade formuläret.

[FIGURE src=image/webtec/phpstruct/processing_complete.png?w=w3 caption="Formuläret har nu processats."]

Det är du som skriver koden i processingsidan så det är du som bestämmer vad som är rätt och fel via de tester du gör i din kod.

När man jobbar med POST kan det ibland vara bra att kika vad den innehåller, för debugging och felsökning. Här är ett exempel som visar hur man kan göra det.

```html
<h2>Debug incoming $_POST</h2>

<p>This is how you can debug the content of the incoming $_POST.</p>

<pre><?= var_dump($_POST) ?></pre>
```



Problem med att göra reload på POST formulär {#postreload}
---------------------------------

Det finns ett problem med formulär, POST och processingsidor där processingsidan även visar ett resultat. Om man går till sidan dit formuläret postades och klickar "reload" av sidan så kommer även formuläret att postas om till sidan. Det ser ut som bilden nedan och man får en varning om att all data kommer att postas en gång till.

[FIGURE src=image/webtec/phpstruct/post_reload.png?w=w3 caption="Laddar om sidan dit formuläret postades och en varning visas."]

Detta är inte önskvärt och även direkt farligt för din webbplats. Tänk om ditt formulär var en betalning och användaren klickar `ctrl-r` av misstag och den blir en dubbel-betalning. Det blir inte bra.

När man använder processingsidor så är tanken att de normalt sett inte skriver ut någon data, de endast processar data och när de är klara så skickar de vidare till en resultatsida som visar upp resultatet, eller bara säger "Tack för ditt formulär!".

På det viset får man processingsidor som enbart hanterar det postade formuläret och när det är klart så gör processingsidan en "redirect" till en resultatsida. En redirect handlar i princip bara att man "delegerar" utskriften till en annan plats. Rent kodmässigt ser det ut så här för att göra en redirect.

```php
header("Location: form_result.php");
```

Så, kom nu ihåg. En processingsida är enbart PHP-kod som processar det postade formuläret. När det är klart så sker en redirect till en resultatsida, eller tillbaka till formuläret.

Glöm dock inte bort möjligheten att skriva ut i en processingsida, det kan vara en bra lösning när du gör felsökning.



HTML form med POST och resultatsida {#postres}
---------------------------------

Vi skall nu förbättra vår processingsida så att den skickar vidare till en resultatsida. Jag börjar med att visa dig min resultatsida `form_result.php`, den säger i princip endast "Tack" och det är en sedvanlig sidkontroller.

```php
<?php
include('../config/config.php');

$title = 'Formulär resultatsida';

include('../view/header.php');
?>

<main class="main">
    <h1><?= $title ?></h1>

    <p>Tack för dina uppgifter, nu har vi "sparat" dem.</p>

</main>

<?php include('../view/footer.php') ?>
```

HTML formuläret ser ut precis som tidigare men vi uppdaterar nu processingsidan `form_process.php` så att den nu ser ut så här.

```php
include('../config/config.php');

// Get incoming values from posted form
$name     = $_POST["name"] ?? "";
$address  = $_POST["address"] ?? "";
$checkbox = $_POST["check"] ?? false;

$success = $name && $address && $checkbox;

// Save the data to a database or process it by some means

if ($success) {
    // Redirect when success
    header("Location: form_result.php");
    exit();
}

// Redirect when failed
header("Location: datastructure.php#form");
exit();
```

NU är det enbart PHP-kod i processingsidan och om formuläret betraktas som "komplett" så skickas vidare till en resultatsida, annars skickas du tillbaka till den sidan du kom ifrån.

Det är viktigt att göra `exit()` efter att man gjort `header("Location: form_result.php")`, annars fortsätter exekveringen av koden och man får oväntade resultat.

Om du nu går tillbaka till ditt formulär och fyller i det komplett så bör du se följande bilder och flöde.

Först ett ifyllt formulär.

[FIGURE src=image/webtec/phpstruct/form_complete.png?w=w3 caption="Formuläret är komplett ifyllt."]

När du klickar på submit så kommer requesten till processingsidan som hanterar formulärets data och sedan görs en redirect till resultatsidan som kan se ut så här.

[FIGURE src=image/webtec/phpstruct/form_result.png?w=w3 caption="Nu gick allt bra och du kom till resultatsidan."]

Du kan prova att ladda om resultatsidan, det går bra utan att få några varningar. Det problemet har vi alltså lös med processingsidan och redirect till en resultatsida. Här blir det inte några dubbla debiteringar iallafall.

Den här hanteringen med en formulärsida, en processingsida och en resultatsida är standard hantering av ett HTML formulär med POST. 

När vi använder GET har vi inte samma bekymmer, där behövs inte någon processingsida. Där vill vi istället kunna göra reload på den sidan vi landar på. I det fallet är det alltså en annorlunda hantering.



Sessioner med SESSION {#session}
---------------------------------

I exemplet med processingsidan och resultsidan så fick du inte direkt någon feedback när du inte fyllde i hela formuläret, du hamnade bara tillbaka på formulärsidan med ett formulär som inte var ifyllt. Men det är något vi kan lösa genom att spara information mellan sidoanropen. Det är det som vi har sessionen till, eller variabeln `$_SESSION`.

Du kan läsa om [sessionen i PHP manualen](https://www.php.net/manual/en/book.session.php).

Innan vi börjar så får vi påminna oss om att det inte finns något "minne" mellan att användaren hämtar en sida och sedan nästa sida. Av den anledningen har man infört sessionen som en möjlighet att spara data för en användare mellan användarens sidanrop.

Rent tekniskt löses detta genom att webbservern ber webbläsaren att spara en cookie lokalt i webbläsaren, en "session cookie". Vid nästa request så skickar webbläsaren med denna cookie och webbservern kan se att det kan finnas sessionsdata lagrad på servern som skall läsas in.

Denna sessionsdata är individuell för varje session cookie och den sparas på servern, antingen i filer eller i en databas eller liknande. I PHP återfinns denna data i arrayen `$_SESSION` där det är fritt att spara data som skall leva mellan sidrequester.

För att en session skall fungera så måste den initieras på servern. Man kan också förstöra en session och ta bort all data i den. När sessionen är igång så kan man använda den som en vanlig array. Man kan både läsa från sessionen och skriva till den.

Så här kan du göra för att komma igång med sessionen i din webbplats.



### Starta session i config.php {#sessionstart}

Det första vi gör är att starta en namngiven session i vår fil `config/config.php`. Anledningen till att jag väljer den filen är att den inkluderas i samtliga sidkontroller och jag vill att sessionen skall startas på samma sätt för alla sidkontroller.

Placera följande kod i din `config/config.php`, strax efter att du har satt på felmeddelandena.

```php
// Start the named session,
// the name is based on the path to this file.
$name = preg_replace("/[^a-z\d]/i", "", __DIR__);
session_name($name);
session_start();
```

Nästa gång du laddar om en sidkontroller så är sessionen aktiv.



### Visa data från sessionen {#sessiondisplay}

Vi kan nu skapa en sidkontroller `session.php` för att visa information från sessionen genom att skriva ut `$_SESSION` och detaljer om sessionen. Den kan se ut så här.

Först skapar jag en sidkontroller `session.php` som jag också lägger i navbaren.

```php
<?php
include('../config/config.php');

$title = 'Sessionen';

include('../view/header.php');
?>

<main class="main">
    <h1><?= $title ?></h1>

    <p>För att visa detaljer om sessionen och felsökning.</p>

    <?php include('../view/php/session_display.php') ?>
</main>

<?php include('../view/footer.php') ?>
```

I vyfilen lägger jag kod för att hämta och visa detaljer om sessionen.

```php
$sessionName = session_name();
$sessionId = session_id();
$sessionCookie = session_get_cookie_params();
```

Sedan skriver jag ut detaljerna i samma vyfil.

```html
<p>Name of session: '<?= $sessionName ?>'</p>

<p>Id of this session: '<?= $sessionId ?>'</p>

<p>Details of the session cookie:</p>
<pre><?= print_r($sessionCookie, 1) ?></pre>

<p>Content of the $_SESSION variable.</p>
<pre><?= var_dump($_SESSION) ?></pre>
```

När jag är klar kan det se ut så här.

[FIGURE src=image/webtec/phpstruct/session_display.png?w=w3 caption="Sessionen är inledningsvis tom på innehåll, men den finns där."]



### Session destroy {#sessiondestroy}

Innan vi börjar lägga information i sessionen så skall vi lära oss hur man förstör sessionen. Det är bra att veta så man kan kasta bort all sessionsdata och börja om. Det är speciellt bra i början, om något går fel.

I detta fallet skapar en en sidkontroller som blir en processingsida som heter `session_destroy.php` och placerar följande kod i den. Koden har vi hämtat från manualen där det beskrivs hur man förstör en session.

```php
<?php
include('../config/config.php');

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

// Redirect to the session page
header("Location: session.php");
exit();
```

I slutet av koden har jag lagt till en redirect till sessionssidan. Nu kan jag skapa en länk på sessionssidan som leder till `session_destroy.php`, när man klickar på den kommer sessionen förstöras och man hamnar tillbaka på sidkontrollern `session.php` som visar detaljer om den nyskapade sessionen.

Det kan se ut så här. Klicka på länken med "Förstör sessionen" som leder till sidkontrollern `session_destroy.php`.

[FIGURE src=image/webtec/phpstruct/session_destroy_click.png?w=w3 caption="Då klickar vi på länken som leder till sidan som skall förstöra sessionen."]

När redirecten sker till sidkontrollern `session.php` så kommer det att initieras en ny session med ett nytt sessionsid och $_SESSION kommer att vara tom.

[FIGURE src=image/webtec/phpstruct/session_destroy.png?w=w3 caption="Sessionen är ny och fräsch med ett nytt id och tom på innehåll."]

När du förstör sessionen kan du alltid dubbelkolla att du har fått ett nytt sessionsid och att $_SESSION är tom.



### Spara data i sessionen {#sessionsave}

Nu kan vi jobba med `$_SESSION` precis som en vanlig array. Vi kan sätta värden och vi kan läsa av värden. Låt oss göra ett litet test.

Vi skall placera värden i sessionen, och läsa av dem. Vi börjar med delen som placerar värden i sessionen och skapar då en liknande sidkontroller/processingsida som `session_destroy.php`.

Vi döper vår sidkontroller/processingsida till `session_write.php` och placerar följande kod i den.

```php
include('../config/config.php');

// Add a randomized number to the session
$_SESSION["magic"] = rand(1, 100);

// Increment the session by one each time it is accessed
$increment = $_SESSION["increment"] ?? 0;
$increment += 1;
$_SESSION["increment"] = $increment;

// Redirect to the session page
header("Location: session.php");
exit();
```

Vi får inte glömma att alltid placera konfigurationsfilen överst, det är där som sessionen startas för varje sidanrop. Den måste altid finnas överst i varje sidkontroller.

I koden ovan placeras två värden i sessionen, dels ett slumpmässigt tal.

```php
// Add a randomized number to the session
$_SESSION["magic"] = rand(1, 100);
```

Du kan se hur man skriver till sessionen och anger en key till positionen där värdet skall sparas.

Sedan finns det kod som inkrementerar ett värde i sessionen varje gång som sidan laddas.

```php
// Increment the session by one each time it is accessed
$increment = $_SESSION["increment"] ?? 0;
$increment += 1;
$_SESSION["increment"] = $increment;
```

Här är det viktigt att inte förvänta sig att det finns ett värde i sessionen från början. Det kan ju var en tom session och då måste värdet iniiteras. I koden ovan läser vi först av ett värde från sessionen och finns det inte så tilldelar vi variablen 0. Därefter inkrementeras variabeln och slutligen skrivs den in i sessionen.

Det kan se ut så här när det är klart.

Först är sessionen helt ny och fräsch och tom på data.

[FIGURE src=image/webtec/phpstruct/session_new.png?w=w3 caption="Sessionen är ny och fräsch med ett nytt id och tom på innehåll."]

Sedan klickar jag första gången på länken och det kommer två värden till sessionen.

[FIGURE src=image/webtec/phpstruct/session_write1.png?w=w3 caption="Sessionen har uppdaterats och innehåller två värden i sin array."]

Klickar jag ytterligare en gång så ser jag att jag får ett nytt slumpmässigt värde och det andra värdet har ökat med ett.

[FIGURE src=image/webtec/phpstruct/session_write2.png?w=w3 caption="Sessionen är uppdaterad med nytt slumpmässigt värde och ett inkrementerat värde."]

Nu har vi sett exempel på både hur man skriver till sessionen och hur man läser från den. Det är i princip allt man behöver veta för att kunna använda sessionen.



### Felsökning med sessionen {#sessiontrouble}

Innan du börjar felsöka sessionen så kan du se till att den är nollställd och förstörd. Det underlättar att börja sin felsökning med en ny och ren session.

Du behöver också tänka på att det du sparar i din session skall initieras först. Det handlar mest om att du skall undvika att läsa värden från sessionen som inte är initierade. Men jag visade hur man kunde göra i exemplet ovan.

Du kan också tänka så här när det gäller sessionen. När sidan laddas så har du en "inkommande session", det är värdet som $_SESSION har innan din kod har exekverats. 

Sedan exekverar din kod och eventuellt uppdaterar din session.

Därefter har du en "utgående session" vilket är den data som $_SESSION har efter att din kod har exekverats. Det är den datan som sparas ned och öppnas upp när användaren öppnar nästa webbsida i din webbplats.

Kom också ihåg hur man felsöker en processingsida, man kan kommentera bort redirecten och använda echo för at tskriva ut vad som händer.



Flash-meddelande med sessionen {#flash}
--------------------------------------

Låt oss nu gå tillbaka till det formuläret vi byggde och där processingsidan gjorde redirect till en resultatsida, eller tillbaka till formuläret om man inte hade fyllt i alla värden. Vi sa något om att man inte fick någon feedback på om formulärets postning gick bra eller ej.

Nu när vi har sessionen kan vi använda den för att spara ett meddelande i processingsidan som sedan visas i resultatsidan, eller i formulärsidan. Tanken med dessa meddelanden är att de endast visas en gång. Om användaren laddar om resutlatsidan så försvinner de.

Denna typen av hantering benämns ofta "flashmeddelanden". Låt oss nu använda det vi lärt oss om sessionen och implementera flashmeddelanden för att göra användarens upplevelse lite bättre.

Egentligen är det inte så svårt, tanken är så här.

1. I processingsidan, spara ned ett meddelande i sessionen som berättar om det gick bra eller inte.

1. I resultatsidan, eller formulärsidan, kontrollera om den specifika nyckeln finns i sessionen och isåfall skriv ut meddelandet.

1. När meddelandet är utskrivet så nollställer du värdet för den nyckeln i sessionen, på det viset kan man bara se meddelandet en gång, laddas sidan om kommer det inte att visas igen.

I processingsidan kan vi göra detta så här.

```php
if ($success) {
    // Redirect when success
    $_SESSION["flash-message"] = "Everything was fine!";
    header("Location: form_result.php");
    exit();
}

// Redirect when failed
$_SESSION["flash-message"] = "The form was not successfully processed, fill in all parts of the form!!!";
header("Location: datastructure.php#form");
exit();
```

Nu finns det ett värde i sessionen som kan hämtas i resultatsidan.

Så här gör vi i sidan som visar när det gick bra.

```php
$flashMessage = $_SESSION["flash-message"] ?? null;
unset($_SESSION["flash-message"]);

?>

<main class="main">
    <h1><?= $title ?></h1>

    <?php if ($flashMessage) : ?>
        <div class="success"><?= $flashMessage ?></div>
    <?php endif; ?>
```

Vi börjar alltså att hämta värdet på flashmeddelandet, om det finns. Direkt därefter nollställer vi sessionen för den nyckeln så att meddelandet bara kan visas en gång.

Sedan skriver vi ut meddelandet, om det har ett värde. Vi wrappar meddelandet i en div som vi kan styla.

Så här kan det se ut i resultatsidan som visar när det går bra.

[FIGURE src=image/webtec/phpstruct/flash_success.png?w=w3 caption="Formuläret var ifyllt på ett korrekt sätt och ett grönt meddelande visar detta tydligt."]

När formuläret inte var ifyllt korrekt så redirectas tillbaka till formuläret. Då kan det se ut så här.

[FIGURE src=image/webtec/phpstruct/flash_warning.png?w=w3 caption="Formuläret var ej ifyllt på ett korrekt sätt och ett gult meddelande förtydligar detta."]

Detta var ett användningsområde för sessionen. Ett annat vanligt sätt att använda sessionen är när en användare skall logga in på webbplatsen, då använder man sessionen för att minnas att användaren har loggat in. Men det får vi ta en annan dag.



Funktioner för struktur {#funktioner}
--------------------------------------

Innan vi slutar skall vi också nämna ett par ord om funktioner som ett sätt att strukturera din kod och göra den mer återanvändbar. Du kan också läsa om "[User-defined functions](https://www.php.net/manual/en/functions.user-defined.php)" i PHP-manualen.

När din kod växer är det lätt att det blir lite stökigt, ibland kopierar man kod som man gjort tidigare och det är här som funktioner kommer in som ett hjälpmedel.

Vi vill att vår PHP-kod i vyerna skall vara rätt slimmad, vi vill inte ha en massa kod där. Kan vi flytta delar av den koden till funktioner så är det lämpligt, förutsatt att koden passar som en funktion. Vad som passar som en funktion är i allmänhet en kodsekvens som hänger ihop, eller en kodsekvens som man vill återanvända på fler ställen.

Låt oss ta ett par exempel från den kodbasen vi har i artikeln och strukturera vissa delar så att de hamnar som funktioner istället.

Till att börja med behöver vi en fil där vi kan placera koden för alla funktioner. Till att börja med räcker det med en fil. Jag väljer att placera den i `src/functions.php`. Den filen kommer nu att behöva inkluderas i alla sidkontroller (som använder funktioner). För att göra det enkelt kommer jag att inkludera filen via `config/config.php` eftersom den redan är inkluderad i alla sidkontroller, så behöver jag inte fundera på att inkludera filen separat.

Jag skapar alltså filen först i `src/functions.php`.

```php
<?php

/**
 * Various functions for improved code structure. 
 */
```

Sedan inkluderar jag den i `config/config.php` med följande kod.

```php
// Include the functions.php file
include("../src/functions.php");
```

Om du funderar på sökvägen till filen så är den relativ och utgår den från den plats där sidkontrollern ligger, det är där PHP-processingen startar.

Nu kan vi fundera på vilken kod som lämpar sig för att skapa en funktion av.



### Funktion av session_destroy() {#funksessiondest}

Vi börjar med koden som förstör sessionen. Det är en sammanhängande kodsekvens som har ett tydligt syfte och utför en åtgärd. Det är inte säkert att vi vill anropa den från flera platser och återanvända den, men det är en möjlighet.

I filen för funktioner börjar jag med att skapa en body för funktionen och ger den ett namn. Denna funktionen behöver inte ta in någon parameter och den returnerar inte något värde.

```php
/**
 * Destroy the session
 */
function destroySession () : void {

}
```

Nu kan jag kopiera in koden till funktionen, det är exakt samma kod som jag har i min sidkontroller `session_destroy.php`.

```php
/**
 * Destroy the session
 */
function destroySession () : void {
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
}
```

Nu när jag har funktionen kan jag anropa den med `destroySession()` och jag väljer då att uppdatera min kod i sidkontrollern `session_destroy.php` så här.

```php
<?php
include('../config/config.php');

// // Unset all of the session variables.
// $_SESSION = array();

// // If it's desired to kill the session, also delete the session cookie.
// // Note: This will destroy the session, and not just the session data!
// if (ini_get("session.use_cookies")) {
//     $params = session_get_cookie_params();
//     setcookie(session_name(), '', time() - 42000,
//         $params["path"], $params["domain"],
//         $params["secure"], $params["httponly"]
//     );
// }

// // Finally, destroy the session.
// session_destroy();

destroySession();

// Redirect to the session page
header("Location: session.php");
exit();
```

Du kan se att jag valde att den gamla koden fick ligga kvar, jag bara kopierade bort den tills jag testat och vet att allt fungerar.



### Funktion av flash message {#funkflash}

När vi gjorde funktionaliteten med flash message så fick vi följande kodsekvens på två platser.

```php
$flashMessage = $_SESSION["flash-message"] ?? null;
unset($_SESSION["flash-message"]);
```

När man har samma kod på två platser kan den koden vara en bra kandidat till en funktion, även om det bara är två rader kod.

Denna funktionen tar inga parametrar och den skall returnera en sträng eller null. Jag tror dock jag väljer att skriva om koden så att den returnerar en sträng enbart, om det inte finns något meddelande så returneras en tom sträng. Det kommer fungera och det blir tydligare med en return typ.

Jag börjar med funktionens body.

```php
/**
 * Get the flash message and return it, if any.
 * 
 * @return string with flash message, empty string of no message exists-
 */
function getFlashMessage () : string {

}
```

Nu fyller jag i koden i bodyn.

```php
/**
 * Get the flash message and return it, if any.
 * 
 * @return string with flash message, empty string of no message exists-
 */
function getFlashMessage () : string {
    $flashMessage = $_SESSION["flash-message"] ?? "";
    unset($_SESSION["flash-message"]);

    return $flashMessage;
}
```

Jag returnerar värdet på flashmeddelandet och finns inget så är strängen tom. Ovan funktionen skriver jag en kommentar, en [PHPDoc kommentar](https://en.wikipedia.org/wiki/PHPDoc), som hjälper mig att komma ihåg hur jag tänkte nät jag skapade funktionen.

Nu uppdaterar jag de sidkontroller/vyer som använder sig av flashmeddelandet.

```php
// $flashMessage = $_SESSION["flash-message"] ?? null;
// unset($_SESSION["flash-message"]);
$flashMessage = getFlashMessage();
```

Nu har vi grunderna i hur funktioner kan hjälpa till att strukturera din kodbas. Vi har sett en funktion som inte returnerar ett värde och en funktion som returnerar ett värde. Man kan också skicka parametrar in till en funktion för att göra den än mer dynamisk.

Fundera gärna om du har mer kod som lämpar sig för funktioner.



Avslutningsvis {#avslutning}
--------------------------------------

Sessioner, HTML formulär med (GET och) POST tillsammans med arrayer är viktiga beståndsdelar när man bygger webbplatser och det är viktigt att förstå hur det fungerar och kan användas.

Att jobba med funktioner är ett sätt att strukturera sin kod och göra den enklare att vidarutveckla, underhålla och felsöka.

Förhoppningsvis har du fått en del insikt i hur dessa byggstenar fungerar.

Nu kan du behöver programmera på egen hand för att se om det du lärt dig har fastnat.
