---
author: nik
category:
    - pico
    - layout
    - grid
    - flex
revision:
    "2020-11-12": (A, nik) Skapad inför HT2020.
...
Skapa en specifik layout i Pico {#intro}
====================================

I denna artikel så ska vi först börja med att kolla på hur man kan skapa en specifik layout i Pico och sen hur vi kan använda CSS-Grid för att placera ut saker på vår sida.



<!--more-->



Förutsättningar {#forutsattningar}
-------------------------------------

Du har jobbat igenom följande tre delar i "[Design med HTML5 och CSS3](guide/design-med-html5-och-css3)"

* [CSS Grid Layout](guide/design-med-html5-och-css3/css-grid-layout)
* [Flexbox - Parent Elements](guide/design-med-html5-och-css3/flexbox)
* [Flexbox - Child Elements](guide/design-med-html5-och-css3/flexbox-del2)



Unik Layout {#unik}
-------------------------------------

Jag utgår från att ni har ett eget tema under `themes/<temanamn>`. Mitt tema, `themes/kmom02` innehåller innan övningen följande filer:

```bash
[Aurora](~/git/student/design/me/portfolio) $ tree themes/kmom02/
themes/kmom02/
├── css
│   ├── style.css
│   └── style.min.css
├── index.twig
├── pico-theme.yml
└── scss
    ├── old.css
    └── style.scss

2 directories, 6 files
```

Så nu ska vi fixa en landningssida med hjälp vår egen layout-fil, så vi börjar med att göra en kopia av vår förra layout (`index.twig`):

```bash
# Stå i me/portfolio/themes/<erttema>
cp index.twig technologies.twig
```

Jag uppdaterar `themes/kmom02/technologies.twig` så jag vet att jag hamnar på rätt sida genom att lägga till en `<h1>`:

```html
{% include 'incl/header.twig' %}

<body>
    {% include 'incl/nav.twig' %}

    <div class="main" role="main">
        <h1>Vår egen layout från technologies.twig</h1>
        <div class="container">
            {{ content }}
        </div>
    </div>

    {% include 'incl/footer.twig' %}
</body>

</html>
```

För att sen ladda in vår nya layout så är det så enkelt som att uppdatera vår meta-information i den Markdown fil som vi vill använda layouten i. Skapa och hoppa in i filen `content/technology/index.md` som blir vår landningssida för teknologi-sidan och skriv dit följande längst upp i meta-informationen:

```markdown
---
Title: Technologies
Description: This is my technologies page.
Template: technologies
---
```

Det nya är att vi bestämmer vilken Template vi vill använda, genom att lägga till `Template: technologies`. Den kollar då i tema-mappen för det valda temat efter en `technologies.twig` (som vi skapade innan). Vi sparar och laddar om och ser nu att vi har en sida med en rubrik, men som annars är tom, så låt oss fylla den.



Grid baserad sida {#grid}
-------------------------------------

Nu ska vi uppdatera vår layout så att den använder sig utav grid, iallafall content-delen av sidan. Jag är nöjd med allt som ligger utanför den nuvarande `div` som kallas "main" och utgår ifrån samma lilla del av koden jag länkade ovan. Jag rensar ut föregående innehåll, så det ser ut såhär:

```html
<div class="main" role="main">
    <div class="landingpage">
        {{ content }}
    </div>
</div>
```

Sen så ska vi lägga dit varje kursmoment. I och med att det går att skriva HTML i våra Markdown-filer tycker jag det känns som en mer rätt väg att gå än att hårdkoda vår layout (även om den bara används på denna sidan). I min `content/technology/index.md`, under meta-informationen, så lägger jag till samtliga kursmoment med en div runtomkring sig:

```
Technologies
==========================

<div class="box">
CSS
</div>

<div class="box">
HTML
</div>

<div class="box">
JAVASCRIPT
</div>

<div class="box">
PHP
</div>

<div class="box">
PYTHON
</div>

<div class="box">
GIT
</div>

<div class="box wide">
SQLITE
</div>
```

Det var det vi behövde göra i vår HTML, nu har jag en rätt bra grund för att skapa mig ett grid, så som vi gjorde i guiden. Resten kan vi lösa via SASS. Jag börjar med att göra en ny fil, `themes/kmom02/scss/technology.scss` som får innehålla allt som har med denna layout att göra, det blir renare. PS, glöm inte att importera den!



### SASS {#sass}

[INFO]
Ett tips är att använda sig utav Firefox när man utvecklar Grid. De har ett inbyggt system för att visualisera det via devtools (vilket är det ni kommer se i resterande del av guiden).

[FIGURE src=image/design-v3/grid-devtools.png caption="Ännu ett sätt devtools kan hjälpa oss"]

[/INFO]

Jag börjar med att säga att jag vill använda grid på min `.landingpage` som är den omslutande div:en.

```scss
/* technology.scss */
.landingpage {
    display: grid;
}
```

Vi kan testköra här och se vad som händer, `npm run style`.

[FIGURE src=image/design-v3/grid-devtools.png caption="Steg 1"]

Ja det var ju inte så spännande. Men det kan vi lösa med några steg till. Jag börjar med att säga att min rubrik ska sträcka sig över 3 kolumner. Jag lägger även till `justify-self: center` för att centrera den i dessa tre kolumner.

```scss
.landingpage h1 {
    grid-column: span 3;
    justify-self: center;
}
```

Vi testar igen och ser att resultatet redan nu ser ganska bra ut. Anledningen till att detta fungerar som det gör nedan är för att vi sätter vårt grid till tre i bredd (med hjälp utav `grid-column: span 3`). Standard så tar varje element i vårt grid upp en ruta, så vi får följande resultat:

[FIGURE src=image/design-v3/grid-task-2.png caption="Steg 2"]

Sista saken jag tänkte visa i denna artikel, innan ni får köra själva, är ett sett att fixa spacingen i ett grid. Jag utökar min `.landingpage` klass:

```scss
.landingpage {
    display: grid;
    gap: 1em 1em;
}
```

Vilket lägger en 1em mellan alla delar i gridet. Det kan se ut såhär:

[FIGURE src=image/design-v3/grid-task-3.png caption"Steg 3"]



Avslutningsvis {#avslutningsvis}
-------------------------------------

Nu har jag visat grunden för att ni ska kunna göra er landningssida. I uppgiften så ska ni lösa så den fungerar repsponsivt och mitt tips är att kolla lite extra på `grid-column: span X` och testa runt tillsammans med media queries. Lycka till!
