---
author:
    - atb
    - nik
    - grm
revision:
    "2022-05-24": "(E, grm) Komplettering HT22."
    "2021-11-10": "(D, grm) Komplettering HT21."
    "2021-10-01": "(C, lew) Uppdaterad inför HT21"
    "2020-12-10": "(B, nik) Uppdaterad inför HT20"
    "2019-11-27": "(A, nik) Omskrivning av uppgift"
    "2018-12-04": "(PA1, mos) Arbetskopia."
...
Kmom05: Säkerhetstestning
==================================

<!-- [WARNING]
Kursen uppdateras inför HT23. Är "gula rutan" borta är det fritt fram att börja.
[/WARNING] -->

Mjukvarutest ökar kvaliteten i den mjukvara som skrivs, men hur fungerar det med säkerhetstest. I detta kursmomentet, som bygger på sårbarhetsanalyser, går vi igenom vad säkerhetstester innebär och vad man behöver tänka på.

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>


Föreläsning  {#forelasningar}
---------------------------------

*(ca: 2 studietimmar)*

* 10.15 (2023-12-04) H430, med Anton om säkerhetstänket vid testning samt Marie med säkerhetstestning praktiskt.


Läs &amp; Studera  {#lasanvisningar}
---------------------------------

*(ca: 1-2 studietimmar)*

* Läs i boken [Computer Security](/kunskap/boken-computer-security)
    * Kapitel 10 Software Security


Förkunskapskrav {#forkunskapskrav}
---------------------------------

Du har utfört uppgifterna [Sårbarhetsanalys](/uppgift/sarbarhetsanalys).

Du har medverkat på föreläsningen med Anton där han går igenom ämnet.


Tekniker  {#tekniker}
---------------------------------

Det finns flera vägar att gå för att sätta upp testning med JavaScript och ExpressJS. Använd er tidigare kunskaper ifrån jsramverk eller testa på något nytt, det är upp till er.

* [MochaJS](https://mochajs.org/)
* [ChaiJS](https://www.chaijs.com/)
* [Jest](https://jestjs.io/)
* [SuperTest](https://www.npmjs.com/package/supertest)
* [Cypress](https://learn.cypress.io/)


Laboration  {#laboration}
---------------------------------

*(ca: 2 studietimmar)*

* 10.15 (2023-12-08) H430, med Marie Säkerhetstestning, se uppgiften nedan


Uppgifter  {#uppgifter}
-------------------------------------------

*(ca: 10-14 studietimmar)*

* Gör uppgiften [Sårbarhetsanalys - Del 2](/uppgift/sarbarhetsanalys-del2)


Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

På Canvas finns det ett Quiz för varje kursmoment. För att du ska kunna lämna in uppgiften till kursmomentet måste du ha lämnat in quizen.

1. Resultatet av Sårbarhetsanalys - Del 2, din fil analys.pdf, laddar du upp i uppgiften Kmom05 på Canvas.
1. Publicera på studentservern, så att dina åtgärder kan ses och testerna köras.

<!-- Svara på följande frågor i textfältet på Canvas.

* Vilka tekniker använde du för testning?
* Vilka testfall gjorde du? Och varför?
* Hur många av era sårbarheter åtgärdade ni?
* Var det svårt att lösa någon av sårbarheterna? Kanske valde ni att skippa någon pga tidsbrist?
* Stämde de estimeringar ni gjorde överens med den slutgiltiga tiden? -->
