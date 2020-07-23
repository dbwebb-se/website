---
author:
    - mos
revision:
    "2018-09-17": (F, mos) Uppdaterad för v3, mer exempelprogram.
    "2017-06-15": (E, mos) Uppdaterad labbserie.
    "2016-08-31": (D, mos) Lade till rätt videoserie från youtube.
    "2016-02-22": (C, mos) Bort med not om kursutveckling och länk till version 1.
    "2015-08-25": (B, mos) Genomgången och första versionen släppt.
    "2015-06-03": (A, mos) Första utgåvan för htmlphp version 2 av kursen.
...
Kmom04: Formulär och sessioner
==================================

I detta kursmoment går vi igenom fler grunder i CSS, grunder såsom boxmodellen, storlekar, display, float, fonter, färger och bakgrund. Du får möjligheten att leka runt och testa olika konstruktioner. Det är ett bra sätt att lära sig.

I PHP får du lära dig att skapa egna funktioner och se hur du jobbar med HTML formulär och sessioner i PHP. Du kommer bekanta dig med de inbyggda globala arrayerna `$_GET`, `$_POST` och `$_SESSION` och se hur de relaterar till formulär och sessioner.

Du jobbar med ett flöde där formulär postar till en procesingsida som skickar vidare till en resultatsida. Det flödet är ett vanligt sätt att strukturera sina webbapplikationer när man uppdaterar data i webbplatsen.

Du gör en labb med funktioner och du implementerar en multisida i din me-sida där du använder både formulär och sessioner.

<!--more-->

[FIGURE src=image/snapht18/login.png?w=w3 caption="Funktionalitet för att logga in på en webbplats löses med formulär, processingsidor och sessioner."]

[FIGURE src=image/snapht18/stylechooser.png?w=w3 caption="En styleväljare implementerad med formulär, processingsida och sessioner."]

[FIGURE src=image/snapht18/flashmessage.png?w=w3 caption="Flashmeddelanden som lagras temporärt i sessionen kan ge användaren återkoppling på om saker gick bra eller ej."]

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Läs & Studera  {#lasanvisningar}
---------------------------------

*(ca: 6-10 studietimmar)*



### HTML & CSS {#htmlcss}

Läs följande för att fortsätta bekanta dig med teknikerna.

1. Läs igenom följande sektion i guiden "[Kom igång med HTML och CSS](guide/kom-igang-med-html-och-css)".
    * [Formular](guide/kom-igang-med-html-och-css/formular)

1. Läs igenom artikeln "[Vanliga CSS-konstruktioner som är bra att kunna](kunskap/vanliga-css-konstruktioner-som-ar-bra-att-kunna)" och prova konstruktionerna på egen hand.

1. Se en [översikt av olika formulärelement](forms), det räcker att du bekantar dig med hur de ser ut. Du kan även testa dem hur de fungerar.



### PHP {#php}

Läs följande för att fortsätta bekanta dig med tekniken.

1. Läs igenom följande sektioner i guiden "[Kom igång med programmering i PHP](guide/kom-igang-med-programmering-i-php)".
    * [Egenskapade funktioner](guide/kom-igang-med-programmering-i-php/egenskapade-funktioner)
    * [HTML formulär](guide/kom-igang-med-programmering-i-php/html-formular)
    * [Sessioner](guide/kom-igang-med-programmering-i-php/sessioner)

1. I kursboken [Webbutveckling med PHP och MySQL](kunskap/boken-webbutveckling-med-php-och-mysql) är följande kapitel relevanta att läsa igenom.
    * Kapitel 7 Funktioner



### Video  {#video}

Det finns en samling videor som används i olika omfattning under kursens gång, [du finner dem på Youtube](https://www.youtube.com/channel/UCxX3bcidovf5MDLeXMcbDyg/playlists?view=50&shelf_id=9&sort=dd).



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 6-8 studietimmar)*



### Övningar {#ovningar}

Det finns inga speciella övningar till detta kursmomentet. Men de delar som ligger i guiderna ger dig grunden för det som behövs för att lösa uppgifterna.

<!--
1. Jobba igenom övningen "[Att bygga en styleväljare till sin webbplats](kunskap/att-bygga-en-stylevaljare-till-sin-webbplats)".

https://arkiv.dbwebb.se/kod-exempel/business-card-generator/
-->



### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[PHP lab 4: skapa egna funktioner](uppgift/php-lab4-skapa-egna-funktioner)". Spara alla filerna i katalogen `me/kmom04/lab4`.

1. Gör uppgiften "[Bygg ut din me-sida till version 4 (v2)](uppgift/bygg-ut-din-me-sida-till-version-4-v2)". Spara filerna i katalogen `me/kmom04/me4`.

<!--
1. Gör uppgiften "[Bygg en styleväljare till din webbplats](uppgift/bygg-en-stylevaljare-till-din-webbplats)". Spara filerna i `me/kmom04/stylechooser`.
-->



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

* Börjar du känna att du bemästrar CSS? Beskriv hur väl du kan CSS (nybörjare, erfaren).
* Vad tycker du om CSS så här långt in i kursen?
* Känns det som du greppar konceptet med php och funktioner?
* Gick det bra med html formulär, GET, POST och processingsidor i php?
* Lyckade du får ordning på hur php och sessioner fungerar?
* Vilken är din TIL för detta kmom?
