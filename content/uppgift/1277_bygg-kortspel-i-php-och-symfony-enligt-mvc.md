---
author: mos
category:
    - kurs mvc
revision:
    "2022-04-11": "(A, mos) Första utgåvan i mvc-v2."
...
Bygg kortspel i PHP och Symfony enligt MVC
===================================

Du skall skapa ett kortspel i PHP med objektorienterade konstruktioner. Applikationen bygger du i Symfony.

<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har god kunskap i hur man skapar en klass i PHP och hur arv och komposition fungerar.

Du kan bygga webbsidor via kontroller och templatefiler i Symfony.

Du vet hur man använder GET, POST och SESSION i Symfony.



Introduktion och förberedelse {#intro}
-----------------------

Läs och förbered dig.



### Välj ett kortspel att implementera {#kortspel}

Du skall implementera ett kortspel som en applikation. Du kan välja ett godtyckligt kortspel men standardrekommendationen är att välja spelet 21.

Implementera [kortspelet 21](https://sv.wikipedia.org/wiki/Tjugoett_(kortspel)) så att det går att spela i din webbplats.

Återanvänd de klasser du redan har. Om du modifierar klasserna så kan du behöva tänka på att du inte förstör något som redan fungerar.

Spelets idé är att med två eller flera kort försöka uppnå det sammanlagda värdet 21, eller komma så nära som möjligt utan att överskrida 21.

En spelrunda kan se ut så här när en spelare spelar mot banken.

* Spelet leder till en landningssida där man kan läsa spelregler och se dokumentation om spelet samt påbörja ett spel.
* Spelplanen visas och spelaren och banken har inte tagit några kort.
* Spelaren tar ett kort. Kortet visas.
* Spelaren kan bestämma att stanna eller ta ytterligare ett kort.
    * Om spelaren får över 21 vinner banken.
* När spelaren stannarså är det bankens tur.
* Banken är inte medveten om spelarens korthand.
* Banken plockar kort tills den stannar eller har över 21.
    * Banken vinner vid lika eller om banken har mer än spelaren.
    * Spelaren vinner om banken får över 21.
* Därefter kan man påbörja en ny omgång.

Standardrekommendationen är att göra enligt ovan. Det är dock fritt fram att hitta på en egen variant av hur man spelar spelet.

Förslaget är att du börjar med enklaste möjliga variant av spelet. Använd principen KISS och "Keep it simple stupid". Det kan vara en utmaning i uppgiften att verkligen försöka hålla det enkelt och avgränsat. Glöm inte bort det.



### Alternativa kortspel {#alt}

Några alternativa varianter på kortspel kan till exempel vara [Black Jack](https://en.wikipedia.org/wiki/Blackjack), poker eller någon form av [patiens](https://sv.wikipedia.org/wiki/Patiens) (se [exempel på olika kort patienser](https://www.123patiens.se/)).



<!--
* Game, Player, ComputerPlayer, Card, Deck, CardHand, Histogram, Intelligence, HighScore, Statistics, CardCounter
-->



Krav {#krav}
-----------------------

Kraven är uppdelade i sektioner.



### Landningssida och intro {#landa}

1. Skapa en landdningssida för spelet `game/` där du samlar information om spelet och kan starta spelet. Placera länken i webbplatsens navbar.

1. I din landningssida, inled med en kort beskrivning av ditt kortspel och reglerna för hur det fungerar.



### Problemlösning {#problemlos}

Du skall problemlösa det spelet du valt med flödesschema och pseudokod. Gör din problemlösning innan du påbörjar att implementera spelet.

1. Samla all din dokumentation i en webbsida under routen `game/doc` och länka till dokumentationssidan från din landningssida.

1. Skapa ett flödesschema som representerar hur du tänker lösa grunderna i spelet. Resultatet kan du placera som en bild i webbsidan för dokumentationen. Det behöver inte vara en komplett lösning, en dellösning räcker bra.

1. Skapa psuedokod som visar hur du tänker lösa delar av spelet. Du kan spara resultatet som text eller bild men visa upp det i webbsidan för dokumentationen. Det behöver inte vara en komplett lösning, en dellösning räcker bra.

1. Fundera igenom vilka klasser du behöver för att implementera spelet. Beskriv klasserna i text med klassens namn och en mening som beskriver vad klassens syfte är. Håll det kort och enkelt.

Följande krav är optionella och du gör dem om du har tid och lust.

1. Rita ett UML klass diagram som du också visar i webbsidan för dokumentationen.



### Kortspel {#kortspel}

Bygg ditt kortspel i Symfony med objektorienterade konstruktioner i PHP och försök tänka till så att du får "snygg kod".

1. All applikationskod placerar du i klasser som din kontroller använder. Se till att du har så lite kod som möjligt i din kontroller. Om du har mycket kod där så flyttar du den till en egen klass. Tänk att kontrollern skall vara tunn (lite kod) och modellerna (applikationens klasser) kan vara tjocka (mycket kod).

1. Använd templatefiler för att rendera webbsidorna.

1. Bygg spelet så att det fungerar minst enligt [de regler som visas i introduktionen ovan](#kortspel).

1. Banken behöver inte vara speciellt intelligent i sitt kortspel. Det räcker att den kan utföra sin uppgift och spela spelet. En enkel variant är att banken alltid plockar kort tills den har 17 eller mer, sedan stannar den.

Följande krav är optionella och du gör dem om du har tid och lust.

1. Gör så att spelaren kan satsa pengar. Man kan satsa en viss summa vid varje spel. Håll koll på hur mycket pengar som spelaren och banken har.

1. Låt banken och spelaren börja med 100 pengar var. När någon har 0 pengar har den spelaren förlorat.

1. Gör så att man kan vara två spelare och banken.

1. Korträkning med sannolikhet att få högt/lågt kort. Låt bli att blanda kortleken inför varje ny runda och spela tills kortleken är slut. Visa statistik som berättar sannolikheten för att få ett visst kort. Visa statistiken så att spelaren kan ha hjälp av den. Tex om spelaren har 15, visa sannolikheten för att spelaren inte skall bli tjock om nytt kort tas.

1. Bygg en smartare bank som spelar på ett "intelligent sätt". Låt banken ta hjälp av statistiken.

1. Bygg flera varianter av intelligens och låt spelaren och banken spela automatiskt enligt olika typer av intelligenser och se vilken intelligens/strategi som är bäst.

<!--
Fundera på att bygga vidare på konceptet med JSON.
Fuska på något sätt?
Visa spelets hela ställning med alla detaljer?
-->



### Kodvalidering {#validera}

1. Fixa till din kod enligt den kodstil du kör genom att köra `composer csfix`.

1. Kolla din kod hur den matchar dina linters genom att köra `composer lint`. Får du fel så kollar du vad det är och rättar de sakerna du anser rimliga.



### Publicera {#publicera}

1. Committa alla filer och lägg till en tagg 3.0.0. Om du gör uppdateringar så ökar du taggen till 3.0.1, 3.0.2, 3.1.0 eller liknande.

1. Kör `dbwebb test kmom03` för att kolla att du inte har några uppenbara fel.

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
