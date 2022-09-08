---
author: lew
revision:
  "2020-03-11": "(A, lew) Första versionen."
...

## Simulera ett hostnamn för servern {#dns}

Du har nu en virtuell host som kommer svara så fort den får ett anrop på namnet _me.vlinux.se_. Vad du behöver göra är att peka domännmamnet på serverns ipadress.

Normalt gör vi detta med DNS. Vi lägger så att maskinens namn kopplas mot en ipadress och DNS:en håller koll så vi hamnar på rätt plats. Om du gör detta exemplet och har en server ute på nätet, så använder du DNS:en för att den skall hamna rätt.

Men nu har vi en utvecklingsmiljö med en server i Docker som använder en mappad port till den lokala miljön. Vi behöver alltså sätta upp lokalt, i vårt eget nätverk, att maskinen me.vlinux.se känns igen som 127.0.0.1 och hamnar i min server som snurrar i en container.

I mitt fall, så kommer jag åt webbservern, på min server, via adressen `http://localhost:8080`. Jag kan nu lägga till ett entry i min egen fil för datornamn. Filen heter `/etc/hosts`, i min lokala miljö, och jag lägger till ett nytt lokalt datornamn i filen så här.

```text
sudo nano /etc/hosts
```

Följande rad lägger du till i filen.

```text
127.0.0.1   me.vlinux.se
```

På en klient med MacOS gör du på samma sätt.

Sitter du på Windows så heter filen följande. Glöm inte att du måste vara administratör för att redigera filen. Du kan till exempel starta VSCode som administratör och sedan öppna filen.

```text
C:\Windows\system32\drivers\etc\hosts
```

Nu kan jag komma åt den lokala maskinen via namnet istället. Adressen `http://me.vlinux.se:8080` är numer samma som att skriva `http://localhost:8080` eller `http://127.0.0.1:8080`. Det är precis detta som Apache tittar på när den identifierar den namnbaserade virtuella hosten.

När jag nu använder `http://me.vlinux.se:8080` så kommer jag till Apache som identifierar namnet som en virtuell host och använder den DocumentRoot som är specificerad.

Klart. Magiskt. Så vida det inte strular förstås. Då får man felsöka och göra om - göra rätt. Det är en hård värld vi lever i.

## Avslutningsvis {#avslutning}

Namnbaserade virtuall hostar med Apache är ett bra sätt att köra flera webbplatser på en server. Det är också ett bra sätt att köra en utvecklingsserver med många webbplatser.

När man nu, som vi gjort, kombinerar detta med servar i Docker, så får du en möjlighet att köra många webbplatser och att köra dem på många olika servrar som kan vara konfigurerade på olika sätt. Det kan vara ett kraftfullt verktyg för en webbprogrammerare.

<!-- Om du stöter på problem så kan du alltid fråga i forumet. Det finns en egen tråd om [Apache Name-based Virtual Hosts](t/4341). -->
