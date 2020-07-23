---
author: lew
revision:
    "2018-06-13": "(A, lew) Första versionen."
...
Header och footer {#header-footer}
=======================

Det finns ett flertal element som kan hjälpa oss med strukturen. Två viktiga element är`<header>` och `<footer>`. Tanken med dem är att de ska hantera innehållet högst upp på sidan respektive längst ner. Du får själv lista ut vilket element som hanterar vad. Vi lägger till dem och ger dem varsin bakgrundsfärg. Samtidigt kan vi ta bort rubrikerna och paragraferna.

##index.html {#index}

```html
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Stormtrooper Murphy</title>
    <link rel="stylesheet" href="style/style.css">
</head>
<body>
    <header></header>
    <h1>I am Stormtrooper Murphy!</h1>
    <p>This is my website.</p>
    <footer></footer>
</body>
</html>
```
Vi lämnar lite text på sidan så länge så se vi vart det hamnar.



##style.css {#style}

För att se våra nya element behöver vi ge dem lite färg och en storlek. Jag väljer att flytta den gula färgen till elementet `<html>`, vilket är hela dokumentet. `<body>` får bli grå. Följande lägger jag in i style.css:

```css
html {
    background-color: #ffc;
}

body {
    background-color: #ddd;
    width: 1000px;
    margin: 8px auto;
}

header {
    width: 1000px;
    height: 100px;
    background-color: red;
}

footer {
    width: 1000px;
    height: 70px;
    background-color: green;
}
```

**background-color** sätter som bekant en bakgrundsfärg på elementet. I `body` och `html` använder jag ett *hexadecimalt* värde. En färg kan representeras av en eller två siffror enligt RGB(Red, Green, Blue) eller som tidigare, av färgens namn. Det finns många färger med fördefinierade namn.

**width** sätter en bredd på elementet. Här använder jag `px` (pixlar).

**margin** talar om hur mycket marginal runt elementet som ska finnas. Värdet `8px auto` är en fix för att få det att hamna i mitten. 8 pixlar uppåt och nedåt samt beräkna vänster och höger automatiskt. Mer om det senare, nu tittar vi hur det ser ut.



##Resultat {#resultat}

Först tittar vi på en skärmdump:

[FIGURE src=/image/htmlphp/guide/murphy/steg2.png?w=w3 caption="Röd header och grön footer."]

Studera gärna resultatet på CodePen. En direktlänk finns uppe till höger i rutan nedan, "Edit on CodePen".

[CODEPEN src=OEQQdw user="dbwebb" tab="html,css" caption="Steg 2 i CodePen."]
