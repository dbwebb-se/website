---
author: mos
revision:
    "2018-12-19": "(prel, mos) Gulmarkerat inför vt18."
    "2018-12-19": "(B, mos) Uppdaterat läsanvisning utgåva 2 av kursbok."
    "2018-02-20": "(A, mos) Första utgåvan."
...
Kmom06: Prestanda
====================================

[WARNING]

**Översikt pågår**

Kursmomentet är under översyn inför vårterminen 2019.

[/WARNING]

Vi fortsätter med programmering i databasen, denna gången med egendefinierade funktioner som har en liknande struktur som lagrade procedurer och triggers.

Sedan studerar vi hur databasen internt jobbar för att optimera de SQL-frågor du skriver och hur du kan använda index för att optimera din databas.

Vi jobbar vidare med terminal- och webbaserade klienter mot databasen och förhoppningsvis har vi fått en allt bättre koll på JavaScript-koden.

<!--more-->

[FIGURE src=image/snapvt17/mysql-optimize.png?w=w3 caption="Optimering av en databas sker på många olika nivåer."]

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Läs &amp; Studera  {#lasanvisningar}
---------------------------------

*(ca: 4-10 studietimmar)*


### Kurslitteratur  {#kurslitteratur}

Läs följande:

1. [Databasteknik](kunskap/boken-databasteknik)
    * Kap 9: Sammanfattning av SQL-kommandon
    * Kap 22: Index och prestanda

Vissa av kapitlen finns i [bokens webbkurs](http://www.databasteknik.se/webbkursen/), del 2.

Det finns ytterligare ett kapitel i boken som är relaterat till prestanda, det går utanför kursens ram men läs vid intresse.

1. [Databasteknik](kunskap/boken-databasteknik)
    * Kap 23: Fysiska lagringsstrukturer i databaser


<!--
Saker vi inte hanterat:

* Kap 13: Säkerhet i databaser
-->



### Artiklar {#artiklar}

Läs följande.

1. Bekanta dig översiktligt med de olika delarna av manualen i [MySQL om optimering](https://dev.mysql.com/doc/refman/5.7/en/optimization.html). Se vilka delar som kan optimeras och på vilket sätt. Skumma igenom de olika delarna.

1. Läs igenom foruminlägget om "[Vad välja som primärnyckel till en databastabell](t/6439)?", det ger en orientering i hur man kan tänka när man väljer primärnyckel i en tabell.



### Extra  {#extra}

Gör följande om du har tid och lust.

1. Kika på foruminlägget "[Exempelkod Node.js, Express, MySQL och login med sessioner](t/7327)" som visar hur du löser login med sessionshantering i Express.



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 8-10 studietimmar)*



### Övningar {#ovningar}

Genomför följande övning för att förbereda inför uppgifterna.

1. Jobba igenom "[Egendefinierade funktioner i databas](kunskap/egen-definierade-funktioner-i-databas)" för att lära dig hur konceptet kan användas i en databas. Spara dina exempelprogram i `me/kmom06/func`.

1. Jobba igenom övningen "[Index och prestanda i MySQL](kunskap/index-och-prestanda-i-mysql)" som tränar dig i hur du kan optimera dina databasfrågor med index. Spara dina testprogram i `me/kmom06/index`.

<!--
1. Artikel om hur man skriver bra SQL frågor på ett optimerat sätt.

1. Inloggning, session, express.

1. Usability with messages on what happens.

1. Faktureringsmotor?

1. Exportera data från webben till csv?

1. Visualisering i tabeller via JavaScript libs.
-->



### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Jobba igenom följande del i guiden "[Kom igång med SQL i MySQL (Programmera i databasen)](guide/kom-igang-med-sql-i-mysql/programmera-i-databasen)". Fortsätt spara SQL-koden i filer i katalogen `me/skolan`.

1. Lös uppgiften "[Bygg kursbeställningsverktyg till skolan](uppgift/bygg-bestallningsverktyg-till-skolan)". Spara all kod i katalogen `me/kmom06/bestall`.



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

* Förklara begreppet index i databas, och varför det är viktigt, på ett par rader.
* Hur ser du på att programmera i databasen på det viset vi gör, fördelar och nackdelar, bra eller dåligt?
* Se tillbaka på de kmom du gjort, känner du att du har koll på databas nu, eller känner du att något saknas eller behövs tränas ytterligare?
* Nu när kursen närmar sig slutet, hur är din relation till JavaScript, Node och Express?
* Vilken är din TIL för detta kmom?
