---
author: mos
revision:
    "2017-10-10": (D, mos) Genomgång inför ht17.
    "2016-03-15": (C, mos) Lade till videoserie med "Lär dig JavaScript".
    "2015-01-19": (B, mos) Bort ruta om kursutveckling och bort länk till youtube-serie.
    "2014-10-30": (A, mos) Första utgåvan för javascript1 kursen.
...
Kmom06: Modul och closure
==================================

När kodbasen växer blir det mer och mer viktigt att ha en bra struktur på den, annars blir det svårare och svårare att vidareutveckla och underhålla koden. När man dessutom skall använda olika moduler av kod från olika tillverkare så är det viktigt att de olika delarna av koden inte krockar. Genom att använda en konstruktion som kallas *module pattern* hittar vi ett sätt att bättre strukturera vår kod.

<!--more-->

[FIGURE src=/img/hangman/hangman-validates-inline.svg caption="En SVG-bild till ett hänga gubben-spel som byggs enligt module pattern."]

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Läsanvisningar  {#lasanvisningar}
---------------------------------

*(ca: 4-6 studietimmar)*


###Kurslitteratur  {#kurslitteratur}

Läs följande.

1. Läs i boken [Learning JavaScript Design Patterns](http://addyosmani.com/resources/essentialjsdesignpatterns/book/) för att ta reda på vad ett module pattern är.
    * [Introduction](http://addyosmani.com/resources/essentialjsdesignpatterns/book/#introduction)
    * [What is a Pattern?](http://addyosmani.com/resources/essentialjsdesignpatterns/book/#whatisapattern)
    * [The Module Pattern](http://addyosmani.com/resources/essentialjsdesignpatterns/book/#modulepatternjavascript)



###MDN {#mdn}

Läs följande:

1. Läs i [MDN JavaScript Guide](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide) för att studera begreppet closure.
    * [Closures](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Closures)



<!--
###Artiklar {#artiklar}
-->



###Video  {#video}

Titta på följande:

1. Videoserien [Lär dig JavaScript](https://www.youtube.com/playlist?list=PLKtP9l5q3ce_YXUQlr5aAzJ406vSsmeMT) är tätt kopplat till kursmaterialet. Kika igenom serien under kursens gång.

1. Se Douglas Crockford på konferensen HTML5DevConf 2011 när han pratar om ["JavaScript Programming Style and Your Brain"](https://www.youtube.com/watch?v=cIOIyfRoGcM). Video riktar sig till mer erfarna programmerare men även nybörjare har nytta av den.



<!--
###Lästips {#lastips}

Det finns inga lästips.
-->



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 12-16 studietimmar)*


###Övningar {#ovningar}

Genomför övningarna för att träna inför uppgifterna.

1. Jobba igenom övningen om "[Funktioner, scope, closures och moduler med JavaScript](kunskap/funktioner-scope-closures-och-moduler-med-javascript)". Det är ingen kod du måste skriva, men du borde provköra varje exempel i din egen miljö. Det hjälper dig att öva in begreppen och du kan själv modifiera testprogrammen för att test hur de fungerar.
2. Gå igenom [guiden](guide/javascript1/) som följer kursens moment. För kursmoment 6 gäller delen:
    * [Module pattern](guide/javascript1/section_break_9)



###Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[Hänga gubben som modul i JavaScript](uppgift/hanga-gubben-som-modul-i-javascript)". Spara koden i `me/kmom06/hangman`.



<!--
###Extra {#extra}

Det finns inga extra uppgifter.
-->



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

* Var det svårt att greppa hur function scope och closure fungerar eller känns det naturligt?
* Har du några erfarenheter av designmönster sedan tidigare?
* Kan du jämföra "module pattern" med någon annan liknande datastruktur?
* Känns "module pattern" som en bra kodstruktur?
* Var boken "Learning JavaScript Design Patterns" lättläst eller utmanande?
* Vad är din TIL för det här kursmomentet?
