---
author: nik
category:
    - npm
    - sass
    - design
revision:
    "2020-11-01": (A, nik) Skapad inför HT2020.
...
Ikoner och fonter {#intro}
=====================================

I denna artikel jobbar vi vidare med SASS där vi ska se hur man kan ladda in fonter och ikoner. Vi väljer att arbeta med de [två mest populära fontbiblioteken](https://www.wappalyzer.com/technologies/font-scripts/), [Font Awesome](https://fontawesome.com/) och [Google Font](https://fonts.google.com/).
Vi använder oss av SASS-moduler och `npm` för att kunna installera och hantera de fonter och ikoner vi vill använda.

[FIGURE src=https://fontawesome.com/images/open-graph.png caption="Font Awesome"]

<!--more-->

Förutsättningar {#forutsattningar}
-------------------------------------
Du har installerat [nodejs och npm](https://dbwebb.se/kunskap/installera-node-och-npm) och du har jobbat igenom artikeln "[Kom igång med SASS och npm](kunskap/kom-igang-med-sass-och-npm)".

Innan du börjar övningen {#forutsattningar}
-------------------------------------
Denna övning är tänkt att göras i ditt egna tema. Om du känner dig osäker så kan du alltid göra en kopia på ditt tema (ex `theme/aurora` till `theme/auroratest`) innan du påbörjar övningen så kan du alltid gå tillbaka till något du vet fungerade.

Du kan uppnå samma sak med hjälp utav `git` genom att göra `git restore <filnamn>` så länge du inte gjort en commit på dina ändringar. Det återställer filen till så den var vid din senaste commit av den filen. Du kan se vilka filer du uppdaterat med hjälp utav `git status`.

Font Awesome {#fontawesome}
----------------------------

Font Awesome är det näst mest populära fontbiblioteket, strax efter Google Fonts. Vi väljer att använda det för att kunna lägga till ikoner på vår hemsida, där vi i denna artikeln visar hur man kan lägga till ikoner till våra meny alternativ.

Martin har redan skämt bort oss genom att inkludera Font Awesome, men vi vill göra det via SASS istället, nu när vi lärt oss det. Så vi börjar med att rensa bort det gamla:

```bash
# Stå i me/portfolio/themes
rm -rd shared/css shared/fonts
```

Samt ta bort följande del i vår twig-fils `<head>`-element.

```html
<link rel="stylesheet" href="{{ theme_url }}/../shared/css/font-awsome.min.css" type="text/css" />
```

## Installation {#installation}

<!-- Vi börjar med att ladda ner de nödvändiga filerna som behövs. Går vi in på Font Awesome hemsida kan vi se att vi kan [ladda hem dem via npm](https://fontawesome.com/how-to-use/on-the-web/setup/using-package-managers). Det känns som en bra lösning för oss. -->

[INFO]
Pågrund av en ändring hos Font Awesome så ger deras SASS-filer oss ett felmeddelande. Vi väljer därför att istället använda en patchad version lokalt.
[/INFO]

Vi kopierar över våra patchade filer ifrån `example/font-awesome-fix/` och lägger dom i vår `shared/`-mapp så de kan användas i alla teman vi har.

```bash
# Stå i me/portfolio/themes
rsync -rd ../../../example/font-awesome-fix/fontawesome/ shared/fontawesome
```

`scss/`-mappen innehåller SASS-filerna som laddar in våra fonter och `webfonts/`-mappen innehåller de nödvändiga font-filerna. Vi dubbelkollar att samtliga filer är på plats med hjälp utav `tree`-kommandot.

```bash
[Aurora](~/git/update/design/me/portfolio/themes) $ tree -I node_modules .
.
├── example
│   ├── css
│   │   ├── mobile-menu.css
│   │   └── style.css
│   ├── incl
│   │   ├── footer.twig
│   │   ├── header.twig
│   │   └── nav.twig
│   ├── index.twig
│   └── pico-theme.yml
├── kmom02
│   ├── css
│   │   ├── mobile-menu.css
│   │   └── style.css
│   ├── incl
│   │   ├── footer.twig
│   │   ├── header.twig
│   │   └── nav.twig
│   ├── index.twig
│   ├── pico-theme.yml
│   └── scss
│       ├── blockquotes.scss
│       ├── code.scss
│       ├── mobile-nav.scss
│       ├── style.scss
│       └── variables.scss
├── package-lock.json
├── package.json
└── shared
    ├── fontawesome
    │   ├── scss
    │   │   ├── _animated.scss
    │   │   ├── _bordered-pulled.scss
    │   │   ├── _core.scss
    │   │   ├── _fixed-width.scss
    │   │   ├── _icons.scss
    │   │   ├── _larger.scss
    │   │   ├── _list.scss
    │   │   ├── _mixins.scss
    │   │   ├── _rotated-flipped.scss
    │   │   ├── _screen-reader.scss
    │   │   ├── _shims.scss
    │   │   ├── _stacked.scss
    │   │   ├── _variables.scss
    │   │   ├── brands.scss
    │   │   ├── fontawesome.scss
    │   │   ├── regular.scss
    │   │   ├── solid.scss
    │   │   └── v4-shims.scss
    │   └── webfonts
    │       ├── fa-brands-400.eot
    │       ├── fa-brands-400.svg
    │       ├── fa-brands-400.ttf
    │       ├── fa-brands-400.woff
    │       ├── fa-brands-400.woff2
    │       ├── fa-regular-400.eot
    │       ├── fa-regular-400.svg
    │       ├── fa-regular-400.ttf
    │       ├── fa-regular-400.woff
    │       ├── fa-regular-400.woff2
    │       ├── fa-solid-900.eot
    │       ├── fa-solid-900.svg
    │       ├── fa-solid-900.ttf
    │       ├── fa-solid-900.woff
    │       └── fa-solid-900.woff2
    ├── img
    │   └── favicon.ico
    └── js
        ├── modernizr-3.3.1-custom.min.js
        ├── responsive-navbar.js
        └── utils.js

13 directories, 58 files
```

## Inkludera med SASS {#inkludera}

Nu ska vi ladda in våra fonter via vår egna SASS-fil, i mitt fall `themes/kmom02/scss/style.scss`. Jag öppnar filen och lägger till följande rader längst upp.

```scss
@import '../../shared/fontawesome/scss/fontawesome';
$fa-font-path: '../../shared/fontawesome/webfonts';
@import '../../shared/fontawesome/scss/brands';
@import '../../shared/fontawesome/scss/solid';
@import '../../shared/fontawesome/scss/regular';
```

Vi kollar vad varje rad gör. Första importerar grundmodulen för Font Awesome, den som mappar klassnamnen vi använder mot vilken ikon som ska laddas in. Sen så uppdaterar vi vart vi lagt våra fonter. Ursprungligen utgår det ifrån den `.scss` fil man "kompilerar", i mitt fall `aurora/scss/style.scss`. Så jag behöver stega i filträdet tills jag hittar till `shared/webfonts`.

Till sist laddar vi in tre typer av ikoner (fonter): Brands, Solid och Regular. Då ska allt vara på plats på SASS-delen.

## Uppdatera Twig {#uppdatera-twig}

Nu ska vi se hur vi kan använda våra nya ikoner i vår HTML (Twig). Till och börja med vill jag uppdatera så min Github-ikon i footern fortfarande fungerar. Såhär ser min footer ut just nu.

```html
<div class="container">
    <div class="social">
        {% for social in pages["_meta"].meta.social %}
            <a href="{{ social.url }}" title="{{ social.title }}" role="button">
                <i class="fa fa-{{ social.icon }}" aria-hidden="true"></i>
                <span class="sr-only">{{ social.title }}</span>
            </a>
        {% endfor %}
    </div>
    <p>
        En footer med lite text.
    </p>
</div>
```

Den relevanta delen är `<i>`-elementet, där vi ska uppdatera så vi kan använda ikoner ifrån både Solid, Brand och Regular. Om jag går in på Font Awesome hemsida och söker upp en ikon, [t.ex Github](https://fontawesome.com/icons/github?style=brands) så kan jag längst upp se vilken klass som ska ligga på elementet för att den ska visa GitHub ikonen.

[FIGURE src=image/design-v3/github-fontawesome.png caption="GitHub ikonen på FontAwesome"]

Vi löser detta genom att skriva om vårt `<i>`-element till följande

```html
<i class="{{ social.icon }}" aria-hidden="true"></i>
```

samt uppdaterar vår `portfolio/content/_meta.md` så den använder hela klassnamnet:

```
# Innan
- title: Link till sidans github repo.
  url: https://github.com/AuroraBTH
  icon: github
# Efter
- title: Link till sidans github repo.
  url: https://github.com/AuroraBTH
  icon: fab fa-github
```

Vi laddar om sidan och ser att vi nu laddar in Font Awesome via SASS istället.

Google Fonts {#googlefonts}
----------------------------

Vår sida börjar få en lite mer unik känsla, med eget tema, egen layout och egenvalda ikoner. Men att vi använder standard fonten är lite tråkigt. Jag hoppar in på [Google Fonts](https://fonts.google.com/) och väljer två fonter, en för brödtext och en för rubriker.

Jag börjar med att leta upp en till min brödtext och nöjer mig med Open Sans, det är en stilren font som jag personligen tycker om. Om jag trycker in på fonten och skrollar ner lite på sidan så kan jag hitta ett stycke som heter "Popular pairings with Open Sans". Här kan jag se fonter som passar bra tillsammans med Open Sans och hur de ser ut tillsammans i en preview bredvid. Roboto och Open sans, ja varför inte?

[FIGURE src=image/design-v3/google-font-opensans-roboto.png caption="Vilka fonter passar med varandra?"]

## Ladda in fonterna {#ladda}

Nu ska vi ladda in våra två fonter, Roboto och Open Sans, samt applicera dem. Jag är nöjd med att ladda in 400 Regular, så jag trycker på "Select this style" för Open Sans och Roboto och ser att de läggs till i menyn längst upp till höger. Vi vill ladda in dem som `@import`, så vi markerar det alternativet och kopierar koden mellan `<style>`-taggarna in till vår stylesheet, `theme/aurora/scss/style.scss`.

[FIGURE src=image/design-v3/fontval.png caption="Roboto och Open Sans valda"]

Under står sen hur man applicerar fonten, jag väljer att lägga 'Open Sans' på mina rubriker och 'Roboto' på min resten. Såhär kan det se ut i min `theme/aurora/scss/style.scss`.

```css
/* Under mina övriga imports */
@import url('https://fonts.googleapis.com/css2?family=Open+Sans&family=Roboto&display=swap');

* {
    font-family: 'Roboto', sans-serif;
}

h1, h2, h3, h4, h5, h6 {
    font-family: 'Open Sans', sans-serif;
}
/* Resten av min stylesheet */
```

Avslutningsvis {#avslutningsvis}
----------------------------

Så nu vet vi hur man laddar in både ikoner och fonter ifrån externa sidor, en bra övning och något som är viktigt att kunna som webbutvecklare. Men med nya möjligheter kommer ett stort ansvar. Använd en måttlig mängd ikoner på din sida och använd alltid ikoner som är förklarande för sitt syfte.
