---
author: mos
revision:
    "2018-09-07": "(A, mos) Första versionen."
...
Om HTML formulär och PHP
=======================

HTML formulär är en samling html-element som låter användaren fylla i saker på webbsidan och posta dessa till servern.

På serversidan kan du sedan ta emot det postade resultatet och hantera det med php.

Vi inleder med ett större exempel som du kan leka runt i och testa, glöm inte att kika på källkoden för exemplet.



Ett exempel {#xempel}
------------------------

Det finns många olika formulärelement, du kan se en översikt av [några av de vanligaste på sidan Forms!](forms).

För att visa hur html-formulär fungerar tillsammans med php så har jag ett exempel. Källkoden till exemplet ligger i kursrepot htmlph under [example/html-form](https://github.com/dbwebb-se/htmlphp/tree/master/example/html-form).

Så här ser exemplet ut.

[FIGURE src=image/snapht18/htmlform-intro.png?w=w3 caption="Ett exempelprogram för html-formulär."]

Tanken med exemplet är att visa upp ett olika steg i skapandet av formuläret och hur det postade formuläret kan hanteras.

Så här ser bas-formuläret ut.

[FIGURE src=image/snapht18/htmlform-base.png?w=w3 caption="Ett enkelt html-formulär."]

Tanken är att det skall renderas ett visitkort, baserat på den informationen som användaren har postat.

Här är det renderade "visitkortet".

[FIGURE src=image/snapht18/htmlform-card.png?w=w3 caption="Värden i det postade formuläret används till att rendera ett visitkort."]

Vi skall inte kika på html-delen så mycket, eller alla variationer av formulärelement som finns, vi fokuserar på php-delen av koden och hur vi kan bearbeta formuläret och hur vi kan få de postade värdena att hamna i rätt php-skript.
