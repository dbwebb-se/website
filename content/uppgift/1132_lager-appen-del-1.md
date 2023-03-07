---
author: efo
category: javascript
revision:
  "2023-03-02": (B, efo) Första utgåvan i samband med kursen webapp v5.
  "2018-01-10": (A, efo) Första utgåvan i samband med kursen webapp v3.
...
Lager appen del 1
==================================

[FIGURE src=image/webapp/warehouse.jpg?w=c5 class="right"]

I denna uppgift skapar du grunden för en lager-app, du använder dina kunskaper från övningar och kurslitteratur för att skapa en SPA som är tillgängliga och användbar. Du hämtar JSON data från ett befintligt REST API och i denna första del ligger fokus på navigation och en enkel listning av produkter.



<!--more-->



Förkunskaper {#forkunskaper}
-----------------------
Du har jobbat igenom övningarna "[Web Components](kunskap/web-components)", "[Introduktion till Lager-API:t](kunskap/introduktion-till-lager-api)" och "[Typografi i mobila enheter](kunskap/typografi-i-mobila-enheter)".



Introduktion {#intro}
-----------------------
Du har blivit kontaktat av företaget Infinity Warehouses då ryktet går på stan att du har koll på mobila applikationer. Infinity Warehouses vill ta steget in i 2000-talet och automatisera deras gamla omoderna lagerhanteringssystem. Infinity Warehouses har tidigare anställd en backend programmerare, men när hen hörde orden design, användbarhet och tillgänglighet sprang hen skrikande bort. Backend programmeraren hade dock hunnit skapa ett REST API innan hen försvann ner i serverrummet. [Dokumentationen för API:t](https://lager.emilfolino.se/v2) hjälper dig en bit på vägen.

I "[Introduktion till Lager-API:t](kunskap/introduktion-till-lager-api)" har du skapat en API-nyckel och kopierat, alternativt skapat egna produkter.



Krav {#krav}
-----------------------
1. Skapa en webbapplikation anpassad för mobilen.

1. Appen ska innehålla en lagerförteckningslista där produkterna listas med namn, lagersaldo och lagerplats.

1. Validera och publicera din kod enligt följande.

```bash
# Ställ dig i kurskatalogen
dbwebb validate lager1
dbwebb publish lager1
```

Rätta eventuella fel som dyker upp och publicera igen. När det ser grönt ut så är du klar.



Extrauppgift {#extra}
-----------------------
Det finns inga extrauppgifter.



Tips från coachen {#tips}
-----------------------

Validera och publicera ofta. Så slipper du en massa validerings- och publiceringsfel i slutet av övningen.

När du gör *publish* så körs även *validate*. Blir det för mycket fel när du kör *publish* så kan det bli enklare att bara göra *validate* till att börja med.

Lycka till och hojta till i forumet om du behöver hjälp!
