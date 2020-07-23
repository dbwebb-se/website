---
author: lew
revision:
    "2018-06-13": "(A, lew) Första versionen."
...
Styla navbar för nuvarande sida {#current}
=======================

Det kan vara trevligt att visa vilken sida som besökaren är på, då det inte alltid syns tydligt. Sedan tycker Murphy det är snyggt, och det är ju nästan viktigast av allt.



##html koden {#html}
Vi börjar i html-koden där vi har följande navbar att utgå ifrån.

```html
<nav class="navbar">
    <a href="index.html">Home</a>
    <a href="about.html">About</a>
</nav>
```

För att välja ut den länken som är aktiv ger vi den ett klassnamn som antyder att den är vald. Vi lägger till följande i index.html respektive about.html:

```html
<nav class="navbar">
    <a href="index.html" class="selected">Home</a>
    <a href="about.html">About</a>
</nav>
```



##style.css {#style}

Lägger vi nu till CSS-kod så kan vi styla klassen för att ge just detta menyval ett speciellt utseende.

```css
...
.navbar .selected {
    background-color: #000;
    color: #fff;
}
```



##Resultat {#resultat}

I sedvanlig ordning kommer här en skärmdump...

[FIGURE src=/image/htmlphp/guide/murphy/show_selected.png?w=w3 caption="Stylat menyval."]

...och en lekplats i CodePen:

[CODEPEN src=wXYjjX user="dbwebb" tab="html,css" caption="Steg 7 i CodePen."]
