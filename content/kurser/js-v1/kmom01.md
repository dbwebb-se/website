---
author: mos
revision:
    "2019-10-31": "(L, lew) Uppdatering inför ht19."
    "2018-10-22": "(K, lew) Uppdatering inför ht18."
    "2017-12-27": "(J, mos) Enhetlig mall för me-sida."
    "2017-10-09": "(I, mos) Genomgång inför ht17, ny struktur labbmiljö, redovisa, uppgradering dbwebb-cli v2."
    "2017-09-27": (H, lew) Ny kurslitteratur.
    "2016-03-15": (G, mos) Lade till videoserie med "Lär dig JavaScript".
    "2015-08-26": (F, mos) Ny struktur på inledning och installaiton av labbmiljö.
    "2015-01-19": (E, mos) Bort ruta om kursutveckling och bort länk till youtube-serie.
    "2014-10-01": (D, mos) Ändrade länken till redovisa-instruktionen.
    "2014-08-30": (C, mos) Första officiella releasen.
    "2014-08-19": (B, mos) Felaktig länk till uppgift för me-sidan.
    "2014-08-11": (A, mos) Första utgåvan för javascript1 kursen.
...

Kmom01: Utvecklingsmiljö
==================================

Låt oss komma i gång med en labbmiljö, och en miljö för kursen, tillsammans med en introduktion i HTML, CSS och JavaScript.

Detta kursmoment ger dig basen för resten av kursen, det hanterar grunderna som behövs så att vi i kommande kursmoment kan dyka ned mer i programmering i JavaScript.

<!--more-->

