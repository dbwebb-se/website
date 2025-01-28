---
author: efo
category:
    - webbprogrammering
    - kursen webgl
revision:
    "2018-09-24": (B, efo) Rensade ut i kraven och la till krav om kmom01.
    "2018-08-07": (A, efo) Kopierad från generella, omarbetad till webgl portfölj.
...
Skapa en portfölj för kursen webgl
==================================

Skapa en portfölj för presentation av dina kursmoment i kursen webgl och vidare i dina studier. Du kopierar en struktur för en webbsida som består av HTML, CSS och JavaScript med ett färdigbyggt skal för de webbsidor som portföljen skall bestå av.

När kursen är klar kommer din portfölj att samla en stor del av det arbetet du gjort under kursen, det blir en del av din redovisning av kursen.

<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har installerat kursens labbmiljö samt installerat kommandot `dbwebb` och du har clonat kursrepot för kursen.

Du har gjort uppgiften "[Rita punkter med WebGL](uppgift/rita-punkter-med-webgl)".



Introduktion {#intro}
-----------------------

I din portfölj skall du samla dina redovisningstexter och du visar upp de uppgifter du löst. Det ger dig en samlad plats att utgå ifrån när du vill visa upp vad du gjort i kursen.

Redovisningstexterna är en del av underlaget till [bedömning och betygsättning](kurser/faq/bedomning-och-betygsattning) i kursen.

Du kan testa hur portföljen bör fungera, genom att öppna din exempel-katalog i kursrepot under `example/portfolio`.

I videoserien [Spelteknik för webben](https://www.youtube.com/watch?v=irHFOihkPls&index=4&list=PLKtP9l5q3ce_JgJqI31cZeBMnjH1JUUoU) visar Emil hur man kan göra sin portfölj till sin egen.





Krav {#krav}
-----------------------

I din kurskatalog (repot) för kursen, skall du ta en kopia av exempelkatalogen `example/portfolio` och lägga i din me-katalog under `me/portfolio`. Gör det med följande kommando i terminalen.

```bash
# Gå till kurskatalogen
cp -ri example/portfolio me
```

1. Du har nu en grund för din portfölj i kursen. Modifiera den så den blir "din egen".

1. Uppdatera sidan `index.html` så att den innehåller en kort presentation av dig själv tillsammans med en bild som får representera dig.

1. I sidan `redovisning.html` skall du skriva dina redovisningstexter för varje kursmoment.

1. Öppna filen `kmom01.html` och integrera resultatet av uppgiften "[Rita punkter med WebGL](uppgift/rita-punkter-med-webgl)" i denna sida och som en del av din portfölj.

1. Gör en dbwebb publish för att kolla att allt validerar och fungerar.


<!-- 1. I sidan `om.html` lägger du till en godtycklig bild som du finner representativ för kursen.

1. Leta reda på kursrepot på GitHub och länka till det från din `om.html`.

1. I din `om.html`, länka även till kurssidan på dbwebb.se. -->

<!-- 1. Du kan uppdatera stylesheet och eventuellt JavaScript i katalogerna `portfolio/style` och `portfolio/js`. Det är inte nödvändigt, gör det om du vill och känner att du har tid. Du kan även göra om din me-sida till en webbplats baserad på PHP. -->

```text
dbwebb publish me
```



Extrauppgift {#extra}
-----------------------

Om du har tid och kraft.

1. Lägg extra kraft på CSS och styla din portfölj så den blir mer personlig.

1. Lägg till något enkelt JavaScript som gör din portfölj än mer personlig.



Tips från coachen {#tips}
-----------------------

Koden bakom din portfölj behöver validera och följa god kodstandard.

Lycka till och hojta till i forumet om du behöver hjälp!
