---
author: mos
category:
    - kurs webtec
revision:
    "2022-10-07": "(D, mos) Länk till tips och trix."
    "2022-09-20": "(C, mos) Stavning."
    "2022-09-14": "(B, mos) Genomgången och tog bort galleriuppgiften."
    "2022-08-11": "(A, mos) Första utgåvan till webtec-v2."
...
Bygg en månadskalender och ett gissningsspel med PHP datastrukturer
===================================

Du skall bygga ut din webbplats och dels skapa en almanacka i form av en månadskalender med bilder och dels skall du göra ett litet gissningsspel. I övningen kommer du att få jobba med att organisera ditt PHP-kodande och jobba med bland annat arrayer och funktioner.

Du kommer också få träna på HTML formulär med POST och sessioner.

Du jobbar i din tidigare struktur av sidkontrollers och vyer och bygger ut din befintliga webbplats.

<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har jobbat igenom övningen "[Programmera din webbsida med PHP datastrukturer](kunskap/programmera-din-webbsida-med-php-datastrukturer)" och du har därmed fått en bra start inför uppgiften.



<!--
Genomgång {#genom}
------------------------

Här är en video som "pratar" dig igenom uppgiftens upplägg och visar hur du kommer igång.

[YOUTUBE src="gKzwQTG9eCI" width=700 caption="Kurs mvc kmom03 tisdagsgenomgång, del 3/3 uppgiften (Zoom med Mikael)."]
-->



Introduktion och förberedelse {#intro}
-----------------------

Om du har jobbat igenom övningen så är du förberedd för uppgiften och du har tränat på de begrepp som används för att lösa uppgiften.

I denna uppgiften kan du troligen återanvända en del av den koden du gjorde i förra uppgiften om en kalender. Se om du kan återanvända koden på ett bra sätt. Kanske kan du till och med överväga att flytta vissa delar till funktioner, om du känner dig bekväm med det.



### Struktur {#struktur}

Du jobbar vidare med strukturen med sidkontrollers och vyer när du löser uppgiften.

Du skall också organisera din kod i funktioner, om och när du anser att det passar.



### Funktioner för namn {#namn}

I ditt kursrepo finns PHP-funktioner och data som kan läsa in namnsdagar och namnens betydelse. Du behöver de funktionerna och de filerna för att kunna utföra uppgiften.

Gör så här i din terminal.

```text
# Ställ dig i rooten av kursrepot

# Börja att kopiera datafilerna som innehåller detaljer om namn
mkdir me/report/data
cp example/database/data/Svenska_akademin_namn*.csv me/report/data

# Kopiera funktionerna som kan läsa in namnfilerna och skapa arrayer av dem
cp example/database/src/calendar.php me/report/src
```

Inkludera nu filen `src/calendar.php` i din `config/config.php`.

Titta på funktionerna i filen. Prova att anropa dem och skriva ut innehåll i det som funktionerna returnerar med en var_dump i en sidkontroller, bara för att se att du kan använda dem och du kan se vad de innehåller.



### Tips, trix och livlinor {#livlina}

I GitHub issuen "[Tips och trix till kmom04 och fotokalendern](https://github.com/dbwebb-se/webtec/issues/16)" finns det en del inspiration och tips och trix till hur man kan tänka och vilka eventuella svårigheter som finns i uppgiften.



Krav {#krav}
-----------------------

Utför följande krav.


### Krav 0: Övningen {#ovningen}

Från övningen förutsetts att du har följande implementerat.

1. En sidkontroller `public/session.php` där du kan visa detaljer om sessionen, dess innehåll och att du kan förstöra sessionen. Denna sidkontroller är synlig i din navbar.

1. Filen `src/functions.php` med funktioner för att förstöra sessionen och för att jobba med flashmedelanden via sessionen.



### Krav 1: Almanacka med bild {#manadskal}

Du skall göra en årsalmanacka för årets 12 månader i innevarande år där du visar en månad tillsammans med en bild, en så kallad fotokalender.

<!--
Använd bara date=2022-06-01, inte month.
-->
Gör en sidkontroller `photocal.php` som tar ett argument via querysträngen `?month=6` och därefter visas månaden juni upp tillsammans med en bild. Skickar man in `?month=7` så visas juli upp och missar man att skicka in något alls så visas aktuell månad. Du kan också välja att skicka in både månad och år via querysträngen, det är upp till dig hur du konstruerar querysträngen.

Skapa en länk så att man kan navigera till nästa och föregående månad. När du kommer till månad 12 och klickar nästa så tar det antingen stopp, eller så byter du år - det är upp till dig att välja taktik.

Placera en länk till sidkontrollern i navbaren.

Tanken är att din almanacka har följande utseende.

[FIGURE src=image/webtec/phpstruct/fotokalender.png caption="En fotokalender i form av en årsalmanacka."]

I kalendern visar du vecka för vecka med sitt veckonummer, datum för dagen och månadens namn. För varje dag, skriv ut vilket dagnummer det är för året (1-365/366). Du kan även välja att visa mer information om du vill.

Se till att söndagar är röda i din style.

<!--
Se till att din kalender börjar på en måndag. Om månaden inte börjar på en måndag så visar du datum från den sista veckan på föregående månad.

Se till att kalendern avslutas på en söndag. Om den aktiella månaden inte avslutar med en söndag så visar du dagar från kommande månad tills det blir söndag.
-->

<!--
* Använd minst 4/12 olika bilder.
-->

**EXTRA**

Gör bara detta om du känner att du har tid, lust och energi.

Placera in namnen på de som har namnsdagar på rätt plats i kalendern. Du har en funktion i `src/calendar.php` som kan ge dig en array som innehåller namn kopplade till ett datum.



### Krav 2: Gissa på dagens namn {#dagensnamn}

Du skall göra ett litet gissningsspel med hjälp av kalenderfunktionen som kan ge dig en array med namnens betydelse. I denna uppgiften får du träna på HTML formulär, POST och SESSION.

Du har en funktion i `src/calendar.php` som kan ge dig en array med alla namn och deras betydelse.

Här är grunden i spelet.

1. Placera din kod i en sidkontroller `public/guessname.php`. Det är där "spelet" börjar.

1. Placera en länk till sidkontrollern i navbaren.

1. Läs in arrayen med namnens betydelse, slumpa fram ett namn i arrayen (array_rand) och skriv ut betydelsen på namnet i sidan. Spara även namnet i sessionen.

1. I sidan, skapa ett formulär med POST där användaren kan gissa på det namn som är kopplat till betydelsen.

1. Skapa en processingsida som kontrollerar om användaren gissade rätt namn. Redirecta till en resultatsida och spara om det var rätt eller fel svar i ett flashmeddelande.

1. I resultatsidan visar du om användaren gissade rätt eller fel. Du kan även visa det namnet som var rätt svar.

1. När man börjar om så plockar du fram ett nytt namn och en ny beskrivning.

**EXTRA**

Om du har idéer och tankar kring hur du kan göra "spelet" mer roligt så får du gärna implementera det. Kanske kan du hitta ett sätt att även använda namnsdagarna och koppla ihop informationen med namn och betydelse. Se om du kan klura ut något.



### Övriga krav {#krav}

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

1. Testa ditt resultat så att det passerar de automatiska testerna med `dbwebb test kmom04`.
