---
author: lew
revision:
    "2018-06-13": "(A, lew) Första versionen."
...
En bild som bakgrund {#bild-som-bakgrund}
=======================

Murphy vill gärna ha med sitt favoritskepp i bakgrunden. Det är ändå där som en större del av livet har spenderats. Vi letade upp en gammal bild som passade bra och sparade den i mappen `img`:

[FIGURE src=/image/htmlphp/guide/murphy/background.jpg?w=w3 caption="Trade Federation Battleship."]

##style.css {#style}

Vi behöver inte röra html-koden för att lägga till en bakgrundsbild, utan vi styr det via css:

```css
html {
    background-image: url("../img/background.jpg");
    background-attachment: fixed;
    background-position: bottom right;
    background-repeat: no-repeat;
    background-color: black;
    overflow-y: scroll;
}
```

Här sätter jag **background-color** då den svarta färgen får täcka upp där bilden inte är.

**background-image** används för att sätta en bakgrundsbild till ett element. Vi väljer html-elementet då bilden ska vara över hela dokumentet. Värdet är en funktion som vill ha sökvägen till bilden.

**background-attachment** talar om hur bilden ska förhålla sig till sitt omslutande element - sitta fast eller följa med när man scrollar. Jag valde att bakgrunden ska sitta fast med `fixed`.

Med **background-position** kan man styra var bilden ska placeras. `bottom right` är som det låter: nere till höger. Det går även att placera bilden `center`, `top` och `left`. Vill man detaljstyra så går det även bra med procent, till exempel `background-position: 25% 75%;` placerar bilden 25% från vänster och 75% från toppen.

**background-repeat** används för att styra om bilden ska upprepas eller endast ritas ut en gång. Att upprepa bilden kan vara av intresse om man har en liten mönstrad bild som ska täcka hela bakgrunden.



##Resultat {#resultat}

Vi lämnar bilden som den är och tittar på hur det blev:

[FIGURE src=/image/htmlphp/guide/murphy/background1.png?w=w3 caption="En bakgrundsbild."]

Lek gärna och testa flytta runt bilden i CodePen:

[CODEPEN src=rKQyaQ user="dbwebb" tab="html,css" caption="Steg 8 i CodePen."]
