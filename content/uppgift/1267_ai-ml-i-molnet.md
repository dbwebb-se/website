---
author: efo
category:
    - moln
revision:
    "2021-12-18": (A, efo) Första utgåvan i samband med kursen moln.
...
AI/ML i molnet
==================================

I detta projektarbetet kommer du att knyta ihop delar av det du har arbetat med i tidigare laboration, och nu ska din WebApp förändras och få ett användargränssnitt.

Planen med projektet är att du ska bygga funktionalitet så att man i din WebApp gränssnitt ska kunna klistra in en länk till en bild.



<!--more-->



Denna bild ska tolkas med hjälp av [Azure Cognitive Services](kunskap/cognitive-services-i-azure) för att få en uppfattning vad bilden representerar.

Varje tolkning bygger på en viss sannolikhet, dvs hur säker tjänsten är att tolkningen är korrekt. Tolkningar med en sannolikhet under 97% är inte intressanta i detta projektet och ska filtreras bort.

Du ska nu söka ut de produkter i ditt lager vars [name] eller [description] innehåller någon tolkning av bilden - men tolkningarna är på engelska och lagret är på svenska och därför behöver du översätta tolkningarna innan du jämför dom med lagerprodukterna.



Förkunskaper {#forkunskaper}
-----------------------

Se till att du har jobbat igenom "[En Flask App i molnet](kunskap/flask_och_templates_med_jinja)", "[Cognitive Services i Azure](kunskap/cognitive-services-i-azure)" och "[Deployment av Lager-API:t i en Docker Container](kunskap/lager-apit-i-docker)".



Krav {#krav}
-----------------------

1. Du ska deploya Lager-API:t som en Docker container i Azures moln enligt "[Deployment av Lager-API:t i en Docker Container](kunskap/lager-apit-i-docker)". Den driftsatta containern ska användas av din WebApp.

1. Du ska ha byggt och deployat en Webapp med ett UI enligt beskrivning som ger möjlighet att skriva in en länk till en bild och ett sätt att få ett resultat, t.ex en knapp. Lägg gränssnittet på routen `/image_search`.

1. Webappen ska tolka innehållet i bilden med hjälp av Cognitive Services och presentera vilka produkter i lagret som matchar tolkningen. Se till att din applikation hämtar produkterna från den driftsatta Docker Container.

1. Webappen ska vara robust och på ett användarvänligt sätt presentera för användaren om någonting går fel, till exempel om resultatet från Cognitive Services genererar en StatusCode 429.

1. Webappen ska lämnas in i Canvas som en .zip-fil och driftsättas i Azure molnet.



Tips från coachen {#tips}
-----------------------

Lycka till och hojta till i chatten om du behöver hjälp!
