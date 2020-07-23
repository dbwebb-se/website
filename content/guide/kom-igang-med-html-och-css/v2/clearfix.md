---
author: lew
revision:
    "2018-06-13": "(A, lew) Första versionen."
...
Clear fix med `overflow:auto` {#clearfix}
=======================

Den "defekt" som du såg i *clear float*, det finns en liknande som kan se ungefär likadan ut, men löses på ett annat sätt. Det är något som kallas för en [clearfix](http://stackoverflow.com/questions/8554043/what-is-clearfix).

Behovet av en sådan clearfix är för att flytande element inte påverkar den omslutande kontainerns höjd. Den omslutande kontainern/elementet, som innehåller det flytande elementet, har alltså ingen koll på hur högt det det är. 

För att visa vad jag menar så finns det ett exempelprogram i ditt kursrepo, `example/clearfix`, du kan [testköra det här utan fixen](/repo/htmlphp/example/clearfix/clear-no.html) och [här med fixen](/repo/htmlphp/example/clearfix/clear.html).

Min fix är att använda CSS-konstruktionen `overflow: auto` för att tvinga en omritning av elementet så att det lär känna sin rätta höjd.

Se när Mikael testar exemplet.

[YOUTUBE src=BhPxWRkvc74 width=630 caption="Mikael visar hur clearfix med overflow auto fungerar."]

Alltså, clear float och cleafix, två vanliga lösningar på problem som uppträder med layouten när float används.
