---
author: mos
category:
    - javascript
    - nodejs
    - mysql
    - express
    - er-modellering
    - kursen databas
revision:
    "2022-03-09": "(H, mos) Man måste inte kunna beställa fler produkter än det finns på lagret."
    "2022-02-27": "(G, mos) Genomgången inför v2."
    "2019-03-20": "(F, mos) Tips om order_status via foruminlägg."
    "2019-03-20": "(E, mos) Tips om TIMESTAMPS går nu till artikel."
    "2019-03-12": "(D, mos) Stycke om karaktäristik på funktioner."
    "2019-03-12": "(C, mos) Lade till video som visar studexempel."
    "2019-03-04": "(B, mos) Status är Skickad, inte Levererad."
    "2019-02-25": "(A, mos) Första utgåvan, sammanslagen av tre andra uppgifter och vidarutvecklad."
...
Bygg databasen till en Eshop (del 2)
==================================

Du har utfört en ER-modellering av en databas för en Eshop som du också har påbörjat att implementera i en databas med en webbklient och en terminalklient.

Du skall nu jobba vidare med implementationen av din databas.

Du kan utföra denna uppgift enskilt, eller i samma grupp som du tidigare jobbat i.

<!--more-->

Alla lämnar in en egen lösning i sitt kursrepo, även om man jobbat i grupp.



