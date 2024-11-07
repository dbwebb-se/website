---
author: nik
category:
    - npm
    - sass
    - design
revision:
    "2021-08-16": (B, nik) Uppdaterad med version 2 efter feedback.
    "2020-09-29": (A, moc) Skapad inför HT2020.
...
Kom igång med SASS och npm {#intro}
=====================================

Vi har tidigare i kursen skrivit CSS kod för att styla våran webbsida. Även om CSS nu stödjer variabler så saknar den fortfarande funktionalitet som funktioner och matematiska operationer.
Vi skall i denna övningen titta på hur man kan använda sig av pakethanteraren `npm` för att bland annat underlätta stylandet och förbättra webbplatsens laddningstid.



<!--more-->



Förutsättningar {#forutsattningar}
-------------------------------------

Du har installerat [nodejs och npm](https://dbwebb.se/kunskap/installera-node-och-npm).



Innan du börjar övningen {#innan}
-------------------------------------

Innan vi börjar så gör vi en kopia på vårt gamla tema och utgår ifrån det när vi börjar jobba med SASS. Det kommer bli en hel del omstrukturering och det kan vara bra att ha sitt gamla tema att kolla tillbaka på.

```bash
# Stå i me/portfolio (notera / efter ditt temanamn, det flyttar innehållet i mappen till vårt nya tema)
$ rsync -ravd themes/<ditt-tema-namn>/ themes/kmom02
```

Nu borde du ha ditt nya tema i `portfolio/themes/kmom02` och vi kan påbörja vår övergång till SASS. Om du inte vill att ditt tema ska heta kmom02 kan du uppdatera vad mappen heter.



Installera SASS, stylelint och normalize.css via npm {#installera-med-npm}
---------------------------------------------------------------------------

Npm (Node Package Manager) är JavaScripts pakethanterare och världens största programvaruregister med över 800,000 paket. Vem som helst kan publicera sina paket här så det gäller att vara lite försiktig med vad man installerar och använder.

Vi ska använda detta för att installera tre stycken paket:

* [`sass`](https://www.npmjs.com/package/sass) som är en CSS preprocessor vilket tillåter oss att få en bättre struktur. Det kommer ge oss stöd att använda variabler, ta nytta av flera inbyggda funktioner samt göra egna funktioner för att göra vår kod mer återanvändbar och lättare att ändra.
* [`stylelint`](https://www.npmjs.com/package/stylelint) och [`stylelint-config-sass-guidelines`](https://www.npmjs.com/package/stylelint-config-sass-guidelines) som kommer att validera `.scss` koden vi skriver.
* [`normalize.css`](https://www.npmjs.com/package/normalize.css) vilket är en vanlig CSS fil som man även kan ladda ner utanför npm. Denna skall vi använda för att normalisera vår style mellan olika webbläsare då, alla har sina egna default värden som gör att våran webbsida kan ha olika margins, paddings, typografi med mera.

Vi väljer att sätta upp vår npm-miljö i `portfolio/themes`, det gör att vi kan använda samma installation för samtliga teman vi skapar under kursens gång.

```bash
# Stå i me/portfolio/themes
$ npm init --yes
```

Detta kommer skapa en `package.json` som kommer innehålla information om vårt projekt. Vi kollar mer på den strax, efter vi lagt till de nödvändiga paketen. Vi använder oss utav `npm install --save-dev` när vi installerar, då samtliga paket vi installerar enbart behövs i vår utvecklingsmiljö. Annars installerar man med `npm install --save`.

```bash
# Stå i me/portfolio/themes
$ npm install --save-dev normalize.css sass stylelint stylelint-config-sass-guidelines
```

När allt är klart så kommer du ha fått en ny mapp, `portfolio/themes/node_modules` som innehåller allt vi installerade. Utöver detta så har vår `package.json` uppdaterats med de paket vi installerade. Såhär kan den se ut då:

```json
{
  "name": "themes",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "normalize.css": "^8.0.1",
    "sass": "^1.26.11",
    "stylelint": "^13.7.2",
    "stylelint-config-sass-guidelines": "^7.1.0"
  }
}
```

I vår `package.json` hittar vi `scripts`, den tar emot ett objekt av kommandon som man kan köra med hjälp utav `npm run <command>`. Här ska vi lägga till tre kommandon, ett för att köra vår lint (validator) och två för att göra om våra SASS-filer till CSS-filer som webbläsaren kan läsa. Vi lägger till följande:

```json
...,
"scripts": {
  "lint": "stylelint \"**/*.scss\"",
  "style": "sass kmom02/scss/style.scss kmom02/css/style.css --no-source-map",
  "style-min": "sass kmom02/scss/style.scss kmom02/css/style.min.css --no-source-map --style compressed"
},
...,
```

**Notera:** Om ni bytte namn på erat tema så behöver ni uppdatera så den pekar på namnet ni valde.



### Vår validering {#validering}

I kursen så använder vi oss enbart utav stylelint som validering. Vi installerade den tidigare, men för att den ska fungera så behöver man ha en konfigurationsfil som förklarar vad den ska validera. Vi skapar en sådan, `portfolio/themes/.stylelintrc.json` som innehåller följande:

```json
{
    "extends": [
        "stylelint-config-sass-guidelines"
    ],
    "rules": {
        "at-rule-no-unknown": null,
        "selector-max-compound-selectors": 5
    },
    "ignoreFiles": [
        "**/node_modules/",
        "shared/fontawesome/**/*.scss",
        "**/*.css",
        "**/*.min.css"
    ]
}
```

* `extends` ärver regler ifrån andra filer. Här väljer vi att ärva ifrån `stylelint-config-sass-guidelines` som vi nyligen installerade.
* I `rules` så har vi de regler vi väljer att skriva över.
* `ignoreFiles` tar emot filer som vi vill att linten inte ska kolla på. `node_modules` och `shared/fontawesome` är inte era filer, så de ska ni inte behöva tänka på. Vi exkluderar även de genererade `.css`-filerna ni får ifrån era `.scss`-filer.

Nu ska ni kunna köra `npm run lint` för att validera er SASS-kod. Men vi har inte skapat några filer än så det händer inte särskilt mycket.



Bygg CSS med SASS {#bygg-css-med-sass}
---------------------------------------

Ni har erat tema ifrån det första kursmomentet. Troligen består det minst utav en `style.css` och en `mobile-menu.css`, en bra grund för vad vi vill göra nu.



### Import {#import}

Vi skapar en ny fil, `themes/kmom02/scss/style.scss` som kommer vara vår huvudfil för detta temat. Vi inleder denna fil med att utnyttja `@import`, en import av en fil, som är en av de SASS-features vi kommer använda.

```scss
@import '../../node_modules/normalize.css/normalize';
@import 'variables';

@import 'blockquotes';
@import 'code';
```

Jag importerar `normalize.css`, ett av paketen vi installerade med npm tidigare. Sen så ser ni tre till importeringar, `variables`/`blockquotes`/`code`. Jag skapar dessa tre filer:

```bash
# Stå i portfolio/themes/kmom02
touch scss/variables.scss scss/blockquotes.scss scss/code.scss
```

Längst ner i den `style.css` ni utgick ifrån i förra kursmomentet fanns det style för HTML-elementen `<code>`, `<pre>` och `<blockquote>`. Det är bra att ha, om man skulle vilja inkludera kod i sin redovisningstext. Vi passar på att lägga den här koden i två egna SASS-moduler, så slipper ni ha det i fil(erna) ni jobbar i. Vi börjar med `themes/kmom02/scss/code.scss` och lägger till följande:

```scss
code {
    margin: 0 0.1em;
    padding: 0.1em 0.2em;
    border: 1px solid #ccc;
    border-radius: 0.3em;
    background: #f5f5f5;
    font-family: monospace;
    font-size: 0.85rem;
    line-height: 1.9824;
}

pre {
    padding: 0 1em;
    border: 1px solid #ccc;
    border-radius: 0.3em;
    background: #f5f5f5;
}

pre code {
    display: block;
    margin: 0;
    padding: 1.1111em 0;
    border: 0 none;
    background: transparent;
    overflow-x: auto;
    line-height: 1.4;
}
```

Och följande i `themes/kmom02/scss/blockquote`:

```scss
blockquote {
    font-style: italic;
    margin-left: 1em;
    padding-left: 1em;
    border-left: 0.5em solid #f5f5f5;
}
```



### Variabler {#variabler}

En annan feature vi kommer jobba med är variabler. Det vanligaste användningsområdet för variabler är färger, där det tillåter oss att sätta färger i en variabel längst upp i vår fil och sen jobba mot dessa variabler istället för hexdecimala/rgb värden. Vi hoppar in i `themes/kmom02/scss/variables.scss` och lägger till följande fem variabler:

```scss
$font-color: #000;
$font-alternative-color: #fff;
$accent-color: #ee6c4d;
$background-color: #3d5a80;
$background-alternative-color: #e0fbfc;
```

Namnen är självförklarande och ni kan uppdatera färgerna till era egna, det är ert tema. Det viktiga är att vi har variablerna, som vi nu ska börja använda i vår `themes/kmom02/scss/style.scss`. Under våra `@import` så lägger vi in ett exempel för att se hur vi kan använda oss utav variablerna.

```scss
@import '../../node_modules/normalize.css/normalize';
@import 'variables';

@import 'blockquotes';
@import 'code';

body {
    background-color: $background-color;
}

* {
    color: $font-color;
}
```

För att se de ändringar vi gjort nu, så behöver vi göra om våra `.scss`-filer till `.css`-filer, som webbläsaren kan tyda. Vi la tidigare in ett kommando, `npm run style` som löser detta åt oss och vi testkör det för att se resultatet.

```bash
# Stå i portfolio/themes
$ npm run style
```

Nu har vi våra CSS-filer och behöver bara uppdatera vår `portfolio/config/config.yml` så att vårt nya tema laddas in.

```yml
...
##
# Theme
#
theme: kmom02
themes_url: ~
...
```

Laddar vi om sidan så bör vi ha förlorat vår föregående style men ha en bakgrund + textfärg satt. Grunden är nu lagd för att ni ska kunna arbeta med SASS och ni kan välja att göra ett nytt tema eller kopiera över reglerna ifrån ert föregående. Lycka till!

### Import kommer att fasas ut {#import}

[SASS kommer att fasa ut @import](https://sass-lang.com/documentation/at-rules/import/). Ett av problemen med import är att allt som importeras blir tillgängligt i ett globalt scope, vilket kan leda till att man av misstag har variabler med samma namn. Istället för att använda `@import` kan man använda t.ex. `@forward` eller `@use`.

[INFO]
**Tips ifrån coachen:** Skapa en SASS-modul utav mobilnavigeringen, så som vi gjorde med blockquote och code. Glöm inte att importera den!
[/INFO]



Tidigare version {#tidigare-version}
--------------------------------------

Efter feedback ifrån HT2020 så har denna introduktion fått sig en omskrivning. Ett mer tydligt flöde tillsammans med tips inför uppgiften är nu i fokus.

Om man är intresserad av den gamla versionen kan man läsa den här [Kom igång med SASS och npm](kunskap/kom-igang-med-sass-och-npm).



Avslutningsvis  {#avslutningsvis}
-------------------------------------

Nu har vi lärt oss att använda `npm` för att sätta upp nya verktyg som kan användas när vi utvecklar. Det blev mycket nytt och det kan ta ett litet tag att komma in i allt.

Ett tips när ni börjar styla är att använda många variabler och dela upp koden i flera moduler så det lättare att återanvända. Glöm inte heller att strukturera allt på ett bra sätt, gruppera gärna dem i undermappar så att de blir enklare att hitta.

SASS dokumentation kan hittas på [sass-lang.com/documentation](https://sass-lang.com/documentation). SASS har två typer av syntax, en med `.sass` som är lite äldre och `.scss` vilket är nyare. Vi skall använda `.scss`.

Om det är några frågor eller om något är oklart, tveka inte att hojta till i Discord så kollar vi på det. Annars lycka till och kör på!
