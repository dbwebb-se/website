---
author: nik
category:
    - kurs/design
revision:
    "2020-11-26": (A, nik) Skapad inför HT20.
...
Bygg ett galleri
===================================

I denna uppgift ska ni använda er av er tidigare kunskap inom grid och bygga ett galleri. Ett exempel på ett galleri är profilsidorna på Instagram, som har ett grid som är tre kolumner brett där varje bild har samma bredd som höjd.

[FIGURE src=image/design-v3/barack.png caption="Barack Obama's Instagram"]

Vi behöver inte göra något riktigt så avancerat som Instagram, men vi vill ha ett galleri på sidan som kan visa upp bilder som en blogg eller bilder på olika projekt ni arbetat med.



<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har jobbat igenom artikeln "[Cimage - Hur fungerar det?](kunskap/cimage-hur-fungerar-det)" som går igenom verktyget Cimage.

Du har jobbat igenom artikeln "[Hur kan vi göra bilder och video responsivt?](kunskap/hur-kan-vi-gora-det-responsivt)" som går igenom hur vi kan ladda in bilder på ett responsivt sätt.

Du har jobbat igenom uppgiften "[Bygg en teknologi-sida med CSS-Grid](uppgift/bygg-en-teknologi-sida-css-grid)" där du har skapat ett grid för din teknologi-sida.



Krav {#krav}
-----------------------

Uppgiften är två delad, grid-delen och bildhanterings-delen. Skapa en ny katalog för galleriet i `portfolio/content/gallery.md`. Skapa själv nya template-filer i ditt `theme` om du anser att det behövs.



### Gridet

1. Välj antalet kolumner du vill ha i ditt grid.
    * I desktop ska det vara minst tre kolumner.
    * På mobil ska det vara en kolumn.
2. Varje "box" i gridet ska ladda in en bild.
3. Trycker man på bilden ska man hamna på en sida som visar enbart bilden.
    * Exempel: Bilden längst upp på denna sidan.
4. Sidan skall vara responsiv på samma sätt som er rapport-sida.



### Bilderna

1. Det ska inte finnas dubbletter i gridet.
2. Bildernas storlek ska optimeras med hjälp utav Cimage.
    * Tips: Minska storleken, ändra filformat eller sänk kvalitén.
3. Bilderna ska laddas i minst två olika storlekar med hjälp utav `srcset`.
    * En storlek när gridet har en kolumn i bredd.
    * En storlek när gridet har tre kolumner i bredd.
    * Tips: Cimage kan hjälpa dig med storleken på bilden.
4. När man trycker på bilden (så den öppnas i ny flik) så ska den öppnas i sin ursprungliga storlek. Du behöver inte göra en ny sida per bild, men kan öppna bilden direkt med hjälp av en länk till bilden.
5. Samtliga bilder som används ska du ha rätt att använda.
    * Använd egna bilder eller någon av de tjänster som finns tillgängliga [här](kurser/design-v3/kmom05#var-letar-man).



### Övrigt {#ovrigt}

1. Dina `.scss` filer ska gå igenom lint med hjälp utav `npm run lint`.

1. Dubbelkolla att allt fungerar på studentservern.

1. När du laddat upp till studentservern kan du testköra sidan på mobilen och se så att allt fungerar.



Tips från coachen {#tips}
-----------------------

Lycka till och hojta till i Discord om du behöver hjälp!
