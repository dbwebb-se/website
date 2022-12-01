---
views:
    flash:
        region: flash
        template: default/image
        data:
            src: "image/vteam/logo.png"
author: mos
revision:
    "2022-10-28": "(A, mos) Första utgåva inför HT22."
...
Tips, trix och förtydliganden
=========================

Här följer tips och trix till hur man kan ta sig an projektet och dess delar. 

Det finns förtydliganden som kan hjälpa dig att förstå vad som är mer och mindre viktigt om du står inför en situation där du måste prioritera features för att nå fram till en leverans.

Det finns ocks tips och trix till hur vissa saker kan implementeras i projektet.



Håll ihop gruppen {#team}
-------------------------

Ni har ett stort system att utveckla på en begränsad kalendertid och begränsade resurser av person-timmar.

Ni har också en reell begränsning av gruppens samlade kompetens och förmåga att utöka den kompetensen och förmågan inom givna tider och ramar.

Ni kan komma att behöva prioritera och fundera på vad som är viktigt för kunden och vad som är viktigt att ta med i er leverans.

Tänk hela tiden på vad som är viktigt och vad som eventuellt kan prioriteras ned.

Prioriterar man bort många (viktiga) saker bör det påverka slutbetyget. Om man tar hänsyn till alla (de flesta, de viktigaste) kraven så bör det påverka betyget. I din prioritering förhandlar du alltså mest med betyget och din egen och gruppens ambitionsnivå.

När du är klar måste du kunna visa att ditt system fungerar i drift genom att simulera en drift med tusentals cyklar. Den simuleringen påverkar ditt betyg.

Framförallt, håll ihop gruppen. Det är en av de viktigaste aspekterna i kursen. Gör alltid vad du själv kan och anser rimligt för att stärka gruppen och hålla ihop den. Se till att du själv tillför energi till gruppen genom att delta, kommunicera och aktivt bidra med dina egna styrkor. Försök att göra ditt yttersta för att bidra till en hälsosam och väl fungerande grupp där alla bidrar på bästa sätt givet de styrkor varje individ har.

Hur väl ni håller ihop gruppen kan komma att påverka betygsättningen.



System Design Specifikation (SDS) {#sds}
-------------------------

Det vi eftersträvar är ett relativt kort (5-7 sidor (max 15-20 sidor) med information + försättsblad) och översiktligt dokument som påvisar systemets arkitektur, delsystemen och hur kommunikationen flödar i systemet.

Vi förväntar oss ett dokument som både tekniker och kunden kan relatera till och dokumentet skall också hjälpa oss att fördela arbetet i gruppen och skapa de API:er som gör att delsystemen kan samverka.

Vi förväntar oss ett dokument med både text, bilder och övrigt som underlättar när teknikern försöker förklara för sitt team, projektledare och kunden om hur man tänkt och vilka val man gjort (och vilka val man analyserat med förkastat).

En SDS bör innehålla referenser till de källor man använt när man gjort sina val.



Körbart system i Docker {#docker}
-------------------------

En grundtanke är att hela projektet skall kunna köras lokalt på en dator med Docker. Det är främst för möjligheten att testa och utveckla systemet. Att köra systemet i Docker skall vara en del i projektets repo (repon). Det skall finnas en möjlighet att ta hem projektets repo och starta upp "hela servern" med tex `docker-compose up -d server`.

Det är en god tanke att sätta upp docker i repot direkt när ni startar utvecklingen. Det ger er en gemensam bas att stå på och underlättar för alla i gruppen.

Det kan vara bra att ha detta i åtanke när man designar systemet och dess delar.

Att drifta systemet på en extern servern är "add on" och en trevlig sak, men det är inte ett absolut krav.



Simulera drift i Docker {#simulera}
-------------------------

Tanken är att ni skall kunna visa att ert system fungerar genom att simulera driften av ett antal tusen cyklar i en stad där cyklarna rör sig på en karta, eller visar att de är parkerade.

Denna simulering är ett absolut krav och kommer att visa hur bra ni lyckats med ert system.



Designa ett RESTful API {#rest}
-------------------------

Följande artikelserie tar dig igenom hur man kan tänka när man designar ett REST API. Du får också stöd för hur du kan designa ditt API med en matris som lite kan liknas vid hur vi designade databasen med ER-modellering.

1. [How to design a RESTful API architecture from a human-language spec (part 1).](https://www.oreilly.com/content/how-to-design-a-restful-api-architecture-from-a-human-language-spec/)
1. [How a RESTful API server reacts to requests (part 2).](https://www.oreilly.com/content/how-a-restful-api-server-reacts-to-requests/)
1. [How a RESTful API represents resources (part 3).](https://www.oreilly.com/content/how-a-restful-api-represents-resources/)

Att fundera på:

* Hur hantera versioner av API:et?
* Stödja JSON, XML, [HAL](https://stateless.group/hal_specification.html), [GraphQL](https://graphql.org/)?



OAuth {#oauth}
-------------------------

OAuth skall byggas in i systemet för att hantera användarens inloggning. Det skall minst stödjas att man kan logga in med sitt konto från GitHub. Det är bra att få in detta i SDS:en.

* [OAuth 2.0](https://oauth.net/2/)
* [GitHub Building OAuth Apps](https://docs.github.com/en/developers/apps/building-oauth-apps)



Databas {#databas}
-------------------------

Någon form av datalagring kommer behövas. Det kan vara en lokal databas eller "database-as-a-service". Det kan vara en relationsdatabas eller JSON/dokumentdatabas, välj det som är rimligt och prioritera tiden du har till förfogande.  

[DBaaS - What is Database-as-a-Service?](https://www.stratoscale.com/blog/dbaas/what-is-database-as-a-service/)



Karta {#map}
-------------------------

* Artikeln [GPS och karta](https://dbwebb.se/kunskap/gps-och-karta) användes tidigare i kursen webapp för att visa hur kartor fungerar.
* [Leaflet](https://leafletjs.com/) ett JavaScript lib för att jobba med kartor.
* [OpenStreetMap](https://www.openstreetmap.org/) kan vara ett alternativ för att visa kartor.
