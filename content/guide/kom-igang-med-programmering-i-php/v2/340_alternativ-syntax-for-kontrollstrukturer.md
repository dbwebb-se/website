---
author: mos
revision:
    "2018-03-13": "(A, mos) Första versionen, uppdelad av större dokument."
...
Alternativ syntax för kontrollstrukturer
=======================

Det finns en alternativ syntax för hur man skriver kontrollstrukturer. Den variant vi sett hittills är lämpad för när man skriver php som ett vanligt programmeringsspråk. Men när man blandar html-kod och php-kod, vilket händer när man skriver kod i vyer, templatefiler, så kan den alternativa syntaxen vara att föredra, den passar bättre ihop med html.



Varför alternativ struktur? {#varfor}
------------------------

När php skapades så var tanken att vara ett skriptspråk för att ge dynamik till html och webbsidor. Tanken var att blanda php-kod med html-kod. Numer är php också ett vanligt traditionellt programmeringsspråk där man skriver enbart php-kod, utan att blanda med html och webbsidor.

Någonstans i det sammanhanget finns anledningen till att det kan vara bra att ha två olika sätt att skriva koden på.

Låt se hur vi kan använda den alternativa strukturen när vi renderar vyer via våra templatefiler. I templatefilerna mixar vi html och php.

Bara en not innan vi fortsätter, man vill helst inte mixa kod av olika syften, man vill dela upp saker så att "var sak har sin plats" och inte blandas ihop. När man blandar kod av olika typer blir det lätt rörigt. Speciellt i webbsammanhang där vi utan problem kan skriva både html, css, php och javascript i en och samma fil. Det kan då bli riktigt stökig och svårläst kod.



Vad är en vy, en templatefil? {#templatefil}
------------------------

En fil, som likt `header.php` och `footer.php`, har till syfte att generera den resulterande webbsidan, kan vi kalla templatefiler. Det kan hjälpa oss att tydliggöra deras syften.

En god filstruktur kan vara att spara den typen av filer i en underkatalog `view/`. Det är delvis med tanke på framtiden. När vi senare programmerar i störra ramverk så kommer denna typen av filer att namnges som templatefiler och ofta lagras i kataloger som döps till `view/`.

Terminologien är ungefär att "en webbsida är uppdelade av vyer (delar) och varje vy renderas av en (eller flera) templatefiler".

Men, innan vi går vidare så kan vi se hur de alternativa strukturerna ser ut.



Short echo tag {#short-echo-tag}
------------------------

Vi börjar med en variant som egentligen inte är en kontrollstruktur, det är bara en variant av hur man kan kan skriva ut ett värde i en template fil.

I exemplet använder vi filen `header.php` och vi skiver ut variabeln `$title` som sidans titel.

Först skriver vi ut variabeln som en vanlig php-konstruktion.

```php
<!doctype html>
<html lang="en">
<title><?php echo $title ?></title>
```

Det är alltså konstruktionen `<?php echo $title ?>` som skriver ut sidans titel inom html elementet `<title>`.

Med en short echo tag kan vi få ned kodmängden genom att skriva `<?= $title ?>` som ett alternativ till `<?php echo $title ?>`.

Koden i den uppdaterade templatefilen `header.php` ser alltså ut så här.

```php
<!doctype html>
<html lang="en">
<title><?= $title ?></title>
```

Man kan tycka att det är små saker, men när kodbasen växer så är det små saker som kan göra att koden blir lättläst.



Alternativa kontrollstrukturer {#altstruktur}
------------------------

Det finns alternativa kontrollstrukturer för if, switch, while, do while och for. De ser ut så här.

Först en if-sats som skriver ut sidans titel, förutsatt att `$title` har ett värde.

```php
<title>
<?php if ($title) : ?>
    <?= $title ?>
<?php else : ?>
    No title was defined.
<?php endif; ?>
</title>
```

Den alternativa strukturen ger alltså en möjlighet att blanda html och php på ett någorlunda läsbart sätt.

Om vi skriver en while loop med den alternativa syntaxen så kan det se ut så här.

```php
<?php while ($number <= 10) : ?>
    <p><?= $number++ ?></p>
<?php endwhile; ?>
```

Ovan loop räknar till 10 och skriver ut varje siffra inom ett html element.



Mer {#mer}
------------------------

Kika gärna i manualen om [alternativ syntax för kontrollstrukturer](http://php.net/manual/en/control-structures.alternative-syntax.php).
