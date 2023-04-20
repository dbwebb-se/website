---
author: efo
category: javascript
revision:
  "2023-04-03": (B, efo) Uppdaterad för webapp-v5.
  "2018-03-01": (A, efo) Första utgåvan i samband med kursen webapp v3.
...
Lager appen del 6
==================================

[FIGURE src=image/webapp/Leica_M9.jpg?w=c5 class="right"]

Vi ska i denna uppgiften använda oss av ytterligare ett Web-API för att komma åt native-funktionalitet i våra fysiska mobila enheter. Vi använder en mobil enhets styrka och läggar till funktionalitet för att ta bilder och skicka till ett foto API.



<!--more-->



Förkunskaper {#forkunskaper}
-----------------------
Du har gjort uppgiften [Lager appen del 5](uppgift/lager-appen-del-6). Du har jobbat dig igenom övningarna "[Kamera i mobilen](kunskap/kamera-i-mobilen)".



Introduktion {#intro}
-----------------------

Använd lager [API:t](https://lager.emilfolino.se/v2) dokumentationen och speciellt sektionen om ordrar.



Krav {#krav}
-----------------------

1. Lägg till möjligheten att ta ett foto när paketet levererats i order-vyn med kartan.

1. När du har tagit ett kort ska det laddas upp till Foto-API tjänsten beskrivit i "[Kamera i mobilen](kunskap/kamera-i-mobilen)".

1. När bilden har laddats upp ska order-status ändras till status **Skickad (400)**.

1. Gör det enkelt att testa din app. Ha minst en order med status Packad.

1. Validera och publicera din kod enligt följande.

```bash
# Ställ dig i kurskatalogen
dbwebb validate lager
dbwebb publish lager
```

Rätta eventuella fel som dyker upp och publicera igen. När det ser grönt ut så är du klar.
