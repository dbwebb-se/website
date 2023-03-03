---
author: efo
category: javascript
revision:
    "2019-02-14": (B, efo) Genomarbetad inför VT19.
    "2018-01-09": (A, efo) Första utgåvan inför kursen webapp-v3 V18.
...
Typografi för mobila enheter
==================================

[FIGURE src=image/webapp/typography.jpg?w=c5 class="right"]

I denna artikel går vi igenom hur vi anpassar typsnitt och typografin för våra mobila enheter. Fokus kommer ligga på att skapa användbara, men framför allt tillgängliga och lättlästa gränssnitt för textintensiva hemsidor. Vi kommer ta utgångspunkt i att göra en redovisningssida och kommer formatera den för läsbarhet.



<!--more-->



En grund i HTML {#html}
--------------------------------------

Vi börjar med en enkel grund i HTML där vi laddar in vår CSS kod från filen `style.css` som innehåller följande från en första början. Nedanstående kod återställer den stil som finns från första början i en webbläsare och ser till att den stil inte påverkar den CSS som vi kommer skriva senare.

```css
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
```

Jag har skrivit ihop en redovisningssida för kmom01 i HTML dokumentet nedan. En redovisningssida är ett typiskt exempel på en textintensiv webbplats.

```html
<!-- index.html -->

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Redovisning</title>

    <link rel="stylesheet" href="style.css" />
</head>
<body>
    <main>
        <header>
            <h1>Redovisning</h1>
        </header>
        <article>
            <h2>kmom01</h2>

            <h4>Är du sedan tidigare bekant med utveckling av mobila appar?</h4>
            <p>Jag har tidigare utvecklad en app för App Store. Men det var i Objective-C och långt ifrån webbens tekniker som används i denna kurs. Utvecklingsmiljön i denna kurs känns som mer den jag är van vid från tidigare webb kurser och webbprogrammering i allmänhet.</p>

            <h4>Vilket är den viktigaste lärdomen du gjort om typografi för mobila enheter?</h4>
            <p>Hur viktigt det är med vita utrymmen (whitespace) för att klumpa ihop besläktade element. Vita utrymmen ger dessutom ett luftigare utseende, som känns mer modernt.</p>

            <h4>Du har i kursmomentet hämtat data från två stycken API. Hur kändes detta?</h4>
            <p>Att med XMLHttpRequest och fetch hämta data från de två API fungerade bra. Dokumentationen för Githubs API var från början överväldigande, men med lite tillvänjning gick det att få fram det jag sökte. Ger stora möjligheter med API:er där man frikopplad från implementeringen kan få fram snygga klienter. Blir spännande att jobba vidare med detta i kommande kursmoment.</p>
        </article>
    </main>
</body>
</html>
```

[FIGURE src=image/webapp/screenshot-typo-no-style.png?w=c7 caption="Redovisningstext med nollställd stil"]



Vitt utrymme {#whitespace}
--------------------------------------

Vi börjar med den del av designen som inte har med typsnittet att göra. Vi vill skapa en sammanhang mellan de element som är besläktade och samtidigt skapa en vertikal rytm. Vi börjar med bestämma oss för ett bra radavstånd och en bra typsnittsstorlek för texten.

Vi använder "best-practice" från [Typography Handbook](http://typographyhandbook.com/) och sätter storleken till 100% och använder oss sedan av den relativa enheterna `rem` för att sätta storleken på typsnittet för paragrafer och rubriker. Anledningen till att vi sätter textstorleken till 100% är att användarens förinställda textstorlek då används och det är viktigt för individer med svagt syn.

I Typography Handbook är även rekommendationen att använda sig av en radhöjd/avstånd på mellan 1,2 och 1,5. Ofta vill man ha lite större radavstånd på breda kolumner och lite mindre på smala. Vi sätter storleken `1rem` för brödtexten och använder oss av `1.4` i radavstånd. Inom typografin pratar man om ett magic number som är `radavstånd * typsnittsstorlek` i vårt fall blir magic number alltså `1.4rem`. Vi använder sedan magic number och multiplar av magic number för att sätta marginaler i höjdled vilket skapar vertikal rytm.

Vi väljer även att lägga halva magic number som inre marginal (`padding`) runt vår text genom `padding: 0.7rem;`.

```css
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html {
    font-size: 100%;
}

body {
    line-height: 1.4;
}

main {
    padding: 0.7rem;
}

p {
    margin-bottom: 1.4rem;
    font-size: 1rem;
}
```

[FIGURE src=image/webapp/screenshot-typo-whitespace.png?w=c7 class=right caption="Redovisningstext med vitt urymme i stycken"]
[FIGURE src=image/webapp/screenshot-typo-no-style.png?w=c7 caption="Redovisningstext med nollställd stil"]

Vi vill skapa ett sammanhang mellan frågor och svar för att underlätta för läsaren. Vi vill göra detta men samtidigt bevara den vertikala rytmen. Vi gör detta genom att sätta radavståndet för alla element genom att flytta detta till `body`-elementet.

Sedan definierar vi `margin-bottom` för `h1` och `h2` till en multipel av vårt magic number. För att frågan och svaret ska hänga ihop sätter vi marginalen till 0 för `h4` elementen.

```css
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html {
    font-size: 100%;
}

body {
    line-height: 1.4;
}

main {
    padding: 0.7rem;
}

h1 {
    font-size: 2.4rem;
    margin-bottom: 2.8rem;
}

h2 {
    font-size: 2rem;
    margin-bottom: 1.4rem;
}

h4 {
    font-size: 1.4rem;
    margin-bottom: 0;
}


p {
    margin-bottom: 1.4rem;
    font-size: 1rem;
}
```

Vi ser i jämförelsen nedan hur våra val skapar ett bättre sammanhang mellan frågor och svar.

[FIGURE src=image/webapp/screenshot-typo-vertical-rhythm.png?w=c7 class=right caption="Redovisningstext med vitt urymme överallt"]
[FIGURE src=image/webapp/screenshot-typo-no-style.png?w=c7 caption="Redovisningstext med nollställd stil"]



Typsnitt {#font}
--------------------------------------
Nu är det dags för det som faktiskt syns på sidan och det nog enklaste sättet att förändra känslan av en hemsida. Jag har vald ut två stycken [Google Fonts](https://fonts.google.com/). Ett serif typsnitt Merriweather för brödtexten och sans-serif typsnitt Source Sans Pro för rubriker. Båda typsnitten har stora och tydliga vita områden i bokstäver som 'o', 'e' och 'c', som ger bra läsbarhet. Merriweather har små men ändå tydliga [seriffer](https://en.wikipedia.org/wiki/Serif), som skapar linjer i texten och förankrar typsnittet. Vi importerar typsnitten från Google Fonts och tilldelar dessa där vi vill att de ska användas.

```css
@import url('https://fonts.googleapis.com/css?family=Merriweather|Source+Sans+Pro');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html {
    font-size: 100%;
}

body {
    line-height: 1.4;
}

main {
    padding: 0.7rem;
}


h1,
h2,
h4 {
    font-family: 'Source Sans Pro', sans-serif;
}

h1 {
    font-size: 2.4rem;
    margin-bottom: 2.8rem;
}

h2 {
    font-size: 2rem;
    margin-bottom: 1.4rem;
}

h4 {
    font-size: 1.4rem;
    margin-bottom: 0;
}


p {
    margin-bottom: 1.4rem;
    font-size: 1rem;
    font-family: 'Merriweather', serif;
}
```


Vi jämför skillnaden mellan den nollställda stilen innan våra ändringar och hur den slutliga redovisningssidan ser ut på en mobil enhet. En större sammanhang mellan frågor och svar och typsnitt som är läsbara och som följer användarens inställningar för textstorlek i webbläsaren.

[FIGURE src=image/webapp/screenshot-typo-fonts.png?w=c7 class=right caption="Redovisningstext med typsnitt"]
[FIGURE src=image/webapp/screenshot-typo-no-style.png?w=c7 caption="Redovisningstext med nollställd stil"]



Avslutningsvis {#avslutning}
--------------------------------------
Vi har i denna övning skrapat ytan för typografi i mobila enheter. Vi har en grund att stå på inför redovisningssidan, men även för andra textintensiva gränssnitt. Ni kan nu göra medvetna val med avseende på typsnitt och använda vita utrymmen till eran fördel för att samla besläktade element. Använd [Typography Handbook](http://typographyhandbook.com/) som uppslagsverk när ni skapar tillgängliga och användbara hemsidor, så har ni ett försprång mot 90% av alla andra webbprogrammerare.

Om du har frågor eller tips så finns det en särskild [tråd i forumet](t/7313) om denna artikeln.

Exempelprogrammet från denna övning finns i kursrepot [example/typography](https://github.com/dbwebb-se/webapp/tree/master/example/typography) och i `example/typography`.
