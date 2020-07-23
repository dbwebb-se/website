---
author: mos
revision:
    "2018-06-28": "(A, mos) Första versionen, uppdelad av större dokument."
...
Uttryck och operatorer
=======================

Vi tittar på uttryck som är en viktig beståndsdel i språket. Vi tittar på uttrycket tillsammans med matematiska operatorer och vi berör begreppet _operator precedence_ som bestämmer i vilken ordning beräkningen utförs.

Som referens till detta stycket kan du titta i manualen och dess stycke om [operatorer](http://php.net/manual/en/language.operators.php).



Grunden {#grund}
-----------------------

Det mesta du skriver i PHP är ett uttryck, eller expression. Konstruktionerna `$a = 5` och `$a++` är exempel på uttryck. Ett uttryck är helt enkelt små byggstenar som formar ett större php-skript. Ett enkelt sätt att se på ett uttryck är att **ett uttryck har ett värde**.
  
Du kan utföra beräkningar med vanliga operatorer såsom `+ - / * =`. Detta är operatorer som jobbar med siffror. Det finns också operatorer för att jobba med strängar och mer komplexa variabler. 

Låt oss se hur dessa operatorer kan användas för att bygga större uttryck.



Matematiska operatorer och precedence {#math-op}
-----------------------

Först tar vi ett par exempel med [matematiska operatorer](http://php.net/manual/en/language.operators.arithmetic.php), det fungerar precis som i grundläggande matematik.

```php
$val = 1 + 2 + 3 + 4 + 5;
echo "Result: ", $val, "\n";

$val = 1 * 2 - 3 / 4 + 5;
echo "Result: ", $val, "\n";

$val = 1 * (2 - 3) / (4 + 5);
echo "Result: ", $val, "\n";

$val = 8 % 3;
echo "Result: ", $val, "\n";
```

Om du kör ovan exempel så kan du få följande utskrift.

[FIGURE src=image/snapht18/operator.png?w=w3 caption="Matematiska operatorer och operator precedence."]

I vissa exempel kan det vara klurigt att se hur php väljer att räkna ut värdet på uttrycket. Men det är samma regler som gäller i matematiken. Det finns en viss förbestämd ordning, *operator precendece*, hur ett uttryck skall beräknas. Är man osäker på ordningen så använder man paranteser och styr upp hur beräkningen skall ske. Paranteser är bra för det underlättar också läsbarheten för den som tittar på din kod.

Som referens kan du läsa om hur [operator precedence fungerar i php](http://php.net/manual/en/language.operators.precedence.php).



Operatorer för `++` och `--` {#inkrement-op}
-----------------------

Ibland har man en variabel och vill öka eller minska värdet med 1. Då kan man använda operatorer för inkrementering `++` eller dekrementering `--`. Du kan använda dem före eller efter en variabel. Så här fungerar det.

```php
$base = 1;
echo "Result: ", $base, "\n";
echo "Result: ", $base++, "\n";
echo "Result: ", ++$base, "\n";
echo "Result: ", $base, "\n";
echo "\n";

$base = 1;
echo "Result: ", $base, "\n";
echo "Result: ", --$base, "\n";
echo "Result: ", $base--, "\n";
echo "Result: ", $base, "\n";
echo "\n";

$base = 1;
$val = ++$base - $base-- + $base;
echo "Result: ", $val, "\n";
```

Det sista kodexemplet ovan hade haft nytta av paranteser för att göra koden mer läsbar, men försök se om du kan räkna ut vad resultatet blir.

Utskriften från exemplet ser ut så här. Se om du kan klura ut hur utskriften kan stämma överens med koden ovan.

[FIGURE src=image/snapht18/increment.png?w=w3 caption="Operatorer för att räkna upp och räkna ned en variabel."]

Det är skillnad på om du sätter operatorn innan eller efter variabeln.

När operatorn sitter _innan_ variabeln `++$var` så förändras variabelns värde först och därefter läses det av.

När operatorn sitter _efter_ variabeln `$var++` så läses först variabelns värde och därefter förändras variabelns innehåll.



Tilldelningsoperator {#tilldelning-op}
-----------------------

När du vill använda tilldela ett värde till en variabel så använder du tilldelningsoperatorn `=`. Det finns variaanter av tilldelningsperatorn så att den kan kombineras med `-=` eller `+=` eller till och med `.=` för strängar.

```php
// Same same, but different.
$val = "Same";
$val = $val + " same, but different.";

$val = "Same";
$val .= " same, but different.";
```

Ovan visas hur tilldelning genom att lägga till något till nuvarande variabel kan skrivas. Samma princip gäller även för addition och subtraktion med siffror.



Operatorer för jämförelse {#jamforelse-op}
-----------------------

Operatorer för jämförelse är som i matematiken när du vill jämföra två tal. Du kan jämföra och se om talen är lika med varandra, om det ena talet är större eller mindre än det andra.

```php
$a = 42;
$b = 42;
$res = ($a == $b);
echo "$a == $b ger ", ($res ? "true" : "false"), "\n";

$res = ($a != $b);
echo "$a != $b ger ", ($res ? "true" : "false"), "\n";

$a = 42;
$b = 1337;
$res = ($a >= $b);
echo "$a >= $b ger ", ($res ? "true" : "false"), "\n";

$res = ($a <= $b);
echo "$a <= $b ger ", ($res ? "true" : "false"), "\n";
```

När man kör ovanstående så får man följande resultat.

[FIGURE src=image/snapht18/compare.png?w=w3 caption="Operatorer för att jämföra värden."]

Nu har du koll på grunden i hur operatorer fungerar tillsammans med uttryck.


Ternary operator, liten if-sats {#ternary}
-----------------------

I exemplet ovan användes följande konstruktion.

```php
echo $res ? "true" : "false";
```

Om `$res` är sant så blir resultatet `"true"`, annars blir det `"false"`. Uttrycket användes för att skriva ut värdet av en boolsk variabel.

Konstruktion är i grunden enligt `uttryck ? värde-om-sant : värde-om-falskt`. Uttrycket kallas ternary operator och är en liten if-sats. Konstruktionen beräknar först värdet på uttrycket, efter frågetecknet ligger det värde som lämnas kvar om uttrycket är sant och efter kolonet ligger det värdet som lämnas kvar om uttrycket är falskt.

Ternary operator kan vara en smidig variant för att skriva ut saker beroende på ett värde, eller tilldela en variabel olika värden beroende av ett uttryck.
