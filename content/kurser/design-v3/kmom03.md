---
author:
    - nik
    - efo
revision:
    "2021-11-09": (B, efo) Nya uppgift.
    "2020-10-15": (A, nik) Nysläpp för design-v3
...
Kmom03: Layout
====================================

Vi ska denna vecka kolla på olika sätt att strukturera upp stommen av vår sida, vår layout. Att uppdatera vår layout är en av de större ändringar vi kan göra med hjälp av CSS/SASS, utan att uppdatera vår HTML.

Några av de tekniker vi ska kolla lite närmre på är Flexbox och CSS-Grid, som är två vanliga sätt att gå tillväga. Tanken är att ni i slutet av kursmomentet ska implementera dessa tekniker i eran portfolio.

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>

Läs & Studera  {#lasanvisningar}
---------------------------------

*(ca: 8-10 studietimmar)*

### Kurslitteratur  {#kurslitteratur}

Läs följande:

1. Läs i boken "[The principles of Beautiful Web Design](kunskap/boken-the-principles-of-beautiful-web-design)".

    * Kap 1: Layout and Composition (repetera)

### Design med HTML5 och CSS3  {#guide}

1. Läs igenom följande sektion i guiden "[Design med HTML5 och CSS3](guide/design-med-html5-och-css3)".
    * [Layout](guide/design-med-html5-och-css3/layout)

I sektionen [Layout](guide/design-med-html5-och-css3/layout) tittar vi på hur vi med hjälp utav Flexbox och CSS-Grid kan ändra sidans layout så den fungera bra oavsett skärmstorlek.

### Grid-baserad layout och Flex {#grid}

Läs följande för att få en introduktion och översikt till gridbaserad layout och flexbox.

1. Läs två artiklar om "[History of the design grid I](https://99designs.com/blog/tips/history-of-the-grid-part-1/)" och "[History of the design grid II](https://blog.99cluster.com/blog/tips/history-of-the-grid-part-2/)" för att få en överblick om vad gridbaserad layout handlar om.

1. Det finns en artikel hos Design Systems, "[Space, Grids and Layouts](https://www.designsystems.com/space-grids-and-layouts/)" som överskådligt går igenom en del saker som vi nämnde i förra kursmomentet utöver hur man kan tänka kring layout.

1. CSS-Tricks erbjuder en hel del trevliga guider för oss webbutvecklare, särskilt inom just Flexbox och CSS-Grid. De har väldigt tydliga exempel som gör det lätt att förstå hur de olika teknikerna beter sig samt vilka CSS-regler som finns tillgängliga. Du kan läsa mer om det i dessa tre artiklar:
    * [CSS-Tricks - A Complete Guide to Grid](https://css-tricks.com/snippets/css/complete-guide-grid/)
    * [CSS-Tricks - A Complete Guide to Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
    * [CSS-Tricks - Centering in CSS: A Complete Guide](https://css-tricks.com/centering-css-complete-guide/)

### Övrigt {#ovrigt}

1. Artikeln "[Design elements and Principles](https://www.canva.com/learn/design-elements-principles/)" går igenom olika design element och principer och är bra att läsa igenom under kursens gång.

1. I uppgiften så ska ni tolka Wireframes, vill man läsa mer om det kan man göra det [här](https://en.wikipedia.org/wiki/Website_wireframe).



### Video {#video}

Veckans PT-video handlar om din roll i en grupp.

[YOUTUBE src="7KSCvPwNrzE" width=700 caption="din roll?"]



Hållbarhet {#hallbarhet}
-------------------------------------------

Vi fortsätter fokusera på perspektivet *hållbarhet* och vilken roll vi som programmerare har i den sammanhangen.

I detta kmom tar vi en titt på hur Internet skapar en mer jämlik värld där fler och fler kan få tillgång till information. International Telecommunication Union (ITU) är en del av FN och gav förra ut [följande rapporter](https://www.itu.int/itu-d/reports/statistics/2021/11/15/foreword/) om Internet.



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 8-10 studietimmar)*

### Övningar {#ovningar}

1. Följande delar av guiden bör genomföras:
    * [CSS Grid Layout](guide/design-med-html5-och-css3/css-grid-layout)
    * [Flexbox - Parent Elements](guide/design-med-html5-och-css3/flexbox)
    * [Flexbox - Child Elements](guide/design-med-html5-och-css3/flexbox-del2)

1. Arbeta igenom artikeln [Skapa en specifik layout i Pico](kunskap/skapa-en-specifik-layout-i-pico) som beskriver hur du kan skapa en layout för specifika sidor.



### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Lös uppgiften "[Bygg en teknologi-sida med CSS-Grid](uppgift/bygg-en-teknologi-sida-css-grid)".

1. Försäkra dig om att du har gjort `dbwebb publishpure me` och taggat din inlämning med version 3.0.0 (eller högre) samt pushat repot inklusive taggarna till GitHub.



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

I detta kursmoment jobbar vi utifrån wireframes som finns tillgängliga i "[Bygg en teknologi-sida med CSS-Grid](uppgift/bygg-en-teknologi-sida-css-grid)". Kolla så funktionaliteten överenstämmer de wireframes som finns i uppgiften.



### dbwebb test {#dbwebb-test}

Kommandot `dbwebb test` testar att grunderna för kmom'et är på plats. Vår rättning utgår från detta kommando.

```shell
$ dbwebb update
$ dbwebb test kmom03
```
