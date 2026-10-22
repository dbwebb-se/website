---
author:
  - mos
  - efo
views:
    flash:
        region: flash
        template: default/image
        data:
            src: "image/snapht18/kabbe.jpg?w=1100&h=360&cf&f=pixelate,8,2&a=0,0,5,0"
revision:
    "2018-12-03": (E, mos) Uppdaterat inför ht18 med design v2.
    "2018-10-19": (D, efo) Uppdatering med design guide.
    "2018-06-08": (C1, mos) Nytt dokument inför uppdatering av kursen.
    "2017-11-27": (C, mos) Genomgången inför ht17.
    "2016-11-28": (B, mos) La till manualen om CImage som läsresurs.
    "2016-11-15": (A, mos) Första utgåvan.
...
Kmom05: Bild
====================================

[FIGURE src="image/snapht18/kabbe.jpg?w=w3" caption="Kabbe på vandring en sen höstdag i Blekinges skärgård på Yttre Stekön. Fundera på om bilden innehåller något som gör den mer eller mindre intressant."]

Låt oss ägna ett kursmoment åt att testa runt med bilder, bildverktyg och bildformat samt hur vi publicerar bilderna på en webbplats, inklusive responsivitet.

[FIGURE src="image/snapht18/kabbe.jpg?w=800&crop=400,300,600,160&h=400&cf&sharpen" caption="Att beskära en bild och fokusera på olika delar i bilden kan ge bilden olika fokus och skapa intresse."]

Vi skall se hur vi kan använda bilder för att skapa "bildtunga" teman, här är bilderna en viktig ingrediens i webbplatsens tema.

Vi skall också träna på att exemplifiera texter med bilder och välja hur dessa bilder skall representeras i textens flöde. Här kan man tänka på att bilder beskärs till liknade storlek och form för att skapa enhetlighet.

<!--more-->

[FIGURE src="image/snapht18/kabbe.jpg?w=600&crop=400,300,600,160&h=300&cf&f=grayscale&sharpen" class="center" caption="Skall bilderna vara i färg, svartvitt eller ha en annan nyans, olika effekter kan skapa enhetlighet med resten av webbplatsens design."]

Vi behöver vara medvetna om att bilder kan vara tunga att ladda och det vill vi hitta sätt att hantera. Hur tunga (stora) behöver bilder vara när de skall visas på en webbplats? Man vill ju både ha liten filstorlek på bilderna och en hög kvalitet på bilden som visas.

[FIGURE src="image/snapht18/kabbe.jpg?w=300&cf&sharpen&a=10,40,10,30" class="right w33" caption="Bilder kan behöva beskäras för att passa in i flödet av en text."]

När man pratar om bilders kvalitet så kan man beakta olika format på bilder och hur dessa format kan optimeras. Två av de vanligaste formaten är JPEG och PNG. JPEG passar bra för foton där man kan justera kvaliteten genom att ta bort delar av bildens exakthet. PNG lämpar sig för datoranimerade bilder, linjegrafik och skärmdumpar och i de fall där man inte vill att bildens exakthet ändras. Man bör välja rätt bildformat, den underlättar att behålla kvaliteten på en bild. Andra bildformat som används i webbsammanhang är GIF och ett nyare format WEBP.

Bilder kan optimeras, det finns _lossless_ och _lossy_ optimering där skillnaden är om bildens exakthet påverkas eller ej. När man pratar om _lossless_ så är det optimering som inte påverkar bildens exakthet, alla delar av bilden är fortfarande kvar och det som optimeras är till exempel hur bilden lagras på fil. Optimering med tekniker som är _lossy_ innebär att man tar bort delar av bildens exakthet och ändå försöker nå så att användaren uppfattar bilden som tydlig.

För att hantera bildera, för att förändra dess kvalitet - lossless eller lossy - krävs verktyg. Vill man beskära en bild, eller lägga till ett filter som gör bilden skarpare, så behövs verktyg. Vilka verktyg kan en webbprogrammerare ha nytta av?

När man placerar ut bilder i text så har man alternativen att låta bilden spänna över hela sidan. Bilden kan också vara vänsterjusterad alternativt centrerad och ta upp en del av artikelns fulla bredd. Eller så väljer man att flyta texten runt bilden som då placeras till vänster eller höger.

[FIGURE src="image/snapht18/kabbe.jpg?w=300&cf&sharpen&crop=150,100,730,255&f=grayscale&f1=contrast,-05&sharpen" class="left w33" caption="Bilder kan flyta med texten, till vänster eller höger."]

Men, hur bör detta förändras när man gör responsiva webbplatser och både text och bild förändras på mindre enheter? Här handlar det inte enbart om att leverera rätt bild till rätt enhet, det gäller också att placera ut bilden på rätt sätt i förhållande till texten på olika enheter.

