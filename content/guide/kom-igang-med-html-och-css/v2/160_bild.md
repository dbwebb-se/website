---
author: lew
revision:
    "2018-06-13": "(A, lew) Första versionen."
...
Bild {#bild}
=======================

Som tur är hade Murphy ett gammalt klassfoto som passade bra till webbplatsen. Som tidigare nämnt är det `<img>`-taggen som talar om att det är en bild som ska laddas in.

Som vanligt börjar vi med att markera i html-koden.



##index.html {#index}

```html
...
<h1>I am Stormtrooper Murphy!</h1>
<p>This is my website.</p>
<img src="img/murphy-me.jpg" alt="This is me!" class="me">
...
```

Om vi bara låter det vara så och laddar om sidan blir det lite tokigt:

[FIGURE src=/image/htmlphp/guide/murphy/big_image.png?w=w3 caption="Alldeles för stor bild."]

Om vi genast kastar oss till CSS-filen kan vi lösa problemet med den gigantiska bilden. Ett bra tips är att fundera på hur stor en bild egentligen behöver vara innan man använder den på en webbplats. Stora bilder tar gärna lite längre tid att ladda in och kräver mer data, till exempel mobilsurf.



##style.css {#style}

```css
...
.me {
    width: 400px;
}
```

Egenskapen **width** ger elementet en bestämd bredd. I detta fallet en bredd på 400 pixlar på elementen med klassnamnet `.me` helt enkelt. Ett snabbt tryck på tangenten F5 kan vi ladda om webbläsaren och se förändringen:

[FIGURE src=/image/htmlphp/guide/murphy/normal_image.png?w=w3 caption="Mycket bättre."]
