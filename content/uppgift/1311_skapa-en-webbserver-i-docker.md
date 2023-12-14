---
author: efo
category:
    - moln
revision:
    "2023-12-14": (A, efo) Första utgåvan i samband med kursen moln.
...
Skapa en webbserver i Docker
==================================

Du har installerat och bekantat dig med Docker enligt [Docker-guiden](guide/docker). Nu ska vi använda Docker som en lokal webbserver på vår egna dator, ungefär så som det fungerar i molnet.



<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har installerat en labbmiljö motsvarande "[Installera labbmiljön](moln/labbmiljo)". Du har jobbat igenom de relevanta delarna av [Docker-guiden](guide/docker).



Introduktion {#intro}
-----------------------

Se till att spara alla filer i en katalog som du skapar på din dator. De används för att redovisa uppgiften.

I [detta steget i Docker-guiden](https://dbwebb.se/guide/docker/skapa-namnbaserad-virtuell-host#namn) kan du lägga in följande innehåll i [`index.html`-filen](https://raw.githubusercontent.com/dbwebb-se/moln/main/index.html) i stället för kommandot `echo "<h1>It's working</h1>" > me.vlinux.se/index.html`. Spara alla filerna i din katalog som du skapade ovan.



Krav {#krav}
-----------------------

1. Installera Docker och skapa en Dockerfile enligt [Kopiera in och aktivera hosten](guide/docker/skapa-namnbaserad-virtuell-host#copy-host).

1. Starta containern enligt [guide](guide/docker/skapa-namnbaserad-virtuell-host#start-container).

1. Se till att [simulera ett hostnamn](guide/docker/simulera-hostnamn) enligt guiden.

1. Ta en skärmdump på hela din webbläsare där du visar din `index.html` fil från Docker-webbservern via `http://me.vlinux.se:8080`. Döp filen till `dump.png`.

1. Lägg till `Dockerfile` och `dump.png` som en del av din/eran inlämning i Canvas.



Tips från coachen {#tips}
-----------------------

Stressa inte. Kör det ihop sig så är det en bra taktik att börja om från början och göra om. Det går snabbare andra gången, och ännu snabbare tredje gången.

Lycka till och hojta till i forumet om du behöver hjälp!
