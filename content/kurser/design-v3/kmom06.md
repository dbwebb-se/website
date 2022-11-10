---
author:
    - nik
    - efo
revision:
    "2021-11-25": (B, efo) Added new assignment.
    "2020-10-15": (A, nik) Nysläpp för design-v3.
...
Kmom06: Tillgänglighet och prestanda
====================================

Som avslutning på kursen så ska vi kolla över två områden som lätt hamnar i skymundan. Vi börjar med att kolla på begreppet "the final touch" som är bra att vara medveten om i sammanhanget design. Det handlar om det sista penseldraget och att se när man är "färdig" med sin design.

<!--more-->

Ibland händer det att man tittar på sin webbplats och ser att den inte känns komplett, något saknas, men man har svårt att sätta fingret på vad det är. Vi pratar om webbplatsens design och känslan den ger när man tittar på den. Det kan vara de små sakerna som gör det, *the final touch*.

Det är lätt att stirra sig blind på sin egen sida och det är därför viktigt att kolla på den utifrån en kritisk synvinkel. För att hjälpa med detta så kommer vi att analysera vår egen portfolio i jämförelse med tre andra sidor inom samma kategori, personsidor kan vi kalla det.

[FIGURE src=image/snapht16/design-van-gogh.jpg?w=w3 caption="Tavla Starry Night ([Stjärnenatt i Saint-Rémy](https://sv.wikipedia.org/wiki/Stj%C3%A4rnenatt)) av Van Gogh, 1889, används ofta i undervisning av Art & Design Principles."]

Vi kommer även att kolla på hur vi kan förbättra vår sida sett ifrån tillgänglighet, "accessibility" som det heter på engelska. Vi använder oss utav verktyget Google Lighthouse där vi siktar på att nå 100 på samtliga sidor.

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>

Läs & Studera  {#lasanvisningar}
---------------------------------

*(ca: 8-10 studietimmar)*

### Kurslitteratur  {#kurslitteratur}

Läs följande:

1. Läs i boken "[The principles of Beautiful Web Design](kunskap/boken-the-principles-of-beautiful-web-design)".

    * Kap 3: Texture
    * Kap 1: Layout and Composition (repetera kapitlet, främst delarna med Balance, Unity, Emphasis)

### Design med HTML5 och CSS3  {#guide}

1. Läs igenom följande sektion i guiden "[Design med HTML5 och CSS3](guide/design-med-html5-och-css3)".
    * [Design](guide/design-med-html5-och-css3/design)

I sektionen [Design](guide/design-med-html5-och-css3/design) tittar vi tillbaka på tidigare sektioner och använder vår kunskap för att skapa en helhet med ett stort fokus på detaljen.

1. Det har även tillkommit en del i guiden för förra kursmomentet som kan hjälpa er med tillgänglighet.
    * [Bilder - Highlight av bilder utan alt-attributet](guide/design-med-html5-och-css3/highlight-av-bilder)

### Designelement och designprinciper {#design}

Gå igenom följande material om designelement och designprinciper, det ger dig en grund i vad det handlar om. Du behöver veta det för att utföra uppgiften.

1. Titta igenom videos i spellistan [Design -- principer och element](https://www.youtube.com/playlist?list=PLKtP9l5q3ce-oz7aoBkk-oEn4xzGbtqxU). Där finns samlat ett par korta videor som visualiserar, exemplifierar och förklarar designelement och designprinciper. Titta där för att få en uppfattning om begreppen och se hur de kan användas. I videoserien finns även en föreläsning om "Elements & Principles of Art" (överkurs) som kan vara intressant att titta på i sammanhanget.

1. Studera ett par olika designprinciper och se hur designelement kan användas för att uppnå dessa principer. Materialet finns på webbplatsen [Visual Literacy](http://www.educ.kent.edu/community/VLO/Design/principles/) (oklart om länken fungerar) och en offline-kopia av webbplatsen finns i dokumentet [vl.pdf](article/vl.pdf).

1. Läs mer om designprinciper i "[Design Elements & Principles](https://www.canva.com/learn/design-elements-principles/)" som visualiserar, beskriver och exemplifierar 20 designprinciper.

1. Hämta inspiration till designeffekter och designelement via exempel från CodePen. Här är en [CodePen sökning på "effects"](http://codepen.io/search/pens?q=effects) som ger en god start in bland exempel.

### Tillgänglighet {#tillganglighet}

Gå igenom följande material om tillgänglighet, MDN erbjuder en liten mjukare läsning medans W3 är utförliga guidelines. Det finns även två verktyg som kan hjälpa dig, tillsammans med Google Lighthouse vi använder i uppgiften.

1. "[What is accessibility - MDN](https://developer.mozilla.org/en-US/docs/Learn/Accessibility/What_is_accessibility)" erbjuder en kort introduktion till begreppet "accessibility".

1. "[Web Content Accessibility Guidelines (WCAG)](https://www.w3.org/WAI/standards-guidelines/wcag/)" är W3s guidelines kring "accessibility". Som vanligt när det gäller W3 så är det ganska utförligt, men det är bra att veta att det finns.

1. Ett annat bra verktyg att använda på sin sida är [Toptal Colorblind Web Page Filter](https://www.toptal.com/designers/colorfilter/) som tillåter dig att se hur sidan ser ut med olika typer av färgblindhet. Det kan vara bra att använda på sin sida så man ser att inga färger får dålig kontrast eller överlag få ett hum om hur sidan kan uppfattas av andra.

Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 8-10 studietimmar)*

### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[Utvärdera designprinciper som webbplatser använder sig av](uppgift/utvardera-webbplatsers-designprinciper-v2)". Du skall skriva en rapport, enskilt eller i grupp.

1. Gör uppgiften "[Förbättra din portfölj med designprinciper](uppgift/forbattra-din-portfolj-med-design-principer)". Där vi använder erfarenheter från analysen om designprinciper och förbättrar vår portfölj.

1. Gör uppgiften "[Tillgänglighet med Google Lighthouse](uppgift/tillganglighet-med-google-lighthouse)". Du ska kolla på hur din sida presterar i tillgänglighet enligt Google Lighthouse.

1. Försäkra dig om att du har gjort `dbwebb publishpure me` och taggat din inlämning med version 6.0.0 (eller högre) samt pushat ditt repo och dess taggar till GitHub.



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
# stå i dbwebb-kurser/design

$ dbwebb update
$ npm install
$ dbwebb test kmom06
```