Att göra det för hand fungerar på mindre webbplatser, men om man har en webbplats som dbwebb så kan man behöva andra tekniker för att finna ett någorlunda standardiserat flöde för responsiva bilder i text.

Behöver bilderna vara likadana på en desktop och en mobil? Ibland vill man skicka mindre bilder till en mindre enhet, speciellt om det är dålig koppling på nätverket mellan enheten och webbplatsen. Men, sedan finns det små enheter som har riktigt hög upplösning på skärmen och det kan kräva en större bild. Här ser vi krav som eventuellt inte går att förena.

Vi har många frågeställningar om bilder, men låt se om vi kan bringa klarhet i några av dem.

[FIGURE src="image/snapht18/kabbe.jpg?w=200&cf&sharpen&crop=150,100,730,255&f=grayscale&f1=contrast,-15&sharpen&convolve=emboss" class="center" caption="Som sagt, bilder."]

Innan du påbörjar kursmomentet så kan du ta en sväng ut i skogen, eller staden, ta med din kamera och fota loss lite. Så får du lite material att lägga upp på din redovisa-sida.

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Läs & Studera  {#lasanvisningar}
---------------------------------

*(ca: 8-10 studietimmar)*



### Kurslitteratur  {#kurslitteratur}

Läs följande:

1. Läs i boken "[The principles of Beautiful Web Design](kunskap/boken-the-principles-of-beautiful-web-design)".

    * Kap 5 Imagery



### Design med HTML5 och CSS3  {#guide}

1. Läs igenom följande sektion i guiden "[Design med HTML5 och CSS3](guide/design-med-html5-och-css3)".
    * [Bilder](guide/design-med-html5-och-css3/bilder)

I sektionen [Bilder](guide/design-med-html5-och-css3/bilder) använder vi olika tekniker för att skapa responsiva bilder och bilder som fungerar bra på högupplösta skärmar.



### Webbplatsers laddningstid {#artikel}

[FIGURE src="image/snapht18/pagespeed_dbwebb.png?w=w3" caption="Webbplatsen dbwebb.se mäts med verktyget PageSpeec Insights."]

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

1. Som extra läsning kring responsiva bilder, om du har tid och intresse, rekommenderas följande två examensarbeten, gjorda av webbprogrammerare.
    * [Responsive images in HTML5: A standardized solution in markup language](http://bth.diva-portal.org/smash/record.jsf?aq2=%5B%5B%5D%5D&c=2&af=%5B%5D&searchType=SIMPLE&sortOrder2=title_sort_asc&query=Responsive+images&language=sv&pid=diva2%3A1212760&aq=%5B%5B%5D%5D&sf=all&aqe=%5B%5D&sortOrder=author_sort_asc&onlyFullText=false&noOfRows=50&dswid=-4378), Philip Esmailzade, 2018
    * [Responsive Images: A comparison of responsive image techniques with a focus on performance](http://bth.diva-portal.org/smash/record.jsf?aq2=%5B%5B%5D%5D&c=3&af=%5B%5D&searchType=SIMPLE&sortOrder2=title_sort_asc&query=Responsive+images&language=sv&pid=diva2%3A1032879&aq=%5B%5B%5D%5D&sf=all&aqe=%5B%5D&sortOrder=author_sort_asc&onlyFullText=false&noOfRows=50&dswid=9948), Kalle Kihlström, 2016.



### Bildhantering med Cimage {#bildhantering}

[FIGURE src="https://cimage.se/img/favicon/favicon_128x128.png" class="right w25" caption="Cimage"]

Lär dig mer om Cimage för att använda det i uppgiften som kommer.

1. För att få en bredare kunskap i hur bilder kan hanteras för webben så går du snabbt och översiktligt igenom [manualen för Cimage](https://cimage.se/). I manualen hanteras flera begrepp inom bildhantering såsom bildformat, beskärning av bilder, optimering av filstorlekar och kvalitetsaspekter.

På din me/redovisa finns Cimage installerat så du kan använda det för att hantera dina bilder. Manualen ger dig en insyn i hur du kan använda verktyget i den kommande uppgiften.



### LESS modul för figure/figcaption {#desinax}

I uppgiften kommer du att integrera ditt tema med en modul som hanterar bilder och bildtexter med html-elementen `<figure>` och `<figcaption>`. Börja med att snabbt läsa igenom modulens README-fil och titta på exemplen för att bekanta dig med hur modulen fungerar.

1. Bilder med [desinax/figure](https://github.com/desinax/figure).



### Lästips verktyg {#lastips}

Följande verktygstips gäller bildhantering. Kika över lista och se vilka som nämns. Som webbprogrammerare kan man behöva olika typer av verktyg för att bemästra bilder i olika situationer.

1. [GIMP](https://www.gimp.org/) är en fri variant till bildbehandlingsprogram likt Photoshop.

1. [Inkscape](https://inkscape.org/en/) är ett fritt program för att rita och hantera bilder i vektorgrafik såsom SVG. Vill du ha bilder att utgå ifrån så finns en bildbank med SVG-bilder på [OpenClipart](https://openclipart.org/https://openclipart.org/).

1. Ett bra snapshot-verktyg för skärmdumpar vill du integrera i din verktygslåda. Du vill ha ett verktyg där du enkelt kan ta en snapshot på hela eller delar av skärmen eller på en specifik applikation eller på innehållet i en webbsida. Det är smidigt om det är kopplat till ett enklare ritverktyg vilket gör det enkelt att rita på din snap. På Linux använder jag ett verktyg som heter [Shutter](http://shutter-project.org/).

1. [ImageMagick](imagemagick.org/) är ett verktyg som hjälper dig att analysera och konvertera bildfiler på kommandoraden i terminalen. Verktygen går att installera på både Windows, Mac OS och Linux.



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 8-10 studietimmar)*



### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[Utvärdera webbplatsers laddningstid och användbarhet](uppgift/utvardera-webbplatsers-laddningstider-och-anvandbarhet)". Du skall skriva en rapport, enskilt eller i grupp.

1. Gör uppgiften "[Tema och blogg med stöd för bilder](uppgift/tema-och-blogg-med-stod-for-bilder)". Du skall bygga en blogg med temat "Dagens bild" och på det sättet visa upp att du behärskar bildhanteringen med Cimage, shortcode FIGURE och LESS-modulen desinax/figure som stylar figure-elementet.

1. Försäkra dig om att du har gjort `dbwebb publishpure redovisa` och taggat din inlämning med version 5.0.0 (eller högre) samt pushat repot inklusive taggarna till GitHub.



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

* Berätta kort om erfarenheterna med din undersökning av webbplatsers laddningstid och vad du kom fram till.
* Har du några funderingar kring Cimage och dess nytta och features? Vilka bildverktyg använder du själv normalt sett?
* Hur gick det att jobba med modulen @desinax/figure och hur är din syn på modulen?
* Vad är din egen allmänna uppfattning kring bilder för webben, nedladdningstider, responsiva bilder och allmänt kring bildbehandling för webben?
* Vilken är din TIL för detta kmom?

<!--stop-->



<!--
1. I kursrepot `example/figure` finns två exempel som visar hur man kan jobba med `<figure>` och uppnå responsiva bilder. Studera och undersök exemplet och försök förstå hur det fungerar och hur det är uppbyggt. Där hittar du LESS-kod du kan låna till uppgiften.
    * [Figure and figcaption](repo/design/example/figure/figure.html)
    * [Figure and figcaption med media queries](repo/design/example/figure/figure-responsive.html)

1. Pröva att bygga en enkel blogg i Anax Flat genom att studera exempel på [hur man gör en blogg i Anax Flat](anax/gor-en-blogg) i Anax läs igenom hur du kan använda [shortcodes i Markdown](anax/shortcodes).
-->

<!--
### Tekniker för att skriva för webben {#skriva}

1. Läs följande kapitel i guiden "[Skriva för webben](https://www.iis.se/lar-dig-mer/guider/hur-man-skriver-for-webben/)".

    * 6. Skriva texter för webben

-->

<!--
### Video  {#video}

Kika på följande video.

1. Moderskeppet är duktiga på foto och video, du kan hämta inspiration från deras fria youtube-kanal. Jag hittade att följande spellistor känns delvis relevanta för detta kursmoment.

    * [Guider om Foto](https://www.youtube.com/playlist?list=PL7jFK1saS1_Aexc_tx2wWClpQOShZkD2_)
    * [Inspiration för fotografer](https://www.youtube.com/playlist?list=PL7jFK1saS1_DGvKLYHOBb9HlCd_6id-vS)
    * [Bilder och upphovsrätt för designers](https://www.youtube.com/playlist?list=PL7jFK1saS1_DYHuwI_r5U7vVeY6RhZlIM)
-->

<!--
Titta på följande:

1. Till kursen finns en videoserie, "[Teknisk webbdesign och användbarhet](https://www.youtube.com/playlist?list=PLKtP9l5q3ce93K_FQtlmz2rcaR_BaKIET)", kika på de videor som börjar på 5.
-->

<!--
Artikel om hjälpverktyg för bildhantering.
    * Var hittar jag fria bilder?
    * Bilder kan man köpa?

Artikel om att spara utrymme i img/-katalogen. (använd bash-skriptet för att testköra och installera några av postprocessingverktygen)

Bildlära, vad tänka på om bilder.

Fotolära, hur ta fotografier.

Image sprites.

jpeg (foton) kontra png (skärmdump)
color space
storlek på bilderna
kvalitet

-->
