---
author: lew
revision:
    "2018-06-13": "(A, lew) Första versionen."
...
Responsiv webbplats {#responsiv}
=======================

Murphy har hört talas om responsiva webbplatser och undrade lite vad det är och om det går att lösa. Övriga nyckelkoncept som hörs i sammanhanget är *responsiv webbdesign* och *mobile first*. Vi tar några steg i den riktningen och går igenom det. Det hela handlar om hur webbplatsen beter sig om man surfar in via en mobil enhet, till exempel en telefon eller surfplatta.



##html koden {#html-koden}

Först berättar vi för enheten som besöker vår webbplats att den skall använda sin egen bredd för att visa sidan, den skall inte låtsas att den är större än den verkligen är.

```html
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=2.0;">
</head>
```

En webbläsares **viewport** är det området där innehållet kan visas. En fullt renderad sida kan resultera i att användaren behöver scrolla för att se mer. Det är med andra ord inte samma område som dess viewport.

Vi kan se att attributet **content** har egenskaper och värden.

**width=device-width;** talar om att bredden ska vara så bred som den använda enhetens skärm är.

**initial-scale=1.0;** talar om hur sidan ska zoomas när den laddas in.

**maximum-scale=2.0;** talar om hur mycket användaren får zooma.



##style.css {#style}

Nästa steg är att lägga till en media-fråga, en *media-query*, för att ändra sidans utseende på små skärmar.

```css
/**
 * responsive
 */
@media (max-width: 980px) {
    body {
        width: auto;
        background-color: yellow;
    }
}
```

**@media () {...}** är en så kallad *media-query*. Den säger att om bredden på webbläsaren är mindre än 980 pixlar så skall CSS-konstruktionen som följer gälla.

I de flesta webbläsare kan man simulera hur en sida ser ut i en uppsättning mobila enheter. Antingen kan man högerklicka, och välja "inspektera element" eller helt enkelt trycka på tangenten `F12`. Överst i rutan som dyker upp hittar man en knapp, "Responsive design mode" eller liknande. Testa, lek och lär. Lägg `F12` på minnet då det är ett väldigt kraftfullt verktyg vid utveckling mot både webbläsaren och mobila enheter.

Så här ser det ut när webbplatsen visas i en iPhone i porträttläge i Firefox.

[FIGURE src=/image/htmlphp/guide/murphy/iphone_portrait1.png?w=w3 caption="index.html visas i porträttläge för iPhone 6s."]



##Resultat {#resultat}

Vi jobbar mer med vår media-query och ändrar utseendet för mobilt läge. Lite jobb kan få sidan att renderas så här:

[FIGURE src=/image/htmlphp/guide/murphy/iphone_portrait2.png?w=w3 caption="En mer genomjobbad style."]

Testa gärna att ändra stylen för mobilt läge på CodePen. Ändra storlek på fönstret eller använd dev-tools för att se skillnaden.

[CODEPEN src=EReoRg user="dbwebb" tab="html,css" caption="Steg 6 i CodePen."]
