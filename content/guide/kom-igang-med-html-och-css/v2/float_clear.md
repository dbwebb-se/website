---
author: lew
revision:
    "2018-06-13": "(A, lew) Första versionen."
...
Float och clear {#float}
=======================

Om du studerar föregående del så ser du att bilden flyter till vänster om texten. Det är en CSS-konstruktion som löser det genom att berätta att HTML-elementet skall flyttas ur sitt normala flöde och *flyta* till höger, eller vänster. Vi tar ett steg åt sidan och tittar på några CSS-konstruktioner som är bra att känna till.

Så här kan man göra, först i CSS.

```css
.left {
    float: left;
}
```

Och sen i HTML.

```html
<figure class="left">
```

Du kan kanske se hur du skulle göra för att skapa förutsättningar för att flyta en bild till höger?

Om man börjar att flyta element så kan man ibland behöva stänga av flytandet. Det gör man med CSS-konstruktionen `clear`.

```css
clear: left;
clear: right;
clear: both;
```

Att flyta element är ett enkelt sätt att delvis påverka layouten på de element som ritas ut, *renderas*, i webbläsaren.

I ditt kursrepo har du ett exempelprogram som visar [hur float ser ut](/repo/htmlphp/example/float/float.html) och du kan se den [defekten som kan lösas med en `clear`](/repo/htmlphp/example/float/float-clear.html).

Se när Mikael testar exemplet.

[YOUTUBE src=tOjFaCwtSJU width=630 caption="Mikael kör igenom exempelprogrammet för float och clear."]

[YOUTUBE src=_j1XRxKtgEs width=630 caption="Mikael förtydligar när clear behövs."]
