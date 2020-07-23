---
author: lew
revision:
    "2018-06-13": "(A, lew) Första versionen."
...
Footer {#footer}
=======================

Footern behöver lite justeringar då Murphy inte ville ha den grön. Vi tar bort färgen och lägger till lite luft ovan. Vi ger footern ett klassnamn i index.html och uppdaterar sedan stylen i css-filen:

index.html:

```html
...
<footer class="site-footer">
...
```
style.css:

```css
...
.site-footer {
    height: 70px;
    margin-top: 20px;
}
```

Selektorn **footer** är borttagen och ersatt av elementets klassnamn. Footern har nu 20 pixlar luft ovan sig och ingen bakgrundsfärg. Höjden på 70 pixlar kan vara kvar.

Vi sparar och laddar om sidan:

[FIGURE src=/image/htmlphp/guide/murphy/styled_footer.png?w=w3 caption="Footer med ytterst lite style."]

Det ser lite tomt ut i sidans `<body>`. Vi lägger till en bild till på Murphy.
