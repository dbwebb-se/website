---
author: efo
category: javascript
revision:
  "2023-04-03": (B, efo) Uppdaterad för webapp-v5.
  "2018-03-01": (A, efo) Första utgåvan i samband med kursen webapp v3.
...
Lager appen del 6
==================================

[FIGURE src=image/webapp/world-map.jpg?w=c5 class="right"]

Vi ska i denna uppgiften använda oss av Web-API:s för att komma åt native-funktionalitet i våra fysiska mobila enheter. Vi använder en mobil enhets styrka och läggar till funktionalitet för GPS och kartor.



<!--more-->



Förkunskaper {#forkunskaper}
-----------------------
Du har gjort uppgiften [Lager appen del 4](uppgift/lager-appen-del-4). Du har jobbat dig igenom övningarna "[Animationer och övergångar](kunskap/animationer-och-overgangar)" och "[GPS och karta](kunskap/gps-och-karta)".



Introduktion {#intro}
-----------------------

Använd lager [API:t](https://lager.emilfolino.se/v2) dokumentationen och speciellt sektionen om ordrar. Här kan du hämta ut alla ordrar.



Krav {#krav}
-----------------------

1. Använd animationer och övergångar för att efterlikna native applikationer.

1. Skapa en vy i din app med de ordrar som är redo att skickas. Dvs. ordrar med status Packad (200).

1. När man klickar in på ordern får man information om ordern och en karta där paketet ska levereras.

1. Använd GPS för att visa nuvarande position på kartan.

1. Gör det enkelt att testa din app. Ha minst en order med status Packad, som har en adress som fungerar och visas upp med en Geocoder/nominatim.

1. Validera och publicera din kod enligt följande.

```bash
# Ställ dig i kurskatalogen
dbwebb validate lager
dbwebb publish lager
```

Rätta eventuella fel som dyker upp och publicera igen. När det ser grönt ut så är du klar.
