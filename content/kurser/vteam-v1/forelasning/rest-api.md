---
author: mos
revision:
    "2023-11-06": "(A, mos) Ny presentation inför ht23."
...
Föreläsning: RESTful API
====================

<!--
[![slide](https://dbwebb-se.github.io/pattern/lecture/L01-system-design-specification/img/slide.png)](https://dbwebb-se.github.io/pattern/lecture/L02-RESTful-API/slide.html)
-->

Vi pratar vi om hur man kan jobba och dokumentera när man designar ett REST API.



<!--
Videon är 44 minuter lång.

[YOUTUBE src="FC_hVXmu7QM" width=700 caption="Webbteknologier - introduktion (med Mikael)."]
-->

<!--
Du kan själv bläddra igenom [de HTML slides som används i presentationen](https://dbwebb-se.github.io/pattern/lecture/L02-RESTful-API/slide.html).
-->



Arbetsprocess {#process}
------------------------

Myckelkoncept att ha koll på är.

* Resurser, substantiv i systemet. De håller ett "state" för varje resurs. S i REST.
* Representationer är den presentation som API:et levererar av resursen, RE i REST.
* Actions utförs för att hämta eller ändra resursens state. Detta är verben i systemet, vad vi gör med resurserna. T i REST.

När vi skissar ett REST API så pratar vi om vilka resurser som finns och dessa representeras i url:ar och metoder som GET, POST, PUT, DELETE som kan påverka resurserna.

På det viset skissar vi upp varje request och response.

```text
Request: GET http://info-about-nyc.com/temperature/
Response: {"celsius": 14, "fahrenheit": 57}
```

<!--
Använd artikelns text om systemet.
Reviewing the Spec for our Example Application

From Spec to RESTful API
Step 1: Identifying Nouns and Verbs

Step 2: Extracting URLs and their methods from nouns and verbs

-->

När man jobbar fram en design av ett REST API så börjar man med en text som beskriver systemet och/eller en kravspecifikation.

Steg 1 är att extrahera substantiv (resurser) och verb (actions) ur texten och lista ned dem. När alla är listade kan man utvärdera vilka som är viktigast och om några är överflödiga.

Steg 2 är att skapa url:ar för de metoder som matchar de substantiv och verb som är kvar och representerar systemet.

<!--
Skissa i excelarket
[REST API matris](https://docs.google.com/spreadsheets/d/1V_2KmGhWYd4qShBpHRBNepor11cSS6YxFjAHmlPEtJ4/edit?usp=sharing) 
-->



Resurser
------------------------

Resurser som används, eller är relevanta, för de områden som föreläsningen behandlar.

**Artiklar som föreläsningen bygger på.**

Följande artikelserie tar dig igenom hur man kan tänka när man designar ett REST API. Du får också stöd för hur du kan designa ditt API med en matris som lite kan liknas vid hur vi designade databasen med ER-modellering.

1. [How to design a RESTful API architecture from a human-language spec (part 1)](https://www.oreilly.com/content/how-to-design-a-restful-api-architecture-from-a-human-language-spec/)
1. [How a RESTful API server reacts to requests (part 2)](https://www.oreilly.com/content/how-a-restful-api-server-reacts-to-requests/)
1. [How a RESTful API represents resources (part 3)](https://www.oreilly.com/content/how-a-restful-api-represents-resources/)

**Dokumentation av ett REST API.**

1. Här är en [REM server](https://rem.dbwebb.se/) som visar ett exempel på hur ett API:et till en REST server kan se ut och som kan användas för test.

1. [Emils dokumentation av REST API:et för lager API:et](https://lager.emilfolino.se/v2).

**Klienter**

Klienter för att testa och jobba med REST API:er.

* [Postman](https://www.postman.com/)
* [Advanced REST Client](https://www.advancedrestclient.com/)

**Servrar**

Servrar som hjälper dig att testa.

* [JSON Server](https://www.npmjs.com/package/json-server) to fake a REST API for development.
