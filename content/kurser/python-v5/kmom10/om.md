---
author:
    - mos
    - efo
category:
    - kurs databas
    - examination
revision:
    "2018-09-25": "(B, efo) Första utgåvan för python."
    "2018-05-30": "(A, mos) Första utgåvan."
...
Om examination med dbwebb exam
================================

Detta dokument beskriver hur vi gör den individuella examinationen med hjälp av verktyget `dbwebb exam`.

<!--
[Du kan läsa detta dokumentet via dbwebb.se](https://dbwebb.se/kurser/databas/examination/om).
-->

Se till att du har senaste versionen av kommandot `dbwebb` och senaste versionen av kursrepot samt skapa kataloger i din me-katalog.

```bash
# stå i kursrepot dbwebb-kurser/python
dbwebb selfupdate # eventuellt behövs sudo eller admin rättigheter
dbwebb update
dbwebb init
```

Du skall använda kommandot `dbwebb exam` för att hämta ut och lämna in din examination. Du kan läsa mer om kommandot [`dbwebb exam` via manualen](dbwebb-cli/examination) eller via hjälp-kommandot.

```bash
dbwebb exam help
```



Förberedelser inför examinationen
--------------------------------

Du kan lista om det finns en aktiv examination. Examinationstillfällen är endast aktiva under en viss period.

```bash
dbwebb exam list
```

Det finns en tillgänglig examination för förberedelse med liknande uppgifter och för möjlighet att testa på `dbwebb exam` verktyget. Du kan skapa förberedelse examinationen med kommandot.

```bash
dbwebb exam checkout prep
```

Filerna för examinationen laddas ner och läggas i katalogen `me/kmom10/prep`.



Påbörja examinationen
--------------------------------

Du påbörjar examinationen genom att checka ut (checkout/start) och påbörja din examination. Följande kommandon fungerar för de olika examinationstillfällena `prep`, `try1`, `try2` och `try3`.

```bash
dbwebb exam checkout try1
```

Blir något fel kan du checka ut igen. Tiden räknas från din första utcheckning.



Under pågående examination
--------------------------------

Du kan löpande validera med hjälp av `dbwebb validate try1`.

Du kan när som hämta ett kvitto på din pågående examination och se detaljer om den, till exempel hur länge du hållit på.

```bash
dbwebb exam receipt try1
```



Avsluta examinationen
--------------------------------

När du är klar lämnar du in genom att försegla (seal/stop) din examination.

```bash
dbwebb exam seal try1
```

Blir något fel så kan du försegla och lämna in igen, det är din sista inlämning som räknas.
