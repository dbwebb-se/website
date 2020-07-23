---
author: lew
revision:
    "2018-06-13": "(A, lew) Första versionen."
...
CSS box model {#boxmodel}
=======================

CSS har en layoutmodell, *boxmodel*, som hittills varit rådande. I och med CSS3 kommer vi att se en annan modell, *flexible boxes*, eller bara [*flexbox*](https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Flexible_boxes). Men, vi kör väljer att använde den traditionella boxmodellen.

Så här kan boxmodel visualiseras.

[FIGURE src=/image/htmlphp/kmom04/image10.png caption="CSS box modell."]

Det handlar alltså om vilka delar en tänkt låda, en box, består av och hur bred den blir när alla dess delar läggs till.

För att ta ett exempel.

Först HTML-kod för en enkel `div`.

```html
<div>This is the content.</div>
```

Sen applicerar vi CSS-kod för att visa hur margin, border, och padding påverkar innehållet i divven.

```css
div {
    width: 400px;
    height: 200px;
    margin: 10px;
    border: 10px solid green;
    padding: 20px;
    outline: 10px dotted blue;
}
```

En `outline` är en ram som inte påverkar layouten hos omgivande dokument, den tar inte upp någon plats, men syns likväl.

Du kan själv [testköra exemplet](/repo/htmlphp/example/css-layout/boxmodel.html) som finns i ditt kursrepo.

Så här ser det ut när jag testkör exemplet.

[YOUTUBE src=EIdh6jXpWtI width=630 caption="Mikael visar hur CSS boxmodell fungerar med dess olika konstruktioner."]

Boxmodellen gäller främst block-element såsom `div`, `header`, `main`, `footer`, `h1`, `p`. Det är element som normalt renderas som en fyrkantig "låda". När det gäller textelement, som `span`, `em`, `strong` så renderas de *inline*, de är främst inline-element. De har samma attribut som boxmodellen visar, men beteer sig aningen annorlunda i hur padding och margin påverkar layouten. Så boxmodellen är enklast att se i block-element och inte i element som är tänkta i flödande text.

Vi kan fördjupa oss i detta vid ett senare tillfälle, just nu räcker det att du är medveten om konceptet boxmodellen och att det är en modell som används när elementen renderas i förhållande till varandra.
