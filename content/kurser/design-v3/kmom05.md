---
author:
    - nik
revision:
    "2020-11-25": (A, nik) Nysläpp för design-v3
...
Kmom05: Bilder
====================================

Låt oss ägna ett kursmoment åt att testa runt med bilder, bildverktyg och bildformat samt hur vi publicerar bilderna på en webbplats, inklusive responsivitet.

Vi skall skapa ett galleri i vår portfolio, det känns rimligt och ger oss en möjlighet att fortsätta öva på CSS-grid men även att jobba med bilder och responsivtet.

[FIGURE src=image/design-v3/barack.png?width=50% caption="Ett exempel på galleri (Barack Obama's Instagram)" class="center"]

När man pratar om bilders kvalité så kan man beakta olika format på bilder och hur dessa format kan optimeras. Två av de vanligaste formaten är JPEG och PNG. JPEG passar bra för foton där man kan justera kvalitén genom att ta bort delar av bildens exakthet. PNG lämpar sig för datoranimerade bilder, linjegrafik, skärmdumpar och i de fall där man inte vill att bildens exakthet ändras. Man bör välja rätt bildformat, det underlättar att behålla kvalitén på bilden. Andra bildformat som används i webbsammanhang är GIF och det lite nyare formatet WEBP.

[FIGURE src=image/design-v3/cimage/area.png?width=50% caption="Beskärning" class="right"]

Bilder kan optimeras, det finns _lossless_ och _lossy_ optimering där skillnaden om bildens exakthet påverkas eller ej. När man pratar om _lossless_ så är det optimering som inte påverkar bildens exakthet, alla delar av bilden är fortfarande kvar och det som optimeras är till exempel hur bilden lagras på fil. Optimering med tekniker som är _lossy_ innebär att man tar bort delar av bildens exakthet och ändå försöker nå så att användaren uppfattar bilden som tydlig.

För att hantera bilderna, för att förändra dess kvalité - lossless eller lossy - krävs verktyg. Vill man beskära en bild eller lägga till ett filter som gör bilden skarpare, så behövs verktyg. Vilka verktyg kan en webbprogrammerare ha nytta av?

När man placerar ut bilder i text så har man alternativen att låta bilden spänna över hela sidan. Bilden kan också vara vänsterjusterad alternativt centrerad och ta upp en del av artieklns fulla bredd. Eller så väljer man att flyta texten runt bilden som då placeras till vänster eller höger.

Men hur bör detta förändras när man gör responsiva webbplatser där både text och bild förändras på mindre enheter? Här handlar det inte enbart om att leverera rätt bild till rätt enhet, det gäller även att placera ut bilden på rätt sätt i förhållande till texten på olika enheter.

Att göra det för hand fungerar på mindre webbplatser, men om man har en webbplats som dbwebb så kan man behöva andra tekniker för att finna ett någorlunda standardiserat flöde för responsiva bilder i text.

Behöver bilderna vara likadana på en desktop och en mobil? Ibland vill man skicka mindre bilder till en mindre enhet, speciellt om det är dålig koppling på nätverket mellan enheten och webbplatsen. Men, sedan finns det små enheter som har riktigt hög upplösning på skärmen och det kan kräva en större bild. Här ser vi krav som eventuellt inte går att förena.

Vi har många frågeställningar om bilder, men låt se om vi kan bringa klarhet i några av dem.

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>

