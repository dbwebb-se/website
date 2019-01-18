---
author:
    - mos
    - efo
revision:
    "2018-12-07": "(C, efo) Ändrade till nya övningar och uppgifter."
    "2018-11-07": "(B, efo) Anpassat för nya strukturen för ramverk-v2."
    "2018-06-08": "(prel, mos) Nytt dokument inför uppdatering av kursen."
    "2017-10-16": "(A, mos) Första utgåvan."
...
Kmom01: Backend
==================================

Först ser vi till att skaffa oss en server där vi under kursens gång ska driftsätta ett antal olika micro-services och klienter. Vi installerar en webbserver och skapar ett första utkast till en service för redovisningstexter.

Vi utvärderar ett antal JavaScript-ramverk för att bygga REST API:er och väljer det som passar vår kravspecifikation.



<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Förkunskaper {#forkunskaper}
---------------------------------

Denna kurs bygger vidare på det du lärt dig under första året på programmet Webbprogrammering och de kurserna du tagit fram tills nu, inklusive ramverk1. Även om du har några kurser/kmom släpande efter dig så bör du kunna genomföra kursen. Möjligen kan du uppfatta kursen som krävande, men det finns vägval där du själv kan bestämma nivån på komplexitet och användandet av nya tekniker.

Kursens fokus är att utvärdera, välja och använda tekniker för att sammanfoga dem i ett större sammanhang där servrar samverkar. Grunden för kursen är programmeringsspråket JavaScript.



Labbmiljön  {#labbmiljo}
---------------------------------

*(ca: 2-4 studietimmar)*

Det finns en [längre beskrivning om kursens labbmiljö](./../installera-labbmiljo). Läs den om du är osäker på vad som skall göras, eller om detta är din första dbwebb-kurs.

Den korta varianten är att du behöver [installera labbmiljön](./../labbmiljo), uppdatera [dbwebb-cli](dbwebb-cli) samt klona och initiera kursrepot.

```text
# Gå till din katalog för dbwebb-kurser
dbwebb selfupdate
dbwebb clone ramverk2
cd ramverk2
dbwebb init
```



Läsanvisningar  {#lasanvisningar}
---------------------------------

*(ca: 2-3 studietimmar)*



### Material {#material}

Kika igenom följande material.

1. Webbplatsen [nodeframework.com](http://nodeframework.com/) där nodejs backend ramverk är listade för att skapa dig en överblick över vilka ramverk som finns. Med din erfarenhet av andra ramverk så har du god koll på vad du vill leta efter.

<!-- 1. Webbplatsen för [ramverket Express](https://expressjs.com/) ger dig det du behöver för att komma igång. Använd webbplatsen och dess dokumentation som källan och kör på senaste versionen. -->



### Video  {#video}

1. Det finns en [videoserie](https://www.youtube.com/playlist?list=PLKtP9l5q3ce--Z6iuqvY-UfAN6vWhHpmZ) kopplat till kursen, titta på videos som börjar på 0 och 1. Videoserien uppdateras varje måndag och innehåller material för att utvärdera tekniker och ge tips & trix för att lösa kursmomenten.



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 6-10 studietimmar)*



### Övningar {#ovningar}

Gör följande övningar, de behövs normalt för att klara uppgifterna.

1. Jobba igenom artikeln "[GitHub Education Pack och en server på Digital Ocean](kunskap/github-education-pack-och-en-server-pa-digital-ocean)" där vi använder Github Education Pack för att skaffa en egen Virtuell Server med ett eget domännamn.

1. Jobba igenom artikeln "[Node.js API med Express](kunskap/nodejs-api-med-express)" för att komma igång med webb- och applikationsservern Express i Node.js.

<!--
1. Jobba igenom artikeln "[Databas appserver med Express och MySQL](kunskap/databas-appserver-med-express-och-mysql)" som visar hur du kan jobba med MySQL tillsammans med Express. Spara dina exempelprogram i `me/kmom05/express-mysql`.

1. Jobba igenom artikeln "[SQLite och Node.js](kunskap/sqlite-och-nodejs)". Spara dina exempelprogram i `me/kmom03/sqlite`.

Ev 5p i projektet om man använder MySQL och/eller SQLite.
-->



### Uppgifter {#uppgifter}

Följande uppgifter skall utföras och resultatet skall redovisas via me-sidan.

1. Gör uppgiften "[Bygg ett me API till ramverk2](uppgift/bygg-ett-me-api-till-ramverk2)". Det handlar om att bygga ditt me API med ett nodejs baserad backend ramverk och publicera på Github. Spara allt under `me/redovisa`.



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Lägg extra tid på skrivandet i detta inledande momentet då redovisningstexten är mer omfattande än du är van vid.

Se till att följande frågor besvaras i texten:

* Berätta utförligt om din syn på nodejs backend ramverk och berätta vilket ramverk du valde och varför.
* Berätta om din katalogstruktur och hur du organiserade din kod, hur tänkte du?
* Använde du någon form av scaffolding som ditt valda ramverk erbjuder?
* Vad är din TIL för detta kmom?

Har du frågor eller funderingar så ställer du dem i forumet.


<!--stop-->


02: Formulär och Ajax
---------------------------------
anax/form
login och search-form
User login, registrering, aktivering (usability) med ajax. (cookies)
ajaxifiera formulären
modulifiera koden
Kan testas TDD, BDD eller Selenium?
uppgift: gör liknande med egen modul inkl tester (ajax bild upload POST/FILES)


04: Ramverkets glue
---------------------------------
middleware
Exempel på middleware, skriv eget och gör som paket på packagist.
eventlisteners, event in framwork
logger


05: Egen modul och tjänst
---------------------------------
(likt phpmvc/kmom05)
Egen dummy-modul (valutakonverterare, datum, kalender, namn, rot, etc), till egna paket packagist (domänmodul till Anax)
eget webbplats för trafik och reklam?



06: Systemtest och optimering
---------------------------------
debug och profiling
prestandatestning
prestandamätningar, analyser
Systemtest



03:
Cachning, nyhetsplanet, rss-flöde. RSS-modul, Cache-modul (PSR?)
Caching (som modul anax/cache, möjligen PSR)
Kan byggas med BDD?
(domänmoduler)



0x: (likt phpmvc/kmom04 men splitta upp i delar, viktigt kmom)
MVC (kontroller och modeller)
kontroller versus router, specifika up/down-metoder
dispatching, forward
Databasdrivna modeller (med formulär), olika databaspatterns från phpmvc/kmom04 med SQLQueryBuilder
Kompabilitet databas (sqlite, mysql, postgresql) med SQL Query Builder
HMVC


0x: Testning
TDD/BDD Testning (phpunit och behat)
Testning (docker och selenium)
Testing (travis, circle, scrutinizer, https://codeclimate.com/, https://coveralls.io/)
Olika versioner av PHP i XAMPP/Docker
enhetstest o doc dag 1
Test doubles, db test, BDD
Guide: Writing Testable Code
Behat
Selenium
Enhetstestning databas
PHPUnit (exception, setup, teardown, database, mocking, providers)
travis, scrutinizer, circle
docker (olika versioner av PHP, databas, egen testmiljö)



RAMVERK2:
---------------------------------

01:
---------------------------------
Express.js, routes, någon tjänst?
AJAX.

0x:
Flex mm? Hur förhåller sig till Mithril?
Bygg egen npm-modul (använd i Express).

02:
---------------------------------
Websockets
Realtime web
Chatt (express.js)
Chatt
Pusha notiser till användaren (desktop/mobil) när saker uppdateras.
Nån social media/chatt-grej med visst fokus (telegram etc)

0x:
datavisualisering med JS https://d3js.org/, googles api, http://www.chartjs.org/
maps, html5 api

0x:
JS test (klient/server)


Exempel uppgifter:
- Generera nyhetsbrev (från info-flödet av news)
- Matchning ala rekrytering
- search i databaser, sökmotor (artiklar, information, slå ihop databaser från andra källor)
- Kommentarssystem, forum, SO


Externa kopplingar:
* Koppling faktureringsmotor


Tema:
* Big data
* Cloud (docker containers)
* Redis (key value data store, caching)

Övrigt:
* Desktop GUI (Atom)
