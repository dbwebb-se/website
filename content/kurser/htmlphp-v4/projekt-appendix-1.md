---
author: mos
revision:
    "2018-10-12": (B, mos) Flyttade tips från coachen till eget dokument.
    "2015-10-11": (A, mos) Första omarbetade versionen till htmlphp v2.
...
Kmom10: Appendix 1 Projekt BMO 
==================================

Projektet heter Begravningsmuseum Online (BMO). Projektet innebär att du skall utveckla och leverera en webbplats till en kund. Du får tillgång till en databas som innehåller material samt bilder och du skall bygga en webbplats enligt en föreslagen struktur.

Du kommer få läsa mer om kunden, Ronny Holm, för att förstå vad han vill ha ut av webbplatsen. 

<!--more-->



Översikt {#oversikt}
--------------------------------------------------------------------

Rent allmänt gäller följande.

Det finns en projektspecifikation som beskriver vad du skall göra och vad din leverans skall innnehålla. 

Det finns tankar om webbplatsens style och layout. 

Det finns innehåll som du skall använda i din webbplats. Innehållet består av bilder, artiklar och objekt. Allt innehåll är förpackat i kursrepot i en exempelmapp i kursrepot.

Utmaningen är att bygga en webbplats med innehåll och funktioner som specificerats samt att göra en styling som matchar webbplatsens profil. Använd det du hittills lärt dig i kursen så kommer det att gå utmärkt.

**Lycka till och kämpa väl!**



Kund: Ronny Holm {#kund}
--------------------------------------------------------------------

Ronny Holm är vår kund, låt oss säga hej till Ronny och se vad han sysslar med.

Vi börjar med en bakgrundssökning på Ronny Holm, bara för att vi kan göra det. 
Nu i dessa tider då "Google profilen" blir en allt mer viktig del i ens bakgrund. Nåja, vad finner vi?



#### Ronny Holm vid SKKF {#skkf}

[FIGURE src="img/bmo/ronny_holm_200.jpg" caption="Ronny Holm, vår kund" class="right"]

Ronny Holm jobbar som [organisationschef på SKKF](http://www.skkf.se/node/129), 
Sveriges Kyrkogårds- och Krematorieförbund. SKKF är Branschförbundet för 
begravningsverksamhet i Sverige.

Följande finns att läsa [om SKKF och deras verksamhet och inriktning](http://www.skkf.se/node/119).

> *1983 fick Sveriges kyrkogårds- och krematorieförbund, SKKF, sitt nuvarande namn. Dessförinnan var namnet Svenska Eldbegängelseföreningen vars historia börjar redan 1882. Utvecklingen av förbundet som en bred, politiskt och konfessionellt obunden branschorganisation står i centrum då förbundet nu utvecklas vidare.*

> *Förbundet arbetar med begravningsfrågor i stort, såväl jordbegravning som kremation. Detta ligger i ansvaret att vara ett modernt branschförbund. Utbildning och rådgivning är viktiga frågor för förbundet.*

> *SKKF främjar med sin uttalade position som en politisk och religiöst obunden organisation en god begravningsverksamhet och en positiv utveckling av olika gravskick från olika etiska, etniska, religiösa, ekologiska och ekonomiska utgångspunkter.*


### Ronny Holm och utbildning {#utbildning}

Vid SKKF är utbildning en viktig fråga. Ta en titt i [årets utbildningskatalog](http://www.skkf.se/utbildning) för att få en insyn i vad ett förbund likt SKKF arbetar med.

Jag tittar i katalogen och räknar till ett större antal  standardkurser som spänner över områden som ledarskap, juridik, kundservice, växter och gräs samt kurser om Gravvårdens Symboler, Kyrkogårdskultur och Den mångkulturella kyrkogården.

Kurser om Gravvårdens Symboler och Kyrkogårdskulter: Att Vårda Ett Kulturarv, är två av de kurser som Ronny Holm håller i. En vidare titt på Ronny's historia visar att det inte är en tillfällighet att han undervisar på just dessa kurser.



### Ronny Holm och Begravningsmuseet i Ljungby {#museum}

I början av 1970-talet började Ronny Holm, att samla de första sakerna, som nu finns i Begravningsmuseet i Ljungby. Det var ting som funnits i kyrkor, på kyrkogården, från privatpersoner m fl. Under årens lopp har Ronny Holm handlat i second handbutiker, varit på loppmarknader och besökt auktioner.

Vid denna tiden var Ronny chef för kyrkogårdsförvalitningen i Ljungby. I samband med en kyrkogårdsvandring arrangerades en utställning med föremål från Ronny Holms samling. Flera av deltagarna vid rundvandringen tyckte att utställningen var så värdefull att den borde permanentas. I samband med Alla Helgons Dag, 2004, invigdes så Sveriges första begravningsmuseum som bland annat innehåll material från Ronny Holms privata samling.

Redan efter ett par veckor hade man haft över 2000 besökare och intresset var mycket stort från både allmänhet, grupper av alla de slag och inte minst massmedia. Museet visar seder och bruk vid död och begravning under 1800 och 1900-talen. Här visas hela förloppet vid ett dödsfall, från tillkännagivandet via klockringning till gravsättningen och gravölet. Många av föremålen är skänkta eller utlånade av privatpersoner, institutioner etc.

Det finns att lära på om Ronny Holm och Begravningsmuseet i Ljungby, här finns en artikel att läsa.

* [Döden byter form (Svd)](http://www.svd.se/kulturnoje/nyheter/doden-byter-form_412397.svd)

<!--
* [Döden går på museum (Sydsvenskan)](http://www.sydsvenskan.se/sverige/article96211/Doden-gar-pa-museum.html)
-->



### Ett Begravningsmuseum Online {#online}

En sommar för några år sedan, träffade jag Ronny över en kopp kaffe och lite kladdkaka. Jag föreslog att utveckla en webbplats för att göra en webb-baserad utställning av Ronnys samling, ett begravningsmuseum online. Tanken var att spara ett kulturarv för framtida generationer, för den goda sakens skull. Här är webben ett utmärkt redskap och jag berättade för Ronny att jag kände ett stort antal duktiga webbutvecklare.

Ronny Holm såg klurig ut, fundera lite och sammanfattade sina funderingar med:

> *Kan man det?*

Klart man kan, frågan är bara hur bra man kan göra det. Det återstår att se.



Innehåll till BMO {#innehall}
--------------------------------------------------------------------

Det finns fördefinerat innehåll som skall finnas på BMO. Innehållet består av följande delar.

* Om-sida med text om webbplatsen
* Artiklar
* Objekt
* Bilder

Allt innehåll är samlat i kursrepots exempel-katalog i `example/bmo`. Du kan kopiera allt innehåll från den katalogen.

I katalogen finns följande.

| Fil/katalog        | Beskrivning |
|--------------------|-------------|
| `img/full-size`    | Orginalbilder till objekten. |
| `img/[80,250,550]` | Objekt-bilder skalade till upplösningar max bredd/höjd 80px, 250px och 550px. |
| `img/[80x80,250x250,550x550]` | Objekt-bilder skalade till upplösningar max bredd/höjd 80x80px, 250x250px och 550x550px. |
| `img/maggy`        | Bilder till Maggys artikel om Begravningsseder och Bruk. |
| `db/bmo.sqlite`    | Databasfil som innehåller artiklar (inklusive text till om-sidan) och objekt. |
| `db/bmo2.sqlite`   | Uppdaterad databasfil med rätt sökvägar till bilder. |
| `db/bildtexter.md` | Extra information om bildtexter till bilder. |



BMO Style och Layout {#style}
--------------------------------------------------------------------

Styla webbplatsen och ge den en style och profil som du anser stämmer överens med webbplatsens syfte. Kunden vill att du gör en personlig style, du har fria händer, gör den mörk eller ljus, glad eller sorgsen, traditionell eller provocerande. Ingen style är fel, men, komponera färg, form, typsnitt, texturer och bilder för att forma ett helhetsintryck som avspeglar webbplatsens syfte och tanke.

Vi (Ronny och jag) pratade en del om layouten på Begravningsmuseum Online. Vi bestämde att var och en gör sin personliga layout. Personlig såsom: En vågad stylesheet efter ditt eget tycke och smak. Utmanande, stilig eller urflippad. Du väljer själv.

VI vill gärna se hur var och en väljer att symbolisera och representera konceptet Begravningsmuseum Online (BMO).

Alla har vi ett förhållande till döden. Vi drabbas när det händer nära och kära. Ofta smärtsamt, jobbigt, ibland en befrielse, men nästan alltid känslosamt. Vi har alla våra egna privata förhållande till döden och vad det innebär.

Vi har också ett professionellt förhållande till vårt framtida yrke som webbprogrammerare och detta uppdrag som innebär att bygga webbplatsen för BMO.
I uppdraget måste vi altid skapa oss en bild av hur kunden vill representera BMO. Oavsett uppdragets innehåll. Det kallas att vara professionell.

Vi bör också skapa oss en bild av vad gemene man har för uppfattning och förväntar sig för style på en sådan här webbplats.

Dessutom har nu kunden bett oss om vår egen privata syn på stylen. Det innebär att vi har fria händer. Vi kan göra som vi vill så länge vi kan stå för -- och vara stolta över -- resultatet.

Så, gör en personlig style på Begravningsmuseum Online. Det är kundens önskemål. Den kan vara utmanande, stilig eller urflippad. Den kan representera sorg, frihet, saklighet, kulturell eller andra känslor. Den kan vara vit, blå, svart, röd eller grön, välj själv. Gör efter bästa förmåga.

Det handlar om att vårda ett kulturarv genom att skapa intresse. För att skapa intresse måste man ibland sticka ut näsan och riskera att bli bränd. Ta en risk. Gör det.
