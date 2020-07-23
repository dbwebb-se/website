---
author: mos
revision:
    "2018-06-27": "(A, mos) Första versionen, uppdelad av större dokument."
...
Strängar och heredoc
=======================

Vi tittar på strängkonstruktionen heredoc (och nowdoc) som ger möjlighet till strängar som omsluter flera rader.



Heredoc konstruktion {#heredoc}
-----------------------

Konstruktionen heredoc ger möjlighet att komponera strängar som sprider sig över flera rader och där interpolation av variabler sker. Rätt använt kan det ge dig tydlig kod och förenkla koden där du kombinerar många variabler med strängar.

Så här ser grundkonstruktionen ut för heredoc.

```php
$html = <<<EOD
...here comes the string...
EOD;
```

Det är delen med `<<<EOD` som inleder strängen och avslutningen sker med `EOD;`. Man kan använda vilken sträng man vill, strängen "EOD" brukar översättas till _end of data_ och kan ses användas i diverse kodexempel. 

Så här kan en mer komplett konstruktion av en heredoc-sträng se ut.

```php
$url = "https://dbwebb.se";
$html = <<<EOD
<p>This is pure text, saved in a variable for 
use later on.</p>

<p>This is a <a href="$url">url to somewhere.</a></p>
EOD;

echo $html;
```

Det man får är en mer tydlig och sammanhängande sträng där man fritt kan använda enkel- och dubbelfnuttar tillsammans med variabler och ett begränsat behov av att escapa tecken. Det blir en renare konstruktion, mer lättläst.
 


Felmeddelande med heredoc {#fel}
-----------------------

Det är viktigt att den avslutande konstruktionen `EOD;` alltid står längst in till vänster och att den inte följs av tomma tecken som mellanslag eller tabbar. Parsern letar efter det som avslutar heredoc-strängen och om det inte hittas får man ett felmeddelande som säger "parse error", något i stil med följande.

> _"Parse error: syntax error, unexpected end of file in /home/mos/htmlphp/example/guide-php/02/types.php on line 56"_



Konstruktionen nowdoc {#nowdoc}
-----------------------

Det finns även en konstruktion nowdoc som enklast kan förklaras med att det är enkelfnuttvarianten av heredoc. Det sker alltså ingen interpolering inuti en nowdoc sträng.

Så här ser en nowdoc konstruktion ut.

```php
$str = <<<'EOD'
Example of string
spanning multiple lines
using nowdoc syntax.
EOD;
```

Skillnaden är starten som i nowdoc omsluts med enkelfnuttar, `<<<'EOD'`.
