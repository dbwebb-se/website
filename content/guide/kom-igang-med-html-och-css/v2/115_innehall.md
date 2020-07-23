---
author: lew
revision:
    "2018-06-13": "(A, lew) Första versionen."
...
Innehåll {#innehall}
=======================

En sida utan innehåll är inte så rolig. Vi undersöker hur vi får fram lite text på sidan. Vi börjar med att lägga till lite text och ser vad vi kan göra med det.



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
    <h1>Det här är en rubrik i elementet h1</h1>
    <h2>Det här är en rubrik i elementet h2</h2>
    <h3>Det här är en rubrik i elementet h3</h3>
    <h4>Det här är en rubrik i elementet h4</h4>
    <h5>Det här är en rubrik i elementet h5</h5>
    <h6>Det här är en rubrik i elementet h6</h6>
    <p>Den här texten är i en paragraf.</p>
    <p>Det är en paragraf till. Paragrafer är bra för att dela in text i stycken.</p>
</body>
</html>
```

**&lt;h1&gt; - &lt;h6&gt;** representerar rubriker i fallande storlek. Både rubriker och paragrafer (`<p>`) har en default-style kopplad till sig. Man får automatiskt lite luft över och under dem. Bra att ha koll på.



##style.css {#style}

Vi går över till CSS-filen och ger texten lite style:

```css
body {
    background-color: #ffc;
    width: 1000px;
    margin: 0 auto;
}

h1 {
    text-align: center;
    color: red;
}

p {
    border: 1px solid brown;
    color: #00f;
}
```

**text-align** ger oss möjligheten att positionera texten till viss del. Ett värde är `center` som konstigt nog placerar texten i mitten av elementet.  

**color** definierar färgen på texten i elementet. Om man inte sätter ett värde blir färgen svart.

**border** ger elementet en ram. I det här fallet en helfärgad brun ram, med en bredd på 1 pixel.


##Resultat {#steg1-resultat}

Här ser du resultatet i form av en skärmdump och en [CodePen](https://codepen.io). CodePen är ett bra verktyg för att visa upp kodsnuttar.

[FIGURE src=/image/htmlphp/guide/murphy/steg1.png?w=w3 caption="Skärmdump av fin, stylad text. En bra start."]

[CODEPEN src=aKErbo user="dbwebb" tab="css,result" caption="Steg 1 i CodePen."]
