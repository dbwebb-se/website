---
sectionHeader: true
linkable: true
...
Grunderna {#grunderna}
=======================

###HTML {#html}

HTML står för *HyperText Markup Language* och är ett standardspråk när man skapar webbsidor. Man kan säga att man med hjälp av HTML markerar strukturen av en webbsida med hjälp av HTML element. Elementen beskrivs i sin tur av "HTML taggar" (HTML tags), en start tagg `<element>` och en slut tagg `</element>`. Webbläsaren renderar inte taggarna utan använder dem för att strukturera dess innehåll.



###CSS {#css}

CSS står för *Cascading Style Sheets* och beskriver hur HTML elementen ska se ut på skärmen. CSS består huvudsakligen av fyra delar:  

* selektorer (selectors)
* deklareringar (declarations)
* egenskaper (properties)
* värden (values)

```css
div {
    background-color: #ccc;
    border: 1px solid black;
}
```

Ovan kodstycke visar CSS-regler som gäller för alla element av typen `div`. Reglerna består av selektorn `div` med deklareringarna är `background-color: #ccc;` och `border: 1px solid black;`. Deklareringar är sammansättningen av egenskaperna och värdena. Egenskaperna är då `background-color` och `border` med respektive värden `#ccc` och `1px solid black`. Resultatet blir att alla element av typen `div` har en ljusgrå bakgrund och en svart ram, som är 1px bred.  

Vi skapar vår första HTML-fil.
