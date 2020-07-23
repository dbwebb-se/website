---
author: mos
revision:
    "2018-08-21": "(A, mos) Första versionen."
...
Styla nuvarande länk i en navbar
=======================

Vi skall se hur vi kan skapa en templatefil som renderar en vy med en navbar, en navigeringsmeny för en webbplats och vi skall göra en markering för nuvarande sida, så att användaren ser tydligt i navbaren vilken nuvarande sida är.

Vi kommer skriva kod i en templatefil och då använder vi den alternativa syntaxen för kontrollstrukturer.



HTML och CSS för navbar {#htmlcss}
-----------------------

Vi börjar med att skapa en templatefil i `view/navbar.php` och där lägger vi grunden för navbaren.

```html
<nav class="navbar">
    <a href="me.php">Hem</a>
    <a href="report.php">Redovisning</a>
    <a href="about.php">Om</a>
</nav>
```

För att vi skall ha möjlighet att via css styla ett specifikt menyval så behöver det markeras med en css klass. Den renderade html-koden behöver se ut så här, när till exempel sidan "Redovisning" besöks.

```html
<nav class="navbar">
    <a href="me.php">Hem</a>
    <a class="selected" href="report.php">Redovisning</a>
    <a href="about.php">Om</a>
</nav>
```

Nu kan vi enkelt styla det nuvarande menyvalet via följande css-kod.

```css
.navbar .selected {
    background-color: #ccc;
}
```

Men hur kan vi generera delen med `class="selected"` och enbart för den sida vi nu besöker?



Nuvarande sida med PHP {#nuvarandesida}
-------------------------

PHP samlar på sig en hel del information om den webbsidan som är på väg att laddas. Den informationen finns tillgänglig i olika variabler.

Vi kan hitta en del av länken till den sidan du nu besöker via variabeln `$_SERVER["REQUEST_URI"]`. Testa det så här.

```php
$uri = $_SERVER["REQUEST_URI"];
echo $uri;
```

Man kan sedan använda funktionen `basename()` för att ta ut endast den sista delen av sökvägen, man får då filnamnet som refererats.

```php
$uri = $_SERVER["REQUEST_URI"];
echo "URI: $uri\n";

$uriFile = basename($uri);
echo "URI file part: $uriFile\n";
```

URI står för en resurs som är identifierad och i vårt fall är det sökvägen till resursen som identifierar den.

[FIGURE src=image/snapht18/navbar.png?w=w3 caption="Utskriften av URI och dess filnamn."]

Vi har nu tillgång till den sida som besöks och kan då uppdatera templatefilen för att generera `class="selected"` när ett visst villkor är uppfyllt.

Så här.

```php
<?= $uriFile == me.php ? "class=\"selected\"" : null ?>
```

Eller så här.

```php
class="<?= $uriFile == me.php ? "selected" : null ?>"
```

Eller så här i hela sitt sammanhang.

```php
<?php $uriFile = basename($_SERVER["REQUEST_URI"]); ?>
<nav class="navbar">
    <a class="<?= $uriFile == "me.php" ? "selected" : null ?>" href="me.php">Hem</a>
    <a class="<?= $uriFile == "navbar.php" ? "selected" : null ?>" href="navbar.php">Navbar test</a>
    <a class="<?= $uriFile == "about.php" ? "selected" : null ?>" href="about.php">Om</a>
</nav>
```

För varje menyval behöver man testa om just detta menyvalet är samma som nuvarande sida som besöks. Om villkoret är uppfyllt så löser vår ternary operator, den korta if-satsen, att strängen `class="selected"` skrivs ut.

När du testar så kan du alltid dubbelkolla hur webbsidans källkod ser ut, högerklicka och visa källkod. Det är ett bra utvecklingsverktyg.

Vår kod ser lite kluddig ut, vi har ju tre nästan likadana rader, kanske borde de kunna skrivas annorlunda men snyggare kod. Men, när vi håller på och lära oss grunderna så är vi rätt nöjda med oss själva när sakerna bara fungerar.
