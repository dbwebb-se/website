---
author: lew
revision:
    "2018-06-13": "(A, lew) Första versionen."
...
Navbar {#navbar}
=======================

Vi ska såklart inte bara ha en sida. Murphy vill ju ha en sida till! Vi skapar en sida som tar upp lite om Murphys förflutna, så läsaren kan få en djupare förståelse för vem detta är.  

Elementet `<nav>` definierar en uppsättning navigeringslänkar, vilket passar bra till ändamålet.



##index.html {#index}

Följande kod lägger vi precis under slut-taggen `</header>`:

```html
<nav class="navbar">
    <a href="index.html">Home</a>
    <a href="about.html">About</a>
</nav>
```

**&lt;a&gt;** definierar en länk. Atttributet `href` talar om vad länken ska peka mot.

Sedan måste vi ha en sidan det länkas till. Jag väljer att kopiera `index.html` och döper kopian till `about.html`. Den nya filen får en ny title `<title>` och bilden städas undan. Låt oss ladda om webbläsaren och se hur `<nav>`-elementet skapar länkarna per default:

[FIGURE src=/image/htmlphp/guide/murphy/navbar_right.png?w=c8 class="right" caption="about.html"]
[FIGURE src=/image/htmlphp/guide/murphy/navbar_left.png?w=c8 caption="index.html"]



Länkarna syns och navigeringen fungerar. Det ser dock inte ut som en navigeringsmeny så vi gör ett tappert försök till snyggare style.

##style.css {#style}

```css
.navbar {
    padding: 1em;
    background-color: #fff;
    border-top: 1px solid #000;
    border-bottom: 1px solid #000;
}

.navbar a {
    background-color: #eee;
    display: inline-block;
    padding: 0.5em 1em;
    border: 1px solid #999;
    text-decoration: none;
    color: #000;
}

.navbar a:hover {
    background-color: #000;
    color: #fff;
}
```

**.navbar a** väljer ut alla `<a>`-element inuti element med klassnamnet `.navbar`.

**.navbar a:hover** träder i kraft när man *hovrar* över alla `<a>`-element inuti element med klassnamnet `.navbar`. Detta kallas för *pseudo-klass* och är ett nyckelord som kan användas i samband med selektorn för att ändra ett elements stadie, till exempel när man flyttar muspekaren över det.

**text-decoration** möljliggör style av länkar och värdet `none` ser till så länkarna inte har kvar sitt grundutseende.

**display: inline-block** lägger inte till en radbrytning efter som exempelvis `display: block;` men möjliggör att sätta en höjd och bredd på elementet.

**color** sätter färgen på texten.

**padding** sätter hur mycket utrymme det är inuti elementet innan innehållet tar sin plats. `em` är en, som px, ett mått på storlek. Em beror på fontstorleken som är satt och är ungefär lika bred och hög som bokstaven *x*.

Vi ser även fler möjligheter med till exempel **border** i form av border-top och border-bottom. Fler egenskaper har de möjligheterna, exempelvis margin och padding.



##Resultat {#resultat}

När vi nu tittar i webbläsaren börjar det se proffsigt ut:

[FIGURE src=/image/htmlphp/guide/murphy/navbar_1.png?w=w3 caption="Bra start!"]

Ta gärna en stund och lek med exemplet i CodePen:

[CODEPEN src=EReoRg user="dbwebb" tab="html,css" caption="Steg 3 i CodePen."]
