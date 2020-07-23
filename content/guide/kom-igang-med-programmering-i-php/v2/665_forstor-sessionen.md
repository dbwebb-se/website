---
author: mos
revision:
    "2018-09-14": "(A, mos) Första versionen."
...
Förstör sessionen
=======================

Vi tittar hur man förstör en session och dess sessions cookie.



Förstör en session {#destroy}
------------------------

När man jobbar med sessioner så vill man kunna förstöra en session och starta om. Det kan vara ett viktigt utvecklingsverktyg och underlätta felsökningen om man har möjligheten att verkligen förstöra en session och börja om från början.

I manualen för [`session_destroy()`](http://php.net/manual/en/function.session-destroy.php) finns exempelkod för hur man skall förstöra sessionen. Den ser ut så här.

```php
// Initialize the session.
// If you are using session_name("something"), don't forget it now!
session_start();

// Unset all of the session variables.
$_SESSION = array();

// If it's desired to kill the session, also delete the session cookie.
// Note: This will destroy the session, and not just the session data!
if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(session_name(), '', time() - 42000,
        $params["path"], $params["domain"],
        $params["secure"], $params["httponly"]
    );
}

// Finally, destroy the session.
session_destroy();
```

Jag väljer att göra en egen funktion som förstör en session. Min funktion får förutsätta att sessionen redan är startad. Jag har ju mina namngivna sessioner som startas i filen `config.php`. Funktionen ser då ut så här.

```php
/**
 * Destroy a session, the session must be started.
 *
 * @return void
 */
function sessionDestroy()
{
    // Unset all of the session variables.
    $_SESSION = [];

    // If it's desired to kill the session, also delete the session cookie.
    // Note: This will destroy the session, and not just the session data!
    if (ini_get("session.use_cookies")) {
        $params = session_get_cookie_params();
        setcookie(
            session_name(),
            '',
            time() - 42000,
            $params["path"],
            $params["domain"],
            $params["secure"],
            $params["httponly"]
        );
    }

    // Finally, destroy the session.
    session_destroy();
}
```

Jag nöjer mig med att konstatera att manualen säger att denna koden förstör sessionen, och dess session-cookie. Jag bryr mig inte om detaljerna.

Som sagt, möjligheten att förstöra en session på detta vis är bra när man utvecklar och felsöker.
