---
author:
    - mos
category:
    - labbmiljo
    - php
revision:
    "2023-04-20": (D, mos) Genomgången inför vt23.
    "2018-04-05": (C, Aurora) Troubleshooting tillagd.
    "2018-04-03": (B, mos) Uppdatera till PHP 7.0 eller högre.
    "2017-04-28": (A, mos) Första revisionen.
...
Installera PHP Xdebug (2023)
==================================

[FIGURE src=/image/snapvt17/xdebug.png?w=c5&a=0,50,60,0 class="right"]

Så här gör du för att installera och aktivera PHP Xdebug.

<!--more-->



Förutsättning {#pre}
-------------------------------

Du har "[PHP i din PATH](kunskap/lagg-php-i-pathen)".




Dubbelkolla om Xdebug är aktiverat {#test}
-------------------------------

Du kan börja med att dubbelkolla om Xdebug redan är aktiverat i din PHP-installation.

```bash
$ php -i | grep Xdebug
    with Xdebug v2.2.5, Copyright (c) 2002-2014, by Derick Rethans
```

Om du får ett resultat liknande ovan, även om versionen skiljer sig, så är det troligt att det redan fungerar. Då är du klar.

Får du ett tomt resultat, ingen utskrift, så har du troligen inte aktiverat Xdebug.



Installera WSL/Ubuntu/Linux {#linux}
------------------------------

Du kan installera paketet via pakethanteraren apt.

Använd det paketet som matchar din PHP-installation. Här är ett exempel.

Först kollar vi vilken version av PHP vi har.

```text
$ php --version
PHP 8.2.4 (cli) (built: Mar 16 2023 14:34:48) (NTS)
```

Sedan installerar vi xdebug med rätt version.

```text
sudo apt install php8.2-xdebug
```

Sedan kan du kontrollera om PHP känner igen xdebug.

```text
php -i | grep Xdebug
```

Notera att Linux kan ha två olika konfigurationsfiler för PHP, en för CLI och en för Apache. Du vill aktivera Xdebug i båda ini-filerna.



Installera Mac {#mac}
------------------------------

På Mac har du troligen PHP installerad via Homebrew och du kan då installera Xdebug enligt [installationsinstruktionen för Mac](https://xdebug.org/docs/install#pecl).

Instruktionen installerar via pecl.

```text
pecl install xdebug
```

Titta på instruktionen om du får problem, det finns vissa tips där.

Verifiera att installationen fungerade.

```text
php -i | grep Xdebug
```



Troubleshooting {#troubleshooting}
------------------------------

Xdebug erbjuder själva en bra sida som hjälper till vid felsökning: [Xdebug Wizard](https://xdebug.org/wizard.php).

För att använda denna guide så behöver du köra `php -i` i din terminal och klistra in informationen som skrivs ut i terminalen i fältet på hemsidan. Då kommer du få en steg för steg guide på vad du behöver göra för att få Xdebug att fungera för dig.

[FIGURE src=/image/kunskap/xdebug.png?w=300 caption="Xdebug Wizard"]

För att dubbelkolla att det fungerade kan du köra

```text
$ php -i | grep Xdebug
    with Xdebug v3.2.0, Copyright (c) 2002-2022, by Derick Rethans
```
