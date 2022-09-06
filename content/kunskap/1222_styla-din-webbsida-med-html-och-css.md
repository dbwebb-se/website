---
author: mos
category:
    - webbprogrammering
    - html
    - css
    - kurs webtec
revision:
    "2022-09-06": "(B, mos) Genomgång och stavning."
    "2022-07-01": "(A, mos) Första utgåvan inför webtec-v2."
...
Styla din webbsida med HTML och CSS
==================================

[FIGURE src=image/webtec/style-it/start.png?w=c5 class="right" caption="En ostylad webbplats."]

Vi skall styla en ostylad webbplats med CSS för att lära oss grunderna i hur man jobbar med CSS konstruktioner för att styla en webbplats. Vi kommer utgå från en webbplats som enbart innehåller HTML-kod och en del innehåll, sedan stylar vi del för del där vi börjar med navbaren, headern och footern för att sedan gå vidare och se hur man kan styla innehållet i en artikel och hur man kan dela upp webbsidan i 2 eller tre kolumner. Vi avslutar med inslag av en responsiv webbplats.

Det är bra om du har en CSS-resurs vid sidan när du jobbar igenom artikeln, det underlättar om du kan slå upp de konstruktioner som används.

<!--more-->



Förutsättningar {#pre}
---------------------------------

Du har jobbat igenom övningen "[Skapa en webbsida med HTML, CSS och PHP (v2)](kunskap/skapa-en-webbsida-med-html-css-och-php-v2)" och du har en motsvarande webbplats. Det är den webbplatsen vi nu skall styla.

Du kan hitta koden som används i denna artikel, i ditt kursrepo under `example/me/kmom02`, använd den som referens om du fastnar.



Resurser {#resurser}
---------------------------------

Låt oss skapa en omgivning av nyttiga resurser som kan hjälpa dig igenom detta dokumentet och därefter stötta dig när du söker ny information om CSS.

När du googlar CSS konstruktioner så kan du skriva "mdn css <konstruktionen>", till exempel "mdn css variable". Använd engelska och skriv "mdn" för att hamna på [webbplatsen MDN](https://developer.mozilla.org/) och "css" för att det är en CSS-konstruktion. På det viset hamnar du alltid på en plats som har en god referens för konstruktionen.

Det finns en CSS standard men det kan kännas lite svårtillgänglig i början. Ett enkelt sätt att nå en viss konstruktion är att använda [W3C Cheat Sheet](https://www.w3.org/2009/cheatsheet/). Där kan du slå upp till exempel "border" och se detaljer om konstruktionen och hur den förhåller sig till både CSS, HTML (och Document Objet Model (DOM)/JavaScript). Du kan också klicka dig vidare för att komma direkt in i specifikationen.

Om du använder nyare konstruktioner så är det alltid en risk att det allra senaste inte fungerar i äldre webbläsare. Detta kan du dubbelkolla genom att googla "caniuse css variable" för att landa på [webbplatsen Can I use](https://caniuse.com/).

Om du tycker det är krångligt att testa nya konstruktioner i din befintliga webbplats så kan du använda [webbplatsen Codepen](https://codepen.io/) där du kan skapa, spara och dela enklare konstruktioner av HTML, CSS (och JavaScript). En sådan webbplats kan vara bra om du vill dela en konstruktion med andra och kanske få hjälp eller tips. Det är ofta enklare att få hjälp med ett avgränsat kodexempel.

På webbplatsen Codepen kan du också hitta många tips och trix om CSS och diverse konstruktioner.

Om du hamnar i bekymmer så kan du alltid publicera din webbplats på studentservern och skicka länken till den som ska försöka hjälpa dig. Som du vet så finns många trix i hur man felsöker en webbplats, till exempel med devtools och att titta i källkoden för sidan.

När man publicerar en webbplats så är i princip all källkod till webbplatsen tillgänglig för den som vet hur man skall hitta. Men, om du ändå vill dela en större del av din kod, till exempel PHP-kod eller liknande så kan det vara bra med en webbtjänst där man kan dela hela filer eller större textmängder på ett enkelt sätt. En sådan tjänst är [webbtjänsten Gist](https://gist.github.com/) som är en del av utbudet på GitHub. Du kan spara text och dela länken med andra så de får tillgång till informationen.

I ditt kursrepo kan du också hitta en del kodexempel med bra-att-ha CSS-konstruktioner, kika under `example/css`. Kom ihåg att det är smart att skapa små enkla och väl avgränsade testprogram när man testar och lär sig nya konstruktioner.



<!--
Översikt av artikeln {#video}
---------------------------------

Det finns en videoserie som visar hur jag själv jobbar igenom artikeln. Du kan titta igenom videoserien samtidigt som du själv jobbar igenom artikeln.

Du hittar spellistan för videoserien under "[Skapa en webbsida med HTML, CSS och PHP](https://www.youtube.com/playlist?list=PLKtP9l5q3ce8WodX3eGvV1CO8wQEuI85C)".

[YOUTUBE src="XXX" list="PLKtP9l5q3ce8WodX3eGvV1CO8wQEuI85C" width=700 caption="Videoserie som ger dig en översikt och genomgång av artikeln."]
-->



Små och väl avgränsade exempelprogram {#exempel}
---------------------------------

Här är ett exempel på ett väl avgränsat exempelprogram som visar en grundkonstruktion med HTML elementen `<div>` och `<span>` tillsammans med ett par CSS-konstruktioner och där HTML binds till CSS via klassattributet.

Först HTML-koden.

```html
<div class="box">
  <p>This is <strong>a text</strong> saying <span class="hello">"Hello World"</span>.</p>
</div>
```

Sedan CSS-koden.

```css
.box {
  max-width: 200px;
  margin: 2em;
  padding: 1em;
  border: 2px solid limegreen;
}

.hello {
  text-decoration: underline;
  color: red;
}
```

Exemplet kan ses i [sin helhet via Codepen](https://codepen.io/mosbth/pen/GRxRYMw?editors=1100).

[FIGURE src=image/webtec/style-it/codepen.png?w=w3 caption="Ett väl avgränsat kodeexempel via Codepen."]

Du kan också se samma exempel i ditt kursrepo under `example/css/hello-world`.

[FIGURE src=image/webtec/style-it/hello.png?w=w3 caption="Ett väl avgränsat kodeexempel via egen kod."]

Ta för vana att alltid skapa små och väl avgränsade testprogram när du lär dig nya saker. Du kan spara en hel del tid på det. Utgå gärna från exemplet `example/css/hello-world` så har du en snabb start.



Ostylad webbplats {#ostylad}
---------------------------------

Vi har alltså en struktur att utgå ifrån där HTML-koden finns på plats.

[FIGURE src=image/webtec/style-it/start.png?w=w3 caption="En ostylad webbplats att utgå ifrån."]

För att lyckas att styla hela webbplatsen så kommer vi behöva en hel del CSS-kod och vi kommer också behöva lära oss lite mer om HTML och även justera innehållet i HTML-koden så att det blir enklare att styla som vi vill. Vi kan se det som att vi balanserar "rätt" HTML-konstruktioner och matchar dem mot "rätt" CSS-konstruktioner så att vi gör "rätt sak på rätt plats". Exakt vad som är rätt och riktigt är dock aningen flytande. Det finns olika sätt att lösa en viss konstruktion. Vi försöker hålla oss i att göra det enkelt och koden läsbar, det burkar leda till bra kod som är enkel att underhålla och vidarutveckla.

Då börjar vi.



Nollställ och normalisera CSS {#nollstall}
---------------------------------

I CSS finns ett koncept av "normalisera" eller "resetta" den CSS-kod som normalt finns i standarden och i browsern. Detta är för att skapa en gemensam bas så att utseendet ser likadant ut i olika webbläsare. Det används också för att aktivera vissa grundiställningar som man vill jobba med.

Jag väljer en egen och mindre variant där jag gör vissa inställningar. Jag sparar dessa i filen `public/css/init.css`.

```css
/**
 * Initiate the CSS base and reset/normalize some items.
 */

/**
 * Apply a natural box layout model to all elements, but allowing components
 * to change.
 * https://www.paulirish.com/2012/box-sizing-border-box-ftw/
 */
html {
      box-sizing: border-box;
}
*, *:before, *:after {
      box-sizing: inherit;
}

/**
 * Parts from
 * https://github.com/necolas/normalize.css/blob/master/normalize.css
 */
html {
    line-height: 1.15;
}

body {
    margin: 0;
}
```

Därefter inkluderar jag filen ovan i min stylesheet `public/css/style.css`.

```css
/**
 * The stylesheet for this website.
 */
@import "init.css";
```

Att dela upp filerna i delar kan underlätta för att återanvända, felsöka och utveckla koden. Du slipper få all kod i en och samma fil.

Om du vill använda den riktiga `normalize.css` så kan du läsa om den i artikeln "[About normalize.css](https://nicolasgallagher.com/about-normalize-css/)". [Källkoden till `normalize.css`](https://github.com/necolas/normalize.css/blob/master/normalize.css) innehåller kommentarer som visar vad varje konstruktion gör. Men se det som ren överkurs.

Här kan du, vid intresse och mer överkurs, fördjupa dig diskussionen om "[What is the difference between Normalize.css and Reset CSS?](https://stackoverflow.com/questions/6887336/what-is-the-difference-between-normalize-css-and-reset-css)".



Styla en navbar {#navbar}
--------------------------------------

Jag börjar med att jobba mig igenom den översta HTML koden och först hittar jag en navbar.

Eftersom jag i princip alltid vill ha klasser att jobba emot så uppdaterar jag HTML-koden och lägger in en klass `class="navbar"` som jag kan styla.

HTML-koden ser nu ut så här.

```html
<nav class="navbar">
    <ul>
        <li><a href="me.php">Me</a></li>
        <li><a href="report.php">Report</a></li>
        <li><a href="about.php">About</a></li>
    </ul>
</nav>
```

En lista kan vara ett bra sätt att använda för en navbar. Man får alla delarna inom taggar och man kan i princip styla den som man vill. Jag väljer följande style för att återskapa den navbaren som jag sett på webbplatsen för PHP. Det handlar mest om att visa ett exempel på hur man gör, sedan kan du själv styla friskt efter egen förmåga.

Jag väljer att lägga koden i filen `public/css/navbar.css` för att ha en god struktur i denna artikel, det blir en variant av modulärt tänkande, koden som har ett visst sammahang placeras i en egen modul/fil/enhet.

```css
/** navbar.css */

/*
 * Add colors and borders.
 */
.navbar {
    background-color: #8892BF;
    border-top: 4px solid #4F5B93;
    text-align: center;
    font-size: 1.2em;
}

/*
 * Style links.
 */
.navbar a {
    display: inline-block;
    padding: 0.2em 0.5em;
    color: #FFFFFF;
    text-decoration: none;
}

.navbar a:hover {
    color: #EEE;
    background-color: #4F5B93;
}

/*
 * Remove bullets, margins and padding from the list.
 */
.navbar ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}

/*
 * Put the li items on a line.
 */
.navbar li {
    display: inline;
}
```

När jag är klar ser min navbar ut så här.

[FIGURE src=image/webtec/style-it/navbar.png?w=w3 caption="Nu är navbaren på plats och stylad."]

Du har nu grundkonstruktionerna du kan jobba utifrån. Du kan naturligtvis välja en annan style för din navbar.



Styla en header {#header}
--------------------------------------

Nu har jag en navbar och fortsätter med resten av headern. Om jag hade velat att navbaren låg under headern så hade jag bara skiftat ordningen på HTML-koden.

En header brukar normalt innehålla sidans titel och logo och kanske någon bild tillsammans med inslag av navigering,

Jag börjar med att uppdatera HTML-koden och lägger till klasser som jag kan använda i min styling.

```html
<header class="header">
    <img class="logo" src="img/favicon.png">
    <span class="title">Kursen webtec</span>
    <span class="subtitle">Min rapportsida</span>
</header>
```

Följande CSS-kod visar hur du kan jobba med positionering och utseende av din header, jag placerar den i `public/css/header.css`.

```css
/** header.css */

/*
 * Prepare variables.
 */
:root {
    --light-color: #CFC;
    --medium-color: #7A7;
    --dark-color: #363;
}

/*
 * Set colors, size and prepare positioning.
 */
.header {
    background-color: var(--light-color);
    border-bottom: 4px solid var(--dark-color);
    position: relative;
}

/*
 * Position and size the logo.
 */
.header .logo {
    width: 150px;

    position: relative;
    top: 5px;
    left: 20px;
}

/*
 * Modify and position the title.
 */
.header .title {
    color: var(--dark-color);
    font-size: 36px;
    text-shadow: 2px 2px 2px var(--medium-color);

    position: relative;
    top: -90px;
    left: 200px;
}

/*
 * Modify and position the subtitle.
 */
.header .subtitle {
    color: var(--dark-color);
    font-size: 24px;

    display: inline-block;
    transform: rotate(-20deg);

    position: relative;
    top: -70px;
    left: 200px;
}
```

Så här ser det ut när jag blev klar.

[FIGURE src=image/webtec/style-it/header.png?w=w3 caption="Nu har headern style."]

En annan variant är att lägga till en bakgrundsbild i headern. Det kan man göra med genom att lägga till följande kod.

```css
/*
 * Add background image.
 */
.header {
    background-color: var(--light-color);
    border-bottom: 4px solid var(--dark-color);
    position: relative;

    background-image: url("../img/background.jpg");
    background-repeat: no-repeat;
    /* background-attachment: fixed; */
    background-position: center;
    background-size: cover;
}

/*
 * Fix colors when using background image.
 */
.header .title,
.header .subtitle {
    background-color: lime;
}
```

Resultatet kan då se ut så här.

[FIGURE src=image/webtec/style-it/header_bg.png?w=w3 caption="En bakgrundsbild lades till i headern."]

Jag säger inte att alla färger och kontraster i headern blev perfekt, men det är en start och visar ett par tekniker man kan använda för att jobba med sin header.



Styla en footer {#footer}
--------------------------------------

Då går vi vidare och stylar sidans footer. Det finns en del information i footern och jag tänker att jag vill skapa en struktur med tre kolumner och en del som spänner över hela sidan. Låt mig försöka förklara hur jag vill ha det.

[FIGURE src=image/webtec/style-it/footer_plan.png?w=w3 caption="En plan för sidans footer."]

För att lyckas med det så behöver jag förbereda sidans HTML-kod så att stylingen blir enklare. Jag behåller innehållet jag hade sedan tidigare och placerar det i följande struktur.

```html
<footer class="footer">
    <div class="row">
        <div class="col3 box">
            Some content...
        </div>

        <div class="col3 box">
            Some content...
        </div>

        <div class="col3 box">
            Some content...
        </div>
    </div>

    <div class="row">
        <div class="col1 final">
            Some content...
        </div>
    </div>
</footer>


```

Stylen placerar jag i `public/css/footer.css`. Jag börjar med att skapa färg och form för footern och i slutet stylar jag kolumner och rader enligt flexbox.

```css
/** footer.css */

/*
 * Set colors and size.
 */
.footer {
    background: linear-gradient(to bottom, #666, #000);
    color: #FFF;
    padding: 0 1em;
}

/*
 * Style the links.
 */
.footer a {
    color: #FFF;
}

.footer a:hover {
    color: lime;
    text-decoration: none;
}

/*
 * Style the content.
 */
.box h4 {
    border-bottom: 2px solid #fff;
}

.final {
    text-align: center;
}

/*
 * Style the rows and columns.
 */
.footer .row {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    gap: 24px;
}

.footer .row > .col3 {
    width: calc(100% / 3);
}

.footer .row > .col1 {
    width: 100%;
}
```

När du senare skall styla flexbox på egen hand så hjälper det att till exempel läsa igenom artikeln "[A Complete Guide to Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)", det är en bra referens för att lära sig flexbox. Men för tillfället är det överkurs att läsa igenom artikeln.

[FIGURE src=image/webtec/style-it/footer.png?w=w3 caption="Footern är klar, precis enligt planen."]

Om du har svårt att visualisera delarna och vad som är vad så kan det underlätta att ge delarna olika stil. Prova till exempel att lägga till följande kod (längst ned i filen så får den högre specificitet och används).

```css
/**
 * Add colors to rows and columns to debug and visualize.
 */
.footer .row {
    background-color: tomato;
    padding: 1em;
}

.footer .row > .col1,
.footer .row > .col3 {
    background-color: BlanchedAlmond;
    color: Brown;
    padding: 1em;
}
```

[FIGURE src=image/webtec/style-it/footer_debug.png?w=w3 caption="Färglägg de olika divarna för att visualisera sidans byggstenar."]

Nu kan det bli enklare att se raderna och kolumnerna och vad som är vad.



Styla main med article {#article}
--------------------------------------

Nu tänkte jag jobba vidare med styling av sidans huvudsakliga innehåll som är placerat i main. För att få lite mer innehåll att jobba med så har jag placerat följande innehåll i sidan.

[FIGURE src=image/webtec/style-it/article_start.png?w=w3 caption="En artikel om mig själv som behöver stylas."]

Du kan se [källkoden för sidan via GitHub](https://github.com/dbwebb-se/webtec/blob/main/example/me/kmom02/public/me.php), där ser du alla HTML-elementen och sidans struktur.

De huvudsakliga delarna i sidan är dessa. Det är en article som har en header och en footer och allt är placerat inuti main-elementet. Jag använder elementet figure för att hantera bilder tillsammans med bildtexter.

```html
<main class="main">
    <article class="article">
        <header>
            <h1>Om Mig Själv</h1>
            <p class="author">Skriven av Mikael Roos, uppdaterad <time datetime="2022-06-29">2022-06-29</time>.</p>
        </header>

        <figure class="figure right">
            <img src="img/me.png" width="300" alt="Bild på mig">
            <figcaption>Mikael Roos</figcaption>
        </figure>

        Text om mig.

        <footer class="byline">
            En byline.
        </footer>
    </article>
</main>
```

Jag placerar min stylesheet i filen `public/css/main.css` och jobbar igenom stylen del för del. Jag börjar med sidans grundutseende och artikelns header.

```css
/** main.css */

/*
 * Set colors and size.
 */
body {
    background-color: #eee;
}

.main {
    margin: 0 auto;
    max-width: 800px;
}

.article {
    overflow: auto;
    background: #fff;
    border-left: 1px solid #ccc;
    border-right: 1px solid #ccc;
    padding-left: 1em;
    padding-right: 1em;
}

.article h1 {
    font-size: 2em;
    border-bottom: 4px double #ccc;
    font-family: Arial, Helvetica, sans-serif;
}

.article .author {
    margin-top: -1em;
    font-size: 0.8em;
    color: #666;
    font-style: italic;
}
```

Resultatet blir följande. Det får räcka tills vidare.

[FIGURE src=image/webtec/style-it/article_header.png?w=w3 caption="En artikel om mig själv som behöver stylas."]



Styla article med figure {#figure}
--------------------------------------

Då går vi vidare och stylar bilderna som ligger i en `<figure>` tillsammans med en `<figcaption>` enligt föregående stycke.

HTML-koden för en figure och figcaption ser ut så här.

```html
<figure class="figure right">
    <img src="img/me.png" width="300" alt="Bild på mig">
    <figcaption>Mikael Roos</figcaption>
</figure>
```

Jag väljer att placera stilen i filen `public/css/figure.css`.

```css
/** figure.css */

.figure {
    display: inline-block;
    margin: 0;
    padding: 0.5em;
    border: 1px solid #ccc;
}

.figure img {
    max-width: 100%;
}

.figure figcaption {
    caption-side: bottom;
    font-style: italic;
    padding-top: 1em;
}
```

Style påverkar så att figurtexten hamnar under bilden. Så här blev det.

[FIGURE src=image/webtec/style-it/figure.png?w=w3 caption="En bild som nu ingår i en figure och figcaption."]

Nu vill jag kunna få texten att flyta runt bilden, låt se hur man löser det.



Float right/left och centrera figuren {#float}
--------------------------------------

Ibland vill man att bilden, eller figurem, skall flyta med texten till vänster eller höger. Det kan vi göra med konstruktionen float.

Titta på nedan HTML-konstruktion så ser du två klasser `figure right` som båda tillsammans skall göras att figuren stylas och flyter till höger i textmassan.

```html
<figure class="figure right">
    <img src="img/me.png" width="300" alt="Bild på mig">
    </figcaption>Mikael Roos</figcaption>
</figure>
```

[FIGURE src=image/webtec/style-it/figure_right.png?w=w3 caption="Bilden flyter till höger."]

Att "flyta" ett objekt betyder att det tas bort ur det vanliga flödet när webbläsaren renderar webbsidan. I stylesheetkoden kan vi på följande sätt göra så att det finns en speciell regel `.figure.right` om två klasser finns på samma HTML element.

```css
/** figure.css */

.figure.right {
    float: right;
    margin-left: 1em;
}
```

På liknande sätt kan vi göra en konstruktion för att flyta bilden till vänster. Om du har devtools uppe kan du gå in och redigera klassattributet i HTML-koden för att testa skillnaden mellan höger och vänster.

```css
/** figure.css */

.figure.left {
    float: left;
    margin-right: 1em;
}
```

[FIGURE src=image/webtec/style-it/figure_left.png?w=w3 caption="Bilden flyter till vänster."]

Avslutningsvis kan vi även göra en konstruktion som centerar bilden i mitten av texten.

```css
/** figure.css */

.figure.center {
    display: block;
    text-align: center;
}
```

[FIGURE src=image/webtec/style-it/figure_center.png?w=w3 caption="Bilden flyter till vänster."]

Nu behöver vi bara fundera på vilket som bir bäst i vår artikel, om bilden skall vara till vänster, höger eller centrerad.



Byline {#byline}
--------------------------------------

En byline brukar innehåla en bild och lite text om författaren av ett textstycke. Jag lägger till en egen byline i slutet av min artikel, som en footer till artikeln.

```html
<footer class="byline">
    En byline.
</footer>
```

Exakt hur din egen byline ser ut får du själv bestämma. Min egen lägger jag lite text om mig och en bild och sedan stylar jag i filen `public/css/byline.css`.

Exakt hur jag strukturerar och stylar en byline lämnar jag som en liten övning som du själv kan utföra. Du kan till exempel använda tekniker för att flyta, positioner eller flexbox - om du vill positionera elementen i din byline.

Så här blev resultatet på min byline, jag höll det rätt enkelt och försökte "flasha" till det med enkla medel.

[FIGURE src=image/webtec/style-it/byline.png?w=w3 caption="Nu har min artikel en snygg byline, kan du skapa en egen liknande och kanske snyggare?"]

Då har vi stylat sidans innehåll och gjort oss redo för att skriva fler artiklar.



Clearfix {#clearfix}
--------------------------------------

Ett bekymmer som kan inträffa när du använder float är att den omgivande diven, den div som är förälder-diven, inte kan bestämma hur hög den skall vara på grund av det flytande elementet den innehåller. Det kan se ut så här som när jag försöker flyta min bild till vänster i diven men texten är inte så stor så den omslutande diven täcker inte hela bilden med sin bakgrundsfärg.

[FIGURE src=image/webtec/style-it/byline_clearfix.png?w=w3 caption="Så här ser det ut när man har behov av en clearfix."]

Detta löses med en så kallad "clearfix" som är en påhittad CSS-konstruktion som tvingar den omgivande diven att räkna om sin storlek en gång till.

Jag väljer att lösa det med konstruktionen `overflow: auto;`. Så här ser det ut.

[FIGURE src=image/webtec/style-it/byline_overflow.png?w=w3 caption="Med hjälp av min clearfix så räknar förälderdiven om sin storlek och omsluter hela dess innehåll."]

Vid intresse, läs mer om "[What is a clearfix?](https://stackoverflow.com/questions/8554043/what-is-a-clearfix)" och "[What methods of ‘clearfix’ can I use?](https://stackoverflow.com/questions/211383/what-methods-of-clearfix-can-i-use?rq=1)".



Clear float {#clearfloat}
--------------------------------------

Ett annat bekymmer som kan inträffa när man jobbar med float är hur man "stänger av" flytandet. I mitt fall med min byline så skulle det kunna se ut så här om jag hade mindre text i min artikel. Resultatet är att även min byline placerar sig runt den flytande bilden.

[FIGURE src=image/webtec/style-it/byline_float_issue.png?w=w3 caption="Så här ser det ut när du har behov av att stänga av flytande element."]

Jag löser det genom att lägga till konstruktionen `clear: both;` på det element som inte längre skall flyta. Resultatet blir då så här.

[FIGURE src=image/webtec/style-it/byline_clear_both.png?w=w3 caption="Nu stängdes flytandet av från bilden och min byline hamnade på rätt plats."]

De båda "fixarna" clearfix och clearfloat kan vid första anblicken se liknande ut men tittar man nogare så är det två olika typer av problem.



Tips om felsökning {#felsok}
--------------------------------------

CSS är ibland ett trixigt språk och det kan vara klurigt att se hur stylen på olika element påverkar varandra.

[FIGURE src=image/webtec/style-it/css_is_fun.jpg?w=200 class="center" caption="CSS är kul och ibland lite skrämmande, lurigt och utmanande."]

När du felsöker, tänk på följande.

* Kika på "högerklicka och visa källkod" för att se din HTML och CSS i klartext.
* Kika i devtools för att se vilken HTML och CSS som genererades av webbläsaren. Om du har skrivit fel är det möjligt att vissa konstruktioner inte finns med.
* Kör din HTML och CSS i validatorn. Det är ingen idé att styla en sida om din HTML inte passerar genom vadliatorn.
* Använd devtools för att sätta på och stänga av olika CSS-konstruktioner och se hur de påverkar varandra.
* Tänk på att element påverkar varandra. Är du osäker så provar du dina konstruktioner i ett isolerat testprogram, innan du försöker lägga in det i ett större sammanhang.

Glöm inte att "prata med ankan". Det handlar om att formulera en enkel fråga på ditt problem. Formulera minsta möjliga fråga som kan ta dig ett steg framåt. Om du gör det så kommer du att bli förvånad hur många gånger du själv faktiskt kan besvara din fråga.

Du behöver alltså översätta din reaktion av "HJÄLP!" eller "det funkar inte", till en fråga som din kompis eller lärare kan besvara. Deras första motfrågor blir annars vanligen följande.

1. Vad försöker du göra?
1. Vad blir resultatet?
1. Kan du återupprepa det?
1. Vad har du gjort för att avgränsa problemet till en teknik, fil, kodsektion, kodrad?
1. Har du validerat?
1. Har du publicerat och länkat till sidan med problemet och förklarat hur man återskapar problemet?



Fixa till sidan about {#about}
--------------------------------------

Sidan `about.php` har nu ett par saker som jag vill lösa. Låt oss titta på sidan så skall jag förklara.

[FIGURE src=image/webtec/style-it/about_start.png?w=w3 caption="Här finns ett par saker som jag vill fixa till."]

Jag förklarar och fixar till sakerna samtidigt.

När jag ändå håller på så tar jag även och lägger in samma sidstruktur i `about.php` med en artikel, på det viset jag har i `me.php`. Det udnerlättar om alla sidkontrollers har en liknande layout så jag vet att den stil jag skriver kan påverka dem alla.



### (1) Alltid visa scrollbar {#scroll}

När sidans innehåll inte täcker hela webbläsarens höjd så visas inte skrollbaren vilket gör att de olika sidorna me och report kontra about får olika bredd. Det kan ge upphov till ett "hoppande" utseende när man växlar mellan sidorna.

En lösning på detta är att alltid visa scrollbaren, oavsett om den behövs eller inte. Här är konstruktionen som löser det.

```css
body {
    overflow-y: scroll;    /* Always display scrollbar, avoid hopping pages */
}
```

Du kan till exempel lägga konstruktionen i din `public/css/init.css`.



### (2) Footer samma färg till webbläsarens slut {#footerfarg}

I mitt fall när sidan inte sträcker sig hela vägen ner så blir det inte samma färg som footern på den nedersta delen. Det är för att html-dokumentet tar slut, eller mer korrekt så är det dess body som tar slut och html-dokumentet sträcker sig hela vägen ned till slutet.

En variant är då att färglägga html-elementet med en bakgrundsfärg som är samma som footern. Det kan se ut så här när jag uppdaterar den style jag har för min footer i `public/css/footer.php`.

```css
/*
 * Set colors and size.
 */
.footer {
    background: linear-gradient(to bottom, #666, #000);
    color: #FFF;
    padding: 0 1em;
}

html {
    background-color: #000;
}
```

Det är alltså delen med `html { }` som är tillagd.



### (3) Minsta höjd på sidan {#minheight}

I nuläget har about-sidan inte så mycket innehåll och den tar inte så mycket plats. Eventuellt vill man dock ändå att webbsidan skall sträcka sig en större del av webbläsarens höjd för att det "ser bättre ut" som helhet.

En variant är att lösa detta med en minsta höjd på main-elementet så att även de sidor med minst innehåll har en minsta gemensamma höjd.

Här är en sådan konstruktion som jag väljer att placera i `public/css/main.css`. Här kan du själv välja hur hög sidan skall vara.

```css
.main,
.main .article {
    min-height: 20em;
}
```



### About fixad {#aboutfix}

Då var vi klara med att förbereda sidan `about.php` för att inehålla lite mer saker.

[FIGURE src=image/webtec/style-it/about_fixed.png?w=w3 caption="Nu har jag fixat så att även sidor med litet innehåll ser helt okey ut."]

Nu har about-sidan samma innehållsmäsiga struktur som me-sidan.



Två kolumner {#kolumn2}
--------------------------------------

Jag vill nu göra så att about-sidan har två kolumner. En kolumn för det huvudskliga innehållet (`<main>`) och en kolumn för annat relaterat innehåll (`<aside>`). Det spelar inte så mycket roll om kolumnerna justeras vänster höger eller tvärtom. Det går att justera. Jag börjar med att justera min aside till vänster och jag utgår från följande struktur i min `public/about.php`.

```html
<div class="two-col-layout">
    <main class="main">
        <article class="article">
            INNEHÅLL I MAIN, VIA EN ARTICLE
        </article>
    </main>

    <aside class="aside">
        INNEHÅLL I ASIDE
    </aside>
</div>
```

När man bygger en kolumn layout finns ett antal olika tekniker att välja bland. Jag väljer flexbox och samma upplägg som vi såg tidigare i footern.

Min huvudsakliga class är `two-col-layout` och där har jag en "kontainer-div" som omsluter de två kolumnerna. Du kan jämföra med strukturen i footern där vi valde att kalla det "rader" och "kolumner". Principen är densamma här, bara andra namn och ett annat sammanhang.

Det jag behöver styla är kontainern till flex och de två kolumnernas bredd. Jag har också en max bredd och centrerar kontainern i mitten av sidan. Jag väljer att placera koden i `public/css/two_column_layout.css`.

```css
/** two_column_layout.css */

.two-col-layout {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    max-width:900px;
    margin: 0 auto;
}

.two-col-layout > .main {
    width: calc(100% / 16 * 12); /* 12/16 width */
}

.two-col-layout > .aside {
    width: calc(100% / 16 * 4); /* 4/16 width */
}
```

Jag väljer att tänka att hela bredden är 16 delar och asiden blir 4 delar och main blir 12 delar. Ibland underlättar det att tänka i den formen av "grid-baserad" utforming av sidan.

Jag behöver också styla till själva asiden. Den stilen liknar rätt mycket den jag har i `main.css`. Jag lånar stilen så att det passar ihop med den stil som `.main` har.

```css
.aside {
    background-color: #fff;
    border-right: 1px solid #ccc;
    padding-left: 1em;
    padding-right: 1em;
    padding-top: 24px;
}

.aside h4 {
    border-bottom: 1px solid #ccc;
}
```

Troligen behöver jag justera stylen beroende av om jag har asiden till vänster eller höger om main. Men det är ju små saker.

[FIGURE src=image/webtec/style-it/about_2col.png?w=w3 caption="Nu är min about-sida uppdaterad med en två kolumners layout."]

Då börjar vi nära oss slutet.



Responsivitet {#responsive}
--------------------------------------

Som en sista aktivitet skall vi titta på sidans responsivitet. Att bygga sin webbplats så att den fungerar på olika enheter och skärmbredder kan vara en liten utmaning. Men det finns små enkla sätt att komma igång. Principen handlar om att webbplatsen skall vara användbar på både en vanlig datorskärm typ 1920x1080, en extra bred skärm, en bärbar, en läsplatta och en mobil och dessutom skall det fungera både i porträtt och landskapsläge för de enheter som stödjer det.

Om du publicerar din webbsida till studentservern så kan du försöka nå den med din mobil och en läsplatta, om du har tillgång till det. Ett annat sätt är att använda inspect och devtools med dess inbyggda mobila utvecklingsverktyg där man kan simulera hur webbläsaren visar upp webbplatsen när skärmen är mindre.

[FIGURE src=image/webtec/style-it/responsive.png?w=w3 caption="Hmmm, vilka delar skall vi nu satsa på att göra responsiva?"]

Om du minskar bredden på webbläsaren så kan du ana att två kolumners layouten och footern med tre delar kanske kunde hanterats annorlunda. Ett vanligt sätt att göra en sådan kolumnlayout till mer responsiv är att "stacka" kolumnerna ovanpå varandra. När de inte får tillräckligt med plats bredvis varandra så placerar man dem istället ovanpå varandra.

Låt oss se om vi kan hitta ett enkelt sätt att göra detta via media queries. Det blir en första enklare ansats till en responsiv webbplats.

Tanken är att vi skall klara oss utan att ändra i HTML-strukturen, eller ja, en viss uppdatering skall vi börja med i `<head>` elementet. Fixa till så att din `<head>` inkluderar följande HTML konstruktioner som förbereder sidan rent allmänt för ett responsivt beteende.

```html
<meta name="viewport" content="width=device-width, initial-scale=1">
```

Jag skapar filen `public/css/responsive.css` och inleder arbetet.

Det första jag gör är att försäkra mig om att alla bilder har en maxbredd, det gör att bilderna kan skala och bli mindre när dess förälderelement får mindre utrymme.

```css
/** responsive.css */

img {
  max-width: 100%;
  display: block;
}
```

Därefter gör jag min första "media query" som säger att när webbläsarens bredd blir smalare än ett visst antal pixlar så skall ett antal CSS-konstruktioner gälla. Jag ser till att dessa konstruktioner hamnar längst ned av alla CSS-konstruktioner så att de får högst specificitet.

Jag startar med min två kolumners layout.

```css
@media (max-width: 700px) {
    .two-col-layout {
        flex-wrap: wrap;
    }

    .two-col-layout > .main,
    .two-col-layout > .aside {
        width: 100%;
    }
}
```

Regeln ovan säger att de två kolumnerna skall stackas ovanpå varandra när sidans bredd är mindre än 700 pixlar. Det kan se ut så här precis vid brytpunkten om man inspekterar det i devtools.

[FIGURE src=image/webtec/style-it/responsive_701.png?w=w3 caption="Ännu har inte brytpunkten inträffat, layouten är densamma som tidigare."]

Så här blir det när brytpunkten passerats.

[FIGURE src=image/webtec/style-it/responsive_699.png?w=w3 caption="Nu har brytpunktens CSS-regler gått in och med hjälp av flex-konstruktioner så har innehållet stackats."]

Vi kan göra enligt samma princip för footern. Jag lägger till en ny regel som bryter när sidan är 650 pixlar eller mindre.

```css
@media (max-width: 650px) {
    .footer .row {
        flex-wrap: wrap;
    }

    .footer .row > .col3 {
        width: 100%;
    }
}
```

Här kan vi se när regeln slår in på en sidobredd av 649 pixlar.

[FIGURE src=image/webtec/style-it/responsive_649.png?w=w3 caption="Nu har brytpunktens CSS-regler gått in och med hjälp av flex-konstruktioner så har innehållet stackats."]

Detta är grundprincipen i en responsiv webbplats, man justerar hur innehållet presenteras vid olika bredder av sidan.



Avslutningsvis {#avslutning}
--------------------------------------

Det var en genomgång av ett antal CSS konstruktioner som är bra att ha när man bygger upp och stylar en webbplats olika delar.

Du bör nu ha en bas att utgå ifrån och du kan anan hur saker hänger ihop och påverkar varandra.

Ett bra steg att gå vidare är att fördjupa sig i de CSS konstruktioner som finns rent allmänt. Använd någon av de resurser som nämndes i inledningen av artikeln.
