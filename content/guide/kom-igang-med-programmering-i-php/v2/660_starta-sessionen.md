---
author: mos
revision:
    "2018-09-14": "(A, mos) Första versionen."
...
Starta sessionen
=======================

Vi tittar hur vi startar, namnger en session i php.



Starta namngiven session {#start}
------------------------

En session i php behöver startas innan den kan användas. För att göra det enkelt för oss så startar vi den alltid i en konfigurationsfil `config.php` som inkluderas i alla sidkontroller. Då vet vi att sessionen alltid är startad och att den är startad på exakt samma sätt med samma namn.

En session kan namnges, det ger möjligheten att jobba mot flera namngivna sessioner samtidigt och det ger möjligheten att en webbplats kan vara säker på att ens session inte krockar med andra sessioner som körs på samma webbplats.

Så, en namngiven session och vi startar den i `config.php`.

```php
// Start the named session,
// the name is based on the path to this file.
$name = preg_replace("/[^a-z\d]/i", "", __DIR__);
session_name($name);
session_start();
```

Vår taktik på att namnge sessionen är att använda sökvägen till katalogen där `config.php` ligger. Då får alla våra exempelprogram (som sparas i en viss katalog) egna sessioner och vi undviker att olika exempelprogram krockar med varandras sessioner.

I manualen kan vi läsa om [`session_start()`](http://php.net/manual/en/function.session-start.php) och [`session_name()`](http://php.net/manual/en/function.session-name.php).
