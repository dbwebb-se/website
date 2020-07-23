---
author: lew
revision:
    "2019-03-08": "(A, lew) Första versionen."
...
Logga in med ssh {#ssh}
=======================

Tanken är att du skall kunna logga in på din virtuella maskin från din egen desktop-miljö, via en terminal och ssh.
<!-- Det finns flera sätt att göra det på och jag skall visa dig två av dem. -->



### Nätverk via port forwarding {#pf}

Det handlar om *port forwarding* där du mappar upp en port på din lokala maskin. När den porten får trafik så skickas trafiken vidare till den virtuella maskinen på en viss port. Man *forwardar* trafiken från en port till en annan port (och maskin).

Gör så här. Öppna nätverksinställningarna på din virtuella maskin.

[FIGURE src=/image/linux/portforward.PNG caption="Nätverksinställningar med möjlighet till port forwarding."]

Klicka på knappen "Port Forwarding". Klicka på "+"-knappen och lägg till två regler enligt följande.

| Namn     | Host Port    | Guest Port    |
|----------|:------------:|:-------------:|
| http     | 8080         | 80            |
| ssh      | 2222         | 22            |

[FIGURE src=/image/linux/portforwardrules.PNG caption="Port forwarding för ssh och http."]

Du har nu två regler för port forwarding som säger följande.

1. Trafik till localhost:2222 skickas vidare till den virtuella maskinen port 22.
2. Trafik till localhost:8080 skickas vidare till den virtuella maskinen post 80.

Så här kan det se ut när du använder ssh för att logga in på den virtuella maskinen.

<!-- [ASCIINEMA src=22710] -->

[YOUTUBE src=dQ6Cn8BfHso width=630 caption="Kenneth loggar in via ssh."]

Glöm inte att lösenordet du anger är för den virtuella maskinen.



<!-- ### Alternativ 2: Nätverk via delat nätverkskort {#bridge}

Du kan dela nätverkskortet med *bridged network*, och den virtuella maskinen hämtar sin ip-adress via DHCP. Detta sätt ger den virtuella maskinen en egen ip-adress och den blir åtkomlig i hela ditt nätverk. Detta sättet är lite krångligare och fungerar det med port forward kan du hoppa över detta.

Jag har sammanställt ett foruminlägg som visar stegen du behöver göra för att initiera nätverket med bridged network på den virtuella maskinen, och för att logga in med ssh.

* [VirtualBox, nätverk och gäst OS som server](t/4332)

Det är flera steg och det kan säkert krångla. Om det inte fungerar första gången så gör du om. Räkna med att få göra om och testa ett par gånger.

Detta sättet kan krångla om du inte har koll på ditt lokala nätverk. Till exempel så misslyckas jag med denna lösning när jag är på skolans miljö då jag inte har full koll på hur DHCP är uppsatt. Så, om du är osäker så använder du lösningen med port forwarding istället. -->
