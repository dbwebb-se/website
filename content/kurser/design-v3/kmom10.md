---
author:
    - nik
    - efo
revision:
    "2021-11-25": "(C, efo) Tog bort redovisningssida"
    "2020-12-10": "(B, efo, nik) Färdigställd projekt"
    "2020-10-15": "(A, nik) Nysläpp för design-v3"
...
Kmom10: Projekt och examination
====================================

[INFO]
**Publicering till studentservern**

När ni publicerar till studentservern, kom ihåg att ni behöver uppdatera både eran akronym men även sökvägen i `.htaccess` på rad 12 och 15. Den som ni har ifrån tidigare pekar på er portfolio-mapp, men ska istället peka på den mapp ni jobbar med i projektet.

[/INFO]

Detta kursmoment avslutar och examinerar kursen.

Upplägget är enligt följande:

* Projektet och redovisning (20-80h)

Totalt omfattar kursmomentet (07/10) ca 20+20+20+20 studietimmar.



Bedömning och betygsättning {#bedomning}
--------------------------------------------------------------------

När du lämnat in projektet bedöms det tillsammans med dina tidigare redovisade kursmoment och du får ett slutbetyg på kursen. Läs om [grunderna för bedömning och betygsättning](kurser/faq/bedomning-och-betygsattning-quiz).

För att få högsta betyg på kursen krävs det att du samlar poäng från samtliga optionella krav i denna kravspec.



Projektidé och upplägg {#upplagg}
--------------------------------------------------------------------

Du har blivit känd som en webbprogrammerare med känsla för design och kunderna står nu i kö. Du har ett antal uppdrag som dina kunder vill ha utförda och du har begränsad tid.

Välj bland de uppdrag du har föreslagna nedan. De som är märkta optionella kan du välja om du vill göra, de andra är obligatoriska.

Utveckla och leverera enligt specifikation. Om information saknas så kan du själv tolka kravet, dokumentera hur du gör i redovisningstexten.

Fråga i Discord om du känner dig osäker.

Projektet skall du _inte_ lägga i ett Git-repo. Om du väljer att göra det så rekommenderas att du lägger det som ett _privat repo_ på GitHub eller motsvarande tjänst. Det är för att undvika att hamna i en diskussion om misstänkt fusk om någon illvilligt kopierar ditt projekt via ditt repo.



Uppdrag webbplats och tema {#webbplats}
--------------------------------------------------------------------

Följande uppdrag rör utveckling av webbplatser och teman och de skall göras individuellt.



### Kunder {#kund}

Du har tre potentiella kunder, du väljer att utveckla en webbplats, med tillhörande teman, till **en av dessa kunder**.

[INFO]
Du kan byta namnet på din kund, förutsatt att det är tydligt vilken kund du valt (både på hemsidan och i din projekttext på Canvas) och att det inte är en publik person.
[/INFO]



#### Kund 1 {#kund1}

**Styrelseordförande Ludviga Af Solstråle** med kompanjoner, vill ha ett propert tema till deras *executive consulting high-end business company*. Det skall vara propert, gediget, andas slipsar, dyra kostymer, höga klackar och dyra klänningar. Du är inte 100% säker på vad de säljer, men dyrt verkar det vara, annars skulle de inte ha råd med sina dyra kostymer och klänningar.

Du kan själv välja om du vill att företagets verksamhet skall vara advokater/jurister, managementkonsulter, eller något annat som liknar företag, föreningar eller organisationer.



#### Kund 2 {#kund2}

**Artisten Art Ist**, som är *new and upcoming* inom sitt gebit, vill ha en webbplats och du löser det. Det skall vara nytt och fräscht, tidsenligt och det skall skapa intresse.

Du kan själv välja om du vill att artisten skall vara ung/gammal, hålla på med trolleri eller musik och om det är fiol, harpa eller techno. Artist-begreppet är brett.



#### Kund 3 {#kund3}

**Egenföretagaren Bew Gorp**, har startat upp en egen verksamhet där hen hyr ut sig själv som webbprogrammerare/webbutvecklare/webbdesigner. Bew behöver en webbplats för att marknadsföra sig själv och sina utomordentliga färdigheter inom området.

Du kan själv välja profil och inriktning på webbplatsen, men gör medvetna val som gynnar Bew's profil. Här kan du välja att göra grunden till din egen CV-webbplats.



#### Exempel {#exempel}

Nedan är några exempel gjorda i Figma av en av våra alumni, Matilda.

<div style="display: flex; justify-content: space-around;" markdown="1">
[FIGURE src=image/design-v3/projekt/design_law.png?height=10% caption="Exempel på kund 1"]
[FIGURE src=image/design-v3/projekt/design_music.png?height=10% caption="Exempel på kund 2"]
[FIGURE src=image/design-v3/projekt/design_egenforetagare.png?height=10% caption="Exempel på kund 3"]
</div>



### Uppdrag 1: Webbplats (10p) {#k3}

[INFO]
**Vilka bilder får användas?**

Projektet har samma krav som kmom05, dvs att samtliga bilder ska du ha rätt att använda. Använd t.ex. bildtjänsterna som föreslås [här](kurser/design-v3/kmom05#var-letar-man) eller dina egna bilder.
[/INFO]

Skapa en ny webbplats till din kund i katalogen `me/kmom10` i kursrepot.

Du kan välja mellan att använda din me/portfolio som grund eller börja ifrån grunden med en helt ny installation från example/portfolio. Välj väg och glöm inte redigera filen `.htaccess`.

Beskriv i redovisningstexten hur du gör och varför du valde det sättet.

Webbplatsen skall bestå utav **minst** tre sidor, en förstasida, en about-sida och en highlight-sida, som presenterar projekt som kunden jobbar/har jobbat med.

Webbplatsen ska använda sig av en flash-bild eller hero-bild, välj själv om sidan använder samma, byter eller döljer beroende på sida.

Webbplatsen skall ha en egen logga och en favicon.

Footern skall innehålla rimlig standardinformation.

Webbplatsen skall ha en navigering som fungerar för både desktop och mobil.

Innehållet skall vara relevant, lagom mycket och bildrikt. Använd Cimage för att få rätt storlek på bilderna. Skriv text som gynnar företagets profil, kopiera gärna, men använd inte Lorem Ipsum.

I about-sidan lägger du in information om kunden, så som du tolkat kundens önskemål, kundens verksamhet och hur kunden vill att webbplatsen skall se ut och användas. Det blir din egen formulering och tolkning av kundens krav (ca 150+ ord).

Highlight-sidan ska innehålla minst 5 tidigare projekt/kunder/annan relevant aktivitet.


### Uppdrag 2: Tema (10p) {#tema}

Skapa ett tema till webbplatsen. Du kan använda dina egna teman som grund. Temat skall vara anpassat till kunden.

Temat skall använda SASS. Dela upp koden i flera moduler, så det är lätt att uppdatera sidan om det skulle behövas.

Sidan ska gå igenom validering genom kommandot `npm run lint`.

Gör medvetna och rimliga val för färgpalett och typografi så att det matchar kundens profil.

Temat skall använda sig utav variabler för att bestämma färger.

Du skall medvetet använda designelement och designprinciper för att uppnå en god design som passar kunden.

På about-sidan skall det finnas en länk till en dold sida (Tips, använd `hidden: true` i meta för att dölja den ifrån navigeringen) som innehåller (ca 250+ ord):

* Dokumentera färgpaletten och berätta hur du valde färgerna.
* Beskriv typografin, designprinciper och designelement som du använt.
* Berätta vilken känsla som kunden vill uppnå med webbplatsen.
* Beskriv hur du valt att dela upp din SASS-kod.



### Uppdrag 3: Responsivitet och tillgänglighet (10p) {#k3}

Kunden vill givetvis att sidan skall fungera bra för alla grupper av intressenter och betonar därför att sidan skall se bra ut på en mobil och att sidan ska ha bra tillgänglighet (accessibility).

Berätta i din redovisningstext hur du har åstadkommit två nedanstående krav och vilka delar du har valt att fokusera på inom responsivitet och tillgänglighet.



#### Responsivitet {#responsivitet}

Sidan skall använda CSS-grid och/eller flexbox för att presentera innehållet på ett främjande sätt.

Sidan skall fungera väl på mobila enheter, dvs inga horisontella scrollbars.

Bilder ska anpassas efter enhet med hjälp utav cimage och `<picture>`/`srcset` (gäller inte `.svg`).



#### Tillgänglighet {#tillganglighet}

Samtliga sidor på sidan skall ha 100 i "accessibility" enligt Lighthouse (via devtools).

Färgvalet på sidan ska ta färgblindhet i åtanke, ni kan använda [Toptal - Colorblind Web Page Filter](https://www.toptal.com/designers/colorfilter/) för att testa er publicerade sida.



### Uppdrag 4: Tema alternativt (10p) (optionellt) {#tema-alt}

Du gör ytterligare ett tema till kunden, ett alternativt tema.

I detta tema förändrar du markant färgpaletten, typografin, designprinciper och designelement.

<!-- Mörkt tema? -->

Även detta tema skall vara anpassat till kundens profil.

<!-- Du använder också, till viss del, en annan layout än i tidigare tema, se till att de båda teman mixar regioner mellan 100% i bredd och en fast min-width. -->

Beskriv detta tema i ett nytt stycke med en tydlig rubrik i den dolda sidan ifrån krav 2. Implementera lösningen vi använde för det mörka temat i kmom04 för att tillåta ett byte mellan temana.



Uppdrag analys {#analys}
--------------------------------------------------------------------

Följande uppdrag rör analyser och de kan göras i grupp, enligt samma villkor som tidigare i kursen. Analyserna lägger du tillsammans med dina andra analyser i din portfolio-sida. Utför analyserna enligt samma mall och struktur som du gjort tidigare i kursen.



### Uppdrag 5: Analys aktuell webbplatsdesign (10p)  (optionellt) {#k5}

**Företaget Sök Under** har bett dig att göra en analys av aktuell webbplatsdesign. Vilka är de trender och som är aktuella för tillfället?

Du har här full frihet att göra ditt urval så du kan välja att undersöka webbplatsdesign för till exempel hockeyklubbar, försäkringsbolag, artister eller kommuner.

Välj en kategori och välj därefter 3-5 webbplatser som du väljer att undersöka ur aspekten webbplatsdesign och aktuella trender.

Du väljer själv hur du vill tolka "webbplatsdesign och aktuella trender", men skriv tydligt vilka aspekter du väljer att undersöka.

Lägg resultatet i din portfolio-sida under `content/analysis/10_webbplatsdesign.md`.



### Uppdrag 6: Analys valfri (10p) (optionellt) {#k6}

**Organisationen Valfrihet** har kontaktat dig och bett dig göra en analys inom design och webbplatser. De vill att du gör en analys av den webbplats du har skapat ovan under uppdragen [Uppdrag webbplats och tema](#webbplats).

Du ska göra analysen utifrån **1** av de analysteman vi har haft i kursmoment 4-6 tidigare i kursen: _Färg (kmom04)_, _bilder och laddningstider (kmom05)_ eller _design element och principer (kmom06)_. Se respektive kursmoment för mall och instruktioner.

Lägg resultatet i din portfolio-sida under `content/analysis/11_design-och-webbplatser.md`.



Redovisning {#redovisning}
--------------------------------------------------------------------

Gör din inlämning på Canvas och skriv nedanstående stycken där som en del av inlämningen:

1. För varje krav du implementerat, dvs 1-6, skriver du ett textstycke om ca 5-10 meningar där du beskriver vad du gjort och hur du tänkt. Inled varje stycke med en rubrik med krav 1-6. Poängsättningen tar sin start i din text så se till att skriva väl för att undvika poängavdrag. Missar du att skriva/dokumentera din lösning så blir det 0 poäng. Du kan inte komplettera en inlämning för att få högre betyg.

1. Skriv ett allmänt stycke om hur projektet gick att genomföra. Problem/lösningar/strul/enkelt/svårt/snabbt/lång tid, etc. Var projektet lätt eller svårt? Tog det lång tid? Vad var svårt och vad gick lätt? Var det ett bra och rimligt projekt för denna kursen?

1. Avsluta med ett sista stycke med dina tankar om kursen och vad du anser om materialet och handledningen (ca 5-10 meningar). Ge feedback till lärarna och förslå eventuella förbättringsförslag till kommande kurstillfällen. Är du nöjd/missnöjd? Kommer du att rekommendera kursen till dina vänner/kollegor? På en skala 1-10, vilket betyg ger du kursen?

<!-- 1. Tagga din me/portfolio i v10.0.0 och publicera på GitHub.

1. Ta en kopia av texten på din redovisningssida och kopiera in den på läroplattformen i redovisningen. Glöm inte länka till din portfolio-sida och projektet. -->

1. Publicera på studentservern.

```bash
# Ställ dig i kurskatalogen
dbwebb publishpure me
```



### Presentation {#presentation}

<!-- **Distansstudenter:**  -->

Spela in en redovisningsvideo och lägg länken till videon i en kommentar på din inlämning i Canvas. En lagom längd på videon är 4-8 minuter, prata gärna om hur du har tänkt med din design under arbetet med projektet. Läs mer om hur du kan [spela in en redovisningsvideo](kurser/faq/slutpresentation).

<!--
**Campusstudenter:** Presenterar i sal på campus under examinationsveckan i LP2. Information kommer publiceras i Canvas om detta tillfället. En lagom längd på presentationen är 4-8 minuter, prata gärna om hur du har tänkt med din design under arbetet med projektet. -->
