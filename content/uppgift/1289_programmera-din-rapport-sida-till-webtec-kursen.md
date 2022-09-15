---
author: mos
category:
    - kurs webtec
revision:
    "2022-09-15": "(B, mos) Lade till livlinor."
    "2022-08-11": "(A, mos) Första utgåvan till webtec-v2."
...
Programmera din rapportsida till webtec-kursen
===================================

Du skall programmera ett par webbsidor med PHP och grundläggande konstruktioner såsom variabler, if-satser, loopar, inbyggda funktioner samt använda dig av HTML form och GET via querysträngen.

Du jobbar i din tidigare struktur av sidkontrollers och vyer och bygger ut din befintliga webbplats.

<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har jobbat igenom övningen "[Programmera din webbplats med PHP](kunskap/programmera-din-webbplats-med-php)" och du har därmed fått en bra start inför uppgiften.



<!--
Genomgång {#genom}
------------------------

Här är en video som "pratar" dig igenom uppgiftens upplägg och visar hur du kommer igång.

[YOUTUBE src="gKzwQTG9eCI" width=700 caption="Kurs mvc kmom03 tisdagsgenomgång, del 3/3 uppgiften (Zoom med Mikael)."]
-->



Introduktion och förberedelse {#intro}
-----------------------

Om du har jobbat igenom övningen så är du förberedd för uppgiften och du har tränat på de begrepp som används för att lösa uppgiften.



### Struktur {#struktur}

Glöm inte att använda strukturen med sidkontrollers och vyer när du löser uppgiften.



### Validering av PHP kod {#validering}

Kör `dbwebb validate report` för att validera din PHP-kod så att den har rätt kodstil och att du har skrivit "god kod". Rätta de fel som du får. I början kan det vara bra att validera ofta, så slipper man en större felmängd i slutet.



### Felsök på studentservern {#felsok}

När du vill felsöka PHP-kod på studentservern så behöver du publicera med `dbwebb publishpure report` för att du skall få rätt radnummer.

Om du gör en vanlig publish så komemr din kod att modiferas så att alla kommentarer tas bort och alla radbrytningar och tabbar försvinner. De felmeddelanden du får kommer alltså ge dig ett annat radnummer än det som du ser i din texteditor.



### Är det fredag? {#fredag}

I uppgiften kommer du bygga en webbsida för att kolla om det är fredag idag och isåfall skrivs det ut ett trevligt meddelande, annars skrivs det ut hur många dagar det är kvar till fredag. 

Tanken är att du gör en riktigt galen sida med hjälp av CSS, stort och annorlunda typsnitt, någon fredags bild och kanske inkluderar en fredagsvideo om det är fredag.



### Månadskalender {#manadskal}

Du skall göra en månadskalender som har ett liknande utseende som följande kalender.

[FIGURE src=image/webtec/programmera/month_cal.jpg?w=w3 caption="En månadskalender."]

Den skall göras i en HTML tabell och försök likna ovan kalender så gott det går. 



### Tips, trix och livlinor {#livlina}

I GitHub issuen "[Tips, trix och show-off från kmom03 med "Idag är det fredag" och "Månadskalender"](https://github.com/dbwebb-se/webtec/issues/15)" finns det en del inspiration och tips och trix till hur man kan tänka och vilka eventuella svårigheter som finns i uppgiften.

Den bästa taktiken är troligen att först lösa `friday.php` och därefter ta sig an `month.php`. De saker man lär sig i friday kommer att användas i month.

Det finns en livlina till `friday.php`i form av en video "[Kmom03: Mikael visar hur man kan komma igång och lösa uppgiften med friday.php](https://www.youtube.com/watch?v=APLHs5D94YI)" som visar i detalj hur man kan tänka, men den bör du bara titta på om du verkligen fastnar på uppgiften.

Det finns även två livlinor till `month.php` i form av videor, men även de bör du enbart titta på om du fastnar när du försöker lösa uppgiften.

* [Kmom03: Kom igång att lösa uppgiften med månadskalendern och month.php](https://www.youtube.com/watch?v=px0TlLwMpeA)
* [Kmom03: Hur tänka när man skall loopa igenom alla dagar i en månad och skriva ut en tabell month.php](https://www.youtube.com/watch?v=4G3JsRx24s8)

Kom ihåg, samtliga konstruktioner som du behöver för att lösa uppgiften är omnämnda i övningen i någon omfattning.



Krav {#krav}
-----------------------

Utför följande krav.

1. Skapa en sidkontroller `public/friday.php` som gör en riktigt galen sida genom att styla den med CSS på alla möjligt galna sätt. Placera sidan i navbaren. Sidan skall kontrollera om det är fredag idag. Om det är fredag skrivs det ut i stora tecken, galna färger kompletterade med bilder och videor. Om det inte är fredag skrivs det ut hur många dagar det är tills fredag.

1. Lägg till möjligheten att skicka in ett datum via querysträngen till fredags-sidan via `friday.php?date=2022-08-27` för att på det viset kunna testa sidan med olika datum och se vad som händer när det är fredag, även när det inte är fredag.

1. Skapa en sidkontroller `public/month.php` som visar en månadskalender i en HTML tabell enligt beskrivningen och bild ovan. Placera sidan i navbaren. Styla sidan så att den ser tilltalande ut, använd din egen stil. Överst i sidan skapar du ett HTML GET formulär som ger möjligheten att skriva in ett datum, när man postar formuläret så visas en månadskalender för den månaden som datumet tillhör. Använd "self submitting" formulär.

1. Månadskalendern skall innehålla en rubrik där år och månad skrivs ut. På varje rad skrivs datum ut tillsammans med vilken dag det är. Söndagar markeras med rött. Veckonumret skrivs ut på varje måndag. För varje dag, skriv ut vilket dagnummer det är för året (1-365/366). Du kan se [bilden ovan](#manadskal) för att inspireras av den.

1. Skriv alltid ut veckonumret på första dagen i månaden, även om det inte är en måndag.

1. Månadskalendern skall innehålla en länk som leder till nästa/föregående månad.

1. Kontrollera att dina sidkontroller passerar Unicorn validatorn. Om du har några valideringsfel på CSS kan det ibland vara okey, men du bör inte ha något valideringsfel på HTML.


<!--
Extrauppgift {#extra}
-----------------------

Gör följande extrauppgifter om du har tid, lust och energi.

1. Skriv allt
-->



Publicera {#publicera}
-----------------------

Avsluta uppgiften så här.

1. Kontrollera för dig själv att du har utfört samtliga krav.

1. Validera din PHP-kod med `dbwebb validate report`, rätta de valideringsfel du har.

1. När du är klar kan du publicera resultatet med `dbwebb publish report`. Se till att du inte har några valideringsfel.

1. Testa ditt resultat så att det passerar de automatiska testerna med `dbwebb test kmom03`.
