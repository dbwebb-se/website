---
author: lew
revision:
    "2018-06-13": "(A, lew) Första versionen."
...
Font {#font}
=======================

Texten på sidan är i nuläget default. Det kan ju vara en fördel om den sticker ut lite så jag väljer att hoppa in på [https://fonts.google.com/](https://fonts.google.com/) och se om jag kan hitta någon annan bra font.



##Importera font {#importera-font}

Jag hittade en font, *Fjalla One* som jag vill använda. Jag väljer den och får då reda på att det finns två sätt att använda den. Egentligen tre sätt om man vill ladda ner den. Ena sättet är att importera fonten via css:

style.css:
```css
@import url('https://fonts.googleapis.com/css?family=Fjalla+One');
```

Det andra sättet är att bädda in den i html-koden och länka in den likadant som med stylesheeten. Samma förfarande fungerar om man har fonten lokalt:

index.html och about.html:
```html
<link href="https://fonts.googleapis.com/css?family=Fjalla+One" rel="stylesheet">
```

När man vill använda den sedan väljer man ut fonten med css-egenskapen **font-family**. Om man vill använda i hela dokumentet:

```css
html {
    font-family: "Fjalla One", sans-serif;
}
```

Jag väljer att bädda in den i html-koden (embed). Jag ändrar lite på storleken på texten i headern med då fonter tar olika mycket plats. Bylinen behövde också **clear: both;** för att stänga av floaten från bilden



##Resultat {#resultat}

Resultatet med den nya fonten blev så här:

[FIGURE src=/image/htmlphp/guide/murphy/font.png?w=w3 caption="Ny font!"]

För att det ska fungera i CodePen behöver jag importera fonten istället i css-filen med `@import()`, då head-elementet inte är med där. Studera exemplet:

[CODEPEN src=XYopVz user="dbwebb" tab="html,css" caption="Steg 11 i CodePen."]
