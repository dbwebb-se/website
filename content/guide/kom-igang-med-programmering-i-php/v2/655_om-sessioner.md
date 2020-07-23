---
author: mos
revision:
    "2018-09-13": "(A, mos) Första versionen."
...
Om Sessioner
=======================

Sessioner ger webbplatsen ett minne, de gör det möjligt att komma ihåg information mellan sidladdningar. Man kan till exempel låta en användare logga in och sedan minnas vilken användare man visar en sida för och göra den mer personlig.

Låt oss se hur man jobbar med sessionen i php.



HTTP protokollet stateless {#stateless}
------------------------

Protokollet för http-trafik, det som gör att webbläsaren kan kommunicera med webbservern, är _stateless_. Det innebär att varje request är helt skild från en annan och varje request måsta vara en komplett request och ett komplett response. Webbservern kan via protokollet inte koppla en händelse till en annan, de är isolerade från varandra.

Det finns alltså på protokollnivå inget inbyggt minne som låter webbplatsen komma ihåg att vi varit där och att vi loggat in.




Cookies ger minne {#cookies}
------------------------

För att ge möjligheten att minnas saker mellan varje sidanrop så används något som kallas _cookies_. Det är små värden, kopplade till en nyckel, som skickas med http requesten från webbservern (om de är definierade), och sedan från webbläsaren tillbaka till webbservern i nästa response.

Via dessa cookies, som skickas fram och tillbaka, kan alltså skapas ett minne i webbplatsen. Vi säger att protokollet är stateless men på appliaktionsnivå, när vi använder protokollet, så har vi skapat en möjlighet till minne, via cookies.


Sessioner i PHP {#php}
------------------------

I php finns en hantering av sessioner inbyggt. Man namnger, startar och kan förstöra en session och dess sessionscookie.

Alla värden som lagras i den inbyggda och globala arrayen `$_SESSION` kan minnas mellan sidanrop.

Låt oss se exempel på hur detta fungerar.
