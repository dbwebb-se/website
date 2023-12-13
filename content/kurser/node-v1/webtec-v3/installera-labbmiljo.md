---
author: mos
revision:
    "2022-06-22": "(C, mos) Omarbetad med ny video/guide för dbwebb-cli inför ht22."
    "2020-06-11": "(B, mos) Justerade länk till sektion av dbwebb-cli dokumentation."
    "2018-06-19": "(A, mos) Första utgåvan, kopierad från databas-kursen."
...
Installera kursens labbmiljö
==================================

Du behöver installera kursens labbmiljö samt ha tillgång till verktyget `dbwebb` som du installerar i terminalen. När du är klar kan du klona kursrepot där du finner en del av kursens material.

<!--more-->



Labbmiljön {#kurslabbmiljo}
----------------------------------

Det första du behöver göra är att installera en labbmiljö för kursen. Om detta är din första dbwebb-kurs så kan det innebära en hel del jobb och en del nya tekniker. Se till att du har gott om tid när du gör detta.

1. [Installera labbmiljön](./../labbmiljo) som behövs för kursen.



Kom igång med kommandot dbwebb {#dbwebbcli}
----------------------------------

Kommandot, eller verktyget, dbwebb, är ett terminalprogram, skrivet i Bash, som hjälper dig att ha koll på dina filer i kursen. Det hjälper dig också att lämna in resultatet så att lärarna kan rätta och det hjälper dig att publicera till en webbplats för studenter.

Det finns en guide som visar hur du kommer igång, [guiden om dbwebb-cli](https://dbwebb.se/dbwebb-cli).

Kenneth visar dig hur du kan jobba igenom guiden.

[YOUTUBE src=ttxe_6Vyvss width=700 caption="Kenneth visar hur du kommer igång med dbwebb-cli som en del av labbmiljön."]

De steg som är viktiga för att komma igång är följande.

1. "[Kom igång och installera](https://dbwebb.se/dbwebb-cli/kom-igang-och-installera)" som visar dig de första stegen hur du installerar verktyget dbwebb.

1. "[Konfiguration](https://dbwebb.se/dbwebb-cli/konfiguration)" visar hur du konfigurerar verktyget och anpassar det till din användare och hur du genererar SSH-nycklar för inloggning.

1. "[Kursrepo](https://dbwebb.se/dbwebb-cli/kursrepo)" visar hur du "klonar ett kursrepo" och laddar hem den miljö du skall jobba i. Kursrepot för denna kursen heter "webtec".

1. "[Ladda upp, validera och publicera](https://dbwebb.se/dbwebb-cli/upload-validate-publish)" detta stycke kan du bara kort kika igenom, det visar hur du kommer att jobba med ditt kursrepo genom kursen.

<!--
[YOUTUBE src=vlZRW2OZamE width=639 caption="Mikael installerar dbwebb-cli som en del av labbmiljön"]
-->



Sammanfattningsvis {#sammanfattning}
----------------------------------

När du är klar så har du ditt kursrepo för kursen klonad och klart på din lokala dator. Du bär också kunna ladda upp det till studentservern.

Om du är osäker om du har klonat rätt kursrepo så är här den korta varianten.

```text
# Gå till din katalog för dbwebb-kurser
dbwebb clone webtec
cd webtec
dbwebb init
```

Bra, det var grunden som behövs. Nu kan du fortsätta med det första kursmomentet.