Förkunskaper {#forkunskaper}
-----------------------

Du har utfört uppgiften "[Bygg databasen till en Eshop (del 1)](uppgift/bygg-databasen-till-en-eshop-del-1)".

Du har utfört övningarna "[Egendefinierade funktioner i databas](kunskap/egen-definierade-funktioner-i-databas)" och "[Index och prestanda i MySQL](kunskap/index-och-prestanda-i-mysql)" så du vet innebörden av egendefinierade funktioner och index.



Introduktion {#intro}
-----------------------

Du bygger vidare på det du gjorde i del 1 av uppgiften. Ta en kopia av din gamla katalog och fortsätt utveckla.



### Exempel på studentinlämning {#exempel}

Här kan du se ett exempel på en studentinlämning.

[YOUTUBE src=PnQgc7sc3JU width=730 caption="Mikael rättar en studentinlämning för uppgiften eshop2 i kmom06."]



### Kodstandard små bokstäver {#sma}

Kom ihåg att vi använder en kodstandard som säger små bokstäver på tabeller, vyer, procedurer, triggers och kolumnnamn.

Ett av de vanligaste felen som ger komplettering är att man mixat stora och små bokstäver i namngivningen av databasobjekten och man är sedan inte konsekvent när man använder databasen i skript eller i JavaScript koden.



### Funktioner skall ha karaktäristik {#kara}

Ett vanligt fel när man definierar databasfunktioner är att man missar att ange en karaktäristik på dem.

> ERROR 1418 (HY000) at line XXX: This function has none of DETERMINISTIC, NO SQL, or READS SQL DATA in its declaration a
nd binary logging is enabled (you *might* want to use the less safe log_bin_trust_function_creators variable)

Får du detta felet så har dina databas-funktioner inte karaktäristik angiven. Uppdatera din kod så att funktionen använder en relvant karaktäristik.

<!--
För detaljer kan du se forumet "[Error Code: 1418. This function has none of DETERMINISTIC...](t/8419)".
-->



### Backup med lagrade procedurer {#backproc}

När du tar din backup måste du ange `--routines` så att dina lagrade procedurer följer med.

```text
# Utan lagrade procedurer
mysqldump --result-file=eshop.sql eshop

# Med lagrade procedurer
mysqldump --routines --result-file=eshop.sql eshop
```

Ett vanligt fel som leder till komplettering är att man missat skicka med de lagrade procedurerna i sin backupfil. Du kan alltid verifiera din backupfil mot en annan databas eller öppna den i texteditorn och skrolla längst ned i filen för att se att de lagrade procedurerna följde med.



### Testa din lösning {#test}

När du är helt klar med uppgiften så är det ett par saker som du kan göra för att testa din inlämning. Detta testar inte allt, men det är ett minimum av ett flöde som skall fungera.

1. Dubbelkolla att du har en aktuell databasdump.

I webbklienten:

1. Kolla översikt av kunder.
1. Skapa en order till en kund.
1. Beställ ett par befintliga/nyskapade produkter.
1. Försök beställ fler än det finns i lagret, av någon produkt (och se om det går eller inte).
1. Beställ ordern.
1. Kolla orderns status.
1. Se en översikt av alla ordrar.
1. Klicka på ordern och se detaljer om den.

I terminalklienten.

1. Sök efter ordern du nyss skapade.
1. Kolla orderns status.
1. Skapa en plocklista till ordern.
1. Det skall gå att se om beställt antal matchar mot antal i lager.
1. Skeppa/skicka iväg ordern.
1. Kolla orderns status.



Krav {#krav}
-----------------------

Uppgiften är indelad i tre huvudsakliga delar, en generell del inklusive databasdetaljer, en för webbklienten och en för terminalklienten.

<!--

Förtydliga att det måste finnas kunder inlagda i databasen.

Och ordrar med olika status

Och produkter på lagret.

-->

### Generella krav {#gen}

1. Du behöver uppfylla de krav du hade i del 1 av uppgiften.

1. En order skall ha kolumner med tidsstämplar för när ordern skapades (1), när ordern senast uppdaterades (2), när/om ordern raderats (_soft delete_) (3), när/om ordern beställts (4) och när/om ordern skickats till kund (5). Se "Tips från Coachen" nedan, om tidsstämplar.

1. Skapa en egendefinierad funktion `order_status()` som tar nödvändiga argument av tidsstämplar och returnerar en sträng med någon av statusen "Skapad", "Uppdaterad", "Raderad", "Beställd" eller "Skickad". Visa den status som är mest aktuell och viktigast.

1. Databasen skall innehålla egenskapade INDEX på minst ytterligare två platser, förutom primärnycklar och främmande nycklar. Analysera var INDEX kan passa in och inför dem.

1. Databasen måste innehålla grunddata med en handfull kunder och produkter som finns på lagret. Du behöver även lägga in ett antal ordrar som har olika status. Dessa grunddata underlättar när man testar din lösning.



### Webbklient {#webb}

1. Du behöver uppfylla de krav du hade i del 1 av uppgiften.

1. Skapa en sida `/eshop/customer` som visar en översikt av de kunder som finns. Visa (minst) kundens id, namn, adress, telefon.

1. Bygg stöd för att man kan skapa en order till en kund.

1. Bygg stöd för att man kan lägga till produkter och antal (orderrader) till en order.

1. När ordern är komplett och alla orderrader finns med så kan man ändra status på ordern till "Beställd".

1. Skapa en sida `/eshop/order` som visar en översikt av de ordrar som finns. Visa (minst) order id, order datum, kundens id, totalt antal orderrader den innehåller, dess status.

1. Om man klickar på en order kan man se dess detaljer samt en översikt av dess orderrader.

1. Skapa en om-sida på `eshop/about` som visar namnen på de som jobbat (i gruppen) för att lösa uppgiften.



### Terminalklient {#term}

1. Du behöver uppfylla de krav du hade i del 1 av uppgiften.

1. Skapa kommandot `order <search>`. Om man enbart skriver `order` så visas samtliga ordrar (order id, order datum, kund id, antal orderrader, status). Om man skriver `order search` så filtreras resultatet och enbart visar de ordrar som matchar `search` på order id eller kund id.

1. En plocklista kopplar orderrader till en lagerhylla. Tanken är att lagerpersonalen tar en plocklista, åker runt i lagret och packar ihop paketet med samtliga produkter.

1. Skapa kommandot `picklist <orderid>` som visar/genererar en plocklista för vald order och dess orderrader. Varje orderrad, med dessa önskade antal, skall matchas och visas mot en plats i lagret där produkten finns (och dess antal).

1. Om varan inte finns i lagret så skall det tydligt framgå i utskriften. Välj själv hur du vill att det skall presenteras för användaren.

1. Skapa kommandot `ship <orderid>` som ändrar status på en order till "Skickad". Detta innebär att ordern är paketerad och inlämnad till posten för vidare leverans till slutkund. Naturligtvis borde då lagersaldot uppdateras, men det är överkurs och finns som en extra uppgift.

1. Skapa kommandot `about` som visar namnen på de som jobbat (i grupp) för att lösa uppgiften.



### Lämna in {#lamnain}

1. När du är helt klar och har testkört ditt system mot din egen databas, så tar du en backup av databasen med mysqldump och sparar i `sql/eshop/backup.sql`. Använd optionen `--routines` så att procedurerna följer med. Verifiera att backup-filen fungerar och tänk att rättaren kan ladda denna databas för att testköra mot ditt system.

1. Testa och validera din kod.

```text
# Flytta till kurskatalogen
dbwebb test eshop2
dbwebb validate eshop2
```

Rätta eventuella fel som dyker upp och publisera igen. När det ser grönt ut så är du klar.



Extrauppgift {#extra}
-----------------------

Gör följande om du har tid, energi och ro.

1. I webbklienten, gör en snygg sida som visar all information om ordern och samtliga orderrader, precis som det brukar se ut i godtycklig webshop på nätet.

1. I terminalklienten, gör en riktigt snygg och tydlig utskrift av plocklistan och visa tydligt, i utskriften, när en vara inte finns i lagret.

1. När en order ändrar status till "Skickad" så skall lagret uppdateras genom att räkna ned alla antalet produkter som finns i ordern.

1. Lägg till stöd för att radera order via "soft delete" samt möjligheten att göra "undo" på en "soft delete".



Tips från coachen {#tips}
-----------------------

1. Det finns en artikel som hanterar tips om [Använd TIMESTAMP för status i databastabellen](coachen/anvand-timestamp-for-status-i-databastabellen).

<!--
1. Det finns ett tips i forumet om "[Hur tänka kring funktionen order_status?](t/8449)".
-->

<!--
Tips i forum om formulär SELECT/DROPDOWN.

Tips om loop i lagrad procedur och hantera rad för rad.

Anropa procedur i procedur
-->

Lycka till och hojta till i forumet om du behöver hjälp!
