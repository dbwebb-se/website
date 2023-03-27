---
author: mos
revision:
    "2023-03-27": "(C, mos) Genomgången inför mvc-v2 och vt23."
    "2022-03-22": "(B, mos) Genomgången inför mvc-v2 och vt22."
    "2021-03-17": "(A, mos) Första utgåvan."
...
Installera kursens labbmiljö
==================================

Du behöver installera kursens labbmiljö samt ha tillgång till verktyget `dbwebb` som du installerar i terminalen. När du är klar kan du klona kursrepot där du finner en del av kursens material.



Version av PHP {#phpversion}
----------------------------------

Labbmiljön bygger på att du har tillgång till en webbserver med PHP och att du har PHP tillgängligt i din terminal.

Det rekommenderas att du använder senaste versionen av PHP till denna kursen, är du osäker så fråga.

Här kan du se vilken [version som körs på studentservern](http://www.student.bth.se/~mosstud/test/info.php).

Kika gärna vilka som är [aktiva PHP releaser](https://www.php.net/supported-versions.php).



Labbmiljön {#kurslabbmiljo}
----------------------------------

Labbmiljön består av ett antal verktyg som du behöver installera på din dator. I nedan länk för du en översikt av dessa.

1. [Installera labbmiljön](./../labbmiljo) som behövs för kursen.

Det är framförallt följande verktyg som du behöver tillgång till via terminalen och det är eventuellt några som är nya för dig i denna kursen.

Så här ser det ut för mig.

```
$ php --version
PHP 8.2.4 (cli) (built: Mar 16 2023 14:34:48) (NTS)

$ composer --version
Composer version 2.4.1 2022-08-20 11:44:50

$ make --version
GNU Make 4.3
```

Utskriften hos dig kan skilja beroende av vilka versioner du har. Har du nyare versioner så är det bra. Har du äldre versioner så kan det fortfarande fungera, men var uppmärksam om du får bekymmer.



Klona kursrepot {#kursrepo}
----------------------------------

Du behöver uppdatera ditt [dbwebb-cli](dbwebb-cli) samt klona och initiera kursrepot.

```text
# Gå till din katalog för dbwebb-kurser
dbwebb selfupdate
dbwebb clone mvc
cd mvc
dbwebb init
```
