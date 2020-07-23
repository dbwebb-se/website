---
author: efo
category: javascript
revision:
  "2017-05-15": (A, efo) Första utgåvan inför kursen webapp v2.
...
Virtuella Noder
==================================
Document Object Model (DOM) är den logiska strukturen bakom HMTL och XML dokument. DOM api't definerar hur vi hämtar ut noder och manipulerar dessa. DOM har en logisk struktur där noder kan ha förälder noder och barn noder och där enskilda noder har attribut och värden som kan hämtas från dokumentet med hjälp av DOM api't. Vi har i tidigare kurser manipulerat HTML-dokument med hjälp av javascript. I mithril definerar vi inte noderna i HTML, men genom att använda den inbyggda `m()`-funktion ([Dokumentation](https://mithril.js.org/hyperscript.html)). I denna artikel ska vi titta närmare på mithrils virtuella noder ([Dokumentation](https://mithril.js.org/vnodes.html)).



<!--more-->



Mithrils virtuella DOM {#virtuella}
--------------------------------------
Det traditionella sättet att skapa ett DOM-träd är genom att definera noderna i ett HTML-dokument. Ett simpelt träd kan se ut enligt nedan.

```html
<main class="main">
    <article class="news-item">
        <h1>Rubrik</h1>
        <p class="ingress">Brödtext<p>
        <a href="/news/2">Läs mer</a>
    </article>
</main>
```

I mithril bygger vi upp detta genom att använda `m()`-funktionen och samma DOM-träd ser ut enligt nedan. Vi använder arrayer för att definera nodernas barn. Den stora fördelen med ett virtuellt DOM-träd är att det är frikopplat från HMTL-dokumentet och man dynamisk och snabbt ändra noder. I mithril ritas hela vyn om varje gång vyn `state` ändras. Hela vyn ritas om av prestanda skäl då uppritandet av noder går oerhört snabbt i moderna JavaScript motorer.

```javascript
m("main.main", [
    m("article.news-item", [
        m("h1", "Rubrik"),
        m("p.ingress", "Brödtext"),
        m("a", { href : "#!/news/2" }, "Läs mer")
    ])
])
```



Routing {#routing}
--------------------------------------
I kodexemplet ovan skapar vi en virtuell nod som representerar en länk. Med hjälp av `oncreate` livscykel metoden ([Dokumentation](https://mithril.js.org/lifecycle-methods.html#oncreate)) kopplar vi länken till vår apps router. I `href`-attributet anger vi routen `/news/2`. Om vi vill ha tillgång till 2:an i routern kan vi använda oss av ett wildcard i routen enligt nedan.

```javascript
m.route(document.body, "/news", {
    "/news": NewsList,
    "/news/:id": NewsArticle
});
```

`NewsArticle` vyn får nu ett attribut `id` som innehäller värdet 2 i vårt fall. Inuti vyn kommer vi åt det som ett attribut på de virtuella noder som utgör vyn. Så till exempel kan vi använda det i en `oninit` livscykel metod.

```javascript
oninit: function(vnode) {News.load(vnode.attrs.id)},
```



Avslutningsvis {#avslutning}
--------------------------------------
Vi har i denna artikel tittat på virtuella DOM-trädet och mer specifikt hur man skapar dessa i mithril. Med hjälp av `m()`-funktionen och hantering av `vnode` kan vi bygga dynamiska webbplatser som uppdateras tillsammans med vyns `state`. Vi har även tittat på hur vi med hjälp av virtuella noder kan skicka attribut mellan vyer.
