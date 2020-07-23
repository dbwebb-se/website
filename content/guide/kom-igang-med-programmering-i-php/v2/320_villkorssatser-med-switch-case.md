---
author: mos
revision:
    "2018-08-20": "(B, mos) Uppdaterad med nya exempelprogram."
    "2018-03-13": "(A, mos) Första versionen, uppdelad av större dokument."
...
Villkorssatser med switch-case
=======================

Villkorssatsen [`switch-case`](http://php.net/manual/en/control-structures.switch.php) kan jämföras med en serie av if-satser. När det blir många tester på ett och samma villkor så är detta en konstruktion att föredra framför upprepade satser av if och elseif. Koden kan bli mer läsbar och det är bra.

Låt oss studera ett exempel.



switch {#switch}
------------------------

Låt oss säga att en boll har en färg och beroende på dess färg så vill vi skriva ut en liknelse om bollen. Ungefär så här.

> "Bollen är gul och lyser likt solen."

Ja, för att ta ett exempel alltså...

För att göra samma sak mot flera färger så kan vi skriva en if-sats.

```php
if ($color === "yellow") {
    echo "The ball is yellow and shines like the sun.\n";
} elseif ($color === "red") {
    echo "It is a red ball, like the planet Mars.\n";
} else {
    echo "The ball has some unknown color.\n";
}
```

Men, när vi i detta fallet gör flera tester mot samma variabel så kan vi istället konstruera en switch-sats som gör samma sak, men på ett mer passande sätt i sammanhanget.
  
```php
switch ($color) {
    case "yellow":
        echo "The ball is yellow and shines like the sun.\n";
        break;
    case "red":
        echo "It is a red ball, like the planet Mars.\n";
        break;
    default:
        echo "The ball has some unknown color.\n";
}
```

En switch-sats lämpar sig alltså när man gör flera tester mot ett och samma villkor/variabel.

I programmeringssammanhang finns det ofta flera sätt att lösa ett problem, man får välja det sätt som man anser passar bäst. När man är nybörjare så får huvudsaken vara att "lösa uppgiften", efterhand som man lär sig allt mer så kan man se att olika lösningar ger olika kodstrukturer och man kan välja den kodstruktur man föredrar i det specifika fallet. Man lär sig efter hand.
