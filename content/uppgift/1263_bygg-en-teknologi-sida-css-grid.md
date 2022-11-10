---
author: efo
category:
    - kurs/design-v3
    - grid
    - flex
revision:
    "2021-11-10": (A, nik) Skapad inför ht20
...
Bygg en teknologi-sida med CSS-Grid
===================================

Du skall bygga om teknologi-sida på din portfolio sida med hjälp utav CSS-Grid.

Du börjar med att strukturera upp en samlingssida (`portfolio/content/technology/index.md`) för alla teknologier och följer sedan upp med att fixa en layout för de individuella artiklar (`portfolio/content/technology/XX.md`).



<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har jobbat igenom följande tre delar i "[Design med HTML5 och CSS3](guide/design-med-html5-och-css3)"

* [CSS Grid Layout](guide/design-med-html5-och-css3/css-grid-layout)
* [Flexbox - Parent Elements](guide/design-med-html5-och-css3/flexbox)
* [Flexbox - Child Elements](guide/design-med-html5-och-css3/flexbox-del2)

Och artikeln [Skapa en specifik layout i Pico](kunskap/skapa-en-specifik-layout-i-pico) som beskriver hur du kan skapa en layout för specifika sidor.



## Wireframe {#wireframe}

Som webbutvecklare är det inte sällan man får något som kallas en wireframe av en kund eller en designer. Fokuset på dessa wireframes brukar bland annat vara att visa vilken funktionalitet som ska vara med på sidan och hur saker ska placeras på sidan. Vill du läsa mer om just wireframes så kan du göra det [här](https://en.wikipedia.org/wiki/Website_wireframe).



## Förberedda artiklar

Du får självklart göra egna artiklar om olika webbteknologier, men för att kursmomentet kan fokusera på design och att lära sig CSS Grid finns förberedda artiklar om 7 olika webbteknologier i exempel mappen i kursrepot under  `example/technologies`.



Krav {#krav}
-----------------------

Själva designen på sidorna får ni välja, det är layout:en vi är ute efter. Om ni vill ha större bilder så kan ni trycka på bilderna för att få full storlek.



## Landningssida {#landningssida}

* Din landningssida skall använda sig utav en egen layout, `technologies.twig`
* Din landningssida skall använda sig utav CSS-Grid.
* Din grid ska bestå utav **tre** kolumner.
* Titeln för sidan ska vara en del av gridet och vara tre kolumner i bredd.
* Boxarna ska ha en länk till respektive teknologi så man kan navigera vidare.
* Varje box ska kunna ta upp 1, 2 eller 3 kolumner i bredd.
* Sidan och dess grid ska vara responsivt genom att:
    * Besöks sidan via en telefon eller annan liten enhet ska gridet istället vara en kolumn bred.

Resten av designen är upp till er att bestämma.

[FIGURE src=image/design-v3/wireframes/wireframe-teknologier.png?height=450 caption="Landningssida på desktop"]



## Enskilda teknologier {#report}

* Samtliga rapportsidor ska använda samma layout, `technology.twig`
* Rapportsidorna ska använda sig av antingen CSS-Grid eller flexbox.
* Sidan ska ha två olika kolumner
    * En sidebar som ska innehålla länkar till samtliga teknologier.
    * En content-del som ska skriva ut innehållet ifrån `technology/XX.md`.
* Sidan ska vara responsiv genom att:
    * Besöks sidan via en telefon ska sidebaren döljas.

Resten av designen är upp till er att bestämma.

[FIGURE src=image/design-v3/wireframes/wireframe-enskild-teknologi.png?height=450 caption="Vår enskilda report-sida på desktop"]



## Övrigt {#ovrigt}

* Din SASS-filer ska validera enligt `npm run lint`.



Extrauppgifter {#extra}
-----------------------

* Implementera gärna flexbox eller grid på någon annan del av din sida om du får tid över.



Tips från coachen {#tips}
-----------------------

Testa gärna att göra olika layouts om du får tid över.

Lycka till och hojta till i Discord om du behöver hjälp!
