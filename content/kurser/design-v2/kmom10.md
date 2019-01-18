---
author: mos
views:
    flash:
        region: flash
        template: default/image
        data:
            src: "image/snapht16/design-van-gogh.jpg?w=1100&h=360&cf&s=10&s=8&smooth&sharpen&f3=mean_removal&emboss&convolve=lighten:emboss-alt:motion"
revision:
    "2018-12-12": (C, mos) Genomgången inför design v2.
    "2018-06-08": (B1, mos) Nytt dokument inför uppdatering av kursen.
    "2016-12-13": (B, mos) Använd cimage med snygga länkar via htaccess.
    "2016-12-12": (A, mos) Första utgåvan.
...
Kmom10: Projekt och examination
====================================

Detta kursmoment avslutar och examinerar kursen.

Upplägget är enligt följande:

* Projektet och redovisning (20-80h)

Totalt omfattar kursmomentet (07/10) ca 20+20+20+20 studietimmar.

<!--
Beskriv mer på Om-sidan eller egentligen i en egen rapport på redovisa sidan, om site/tema, om alt tema och om kodstruktur. Dela i olika rapporter.

Fundera över bloggens vara i projketet.

Kanske passar nåt om produktsidor i projektet, eller inte.
-->


Bedömning och betygsättning {#bedomning}
--------------------------------------------------------------------

När du lämnat in projektet bedöms det tillsammans med dina tidigare redovisade kursmoment och du får ett slutbetyg på kursen. Läs om [grunderna för bedömning och betygsättning](kurser/bedomning-och-betygsattning).



Projektidé och upplägg {#upplagg}
--------------------------------------------------------------------

Du har blivit känd som en webbprogrammerare med känsla för design och kunderna står nu i kö. Du har ett antal uppdrag som dina kunder vill ha utförda och du har begränsad tid.

Välj bland de uppdrag du har föreslagna nedan. De som är märkta optionella kan du välja om du vill göra, de andra är obligatoriska.

Utveckla och leverera enligt specifikation. Om information saknas så kan du själv tolka kravet, dokumentera hur du gör i redovisningstexten.

Fråga i forumet om du känner dig osäker.

Projektet skall du _inte_ lägga i ett Git-repo. Om du väljer att göra det så rekommenderas att du lägger det som ett _privat repo_ på GitHub eller motsvarande tjänst. Det är för att undvika att hamna i en diskussion om misstänkt fusk om någon illvilligt kopierar ditt projekt via ditt repo.



Uppdrag analys {#analys}
--------------------------------------------------------------------

Följande uppdrag rör analyser och de kan göras i grupp, enligt samma villkor som tidigare i kursen.

Analyserna lägger du tillsammans med dina andra analyser på me-sidan.

Utför analyserna enligt samma mall och struktur som du gjort tidigare i kursen.



### Uppdrag 1: Analys aktuell webbplatsdesign (10p) {#k1}

**Företaget Sök Under** har bett dig att göra en analys av aktuell webbplatsdesign. Vilka är de trender och som är aktuella för tillfället?

Du har här full frihet att göra ditt urval så du kan välja att undersöka webbplatsdesign för hockeyklubbar, försäkringsbolag, artister eller kommuner.

Välj en kategori och välj därefter 3-5 webbplatser som du väljer att undersöka ur aspekten webbplatsdesign och aktuella trender.

Du väljer själv hur du vill tolka "webbplatsdesign och aktuella trender", men skriv tydligt vilka aspekter du väljer att undersöka.

Lägg resultatet i `content/rapport/09_webbplatsdesign.md`.



### Uppdrag 2: Analys valfri (10p) (optionellt) {#k2}

**Organisationen Valfrihet** har kontaktat dig och bett dig göra en analys inom design och webbplatser. Du tycker att det låter som en väldigt öppen fråga och du väljer därför att tolka "design och webbplatser" precis på det sättet du själv väljer.

Du kan allstå fritt välja vad din undersökning handlar om. Gör att undersökningen handlar om något inom ramen för det som hanterats i kursen. Gör det tydligt i rapporten om vad du undersöker och hur du går tillväga.

Lägg resultatet i `content/rapport/10_design-och-webbplatser.md`.



Uppdrag webbplats och tema {#webbplats}
--------------------------------------------------------------------

Följande uppdrag rör utveckling av webbplatser och teman och de skall göras individuellt.



### Kunder {#kund}

Du har tre potentiella kunder, du väljer att utveckla en webbplats, med tillhörande teman, till **en av dessa kunder**.



#### Kund 1 {#kund1}

**Styrelseordförande Ludviga Af Solstråle** med kompanjoner, vill ha ett propert tema till deras *executive consulting high-end business company*. Det skall vara propert, gediget, andas slipsar, dyra kostymer, höga klackar och dyra klänningar. Du är inte 100% säker på vad de säljer, men dyrt verkar det vara, annars skulle de inte ha råd med sina dyra kostymer och klänningar.

Du kan själv välja om du vill att företagets verksamhet skall vara advokater/jurister, managementkonsulter, eller något annat som liknar företag, föreningar eller organisationer.



#### Kund 2 {#kund2}

**Artisten Art Ist**, som är *new and upcoming* inom sitt gebit, vill ha en webbplats och du löser det. Det skall vara nytt och fräsht, tidsenligt och det skall skapa intresse.

Du kan själv välja om du vill att artisten skall vara ung/gammal, hålla på med trolleri eller musik och om det är fiol, harpa eller techno. Artist-begreppet är brett.



#### Kund 3 {#kund3}

**Egenföretagaren Bew Gorp**, har startat upp en egen verksamhet där hen hyr ut sig själv som webbprogrammerare/webbutvecklare/webbdesigner. Bew behöver en webbplats för att marknadsföra sig själv och sina utomordentliga färdigheter inom området.

Du kan själv välja profil och inriktning på webbplatsen, men gör medvetna val som gynnar Bew's profil. Här kan du välja att göra grunden till din egen CV-webbplats.



### Uppdrag 3: Webbplats (10p) {#k3}

Skapa en ny webbplats till din kund, spara i en helt ny katalog `me/proj` i kursrepot.

Använd din me/redovisa som grund. Du kan också välja en helt ny installation från example/redovisa och example/theme. Välj väg.

Beskriv i redovisningstexten hur du gör och varför du valde det sättet.

Webbplatsen skall bestå av en förstasida (minst två kolumner), en about-sida och en blogg med minst tre blogginlägg.

Varje sida skall ha en flash-region med en bild.

Headern skall ha en egen logo och en favicon.

Footern skall innehålla rimlig standardinformation och du skall ha de tre footerkolumnerna.

Menyn skall länka till about och bloggen.

Innehållet skall vara relevant, lagom mycket och bildrikt. Använd Cimage för att få rätt storlek på bilderna.. Skriv text som gynnar företagets profil, kopiera gärna, men använd inte Lorem Ipsum.

Webbplatsen skall vara responsiv.

I about-sidan lägger du in information om kunden, så som du tolkat kundens önskemål, kundens verksamhet och hur kunden vill att webbplatsen skall se ut och användas. Det blir din egen formulering och tolkning av kundens krav.



### Uppdrag 4: Tema (10p) {#tema}

Skapa ett tema till webbplatsen. Du kan använda dina egna teman som grund.

Temat skall vara anpassat till kunden. Gör detta temat till standardtema i temaväljaren.

Temat skall använda gridbaserat layout, vertikalt som horisontellt.

Testsidor för gridet skall fungera via `?vgrid` och `?hgrid`.

Temat skall fungera responsivt.

På about-sidan förklarar du ditt tema.

* Dokumentera färgpaletten och berätta hur du valde färgerna.
* Beskriv typografin, designprinciper och designelement som du använt.
* Bifoga en snapshot på temat.



### Uppdrag 5: Tema alternativt (10p) (optionellt) {#tema}

Du gör ytterligare ett tema till kunden, ett alternativt tema.

I detta tema förändrar du markant färgppaletten, typografin, designprinciper och designelement.

Du använder också, till viss del, en annan layout än i tidigare tema, se till att de båda teman mixar regioner mellan 100% i bredd och en fast min-width. 

Beskriv detta tema i din about-sida, gör ett nytt stycke med ny tydlig rubrik. Länka också till temaväljaren så man kan skifta till ditt alternativa tema.



### Uppdrag 6: Förklara strukturen kring temat (10p) (optionellt) {#k6}

I din about-sida gör du ett nytt stycke och förklarar strukturen bakom ditt tema.

1. Förklara struktur av LESS-koden. Berätta hur du valt att strukturera koden och förklara varför det är en god uppdelning.

1. Berätta vilka moduler du använder och förklara kort vad de gör.

1. Du kan lägga till extra relevant information där du beskriver och eventuellt argumenterar kring LESS som teknik, de LESS-moduler vi valt att använda, alternativa LESS-moduler du finner intressant och kring grundstrukturen i uppdelning av filer som vi använder samt även hur vi bygger vårt tema.

Texten bör omfattningsvis vara i storleksordningen likt de analys-rapporter du gjort i kursen.



Redovisning {#redovisning}
--------------------------------------------------------------------

1. På din redovisningssida, skriv följande:

    1.1 För varje krav du implementerat, dvs 1-6, skriver du ett textstycke om ca 5-10 meningar där du beskriver vad du gjort och hur du tänkt. Poängsättningen tar sin start i din text så se till att skriva väl för att undvika poängavdrag. Missar du att skriva/dokumentera din lösning så blir det 0 poäng. Du kan inte komplettera en inlämning för att få högre betyg.

    1.2 Skriv ett allmänt stycke om hur projektet gick att genomföra. Problem/lösningar/strul/enkelt/svårt/snabbt/lång tid, etc. Var projektet lätt eller svårt? Tog det lång tid? Vad var svårt och vad gick lätt? Var det ett bra och rimligt projekt för denna kursen?

    1.3 Avsluta med ett sista stycke med dina tankar om kursen och vad du anser om materialet och handledningen (ca 5-10 meningar). Ge feedback till lärarna och förslå eventuella förbättringsförslag till kommande kurstillfällen. Är du nöjd/missnöjd? Kommer du att rekommendera kursen till dina vänner/kollegor? På en skala 1-10, vilket betyg ger du kursen?

1. Tagga din me/redovisa i v10.0.0 och publicera på GitHub.

1. Ta en kopia av texten på din redovisningssida och kopiera in den på läroplattformen i redovisningen. Glöm inte länka till din me-sida och projektet. 

1. Publicera på studentservern.

```bash
# Ställ dig i kurskatalogen
dbwebb publishpure me
```
