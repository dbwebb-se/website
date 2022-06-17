---
views:
    flash:
        region: flash
        template: default/image
        data:
            src: "image/webtec/logo-htmlcss.png"
author:
    - mos
revision:
    "2021-09-02": "(A, mos) Första utgåvan."
...
Kmom01/02: HTML & CSS
==================================

Vi börjar med en labbmiljö för att bygga webbplatser och med hjälp av den så studerar vi HTML och CSS för att se hur de bidrar när vi bygger en webbplats. HTML står för strukturen och innehållet på webbplatsen och CSS bidrar med utseende och layout.

När det gäller webbsidornas layout så finns det flera grundlayouter för hur man bygger en webbplats. Vi kommer titta på "one-page-website" där man bygger en webbplats i en webbsida. Vi tittar även på en mer klassisk webbplats med webbsidor som har en-, två- och tre-kolumners layout.

Vi tar hjälp av de validatorer och testverktyg som hjälper oss att kontrollera att HTML-dokumenten har en korrekt struktur, liksom att CSS-filerna följer den standard som finns. Vi använder även verktyg för att "mäta" vår webbplats för att se att den håller god kvalitet ur en teknisk synvinkel.

Vi behöver förstå flödet mellan webbläsare, webbserver och källkodsfiler för HTML, CSS, bilder och liknande resurser. Det finns ett flöde som sker när webbläsaren skickar en förfrågan till webbservern, en förfrågan om att hämta resurser från webbservern, webbservern letar upp dessa och levererar till webbläsaren som tolkar filernas innehåll och visar upp en webbsida.

När man bygger en webbplats underlättar det om man har en god katalogstruktur för alla de resurser som bygger upp webbplatsen. Det blir en viktig startpunkt för vårt arbete.

Dagens webbplatser behöver fungera på olika stora skärmar. Det är vanliga datorskärmar, bärbara datorer, läsplattor, olika storlekar av mobiler och sen stora och breda widescreen-skärmar. Vi ser hur responsiv webbdesign kan underlätta detta arbetet.

<!--more-->

<!--
[FIGURE src=/image/snapvt15/me-done.png?w=w3 caption="En me-sida som den kan se ut när den är klar."]
-->

När du är klar med detta kursmoment så har du grunderna för hur man bygger och driftsätter en webbplats med HTML och CSS.

<small><i>Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.</i></small>



