---
author: efo
revision:
    "2018-10-02": "(A, efo) Första versionen."
...
Grund
=======================

Vi vill alltid ha en bra grund att stå på när vi ska göra bra läsbara och användbara hemsidor. Så vi baserar vår grund på öppen källkods projektet [Typography Handbook](http://web.archive.org/web/20220317080753/https://typographyhandbook.com/). Under sektionen Relative Units finns följande grund för typsnitt på webben.

```css
html {
    font-size: 100%;
}

p {
    font-size: 1em;
}

@media (min-width: 64em) {
  html {
    font-size: 112.5%;
  }
}
```

Vi börjar med att sätta `font-size: 100%;` för rot-elementet `html` för att inte skriva över användarens typsnittsinställningar i webbläsaren. Kombinationen `font-size: 100%;` för `html` och `font-size: 1em;` för alla `p`
element leder i de flesta fallen till att vi har storleken `16px`.
