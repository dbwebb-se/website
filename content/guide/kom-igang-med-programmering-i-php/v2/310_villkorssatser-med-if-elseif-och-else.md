---
author: mos
revision:
    "2018-08-20": "(B, mos) Uppdaterad med nya exempelprogram."
    "2018-03-13": "(A, mos) Första versionen, uppdelad av större dokument."
...
Villkorssatser med if, elseif och else
=======================

Villkorssatser med `if` är en del av det som kallas kontrollstrukturer i PHP. Det är programkonstruktioner som används för att styra exekveringen av ett program. Kika snabbt på översikten av de [kontrollstrukturer som finns i PHP](http://php.net/manual/en/language.control-structures.php).



if-sats {#if-sats}
-----------------------

Villkor och villkorsatser används för att exekvera olika programkod beroende på ett eller flera villkor. Villkoret kan vara enkelt som att testa om en variabel innehåller värdet 42, eller mer komplext där man testar många olika variablers värden tillsammans med operatorer som AND (`&&`) och OR (`||`).

Här är en if-sats som skriver ut detaljer om ett värde beroende på ett villkor.

```php
$number = rand(1, 100);

var_dump($number > 50);

if ($number > 50) {
    echo "The number appears to be greater than 50.\n";
}

echo "The number is: $number\n";
```

Villkorssatsen if körs alltså endast om villkoret `$number > 50` är uppfyllt och ger resultatet `true`.

Ibland kan det vara lurigt att debugga kod som har if-satser, man tänker "varför körs inte koden inuti if-satsen?". Då är det en bra taktik att göra var_dump på villkoret i if-satsen, så får man visuell bekräftelse på hur villkoret tolkas.

Man kan lägga flera if-satser efter varandra för att skriva ut fler detaljer.

```php
if ($number >= 70) {
    echo "The number appears to be greater than, or equal to, 70.\n";
}

if ($number % 2 === 0) {
    echo "The number is an even number.\n";
}

if ($number % 2 !== 0) {
    echo "The number is an odd number.\n";
}
```

På det viset kan du skriva ut fler detaljer om det slumpade värdet, förutsatt att respektive villkor är uppfyllt.



elseif-sats {#elseif-sats}
-----------------------

Man kan kombinera en if-sats med en elseif. Då testas första villkoret, och sen det andra, och så vidare tills det första villkoret blir uppfyllt.

I vårt exempel ovan skriver vi ut att talet 90 är "större än 50" och att det är "större än 70", men säg nu att vi enbart vill skriva ut en av egenskaperna, inte båda.

Då kan vi konstruera en if-sats så här.

```php
if ($number >= 70) {
    echo "The number appears to be greater than, or equal to, 70.\n";
} elseif ($number > 50) {
    echo "The number appears to be greater than 50.\n";
}
```

Nu kommer först villkoret `$number >= 70` att testas, om det inte är uppfyllt så testas nästa villkor `$number > 50`. Om inget av villkoren ät uppfyllda så skrivs inget ut.

Tänk igenom din konstruktion så att saker testas i rätt ordning. Titta på if-satsen ovan och tänk om du ändrar ordningen på villkoren. Det hade inte givit helt rätt utfall då villkoret `$number >= 70` aldrig hade blivit utfört eftersom `$number > 50` alltid hade varit sant om värdet var större än 70.

Så, tänk igenom att du lägger dina if-satser i rätt ordning.



else-sats {#else-sats}
-----------------------

I det inledande stycket ovan, hade vi en if-sats om värdet var jämnt och en if-sats om värdet var udda. Rent logiskt kan endast ett av villkoren vara uppfyllda och endast en av if-satserna kommer att skriva ut sitt meddelande.

Det såg ut så här.

```php
if ($number % 2 === 0) {
    echo "The number is an even number.\n";
}

if ($number % 2 !== 0) {
    echo "The number is an odd number.\n";
}
```

Eftersom bara ett av villkoren kan vara uppfyllda så kan vi skriva om koden till en if-else sats, så här.

```php
if ($number % 2 === 0) {
    echo "The number is an even number.\n";
} else {
    echo "The number is an odd number.\n";
}
```

I en if-else sats så testas första villkoret, om det inte är uppfyllt så utförs alltid else satsen.



Flera villkor med AND och OR {#and-or}
-----------------------

Säg att vi vill skriva ut en mer komplex egenskap som visar att talet är större än 50 och mindre än 80 samt ett jämnt tal. Då kan vi konstruera en if-sats på detta viset.

```php
if ($number > 50 && $number < 80 && $number % 2 === 0) {
    echo "The number appears to be larger than 50, less than 80 and an even number.\n";
}
```

Konstruktionen `&&` innebär AND vilket säger att alla tre villkor som testas måste vara uppfyllda.

Ju fler villkoren blir desto svårare blir det att få en bra överblick över vad som egentligen testas. Ett sätt att hantera det är att skriva koden på flera rader.

```php
if ($number > 50 
    && $number < 80
    && $number % 2 === 0
) {
    echo "The number appears to be larger than 50, less than 80 and an even number.\n";
}
```

Personligen föredrar jag den if-sats som är på flera rader, när villkoret blir alltför komplext, jag tycker det blir tydligare. Men det är en smaksak och båda varianterna ger samma svar.

Vill man för skojs skull konstruera ett än mer komplext vllkor genom att tillfoga OR/OM värdet är under 40 och udda, så kan det se ut så här.

```php
if (($number > 50 && $number < 80 && $number % 2 === 0)
    || ($number < 40 && $number % 2 !== 0)
) {
    echo "The number appears to be larger than 50, less than 80 and an even number...\n";
    echo "OR it could be less than 40 and an odd number...\n";
}
```

Här behöver jag omringa delar av uttrycket med paranteser för att det skall bli "rätt svar", det svaret som jag tänkte mig.

Ett sätt att hantera komplexa villkor är att beräkna dem utanför if-satsen och spara i variabler. Så här.

```php
$isBetween50And80 = $number > 50 && $number < 80;
$isEven = $number % 2 === 0;
if ($isBetween50And80 && $isEven) { 
    echo "The number appears to be larger than 50, less than 80 and an even number.\n";
}
```

På det sättet kan man göra koden mer läsbar och enklare att felsöka då man har lyft ut villkoren till egna beräkningar som är enkla att debugga genom att skriva ut dess värden med `var_dump($isEven)`.

När man skriver kod så handlar mycket om att göra koden läsbar, för sig själv och för andra.
