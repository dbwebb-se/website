---
author:
    - mos
category:
    - kurs databas
    - tentamen
    - dbwebb exam
revision:
    "2022-03-09": "(C, mos) Ny video för 2022 och v2."
    "2020-03-10": "(B, mos) Genomgången och mindre justeringar i text inför våren 2021."
    "2019-03-06": "(A, mos) Omskriven inför våren 2019."
...
Tentamen "programmeringstenta" och dbwebb exam
=========================

<!--
[Du kan läsa detta dokumentet via dbwebb.se](https://dbwebb.se/kurser/databas-v1/kmom10/tentamen).
-->

Här presenteras en beskrivning hur du checkar ut och lämnar in en tentamen via verktyget `dbwebb exam`.

Inför tentemen bör du förvissa dig om att du har jobbat igenom dokumentet så att du väl känner till hur tentamen fungerar.



Inspelad genomgång {#flas}
--------------------------------------------------------------------

Det finns en inspelad genomgång som går igenom hur tentaverktyget `dbwebb exam` fungerar. Se den som ett komplement till att läsa informationen i detta dokumentet.

[YOUTUBE src="C4AvZdV4p44" width=700 caption="Genomgång av tentaverktyget 'dbwebb exam' (15 min)."]



Uppdatera kursrepot {#kursrepo}
-------------------------

Se till att du har ett uppdaterat kursrepo samt att din `me/` katalog innehåller rätt underkataloger.

```text
# Gå till roten av kursrepot
dbwebb update
dbwebb init-me
```

Du har nu (minst) följande kataloger under `me/kmom10`.

| Underkatalog | Beskrivning |
|--------------|-------------|
| `prep`       | Använd när du tränar på de övningstentor som finns tillgängliga. |
| `try1`       | När du skriver tentamen vid tillfället för "tenta" och ordinarie examinationstillfälle. |
| `try2`      | När du skriver tentamen vid tillfället för "omtenta" och uppsamlingsheat 1. |
| `try3`      | När du skriver tentamen vid tillfället för "resttenta" och uppsamlingsheat 2. |



Visa vilka tentamen som finns {#ls}
-------------------------

Du kan lista om det finns planerade eller aktiva tentamen, varje tentamen är endast aktiv under en viss period.

```text
dbwebb exam list
dbwebb exam ls
```

Du får fram en lista med planerade, aktiva och avslutade tentamen och deras respektive id.

Preptentan `prep` är alltid tillgänglig så att du kan testa förfarandet i lugn och ro och bekanta dig med `dbwebb exam`. Du kan checka ut preptentan hur många gånger du vill.



Påbörja tentamen {#borja}
--------------------------------

Du påbörjar tentamen genom att checka ut den (checkout/start).

Välj en id från de tentamen som är aktiva.

```text
dbwebb exam checkout <id>
```

Så här gör du för att checka ut en aktiv tentamen med id `try1`.

```text
dbwebb exam checkout try1
```

Du anger ditt namn och epost när du checkar ut.

Blir något fel kan du checka ut igen. Tiden räknas från din första utcheckning.

Det som checkas ut är instruktionerna för tentamen, när du gör det så notifieras även läraren att du har påbörjat din tentamen.



Under pågående tentamen {#paga}
--------------------------------

Du kan löpande validera med `dbwebb validate` som vanligt. Undvik att spara all validering till slutet, det sparar dig en del stress vid inlämningen.

```text
dbwebb validate <id>
dbwebb validate try1
```

Du kan hämta ett kvitto på din tentamen och se detaljer om när du checkade ut (och förseglade) samt hur länge du hållit på.

```text
dbwebb exam receipt <id>
dbwebb exam receipt try1
```

Du kan hämta kvittot hur många gånger du vill.



Avsluta tentamen {#avsluta}
--------------------------------

Innan du avslutar så bör du validera och rätta alla valideringsfel.

När du är klar lämnar du in genom att försegla (seal/stop) din tentamen.

```text
dbwebb exam seal <id>
dbwebb exam seal try1
```

Du anger ditt namn och epost när du förseglar.

Blir något fel så kan du försegla och lämna in igen, det är din sista inlämning som räknas.

Vi förseglingen laddas ditt kursrepo upp till studentservern och det skickas ett meddelande till läraren som får veta att du har lämnat in.



"Lämna in" på Canvas {#canvas}
--------------------------------

När du är klar med tentamen, gå till inlämningen på Canvas för "Kmom10 Tentamen" och visa att du är klar genom att "lämna in uppgiften" genom att skriva "Klar!" tillsammans med din studentakronym (eller länken till din redovisa-sida).
