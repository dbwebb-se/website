---
author:
    - mos
category:
    - php
    - kurs mvc
revision:
    "2022-03-23": "(A, mos) Första utgåvan."
...
Bygg en me-sida till mvc-kursen
===================================

[FIGURE src=image/kurs/mvc/kmom01-symfony.png?w=c5 class="right"]

Du skall sätta samman en webbplats som du kan använda som me-sida i kursen. I din me-sida gör du en presentation av kursen, dig själv och du publicerar dina redovisningsstexter.

Du lägger allt i ett Git-repo och när du är klar så publicerar du och taggar ditt repo på GitHub (eller GitLab).

<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du kan navigera bland Git och GitHub.

Du kan installera och använda ramverket Symfony för att skapa en controller och webbsidor som renderas med templatemotorn Twig.



Introduktion och förberedelse {#intro}
-----------------------

Följande steg hjälper dig att komma igång med uppgiften.

* Om du behöver hjälp med Git och GitHub så kikar du på videoserien "[Git, GitHub and GitLab - Learn and practice](https://www.youtube.com/playlist?list=PLEtyhUSKTK3iTFcdLANJq0TkKo246XAlv)".

* Du bör ha jobbat igenom övningen "[Installera och bygga en webbapplikation i Symfony](https://github.com/dbwebb-se/mvc/tree/main/example/symfony)". Den ger dig grunden för att lösa uppgiften.



Krav {#krav}
-----------------------

1. Gör en installation av Symfony och placera den i `me/report`. Den publika webbkatalogen skall ligga som `me/report/public`.

1. Skapa följande webbsidor, använd templatefiler och en templatemotor.

    1. Skapa en route `/` som ger en presentation av dig själv inklusive en bild. Det är okey att vara anonym och hitta på en figur att presentera.
    1. Skapa en route `/about` som berättar om kursen mvc och dess syfte. Länka till kursens Git-repo. Lägg till en representativ bild. Skapa ytterligare en länk som leder till ditt egna GitHub-repo.
    1. Skapa en route `/report` där du samlar dina redovisningstexter för kursens kmom.
        1. Skapa även så att länken `/report#kmom01` leder direkt till kursmomentets redovisningstext.

1. Skapa en enhetlig style till webbplatsen. Du kan använda LESS/SASS eller liknande CSS preprocessorer. Du kan använda CSS ramverk.

1. Sidorna skall ha en enhetlig layout och det skall finns:

    1. En tydlig header överst på varje sida, med eller utan bild.
    1. En navbar som gör att man kan navigera mellan samtliga sidor.
    1. En footer längst ned som visar rimliga detaljer.

1. Skapa ett Git repo av katalogen `me/report`. Koppla samman repot med GitHub, GitLab eller liknande tjänst.

1. Committa alla filer och lägg till en tagg 1.0.0. Om du gör uppdateringar så ökar du taggen till 1.0.1, 1.0.2, 1.1.0 eller liknande.

1. Kör `dbwebb test kmom01` för att kolla att du inte har några fel.

1. Pusha upp repot till GitHub, inklusive taggarna.

1. Gör en `dbwebb publishpure report` för att kolla att det fungerar på studentservern.



Tips från coachen {#tips}
-----------------------

Gör webbplatsen lagom bra. Du kan jobba vidare med webbplatsens struktur, innehåll och utseende under hela kursen.

Lycka till och hojta till i issues eller chat om du behöver hjälp!
