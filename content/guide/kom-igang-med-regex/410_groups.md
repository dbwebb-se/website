---
author: lew
revision:
    "2019-03-08": "(A, lew) Första versionen."
...
Gruppering {#gruppering}
=======================

För att markera en grupp använder vi parenteser runt matchningen, `(...)`. Vi kan återanvända en grupp med `\1`, `\2` etc. Låt säga att vi vill få tag på namnet på den person som har kursen Webapp tillsammans med kurskoden:

```
$ sed -E -n 's/(^[a-zA-Z]+\s[a-zA-Z]+).*Webapp.*([A-Z]{2}[0-9]{4}).*/\1 \2/p' < courses.txt
Emil Folino DV1609
```

Nu blev det rörigt! Vi tar det bit för bit så klarnar det:

**(^[a-zA-Z]+\s[a-zA-Z]+)**: Parenteserna talar om att det ska vara en grupp.  
Insättningstecknet ^ (moroten) markerar början på raden.  
Sedan följer en karaktärsklass som fångar alla bokstäver följt av ett plus (+) då vi vill att det ska upprepas minst en gång.   Sedan kommer ett mellanslag (\\s) följt av en karaktärsklass till.  
Nästa plustecken tar alla bokstäver fram till något annat dyker upp, som till exempel ett mellanslag. Detta blir grupp 1 (namnet).  
**.\*Webapp.\***: Konstruktionen .\* matchar vilket tecken som helst, noll eller flera gånger fram till ordet *Webapp*. Sedan tar vi allt som kommer i vår väg igen.  
**([A-Z]{2}[0-9]{4}).\***: Vi vet hur en kurskod ser ut så vi stannar inte förrän vi kommer till den andra gruppen. Kurskoden är två stora bokstäver följt av 4 siffror. Måsvingarna, `{2}`, talar om att det som sker i karaktärsklassen ska matchas 2 gånger följt av 4 siffror. Där stänger vi gruppen och plockar resten av raden med `.*`.  
**/\1 \2/**: Den andra delen av uttrycket är delen som talar om vad som ska ersätta matchningen. Nu har vi ju fångat upp de grupper som vi vill återanvända så vi petar in dem där.
