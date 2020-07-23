---
...
PHP Xdebug
==================================

Xdebug är en extension till PHP för att debugga, analysera och profiliera som PHP-kod. Extensionen används av PHPUnit för att skapa kodtäckning för enhetstester.

Du kan kontrollera om Xdebug är installerat som en extension i din PHP-konfiguration.

```bash
$ php -i | grep Xdebug
    with Xdebug v2.2.5, Copyright (c) 2002-2014, by Derick Rethans
```

Får du ingen utskrift så är Xdebug inte installerat.

Det är också vanligt att PHPUnit klagar över att den inte kan generera kodtäckning för att Xdebug saknas.

Du kan läsa artikeln "[Installera PHP Xdebug](kunskap/installera-php-xdebug)" för att få hjälp med installationen.
