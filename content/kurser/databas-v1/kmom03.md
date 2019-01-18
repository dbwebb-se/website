---
author: mos
revision:
    "2018-12-19": "(prel, mos) Gulmarkerat inför vt18."
    "2018-12-19": "(B, mos) Uppdaterat läsanvisning utgåva 2 av kursbok."
    "2018-01-05": "(A, mos) Första utgåvan."
...
Kmom03: ER-modellering
====================================

[WARNING]

**Översikt pågår**

Kursmomentet är under översyn inför vårterminen 2019.

[/WARNING]

Vi övar i hur man modellerar och bygger upp en databas, det som kallas Entity-Relationship modelling, ER-modellering, eller bara databasmodellering. Vi delar in modelleringen i konceptuell, logisk och fysisk modellering.

Vi jobbar vidare med SQL och tränar mer på utmanande saker som subqueries, JOIN och LEFT/RIGHT OUTER JOIN.

Vi bygger vidare på våra terminalskript i JavaScript och Node.js och bygger en mer potent klient som kan utföra olika saker mot databasen.

<!--more-->

[FIGURE src=image/kunskap/kokbok-databasmodellering/image02.jpg?w=w3 caption="Databasmodellering av en filmdatabas."]

[FIGURE src=image/kunskap/kokbok-databasmodellering/image00.jpg?w=w3 caption="Databasmodellering fortsätter och närmar sig strukturen av tabeller."]

[FIGURE src=image/snapvt18/guess-my-number-terminal.png?w=w3 caption="En terminalklient som visar hur man skapar en kommandoloop med JavaScript i Node.js."]

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Läs &amp; Studera  {#lasanvisningar}
---------------------------------

*(ca: 8-10 studietimmar)*


###Kurslitteratur  {#kurslitteratur}

Läs följande:

1. [Databasteknik](kunskap/boken-databasteknik)
    * Kap 8: (repetera) Mer om SQL: Aggregatfunktioner, null-värden, yttre join
    * Kap 2: ER-modellering
    * Kap 4: Designpocessen
    * Kap 5: Relationsmodellen
    * Kap 6: Översättning från ER-modellen till relationsmodellen

En översikt av kapitel ovan  finns i [bokens webbkurs](http://www.databasteknik.se/webbkursen/), del 1.

Det finns ytterligare kapitel i boken som är relaterat till modellering. De går utanför kursens ram men läs vid intresse.

1. [Databasteknik](kunskap/boken-databasteknik)
    * Kap 3: Mer om datamodellering
    * Kap 12: Normalformer och normalisering



###Artiklar {#artiklar}

Läs igenom följande artiklar.

1. Jobba igenom artikeln "[Kokbok för databasmodellering](kunskap/kokbok-for-databasmodellering)", den ger dig en metod för att modellera databaser i olika faser. Du kommer jobba enligt denna modellen i uppgiften.

1. Som ett komplement till kokboken kan du titta på [föreläsningen om ER-modellering och implementation av en E-shop](https://youtu.be/fqC_VQh_E74?start=886&end=4065) (längd 53 minuter). Det sätter ord på kokboken och ger dig träning inför ER-uppgiften där du skall modellera en E-shop.



###Lästips {#tips}

Följande kan du använda för att fördjupa dig i ER-modellering, läs som överkurs vid intresse.

1. [IBM Entity Relationship Modeling with UML](http://www.ibm.com/developerworks/rational/library/319.html).

<!--
Modelleringsövningsuppgifter 
https://docs.google.com/document/d/1kKoSO2BQL5T2cnzshpM_hnk5JbqT0_00khfGJKZQ2Fo/edit

Gjort modelleringsövning i sal med draw.io: https://goo.gl/vNRvKt
-->



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 8-10 studietimmar)*



###Övningar {#ovningar}

Genomför följande för att förbereda inför uppgifter.

1. Jobba igenom artikeln "[Gör en kommandoradsklient i Node.js (v2)](kunskap/gor-en-kommandoradsklient-i-node-js-v2)". Spara alla filer du gör i `me/kmom03/cli`.

<!--
1. ER-modellering. Gör några extra övningar från övningsfilen (skall redovisas isåfall uppgift).
Svårt göra övning per distans.

1. Normalisering
-->



###Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Jobba igenom delen "Koppla tabeller" av guiden "[Kom igång med SQL i MySQL (Koppla tabeller)](guide/kom-igang-med-sql-i-mysql/koppla-tabeller)". Fortsätt spara all SQL-kod i filer i katalogen `me/skolan`.

1. Gör uppgiften "[Node.js terminalprogram mot MySQL med kommandoloop](uppgift/nodejs-terminalprogram-mot-mysql-med-kommandoloop)". Spara alla filer i `me/kmom03/terminal2`.

1. Gör uppgiften "[Skapa ER-modell för en databas (konceptuell)](uppgift/skapa-er-modell-for-en-databas-konceptuell)". Visa att du kan jobba enligt en metod för att skapa en databasmodell och redovisa i ett dokument. Detta är första delen av uppgiften som slutförs i kommande kursmoment. Spara allt du gör i `me/kmom03/er1`.


<!--
1. Gör laborationen "[Node.js och inbyggda moduler (node2)](uppgift/nodejs-inbyggda-moduler)" för att träna på inbyggda moduler i Node.js. Spara koden i `me/kmom04/node2`.

1. Enkel SQL laboration som visar att studenten kan göra joins/subquery.

1. SQL injections (terminal)
-->



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

* Några generella reflektioner på att skriva och jobba med terminalprogram i JavaScript och Node.js?
* Lyckas du få till bra kodstruktur i ditt terminalprogram mot databasen?
* Hur gick det att jobba med ER-modelleringen, några reflektioner?
* Fanns det några extra svårigheter du kämpade med i kursmomentet?
* Vilken är din TIL för detta kmom?
