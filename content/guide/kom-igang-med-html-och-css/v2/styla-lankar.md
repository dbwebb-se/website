---
author: lew
revision:
    "2018-06-13": "(A, lew) Första versionen."
...
Styla länkar {#link}
=======================

Länkar är kärnan i HTML och de kan vi styla på olika sätt. En länk har olika lägen, som den normalt visas, *link*, när man håller muspekaren över länken, *hover*, när man klickar på länken, *active* och för länkar som man redan besökt, *visited*.

En plats där det kan vara bra att styla länkarna är navbaren. Där vill man inte att länken ändrar färg beroende av att man besökt den sidan eller inte. En navbar är inte tänkt att fungera så.

Ett sätt att styla länkarna i navbaren kan alltså vara att alltid visa samma färg, så här.

```css
a {
    color: #000;
}
```

Nu blir färgen samma på alla länkar, oavsett vilket läge länken har. I navbaren är det bra, men troligen inte i resten av dokumentet där vi är vara att länkar beteer sig på ett visst sätt.

Om du vill styla de olika varianterna individuellt så anger du CSS-koden så här.

```css
/* for all values */
a {
    text-decoration: none;
}

/* unvisited link */
a:link {
    color: #f00;
}

/* visited link */
a:visited {
    color: #0f0;
}

/* mouse over link */
a:hover {
    color: #f0f;
    text-decoration: underline;
}

/* selected link */
a:active {
    color: #00f;
}
```

Det är viktigt att du stylar länkarna i denna ordningen, *active* måste komma efter *hover* som måste komma efter *link* och *visited*.
