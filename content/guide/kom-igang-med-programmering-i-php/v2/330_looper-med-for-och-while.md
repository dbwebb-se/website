---
author: mos
revision:
    "2018-08-20": "(B, mos) Omskriven med nya exempel."
    "2018-03-13": "(A, mos) Första versionen, uppdelad av större dokument."
...
Loopar med for och while
=======================

En loop-konstruktion används för att återupprepa exekveringen av ett och samma kodstycke ett visst antal gånger eller tills ett villkor är uppfyllt.

Det finns flera varianter av loop-konstruktioner i PHP. Låt oss titta på loop-konstruktioner för [`while()`](http://php.net/manual/en/control-structures.while.php), [`do-while()`](http://php.net/manual/en/control-structures.do.while.php) och [`for()`](http://php.net/manual/en/control-structures.for.php). 



while {#while}
-----------------------

En while-loop utförs 0 eller flera gånger, beroende om villkoret är uppfyllt. Villkoret fungerar på samma sätt som i en if-sats.

Här är en while loop som räknar från ett till 10.

```php
// Count from one to ten
$number = 1;
echo "The number starts with the value: '$number'.\n";

while ($number <= 10) {
    echo "$number\n";
    $number++;
}

echo "The number now has the value: '$number'.\n";
```

En while loop är bra då man har ett villkor som bestämmer hur länge loopen skall utföras. Tänk på att villkoret måste vara uppfyllt för att första iterationen skall utföras, annars "kommer man inte in" i loopen.



do while {#dowhile}
-----------------------

En loop konstruerad enligt do-while fungerar på snarlikt sätt som while loopen. Skillnaden är att villkoret testas i slutet av loopen och inte i inledningen av loopen.

Så här ser samma loop ut som räknar från ett till tio.

```php
// Count from one to ten
$number = 1;
echo "The number starts with the value: '$number'.\n";

do {
    echo "$number\n";
    $number++;
} while ($number <= 10);

echo "The number now has the value: '$number'.\n";
```

När man använder en do-while så vet man att första iterationen alltid utförs, oavsett vad villkoret säger. Det är också den enda skillnaden mellan while och do-while.



for {#for}
-----------------------

En for-loop har ett litet annat sätt att skriva sitt villkor, man kan se på det som en uppräknande loop där man kan sätta en variabel, ett villkor och en stegning av variabelns värde.

```php
for (initiering av variabler; villkor; uppräkning/nedräkning av variabler) {
```

Så här ser en for loop ut som räknar från ett till 10.

```php
// Count from one to ten
echo "The for-loop initiates the start value.\n";

for ($i = 1; $i <= 10; $i++) {
    echo "$i\n";
}

echo "The number now has the value: '$i'.\n";
```

Det är en vanlig programmeringskonvention, ett sätt att programmera som flera programmerare använder sig av, att namnge den uppräkningsbara variabeln i en if-sats till `$i`, och `$j` om man har en for loop i en for loop.



continue {#continue}
-----------------------

I loop konstruktioner kan man använda sig av nyckelordet `continue;` för att hoppa över en iteration i loopen och gå direkt till nästa iteration.

Vi kan använda detta för att visa alla jämna tal mellan 1 till 10.

```php
// Count from one to ten, show only even numbers
$number = 0;
echo "The number starts with the value: '$number'.\n";

while ($number <= 10) {
    $number++;
    if ($number % 2 !== 0) {
        continue;
    }
    echo "$number\n";
}

echo "The number now has the value: '$number'.\n";
```

Ovan skrivs inte de udda talen ut, med hjälp av `continue;` så hoppar man vidare till nästa iteration.

Om du minns föregående while loop så är ovan loop aningen annorlunda konstruerad. Initialt är `$number = 0` och konstruktionen `$number++;` sitter innan värdet skrivs ut. Det är sådana småsaker man kan behöva justera för att få ut önskat resultat med läsbar kod som resultat.

Det finns många olika sätt att skriva kod för att få ett visst önskvärt beteende, några sätt är snyggare än andra, men ibland är det viktigast att bara få fram ett rätt resultat, oavsett hur koden ser ut. En erfaren programmerare vill ha både rätt resultat och snygg läsbar och logiskt korrekt kod. När man lär sig att programmera så räcker det att veta att det finns olika sätt att nå rätt resultat, man bör inte nödvändigtvis eftersträva snygg kod, den kunskapen kommer tillsammans med erfarenhet och ökad kunskap. Var sak har sin tid.



break {#break}
-----------------------

Med konstruktionen `break;` kan man hoppa ur en pågående loop, kanske kan man inte skriva en loop med ett villkor som avslutar loopen på ett visst sätt, eller så har man någon annan anledning till att vilja avbryta loopens iterationer på ett abrupt sätt.

Här är en loop som går från 1 till 10 men avbryter om summan av alla talen som hittills gåtts igenom är större än 42.

```php
// Count from one to ten, but only if sum is less than 42
echo "The for-loop initiates the start value.\n";

$sum = 0;
for ($i = 1; $i <= 10; $i++) {
    $sum += $i;
    if ($sum >= 42) {
        break;
    }
    echo "$i, sum=$sum\n";
}

echo "The number now has the value: '$i' and sum='$sum'.\n";
```

Här har vi alltså skapat en kodsekvens som räknar från ett till 10, men bara så långt att summan blir max 42.
