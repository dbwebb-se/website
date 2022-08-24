---
author:
    - mos
    - lew
    - efo
category:
    - python
revision:
    "2022-08-24": (H, aar) Bytte mapp kmom01/hello till kmom01/plane. Då validering är avstängt för hello.
    "2019-05-24": (G, efo) La till visualiseringsverktyg.
    "2018-06-29": (F, aar) Uppdaterade mappstruktur mot kursrepo.
    "2018-06-21": (E, efo) Bytte ordning på asciinema och video.
    "2017-06-09": (D, mos) Genomgången inför ht17, bort med CGI, nya videor.
    "2016-02-22": (C, mos) Genomgången, bort med onödig info och in med videor.
    "2016-01-20": (B, mos) Uppdaterad asciinema som refererade till bin/dbwebb.
    "2015-08-25": (A, mos) Flyttad från äldre artikel i tidigare utgåva av python.
...
Kom igång med ditt första program i Python
==================================

[FIGURE src=/image/snapht15/python3.png?w=c5&a=0,50,60,0 class="right"]

Denna artikel visar hur du kommer igång med Python och visar hur du skriver ditt första program i Python.

Artikeln visar även hur du kan jobba med exempelfiler från kursrepot för python-kursen.

<!--more-->



Förutsättning {#pre}
-------------------------------

Artikeln är en del av kursen python och förutsätter att du har en labbmiljö som motsvaras av [labbmiljön för kursen python](kurser/python/kmom01#labbmiljo).



### Kursmaterial från GitHub {#material}

I denna kursen jobbar du med exempelprogram och övningar som finns samlade i ett kursrepo, en kurskatalog. Du bör alltså ha ditt kursrepo framför dig nu. Du har det troligen i en katalog som du döpt till `dbwebb-kurser/python`.

Du kan även se allt [innehåll i kursrepot](https://github.com/dbwebb-se/python) via webbplatens GitHub. Det är samma innehåll som du laddade ned när du _klonade_ ditt kursrepo för kursen python.



Ditt första exempelprogram i Python {#forsta}
-------------------------------

I ditt kursrepo finns med ett par exempelprogram som ligger under katalogen `example`.

Du kan gå in i katalogen `example/hello` och köra ett av programmen som finns där.

```bash
# Gå till ditt kursrepo python
# Flytta nu till katalogen där exempelprogrammet ligger
$ cd example/hello
$ python3 hello.py
```

Du kan skriva kommandot `ls` för att se vilka filer som ligger i katalogen.

De filer som är Python-program brukar sluta på filändelsen `.py` och du kan köra dem genom att ange filnamnet som ett argument till kommandot `python3`.

```bash
$ python3 hello.py
```

Så här kan det se ut när du kör programmet.

[ASCIINEMA src=122865]

Så här kan du alltså köra ett Python-program via terminalen.

Under kursen gång kommer vi introducera olika verktyg för att visualisera hur koden exekveras, med andra ord körs. I detta första kursmoment introduceras <a href="http://www.pythontutor.com/visualize.html#mode=edit" target="_blank">ett enkelt webbgränssnitt</a>. Testa att kopiera in koden från filen `hello.py` i webbgränssnittet och tryck på knappen "Visualize Execution".



Ditt första egna exempelprogram {#andra}
-------------------------------

Så här tar du en kopia av exempelprogrammet, öppnar upp det i din editor och redigerar det med din egen kod.


###Ta en kopia {#kopia}

Du ska nu ta en kopia av exempel-programmet `hello.py` och spara i din me-katalog där du kan editera och testa fler konstruktioner.

Först ställer vi oss i rooten av kursrepot. Sedan kopierar vi filen `example/hello/hello.py` till katalogen `me/kmom01/plane`.

```bash
# Gå till ditt kursrepo python
$ cp -i example/hello/hello.py me/kmom01/plane
```

Tanken är att dina egna filer som du jobbar med under kursen samlas under katalogen `me`. Du kan nu gå in i din katalog `me/kmom01/plane` och köra filen igen.

```bash
# Gå till ditt kursrepo python
$ cd me/kmom01/plane
$ python3 hello.py
```

Du bör få samma utskrift som tidigare.



###Redigera exempelprogrammet {#redigera}

Låt se om vi kan redigera exempelprogrammet `hello.py` och lägga dit egen kod, till exempel att skriva ut vårt eget namn.

När du jobbar i terminalen kommer du att flytta runt bland katalogerna en del. Det är därför bra att kunna jobba i flera terminaler samtidigt, men i olika kataloger. Pröva att öppna en ny terminal och ställ dig i kursrepot och öppna texteditorn utifrån den katalogen.

```bash
# Gå till ditt kursrepo python
$ atom .
```

Kommandot ovan startar texteditorn Atom och använder `.` (den katalogen du står i) som nuvarande arbetskatalog.

Det kan vara en bra idé att alltid starta editorn på detta sätt, från rooten av kursrepot. Det finns nämligen en del konfigurationsfiler som ligger i rooten av kursrepot. De kommer att användas av Atoms pluginer, lite längre fram i kursen. När du öppnar editorn i rooten av kursrepot, så får Atom tillgång till dem.

Du kan nu redigera exempelprogrammet och lägga till en utskrift av ditt eget namn. Sedan kan du pröva att lägga till lite ASCII art (bilder gjorda med ASCII-tecken) och skriva ut det. Bild-googla "ASCII art" så hittar du exempel på bilder du kan använda.

Så här ser det ut när Kenneth kör igenom övningen från början till slut.

[YOUTUBE src=Qw57psOiLio width=630 caption="Kenneth kör igenom det första exempelprogrammet med Python med sitt namn."]

Observera kommentaren längst upp i filen `hello.py`. Detta kallas en `module docstring`. Kommentarer/docstring påverkar inte koden eller exekvering. Kommentarer är det ända i filen som inte är till för datorn att läsa, kommentarer finns för utvecklaren. Du skapar en `module docstring ` genom att lägga en kommentar inkapslat i `"""` längst upp i din fil. Nedan syns ett exempel på en `module docstring`.

```python
"""
This program prints Hello World
"""
print("Hello World")
```

Det skulle kunna se ut så här när du är klar.

[ASCIINEMA src=122883 caption="Jag döpte min fil till hello-name.py..."]

Du har nu ett fungerande python-program som ligger i en egen fil och som du kan exekvera genom att "köra" filen. Ditt första python-program i denna kursen, det är en bra start.


När det blir fel {#fel}
-------------------------------

Låt oss prata kort om fel i programkoden.



###Ibland blir det fel {#ibland}

Ibland blir det fel. Din uppgift som programmerare är att undvika fel och när de uppträder så måste du avgränsa felet till en rad eller ett litet område och sedan fixa problemet.

Kom ihåg att det finns ingen magi i programmering. Det är instruktioner som exekveras och instruktionerna måste följa ett mönster. När mönstret inte följs så kan programmet inte exekvera. När du har rättat till instruktionerna, programkoden, så fungerar det igen.

Kom ihåg: ingen magi, bara instruktioner som måste följa givna regler.

Det är lätt att bli stressad när man försöker laga ett fel men det hjälper ingen att bli stressad. Försök att vara lugn, metodisk och avgränsa vad som fungerar och vad som inte fungerar.



###Ett program med fel {#felprogram}

Det finns ett exempelprogram som innehåller ett par felaktigheter. Ta en kopia av det och lägg i din katalog `me/kmom01/plane`.

```bash
# Gå till ditt kursrepo python
$ cp example/hello/hello-fel.py_ me/kmom01/plane/hello-fel.py
$ cd me/kmom01/plane
$ python3 hello-fel.py
Traceback (most recent call last):
  File "hello-fel.py", line 8, in <module>
    prin("Just saying Hello World")
NameError: name 'prin' is not defined
```

Det du ser är ett felmeddelande som pekar på en viss rad i programmet. Det säger att namnet "prin" inte är definierat. Kika på kodraden så kan du se att programmeraren försöker skriva ut ett meddelande men funktionen som skriver ut heter `print` och inte `prin`.

Rätta raden och kör programmet igen.

```bash
$ python3 hello-fel.py
Just saying Hello World
Traceback (most recent call last):
  File "example/hello/hello-fel.py_", line 12, in <module>
    print(str2)
NameError: name 'str2' is not defined
```

Ett nytt felmeddelande som pekar på rad 12. Här används en variabel `str2` som inte är definierad. Här har programmeraren troligen missat att det är variabeln `str1` som skall användas.

Rätta det felet och försök igen.

Här är en video där Kenneth rättar alla fel som finns i programmet.

[YOUTUBE src=8NN1YUEUYlQ width=630 caption="Kenneth visar hur man rättar alla fel som finns i programmet."]

Det var lite kort om felsökning. Det är vardag för en programmerare.



Validera din kod {#validera}
-------------------------------

De fel som du fick ovan var exekveringsfel, de inträffade när du exekverade programmet. För att undvika dem så kan man validera sitt program. En validator går igenom koden och försöker upptäcka felaktigheter innan programmet körs.

I kurserna använder vi ett antal olika validatorer som körs via kommandot `dbwebb`.

För att testa så kan du ta en ny kopia av programkoden som innehöll felaktigheter och sedan kör du `dbwebb validate kmom01` som validerar koden i mappen `me/kmom01`.

```bash
# Gå till ditt kursrepo python
$ cp example/hello/hello-fel.py_ me/kmom01/plane/hello-fel-igen.py
$ dbwebb validate kmom01
# utelämnar vissa delar av utskriften...
*.py using pylint

WARNING pylint failed: './me/kmom01/plane/hello-fel-igen.py'
************* Module hello-fel-igen
E:  8, 0: Undefined variable 'prin' (undefined-variable)
E: 12, 6: Using variable 'str2' before assignment (used-before-assignment)
E: 17,19: Using variable 'str4' before assignment (used-before-assignment)
```

Det du ser är liknande felaktigheter som du fick när du exekverade programmet tidigare. Detta är ett sätt att analysera ett program utan att köra det. På det viset kan man upptäcka problem med koden innan man exekverar den.

Så här kan det se ut när du kör alla kommandon.

[ASCIINEMA src=124048]

Du vill att alla dina filer skall validera så när du får valideringsfel så behöver du fixa dem. Det finns många olika typer av valideringsfel så det enklaste är att lösa dem efterhand som de dyker upp.

Valideringen kan upptäcka direkta felaktigheter men också tveksamma konstruktioner i din kod, konstruktioner som kan vara fel, men behöver inte vara det. Det kan också vara konstruktioner som inte är lämpliga för att de är en potentiell felkälla.

Kolla på videon med nedanför där Kenneth förklarar felen och hur man löser dem.

[YOUTUBE src=X9rngBcaHpA width=630 caption="Andreas visar hur man validerar koden."]

Validering är alltså ett sätt att kvalitetssäkra din kod. Valideringen kan upptäcka potentiella felaktigheter som inte syns när du exekverar koden. Valideringsverktyg är viktiga verktyg för en proffsprogrammerare.

Du kan nu radera filerna så att de inte ligger och ger felmeddelande.

```bash
# Gå till ditt kursrepo python
$ rm me/kmom01/plane/hello-fel-igen.py me/kmom01/plane/hello-fel.py me/kmom01/plane/hello.py 
```



Pylint styleguide {#styleguide}
-----------------------------------------------------

Pylint varnar inte enbart för direkta felaktigheter utan även för "dålig" programmeringsstil. Vem är Pylint som säger hur jag skall skriva min kod? Vad ligger bakom Pylints resonemang?

Python har en egen [styleguide](http://legacy.python.org/dev/peps/pep-0008/) för hur man skall skriva sin kod. Kika gärna i den och använd den som referens under kursens gång. En styleguide är alltid en rekommendation, men det är viktigt att följa en styleguide när man kodar. Pylint använder sig av styleguiden när den kontrollerar din kod.

Valideringen kontrollerar att du följer styleguiden och att det inte finns några uppenbara problem eller felaktigheter med din kod.

Gör ditt bästa för att alltid skriva kod som går igenom valideringen. Annars finns risken att du får komplettera dina redovisningar.

Har du [funderingar om Pylint och hur det används i kursen](/t/2565) så finns det en särskild forumtråd där det diskuteras.



Hjälp mig online {#hjalp}
-------------------------------

När man kodar kan man behöva hjälp av en kompis. För att enklast få hjälp så behöver man formulera sin fråga och visa upp koden man jobbar med. Ett sätt att visa koden är att skapa en CodeShare eller en Gist. Då får man länkar som man kan dela med sig i en chatt eller forum. Men kom ihåg att formulera din fråga, det ger dig snabbare och bättre svar.

Här kan du se två exempel på när jag använder dessa tjänster.

* [Hello World på Code Share](http://codeshare.io/jql9s)
* [Hello World på Gist](https://gist.github.com/mosbth/b274bd08aab0ed0f9521)

Dela bara med dig av den koden som är problematisk. Stora exempelprogram är det få som vill hjälpa till med. Förenkla för den som skall hjälpa dig. Då får du snabbare svar.

[YOUTUBE src=lrVtvqlhWjY width=630 caption="Kenneth visar hur man delar och visar upp koden."]



Avslutningsvis {#avslutning}
------------------------------

Du har nu kommit igång med strukturen kring Python och du har kört och felsökt i ditt första Python-program. Det är en bra start och nu är du redo att börja lära dig programmeringsspråket Python. Allt är på plats.

Det finns en [forumtråd till denna artikel](t/6524), i forumtråden kan du ställa frågor om artikeln eller bidra med tips och trix.
