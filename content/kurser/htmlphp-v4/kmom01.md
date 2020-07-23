---
views:
    flash:
        region: flash
        template: default/image
        data:
            src: "image/kunskap/kokbok-databasmodellering/image00.jpg?w=1100&h=300&cf&a=20,0,0,0&f=grayscale"
author:
    - mos
revision:
    "2018-08-20": "(H, mos) Uppdaterat htmlphp v3 ht2018."
    "2017-09-01": (G, mos) Video till installation av dbwebb-cli.
    "2017-06-15": (F, mos) Ny struktur labbmiljö.
    "2016-08-31": (E, mos) Lade till rätt videoserie från youtube.
    "2016-02-22": (D, mos) Bort med not om kursutveckling och länk till version 1.
    "2015-08-27": (C, mos) Lade till länkar till introduktion om HTML och CSS.
    "2015-08-17": (B, mos) Länk till forumet om statisk kodvalidering.
    "2015-08-06": (A, mos) Första utgåvan för htmlphp version 2 av kursen.
...
Kmom01: Bygg en webbplats
==================================

Vi skall bygga en webbplats med HTML, CSS och PHP. Vi kallar denna webbplats för din me-sida och den kommer följa dig genom hela kursen. Vi börjar med en enkel struktur för webbplatsen, strukturen förbättrar vi kontinuerligt genom kursen.

Kursmomentet visar hur du kommer igång med labbmiljön, dels via en installation på din egen dator och dels genom att publicera resultatet på driftsservern. Du kommer att utveckla din kod lokalt och därefter kopiera över resultatet till en driftsserver.

Du kommer att jobba igenom material och övningar för att träna dig i HTML, CSS och PHP. Lärdomarna använder du för att bygga din egna me-sida. Me-sidan är en enkel webbplats som innehåller en presentation av dig själv tillsammans med redovisningstexter från kursmomenten.

<!--more-->

Vi bygger webbplatsen tillsammans, steg för steg. Vi försöker bygga en struktur som går att återanvända för att bygga fler och större webbplatser.

[FIGURE src=/image/snapvt15/me-done.png?w=w3 caption="En me-sida som den kan se ut när den är klar."]

