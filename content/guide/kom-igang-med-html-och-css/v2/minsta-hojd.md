---
author: lew
revision:
    "2018-06-13": "(A, lew) Första versionen."
...
Minsta höjd på en sida {#hojd}
=======================

När man har sidor av olika höjd, beroende på att vissa sidor har mer eller mindre innehåll, så är det en god idé att alltid sätta en minsta höjd på en sida. Det ser helt enkelt bättre ut om alla sidor, oavsett innehåll, har en någorlunda höjd.

Det är enkelt gjort med CSS och ett sätt att göra det är att sätta `min-height` på det element som innehåller sidans själva huvudinnehåll. Jag har numer valt att lägga allt innehåll i det element som heter `<main>` och därmed så väljer jag en minsta höjd på mitt `<main>` element.

```css
main {
    min-height: 30em;
}
```

Måttet `em` motsvarar storleken av ett tecken och i utgångsläget är det 16 pixlar stort, men man kan också se på `20em` som 20 rader av text.

Det kan se ut så här.

[YOUTUBE src=rFSVZlGNqbU width=630 caption="Mikael visar hur man sätter minsta höjd på en sida."]
