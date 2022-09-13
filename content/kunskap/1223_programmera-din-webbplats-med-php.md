---
author: mos
category:
    - webbprogrammering
    - html
    - css
    - php
    - kurs webtec
revision:
    "2022-08-10": "(A, mos) Första utgåvan inför webtec-v2."
...
Programmera din webbplats med PHP
==================================

[FIGURE src=image/webtec/programmera/html_form_2.png?w=c5 class="right" caption="Programmera webbsidan med PHP."]

Vi skall gå igenom ett antal grundläggande PHP-konstruktioner som hjälper oss att använda PHP som ett programmeringsspråk och skapa dynamiska webbsidor. "Dynamiska" webbsidor innebär att man skriver en PHP-fil som kan generera olika webbsidor med olika innehåll. Webbsidan kan ändra sitt innehåll baserat på vilken dag det är eller visa upp sökresultat när man söker i en databas eller visa upp alla sidorna i en bok.

Vi börjar med att övergripande och kortfattat gå igenom olika konstruktioner och därefter använder vi dem för att skapa webbsidor och träna på PHP.

<!--more-->



Förutsättningar {#pre}
---------------------------------

Du har installerat en labbmiljö likt den som beskrivs i dokumentet om [labbmiljö för kursen webtec](kurser/webtec-v2/installera-labbmiljo). Det innefattar bland annat en webbserver med stöd för PHP.

Du har jobbat igenom kmom02 i kursen webtec och du är bevandrar i det sätt som används för att skapa webbsidor med PHP där du har en katalogstruktur.

Du har jobbat igenom kmom02 och du har en motsvarande webbplats som du kan bygga vidare på.

Du har använt begreppet sidkontroller som inkluderar olika vyer för att generera en webbsida.

Du har läst på om grunderna i PHP i boken och du har sett en introduktionsföreläsning om PHP och dess konstruktioner.

Du kan hitta koden som används i denna artikel, i ditt kursrepo under `example/me/kmom03`, använd den som referens om du fastnar.



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



Inledning {#inledning}
---------------------------------

När vi bygger webbsidor med HTML och CSS blir det statiska sidor som inte kan ändra sig, de visar samma innehåll varje gång man visar sidan. För varje nytt innehåll vi vill visa upp så behöver vi skapa en ny fil och en ny webbsida. Om vi skall visa innehållet i en bok så behöver vi en webbsida för varje sida i boken (eller så lägger vi hela boken i en webbsida...).

Ett sätt att göra mer dynamiska webbsidor är att använda programmeringsspråket PHP. Då kan vi bygga en PHP-fil som genererar olika webbsidor för varje boksida. Genom att skapa sådana dynamiska webbsidor kan det räcka med en PHP-fil för att generera oändligt antal webbsidor som till exempel läser sitt innehåll från en databas, eller sidorna i en bok.



Sidkontroller och vyer {#sidkontroller}
---------------------------------

Vi bygger vidare på den webbplatsen vi har och skapar en ny sidkontroller i filen `public/play.php` där vi kan träna på att programmera PHP-kod och generera webbsidor.

Innehållet i `play.php` kan se ut så här. Det bör likna de webbsidor du har sedan tidigare.

```html
<?php

include('../config/config.php');

$title = 'Träna på PHP';

include('../view/header.php');
?>

<main class="main">
    <h1><?= $title ?></h1>

    <p>Här bygger vi kod för att träna på PHP och dess olika konstruktioner som skall hjälpa oss att generera webbsidor.</p>
</main>

<?php include('../view/footer.php') ?>
```

Vår sidkontroller har till uppgift att generera grunden till webbsidan genom att inkludera en konfigurationsfil och vyer för header och footer.

För att undvika att skriva all PHP-kod direkt i sidkontrollern så lägger vi varje exempel i en vy. Det kan vara ett rimligt sätt att dela upp koden i olika filer. En god uppdelning gör det enklare att felsöka och vidarutveckla koden.

Vi skapar vyn `view/php/hello.php` och inkluderar den i sidkontrollern.

Först uppdaterar vi delen i sidkontrollern som inkluderar vyn.

```html
<main class="main">
    <h1><?= $title ?></h1>

    <p>Här bygger vi kod för att träna på PHP och dess olika konstruktioner som skall hjälpa oss att generera webbsidor.</p>

    <?php include('../view/php/hello.php') ?>
</main>
```

Därefter skapar vi vyn som genererar sin del av webbsidan och säger "Hej" med hjälp av en PHP variabel `$message = "Hej världen!";` och en konstruktion "PHP short echo tag" `<?= $message ?>` som skriver ut variabeln. Läs gärna kort och översiktligt om [PHP och olika taggar](https://www.php.net/manual/en/language.basic-syntax.phptags.php).

```html
<?php

/**
 * Divide your view files into "two stages", start by coding PHP and preparing 
 * the content into variables (1),  then output the content/variables together
 * with HTML elements (2).
 * It is good practice to keep this in two stages, it makes your code cleaner
 * and easier to read, edit and develop.
 */

$message = "Hej världen!";

?>

<h2>Hello world</h2>

<p>
    PHP säger: <strong><?= $message ?></strong>
</p>
```

Tanken med att dela upp vyn i två delar handlar om att först skriver vi PHP-kod och sparar undan innehåll i variabler, därefter "går vi över" till HTML läge och skriver HTML elementen och skriver ut innehållet i PHP-variablerna. Det är ett bra sätt att strukturera sin kod. När koden är liten kanske strukturen inte spelar så stor roll, men koden växer snabbt och då är strukturen väldigt viktig.

Det kan se ut så här när det är klart.

[FIGURE src=image/webtec/programmera/play_php.png?w=w3 caption="Vår första PHP-kod som genereras från en sidkontroller med hjälp av en vy."]

Nu har vi en struktur där vi kan skriva fler exempelprogram. Då kan vi börja träna på grunderna i PHP.



Små enkla testprogram {#testprog}
---------------------------------

När man vill lära sig nya saker kan det vara bra att testa dem isolerade från annan kod. Små enkla testprogram är ett bra sätt att lära sig, då vet man att man inte är beroende av någon annan kod, mer än den lilla kodsekvens man vill testa.

I exemplet ovan skapade vi en sidkontroller och en vy som var uppdelad i två delar. Vi var också beroende av en konfigurationsfil och vyer för header och footer. Men, säg om vi nu hade velat göra ett liknande testprogram som skapade en variabel och skrev ut dess värde, kan vi inte göra det på något enklare och snabbare sätt och utan att generera hela webbsidans struktur? Klart vi kan.

Det vi behöver är en PHP-fil där vi kan skriva koden. Vi kan skapa den i `public/play1.php` för att testa. Den viktiga koden är denna som kommer från vyn.

```html
<?php

$message = "Hej världen!";

?>

<h2>Hello world</h2>

<p>
    PHP säger: <strong><?= $message ?></strong>
</p>
```

Om du skapar filen med koden ovan och öppnar filen i din webbläsare (via webbservern) så bör du se utskriften så här.

[FIGURE src=image/webtec/programmera/small.png?w=w3 caption="Ett enklare testprogram utan beroende av andra saker."]

Som ett tips så kan det vara bra att inkludera din konfigfil i dina små testprogram. Då vet du att felutskrifter skrivs ut.

```html
<?php

include('../config/config.php');

$message = "Hej världen!";

?>

<h2>Hello world</h2>

<p>
    PHP säger: <strong><?= $message ?></strong>
</p>
```



Felutskrifter {#felutskrift}
---------------------------------

Om du skriver något fel i koden så kan du få ett felmeddelande. Felmeddelanden kan presenteras på olika sätt men det finns alltid med ett meddelande som säger vad som är fel. Man läser meddelandet och sedan tittar man på den kodraden som anges och försöker se om man "håller med" om felet.

Oftast har felmeddelandet rätt så det är bäst att lita på det.

[FIGURE src=image/webtec/programmera/error.png?w=w3 caption="Ett felmeddelande som säger att jag har använt en variabel som inte är definierad."]

I koden ovan hade jag stavat fel på variabeln när jag skulle skriva ut den.

Om du får flera fel så rättar du det översta, det som har lägst radnummer. Därefter kör du koden igen och rättar nästa fel. När man får ett fel så kan det komma följdfel och de försvinner om man rättar det första felet.



Variabler och typer {#variabler}
---------------------------------

Variabler är en konstruktion som startar med ett dollar `$` tecken följt av en sekvens av tecken, siffror och underscore. Använd variabelnamn som beskriver sitt innehåll och är lagom långa. Här är exempel på två variabler som sparar strängar och skriver ut dess innehåll.

```php
<?php
$name = "Mikael";
$city = "Bankeryd";
?>

<p>
    Jag har hört talas om <?= $name ?> som bor i <?= $city ?>. Vet du vem det är?
</p> 
```

När vi jobbar med strängar så använder vi dubbelfnutt eller enkelfnutt runt strängen. Om vi jobbar med siffror som heltal eller flyttal så anger vi värdet direkt. Så här.

```php
<?php
// Integer
$age = 42;
$birthDay = 7;
$birthMonth = 3;

?>

<p>
    Jag föddes den <?= $birthDay ?>/<?= $birthMonth ?> och jag är <?= $age ?> år gammal. Kan du räkna ut vilket år jag föddes?
</p>
```

Vi kan avvakta lite med att räkna ut när jag föddes. När vi gör det vill vi dra nytta av inbyggda funktioner som kan berätta vilket år det är just nu.

Man kan räkna med variabler som du troligen är van vid från matematiken i skolan.

```php
<?php
// Float/double
$radius = 7.0;
$pi = 3.14159;

$circumference = 2 * $radius * $pi;
$area = $pi * $radius * $radius;
?>

<p>
    Cirkelns radie är <?= $radius ?> enheter, dess omkrets är <?= $circumference ?> enheter och dess area är <?= $area ?> enheter i kvadrat.
</p>
```

Så här blir utskriften från mitt exempelprogram när jag är klar.

[FIGURE src=image/webtec/programmera/variable.png?w=w3 caption="Utskrift av variabler och beräkningar."]

Hmmm, sjuan skrevs ut utan sitt kommatecken och det var lite väl många siffror efter komma tecknet. Ska vi se om vi kan uppdatera exempelprogrammet en aning och kanske även räkna ut vilket år jag föddes?



Inbyggda funktioner i PHP {#inbyggdafunk}
--------------------------------------

Låt oss se om vi kan formattera siffrorna och räkna ut födelseåret med hjälp av några av de inbyggda funktioner som finns i PHP.



### Datum {#datum}

När det gäller datum och tid så finns det ett [stycke i PHP-manualen](https://www.php.net/manual/en/ref.datetime.php) som beskriver de funktionerna. Funktionen `date()` kan användas för att formattera ett datum till en sträng och en variant är att använda det till att plocka fram nuvarande år.

```php
// Extract the year only
$currentYear = date('Y');

// Calculate the birth year from the age
$birthYear = $currentYear - $age;
```



### Formattera ett tal {#numberformat}

Ibland vill vi styra hur man formatterar utskriften av ett tal och då är [funktionen `number_format()`](https://www.php.net/manual/en/function.number-format.php) behjälplig.

Om vi till exempel vill styra så att utskriften av radien, omkretsen och arean har ett visst antal decimaler så kan vi styra det med funktionen.

```php
// Format number for output
$formattedRadius = number_format($radius, 1);
$formattedCircumference = number_format($circumference, 2);
$formattedArea = number_format($area, 2);
```



### Matematiska funktioner {#matfunk}

PHP har flertalet matematiska funktioner inbyggt i språket, du kan se en [översikt i manualen](https://www.php.net/manual/en/ref.math.php).

Det finns till exempel en funktion som ger dig talet PI, prova funktionen `pi()` istället för att själv räkna fram talet.

Vill du avrunda ett tal för att spara i en variabel eller använda i en matematisk beräkning så kan du använda funktionen `round()`. Det kan vara bra att skilja denna funktionen från `number_format()` som är till för utskrifter.



### Fler inbyggda funktioner {#inbyggdafler}

Du kan kika kort i manualen på [översikten av de olika inbyggda funktioner som finns i PHP](https://www.php.net/manual/en/funcref.php).

Prova att leta reda på stycket om strängar och dess inbyggda funktioner. Kika snabbt igenom listan för att se vilken typ av inbyggda funktioner som du kan förvänta dig.



### Använd inbyggda funktioner {#anvandinbygdfunk}

Ta nu och använd de inbyggda funktionerna, för att lära dig hur de fungerar och för att prova att hitta i manualen. Du kan försöka att uppdatera ditt exempelprogram så att det genererar en utskrift likt följande.

[FIGURE src=image/webtec/programmera/inbyggd.png?w=w3 caption="Uppdaterad utskrift med hjälp av inbyggda funktioner."]



### Utmaning med inbyggda funktioner {#utmaninginbygdfunk}

Är du redo att anta en utmaning som tvingar dig att leta runt i manualen?

Här är en sträng som jag vill att du tolkar och skriver ut i klartext.

```php
$messageAsRot13 = "Xhqbf! Qh svknqr rkgenhcctvsgra!";
```

Utmaningen är att via manualen hitta en funktion som hjälper dig att konvertera och skriva ut texten så att den är läsbar för alla. 

Du kan behöva ett tips och det är att strängen är "krypterad" enligt ROT13 ([läs om ROT13](https://en.wikipedia.org/wiki/ROT13)).



Villkor med if-satser {#if}
--------------------------------------

En villkorssats styr vilken kod som exekveras genom att testa ett villkor. Vi kan testa innehållet i en eller flera variabler och kombinera enkla till avancerade uttryck. Villkorssatser är en grundpelare i många programmeringsspråk. If-satsen är en del av de [PHP kontrollstrukturer som beskrivs i manualen](https://www.php.net/manual/en/language.control-structures.php).

Vi kan till exempel kolla om det är fredag i dag och isåfall skriva ut texten "Äntligen fredag!" och för alla andra dagar kan vi skriva ut "Ännu är det inte fredag...".

```php
<?php
// Extract details about the day
$dayNum = date('N');
$dayStr = date('l');

// For testing, extract details from a day that is certain to be a Friday
// Comment out when no testing
// $dateStr = '2022-08-26';
// $timestamp = strtotime($dateStr);
// $dayNum = date('N', $timestamp);
// $dayStr = date('l', $timestamp);

// Set the message with a default text
$message = "Today it is $dayStr, it is NOT yet Friday!!! Carpe Diem.";

// Check if it is friday, day 5 in the week
if ($dayNum == 5) {
    // Change the message if it is Friday
    $message = "Hurray!!! Today it is $dayStr!!! Carpe Diem!";
}

?>

<h2>Villkor med if</h2>

<p><?= $message ?></p> 
```

I manualen kan vi via funktionen [`date()`](https://www.php.net/manual/en/function.date.php) hitta till den sidan för [`date_format()`](https://www.php.net/manual/en/datetime.format.php) som visar alla bokstavskonstruktioner som kan anvädas tillsammans med date. Titta till exempel på skillnaden mellan `D` och `l` samt skillnaden mellan `N` och `w`.

Låt oss nu uppdatera vårt program och försöka räkna ut hur många dagar det är kvar tills det blir fredag. Det bör vi kunna göra med någon variant av if-sats. Låt oss skriva ut ett visst meddelande för måndag till torsdag och ett annat meddelande för lördag till söndag. Följande kod kan ge dig en idé om hur du kan uppdatera ditt kodexempel.

```php
// How many days left to Friday?
$daysLeft = 0;
if ($dayNum < 5) {
    $daysLeft = 5 - $dayNum;
    $message = "$message It is $daysLeft days left to Friday, hang on...";
} elseif ($dayNum > 5) {
    $daysLeft = 7 - $dayNum + 5;
    $message = "$message It was just Friday but it will come again in $daysLeft days.";
} else {
    $message = "$message Horrayyy Friday!!!";
}
```

När du är klar så bör du se till att testa din kod. I min kod lade jag till ett par rader som jag använder enbart för test och när jag är klar så kommenterar jag ut dem.

```php
// For testing, extract details from a day that is certain to be a Friday
// Comment out when no testing
// $dateStr = '2022-08-26';
// $timestamp = strtotime($dateStr);
// $dayNum = date('N', $timestamp);
// $dayStr = date('l', $timestamp);
```

Tanken med det är att det kan vara svårt att följa alla villkor i if-satserna genom att bara titta på dem, man behöver exekvera koden med olika villkor innan man är säker på att det ger rätt svar. Dessutom är detta ett sätt att underlätta felsökning som snabbt kan bli lurigt när if-satserna blir fler och villkoren som testas blir allt större.

Så här ser min utskrift ut.

[FIGURE src=image/webtec/programmera/if_friday.png?w=w3 caption="Ännu är det inte fredag hos mig."]

Nu kan vi grunden i if-satser.



Loopar med for och while {#loop}
--------------------------------------

Loopkonstruktioner med `for` och `while` är andra exempel på PHP kontrollstrukturer. En loop kan exekvera ett kodstycke ett godtyckligt antal gånger. For-loopen används när man har en variabel som man räknar upp för varje loop-runda. While-loopen används när man har ett villkor som man vill testa inför varje loop-runda.



### While-loop {#whileloop}

Vi börjar med ett exempelprogram som bygger en while loop som summerar alla udda tal som finns. Vi börjar på talet 1 och vi slutar när summan har kommit upp i, eller är över, talet 42. Du kanske själv kan klura ut hur det kan fungera? Om man strukturerar programmet med kommentarer, som en del av problemlösningen, så kan det se ut så här.

```php
// Prepare variables before loop
$sum = 0;
$number = 1;

// Do the loop and sum odd numbers
while (some condition so the sum does not exceed 42) {
    // Add to the sum, if the number is odd
}

// Print the sum
```

Att skissa sin kod, innan man börjar koda, kan vara ett bra sätt att jobba med sin problemlösning. Det innebär att man tänker igenom hur koden skall vara, utan att veta ett komplett facit. Fördelen är att man delar in koden i mindre delar och många små problem vilka ofta är enklare att lösa ett och ett, än att lösa ett stort och kanske komplext problem. Förenkla problemet tills koden uppenbarar sig. Att skriva kod på detta sättet kan ibland kallas [pseudokod](https://en.wikipedia.org/wiki/Pseudocode).

När jag är klar ser min kod ut så här.

```php
// Prepare variables before loop
$sum = 0;
$number = 1;
$oddStr = "";

// Do the loop and sum odd numbers
while ($sum <= 42) {
    // Add to the sum, if the number is odd
    if ($number % 2 === 1) {
        $sum += $number;
        $oddStr .= "Adding $number, sum is $sum.<br>";
    }
    $number++;
}
```

Sedan får jag skriva ut resultatet i slutet av vyn.

```html
<h2>Loopar med for och while</h2>

<p>Calculating the sum of odd numbers, until the sum is 42 or more.</p>

<p><?= $oddStr ?></p> 
```

Exemplet använder konstruktionen `.=` som är strängkonkatenering, man "plussar" ihop strängar med operatorn `.`. Skriver man `+=` så är det en aritmetisk beräkning med siffror och `.=` är en "addering", eller konkatenering, av strängar. Läs kort om "[PHP och String Operators](https://www.php.net/manual/en/language.operators.string.php)"

Exemplet använder [modulo operatorn `%`](https://www.php.net/manual/en/language.operators.arithmetic.php) för att kontrollera om talet är udda.

Så här blir resultatet när man kör det.

[FIGURE src=image/webtec/programmera/odd_loop.png?w=w3 caption="En sammanställning av alla udda tal, tills summan av dem är 42 eller mer."]

Det var while loopen, bra att använda när man har ett villkor som styr hur länge man skall loopa.

Ett tips är att det kan vara bra att ha utskrifter inuti loopen, när man vill testa sin kod. Ibland är man osäker på om koden verkligen går in i en if-sats eller loop, då kan man lägga till en echo-sats för att skriva ut ledande text eller visa innehållet i en variabel. Det kan vara ett bra sätt att jobba med test och felsökning av sin kod.



### For-loop {#forloop}

Låt oss bygga ut vårt testprogram till att skriva ut alla veckans dagar med deras datum och veckonummer med en for-loop. Vi utgår fran dagens datum men vi bör kunna testa så att programmet fungerar med alla godtyckliga datum.

Prova gärna på egen hand, din utskrift kan se ut så här. Men annars ser du min kod nedanför bilden.

[FIGURE src=image/webtec/programmera/week_loop.png?w=w3 caption="Information om veckans dagar och datum med loopar."]

Programmering handlar mycket om problemlösning och inför en sådan här liten programmeringsutmaning kan det underlätta att stolpa upp, dela upp, problemet i mindre beståndsdelar. En enkel lista kan vara en start.

1. Ta reda på vilken dag det är idag och hämta tidsstämpeln för det.
1. Samla information om dagens datum och skriv ut det.
1. Spola tillbaka tidsstämpeln till måndagen i veckan.
1. Använd den nya tidsstämpeln för att loopa genom veckans alla dagar och skriv ut information om varje dag.

Ju mer man kan om programmering och om PHP, ju lättare är det att problemlösa. Ju mindre man kan så kan man ta problemet i små små bitar till att börja med. Är du nybörjare så finns inga förväntningar på att du skulle kunna lösa denna problemlösning på egen hand, se den bara som ett exempel på hur man kan tänka.

Då kan vi kika på koden. Läs kommentarerna så ser du att de matchar mot problemlösningen ovan.

```php
// Extract details about the current day
$timestampToday = time();
$dateStrToday = date('Y-m-d', $timestampToday);
$week = date('W', $timestampToday);
$dayToday = date('l', $timestampToday);
$todayMessage = "Today is $dayToday in week $week and the date is $dateStrToday.";

// Calculate the first day of the week
// When we loop through the week we need to have the timestamp from the
// first day in the week
$dayNum = date('N');
$timeStampWeekStart = $timestampToday - ($dayNum - 1) * 60 * 60 * 24;

// Loop through each day in the week and build up the result as a string
$weekStr = "<ul>\n";
for ($i = 0; $i <= 6; $i++) {
    $timestamp = $timeStampWeekStart + $i * 60 * 60 * 24;
    $dateStr = date('Y-m-d', $timestamp);
    $dayStr = date('l', $timestamp);

    $isToday = "";
    if ($dateStrToday === $dateStr) {
        $isToday = " (today)";
    }

    $weekStr .= "<li>$dayStr $dateStr $isToday</li>\n";
}
$weekStr .= "</ul>\n"
```

Ovan ser vi endast PHP-koden till lösningen. Om det är någon funktion du inte sett tidigare så kan du slå upp den i manualen, till exempel genom att googla `php time`. 

Vi får inte glömma att skriva ut resultat-strängarna till webbsidan.

```html
<p><?= $todayMessage ?></p> 

<?= $weekStr ?>
```



Skicka parameter till sidan med querysträngen {#querystring}
--------------------------------------

Om du skriver in följande länk i din webbsida, så kommer den att söka efter "php get". 

* `https://www.google.com/search?q=php+get`

Det är delen med `?q=php+get` som gör det möjligt att skicka parametrar till en webbsida. Den delen som inleds med `?` kallas för querysträng och den följs sedan av en sekvens av `key=value`. Om man har flera värden så separeras de av ett `&`-tecken, så här `key=value&key2=value2`.

Detta kallas querystring och är en del av URL:en, som om du kan hitta en enkel förklaring till query/querystring i [Wikipedias sida om URL](https://en.wikipedia.org/wiki/URL).

I PHP finns det en speciell variabel som heter [`$_GET`](https://www.php.net/manual/en/reserved.variables.get.php) och där samlas all information om querysträngen. Man kan hämta värden från `$_GET` på följande sätt.

```php
echo $_GET['q']; // Detta ger "php get" i första exemplet

echo $_GET['key']; // Detta ger "value" i andra exemplet

echo $_GET['key2']; // Detta ger "value2" i tredje exemplet
```

Vi kan också kontrollera om ett värde är satt i querysträngen.

```php
if (isset($_GET['key'])) {
    // Yes, the key is set and has a value that can be retrieved
}
```

Vi kan nu skapa ett exempel där vi skickar in ett datum via querysträngen och sedan skriver vi ut detaljer om datumet. Konstruktionen vi tänker oss med querysträngen kan alltså se ut så här `?date=2022-08-23` eller `?date=2029-12-24`.

I exemplet behöver vi då följande kod för att använda oss av det inkommande argumentet, förutsatt att det är definierat i querystringen.

Först kollar vi om det finns ett inkommande argument och isåfall läser vi in det till en variabel.

```php
// Get incoming arguments from querystring
$date = null;
if isset($_GET['date']) {
    $date = $_GET['date'];
}
```

Det finns en enklare konstruktion som vi kan använda som tar upp färre kodrader, den kallas "null coalesce operator" och stavas `??`. Den fungerar så att den tar det första värdet som inte är null, i en kedja av värden.

```php
// Get incoming arguments from querystring
$date = $_GET['date'] ?? null;
```

Nu har vi värdet i en variabel. Om det inte kom ett inkommande argument så innehåller variabeln `null`, annars förutsätter vi att det innehåller ett datum. Ja, förutsatter är kanske inte helt bra, värdet kommer från användaren och en del användare är elaka och skickar in felaktiga värden för att förstöra våra program. Så, rent säkerhetsmässigt måste vi vara försiktiga med alla värden och inkommande parametrar som en utomstående kan påverka och vi själva inte har full koll på. Vi kan till exempel inte skriva ut variabelns värde direkt i webbsidan, det är samma sak som att ge användaren möjlighet att lägga in kod i vår webbsida och det vill vi undvika. 

Nu när vi har värdet så kan vi hoppas att det är ett datum och använda det för att skapa ett timestamp och sedan plocka fram detaljer om datumet.

```php
// Extract details about the date, if it is a valid date
$date = $_GET['date'] ?? null;

// Extract details about the date, if it is a valid date
$timestamp = null;
if ($date) {
    $timestamp = strtotime($date);
}

if ($timestamp) {
    $dateStr = date('Y-m-d', $timestamp);
    $monthStr = date('F', $timestamp);
    $monthDaysStr = date('t', $timestamp);
    $weekStr = date('W', $timestamp);
    $dayStr = date('l', $timestamp);   
}
```

Nu handlar det mest om att skriva ut informationen. Här tänker jag använda mig av något som kallas "[PHP alternativ syntax för kontrollstrukturer](https://www.php.net/manual/en/control-structures.alternative-syntax.php)" som gör att jag kan skriva en if-sats på ett litet annorlunda sätt när jag skapar html-koden. Man kan också skriva loopar på liknande sätt.

```html
<h2>Skicka parameter till webbsidan med querystring och GET</h2>

<?php if ($date) : ?>
    <p>
        The incoming date argument is <code><?= htmlentities($date) ?></code>.
    </p>

    <?php if ($timestamp) : ?>
        <p>
            The date is <?= $dateStr ?> and that is/was a <?= $dayStr ?> in the 
            week <?= $weekStr ?> in the month <?= $monthStr ?> that has 
            <?= $monthDaysStr ?> days.
        </p>
    <?php else : ?>
        <p>The incoming date is not a valid date.</p>
    <?php endif; ?>

<?php else : ?>
    <p>
        You did not send a date through the querystring, do that by adding this 
        to the url: <code>?date=2022-08-23</code>
    </p>
<?php endif; ?>
```

Man kan tänka att man skriver sin kod i antingen PHP-läge eller i HTML-läge. När man skriver i PHP-läge använder man den vanliga if-satsen eller loopen, men när det passar bättre att vara i HTML-läge så använder man den alternativa syntaxen som ger mer läsbar HTML-kod.

Om du följer koden kan du se två nästlade if-satser som skriver ut olika meddelanden beroende av om datumet är giltigt eller ej.

Du kan också se att jag skriver ut innehållet i `$date` trots att det är en farlig variabel som innehåller det som snvändaren skickat till sidan. Men jag löser säkerheten genom att använda [funktionen `htmlentities()`](https://www.php.net/manual/en/function.htmlentities.php) som hjälper mig att koda om alla farliga tecken i den strängen, på det viset skyddar jag sidan och kan skriva ut variabelns innehåll.

Så här ser min sida ut när jag skickar in ett giltigt datum.

[FIGURE src=image/webtec/programmera/get_date.png?w=w3 caption="Skicka argument till webbsidan med GET och querystring."]



Ett GET formulär {#getform}
--------------------------------------

Nu när vi kan querysträngen och GET så kan vi skapa ett HTML formulär där vi som användare kan mata in ett datum och skicka till webbsidan, så slipper vi manuellt redigera länken direkt och lägga till querysträngen.

Här behöver vi först skapa ett HTML formulär med ett textfält där vi kan skriva in en datum. HTML-koden för ett sådant formulär kan se ut så här.

```html
<h2>HTML formulär med GET</h2>

<form action="" method="get">
    <p>
        Datum:
        <input type="text" value="<?= $dateStr ?>" name="date" placeholder="Skriv in ett datum">
    </p>

    <p>
        <input type="submit" value="Skicka" name="doit">
        <input type="reset" value="Rensa">
    </p>
</form>
```

Formuläret kommer visa upp ett textfält där användaren kan skriva in godtycklig text. Det visas också en knapp där användaren kan klicka för att skicka (submitta) formuläret så att dess data skickas till servern. Det finns också en knapp som rensar formuläret till sitt ursprungliga läge.

Jag har angett `method="get"` vilket innebär att formulärets data kommer att skickas via querysträngen.

Jag har angett `action=""` vilket innebär att formuläret postas till samma url som formuläret är på. Det kallas självpostande formulär, "self-submitting form" då det går till samma sida som formuläret visas på. Hade jag velat posta resultatet till en annan sida så hade jag kunnat ange till exempel `action="me.php"`.

När formuläret postas så skickas dess innehåll till den webbsidan som har angivits. Där får vi ta emot argumentet på samma sätt som vi gjorde i förra övningen. Så här kan det se ut. Jämför variabelnamnen med de namn som används i formuläret ovan.

```php
// Get incoming arguments from querystring
$date = $_GET['date'] ?? null;

$dateStr = "";
if ($date) {
    $dateStr = htmlentities($date);
}
```

Innan jag är klar så väljer jag att utöka min kod med lite utskrifter via `<output>` och via `var_dump()` för att skapa möjligheten att debugga innehållet i `$_GET`.

```html
<h2>HTML formulär med GET</h2>

<form action="" method="get">
    <p>
        Datum:
        <input type="text" value="<?= $dateStr ?>" name="date" placeholder="Skriv in ett datum">
    </p>

    <p>
        <input type="submit" value="Skicka" name="doit">
        <input type="reset" value="Rensa">
    </p>

    <output>
        <?php if ($dateStr) : ?>
            <p>You have submitted the date: <code><?= $dateStr ?></code>.</p>
        <?php endif; ?>
    </output>
</form>

<p>This is how you can debug the content of the incoming <code>$_GET</code> variable.</p>
<pre><?= var_dump($_GET) ?></pre>
```

Nu är i klara, då kan vi köra sidan som ser ut så här i sitt första skede när det inte finns en querysträng som är postad.

[FIGURE src=image/webtec/programmera/html_form_1.png?w=w3 caption="Ett HTML formulär för att skicka in datumet till sidan via querysträngen."]

När jag matar in ett datum och klickar på "Skicka" så postas formulärets innehåll till den sidan jag angett via querysträngen. Det kan se ut så här.

[FIGURE src=image/webtec/programmera/html_form_2.png?w=w3 caption="Formuläret är postat och sidan tar emot argumentet via querysträngen och visar upp det."]

Prova gärna att byta till en annan typ av formulärelement, till exempel ett som är anpassat till datum, prova med `type="date"`.

Som du kan se så fungerar även vårt föregående exempel där vi skrev ut detaljer om datumet tillsammans med vårt formulärexempel, de båda exemplen jobbar mot samma `$_GET['date']`.



$_SERVER och inkommande värden för requesten {#server}
--------------------------------------

Likt `$_GET` finns det en annan variabel som heter `$_SERVER`. Dessa båda variabler är exempel på "[super globals](https://www.php.net/manual/en/language.variables.superglobals.php)" och det finns fler liknande variabler som man har tillgång till när man skriver sin PHP-kod.

Låt oss titta lite på [`$_SERVER`](https://www.php.net/manual/en/reserved.variables.server.php) och vilken information vi kan finna i den. Låt oss bygga ett testprogram där vi skriver ut värden från variabeln i en HTML tabell.

PS. Om du är intresserad av vad hela variabeln `$_SERVER` innehåller så kan du debugga den på samma sätt som vi gjorde med `$_GET`.

```html
<p>This is how you can debug the content of the incoming <code>$_SERVER</code> variable.</p>
<pre><?= var_dump($_SERVER) ?></pre>
```

Vi börjar med grundstrukturen av en HTML tabell, sedan lägger vi till rader för de värden vi vill visa.

```html
<h2>Detaljer om requesten med SERVER</h2>

<table>
    <tr>
        <th>Nyckel</th>
        <th>Värde</th>
    </tr>

    <tr>
        <td>Rad 1, kolumn 1</td>
        <td>Rad 1, kolumn 2</td>
    </tr>

    <tr>
        <td>Rad 2, kolumn 1</td>
        <td>Rad 2, kolumn 2</td>
    </tr>
</table>
```

För att snygga till tabellen så kan vi lägga till lite CSS-kod i en stylesheet.

```css
table {
    border: 1px solid #666;
}

th {
    border-bottom: 1px solid #666;
    background-color: #ccc;
}

tr:nth-child(odd) {
    background-color: #ddd;
}

tr:hover {
    background-color: #ccc;
}
```

För att visa ett värde ur `$_SERVER` så kan jag lägga till en ny rad till tabellen med följande kod.

```html
    <tr>
        <td>SERVER_SOFTWARE</td>
        <td><?= htmlentities($_SERVER['SERVER_SOFTWARE']) ?></td>
    </tr>

    <tr>
        <td>SERVER_ADDR</td>
        <td><?= htmlentities($_SERVER['SERVER_ADDR']) ?></td>
    </tr>
```

Därefter följer vi upp med att lägga till även detaljer om REQUEST_TIME_FLOAT, REQUEST_METHOD, REQUEST_URI och SCRIPT_NAME.

När vi är klara kan en utskrift se ut så här.

[FIGURE src=image/webtec/programmera/server_1.png?w=w3 caption="Vissa delar av $_SERVER är nu utskrivna i en HTML tabell."]

Innehållet i `$_SERVER` kan ibland vara användningsbart. Vi kan till exempel läsa av namnet på den sidkontroller som vi befinner oss i och vi skulle kunna räkna ut hur lång tid det har tagit att ladda sidan. Här är kod som visar hur du kan göra.

```php
 // Calculate the time it took to process this page
$timestampFirst = $_SERVER["REQUEST_TIME_FLOAT"];
$timestampLast = microtime(true);
$diff = $timestampLast - $timestampFirst;
$loadTime = round($diff * 1000, 3);

// Get name of the current pagecontroller
$requestUri = $_SERVER["SCRIPT_NAME"];
$pageController = basename($requestUri);
```

Om vi skriver ut informationen kan det se ut så här.

[FIGURE src=image/webtec/programmera/server_2.png?w=w3 caption="Detaljer om sidans request är hämtade från $_SERVER och bearbetade."]



<!--
Datum på svenska {#datumsv}
--------------------------------------

sudo apt-get install php-intl
-->




Avslutningsvis {#avslutning}
--------------------------------------

Nu hoppas jag att du har kommit igång med grunderna i PHP och att du har en struktur som du kan följa för att skapa fler dynamiska PHP-sidor.

Glöm inte bort att "problemlösa" innan du sätter igång att programmera, så att du iallafall har en grov plan.

Glöm heller inte bort att det är bra att skapa små testprogram när man lär sig nya saker.

Använd echo och var_dump eller liknande för att skriva ut innehållet i en variabel, det underlättar när man felsöker.

Nu kan du behöver programmera lite på egen hand för att se om det du lärt dig har fastnat.