Verktyg {#verktyg}
---------------------------------

Följande verktygstips gäller bildhantering. Kika över listan och se vilka som nämns. Som webbprogrammerare kan man behöva olika typer av verktyg för att bemästra bilder i olika situationer.

### Bildhantering {#bildhantering}

* [GIMP](https://www.gimp.org/) är en fri variant till bildbehandlingsprogram likt Photoshop.

* [Inkscape](https://inkscape.org/en/) är ett fritt program för att rita och hantera bilder i vektorgrafik såsom SVG. Vill du ha bilder att utgå ifrån så finns en bildbank med SVG-bilder på [OpenClipart](https://openclipart.org/https://openclipart.org/).

* Ett bra snapshot-verktyg för skärmdumpar vill du integrera i din verktygslåda. Du vill ha ett verktyg där du enkelt kan ta en snapshot på hela eller delar av skärmen eller på en specifik applikation eller på innehållet i en webbsida. Det är smidigt om det är kopplat till ett enklare ritverktyg vilket gör det enkelt att rita på din snap. Det finns mängder av alternativ så som [Shutter](http://shutter-project.org/), [Gyazo](https://gyazo.com/en) och den jag personligen använder, [Lightshot](https://app.prntscr.com/en/index.html).

### Var kan jag hitta bilder? {#var-letar-man}

* Om man letar bilder man fritt får använda är följande tre sidor en bra start.
    * [Pexels](https://www.pexels.com/)
    * [Unsplash](https://unsplash.com/)
    * [Pixabay](https://pixabay.com/)

* [unDraw](https://undraw.co/illustrations) har ett gäng SVG illustrationer av diverse aktiviteter.
* [OnlyVectorBackgrounds](https://onlyvectorbackgrounds.com/) har en mängd vektor-baserade bilder som kan användas som bakgrund på din sida.

Läs & Studera  {#lasanvisningar}
---------------------------------

*(ca: 8-10 studietimmar)*

### Kurslitteratur  {#kurslitteratur}

Läs följande:

1. Läs i boken "[The principles of Beautiful Web Design](kunskap/boken-the-principles-of-beautiful-web-design)". Det ger dig en bakgrund i tankar och hur man gör layout och komponerar ihop designen i en webbsida.

    * Kap 5: Imagery

### Design med HTML5 och CSS3  {#guide}

1. Läs igenom följande sektion i guiden "[Design med HTML5 och CSS3](guide/design-med-html5-och-css3)".
    * [Bilder](guide/design-med-html5-och-css3/bilder)

I sektionen [Bilder](guide/design-med-html5-och-css3/bilder) använder vi olika tekniker för att skapa responsiva bilder och bilder som fungerar bra på högupplösta skärmar.

### Webbplatsers laddningstid {#artikel}

[FIGURE src="image/snapht18/pagespeed_dbwebb.png?w=w3" caption="Webbplatsen dbwebb.se mäts med verktyget PageSpeed Insights."]

Studera följande för att förbereda dig för uppgiften där du skall analysera webbplatsers laddningstid.

1. Börja med att bekanta dig med verktyget "[PageSpeed Insights](https://developers.google.com/speed/pagespeed/insights/)". Testkör verktyget mot ett par webbplatser som du känner igen och se vilka betyg och tips som visas för att prestandaoptimera respektive webbplats. Se hur dbwebb.se och bth.se klarar sig enligt verktyget.

1. Läs översiktligt igenom artikeln "[Moz om Page Speed](https://moz.com/learn/seo/page-speed)" som ger en snabb insyn i hur man tänker kring optimering av en webbplats för laddningstiden.

1. Hur snabbt en webbplats laddas är en del av de algoritmer som bestämmer hur Google visar en webbplats i SERPEN (webbplatsens plats i sökresultatet).
 Läs bloggartikeln "[Using page speed in mobile search ranking](https://webmasters.googleblog.com/2018/01/using-page-speed-in-mobile-search.html)" som berättar om en uppdatering av sökalgoritmerna som relaterar till webbplatsernas laddningstid.

1. Kika sedan snabbt på Googles "[PageSpeed Insights Rules](https://developers.google.com/speed/docs/insights/rules)" som ger råd för att snabba upp sidor. Artikeln är markerad som _deprecated_ (2018) men ger ändå vägledning i vilka delar som kan optimeras på en webbplats.

1. Som extraläsning, vid intresse och om du har tid, så kan du läsa "[Google Developers: Why Performance Matters](https://developers.google.com/web/fundamentals/performance/why-performance-matters/)" som ger en översikt i varför man bör jobba med prestanda av en webbplats.

### Om responsivitet {#responsivitet}

Läs följande om responsivitet och bilder.

1. Läs artikeln "[MDN: Responsive images](https://developer.mozilla.org/en-US/docs/Learn/HTML/Multimedia_and_embedding/Responsive_images)" som visar dig grunden i HTML-konstruktioner för att leverera olika bilder till olika enheter via `srcset` och `<pictures>`.

1. Läs artikeln "[Google Developers: Responsive images](https://developers.google.com/web/fundamentals/design-and-ux/responsive/images)" som ger dig en insyn i hur du kan jobba med responsivitet och optimering av bilder.

1. Läs artikeln "[CSS-Tricks: A Guide to the Responsive Images Syntax in HTML](https://css-tricks.com/a-guide-to-the-responsive-images-syntax-in-html/)" som går igenom hur man kan jobba kring `srcset` och `<pictures>`.

<!-- 1. Som extra läsning kring responsiva bilder, om du har tid och intresse, rekommenderas följande två examensarbeten, gjorda av webbprogrammerare.
    * [Responsive images in HTML5: A standardized solution in markup language](http://bth.diva-portal.org/smash/record.jsf?aq2=%5B%5B%5D%5D&c=2&af=%5B%5D&searchType=SIMPLE&sortOrder2=title_sort_asc&query=Responsive+images&language=sv&pid=diva2%3A1212760&aq=%5B%5B%5D%5D&sf=all&aqe=%5B%5D&sortOrder=author_sort_asc&onlyFullText=false&noOfRows=50&dswid=-4378), Philip Esmailzade, 2018
    * [Responsive Images: A comparison of responsive image techniques with a focus on performance](http://bth.diva-portal.org/smash/record.jsf?aq2=%5B%5B%5D%5D&c=3&af=%5B%5D&searchType=SIMPLE&sortOrder2=title_sort_asc&query=Responsive+images&language=sv&pid=diva2%3A1032879&aq=%5B%5B%5D%5D&sf=all&aqe=%5B%5D&sortOrder=author_sort_asc&onlyFullText=false&noOfRows=50&dswid=9948), Kalle Kihlström, 2016. -->

Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 8-10 studietimmar)*

### Övningar {#ovningar}

1. Arbeta igenom artikeln "[Cimage, hur fungerar det?](kunskap/cimage-hur-fungerar-det)" som går igenom hur vi kan använda oss av verktyget Cimage för att jobba med våra bilder.

1. Arbeta igenom artikeln "[Hur kan vi göra bilder och video responsivt](kunskap/hur-kan-vi-gora-det-responsivt)".



### Uppgifter {#uppgifter}

1. Gör uppgiften "[Utvärdera webbplatsers laddningstid och användbarhet](uppgift/utvardera-webbplatsers-laddningstider-och-anvandbarhet-v2)". Du skall skriva en rapport, enskilt eller i grupp.

1. Gör uppgiften "[Bygg ett galleri](uppgift/bygg-ett-galleri)" där ni med hjälp av tidigare kunskap om grid och er nyfunna kunskap om bildhantering ska bygga ett responsivt galleri.

1. Gör uppgiften "[Youtube-klipp i iframe](uppgift/youtube-i-iframe)". Du skall via en iframe ladda in valfri video som en del av din galleri sida.

1. Försäkra dig om att du har gjort `dbwebb publishpure me` och taggat din inlämning med version 5.0.0 (eller högre) samt pushat ditt repo och dess taggar till GitHub.



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1 studietimme)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Kom ihåg att publicera din portfölj till GitHub. Använd nedanstående kommandon i terminal när du står i `me/portfolio:

```shell
git push
git push origin --tags
```

Publicera sedan till studentservern med följande kommando:

```shell
dbwebb publishpure me
```

Gör Quiz på Canvas och lämna sedan in din inlämning i den nu upplåsta uppgiften. Länka till din portfölj på studentservern som en del av din inlämning.



Testa din inlämning {#testa}
-----------------------------------------------

Kommandot `dbwebb test` testar att grunderna för kmom'et är på plats. Vår rättning utgår från detta kommando.

```shell
$ dbwebb update
$ dbwebb test kmom05
```
