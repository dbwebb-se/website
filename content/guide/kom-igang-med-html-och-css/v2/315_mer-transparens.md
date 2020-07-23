---
author: lew
revision:
    "2018-06-13": "(A, lew) Första versionen."
...
Mer transparens {#mer-transparens}
=======================

Nu blev det ganska bra med bakgrundsbilden. Murphy tyckte dock att man inte såg så mycket av bakgrundsbilden. Vi löser det och samtidigt snyggar till det hela lite med transparens på fler element. Planen är att man ska kunna skymta bakgrundsbilden genom `<body>`-elementet, och samtidigt se texten ordentligt. Vi vet att opacity hade gjort texten genomskinlig med och det vill vi inte. Vi kan inte använda opacity här, då vi inte vill att texten eller bilderna ska bli transparenta. Elementen jag vill göra genomskinliga är navbaren, main och headern.



##main {#main}

Om vi gör bakgrunden i elementet transparent, behöver vi nog ändra färg på texten med.

```css
main {
    min-height: 30em;
    background-color: rgb(0, 0, 0);
    background-color: rgba(0, 0, 0, 0.8);
    color: #fff;
}
```

**rgba()** är ett alternativ till genomskinlighet och bakgrundsfärg. De tre första värdena står för RGB (Red Green Blue) och det sista för genomskinligheten. Det finns äldre webbläsare som inte klarar av rgba(), därav föregås den av en fallback, rgb() som träder i kraft i de fallen.

Så nu har vi tagit bort den grå grundfärgen och försökt skapa ett lite genomskinligt och svart element. Med vit text. Nu tittar vi:

[FIGURE src=/image/htmlphp/guide/murphy/main-rgba.png?w=w3 caption="rgba() på main elementet."]



##header {#header}

Jag kör på och gör klassen .site-header transparent. Jag väljer även att göra logotypen rund.

```css
.site-header {
    background: transparent;
    overflow: auto;
    color: white;
}

.site-header img {
    float: left;
    border-radius: 50%;
}
```

**background: transparent;** gör helt enkelt bakgrunden transparent, utan någon färg.

**border-radius** rundar kanterna på ett element. 50% gör det helt runt men det finns konstruktioner som skapar fler former.

Jag tar även bort kantlinjen från body-elementet och sätter den på main-elementet istället. Läget är nu:

[FIGURE src=/image/htmlphp/guide/murphy/header-transparent.png?w=w3 caption="Transparent bakgrund på headern."]



##navbar {#navbar}

Det sista jag vill fixa till här är navbaren. Jag väljer att göra den transparent och jobba lite med länkarna.

```css
.navbar {
    background-color: transparent;
    padding-top: 1em;
    padding-bottom: 1em;
}

.navbar a {
    width: 106px;
    text-align: left;
    text-indent: 20px;
    font-size: 16px;
    background-color: rgb(0, 0, 0);
    background-color: rgba(0, 0, 0, 0.6);
	opacity: 1;
    display: inline-block;
    padding: 0.5em 1em;
    border: 1px solid #eee;
    text-decoration: none;
    color: white;
}

.navbar a:hover {
    background-color: #25383C;
    text-decoration: none;
    color: white;
}

.navbar .selected {
    background-color: #25383C;
}
```

Inga nya eller speciella konstruktioner har dykt upp här. Det ser dock lite annorlunda ut:

[FIGURE src=/image/htmlphp/guide/murphy/navbar-transparent.png?w=w3 caption="Transparent och stylad navbar."]

Testa och lek med konstruktionerna på CodePen:

[CODEPEN src=QxzKQm user="dbwebb" tab="html,css" caption="Steg 10 i CodePen."]
