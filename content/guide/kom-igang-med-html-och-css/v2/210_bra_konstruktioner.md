---
author: lew
revision:
    "2018-06-13": "(A, lew) Första versionen."
...
Några bra konstruktioner {#bra-konstruktioner}
=======================

För att göra webbplatsen lite stabilare så den beter sig som vi vill i de flesta lägen lägger vi till några CSS-konstruktioner.



##Scrollbar {#scrollbar}

Om vi till exempel hade tagit bort innehållet i about.html hade den blivit "kortare" än index.html. Ett resultat av det hade vart att sidan "hoppar till" när man skiftar mellan sidorna då det duker upp en scrollbar till höger i webbläsaren som tar upp en viss plats. För att vi ska vara säkra på att det inte händer kan vi se till så vi alltid har en scrollbar med konstruktionen `overflow-y: scroll;`. Vi lägger till det i CSS-filen:

```css
html {
    ...
    overflow-y: scroll;
}
```

**overflow-y** styr vad som ska hända med innehållet om det växer sig större än det omslutande elementet vertikalt. Det går även att styra horistontellt med **overflow-x**.



##Sidans höjd {#sidans-hojd}

Om vi inte hade haft innehållet i about.html, eller bara lite innehåll, hoppar sidan till horisontellt och footern hamnar inte i nederkant. För att se till så det inte händer kan vi sätta en minsta höjd på `<main>`-elementet:

```css
main {
    min-height: 30em;
}
```

**min-height** sätter som sagt en minsta höjd på elementet. Det går även att sätta en max-höjd med **max-height**. För att justera bredden kan vi använda motsvarande **min-width** och **max-width**.



##Gradient {#gradient}

En enfärgad bakgrund är inte så rolig. Förutom bakgrundsbilder har vi även *gradients* att tillgå. Gradient är en typ av bild som stegvis skiftar mellan två eller fler färger. Vi testar att lägga till det som bakgrund:

```css
html {
    background: linear-gradient(to bottom right, #000, #ffc);
    ...
}
```

Vi kan se att gradient jobbar på egenskapen **background**. Värdet, eller funktionen **linear-gradient(to bottom right, #000, #ccc);** skapar en bakgrund som startar uppe till vänster och skiftar från svart till gul, jämnt fördelat. Om vi lagt till fler färger blir det fler brytpunkter.



##Resultat {#resultat}

Med dessa delar implementerade, kikar vi på hur resultatet blev:

[FIGURE src=/image/htmlphp/guide/murphy/bra-konstruktioner.png?w=w3 caption="Gradient, minsta höjd och scrollbar."]

Testa gärna i exemplet i CodePen:

[CODEPEN src=XYxMwd user="dbwebb" tab="html,css" caption="Steg 5 i CodePen."]
