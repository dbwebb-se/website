---
author:
    - mos
category:
    - kurs databas
    - examination
revision:
    "2018-05-30": "(A, mos) Första utgåvan."
...
Om examination med dbwebb exam
================================

Detta är den individuella examinationen i kursen databas, det är en del av kmom10 och delmomentet heter "exam". 

<!--
[Du kan läsa detta dokumentet via dbwebb.se](https://dbwebb.se/kurser/databas/examination/om).
-->

Se till att du har senaste versionen av kommandot `dbwebb`.

```
dbwebb selfupdate
```

Du skall använda kommandot `dbwebb exam` för att hämta ut och lämna in din examination. Du kan läsa mer om kommandot [`dbwebb exam` via manualen](dbwebb-cli/examination) eller via hjälp-kommandot.

```
dbwebb exam help
```



Förberedelser inför examinationen
--------------------------------

Se till att katalogen `me/kmom10/exam` är tom.

Om du har gjort en tidigare examination kan du byta namn på katalogen och skapa en ny tom katalog.

```
# Du står i kursrepots root
cd me/kmom10 \
    && mv exam exam$$ \
    && mkdir exam \
    && cd exam 
```

Du kan lista om det finns en aktiv examination. Examinationstillfällen är endast aktiva under en viss period.

```
dbwebb exam list
```



Prova processen dagen innan
--------------------------------

Normalt finns det en testexamination som är aktiv dagen innan den riktiga examinationen. Det gör att du kan bekanta dig med verktyget `dbwebb exam` för att se hur det fungerar.



Påbörja examinationen
--------------------------------

Du påbörjar examinationen genom att checka ut (checkout/start) och påbörja din examination.

```
dbwebb exam checkout exam
```

Blir något fel kan du checka ut igen. Tiden räknas från din första utcheckning.



Under pågående examination
--------------------------------

Du kan löpande validera `dbwebb validate` och publicera `dbwebb publish` som vanligt.

Du kan när som hämta ett kvitto på din pågående examination och se detaljer om den, till exempel hur länge du hållit på.

```
dbwebb exam receipt exam
```



Avsluta examinationen
--------------------------------

När du är klar lämnar du in genom att försegla (seal/stop) din examination.

```
dbwebb exam seal exam
```

Blir något fel så kan du försegla och lämna in igen, det är din sista inlämning som räknas.
