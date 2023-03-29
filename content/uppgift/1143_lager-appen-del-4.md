---
author: efo
category: javascript
revision:
  "2023-03-28": (B, efo) Uppdatering i samband med webapp-v5.
  "2018-02-12": (A, efo) Första utgåvan i samband med kursen webapp v3.
...
Lager appen del 4
==================================

[FIGURE src=image/webapp/money.jpeg?w=c5 class="right"]

I kursmoment 3 arbetade vi med formulär. Vi ska i denna uppgift skapa delar av appen som är skyddad med hjälp av JWT. I den skyddade delen ska det vara möjligt att se tidigare fakturor och skicka nya.



<!--more-->



Förkunskaper {#forkunskaper}
-----------------------
Du har gjort uppgiften [Lager appen del 3](uppgift/lager-appen-del-3). Du har jobbat dig igenom övningarna [Tabeller i mobila enheter](kunskap/tabeller-i-mobila-enheter) och [Login med JWT](kunskap/login-med-jwt).



Introduktion {#intro}
-----------------------

Använd lager [API:t](https://lager.emilfolino.se/v2) dokumentationen och speciellt sektionen om invoices. Här kan du hämta ut alla invoices och skapa nya.



Krav {#krav}
-----------------------

1. Skapa ett formulär för att kunna registrera och logga in som en användare i Lager appen.

1. Bakom de skyddade delarna ska faktura vyerna ligga.

1. Skapa ett formulär för att göra om en order till en faktura. Ändra orderns status till 'fakturerad' enligt API:t.

1. Det ska inte gå att fakturera en order två gånger.

1. Skapa en tabell med information om befintliga fakturor, välj själv vilken information som ska finnas.

1. Tabellen ska fungera på alla enheter, gör ett medvetet val av design.

1. Din app måste innehålla en CSP, som bara tillåter precis det som behövs hämtas för att undvika XSS-attacker och liknande.

1. Validera och publicera din kod enligt följande.

```bash
# Ställ dig i kurskatalogen
dbwebb validate lager
dbwebb publish lager
```

Rätta eventuella fel som dyker upp och publicera igen. När det ser grönt ut så är du klar.



Extrauppgift {#extra}
-----------------------

* Lägg till felmeddelanden i registrerings/inloggnings-formuläret för användaren får en förståelse för vad som blev fel.
