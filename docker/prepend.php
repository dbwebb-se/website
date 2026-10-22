<?php
// Behind Caddy the container only sees plain http. Anax builds absolute URLs from REQUEST_SCHEME, so take the scheme
// from Caddy's X-Forwarded-Proto (the port is bound to 127.0.0.1, so only Caddy can send it).
if (($_SERVER['HTTP_X_FORWARDED_PROTO'] ?? '') === 'https') {
    $_SERVER['REQUEST_SCHEME'] = 'https';
    $_SERVER['HTTPS'] = 'on';
}
