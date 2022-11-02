---
author:
  - nik
  - efo
  - moc
# views:
#     flash:
#         region: flash
#         template: default/image
#         data:
#             src: "image/snapht18/design-kmom01-me.png?w=1100&h=360&a=12,10,40,2&f1=pixelate,8,2&cf&nc&f2=colorize,0,30,0,0"
revision:
    "2021-10-01": (C, efo) Uppdaterad inför HT21, med redovisningsbeskrivning.
    "2021-08-11": (B, nik) Uppdaterad inför HT21
    "2020-08-25": (A, nik) Mall för kursmoment
...
Kmom01: Ramverk, innehåll, style
====================================

Vi ska ta oss en titt på den mjukare delen av webbprogrammering, webbdesign och användbarhet. Det handlar också om snabba sidomladdningar, sökmotoroptimering, att skriva för webben och hur vi väljer att organisera webbplatsens material. Vi ska även kolla över de tekniker som används för att uppnå detta.

<!--more-->

Denna kurs erbjuder möjligheten att dyka in i CSS-kodande och att med hjälp utav SASS strukturera upp och optimera sin CSS-kod. Den ger också insyn till vad som är grundstenarna för "god design". Genom kursen försöker vi finna tekniska sätt, för en programmerare, att jobba och implementera "god design" i en webbplats. Vi studerar också vissa aspekter av begreppet användbarhet som påverkar användarens upplevelse av webbplatsen.

