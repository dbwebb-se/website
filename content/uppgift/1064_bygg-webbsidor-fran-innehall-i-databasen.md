---
author:
    - mos
category:
    - php
    - kurs oophp
    - anax-lite
    - sql
revision:
    "2020-05-11": "(C, mos) Rätta länk till databas-artikeln."
    "2018-04-30": "(B, mos) Genomgången inför oophp-v4."
    "2017-04-18": "(A, mos) Första utgåvan."
...
Bygg webbsidor från innehåll i databasen
==================================

Du skall bygga tabell(er) i en databas tillsammans med klasser i din redovisa-sida för att implementera stöd för sidor och bloggposter som sparas i databasen och kan redigeras av en användare.

Texten som du lagrar i databasen kör du igenom ett antal filter som formatterar din text innan den visas.

Det du skapar är egentligen ett litet CMS (Content Management System).

<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har jobbat igenom artikeln "[Lagra innehåll i databas för webbsidor och bloggposter (v2)](kunskap/lagra-innehall-i-databas-for-webbsidor-och-bloggposter-v2)".

Du har löst uppgiften "[Skapa en klass för textfiltrering och formattering (v2)](uppgift/skapa-en-klass-for-textfiltrering-och-formattering-v2)".



Introduktion {#intro}
-----------------------

Du skall bygga in hantering för innehåll i din redovisa sida. Det skall fungera (ungefär) på motsvarande sätt som det gjorde i artikeln om sidor och bloggposter.

Du har full frihet hur du väljer att integrera det i ditt ramverk.

Tips. Förslagsvis bygger du en generell Content-klass och specifika klasser för Page och Blog, men du väljer strukturen helt själv. Försök att få lite kod i dina routes och lägg huvuddelen av koden i klasser som eventuellt går att återanvända utanför ramverket.



Krav {#krav}
-----------------------

1. Spara din SQL-kod som sätter upp tabell och initialt innehåll i `sql/content/setup.sql`.

1. Det skall finnas en administrativ del där användaren kan skapa, uppdatera och radera innehåll (CRUD) i webbplatsen.

1. I din översikt av innehållet visar du minst innehållets id, titeln, published, created, updated, deleted, path och slug.

1. Det skall finnas (någon enkel form av) felhantering om det finns två likadana slugs.

1. Det skall finnas felhantering så att man kan ha en tom path.

1. Användaren skall kunna fylla i vilka textfilter som skall användas och du skall filtrera/formattera texten med din klass motsvarande `TextFilter`.

1. Skapa routes för att visa att dina `page` och `post` fungerar. Gör en egen landningssida på din redovisa-sida, så att det är enkelt att testa och se att både sidor, bloggposter och en översikt av bloggposterna syns.

1. Validera och publicera din kod.



Extrauppgift {#extra}
-----------------------

Det finns många små saker man kan jobba med när det gäller innehåll som sparas i databasen. Se om något av dem faller dig i smaken. Jobba på om du har tid och lust.

1. Om du lägger inloggning så se till att din databas innehåller en användare doe med lösenord doe och en användare admin med lösenord admin.

1. Skapa en ytterligare typ av innehåll som `block`. Tanken är att denna typen av innehåll kan finnas som en del i en sida, till exempel i en sidebar, en flash, en triptych, navbar, header eller en footer.

1. Skapa en möjlighet att se de sidor som ännu inte är publicerade samt de som är raderade. Denna möjlighet kan kräva inloggning (eller inte).

1. Skapa en funktion för att återställa det content som är raderat.

1. Skapa funktioner så att endast ingressen (första delen av bloggposten) visas i översikten samt lägg till en länk för "Läs mer »".

1. Använd ett _flash-minne_ i sessionen för att skriva ut information och återkoppla till användaren när innehåll raderas, skapas, sparas. Det är för att göra gränssnittet tydligare för användaren.

1. Lägg till paginering och sortering på ditt administrativa gränssnitt för innehållet.

1. Lägg till så att ett innehåll är kopplat till en viss användare som blir dess författare (kräver databastabeller för användaren och inloggning).



Tips från coachen {#tips}
-----------------------

Väg tiden du har till förfogande, mot snabba lösningar kontra återanvändbar kod.

Lycka till och hojta till i forumet om du behöver hjälp!
