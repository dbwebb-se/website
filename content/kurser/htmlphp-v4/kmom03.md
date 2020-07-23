---
author:
    - mos
revision:
    "2018-06-22": (G, mos) Genomarbetad inför ht18.
    "2017-06-15": (F, mos) Uppdaterad labbserie.
    "2016-08-31": (E, mos) Lade till rätt videoserie från youtube.
    "2016-02-22": (D, mos) Bort med not om kursutveckling och länk till version 1.
    "2015-08-24": (C, mos) Släppt till ht15.
    "2015-08-06": (B, mos) Genomgången inför ht15.
    "2015-03-17": (A, mos) Första utgåvan för htmlphp version 2 av kursen.
...
Kmom03: Bygg multisida i PHP
==================================

Vi tittar på den i PHP inbyggda datatypen för arrayer och ser hur vi kan lagra och hantera värden i både numeriska arrayer och strängindexerade arrayer. Vi tittar på vilka inbyggda funktioner som finns för att jobba med arrayer och vi tittar på två av de fördefinierade arrayerna $\_GET och $\_SERVER som hjälper att att bygga webbsidor.

Som vanligt behöver vi skriva ett antal testprogram för att verkligen förstå hur saker hänger ihop.

Sedan bygger vi en uppdaterad sidkontroller som har stöd för multisidor med egen navigering till undersidor. Vi lär oss begreppet multisida och samtidigt får vi en övning i hur kod kan struktureras i kataloger och filer efter kodens olika syften.

Till slut knyter vi ihop det genom att integrera multisidan i din me-sida. Resultatet blir me-sida version 3.0.

<!--more-->

[FIGURE src=image/snapht18/multipage.png?w=w3 caption="En multisida i PHP, navigeringsmeny i vänsterkanten och färgad i pastellfärger."]


<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Läs & Studera  {#lasanvisningar}
---------------------------------

*(ca: 4-8 studietimmar)*



### HTML & CSS {#htmlcss}

Läs följande för att fortsätta bekanta dig med teknikerna.

1. Läs igenom följande sektion i guiden "[Kom igång med HTML och CSS](guide/kom-igang-med-html-och-css)".
    * [Bakgrund](guide/kom-igang-med-html-och-css/bakgrund)



### PHP {#php}

Läs följande för att fortsätta bekanta dig med tekniken.

1. Läs igenom följande sektioner i guiden "[Kom igång med programmering i PHP](guide/kom-igang-med-programmering-i-php)".
    * [Datastrukturer](guide/kom-igang-med-programmering-i-php/datastrukturer)

1. I kursboken [Webbutveckling med PHP och MySQL](kunskap/boken-webbutveckling-med-php-och-mysql) är följande kapitel relevanta att läsa igenom.
    * Kapitel 2.3.5 Vektor
    * Kapitel 2.4 Miljövariabler
    * Kapitel 3 Konstanter



### Videor {#video}

Det finns en samling videor som används i olika omfattning under kursens gång, [du finner dem på Youtube](https://www.youtube.com/channel/UCxX3bcidovf5MDLeXMcbDyg/playlists?view=50&shelf_id=9&sort=dd).



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 8-12 studietimmar)*



### Övningar {#ovningar}

Genomför följande övningar, det hjälper dig inför uppgifterna.

1. Jobba igenom övningen "[Bygg en multisida med PHP (v2)](kunskap/bygg-en-multisida-med-php-v2)". Spara filerna i katalogen `me/kmom03/multi`, så kan du använda dem i den kommande uppgiften.



### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[PHP lab 3: Arrayer](uppgift/php-lab3-arrayer)". Spara alla filerna i katalogen `me/kmom03/lab3`.

1. Gör uppgiften "[Bygg en multisida och testa arrayer (v2)](uppgift/bygg-en-multisida-och-testa-arrayer-v2)". Spara filerna i katalogen `me/kmom03/multi`.

1. Gör uppgiften "[Bygg ut din me-sida till version 3 (v2)](uppgift/bygg-ut-din-htmlphp-me-sida-till-version-3-v2)". Spara filerna i katalogen `me/kmom03/me3`.



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

* Hur känns det att komma igång med datastrukturer som arrayer? Är det koncept du känner igen sedan tidigare?
* Hur känns det med strukturer såsom sidkontroller, multisida och templatefiler?
* Är det något särskild du vill berätta om din me-sida och dess struktur? Något som du är extra nöjd med?
* Får du hjälp och stöd i guiderna (html/css-guiden och php-guiden)?
* Vilken är din TIL för detta kmom?
