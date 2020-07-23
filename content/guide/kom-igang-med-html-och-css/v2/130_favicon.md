---
author: lew
revision:
    "2018-06-13": "(A, lew) Första versionen."
...
Favicon {#favicon}
=======================

Murphy fick höra att det fanns något som kallas *favicon*. En säker källa påstådde att det är en liten bild som syns i webbläsarens flik. Ja, källan hade helt rätt. Vi lägger genast till en sådan.

Den här lilla bilden laddas in på ett sätt likt en stylesheet, med `<link rel="...">` i sidans `<head>`-element.

```html
    <link rel='shortcut icon' href='img/favicon.png'/>
</head>
```

Sedan laddar du om och kan se ikonen, *faviconen*, i webbläsarens flik.

[FIGURE src=/image/htmlphp/guide/murphy/show_favicon.png?w=w3 caption="En favicon!."]

Formatet för en favicon är från början filformatet ICO, men de flesta webbläsare klarar även vanliga PNG-bilder. Ett tips är att inte ladda in en för stor bild, då den ändå kommer förminskas. Ett bra mått är 32x32px.
