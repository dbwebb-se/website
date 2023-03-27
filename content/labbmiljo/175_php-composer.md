---
author: mos
revision:
    "2023-03-27": "(A, mos) Första utgåvan."
...
PHP och Composer
==================================

[FIGURE src=/image/snapvt16/logo-composer.png?w=c5 class="right"]

Composer är ett kommandoradsprogram som låter dig installera paket och moduler som andra utvecklare har gjort och publicerat. Composer håller koll på vilka versioner som är installerade och att paketen installeras effektivt och kan hållas uppgraderade.



Förutsättning {#pre}
-------------------------------

Du har installerat PHP i din terminal.

De operativsystem och terminaler som är aktuella är följande.

* Windows med WSL2 och Ubuntu.
* MacOS med den inbyggda terminalen
* Linux och godtycklig terminal.

Om du sitter på en annan terminal, till exempel Windows Cygwin, så är det lämpligt att uppgradera till Windows WSL2 med Ubuntu. Alternativet (ej rekommenderat) är att jobba igenom artikeln "[Installera Composer för pakethantering med PHP](labbmiljo/composer)" och använda den delen som visar hur man installarer composer med PHP som finns installerad med XAMPP.



Läs mer {#mer}
-------------------------------

Du kan läsa mer om [Composer på webbplatsen](https://getcomposer.org/).

Du kan se vilka [PHP-paket som finns publicerade på Packagist](https://packagist.org/).



Installera på Mac, Linux och WSL {#linux}
-------------------------------

Följ instruktionen om hur man [laddar ned och installerar composer](https://getcomposer.org/download/).

När filen är nedladdad, gör följande.

```
sudo mv composer.phar /usr/local/bin/composer
```



Verifiera att Composer fungerar {#test}
-------------------------------

Följande två kommandon kan hjälpa dig att dubbelkolla vilken installation av composer som du använder.

```text
whereis composer
which composer
```

Kör följande för att se att composer fungerar.

```text
composer --version
composer
```



Bra att veta om Composer {#bra}
-------------------------------

Ibland får du ett meddelande om att uppdatera `composer`. Du kan hjälpa `composer` att uppdatera sig själv.

```text
composer selfupdate
```

Du kan göra fler saker med `composer`. Använd hjälptexten för att snabbt få en översikt av vad du kan göra.

```text
composer
```
