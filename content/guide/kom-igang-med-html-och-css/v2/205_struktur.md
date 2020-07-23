---
author: lew
revision:
    "2018-06-13": "(A, lew) Första versionen."
...
Struktur {#struktur}
=======================

Murphy vill ha med lite text. En text om sig själv, eller rättare sagt det som definierar Murphy: vad en Stormtrooper är. På sidan about.html önskades en text om den mörka sidan som kan ge en beskrivning om vart Murphy kommer ifrån.

Det handlar om att strukturera sidans innehåll i *rätt* HTML-element. Vad som är rätt och inte är inte alltid tydligt, men det finns grundstrukturer som är tydliga. HTML-elementen har en *semantisk* mening, de berättar vilken typ av innehåll de har. Det underlättar när man läser sidans källkod, man ser tydligare vilken betydelse de olika elementen har.



#html koden {#html}

Vi börjar med elementet `<main>` som kapslar in sidans huvudsakliga innehåll. Jag samlade webbsidans huvudsakliga innehåll inom ett element `<article>`.

Artikeln fick en egen `<header>` och en `<footer>` där bylinen ligger. Strukturen ser ut så här.

```html
<main>
    <article>
        <header>
            <h1>Article header</h1>
            <p class="author">Updated <time datetime="2018-06-25 11:17:43">25th June 2018</time> by Murphy</p>    
        </header>

        <p>Article content, images etc.</p>

        <footer class="byline">
            <p>Content for a byline, images etc.</p>
        </footer>
    </article>
</main>
```

Man kan lägga till CSS-klasser där det behövs, det gör det enklare att styla elementen. Det är inget man behöver göra från början, man kan fylla på med CSS-klasser efter hand, när man känner att det behövs. Som du kan se av koden ovan har jag valt klasserna `author` och `byline`. Det gör det enklare att styla de HTML-block som avses.

HTML handlar mycket om att märka upp orden, det är viktigt att man använder en god struktur för uppmärkningen.



##Resultat {#resultat}

Vi kikar på hur det blev. Först en skärmdump:

[FIGURE src=/image/htmlphp/guide/murphy/after_article.png?w=w3 caption="Indelning i main och article"]

Vi lägger även in innehåll i about.html och delar in det i `main` och `article`. Du kan studera resultatet i följande CodePens:

[CODEPEN src=VdBMVo user="dbwebb" tab="html,css" caption="index.html indelad i main och article."]

[CODEPEN src=xzajdV user="dbwebb" tab="html,css" caption="about.html indelad i main och article."]
