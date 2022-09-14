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
    "2022-08-29": "(A, mos) Första utgåvan."
...
Kmom02: Styla en webbplats
==================================

Vi fortsätter att jobba på den webbpalts vi byggde i förra kursmomentet och nu handlar det om att styla upp webbplatsens olika delar och lära oss med om CSS.

Vi utgår från en ostylad sida, likt följande.

[FIGURE src=image/webtec/style-it/start.png?w=w3 caption="En ostylad webbplats att utgå ifrån."]

När vi är klara har vi stylat navbar, header, footer, innehåll med artikle och aside med kolumnbaserad layout och vi har provat konstruktioner som float och flex och vi har dessutom byggt en responsiv funktion i webbplatsen.

Resultatet blir individuellt men min egen variant ser ut så här.

[FIGURE src=image/webtec/style-it/done.png?w=w3 caption="En stylad webbplats när övningen är klar."]

Lycka till när du nu kastar dig in i en underbar värld av CSS konstruktioner.

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Läs & Studera  {#lasanvisningar}
---------------------------------

*(ca: 3-5 studietimmar)*

Här kan du på egen hand studera och förbereda dig inför övningar och uppgifter.



### Föreläsning {#flas}

Titta på följande föreläsningar. Föreläsningarna kan innehålla tips om läsanvisningar.

1. [CSS](./../forelasning/css) ger dig en introduktion och översikt om Cascading Style Sheets (CSS).

1. [Responsiv webbdesign](./../forelasning/responsiv-webbdesign) visar tankarna bakom konceptet och vissa grundstenar för att komma igång med responsiva webbplatser.



### Litteratur  {#litteratur}

Läs enligt följande.

1. Bekanta dig med resursen "[HTML reference](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference)" och dess innehåll. Prova att slå upp elementet `<article>` och se hur det används. Du behöver snabbt kunna hitta informationen om ett specifikt element och detta kan vara en bra resurs för det.

1. Bekanta dig med resursen "[CSS reference](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference)" och dess innehåll. Prova att slå upp propertyn `border-radious` och se hur det används. Du behöver snabbt kunna hitta informationen om specifika properties och konstruktioner, detta kan vara en bra resurs för det.



### Video för orientering {#video}

Titta på följande videor/filmer. Filmerna är tänkta att ge dig en allmän orientering i det område som behandlas i kursmomentet.

* [Evolution of Web Design 1990-2019](https://www.youtube.com/watch?v=XYTwYmOjqQs) (8 min)
* [Bad Web Design: A Look At The Most Hilariously Terrible Websites From Around The Web](https://www.youtube.com/watch?v=6befMTTTTRQ) (11 min)

Videorna ovan finner du även i spellistan "[Om webbutveckling (HTML, CSS, PHP, SQL)](https://www.youtube.com/playlist?list=PLKtP9l5q3ce-Qp6DTS_2s6q-Br66ufoWc)".



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 8-12 studietimmar)*

Övningar är träning inför uppgifterna, det är ofta klokt att jobba igenom övningarna. Uppgifter skall utföras och redovisas.

Jobba gärna i grupp med dina studiekompisar, men skriv alltid din egen kod för hand. Även om du tjuvkikar för att hitta bra lösningar så är det en stor skillnad att skriva koden själv jämfört med att kopiera från någon.



### Övningar {#ovningar}

Jobba igenom övningarna, de förbereder dig inför uppgifterna.

1. Jobba igenom övningen "[Styla din webbsida med HTML och CSS](kunskap/styla-din-webbsida-med-html-och-css)" som hjälper dig att komma igång med CSS konstruktioner för att styla din webbplats. Spara koden du skriver under `me/report`, om du skriver extra test- och exempelprogram kan du spara dem under `me/kmom02`.

<!--
html/css-guiden används inte mer, är det ett problem eller räcker det att övningarna i kmom01/02 har ersatt den? Man kan göra en handfull exempelprogram där man stylar specifika saker och spelar in videor kopplade till exempelkoden som kan ligga under `example/css`.
    * navbar
    * header
    * column layout
    * flex
    * float
    * block model

-->

### Uppgifter {#uppgifter}

Följande uppgifter skall utföras och resultatet skall redovisas.

1. Gör uppgiften "[Styla din rapportsida till webtec-kursen](uppgift/styla-din-rapport-sida-till-webtec-kursen)" och spara alla filer under `me/report`.



<!--
### Överkurs och extra uppgifter {#extra}

Här följer extra uppgifter som du kan utföra för att lära dig mer, om du har tid, lust och energi.

* Prova att skapa en "dark mode" av din webbplats, förutsatt att den är ljus. Annars får du skapa en ljus version av din mörka webbplats. Det finns ett exempel i ditt kursrepo under `example/css/dark_mode` som visar hur du kan skapa och växla mellan en mörk och ljus version av din webbplats. Integrera liknande funktionalitet i din `me/report`.

* Gör extrauppgift likt stilväljare "[Att bygga en styleväljare till sin webbplats](kunskap/att-bygga-en-stylevaljare-till-sin-webbplats)".

* När man bygger en responsiv webbplats kan man också behöva en responsiv meny som anpassar sig efter webbläsarens bredd. Studera exempelkoden under ditt kursrepo `example/css/responsiv_menu` och försök sedan att lägga till en motsvarande responsiv meny i din `me/report`.
-->



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i din redovisningstext.

* Berätta om din upplevelse att jobba med styling och CSS, hur kändes det?
* Försök reflektera över vilka eventuella svårigheter som finns för en nybörjare att komma igång med CSS.
* Är du nöjd med utseendet på din webbplats eller är det sakr du hade velat ändra på?
* Vilken är din TIL för detta kmom?

<!--
* Gjorde du någon av extrauppgifterna och berätta isåfall hur du tänkte och gick tillväga samt vad du tyckte om resultatet.
-->

Glöm inte att testa din inlämning med `dbwebb test kmom02`.
