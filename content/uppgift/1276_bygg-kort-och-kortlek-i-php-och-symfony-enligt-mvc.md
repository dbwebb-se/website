---
author: mos
category:
    - kurs mvc
revision:
    "2023-04-03": "(C, mos) Genomgången inför vt23."
    "2021-04-10": "(B, mos) Problemlösning blir optionell."
    "2021-04-03": "(A, mos) Första utgåvan i mvc-v1."
...
Bygg kort och kortlek i PHP och Symfony enligt MVC
===================================

Du skall skapa ett antal klasser i PHP. Dessa klasser skall du sedan använda i ett par webbsidor och visa upp att de fungerar. Tanken är att du bygger grunden till någon form av enklare kortspel med objektorienterade tekniker i ramverket Symfony.

<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har grundläggande kunskap i hur man skapar en klass i PHP och hur arv och komposition fungerar.

Du kan bygga webbsidor via kontroller och templatefiler i Symfony.

Du vet hur man använder HTML formulär med GET, POST och SESSION i en Symfony webbapplikation.



Introduktion och förberedelse {#intro}
-----------------------

Läs och förbered dig.


### Stil på korten

Om du är osäker på hur en kortlek ser ut så kan du kontrollera med [Wikipedia Kortlek](https://sv.wikipedia.org/wiki/Kortlek). Eftersom vi skall spela kort så kan det vara bra att välja en klassisk Fransk-engelsk kortlek.

Du kan själv välja hur du vill representera korten i webbplatsen. Det finns flera alternativ.

1. En span eller div som du stylar i CSS med rundande hörn.
1. Använd utf-8 tecken för att visualisera spader, hjärter ♥, ruter, klöver. Börja googla "utf-8 spade".
1. Du kan representera knekt, dam och kung med utf-8 tecken, prova googla "utf-8 king".
1. Det finns bilder som representerar kort man kan använda, tex [File:English pattern playing cards deck.svg](https://commons.wikimedia.org/wiki/File:English_pattern_playing_cards_deck.svg). Men det kan vara lite pilligt att komma igång.

Enklaste möjliga representationen kan vara något i stil med [A♥] för att representera hjärter ess. Eller ännu enklare kan vara ett [utf-8 tecken för att representera ett klöver ess](https://www.compart.com/en/unicode/U+1F0D1) 🃑. Sedan kan man styla ett utf-8 tecken med bland annat fontsize.

Välj hur mycket tid du vill lägga på att göra snygga kort. Har du ont om tid så väljer du en enkel layout för korten till att börja med. Du kan alltid uppdatera till nästa kursmoment.



### Flera små committs

Försök göra många små commits. När du är klar med en "feature" i din kod så kan det vara lämpligt att också göra en commit. Detta skapar dig en bra historik över ändringarna i din kod. Läs gärna igenom artikeln "[How to Write a Git Commit Message](https://cbea.ms/git-commit/)" för att få tips om hur du kan skriva bra commit-meddelanden.



Krav {#krav}
-----------------------

Kraven är uppdelade i sektioner.

[WARNING]

**Uppdatering sker inför kursrundan vt23**

Kursmomentet är under översyn och uppdatering inför kommande kursomgång.

[/WARNING]

<!--
Överväg om pokerpatiens är ett bättre spel där det är enklare att låta datorn spelar "smartare" eller dummare.

Inkludera joker?

Enklare än att blanda in usability när man spelar ett kortspel mot datorn.
-->

<!-- generera UML diagram -->


### Skapa klasser och använd dem i webbsidor {#webb}

Börja med att utveckla dina klasser och testa dem i webbsidor enligt följande.

1. Skapa en kontroller i Symfony där du kan skapa webbsidor för denna delen av uppgiften.

1. Gör en förstasida `card` som länkar till samtliga undersidor för denna uppgiften. Detta är din "landningssida" för denna uppgiften. Placera länken till sidan i din navbar så den är lätt att nå.

1. Skapa klasser för att hantera kort (card) och kortlek (deck). Skapa en sida `card/deck` som visar samtliga kort i kortleken sorterade per färg och värde. Ess kan vara antingen 1 eller 14 beroende av vilket kortspel man spelar.

1. Skapa en sida `card/deck/shuffle` som visar samtliga kort i kortleken när den har blandats.

1. Skapa en sida `card/deck/draw` som drar ett kort från kortleken och visar upp det. Visa även antalet kort som är kvar i kortleken.

1. Skapa en sida `card/deck/draw/:number` som drar `:number` kort från kortleken och visar upp dem. Visa även antalet kort som är kvar i kortleken.

1. Kortleken skall sparas i sessionen så om man anropar sidorna `draw` och `draw/:number` så skall hela tiden antalet kort från korleken minskas tills kortleken är slut. När man gör `card/deck/shuffle` så kan kortleken återställas.

1. Skapa en sida `card/deck/deal/:players/:cards` som delar ut ett antal  `:cards` från kortleken till ett antal `:players` och visar upp de korten som respektive spelare har fått. Visa även antalet kort som är kvar i kortleken. Här kan det vara bra att skapa klasser för player och cardHand eller liknande.

1. Skapa en sida `card/deck2` som är en kortlek inklusive 2 jokrar. Visa kortleken på samma sätt som sidan `card/deck`. Här kan det troligen vara lämpligt med någon form av arv när du bygger koden. Försök återanvända `Deck` och bygg förslagsvis `DeckWith2Jokers extends Deck`.

Optionellt krav.

1. Fundera på om du kan använda konstruktionen "interface" för att bygga din kod förberedd för återanvändning. Tänk att din kod jobbar mot ett interface `DeckInterface` istället för en hård implementation av `Deck` alternativt `DeckWith2Jokers`. Se om du kan uppdatera din kod och dina sidor så applikationen blir mer flexibel för implementationen av själva kortleken. Spelaren, korthanden, och utdelningen av korten samt blandningen bör ju inte behöva bry sig om vilka kort som ligger i kortleken.



### Bygg JSON API {#json}

Denna delen gäller främst JSON API krav.

1. Skapa en landningssida för routen `api/` som visar en webbsida med en sammanställning av alla JSON routes som din webbplats erbjuder.

1. Börja med att lägga till den route du skapade i kmom01 `api/quote`, länka till den och ge en kort förklaring av vad routen gör.



Börja med att utveckla dina klasser och testa dem i webbsidor enligt följande.

1. Skapa en kontroller i Symfony där du kan skapa ett JSON API för denna delen av uppgiften.

1. I din landningssida för `card/` fortsätter du att länka till alla JSON routes som finns i denna delen av uppgiften.

1. Skapa en route `GET card/api/deck` som returnerar en JSON struktur med hela kortleken sorterad per färg och värde.

Följande 3 krav är optionella. Gör dem om du känner att du har tid. Det är bra övning och träning.

1. Skapa en route `POST card/api/deck/shuffle` som blandar kortleken och därefter returnerar en JSON struktur med kortleken.

1. Skapa route `POST card/api/deck/draw` och `card/api/deck/draw/:number` som drar 1 eller `:number` kort från kortleken och visar upp dem i en JSON struktur samt antalet kort som är kvar i kortleken. Kortleken sparas i sessionen så om man anropar dem flera gånger så minskas antalet kort i kortleken.

1. Skapa en sida `card/api/deck/deal/:players/:cards` som delar ut ett antal  `:cards` från kortleken till ett antal `:players` och visar upp de korten som respektive spelare har fått i en JSON struktur. Visa även antalet kort som är kvar i kortleken.



### Kodvalidering {#validera}

1. Fixa till din kod enligt den kodstil du kör genom att köra `composer csfix`.



### Publicera {#publicera}

1. Committa alla filer och lägg till en tagg 2.0.0. Om du gör uppdateringar så ökar du taggen till 2.0.1, 2.0.2, 2.1.0 eller liknande.

1. Kör `dbwebb test kmom02` för att kolla att du inte har några uppenbara fel.

1. Pusha upp repot till GitHub, inklusive taggarna.

1. Gör en `dbwebb publishpure report` och kontrollera att att det fungerar på studentservern.



<!--
Extrauppgift {#extra}
-----------------------

Lös följande extrauppgifter om du har tid och lust.

-->



Tips från coachen {#tips}
-----------------------

Lycka till och hojta till i chatt och forum om du behöver hjälp!