För att komma igång snabbt så använder vi en befintlig webbplats som grund till vår portfolio. Webbplatsen bygger på ett PHP-ramverk som heter [Pico](http://picocms.org/). Det är ett tunt ramverk som tillåter oss att lägga upp sidor skrivna i Markdown och hantera vår layout med hjälp utav Twig, som är en påbyggnation av HTML.

I första kursmomentet inleder vi med att installera labbmiljön, läsa lite kring teknikerna vi ska använda samt skapa en portfolio och ge den style med hjälp av CSS. I slutet av kursmomentet ska portfolion publiceras till studentservern och till Github.

Under kursens gång så kommer du att introduceras till ett par tekniker som är bra att ha för en webbprogrammerare. En av de är versionshantering med Git och Github.

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Labbmiljön  {#labbmiljo}
---------------------------------

*(ca: 2-4 studietimmar)*

Det finns en [längre beskrivning om kursens labbmiljö](./../installera-labbmiljo). Läs den om du är osäker på vad som skall göras, eller om detta är din första dbwebb-kurs.

Den korta varianten är att du behöver [installera labbmiljön](./../labbmiljo), uppdatera [dbwebb-cli](dbwebb-cli) samt klona och initiera kursrepot.

```text
# Gå till din katalog för dbwebb-kurser
dbwebb selfupdate
dbwebb clone design
cd design
dbwebb init
```

### Verktyg {#verktyg}

Som designer finns det en del verktyg som hjälper dig att planera din design i förväg. Ingen av dessa program är ett måste för kursen, men om man vill kan man installera någon av dem och testa runt så

* [Figma - The collaborative interface design tool](https://www.figma.com/) (Gratis att använda men med betalversion)
* [Adobe XD - UI/UX design and collaboration tool](https://www.adobe.com/products/xd.html) (Gratis att använda men med betalversion)
* [ColorZilla - ColorPicker for Chrome, Edge and Firefox](https://www.colorzilla.com/) (Gratis)

Och som vi brukar säga, devtools är webbutvecklarens bästa vän.

Läs & Studera  {#lasanvisningar}
---------------------------------

*(ca: 8-10 studietimmar)*



### Kurslitteratur  {#kurslitteratur}

Bläddra lite i kursboken "[The Principles of Beautiful Web Design](kunskap/boken-the-principles-of-beautiful-web-design)". Bara för att bekanta dig med den, vi börjar läsa i samband med nästa kmom, men det skadar inte att ligga ett kapitel före.

Både tredje och fjärde utgåvan av boken fungerar, materialet är uppdaterat och fjärde upplagan är något längre. Boken, i sin tredje utgåva, finns tillgänglig online via [BTHs bibliotek](http://bth.summon.serialssolutions.com/?#!/search?ho=t&l=sv-SE&q=9780992279448).



### Design med HTML5 och CSS3  {#guide}

1. Läs igenom följande sektion i guiden "[Design med HTML5 och CSS3](guide/design-med-html5-och-css3)".
    * [Grunderna](guide/design-med-html5-och-css3/grunderna)
    * [Responsivitet](guide/design-med-html5-och-css3/responsivitet)

I guiden tittar vi på hur vi kan använda CSS tillsammans med HTML för att implementera designprinciper. I sektionen [Grunderna](guide/design-med-html5-och-css3/grunderna) tittar vi på grundläggande struktur för HTML och på vilka sätt vi kan applicera styling med CSS. I [Responsivitet](guide/design-med-html5-och-css3/responsivitet) tittar vi på hur vi med hjälp av media queries kan anpassa en webbplats för både stora och små enheter.



### Markdown {#markdown}

Läs följande för att lära dig grunderna i textformatet Markdown. Markdown är ett populärt format för att låta användaren skriva text som är läsbar för ögat men ändå enkel att konvertera till HTML med en parser. I kursen kommer du att skriva dina webbsidor med Markdown.

1. Kika på vad Markdown innebär genom att läsa [John Grubers introduktion till Markdown](https://daringfireball.net/projects/markdown/basics). För att testa själv så öppnar du en [Gist](https://gist.github.com/) och skriver i Markdown, det gör att du kan testa olika konstruktioner under tiden som du läser om dem.



### Git & GitHub {#git}

I kursen introduceras Git och GitHub. Git är ett versionshanteringssystem för kod och GitHub är en webbplats där man kan ladda upp sitt Git-repo och använda extra tjänster.

1. Bekanta dig kort med [dokumentation på Gits hemsida](https://git-scm.com/doc). Där finner du referensinformation, en onlinebok om Git och ett antal korta videor som ger dig grunderna till vad Git och versionshantering handlar om.

1. Skaffa dig ett konto på [GitHub](https://github.com/). Du behöver det för att ladda upp och publicera ditt Git-repo. Det är gratis med konto och att ladda upp publika repon.

1. Ägna en stund åt att bekanta dig med webbplatser för GitHub. Du kan även kort och översiktligt kika på de guider och videor som finns för GitHub. Notera att de täcker så mycket mer än vad vi kommer jobba med i kursen så det kan räcka att du endast noterar att det existerar [guider för hur man jobbar med GitHub](https://guides.github.com/).

Förutom ovanstående finns video-spellistan "Introduktion till git":

[YOUTUBE src="LL-a3YTeL2M" list="PLKtP9l5q3ce_mjCcNeDNhVQIU_DM2P4WS" width=700 caption="Introduktion till git"]



### CSS {#css}

I detta kursmomentet jobbar vi med CSS. Läs följande.

1. I online boken "[SMACSS Scalable and Modular Architecture for CSS](http://smacss.com/book/)" läser du följande korta kapitel för inspiration av en variant till hur man kan tänka när man skriver CSS i större sammanhang.
    * Introduction
    * Categorizing CSS Rules
    * Base Rules
    * Layout Rules



Videoserie {#videoserie}
-------------------------------------------

Kursen har en videoserie för hur man kan jobba med Pico:

[YOUTUBE src="6aVDmXDXqDs" list="PLKtP9l5q3ce8h3PKihj_CSVBkyxtORWiy" width=700 caption="Pico introduktion"]



### PT-videos

Under kursens gång behandlar vi även mer mjuka delar av programvaruteknik. I denna första videon i PT-video-serien berättar Emil om olika roller och hur man kommunicerar på olika sätt.

[YOUTUBE src="QO6tQcwdO_o" width=700 caption="Roller i teams"]



Hållbarhet {#hallbarhet}
-------------------------------------------

Som en del av BTH's uppdrag har 5 perspektiv på utbildning definierats: *Hållbarhet, forskningsanknytning, samverkan, internationalisering och jämställdhet*. Perspektiven integreras i undervisningen för att belysa dessa viktiga områden.

I *design* kommer vi fokusera på perspektivet *hållbarhet* och vilken roll vi som programmerare har i den sammanhangen.

I kursmoment 04, 05 och 06 kommer vi se några praktiska exempel på hur vi som programmerare kan skapa en mer hållbar webb. För att vi har tillräcklig förståelse för vad hållbarhet innebär kommer vi under kursmoment 01-03 skapa oss en grundförståelse om hållbarhet och vad det innebär.

I följande video beskriver professor Johan Rockström jordklotets nuvarande status och hur vi påverkar det.

[YOUTUBE src="8Sl28fkrozE" width=700 caption="10 years to transform the future of humanity -- or destabilize the planet | Johan Rockström"]



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 8-10 studietimmar)*



### Övningar {#ovningar}

Följande länk är en genomstegning av Portfolio-sidan. Eget testande uppmuntras.

1. Läs igenom och testa med artikeln "[Vad är Pico?](kunskap/vad-ar-pico-v2)". Artikeln ligger till grund för att du ska förstå Pico's upplägg.

1. Jobba igenom guiden "[Kom igång med Git och GitHub](guide/git)". Denna guide introducerar dig till Git/GitHub, ett verktyg som är branchstandard för att versionshantera kod.



### Uppgifter {#uppgifter}

Följande uppgift skall utföras och redovisas.

1. Lös uppgiften "[Bygg en portfolio sida](uppgift/skapa-din-egen-portfolio)". Du skall bygga en portfolio-sida som du taggar och publicerar på GitHub. Spara allt under `me/portfolio`.

1. Försäkra dig om att du har gjort `dbwebb publish portfolio` och taggat din inlämning med version 1.0.0 (eller högre) samt pushat repot inklusive taggarna till GitHub.



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
dbwebb publish me
```

Gör Quiz på Canvas och lämna sedan in din inlämning i den nu upplåsta uppgiften. Länka till din portfölj på studentservern som en del av din inlämning.

[YOUTUBE src="bawqieKlPeg" width=700 caption="En inlämning i design"]



Testa din inlämning {#testa}
-----------------------------------------------

När du är helt klar med uppgiften så är det ett par saker som du kan kolla för att testa din inlämning. Detta testar inte allt, men det är ett minimum av ett flöde som skall fungera.

* Kolla uppdaterad startsida
* Uppdaterad logga
* Kolla Github-länk i footer (profil eller repo, båda ok)
* Eget tema under portfolio/theme
* github.txt i me/portfolio
* Github
    * Kolla commits och taggar



### dbwebb test {#dbwebb-test}

Kommandot `dbwebb test` kommer användas som utgångspunkt för rättningen. Du kan göra följande om du vill testa på liknande sätt som de som rättar:

```shell
# stå i roten av kursrepot (dbwebb-kurser/design)
dbwebb update
npm install
dbwebb test kmom01
```
