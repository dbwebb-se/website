---
author: mos
revision:
    "2018-06-28": "(A, mos) Första versionen, uppdelad av större dokument."
...
Jonglera med typer
=======================

Vi ser hur begreppet _type juggling_ påverkar hur php tolkar och beräknar uttryck när variabler av olika slås samman eller jämförs. Vi ser även hur typkonvertering av en variabel kan ske.

Som referens kan du läsa om [type juggling](http://php.net/manual/en/language.types.type-juggling.php) i manualen.



Automatisk konvertering {#type}
-----------------------

Vad händer om vi slår samman en sträng och en siffra, eller om vi vill jämföra ett tal och en sträng? I php tillåts vi göra det och parsern har i bakgrunden ett eget regelverk för hur saker tolkas, parsern gör en egen konvertering av variabelns värde så att beräkningen kan utföras.

Låt oss titta på ett exempel.

```php
$a = "42 är svaret.";
$b = "1337 små grisar.";
$res = $a . $b;
echo $res, "\n";

$res = $a + $b;
echo $res, "\n";

$res = $a - $b;
echo $res, "\n";
```

Så här blir det om man kör testprogrammet.

[FIGURE src=image/snapht18/type-juggling.png?w=w3 caption="Typjonglering och automatisk konvertering av värden."]

Ovan utför vi strängkonkatenering samt addition och subtraction mellan två strängar. I alla fallen får vi ett resultat då php inte bekymrar sig om vilka typer variablerna har, parsern tolkar värdet på variabeln och använder det som känns rätt. Ovan ser vi hur strängarna implicit översätts till siffror vilket gör att en addition och en subtraktion kan utföras. 



Manuell konvertering {#manuell}
-----------------------

Man kan manuellt konvertera ett värde på en variabel så att det tolkas som en viss typ. Vi kan ta samma exempelprogram som ovan och explicit konvertera strängarna till siffror.

```php
$a = "42 är svaret.";
$b = "1337 små grisar.";
$c = "Det finns 1 moped.";
$d = "";

echo "'$a' (", gettype($a), ") get integer value: ", intval($a), "\n";
echo "'$b' (", gettype($b), ") get integer value: ", intval($b), "\n";
echo "'$c' (", gettype($c), ") get integer value: ", intval($c), "\n";
echo "'$d' (", gettype($d), ") get integer value: ", intval($d), "\n";
```

Så här blir utskriften av ovan exempelprogram.

[FIGURE src=image/snapht18/intval.png?w=w3 caption="Explicit konvertering av variabels värde till en annan typ."]



Jämförelse och ta hänsyn till typen {#jamfor}
-----------------------

När man jämför två värden så finns en speciell operator som tar hänsyn både till värdet och typen, det är trippel-lika-med operatorn `===`, `!==`, `>==` och `<==`. Dessa operatorer fungerar på samma sätt som jämförelseoperatorn, dubbla-lika-med, men den tar även hänsyn till typen.

Här är ett exempelprogram som visar hur det fungerar.

```php
$a = 42;
$b = "42";

$res = ( $a == $b );
echo $res ? "true" : "false", "\n";

$res = ( $a === $b );
echo $res ? "true" : "false", "\n";
```

I första fallet så jämförs `42 == "42"` och det ger `true`, värdet i jämförelsen är lika på båda sidor.

I andra fallet jämförs `42 === "42"` och värdet är detsamma men typen är olika och därför ger resultatet `false`.

När du gör jämförelser bör du använda trippel-varianten, det gör att du blir mer säker på vad som verkligen jämförs och du undviker att råka ut för udda beteenden som kräver att man förstår hur parsern gör sin jonglering med typer.
