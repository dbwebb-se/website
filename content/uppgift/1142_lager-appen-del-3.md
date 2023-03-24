---
author: efo
category: javascript
revision:
  "2023-03-24": (C, efo) Uppdaterade uppgiften för webapp v5.
  "2019-03-04": (B, efo) Uppdaterade uppgiften för att passa API v2.
  "2018-01-17": (A, efo) Första utgåvan i samband med kursen webapp v3.
...
Lager appen del 3
==================================

[FIGURE src=image/webapp/truck.jpg?w=c5 class="right"]

I detta kursmoment skapar vi ett formulär för inleverans med hjälp av kunskapen från övningarna. Vi använder vår kunskap om att skapa lättanvända formulär för att snabbt kunna göra inleveranser på produkter.



<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har gjort övningen [Ett mobilanpassad formulär](kunskap/ett-mobilanpassad-formular).


Introduktion {#intro}
-----------------------

En inleverans är när lagret får varor levererade och vi ska underlätta för lagerarbetarna att snabbt ta emot varor. I lager [API:t](https://lager.emilfolino.se/v2) finns en datatyp `deliveries` där alla inleveranser ska lagras och dessutom ska du uppdatera lagersaldot för den levererade produkten.



Krav {#krav}
-----------------------

1. Lista alla tidigare inleveranser, om det inte finns inleveranser visa upp ett meddelande om detta.

1. Gör en knapp för 'Ny inleverans' i list-vyn denna ska ta användaren till ett formulär.

1. Använd dina kunskapar i att göra ett lättanvänd formulär där man kan göra inleverans av en produkt.

1. Formuläret ska innehålla alla attribut för en inleverans förutom Leverans ID (id) dvs.:

* Produkt (product_id)
* Antal (amount)
* Leveransdatum (delivery_date)
* Kommentar (comment)

7. När formuläret skickas ska det skapas en inleverans i API:t.

8. Lagersaldot för produkten ska ökas med den levererade mängden.

9. Använd ett `select`-element för att välja produkten som har levererats. Designa `select`-elementet så det passar in i resten av stilen för formuläret.

10. Använd ett `textarea`-element för kommentaren. Designa `textarea`-elementet så det passar in i resten av stilen för formuläret. Använd ett lämpligt standard-värde (default) för textarean.

11. Validera och publicera din kod enligt följande.

```bash
# Ställ dig i kurskatalogen
dbwebb validate lager
dbwebb publish lager
```

Rätta eventuella fel som dyker upp och publicera igen. När det ser grönt ut så är du klar.
