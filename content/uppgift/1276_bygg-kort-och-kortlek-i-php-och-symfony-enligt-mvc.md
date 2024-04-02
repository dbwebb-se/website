---
author: mos
category:
    - kurs mvc
revision:
    "2024-04-02": "(D, mos) Förtydligade krav om sessionen."
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



### Klasser 

Du skall skapa egna applikationsklasser och integrera dem i Symfony. De klasser du gör skall ha med kortlek att göra. Det finns inget hårt och absolut krav på att dina klasser skall se ut på ett visst sätt, men förslaget är följande.

* Card, ett kort
* CardHand, en giv av kort, en korthand
* DeckOfCards, en kortlek

Du skall ha minst ett arv och här kan du välja att jobba med ett Card och ett CardGraphic som två olika kort. Du kan också välja att ha en DeckOfCards som har jokrar och en som inte har jokrar. Det är fritt så länge du har med minst ett arv.

Du skall ha minst en komposition, men här är troligen både CardHand och DeckOfCards sådana konstruktioner.

Det finns inga exakta krav på vilka metoder dina klasser skall ha. Det kan du delvis bestämma själv och delvis finns det vissa krav nedan som måste uppfyllas.



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

<!--
TODO

* Kortlek med Joker?

-->

### Skapa klasser och använd dem i webbsidor {#webb}

Börja med att utveckla dina klasser och testa dem i webbsidor enligt följande.

1. Skapa en kontroller i Symfony där du kan skapa routes för denna delen av uppgiften.

1. Gör en landningssida `session` som skriver ut innehållet i sessionen så det blir enkelt att debugga vad sessionen innehåller.

1. Lägg till routen `session/delete` som raderar allt innehåll i sessionen. Det är dessutom bra att ha när du utvecklar och vill testa att du initierar sessionen på rätt sätt.

1. Använd flash-meddelande för att ge användaren feedback om att "nu är sessionen raderad".

1. Gör en förstasida `card` som länkar till samtliga undersidor för denna uppgiften. Detta är din "landningssida" för denna uppgiften. Placera länken till sidan i din navbar så den är lätt att nå.

1. Kortleken skall hanteras i sessionen. Alla routes som är beroende av sessionen måste se till att det finns en giltig session, eller starta en sådan session.

1. På din landdningssida, berätta kort om strukturen på dina klasser, vilka klasser har du och hur är de relaterade till varandra. Rita ett UML klass diagram och visa i sidan.

1. Skapa en sida `card/deck` som visar samtliga kort i kortleken sorterade per färg och värde.

1. Skapa en sida `card/deck/shuffle` som visar samtliga kort i kortleken när den har blandats.

1. Skapa en sida `card/deck/draw` som drar ett kort från kortleken och visar upp det. Visa även antalet kort som är kvar i kortleken.

1. Skapa en sida `card/deck/draw/:number` som drar `:number` kort från kortleken och visar upp dem. Visa även antalet kort som är kvar i kortleken.

1. Kortleken skall sparas i sessionen så om man anropar sidorna `draw` och `draw/:number` så skall hela tiden antalet kort från korleken minskas tills kortleken är slut. När man gör `card/deck/shuffle` så kan kortleken återställas.

1. [OPTIONELLT] Skapa en sida `card/deck/deal/:players/:cards` som delar ut ett antal `:cards` från kortleken till ett antal `:players` och visar upp de korten som respektive spelare har fått. Visa även antalet kort som är kvar i kortleken.



### Bygg JSON API {#json}

Denna delen gäller främst JSON API krav.

1. Bygg vidare på din landningssida `api/` som visar en webbsida med en sammanställning av alla JSON routes som din webbplats erbjuder. Varje route skall ha en förklaring vad den gör.

1. Skapa en kontroller i Symfony där du kan skapa routes för ett JSON API för denna delen av uppgiften.

1. Skapa en route `GET api/deck` som returnerar en JSON struktur med hela kortleken sorterad per färg och värde.

1. Skapa en route `POST api/deck/shuffle` som blandar kortleken och därefter returnerar en JSON struktur med kortleken. Den blandade kortleken sparas i sessionen.

1. Skapa route `POST api/deck/draw` och `POST api/deck/draw/:number` som drar 1 eller `:number` kort från kortleken och visar upp dem i en JSON struktur samt antalet kort som är kvar i kortleken. Kortleken sparas i sessionen så om man anropar dem flera gånger så minskas antalet kort i kortleken.

1. [OPTIONELLT] Skapa en route `POST api/deck/deal/:players/:cards` som delar ut ett antal `:cards` från kortleken till ett antal `:players` och visar upp de korten som respektive spelare har fått i en JSON struktur. Visa även antalet kort som är kvar i kortleken.



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
