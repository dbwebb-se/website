---
author: lew
revision:
    "2018-06-13": "(A, lew) Första versionen."
...
CSS {#css}
=======================

Sidan är väldigt tom och vit så vi behöver lite färg som kan hjälpa oss att strukturera den. Jag skapar en mapp och döper den till `style`. I den mappen lägger jag en ny fil med namnet `style.css`. Tanken är att vi i den här filen definierar all style för sidan. För att vår HTML-sida ska känna till CSS-filen behöver vi länka till den och tala om att vi vill använda den som *stylesheet*.

Vi lägger till följande rad i `<head>`-taggen i index.html:

```html
<link rel="stylesheet" href="style/style.css">
```

Vi har nu länkat in CSS-filen (stylesheet) till webbsidan.

**&lt;link&gt;**-taggen definierar en länk mellan dokumentet och en extern resurs.

Attributet `rel` skapar en relation mellan index.html och style.css. Magiskt.


Det finns fortfarande ingen style i filen så vi börjar med att göra hela bakgrunden gulaktig.

I style.css:

```css
body {
    background-color: #fcc;
}
```

**body** är i detta fallet selektorn som väljer ut vilket element som ska ha efterkommande style.

**background-color: #ffc;** talar om att bodyn ska ha en gulaktig färg. Vi går igenom färger lite senare.

Filen `index.html` ser i nuläget ut som följer:

```html
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Stormtrooper Murphy</title>
    <link rel="stylesheet" href="style/style.css">
</head>
<body>

</body>
</html>
```

Om du följer med och kodar kan du testa att ladda om sidan i webbläsaren och se en grå bakgrund. Vi springer vidare och lägger till mer innehåll!
