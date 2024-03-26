---
author:
    - mos
category:
    - php
    - kurs mvc
revision:
    "2024-03-26": "(C, mos) Krav indelade i rubriker och aningen justerade."
    "2023-03-28": "(B, mos) Uppdaterad inför vt23."
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

Du kan installera och använda ramverket Symfony för att skapa en webbplats. Du använder controller och webbsidor som renderas med templatemotorn Twig.



Introduktion och förberedelse {#intro}
-----------------------

Följande steg hjälper dig att komma igång med uppgiften.

Du bör ha jobbat igenom övningen "[Get going with Symfony](https://github.com/dbwebb-se/mvc/tree/main/example/symfony)". Den ger dig grunden för att lösa uppgiften.



### Gör ett Git repo {#git}

Gör ett git-repo av katalogen.

```text
# Gå till me/report
git init
touch README.md
git add .
git commit -m "First commit"
```

Du har nu ett git-repo. Vill du lära dig mer om Git kan du läsa mer i "[Work with Git](https://dbwebb-se.github.io/mvc/work-with-git)" som ger dig en snabb introduktion till de vanligaste kommandona i Git.

Om något går fel kan du alltid ta bort katalogen `.git/` och starta om.

```text
# me/report
rm -rf .git
```



### GitHub/GitLab {#github}

Ladda upp ditt repo till en webbtjänst likt GitHub eller GitLab (eller motsvarande).

Det mest lämpliga är att använda SSH-nycklar för att identifiera dig, det blir så mycket enklare än HTTPS där du behöver skriva lösenord varje gång du laddar upp repot.

Om du behöver mer hjälp med Git och GitHub så kikar du på videoserien "[Git, GitHub and GitLab - Learn and practice](https://www.youtube.com/playlist?list=PLEtyhUSKTK3iTFcdLANJq0TkKo246XAlv)".



Krav {#krav}
-----------------------

Kraven är uppdelad i delar.



### Webbplats med Symfony {#w}

1. Gör en installation av Symfony och placera den i `me/report`. Den publika webbkatalogen skall ligga som `me/report/public`.

1. Skapa följande webbsidor, använd controller, templatefiler och en templatemotor, förslagsvis Twig.

    1. Skapa en route `/` som ger en presentation av dig själv inklusive en bild. Det är okey att vara anonym och hitta på en figur att presentera.
    1. Skapa en route `/about` som berättar om kursen mvc och dess syfte. Länka till kursens Git-repo. Lägg till en representativ bild. Skapa ytterligare en länk som leder till ditt egna GitHub-repo. Sidan skall ha två kolumner.
    1. Skapa en route `/report` där du samlar dina redovisningstexter för kursens kmom.
        1. Skapa även så att länken `/report#kmom01` leder direkt till kursmomentets redovisningstext.

1. Skapa en ny route `/lucky` som visar något dynamiskt värde när man laddar om sidan tillsammans med en/flera bilder. Det kan vara ett "lucky number" men kanske kan du hitta på något annat spännande att visa upp i sidan. Gör sidan lite snygg och stylad, kanske till och med lite "crazy". Se om du kan vara lite kreativ.

1. Skapa en tilltalande och enhetlig style till webbplatsen. Du kan använda LESS/SASS eller liknande CSS preprocessorer. Du kan använda CSS ramverk. Fundera och gör ett val.

1. Sidorna skall ha en enhetlig layout och det skall finns:

    1. En tydlig header överst på varje sida, med eller utan bild.
    1. En navbar som gör att man kan navigera mellan samtliga sidor.
    1. En footer längst ned som visar rimliga detaljer.



### JSON API

1. Skapa en landningssida för routen `api/` som visar en webbsida med en sammanställning av alla JSON routes som din webbplats erbjuder.

1. Skapa en route `/api/quote` där du ger ett JSON svar som innehåller dagens citat. Växla slumpmässigt mellan (minst) tre olika citat som du själv hittat på eller lånat av någon. JSON svaret skall även innehålla dagens datum och en tidsstämpel för när svaret genererades. Denna route ger alltså enbart ett JSON svar och inkluderar inte någon gemensam sidlayout som header, footer.



### Git repo på GitHub/GitLab

1. Skapa ett Git repo av katalogen `me/report`. Koppla samman repot med GitHub, GitLab eller liknande tjänst.

    1. Se till att göra början på en snygg och innehållsrik README fil. Lägg till en bild överst i filen och tydliga rubriker samt en instruktion om hur man klonar repot och kommer igång med att köra webbplatsen.

    1. Committa alla filer och lägg till en tagg 1.0.0. Om du gör uppdateringar så ökar du taggen till 1.0.1, 1.0.2, 1.1.0 eller liknande.

    1. Pusha upp repot till GitHub, inklusive taggarna.



### Testa och publicera

1. Kör `dbwebb test kmom01` för att kolla att du inte har några uppenbara fel.

    1. Gör en `dbwebb publishpure report` för att kolla att det fungerar på studentservern.



Tips från coachen {#tips}
-----------------------

Gör webbplatsen lagom bra - väg hur mycket tid du har tillgängligt. Du kan jobba vidare med webbplatsens struktur, innehåll och utseende under hela kursen. Det behöver inte vara perfekt i kmom01.

Lycka till och hojta till i issues eller chat om du behöver hjälp!