Studieplan & Upplägg {#studieplan}
---------------------------------

Följande är förslag till en grov och övergripande studieplan för att genomföra kursmomentet. Läs igenom hela dokumentet, innan du bestämmer din plan, det kan finnas mer aktiviteter och lärmoment som är relevanta att utföra inom ramen för kursmomentet.

<small><i>Kursmomentet omfattar cirka **20 + 20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke.</i></small>

<!--
Intro till webbprogrammering
https://www.youtube.com/watch?v=erEgovG9WBs

Google it like a SE
https://www.youtube.com/watch?v=cEBkvm0-rg0

PHP 100 secs
https://www.youtube.com/watch?v=a7_WFUlFS94
-->

### Introveckan {#introveckan}

Introveckan har ett eget detaljschema med aktiviteter som hjälper dig att komma igång med kurs och labbmiljö.

* Information och schema om "[Introveckan 2021](https://dbwebb.se/kurser/faq/introduktionsveckan-2021)".

Målet med introveckan är att man kommer igång med kursen, bekantar sig med materialet och har installerat labbmiljön innan veckan är slut.

Grovt sett handlar det om följande aktiviteter.

* Titta på föreläsning "[Kursintroduktion](./../forelasning/kursintro)" med introduktion till kursen, innehållet och upplägget.
* Jobba igenom "[Installera kursens labbmiljö](./../installera-labbmiljo)" för att komma igång med din labb- och utvecklingsmiljö för kursen.

Avsluta med att genomföra följande uppgift.

* Gör uppgiften "[Skapa en rapportsida till webtec-kursen](uppgift/skapa-en-rapport-sida-till-webtec-kursen)".

Nu är du redo för kursen.



### Vecka 1 {#v1}

Titta på följande föreläsningar. Föreläsningarna kan innehålla ytterligare läsanvisningar.

* [Webbteknologier](./../forelasning/webbteknologier)
* [HTML](./../forelasning/html)
* [CSS](./../forelasning/css)

Delta i lektionen som förbereder dig för veckans uppgift.

* I lektionen "[Skapa en One-page-website](./../forelasning/onepage)" får du hjälp att komma igång med uppgiften. Lektionen spelas in.

Genomför veckans uppgift.

* Gör uppgiften "[Skapa en One-page-website](uppgift/skapa-en-one-page-website)".



### Vecka 2 {#v2}

Titta på följande föreläsningar. Föreläsningarna kan innehålla ytterligare läsanvisningar.

<!-- * [Protokollet HTTP](./../forelasning/protokollet-http) -->
* [Responsiv webbdesign](./../forelasning/responsiv-webbdesign)

Delta i lektionen som förbereder dig för veckans uppgift.

* I lektionen "[Skapa en responsiv webbplats med HTML och CSS](./../forelasning/htmlcss)" får du hjälp att komma igång med uppgiften. Lektionen spelas in.

Genomför veckans uppgift.

* Gör uppgiften "[Skapa en responsiv webbplats med HTML och CSS](uppgift/skapa-en-responsiv-webbplats-med-html-och-css)".

<!--
1. Läs igenom artikeln "[Vanliga CSS-konstruktioner som är bra att kunna](kunskap/vanliga-css-konstruktioner-som-ar-bra-att-kunna)" och prova konstruktionerna på egen hand.
-->



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

Läs instruktionen om [hur du skall redovisa](./../redovisa).

För att avrunda detta kmom, se till att följande frågor besvaras i redovisningstexten.

* Har du provat på webbutveckling, HTML, CSS eller liknande sedan tidigare?
* Vilken är din TIL för detta kmom?

TIL är en akronym för "Today I Learned" vilket leksamt anspelar på att det finns alltid nya saker att lära sig, varje dag. Man brukar lyfta upp saker man lärt sig och där man kanske hajade till lite extra över dess nyttighet eller enkelhet, eller så var det bara en ny lärdom för dagen som man vill notera.



Resurser & Referenser {#resurser}
---------------------------------

Här finns referenser och resurser som kan användas för studier i det som kursmomentet omfattar.



### Videor och spellista {#playlist}

Kursen innehåller genomgångar och föreläsningar som spelas in eller streamas och därefter läggs i en spellista.

Du kan nå spellistan på "[webtec streams h21](https://www.youtube.com/playlist?list=PLKtP9l5q3ce8DePCFFEmed97-s6vY3LDU)".

Du kan även finna äldre inspelade föreläsningar från tidigare kursomgångar. De listas här enbart av historiska skäl.

* [htmlphp streams ht20](https://www.youtube.com/playlist?list=PLKtP9l5q3ce9knU3C_9NarDQFQmn3pazs)
* [htmlphp streams ht19](https://www.youtube.com/playlist?list=PLKtP9l5q3ce-tE2eS0JRdCZSpXlbGSWVK)



### Video för orientering {#video}

Titta på följande videor/filmer. Filmerna är tänkta att ge dig en liten orientering i det område som behandlas i kursmomentet.

* [A brief history of the World Wide Web](https://www.youtube.com/watch?v=sSqZ_hJu9zA) (3 min)
* [Evolution of Web Design 1990-2019](https://www.youtube.com/watch?v=XYTwYmOjqQs) (8 min)
* [Bad Web Design: A Look At The Most Hilariously Terrible Websites From Around The Web](https://www.youtube.com/watch?v=6befMTTTTRQ) (11 min)

Videorna ovan finner du även i spellistan "[ Om webbutveckling (HTML, CSS, PHP, SQL)](https://www.youtube.com/playlist?list=PLKtP9l5q3ce-Qp6DTS_2s6q-Br66ufoWc)".



### Webbutveckling {#web}

Webbplatserna web.dev, MDN och W3Schools är relevanta resurser när man vill lära sig webbutveckling med HTML och CSS.

* [web.dev](https://web.dev/), en Google community för webbutveckling.

Resurser på Mozilla Developers network (MDN).

* [MDN: Learn web development](https://developer.mozilla.org/en-US/docs/Learn)
* [MDN: HTML HyperText Markup Language](https://developer.mozilla.org/en-US/docs/Web/HTML)
* [MDN: CSS Cascading Style Sheets](https://developer.mozilla.org/en-US/docs/Web/CSS)

Resurser på W3Schools.

* [HTML Tutorial](https://www.w3schools.com/html/)
* [CSS Tutorial](https://www.w3schools.com/css/)



### WHATWG standarder {#whatwg}

Organisationen WHATWG arbetar med standardiseringar av webbteknologier, bland annat HTML och DOM.

* [WHATWG Standardiseringsorgan](https://whatwg.org/) för standardisering av HTML och DOM.
* [HTML Living Standard](https://html.spec.whatwg.org/multipage/) är det levande standarden för HTML.
* [DOM Living Standard](https://dom.spec.whatwg.org/) är det levande standarden för DOM.

WHATWG är sedan 2019 den organisation som standardiserar HTML och DOM, W3C följer deras arbete och återanvänder deras specifikationer. [Läs deras överenskommelse](https://www.w3.org/2019/04/WHATWG-W3C-MOU.html).



### W3C standarder {#w3c}

Organisationen W3C arbetar med standardiseringar av webbteknologier, bland annat HTML och CSS.

* [W3C Standardiseringsorgan](https://www.w3.org/) standardiseringar av HTML och CSS.
* [W3C Web design and Applications](https://www.w3.org/standards/webdesign/) omfattar bland annat HTML och CSS.
* [W3C arbetet inom HTML och CSS](https://www.w3.org/standards/webdesign/htmlcss) för nuvarande status och versioner av standarder.



### HTML & CSS referensmanual {#referens}

Referensmanualer till HTML och CSS finns på MDN, de är mer lättlästa än de standarddokument som finns.

Minns att det är enkelt att googla sig fram till rätt sida i referensmanualen, pröva "mdn html body" och "mdn css text-align". Var noga med att du landar på en sida i referensmanualen, det är säkrast så.

* [MDN: HTML reference](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference)
* [MDN: CSS reference](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference)

Det finns även en Cheatsheet som underhålls av W3C, där kan man söka efter element och konstruktioner och få mer information om dem.

* [W3C Cheat Sheet](https://www.w3.org/2009/cheatsheet/)



### Responsiv webbdesign {#resp}

W3Schools har material om hur man bygger grunden i en responsiv webbplats.

* [W3S: HTML Responsive Web Design](https://www.w3schools.com/html/html_responsive.asp)
* [W3S: Responsive Web Design - Introduction](https://www.w3schools.com/css/css_rwd_intro.asp)



### Validatorer och testverktyg {#validate}

Följande verktyg är bra att ha när man utvecklar webbplatser.

* [HTML validator](https://validator.w3.org/)
* [CSS validator](https://validator.w3.org/)
* [Unicorn HTML/CSS validator](https://validator.w3.org/unicorn/)
* [Link checker](https://validator.w3.org/checklink)
* [Mät sidans prestanda](https://web.dev/measure/), kolla upp sidans tekniska kvalitet.
* [CanIUse](https://caniuse.com/), vilka konstruktioner stöds av olika webbläsare.
* [CodePen](https://codepen.io/), ett utvecklingsverktyg där du kan skriva HTML och CSS för att testa konstruktioner som du även kan dela med din kompis.



### Kuriosa {#kuriosa}

Om man vill se hur gamla webbsidor såg ut, eller om man hittar en länk som numer ger 404 (sidan saknas), så kan man använda följande verktyg för att hitta gamla webbsidor.

* [The Wayback Machine](https://archive.org/web/)



<!--
### Guiden {#resp}

Guiden "[Kom igång med HTML och CSS](guide/kom-igang-med-html-och-css)" användes i tidigare kursomgångar och finns kvar här som referensmaterial.

* [Grunderna](guide/kom-igang-med-html-och-css/grunderna)
* [Bakgrund](guide/kom-igang-med-html-och-css/bakgrund)
-->