[FIGURE src=/image/snap/js1-sandbox-mod.png?w=w2 caption="En aningen gulare sandbox för mina testprogram."]

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Labbmiljön  {#labbmiljo}
---------------------------------

*(ca: 2-4 studietimmar)*

Det finns en [längre beskrivning om kursens labbmiljö](./../installera-labbmiljo). Läs den om du är osäker på vad som skall göras, eller om detta är din första dbwebb-kurs.

Den korta varianten är att du behöver [installera labbmiljön](./../labbmiljo), uppdatera [dbwebb-cli](dbwebb-cli) samt klona och initiera kursrepot.

```text
# Gå till din katalog för dbwebb-kurser
dbwebb selfupdate
dbwebb clone javascript1
cd javascript1
dbwebb init
```



Läsanvisningar  {#lasanvisningar}
---------------------------------

*(ca: 6-10 studietimmar)*


### Kurslitteratur  {#kurslitteratur}

Läs följande:

1. Bekanta dig med kurslitteraturen [Speaking JavaScript: An In-Depth Guide for Programmers](kunskap/boken-speaking-javascript) genom att läsa igenom det första kapitlet [Ch1 Basic JavaScript](http://speakingjs.com/es5/ch01.html) (läs till och med stycket om "Strict Mode") som ger dig en introduktion till grundkonstruktioner i programmeringsspråket JavaScript.



###MDN {#mdn}

I kursen används Mozilla Developers Network (MDN) som en resurs generellt för webbresurser och specifikt för referensmanual till programmeringsspråket JavaScript.

Vill du hamna på rätt manualsida så lägger du alltid till "mdn" till din googling. Det finns många versioner av JavaScript och du vill gå tillbaka till källan i referensmanualen för att veta vad som är rätt (eller fel).

Gör följande:

1. Bekanta dig kort med översikten på [MDN: Web technology for developers](https://developer.mozilla.org/en-US/docs/Web). Där ser du generellt material om webbteknologier.

1. Bekanta dig specifikt med det som finns under rubriken "JavaScript". Använd minst 10 minuter av din tid för att kika runt och läsa någon av de inledande artiklarna om JavaScript.
<!--
1. För en snabb introduktion till konstruktionerna i språket JavaScript kan jag rekommendera dokumentet "[MDN JavaScript Guide](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide)" och de inledande kapitlen som kompletterar det du läst i kurslitteraturen.
    * Introduction
    * Grammar and types
    * Expressions and operators -->


<!--
###Artiklar {#artiklar}

Läs följande:

1. I kursen används validatorer och en kodstandard för att testa att du skriver kod på ett, enligt kodstandarden, acceptabelt sätt. Du kan läsa om dbwebb-kodstandarden på [npm javascript-code-style](https://www.npmjs.com/package/javascript-style-guide). Du kan diskutera [kodstandarden i forumet](t/6327). -->

<!--
1. CSS style guide.
-->



###Video  {#video}

Titta på följande:

1. Videoserien [Lär dig JavaScript](https://www.youtube.com/playlist?list=PLKtP9l5q3ce_YXUQlr5aAzJ406vSsmeMT) är tätt kopplat till kursmaterialet. Kika igenom serien under kursens gång.

<!-- 1. Se JavaScript-gurun Douglas Crockford i en historisk bakgrund om programmeringsspråk och en introduktion till JavaScript: "[Crockford on JavaScript - Volume 1: The Early Years](https://www.youtube.com/watch?v=JxAXlJEmNMg)". -->



<!-- ###Lästips {#lastips}

Följande kan vara intressant att ha koll på.

1. Lär dig mer om historian om datorer, eller som de säger, "[The mother of All Demos](http://en.wikipedia.org/wiki/The_Mother_of_All_Demos)", när Douglas Engelbart, för första gången demonstrerar det som numer är vardagsmat för oss alla. [Se hela presentationen](https://www.youtube.com/watch?v=VScVgXM7lQQ&list=PL76DBC8D6718B8FD3). -->



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 4-10 studietimmar)*



###Övningar {#ovningar}

Jobba igenom följande.

1. Du behöver ha grundläggande koll på HTML och CSS. Som en uppfräschning av dina kunskaper, eller som en kort intro, så jobbar du igenom materialet i tipset "[Kom igång (snabbt) med HTML, CSS och JavaScript](coachen/kom-igang-snabbt-med-html-css-och-javascript)". Jobba igenom materialet grundligt eller översiktligt, beroende på ditt eget behov.

1. Jobba igenom artikeln "[Kom i gång med HTML, CSS och JavaScript](kunskap/kom-i-gang-med-html-css-och-javascript)" som visar dig hur du gör ditt första program i JavaScript och ger dig en grundstruktur för kursens övningar.

1. Gå igenom [guiden](guide/javascript1/) som följer kursens moment. För kursmoment 1 gäller delarna:
    * [Inledning](guide/javascript1/section_break_1)
    * [Språkkonstruktioner](guide/javascript1/section_break_2)
    * [Inbyggda typer - steg 1](guide/javascript1/section_break_3)



###Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör laborationen "[JavaScript med variabler och inbyggda funktioner](uppgift/javascript-med-variabler-och-inbyggda-funktioner)". Labben genereras i `me/kmom01/lab1`.

1. Gör uppgiften "[Sandbox steg 1](uppgift/sandbox-steg-1)". Spara resultatet i `me/kmom01/sandbox`.

1. Gör uppgiften "[Skapa en me-sida för redovisning i dbwebb-kurs](uppgift/skapa-en-me-sida-for-redovisning-i-dbwebb-kurs)". Spara resultatet i `me/redovisa`.


<!-- 1. Gör uppgiften "[Skapa din egen Sandbox för JavaScript testprogram](uppgift/skapa-din-egen-sandbox-for-javascript-testprogram)". Har du gjort övningen är du nästan klar. Spara resultatet i `me/kmom01/sandbox`. -->





Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

* Vilken utvecklingsmiljö använder du (berätta om något förändrats sen sist, om du svarat på frågan i tidigare kurser)?
* Är du bekant med HTML och CSS tillsammans med JavaScript sedan tidigare?
* Gick det bra med JSFiddle/CodePen, några funderingar kring verktygen?
* Gick det bra att komma i gång med kursmomentet, var det lagom, för litet, för stort, något som var svårt eller saknades?
* Vilken är din TIL för detta kmom?
