---
author: mos
category:
    - webbprogrammering
    - html
    - css
    - php
    - kurs htmlphp
revision:
    "2022-06-22": "(D, mos) Uppdaterad inför webtec-v2."
    "2018-06-19": "(C, mos) Uppdaterad inför htmlphp v3, kompletterad med video."
    "2016-02-03": "(B, mos) Blå ruta om status för Unicorn."
    "2015-04-29": "(A, mos) Första utgåvan inför htmlphp version 2."
...
Skapa en webbsida med HTML, CSS och PHP (v2)
==================================

[FIGURE src=image/snapvt15/me-navbar.png?w=c5 class="right" caption="En enkel webbplats, en me-sida."]

Vill man bli webbprogrammerare så behöver man lära sig flera tekniker och hur de samverkar. Låt oss därför, steg för steg, skapa en liten webbplats med HTML, CSS och PHP.

Webbplatsen får innehålla ett par sidor med header och footer, några bilder, länkar och en meny för att navigera mellan sidorna. Det blir en bra start. Dessutom lär vi oss att validera sidorna så att de stämmer med de standarder vi använder.

<!--more-->



Förutsättningar {#pre}
---------------------------------

Du har installerat en labbmiljö likt den som beskrivs i dokumentet om [labbmiljö för kursen webtec](kurser/webtec-v2/installera-labbmiljo). Det innefattar bland annat en webbserver med stöd för PHP.

Du kan hitta koden som används i denna artikel, i ditt kursrepo under `example/me/step1`.



<!--
Översikt av artikeln {#video}
---------------------------------

Det finns en videoserie som visar hur jag själv jobbar igenom artikeln. Du kan titta igenom videoserien samtidigt som du själv jobbar igenom artikeln.

Du hittar spellistan för videoserien under "[Skapa en webbsida med HTML, CSS och PHP](https://www.youtube.com/playlist?list=PLKtP9l5q3ce8WodX3eGvV1CO8wQEuI85C)".

[YOUTUBE src="XXX" list="PLKtP9l5q3ce8WodX3eGvV1CO8wQEuI85C" width=700 caption="Videoserie som ger dig en översikt och genomgång av artikeln."]
-->



Webbplatsens innehåll {#innehall}
---------------------------------

Låt oss skapa en webbplats med ett par webbsidor. Vi tar enklaste möjliga struktur men vi försöker ändå täcka in hur teknikerna HTML, CSS och PHP samverkar för skapa webbsidorna. Vi försöker också skapa en god katalogstruktur till webbplatsen.

Vi skapar tre sidor och sidorna får innehålla en presentation om mig (dig), en sida för redovisningar (bra att ha i kursen) och en om-sida som berättar om själva webbplatsen och kursen.

Det kan se ut så här när det är klart.

**BILD**



Katalogstruktur {#struktur}
---------------------------------

Vi sparar allt vårt arbete i kursrepot i katalogen `me/report`. Låt mig visa hur du kan göra för att skapa grundstrukturen för webbplatsen.

Öppna din terminal och gå till ditt kursrepo.

```text
# Ställ dig i rooten av kursrepot

# Gå till arbetskatalogen
cd me/report

# Visa de filer som finns i katalogen (det bör vara tomt inledningsvis)
ls -al
```

Då skapar jag ett par kataloger för att ge en grundstruktur till webbplatsen. Tanken är att katalogen `public/` innehåller allt som behöver vara publikt och tillgängligt på webbplatsen och övriga kataloger är sådant som inte behöver vara tillgängligt via webbservern. Det är en bra start.

```text
# Skapa kataloger för den publika delen
mkdir public/img
mkdir public/css

# Skapa övriga kataloger
mkdir config
mkdir view
```

Nu tänker jag skapa ett par tomma filer, det är dessa filer som vi senare skall fylla med innehåll.

```text
# Skapa tomma filer som är blivande webbsidor, sidkontroller
touch public/me.php
touch public/about.php
touch public/report.php

# Skapa en tom stylesheet
touch public/css/style.css

# Skapa en tm konfigurationsfil som sidkontrollers kan inkludera
touch config/config.php

# Skapa tomma vyer (byggstenar till webbsidan)
touch view/header.php
touch view/byline.php
touch view/footer.php
```

Bra, då är vi nästan klara. Jag tänkte ladda hem ett par bilder först. För din egen del så kan du använda dessa bilder först, senare kan du själv ersätta dem med andra bilder.

```text
# Hämta hem bilder från nätet via en webblänk och spara lokalt
wget -O public/img/me-small.jpg https://dbwebb.se/img/mikael-roos/me-happy.jpg
wget -O public/img/me.jpg https://dbwebb.se/img/mikael-roos/me-2.jpg
wget -O public/img/favicon.ico https://dbwebb.se/favicon.ico
```

Kommandot `mkdir` skapar nya kataloger, kommandot `touch` skapar nya tomma filer och kommandot `wget` laddar hem filer från nätet.

Sådär. Du får gärna ta några andra representativa bilder.

Så här ser strukturen ut på katalogen.

```bash
me
├── about.php
├── css
│   └── style.css
├── img
│   ├── favicon.ico
│   ├── me.jpg
│   └── me-small.jpg
├── incl
│   ├── byline.php
│   ├── footer.php
│   └── header.php
├── me.php
└── report.php

3 directories, 10 files
```

Vi har nu en grundstruktur får vår webbplats. Det är tre sidor som är döpta till `about.php`, `me.php` och `report.php`. Bilderna ligger i katalogen `img/` och stylesheeten ligger i katalogen `css/`.

Öppna nu katalogen `me` med din texteditor. Jag använder Atom som jag kan starta direkt från terminalen.

```bash
atom me
```

Så här ser det ut för mig.

[FIGURE src=image/snapvt15/me-atom.png?w=w3 caption="Strukturen för min *me* webbplats som den ser ut i texteditorn Atom."]

Vi fortsätter raskt att skapa en första webbsida.



En första ansats till en webbsida {#ansats1}
--------------------------------------

För att få en smakstart så tar vi filen `me.php` och lägger in en standardstruktur för en webbsida.

```html
<!doctype html>
<html lang="sv">
<head>
    <meta charset="utf-8">
    <title>Me-sidan</title>
</head>
<body>
    <h1>Om Mig Själv</h1>
    <p>Här kommer snart min egen fina me-sida.</p>
    <img src="img/me.jpg" class="me" alt="Bild på Mikael Roos">
</body>
</html>
```

Ovan är ren HTML-kod, det finns ännu inga inslag av PHP i koden.

Så här ser det ut när jag öppnar sidan i min webbläsare via min lokala webbserver.

[FIGURE src=image/snapvt15/me-large.png?w=w3 caption="Första ansatsen med en stor bild."]

Min bild är lite väl stor men det får vi fixa senare.



Källkoden för en webbsida {#kallkod}
--------------------------------------

När man visar en webbsida i webbläsaren så kan man plocka fram dess källkod. I detta fallet pratar vi om den källkod som webbservern lämnade ifrån sig och den bas som webbläsaren använder för att visa det som vi uppfattar som webbsidan.

Vi kan alltid hitta källkoden till webbsidan genom att högerklicka på musen i webbläsarens fönster och välja menyvalet "View Page Source", eller "Visa källkod".

Du får då upp en sida som visar källkoden för sidan.

[FIGURE src=image/snapht18/view-source.png?w=w3 caption="Källkoden för sidan finns alltid tillgänglig."]

I detta fallet är källkoden som ligger i filen `me.php` exakt samma som webbläsaren ser. När vi senare börjar använda PHP så kommer källkoden att skilja sig åt, den filen som ligger på servern ser annorlunda ut än den som webbläsaren ser. Det är alltså en viktig skillnad på källkoden i servern och källkoden i webbläsaren. Denna skillnad vill du bemästra när du senare ska felsöka i dina webbsidor. Men, vi kan ta mer om det senare.



Validera enligt HTML {#validera-html}
--------------------------------------

För att kontrollera att det verkligen är korrekt HTML-kod som webbläsaren får så kör vi koden genom [W3C’s Markup Validation Service](http://validator.w3.org/). Välj fliken "Validate by direct input" och kopiera in koden för din webbsida.

Bäst är att kopiera in koden som den kommer i webbläsaren, via högerklicka och "View Page Source".

Så här ska det se ut när du validerar, grönt är bra och säger att webbsidan klarar valideringen och därmed uppfyller kraven på strukturen för HTML elementen.

[FIGURE src=image/snapvt15/me-validate-html5.png?w=w3 caption="Min me-sida validerar, en bra start."]

Om du fick fel så försöker du rätta till felen. Läs även vad varningarna betyder. Det är bra att ha lite koll.

Valideringsverktyg är viktiga för den som utvecklar webbplatser.



Länka till valideringsverktyget {#linkval}
--------------------------------------

För att förenkla framtida kontroller så lägger vi till en länk till validatorn, direkt i me-sidan. Det gör att vi hela tiden kan validera dokumentet med ett litet klick.

Skapa en footer till me-sidan och lägg in länken till validatorn. Följande kod löser det i slutet på sidan.

```html
    <footer id="site-footer">
        <hr>
        <a href="http://validator.w3.org/check/referer">HTML5</a>
    </footer>

</body>
```

Så här blev det för mig.

[FIGURE src=image/snapvt15/me-validate-link.png?w=w3 caption="Enkel åtkomst till validatorn via en länk."]

Klickar man nu på länken så kommer man till validatorn som direkt validerar den sidan som du klickade på.

För att detta skall fungera måste din sida ligga på en webbserver som är publikt tillgänglig. Annars kommer validatorn inte åt din sida. Du kan alltså inte validera din sida genom att klicka på länken när webbsidan ligger på din lokala datorn.

För att testa valideringen så laddar vi istället upp din me-sida till driftsmiljön som är en publik webbplats.

Du använder verktyget `dbwebb-cli` för att ladda upp sidan till driftsmiljön, det som vi kallar för studentservern.

```text
dbwebb publish kmom01
```

Nu kan du testa att länken fungerar och att valideringen sker när du klickar på länken.



Styla sidan med CSS {#css}
--------------------------------------

Med CSS kan vi ge sidan färg och form. Vi kan styla HTML-elementen och bestämma var de skall visas på sidan och hur de skall se ut. CSS-koden lägger vi i en separat fil och länkar till från HTML-koden.

Börja med att öppna filen `css/style.css` och lägg in följande kod för att ge din sidan en bakgrund och en lagom storlek på bilden.

```css
html {
    background-color: #9c9;
}

.me {
    width: 400px;
}
```

Därefter går du till filen `me.php` och lägger in följande rad så att stylesheeten refereras från webbsidan.

```html
    <link rel="stylesheet" href="css/style.css">
</head>
```

När det är klart så kan du ladda om sidan. Så här blev det för mig.

[FIGURE src=image/snapvt15/me-style.png?w=w3 caption="En lätt grön bakgrund och en mer anpassad storlek på bilden."]

Om du nu vill att sidan skall vara centrerad och ha en viss storlek, säg 980px bred, så kan du åstakomma det med kod i stylesheeten. Gör så här.

```css
body {
    margin: 8px auto;
    padding: 8px;
    width: 980px;
    background-color: #eee;
    border-radius: 10px;
}
```

Så här blev det för mig.

[FIGURE src=image/snapvt15/me-style-center.png?w=w3 caption="Sidan centreras med en fast bredd."]

Nu börjar det likna något.



Validera CSS-kod {#validatecss}
--------------------------------------

W3C har en [validator för CSS](https://jigsaw.w3.org/css-validator/). Pröva att kopiera in din kod från stylesheeten och validera den via "Direct input"-metoden.

Det bör se ut ungefär så här.

[FIGURE src=image/snapvt15/me-validate-css-direct.png?w=w3 caption="CSS-koden går igenom valideringen."]

Ladda upp din sida på driftsserver och validera den genom att ge validatorn länken till din me-sida. Du tar alltså länken till din egen sida och kopiera in den i validatorn.

Så här kan det se ut.

[FIGURE src=image/snapvt15/me-validate-css-link.png?w=w3 caption="Validera sidan via en direktlänk."]

Nu bör din stylesheet valideras på samma sätt som tidigare.



Validera CSS via länk {#validatecsslink}
--------------------------------------

För att underlätta validering av sidorna så lägger vi till en direktlänk till CSS-validatorn. Vi gör på liknande sätt som vi gjorde med HTML-validatorn. Lägg till följande länk i din footer.

```html
<a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a>
```

Ladda upp sidorna på driftsservern för att testa att länken till CSS-validatorn fungerar. Klicka på den och se om din sida validerar.



Unicorn, ett valideringsverktyg för flera tekniker {#unicorn}
--------------------------------------

Det finns ett valideringsverktyg Unicorn som kör både HTML och CSS testerna i en körning. Dessutom kan det köra ytterligare kompletterande tester. Länka även till detta verktyget från din me-sida.

Länken till Unicorn som passar i din footer ser ut så här.

```html
<a href="http://validator.w3.org/unicorn/check?ucn_uri=referer&amp;ucn_task=conformance">Unicorn</a>
```

Så här kan det se ut när du klickar på länken och validerar både HTML och CSS enligt Unicorns validator.

[FIGURE src=image/snapht18/unicorn.png?w=w3 caption="Unicorn validerar HTML, CSS och om sidan innehåller ett _feed_ (vilket sidan inte gör)."]

Kom nu ihåg att alltid dubbelkolla att din sida validerar. Hamnar du i trubbel så kollar du alltid först om sidan validerar. Det är ofta första steget i felsökningen, kontrollera att HTML och CSS validerar.



Om HTML-entiteter {#htmlentities}
--------------------------------------

Varför används `&amp;` istället för tecknet `&` när vi länkar till Unicorn ovan?
Du kan testa att ändra din kod och enbart skriva `&`. Validera den sedan i Unicorn. Du får då ett felmeddelande som säger:

> **`&` did not start a character reference. (`&` probably should have been escaped as `&amp;`.)**

Tecknet `&` har en speciell betydelse i HTML och därför kan det ibland behöva ersättas med sin motsvarande HTML entitet `&amp;`. Annars validerar inte HTML-koden, den är inte helt korrekt.

I tabellen nedan är ett par tecken som är reserverade i HTML, de har speciell betydelse. Om man vill att respektive tecken skall skrivas ut i text, eller vara en del av en länk, så behöver man byta ut tecknet mot dess _entity_, eller HTML entitet som det också kallas.

| Tecken | Entity   | Kommentar |
|--------|--------  |-----------|
| `&`    | `&amp;`  | Början på en entitet eller teckensekvens. |
| `<`    | `&lt;`   | Start på en HTML-tagg. |
| `>`    | `&gt;`   | Slut på en HTML-tagg. |
| `"`    | `&quot;` | Start och slut på ett attributs värde. |

Det finns fler tecken som kan konstrueras med HTML entiter. Du kan till exempel skapa ett copyright-tecken &copy; `&copy;` eller ett euro-tecken &euro; `&euro;` med dem.



Skapa en header med logo och slogan {#header}
--------------------------------------

En webbplats innehåller ofta en header med en logo, titel på webbplatsen och kanske även en slogan. Låt oss lägga till det.

Först hämtar jag hem en bild som jag tänker använda som logo, jag sparar bilden i `img`-katalogen.

```text
# Stå i katalogen kmom01/me
wget -O img/logo.jpg "https://dbwebb.se/image/tema/trad/4.jpg?w=200"
```

Så här kan det se ut i HTML-koden.

```html
<body>
    <header class="site-header">
        <img src="img/logo.jpg" alt="logo" />
        <span class="site-title">Me-Sida för Mikael</span>
        <span class="site-slogan">Min första fina me-sida är på gång</span>
    </header>
```

Pröva att lägga till HTML-koden innan du lägger till någon style. Titta hur det ser ut i webbläsaren utan style. Lägg sedan till style och gör reload.

Följande style fungerar att utgå ifrån.

```css
.site-header {
    background-color: #fff;
    overflow: auto; /* clear fix to make div span all elements */
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

Det finns ingen direkt regel för hur man komponerar en header som denna, det finns flera tekniker. Huvudsaken är ju att det ser ut som man vill.

Så här blir min sida när jag lagt till en header.

[FIGURE src=image/snapvt15/me-header.png?w=w3 caption="Me-sida, nu med header i form av logo, titel och slogan."]

Glöm inte bort att validera din kod, nu räcker det ju att du laddar upp på driftsservern samt klickar på länkarna till validatorn.



En favicon till webbplatsen {#favicon}
--------------------------------------

En webbplats kan ha en *favicon*, en liten bild som visas tillsammans med webbplatsen uppe i webbläsarens flik.

Det är något vi kan lägga till i sidas `<head>`-del med följande konstruktion.

```html
    <link rel='shortcut icon' href='img/favicon.ico'/>
</head>
```

Sedan laddar du om och kan se ikonen, *faviconen*, i webbläsarens flik.

[FIGURE src=image/snapvt15/me-favicon.png?w=w3 caption="Me-sida nu med en favicon."]

Formatet för en favicon är filformatet ICO, men de flesta webbläsare klarar även vanliga PNG-bilder.



Skapa en meny - en navbar {#navbar}
--------------------------------------

Tanken är att webbplatsen skall bestå av tre sidor. Ta nu en kopia av webbsidan `me.php` och spara den i `report.php` och `about.php`. Redigera texten i respektive sida så man vet vilken sida det är. Så här ser det ut för mig.

[FIGURE src=image/snapvt15/me-report.png?w=c8  class="right" caption="Redovisnings-delen av me-sidan."]

[FIGURE src=image/snapvt15/me-about.png?w=c8 caption="En om-sida på me-sidan."]

Låt oss nu skapa en meny, också kallad navbar, som låter oss navigera mellan de olika sidorna.

Här är en grund för navbaren som länkar mellan de olika sidorna.

```html
    <nav class="navbar">
        <a href="me.php">Hem</a>
        <a href="report.php">Redovisning</a>
        <a href="about.php">Om</a>
    </nav>
```

Vi lägger på en enkel stil på länkarna, så att det liknar en navbar.

```css
.navbar {
    padding: 1em;
    background-color: #fff;
    border-top: 1px solid #9c9;
}

.navbar a {
    display: inline-block;
    padding: 0.5em 1em;
    border: 1px solid #999;
    text-decoration: none;
}

.navbar a:hover {
    background-color: #eee;
    text-decoration: underline;
}
```

Så här ser det ut för mig.

[FIGURE src=image/snapvt15/me-navbar.png?w=w3 caption="Me-sida, nu med en navbar för navigering mellan de olika sidorna."]

Så ja, kopiera nu koden för navbaren till de andra sidorna och pröva att navigera på din webbplats. Du bör kunna klicka runt och se de olika sidorna.

Nästa steg blir att hitta en bättre organisation av koden med hjälp av PHP.



Organisera kod i header.php och footer.php {#organisera}
--------------------------------------

Om du lutar dig tillbaka och tittar på din kod så ser du att du delvis har samma kod i tre filer. Det är inte optimalt. Låt oss samla koden för header-delen i filen `incl/header.php` och footer-delen i filen `incl/footer.php`.

Det handlar om att strukturera sin kod och återanvända den. En sak skall definieras på en plats. Då blir det mindre kod att titta på, det blir enklare att vidareutveckla och underhålla koden.

I vårt fall handlar det om att lägga följande kod i `incl/header.php`.

```html
<!doctype html>
<html lang="sv">
<head>
    <meta charset="utf-8">
    <title>Me-sidan</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <header class="site-header">
        <img src="img/logo.jpg" alt="logo" />
        <span class="site-title">Me-Sida för Mikael</span>
        <span class="site-slogan">Min första fina me-sida är på gång</span>
    </header>

    <nav class="navbar">
        <a href="me.php">Hem</a>
        <a href="report.php">Redovisning</a>
        <a href="about.php">Om</a>
    </nav>
```

Alla sidor har samma utseende för sidans övre del, sidans logo, titel och navbar. Det är ju samma kod för alla sidor så det blir bättre att samla den koden i en fil.

På samma sätt hamnar följande kod i `incl/footer.php`.

```html
    <footer id="site-footer">
        <hr>
        <a href="http://validator.w3.org/check/referer">HTML5</a>
        <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a>
        <a href="http://validator.w3.org/unicorn/check?ucn_uri=referer&amp;ucn_task=conformance">Unicorn</a>
    </footer>

</body>
</html>
```

Det som till slut knyter samman delarna i webbsidan blir PHP-kod som i filen `me.php` inkluderar filerna `incl/header.php` och `incl/footer.php`.

```html
<?php include("incl/header.php"); ?>

    <h1>Om Mig Själv</h1>
    <p>Här kommer snart min egen fina me-sida.</p>
    <img src="img/me.jpg" class="me" alt="Bild på Mikael Roos">

<?php include("incl/footer.php"); ?>
```

Uttrycket `<?php include("incl/header.php"); ?>` kommer att ersättas med innehållet från filen `"incl/header.php"`.

På samma sätt ersätts uttrycket `<?php include("incl/footer.php"); ?>` med innehållet från filen `"incl/footer.php"`.

Resultatet som visas i webbläsaren blir samma sak som tidigare. PHP-koden körs på serversidan och levererar till webbläsaren exakt samma HTML-sida som tidigare.

Dubbelkolla i din webbläsare att sidan validerar och att källkoden för sidan ser korrekt ut (som du förväntar dig).

`<?php` är start-tagg för PHP-kod, `?>` är slut-tagg. Allt mellan taggarna betraktas och hanteras som PHP-kod. Det är webbservern som parsar PHP-koden innan den lämnar ifrån sig den resulterande HTML-sidan. Allt som skrivs ut, eller inkluderas, mellan PHP-taggarna blir en del av den slutliga HTML-sidan.

Gör nu samma struktur på de andra sidorna `about.php` och `redovisnings.php`.



Gör din egen byline {#byline}
--------------------------------------

Vi jobbar vidare på samma princip med kodstruktur i separata filer. Jobba vidare och skapa din egen byline i filen `incl/byline.php` och inkludera den i varje sida så att du kan visa en och samma signatur från författaren till sidan.

Så här ser min byline ut.

[FIGURE src=image/snapvt15/me-byline.png caption="En byline för att presentera dig själv under varje artikel du skriver."]

Kan du lägga in din motsvarighet i din me-sida?



Styla din me-sida {#styla}
--------------------------------------

Pröva gärna att testa olika sätt att styla din sida, lek runt med CSS-koden och testa hur du kan förändra sidans utseende. Med små enkla medel kan du få din egen sida att se helt annorlunda ut.



Avslutningsvis {#avslutning}
--------------------------------------

Nu har du kommit igång och du har grunden till en me-sida. En bra start!

Delar av exempelkoden finns i [kursrepot för htmlphp-kursen](https://github.com/mosbth/htmlphp/tree/master/example) och kan provköras på dbwebb.se under [repo/htmlphp/example/me](repo/htmlphp/example/me).

Det finns en [egen forumtråd för denna artikel](t/7517), fråga där om du stöter på bekymmer, eller bidra med dina egna tips och trix rörande det som artikeln behandlar.
