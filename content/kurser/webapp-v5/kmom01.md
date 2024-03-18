---
author:
  - efo
revision:
  "2023-03-01": (A, efo) Första utgåvan v5.
...
Kmom01: Web Components
==================================

Tanken är att komma igång med utveckling av mobila applikationer. De mobila applikationerna utvecklar vi med tekniker baserade på HTML, CSS och JavaScript. Vi ser hur vi kan utnyttja dessa tekniker för att ändra innehållet utan att ladda om applikationen. Som ett första steg så läser vi på om grunderna och börjar så smått med det löpande projektet för alla sex kursmoment.



<!--more-->



Vi har i tidigare kurser sett hur vi man kan skapa applikationer i webbläsaren där vi aldrig laddar om sidan. Vi ska fortsätta på det spåret och bygga vidare på detta med webbens inbyggda teknologier för till exempel hämtning av data från ett API.

Som ett första steg ska vi börja med en löpande uppgift där vi i detta kursmoment skapar början till en lagerhanteringsapp. Nedan finns en liten video som visar hur det kan se ut när man är klar med Lager appen del 1.

[YOUTUBE src=6Fni0LwEI10 width=630 caption="Lager appen del 1."]



<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Labbmiljön  {#labbmiljo}
---------------------------------

*(ca: 1 studietimme)*

Det finns en [längre beskrivning om kursens labbmiljö](./../installera-labbmiljo). Läs den om du är osäker på vad som skall göras, eller om detta är din första dbwebb-kurs.

Uppdatera [dbwebb-cli](dbwebb-cli) samt klona och initiera kursrepot.

```text
# Gå till din katalog för dbwebb-kurser
dbwebb selfupdate
dbwebb clone webapp
cd webapp
dbwebb init
```



Veckans genomgång  {#genomgang}
---------------------------------

Nedan berättar Andreas om veckans övningar och uppgifter och visar lite tips och trix.

[YOUTUBE src=eJ1iPwzU3Mc width=630 caption="Veckans genomgång"]



Läsanvisningar  {#lasanvisningar}
---------------------------------

*(ca: 6-10 studietimmar)*



### Artiklar {#artiklar}

Läs följande artiklar för att få bakgrunden till övningarna.

1. Läs om viewport på MDN i artikeln "[Using the viewport meta tag to control layout on mobile browsers](https://developer.mozilla.org/en-US/docs/Web/HTML/Viewport_meta_tag)".

1. Bekanta dig med dokumentationen för [fetch](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API) som vi använder för att ladda data via JavaScript.

1. Bekanta dig översiktligt med _web components_ i artikeln "[Introduction](https://www.webcomponents.org/introduction)".



### Video {#video}

1. Det finns en [videoserie](https://www.youtube.com/playlist?list=PLKtP9l5q3ce_CbhJOudHjxkjYofM98kvh) kopplat till kursen, titta på videos som börjar på 0 och 1.



### Lästips {#lastips}

1. Läs översiktligt denna samling av "best-practices" för typografi på webben [Typography Handbook](http://typographyhandbook.com). Spara den i dina bokmärken som en framtida referens.

1. För mer om tillgänglighet (accessibility, a11y) titta in på [The A11Y Project](https://a11yproject.com/).



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 6-10 studietimmar)*



### Övningar {#ovningar}

Gör följande övningar för att träna inför uppgifterna.

1. Läs igenom artikeln "[Typografi i mobila enheter](kunskap/typografi-i-mobila-enheter)". Spara koden i `me/kmom01/typography`.

1. Skapa en API-nyckel och produkter i ditt egna lager med hjälp av artikeln "[Introduktion till Lager-API:t](kunskap/introduktion-till-lager-api)".

1. Gör övningen "[Web Components](kunskap/web-components)". Spara resultatet i `me/lager`.



### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[Lager appen del 1](uppgift/lager-appen-del-1)". Spara din kod i `me/lager`.

Emil visar i nedanstående vide hur du gör en inläming i webapp.

[YOUTUBE src=lGk0n231zlg width=630 caption="En inlämning i webapp"]



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten och lämnas in på Canvas.

* Är du sedan tidigare bekant med utveckling av mobila appar?
* Vilket är den viktigaste lärdomen du gjort om typografi för mobila enheter?
* Du har i kursmomentet hämtat data från ett stycken API. Hur kändes detta?

TIL är en akronym för “Today I Learned” vilket leksamt anspelar på att det finns alltid nya saker att lära sig, varje dag. Man brukar lyfta upp saker man lärt sig och där man kanske hajade till lite extra över dess nyttighet eller enkelhet, eller så var det bara en ny lärdom för dagen som man vill notera.

* Vilken är din TIL för detta kmom?
