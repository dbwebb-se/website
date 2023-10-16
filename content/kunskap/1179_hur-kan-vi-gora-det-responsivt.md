---
author:
    - efo
    - nik
category:
    - design
    - responsivitet
revision:
    "2021-08-26": (B, nik) Uppdaterad inför HT21.
    "2020-11-26": (A, efo) Skapad inför HT2020.
...
Hur kan vi göra bilder och video responsivt?
==================================

Vi ska i denna artikel ta en titt på hur vi kan använda oss av cimage och HTML konstruktionerna `srcset` och `picture` för att skapa responsiva bilder. Och då vi inte bara vill ha responsiva bilder, men även responsiva videos löser vi den saken med.



<!--more-->



Förkunskaper {#pre}
--------------------------------------

Du har läst igenom artikeln [Cimage - Hur fungerar det?](kunskap/cimage-hur-fungerar-det) och är bekant med `srcset` och `picture` bland annat via [Guiden: Design med HTML5 och CSS3](guide/design-med-html5-och-css3/olika-bilder-for-olika-enheter).



En responsiv bild med hjälp av cimage {#responsive}
--------------------------------------

I guidens del [Art direction](guide/design-med-html5-och-css3/art-direction) hade jag gjort i ordning 4 olika bilder: `sheep@2x.jpg`, `sheep.jpg`, `sheep-small-landscape.jpg` och `sheep-small-portrait.jpg` med hjälp av ett bildredigeringsprogram. Bilderna finns i exempel-katalogen under `example/responsiva-bilder`. I guiden och i exempel-koden väljs rätt bild ut med hjälp av `picture` och `srcset`:

```html
<picture>
    <source media="(min-width: 668px)" srcset="sheep.jpg, sheep@2x.jpg 2x">
    <source media="(min-width: 376px)" srcset="sheep-small-landscape.jpg">
    <img src="sheep-small-portrait.jpg" class="max-width" alt="sheep">
</picture>
```

Nu har vi tillgång till cimage och kan istället för ett bildredigeringsprogram göra det med hjälp av programmering så låt oss titta på hur vi kan göra det. Om vi utgår från att vi har lagt bilden `sheep.jpg` i `assets/img`-katalogen i pico. Då kan vi med hjälp av cimage ladda in bilden i olika storlekar beroende på hur stor webbläsaren är. Vi har tre delar i kodexemplet nedan. När webbläsaren är större än 667px laddar vi in original bilden av `sheep.jpg`, men via cimage. För webbläsarstorlek mellan 376px och 667px laddar vi en bild som har en bredd på 667px. Och för små skärmar laddar vi in en variant som är 375px bred.

```html
<picture>
    <source media="(min-width: 668px)" srcset="image/sheep.jpg">
    <source media="(min-width: 376px)" srcset="image/sheep.jpg?w=667">
    <img src="image/sheep.jpg?w=375" alt="sheep">
</picture>
```

I och med att bilden laddas i HTML är det bara vid omladdningar av webbläsaren att bilden ändras. Se därför även till att ha en CSS regel som talar om `max-width:100%` till exempel:

```css
img, embed, object, video {
    max-width: 100%;
}
```



Responsiva videos {#video}
--------------------------------------

I många fall vill vi ha möjligheten för att bädda in (embed) videos i våra artiklar eller i en portfölj. Ett sätt att ha video på en webbplats är via en embed med hjälp av `iframe`. Som utgångspunkt har iframes en fast höjd och bredd och låter sig inte gärna förminskas eller förstoras. Men med lite HTML och CSS magi kan vi få till responsiva iframes. Runt vår iframe lägger vi en `div` med klassen `.embed-container`.

```html
<div class="embed-container">
    <iframe src="https://www.youtube.com/embed/gCwjLPBqpa0" frameborder="0" allowfullscreen></iframe>
</div>
```

Nu kommer den magiska biten för att få till responsiviteten för iframe. Först sätter vi `position: relative;` vilket gör det möjligt för oss att sätta `position: absolute;` för elementet inuti `.embed-container`. Då vi har satt `position: relative;` utgår positionering av underliggande element ifrån förälder-elementet och inte från `body`-elementet, som `position: absolute;` gör i vanliga fall.

Vi sätter höjden till 0 och sedan använder vi istället `padding-bottom` för att skapa höjden för elementet. Vi sätter detta till `56.25%` på grund av den aspect-ratio som 16:9 videos har. Har vi videos med aspect ratio 4:3 använder vi 75% istället.

För `iframe`-elementet sätter vi `position: absolute;` och positionerar iframe längst upp till vänster med `top: 0;` och `left: 0;`. Och låter sedan iframe-elementet fylla ut hela `.embed-container` elementet.

```css
.embed-container {
    position: relative;
    padding-bottom: 56.25%;
    height: 0;
    overflow: hidden;
    max-width: 100%;
}

.embed-container iframe,
.embed-container object,
.embed-container embed {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}
```



Twig {#twig}
-------------------------------------

I Twig kan vi skriva vanlig HTML, så där är det relativt simpelt att länka våra bilder. Jag utgår ifrån en bild, `sheep.jpg` som har sökvägen `portfolio/assets/img/sheep.jpg`. Jag väljer att wrap:a min bild med en länk till originalet, så om man vill se bilden i sin rätta storlek är det bara trycka på den. I exemplet så nöjer jag mig med två storlekar, en för små enheter och en för stora enheter.

```html
<a href="{{ base_url }}/image/sheep.jpg" target="_blank">
    <picture>
        <source media="(min-width: 668px)" srcset="{{ base_url }}/image/sheep.jpg">
        <img src="{{ base_url }}/image/sheep.jpg&w=667" alt="A sheep">
    </picture>
</a>
```

Vi kombinerar helt enkelt `{{ base_url}}` som pekar på rooten av Pico-ramverket (i vårt fall `me/portfolio`). Sen lägger vi till sökvägen `/image` som i vår `.htaccess` pekar oss till cimage. Därefter säger vi vilken bild vi vill använda, `sheep.jpg` och de parametrar vi vill skicka med till cimage, t.ex. `&w=667`.



Markdown {#markdown}
-------------------------------------

I Markdown ser det snarlikt ut, bara att vi behöver uppdatera vår `{{ base_url }}` till `%base_url%` så länken fungerar som det ska, ungefär såhär:

```html
<a href="%base_url%/image/sheep.jpg" target="_blank">
    <picture>
        <source media="(min-width: 668px)" srcset="%base_url%/image/sheep.jpg">
        <img src="%base_url%/image/sheep.jpg&w=667" alt="A sheep">
    </picture>
</a>
```



Avslutningsvis {#avslut}
--------------------------------------

Vi har nu lärt hur vi med hjälp av `picture`-elementet och cimage kan skapa responsiva bilder i rätt storlek. Dessutom har vi tagit en titt på hur man kan få responsiva videos som en del av våra webbplatser.
