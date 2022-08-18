---
author: mos
category:
    - kurs webtec
revision:
    "2022-08-11": "(A, mos) Första utgåvan till webtec-v2."
...
Programmera din rapportsida till webtec-kursen (kmom04)
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



### Är det fredag? {#fredag}

I uppgiften kommer du bygga en webbsida för att kolla om det är fredag idag och isåfall skrivs det ut ett trevligt meddelande, annars skrivs det ut hur många dagar det är kvar till fredag. 

Tanken är att du gör en riktigt galen sida med hjälp av CSS, stort och annorlunda typsnitt, någon fredags bild och kanske inkluderar en fredagsvideo om det är fredag.



### Månadskalender {#manadskal}

Du skall göra en månadskalender som har ett liknande utseende som följande kalender.

[FIGURE src=image/webtec/programmera/month_cal.jpg?w=w3 caption="En månadskalender."]

Den skall göras i en HTML tabell och försök likna ovan kalender så gott det går.



Krav {#krav}
-----------------------

Utför följande krav.

1. Skapa en sidkontroller `public/friday.php` som gör en riktigt galen sida genom att styla den med CSS på alla möjligt galna sätt. Placera sidan i navbaren. Sidan skall kontrollera om det är fredag idag. Om det är fredag skrivs det ut i stora tecken, galna färger kompletterade med bilder och videor. Om det inte är fredag skrivs det ut hur många dagar det är tills fredag.

1. Lägg till möjligheten att skicka in ett datum via querysträngen till fredags-sidan via `friday.php?date=2022-08-27` för att på det viset kunna testa sidan med olika datum och se vad som händer när det är fredag, även när det inte är fredag.





<!--

Ny sida galleri med sex-12 olika bilder i en flexbox med tre kolumner och två rader.

Flytta hela kalendergreejen till nästa kmom eller lägg in table här? Kanske hitta en bild på en månadskalender och be att göra exakt samma?
-->

Utför följande krav.

1. Spara alla dina stylesheets under `public/css`. Förslagsvis har du en liknande struktur som finns i övningen men du kan själv välja hur du fördelar din CSS-kod i filer, du behöver dock minst ha filen `public/css/style.css` på plats.

1. Gör ett noga övervalt val av vilka typsnitt (font-family) som du använder och välj olika typsnitt för rubriker och text. Det sägs ge ett bra utseende om man gör så. Din header kan du styla till lite extra med typsnitten. Du har ett exempelprogram i kursrepot under `example/css/font-family` som visar olika fonter och hur man importerar externa fonter som till exempel fria Google fonter.

1. Styla din navbar.

1. Styla din header med en "logo", titel, undertitel och en bakgrund som kan vara en färg eller en bild.

1. Styla din footer i tre kolumner och en underliggande rad.

1. Dina sidkontroller me, about, report skall alla ha en liknande stylad struktur av main, article och eventuellt en aside.

1. Sidkontrollern about skall vara indelad i två kolumner och ha sin aside kolumn till höger.

1. Sidkontrollern report skall vara indelad i två kolumner och ha sin aside kolumn till vänster som innehåller artikelns "innehållsförteckning".

1. Sidkontrollern report skall ha en byline.

1. Din byline skall innehålla en bild och lite text och vara stylad. Du skall också placera innehållet i din byline i en vy under `view/byline.php` och inkludera den där den används.

1. Styla till din sidkontroller today och försök att göra en "crazy" sida där du visar upp dagens datum och veckodag. Lek med CSS konstruktionerna.

1. Kontrollera att dina sidkontroller passerar Unicorn validatorn. Om du har några valideringsfel på CSS kan det ibland vara okey, men du bör inte ha något valideringsfel på HTML.



Publicera {#publicera}
-----------------------

Avsluta uppgiften så här.

1. Kontrollera för dig själv att du har utfört samtliga krav.

1. När du är klar kan du publicera resultatet med `dbwebb publish report`.

1. Testa ditt resultat så att det passerar de automatiska testerna med `dbwebb test kmom03`.
