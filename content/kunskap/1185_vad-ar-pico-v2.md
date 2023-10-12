---
author:
    - nik
    - efo
category:
    - design
    - pico
revision:
    "2021-10-11": (C, efo) La till chmod -R 777.
    "2021-08-04": (B, nik) Uppdaterad inför HT2021.
    "2020-10-12": (A, nik) Skapad inför HT2020.
...
Vad är Pico? {#inledning}
==================================

Pico är ett CMS, Content Management System, som tillåter användaren att hantera innehållet på en sida utan att behöva "koda" sidan själv. Det finns flera andra stora alternativ, så som WordPress, Drupal och Grav, men i denna kursen ville vi ha ett tunnare ramverk som låter oss fokusera på design-aspekten av webbutveckling. Pico är även ett "flat-file" CMS, vilket innebär att man jobbar emot filer istället för en databas, ungefär så som [dbwebb (Github)](https://github.com/dbwebb-se/website) är uppbyggt.

<!--more-->

Vi ska i denna artikel introducera er till grunderna inom Pico och hur man kan jobba med ett CMS. Några saker vi kommer kolla på är Pico som ramverk, hur det fungerar, dess mappstruktur, hur man lägger till nytt innehåll samt hur man kan jobba med sin layout och stil på sidan.

Om det är något mer man eftertraktar kan man alltid hoppa in i [Pico's dokumentation](http://picocms.org/docs/).

Kopiera filerna {#kopiera}
--------------------------------------

Vi börjar med att kopiera över filerna ifrån `example/portfolio`, så ni kan testa runt under tiden ni läser igenom artikeln.

```bash
# Stå i rooten av kursrepot
rsync -ravd example/portfolio/ me/portfolio/
cd me/portfolio
composer install
```

Om det uppstår problem där felutskriften säger att det saknas php paket med kommandot `composer install` kan följande kommando lösa bekymrat: `sudo apt-get install php-xml php-mbstring`.

Ovanstående kodstycke installerar även de nödvändiga paketen som Pico använder sig av med hjälp utav Composer, som är vår pakethanterare för PHP.

Mappstruktur {#mapp}
--------------------------------------

Vi börjar med att kolla på hur mappstrukturen ser ut för vår grundläggande portfolio-sida som kommer utvecklas under kurens gång.

```bash
.
├── assets/
│   ├── cimage/
│   └── img/
├── cache/
│   └── cimage/
├── composer.json
├── composer.lock
├── config/
│   ├── config.php
│   └── config.yml
├── content/
│   ├── 404.md
│   ├── _meta.md
│   ├── docs/
│   └── index.md
├── index.php
├── plugins/
├── themes/
│   ├── example/
│   └── shared/
└── vendor/
```

Det kan se ut som lite mycket i början, men vi stegar igenom det.

* `assets/`-mappen innehåller två mappar.
    * `assets/img/` är där vi lägger de bilder vi vill använda på sidan. Bilderna kan vi sedan nå i våra Markdown-filer genom en inbyggd variabel i Pico, `%assets_url%`, t.ex. `%assets_url%/img/tree2.jpg`.
    * `assets/cimage` är en bildhanterare vi kommer jobba med senare under kursen som ligger med i grundinstallationen för att underlätta.
* `cache/`-mappen innehåller våra cache:ade filer, i detta fallet bilder som bearbetas av CImage. Detta är för att Cimage ska slippa behöva arbeta med våra filer varje gång vi laddar hemsidan. Mer om detta kommer senare i kursen, [kmom05 - Bilder](kurser/design-v3/kmom05).
* `composer.json` är en informationsfil för Composer. Den säger vilka paket vi behöver, utöver annan information om vårt projekt. Tre paket hämtas just nu, `picocms/pico` som är Pico-ramverket, `mos/cimage` som är vår bildhanterare längre fram i kursen och `erusev/parsedown-extra`, som är en extension till våra Markdown-filer. `composer.lock` är en autogenererad fil som säger vilka versioner av paketen som installerats.
* `config/`-mappen innehåller lite olika konfigurationsfiler för vår hemsida. `config/config.php` innehåller, som ni kanske känner igen ifrån webtec (tidigare htmlphp), vårt egna sätt att starta unika sessioner på studentservern. `config/config.yml` innehåller en hel del inställningar för Pico som man kan grotta sig ner i, men inget vi går på djupet med just nu.
* `content/`-mappen innehåller själva innehållet på sidan, i Markdown-filer (`.md`). Vi går igenom detta mer i nästa stycke.
* `index.php` är startsidan till vår portfolio och laddar all nödvändig kod för ramverket.
* `plugins/`-mappen innehåller eventuella plugins till Pico, men är inget vi använder i kursen.
* `themes/`-mappen innehåller våra teman, som i nuläget är `themes/example` som är en grundläggande layout tillsammans med en så kallad hamburgarmeny..
    * `themes/shared` är filer som är delade mellan de olika teman vi kommer skapa. Vi kollar mer på det längre ner i artikeln.
* `vendor/`-mappen innehåller alla moduler vi hämtar hem med hjälp av Composer (och vår `composer.json`). Den här mappen kan ni helt bortse ifrån.

Som sagt, det är en hel del filer och mappar, men de tre viktiga vi tar med oss är:

* `assets/img/` som kommer innehålla våra lokala bilder.
* `content/` som kommer innehålla våra Markdown-filer (vårt innehåll).
* `themes/` som kommer innehålla vår layout och CSS/SASS-filer.

Innehåll {#innehall}
--------------------------------------

Rimligen vill vi fylla vår sida med innehåll, även i en design-kurs. När vi ska lägga till innehåll på sidan så arbetar vi främst emot vår `content/`-mapp, där länkar, navigering och liknande genereras automatiskt utav Pico.

Filerna skrivs i Markdown, som ni kan hitta mer läsmaterial om [här](kurser/design-v3/kmom01#markdown).

### Meta {#meta}

`_meta.md` innehåller meta information som varje sida i dess mapp får. Vi kan öppna den och se vad som menas med meta information:

```
---
Logo: image/leaf_256x256.png
Tagline: My portfolio.
Social:
    - title: Link till sidans github repo.
      url: https://github.com/dbwebb-se/design-v3
      icon: github
---
```

[FIGURE src=/image/design-v3/pico-meta-v2.png]

* Logo (rött): säger vilken logotyp vi vill använda på sidan, denna variabel används sen i vår layout för att visa en bild längst upp till vänster.
* Tagline (blått): En tagline för vår sida, visas under sidans namn i vår header.
* Social: Länkar till eventuella sociala medier i vår footer, i nuläget en länk till sidans kursrepo på Github. Ikonerna laddas in ifrån FontAwesome, så de flesta därifrån borde fungera.

Om du inte kan ladda bilden i exemplet bör du ändra rättigheter för `cache`-katalogen.

```shell
# stå i me/portfolio
chmod -R 777 cache
```



### Index {#indexmd}

`index.md` är vårt startsida, precis som `index.php` eller `index.html` hade varit vår startsida om vi jobbade med ren PHP/HTML. Man bör ha en `index.md` för varje mapp, som exempel kan vi se `content/index.md` men även `content/docs/index.md`.



### 404 {#404md}

`404.md` är vår 404-sida. Det är där vi hamnar om vi försöker gå till en sida som Pico inte kan hitta.



### Eget innehåll {#eget-innehall}

Vi testar att lägga till eget innehåll och skapar en ny sida `content/hobby.md`. I vår `content/hobby.md` så börjar vi med att lägga till lite meta information som behövs för att den ska synas i vår navigering och sen text om en hobby.

```
---
Title: Hobby
Description: Page about my hobby
---

Min hobby
==================

Jag har sedan innan jag kunde gå sprungit orientering. Det är en härlig sport ute i skogen med utmaningar för både kropp och knopp.

```



Layout {#layout}
--------------------------------------

Men fokuset i kursen är design och en del av design är att arbeta med sin layout på sidan. Pico har valt att använda Twig, som är en template engine som ofta används inom PHP. Den har snarlik syntax till EJS som är en av de vanligaste template engine inom JavaScript och något ni kommer jobba mer med i databas-kursen.

Det går att läsa på mer om de olika funktionerna som är tillgängliga i Twig i deras [dokumentation](https://twig.symfony.com/doc/3.x/).

[INFO]
**Editor plugins**

Syntax:en kan se lite lustig ut då Atom och VSCode tror att det är HTML-filer. Om man kollar [Twigs dokumentation](https://twig.symfony.com/doc/3.x/templates.html#ides-integration) kan man se vilka paket som löser syntaxen:

* Atom via the [PHP-twig for atom](https://github.com/reesef/php-twig)
* Visual Studio Code via the [Twig pack](https://marketplace.visualstudio.com/items?itemName=bajdzis.vscode-twig-pack)

[/INFO]

### Vår layout {#var-layout}

I `themes/example/index.twig` så kan vi se vår default-layout. Den består egentligen utav vanlig HTML, plus lite syntax ifrån Twig. Den använder sig också utav includes, något ni kanske känner igen ifrån webtec (tidigare htmlphp). Jag stegar iallafall igenom den, så ni har hyfsad koll på vad som är vad.

```html
{% include 'incl/header.twig' %}

<body>
    {% include 'incl/nav.twig' %}

    <div class="main" role="main">
        {{ content }}
    </div>

    {% include 'incl/footer.twig' %}
</body>

</html>
```

### Head-elementet {#head}

Vi inleder med att inkludera vår header-fil, `portfolio/themes/example/incl/header.twig`. Den har en del grejer ni känner igen och en del nytt, men såhär ser den ut:

```html
<!DOCTYPE html>
<html class="no-js">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>{% if meta.title %}{{ meta.title }} | {% endif %}{{ site_title }}</title>

    {% if meta.description %}
    <meta name="description" content="{{ meta.description|striptags }}" />
    {% endif %}

    {% if current_page %}
    <link rel="canonical" href="{{ current_page.url }}" />
    {% endif %}

    <link rel="icon" href="{{ theme_url }}/../shared/img/favicon.ico">
    <link rel="stylesheet" href="{{ theme_url }}/../shared/css/font-awsome.min.css" type="text/css" />
    <link rel="stylesheet" href="{{ theme_url }}/css/mobile-menu.css" type="text/css" />
    <link rel="stylesheet" href="{{ theme_url }}/css/style.css" type="text/css" />
</head>
```

De första fem raderna är inget nytt, men på sjätte så ser vi hur Twig jobbar med variabler. Här hämtas vår sido-titel ifrån meta-informationen i vår Markdown-fil. Ni kanske minns att vi hade `Title: Report` med på våra rapport-sidor? Den variabeln skrivs nu ut med hjälp utav Twig.

De två viktiga sakerna att ha koll på med Twig-syntax är utskrift av variabler, som sker med hjälp utav `{{}}` som vi ser används för att skriva ut `meta.title` (`{{ meta.title }}`). Den andra är `{{% ... %}}` som används för logik. Det kan vi se på if-satsen som kollar ifall `meta.title` är satt eller inte (`{% if meta.title %}`).

Samma sak används för att skriva ut vår beskrivning på sidan och canonical, vilket båda hjälper oss med sökmotorer, men inget som är kritiskt för oss.

Sen så kommer länkarna ni känner igen, vår favicon och våra CSS-filer. Skillnaden ifrån tidigare är att vi jobbar utifrån en variabel, `{{ theme_url }}`, när vi ska ladda in filerna. Den variabeln pekar till vårt default-tema, i detta fallet `portfolio/themes/example`.

### Body {#body}

Body-delen är lite stor att ta i ett svep, så jag tar varje include för sig själv men går överskådligt igenom resterande del av `themes/example/index.twig`.

```html
<body>
    {% include 'incl/nav.twig' %}

    <div class="main" role="main">
        {{ content }}
    </div>

    {% include 'incl/footer.twig' %}
</body>

</html>
```

Inledningsvis har vi `{% include 'incl/nav.twig' %}`, som innehåller vårt `<header>`-element och desktop/mobil navigering. Sen har vi vårt huvudinnehåll som skapas ifrån de Markdown-filer vi skapar i `content` och till sist har vi `{% include 'incl/footer.twig' %}` som är vår footer för sidan.

#### Header {#header}

Vår `themes/example/incl/nav.twig` innehåller följande:

```html
<div class="header" role="banner">
    <div class="site-header">
        {% if pages["_meta"].meta.logo %}
        <div class="logo">
            <a href="{{ base_url }}">
                <img src="{{ base_url }}/{{ pages["_meta"].meta.logo|url }}" alt="" />
            </a>
        </div>
        {% endif %}
        <div class="title" {{ pages["_meta"].meta.tagline ? ' class="tagline"' }}>
            <a href="{{ base_url }}">
                <h1>{{ site_title }}</h1>
                {{ pages["_meta"].meta.tagline|markdown }}
            </a>
        </div>
        <a class="nav-toggle" id="nav-toggle" title="Toggle Menu" role="button" aria-controls="nav" aria-expanded="false"
            tabindex="1">
            <i class="fa fa-bars" aria-hidden="true" id="toggler"></i>
            <span class="sr-only">Toggle Menu</span>
        </a>
    </div>
    <div class="nav">
        <div id="nav" role="navigation" tabindex="-1">
            <ul>
                {% for page in pages(depthOffset=-1) if page.title and not page.hidden %}
                    <li{% if page.id==current_page.id %} class="active" {% endif %}>
                        <a href="{{ page.url }}">{{ page.title }}</a>
                    </li>
                {% endfor %}
            </ul>
        </div>
    </div>
</div>
```

Till att börja med, en omslutande div som innehåller vår `.site-header` och `.nav`. `.site-header` innehåller en logotyp, som vi definierat i `content/_meta.md`, sidans titel och vår tagline. Längst ner har vi även utskriften av ikonen till hamburgaremenyn.

`.nav`-div:en innehåller vår navigering och autogenereras ifrån innehållet i `content/`-mappen (förutsatt att allt fungerar som det ska). Den lägger även till klassen `.active` på den länken som vi i nuläget är inne på, bra för oss sen när vi ska pilla på temat.

#### Footer {#footer}

Sist har vi inkluderingen av vår footer, `themes/example/incl/footer.twig`:

```html
<div class="footer">
    <div>
        <p>
            En footer med lite text.
        </p>
    </div>
    <div class="social">
        <!-- Loads from FontAwesome (themes/shared/css/font-awesome.min.css) -->
        {% for social in pages["_meta"].meta.social %}
        <a href="{{ social.url }}" title="{{ social.title }}" role="button">
            <i class="fa fa-{{ social.icon }}" aria-hidden="true"></i>
            <span class="sr-only">{{ social.title }}</span>
        </a>
        {% endfor %}
    </div>
</div>

<script src="{{ theme_url }}/../shared//js/modernizr-3.3.1-custom.min.js" type="text/javascript"></script>
<script src="{{ theme_url }}/../shared//js/utils.js" type="text/javascript"></script>
<script src="{{ theme_url }}/../shared//js/responsive-navbar.js" type="text/javascript"></script>
```

I det stora hela så är det inte så mycket nytt här heller, en omslutande div med en div för text till vänster och en div för ikon-länkar till höger. Till sist har vi tre JavaScript-filer som gör att vår mobilnavigering fungerar, inget vi behöver tänka mer på.

Tema {#tema}
--------------------------------------

Men var ligger vår CSS? Under `themes/example/css/style.css` så kan ni hitta vårt default-temas CSS-fil. I samma mapp så ligger det även en `themes/example/css/mobile-menu.css` som innehåller de nödvändiga reglerna för mobilmenyn.

Vårt tema består då utav vår layout `themes/example/index.twig` och dess inkluderade filer, tillsammans med våra två CSS-filer (`themes/example/css/style.css` och `themes/example/css/mobile-menu.css`). Men för att göra sidan till er egen så vill vi att ni ska skapa ett eget. Jag väljer att skapa ett nytt tema i mappen `themes/aurora` (här tar ni givetvis ett eget namn). Vi gör en kopia på det temat vi har så ni kan göra ert eget.

```bash
# Stå i `me/portfolio`
# Glöm inte att byta ut aurora mot vad ni vill döpa temat till!
rsync -ravd themes/example/ themes/aurora/
```

För att ladda in det nya temat så behöver jag uppdatera min `theme: default` i `config/config.yml` så den pekar till mitt nya tema, dvs `theme: aurora`. Jag laddar om sidan och den bör se ut exakt som innan. Vi hoppas in och lägger in en bakgrundsfärg i vårt nya tema, för att se att det laddar korrekt.

I `themes/<ert-tema-namn>/css/style.css` så lägger vi in följande rad längst upp:

```css
body {
    background-color: pink;
}
```

Nu har vi en rosa bakgrund och ni har ett eget tema, en grund för att kunna börja leka runt själva. Jag hade börjat med att kolla igenom vad som finns i `style.css`, om det är något ni vill ha kvar eller om ni vill ta bort allt. Ett till tips är att leta inspiration på internet, hitta en design som ni tycker om och försök återskapa den. Lycka till!


Tidigare version {#tidigare-version}
--------------------------------------

Efter feedback ifrån HT2020 så har portfolio-exemplet och dess tillhörande material fått sig en uppdatering. Filerna är nu mer avskalade för att göra det lättare för er att hoppa in och ändra det just ni vill ändra.

Om man är intresserad av de gamla versionerna kan man läsa [Vad är Pico - Version 1](kunskap/vad-ar-pico) och se den gamla portfolion i `example/depricated/portfolio`.

Avslutningsvis {#avslut}
--------------------------------------

Det är mycket vi gått igenom i den här artikeln, allt kommer inte ha fastnat på första rundan, det är helt okej. Om något är oklart kan man alltid kolla tillbaka på artikeln eller dokumentationen, det är så man jobbar. Om det är några frågor eller om något är oklart, hojta till i chatt så kollar vi på det. Annars lycka till och producera mästerverk!
