---
author: lew
revision:
    "2018-06-13": "(A, lew) Första versionen."
...
Header {#header}
=======================

Det hade vart snyggt med en logotyp och en stylad header. Murphy instämde och ville ha med en slogan också. Självklart hjälper vi till med det. Först behöver vi någonstans att spara bilderna vi vill använda. Jag skapar en mapp `img` i roten av webbplatsen. Där får alla bilder ligga.



##index.html {#index}

Murphy hittade en selfie som skulle passa bra som logotyp. Vi använder den och skapar stommen i html-filen index.html:

```html
<body>
    <header class="site-header">
        <img src="img/murphy-logo.jpg" alt="logo">
        <span class="site-title">Stormtrooper-Murphy</span>
        <span class="site-slogan">Deathstar's finest.</span>
    </header>
```

Nu har det dykt upp lite nya delar. Det vi kan se inuti taggarna kallas *attribut*. Attributen hjälper oss att bygga upp elementen med en viss struktur. Vissa element kräver till och med särskilda attribut för att fungera som tänkt.

**src** måste finnas med i `<img>`-taggen då det pekar ut var källan till bilden finns.  

**alt** måste också finnas med i `<img>`-taggen. Om bilden av någon anledning inte kan visas på webbsidan kommer den texten visas istället.  

**class** hjälper CSS att hålla reda på elementen. Man kan med fördel använda klassnamnet som selektor. Flera element kan ha samma klassnamn och på så sätt stylas samtidigt.  

Ett attribut som ofta används men inte nämnts är **id**. Id fungerar likadant som klassnamn - det används för att hitta ett element. Ett id får dock endast tillhöra ett element. Det måste med andra ord vara unikt så ska man styla med CSS använder vi helst klassnamn.

Om vi nu tittar på sidan ser vi att den har fått en bild och lite text i headern:

[FIGURE src=/image/htmlphp/guide/murphy/added_logo.png?w=w3 caption="Logo tillagd."]



##style.css {#style}

För att det ska se lite bättre ut behöver vi styla headern och dess element. Följande CSS blir en bra start:

```css
...
.site-header {
    background-color: #fff;
    overflow: auto;
}

.site-header img {
    float: left;
}

.site-title {
    display: block;
    padding-top: 1em;
    padding-left: 50px;
    font-size: 32px;
    overflow: auto;
}

.site-slogan {
    display: block;
    padding-left: 50px;
    font-style: italic;
    overflow: auto;
}
```

Tidigare hade vi en bakgrundsfärg, bredd (width) och en höjd (height) på vårt header-element. De deklareringarna är borttagna och ersatta av `.site-header {...}` ovan.

Vi kan se att klassnamnen vi skapade i index.html kan användas som selektorer i CSS med hjälp av `.klassnamn {...}`. Det kan bli så att vi lägger till fler element av typen `<header>` där vi vill ha en annan style senare. Vad är det som händer i CSS-filen då?

Selektorn `.site-header img {...}` stylar alla element av typen `<img>` som finns i element med klassnamnet `.site-header`. Inte så knepigt va?

**float: left** kopplar bort elementet från det naturliga flödet och positionerar det så långt till vänster det går i sitt omslutande element.

**overflow: auto** talar om vad som ska hända om ett elements innehåll blir för stort för att få plats. Värdet `auto` ritar om det omslutande elementet om innehållet blir för stort.

**display: block** talar om att elementet ska ta upp hela utrymmet det har horisontellt. Kommande element hamnar då på en ny rad.

**padding** talar om hur mycket utrymme inåt som ska finnas i elementet innan dess innehåll ritas ut.

**font-style: italic** talar om att texten ska visas som kursiv.



##Resultat {#resultat}

När vi lagt till koden och laddar om sidan ser det ut på följande sätt:

[FIGURE src=/image/htmlphp/guide/murphy/styled_header.png?w=w3 caption="Header med lite style."]
