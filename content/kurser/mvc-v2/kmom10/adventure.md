---
author:
    - mos
revision:
    "2023-05-11": "(B, mos) Uppdaterad inför vt23."
    "2022-05-06": "(A, mos) Första utgåvan mvc-v2."
...
Äventyrsspel (adventure)
==================================

Ett klassiskt äventyrsspel, så som jag tänker mig det i denna uppgiften, är ett spel där man börjar i ett rum och en bild visas. I rummet kan man ta saker och lägga i sin ryggsäck, man kan peta på saker i rummet och något kan hända eller visa sig. Man kan förflytta sig åt öster, väster, norr och söder, förutsatt att det finns öppningar åt de hållen.

Målet är att ta sig till sista rummet och ha med sig någon viktig sak man kan använda för att nå till skatten/målet.

Varje gång man klickar på något så sker en request till servern och sidan renderas om.

Här är utmaningen att göra en bra struktur bakom spelet så att man kan lägga till rum, saker och händelser i rummen på ett generellt sätt och undvika att hårdkoda spelets logik.

Håll det enkelt. Visa en bild för varje rum, implementera ryggsäck där man kan ta med sig saker, implementera att man kan navigera mellan rummen och se dolda saker genom att agera med dem, eventuellt via något man har i sin ryggsäck.

Spelet kan var 3-5 rum stort (inte större) och det måste finnas en fusklapp som visar läraren hur man spelar igenom spelet snabbaste vägen.

Här finns en lista med "[Top 100 All-Time Adventure Games](https://adventuregamers.com/articles/view/18643)" och kanske känner du igen något spel där. Ett spel jag själv växte upp med var första varianterna av Larry. Men jag kom aldrig i mål.