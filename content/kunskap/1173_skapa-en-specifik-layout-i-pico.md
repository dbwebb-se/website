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

Jag utgår från att ni har ett eget tema under `themes/<temanamn>`. Mitt tema, `themes/aurora` innehåller innan övningen följande filer:

```bash
[Aurora](~/git/student/design/me/portfolio) $ tree themes/aurora/
themes/aurora/
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
cp index.twig report.twig
```

Jag uppdaterar `themes/aurora/report.twig` så jag vet att jag hamnar på rätt sida genom att lägga till en `<h1>`:

```html
<!-- Header (ca rad 65) -->
<div class="main" role="main">
    <h1>Vår egen layout från report.twig</h1>
    <div class="container">
        {{ content }}
    </div>
</div>
<!-- Footer (ca rad 72) -->
```

För att se ladda in vår nya layout så är det så enkelt som att uppdatera vår meta-information i den Markdown fil som vi vill använda layouten i. Jag hoppar in i `content/report/index.md` som är min landningssida för report och skriver dit följande längst upp i meta-informationen:

```markdown
---
Title: Report
Description: This is my report page.
Template: report
---
```

Det nya är att vi bestämmer vilken Template vi vill använda, genom att lägga till `Template: report`. Den kollar då i tema-mappen för det valda temat efter en `report.twig` (som vi skapade innan). Vi sparar och laddar om och ser nu att vi har vår gamla report-sida, fast med en ny `<h1>`. Härligt.

[FIGURE src=image/design-v3/report-twig.png caption="Såhär kan vår nya layout i report se ut"]

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

Sen så ska vi lägga dit varje kursmoment. I och med att det går att skriva HTML i våra Markdown-filer tycker jag det känns som en mer rätt väg att gå än att hårdkoda vår layout (även om den bara används på denna sidan). I min `content/report/index.md`, under meta-informationen, så lägger jag till samtliga kursmoment med en div runtomkring sig:

```
Report
==========================

<div class="kmom-box">
Kmom01
</div>

<div class="kmom-box">
Kmom02
</div>

<div class="kmom-box">
Kmom03
</div>

<div class="kmom-box">
Kmom04
</div>

<div class="kmom-box">
Kmom05
</div>

<div class="kmom-box">
Kmom06
</div>

<div class="kmom-box project">
Kmom10
</div>
```

Det var det vi behövde göra i vår HTML, nu har jag en rätt bra grund för att skapa mig ett grid, så som vi gjorde i guiden. Resten kan vi lösa via SASS. Jag börjar med att göra en ny fil, `themes/aurora/scss/report.scss` som får innehålla allt som har med denna layout att göra, det blir renare. PS, glöm inte att importera den!

### SASS {#sass}

[INFO]
Ett tips är att använda sig utav Firefox när man utvecklar Grid. De har ett inbyggt system för att visualisera det via devtools (vilket är det ni kommer se i resterande del av guiden).

[FIGURE src=image/design-v3/grid-devtools.png caption="Ännu ett sätt devtools kan hjälpa oss"]

[/INFO]

Jag börjar med att säga att jag vill använda grid på min `.landingpage` som är den omslutande div:en.

```scss
/* report.scss */
.landingpage {
    display: grid;
}
```

Vi kan testköra här och se vad som händer, `npm run style`.

[FIGURE src=image/design-v3/grid-task-1.png caption="Steg 1"]

Ja det var ju inte så spännande. Men det kan vi lösa med några steg till. Jag börjar med att säga att min rubrik ska sträcka sig över 3 kolumner. Jag lägger även till `justify-self: center` för att centrera den i dessa tre kolumner.

```scss
.landingpage h1 {
    grid-column: span 3;
    justify-self: center;
}
```

Vi testar igen och ser att resultatet redan nu ser ganska bra ut. Anledningen till att detta fungerar som det gör nedan är för att vi sätter vårt grid till tre i bredd (med hjälp utav `grid-column: span 3`). Standard så tar varje element i vårt grid upp en ruta, så vi får följande resultat:

[FIGURE src=image/design-v3/grid-task-2.png caption="Steg 2"]

Vi applicerar samma `grid-column: span 3` till vår kmom10, det är ju trots allt ett projekt som tar lite längre tid än kursmomenten.

```scss
.kmom-box.project {
    grid-column: span 3;
}
```

Visuellt just nu ser vi ingen skillnad, men om du håller på div:en i devtools ser du att den har 100% bredd. Sista saken jag tänkte visa i denna artikel, innan ni får köra själva, är ett sett att fixa spacingen i ett grid. Jag utökar min `.landingpage` klass:

```scss
.landingpage {
    display: grid;
    gap: 1em 1em;
}
```

Vilket lägger en 1em mellan alla delar i gridet. Det kan se ut såhär:

[FIGURE src=image/design-v3/grid-task-3.png caption"Steg 3"]



Fullständigt exempel {#complete}
-------------------------------------

I `example/report_grid` ([GitHub-repot](https://github.com/dbwebb-se/design-v3/tree/master/example/report_grid)) finns ett fullständigt exempel. i `content/report` finns allt innehåll och i `themes/example` finns mallar och stil i filerna `reports.twig`, `report.twig` och `style.css`.



Avslutningsvis {#avslutningsvis}
-------------------------------------

Nu har jag visat grunden för att ni ska kunna göra er landningssida. I uppgiften så ska ni lösa så den fungerar repsponsivt och mitt tips är att kolla lite extra på `grid-column: span X` och testa runt tillsammans med media queries. Lycka till!
