---
author: mos
revision:
    "2023-04-20": "(A, mos) Uppdaterad och genomgången."
...
PHP Xdebug
==================================

Xdebug är en extension till PHP för att debugga, analysera och profiliera som PHP-kod. Extensionen används av PHPUnit för att skapa kodtäckning för enhetstester.

Läs kort [om Xdebug](https://xdebug.org/) och vilka feature den erbjuder.

Du kan kontrollera om Xdebug är installerat som en extension i din PHP-konfiguration.

```text
$ php -i | grep Xdebug
    with Xdebug v3.2.0, Copyright (c) 2002-2022, by Derick Rethans
```

Får du ingen utskrift så är Xdebug inte installerat.

Det är vanligt att PHPUnit klagar över att den inte kan generera kodtäckning för att Xdebug saknas.

Du kan läsa artikeln "[Installera PHP Xdebug (2023)](kunskap/installera-php-xdebug-2023)" för att få hjälp med installationen.