När vi är klara med detta kursmoment så har du förhoppningsvis fått insyn i det som kursen handlar om. Tanken med kursmoentet är att du skall bekanta dig med de grundtekniker (HTML, CSS, PHP) som kursen omfattar och få möjlighet att se hur de samverkar. I kommande kursmoment tittar vi mer ingående på respektive teknik.

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Labbmiljön  {#labbmiljo}
---------------------------------

*(ca: 2-4 studietimmar)*

Det finns en [längre beskrivning om kursens labbmiljö](./../installera-labbmiljo). Läs den om du är osäker på vad som skall göras, eller om detta är din första dbwebb-kurs.

Den korta varianten är att du behöver [installera labbmiljön](./../labbmiljo), uppdatera [dbwebb-cli](dbwebb-cli) samt klona och initiera kursrepot.

```text
# Gå till din katalog för dbwebb-kurser
dbwebb selfupdate
dbwebb clone htmlphp
cd htmlphp
dbwebb init
```



Läs & Studera  {#lasanvisningar}
---------------------------------

*(ca: 4-8 studietimmar)*


### HTML & CSS {#htmlcss}

Läs följande för att bekanta dig med teknikerna.

1. Läs igenom följande sektion i guiden "[Kom igång med HTML och CSS](guide/kom-igang-med-html-och-css)".
    * [Grunderna](guide/kom-igang-med-html-och-css/grunderna)

1. Webbplatsen MDN innehåller referensdokumentation för HTML och CSS. Bekanta dig med MDN genom att kort och översiktligt kika på följande sidor, bara så du vet vilken information som finns där.
    * [Learn web development](https://developer.mozilla.org/en-US/docs/Learn)
    * [HTML: HyperText Markup Language](https://developer.mozilla.org/en-US/docs/Web/HTML)
    * [HTML reference](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference)
    * [CSS: Cascading Style Sheets](https://developer.mozilla.org/en-US/docs/Web/CSS)
    * [CSS reference](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference)



### PHP {#php}

Läs följande för att bekanta dig med tekniken.

1. Bekanta dig kort med [webbplatsen för PHP](http://php.net/), bara så att du har varit där och ser hur den ser ut. Det som vi framförallt kommer att använda framöver är [manualen för PHP](http://php.net/manual/en/). Kika snabbt igenom dess innehållsförteckning så att du ser vad det handlar om. Du behöver inte studera något i detalj för tillfället.

1. Läs igenom följande sektion i guiden "[Kom igång med programmering i PHP](guide/kom-igang-med-programmering-i-php)".
    * [Grunder och struktur](guide/kom-igang-med-programmering-i-php/grunder-och-struktur)

1. I kursboken [Webbutveckling med PHP och MySQL](kunskap/boken-webbutveckling-med-php-och-mysql) är följande kapitel relevanta att läsa igenom.
    * Kapitel 1 Introduktion
    * Kapitel 2 Variabler (ej vektor, objekt, 2.4 Miljövariabler)
    * Kapitel 4 Operatorer

<!--
* [Introduktion](guide/kom-igang-med-programmering-i-php/introduktion)

1. Det finns en videoserie som bygger på innehållet i guiden, kika gärna på den som ett komplement till guiden. Kika på de videor som är markerade "[Grunder]".
    * [Kom igång med programmering i PHP (2019)](https://www.youtube.com/playlist?list=PLKtP9l5q3ce-oIvGdREyAH-Oq_DQdqYW1)
-->



### Videor {#video}

De genomgångar och föresläsningar som spelas in under kursen sparas i en spellista.

* [htmlphp streams ht20](https://www.youtube.com/playlist?list=PLKtP9l5q3ce9knU3C_9NarDQFQmn3pazs).

Du kan även finna äldre inspelade föreläsningar.

* [htmlphp streams ht19](https://www.youtube.com/playlist?list=PLKtP9l5q3ce-tE2eS0JRdCZSpXlbGSWVK).



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 6-10 studietimmar)*



### Övningar {#ovningar}

Genomför följande övning för att träna dig och förbereda inför uppgifterna.

1. Jobba igenom övningen "[Gör en me-sida med HTML, CSS och PHP](kunskap/skapa-en-webbsida-med-html-css-och-php)". Övningen innehåller grunderna i HTML, CSS och PHP och visar hur du bygger upp en enkel webbplats. Filerna du jobbar med kan du spara i `me/kmom01/me`.



### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[PHP lab 1: uttryck, datatyper och variabler](uppgift/php-lab1-uttryck-datatyper-och-variabler)". Spara alla filerna i katalogen `me/kmom01/lab1`.

1. Gör uppgiften "[Skapa en me-sida i kursen htmlphp](uppgift/skapa-en-me-sida-i-kursen-htmlphp)". Detta blir grunden till din me-sida i kursen. Spara alla filerna i katalogen `me/kmom01/me1`.



<!--
### Extra {#extra}

Det finns inga extra uppgifter.

1. Ibland behöver du flytta filer mellan din lokala dator och din webbserver (dock inte i denna kursen eftersom vi gör på ett annat sätt). Då kan ett verktyg som Filezilla, en FTP/SFTP-klient vara till hjälp. Kör igenom artikeln "[Flytta filer till driftsmiljön med sftp och Filezilla](kunskap/flytta-filer-till-driftsmiljon-med-sftp-och-filezilla)" för att lära dig hur det fungerar.

1. Läs kort om [statisk kodvalidering av PHP-kod](t/4441).
-->



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

* Vilken utvecklingsmiljö använder du?
* Är du bekant med HTML, CSS och PHP sedan tidigare eller har du kanske jobbat med liknande tekniker?
* Gick det bra att installera labbmiljön eller var det något som krånglade?
* Är du bekant med terminalen och Unix-kommandon sedan tidigare?
* Gick det bra att komma i gång med kursmomentet rent allmänt?
* Vilken är din TIL för detta kmom?

TIL är en akronym för "Today I Learned" vilket leksamt anspelar på att det finns alltid nya saker att lära sig, varje dag. Man brukar lyfta upp saker man lärt sig och där man kanske hajade till lite extra över dess nyttighet eller enkelhet, eller så var det bara en ny lärdom för dagen som man vill notera.
