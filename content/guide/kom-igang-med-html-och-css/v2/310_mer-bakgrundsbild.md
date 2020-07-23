---
author: lew
revision:
    "2018-06-13": "(A, lew) Första versionen."
...
Mer om bakgrundsbild {#mer-om-bakgrund}
=======================

Vi tittar även på fler sätt att jobba med bakgrunden, bland annat ett *background pattern* och pseudo-element.


##style.css {#style}

```css
html {
    /* Koden från förra delen ska vara kvar här */
}

html::after{
 	content: "";
	background: url("../img/backgroundpattern.png") repeat;
	background-attachment: fixed;
	top: 0;
    left: 0;
	width:100%;
	height:100%;
	position: fixed;
	z-index: -1;
}
```

Ojoj nu hände det grejjer. Vi tar det stegvis och börjar med *backgroundpattern.png*. Bilden är oerhört liten, ca 3x3 pixlar, vitt och diagonalt streck. Den nyfikne kan skapa egna [här](http://www.patternify.com/). Bilden kan användas som ett *pattern* och kommer ritas ut repetativt över hela bakgrundsbilden. Varför ska man göra det då? Det behöver man absolut inte, men det kan bli snyggt!

Selektorn **html::after {...}** skapar ett *pseudo-element* som representerar det valda elementets sista element, dess sista "barn". Motsvarigheten hade varit **html::before{...}**. Det finns flera nyckelord för pseudo-element. För att styla en paragrafs första rad kan man till exempel använda **p::first-line {...}**.

**content** ser till så att pseudo-elementet har något innehåll och används tillsammans med ::before och ::after.

**top** och **left** väljer var bilden ska börja ritas ut med start i toppen och från vänster. Det är inte säkert att båda behövs men jag tar det säkra före det osäkra. Jag vill ha kontrollen.

**position: fixed** ser till så att elementet inte flyttar på sig när man scrollar och **background-attachment: fixed** ser till så bilden inte följer med när man scrollar i det omslutande elementet.

**z-index** bestämmer var elementet ska placeras i djupled (z-axeln). För att det ska fungera måste elementet vara *positionerat* med egenskapen **position**. Om man inte sätter ett värde blir det automatiskt *auto* och elementen hamnar överlappande framför varandra. Ju lägre värde det är, desto längre bak hamnar elementet. Bra, nu har vi koll på det.



##Resultat {#resultat}

Nu är Murphy väldigt nyfiken på hur det ser ut. Vi laddar genast om sidan och ser efter:

[FIGURE src=/image/htmlphp/guide/murphy/pattern-no-opacity.png?w=w3 caption="Pattern över bakgrundsbilden."]

Ojdå. Det syntes lite för mycket. Till hjälp kommer egenskapen **opacity**.

```css
html::after{
 	...
    opacity: 0.2;
}
```

Med **opacity** kan man ställa in ett elements genomskinlighet, dess transparens. Värdena sträcker sig från 0.0 (genomskinlig) till 1.0 (ingen genomskinlighet). Viktigt att komma ihåg är att egenskapen opacity sätter transparens på sig själv och alla element som finns däri.

Vi tittar igen och ser efter hur det blev:

[FIGURE src=/image/htmlphp/guide/murphy/pattern-with-opacity.png?w=w3 caption="Pattern över bakgrundsbilden - med opacity."]

Testa att ändra i koden och se hur det beter sig:

[CODEPEN src=YvRrEa user="dbwebb" tab="html,css" caption="Steg 9 i CodePen."]
