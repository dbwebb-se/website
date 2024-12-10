---
author: mos
category: labbmiljo
revision:
  "2024-12-10": (F, aar) Uppdatera instruktion för nya wsl inte har pip3 förinstallerat.
  "2022-01-12": (E, aar) Uppdaterade hur installerar pip.
  "2021-01-16": (D, aar) La till stycke om gcc problem i cygwin.
  "2021-01-07": (C, aar) Flyttade runt stycken då pip kommer för installerat i nyare versioner av python.
  "2016-03-07": (B, mos) Ändrade paketnamn på Debian till python3-pip.
  "2014-09-17": (A, mos) Första utgåvan för python kursen.
updated: "2016-04-07 22:46:00"
created: "2014-09-17 13:10:18"
...
Python pakethantering med PIP
==================================

Python har många inbyggda moduler men det finns många fler externa moduler som kan användas. PIP är ett verktyg för att installera sådana externa moduler. Det är en pakethanterare för Pythons externa moduler.

Denna artikel beskriver kortfattat hur du jobbar med PIP och hur du installerar `pip3` för Python 3.

<!--more-->


Om PIP {#pip}
--------------------------------------

PIP är en pakethanterare för python moduler. Du kan läsa om [PIP på deras webbplats](https://pip.pypa.io/en/latest/). 

Som ett exempel på hur det kan se ut när en referens görs till att du *"kan installera modulen med pip"* så kikar vi på [installationsbeskrivningen för Python-modulen `requests`](http://docs.python-requests.org/en/latest/user/install/#install).

Så här står det där.

```bash
pip3 install <paket>
```

Nåväl, först behöver vi installera PIP.



Använda PIP {#pip}
--------------------------------------

Från och med Python 3.4 så ska pip följa med python installationen. Försök kolla vilken version av pip som är installerat. Om kommandot inte finns hoppa ner till [Installera PIP för Python 3](#installera) för att installera det.



###Vilken version har jag? {#pip1}

Nu kan du köra kommandot `pip3`. Skriv `pip3 --version` för att se vilken version du har och för att dubbelkolla att pip är kopplad mot Python 3.

```bash
pip3 --version
```

Vi kör python 3 och därför använder vi `pip3` som kommando.

Om du inte har pip3 installerat kan du installera det med `python3 -m ensurepip --upgrade".


### Installera pip {#installera}

På Mac kommer pip3 förinstallerat med Python 3.

#### Linux/WSL {#wsl}

Kör kommandot `sudo apt install python3-pip`.
<!-- 
###Uppdatera pip och setuptools {#pip2}

Innan ni börjar använda pip är det bra att uppdatera det och en modul som används för att installera andra moduler.

```bash
pip3 install --upgrade pip
pip3 install --upgrade setuptools
```



###Installera moduler {#pip3}

När du har installerat PIP kan du installera moduler. I exemplet installeras Python-modulen `request`.

```bash
pip3 install requests
```

Pip försöker installera paket på fler olika sätt. Ett av dem kallas `wheel`, om ni får i utskriften typ 2-3 rader med röd text och det står något med wheel, men installationen fortsätter ändå. Då kan ni ignorera felet, det betyder bara att wheel inte funkade och sen använde pip ett annat verktyg för att installera.



#### Cygwin problem {#cygwin-problem}

Det finns ett känt fel som vissa med cygwin får när de försöker installera ett paket.

[FIGURE src="image/oopython/kmom01/pip-cygwin-gcc-error.jpg" caption="gcc error i cygwin."]

Lösningen är inte alltid självklar men vi har en lösning som oftast funkar. Ladda ner installations filen för Cygwin, och starta den. När du kommer till steget där du kan installera paket, i dropdown för `View` välj `full`. Sök sen på `gcc` och kolla att följande paket är installerade `gcc-core`, `gcc-g++`, `libgcc1`. Om de inte är installerade, installera dem annars klicka så de ominstalleras. Sök sen på `python3-devel`, installera eller ominstallera. Det sista paketet är `python3X-devel`, där `X` är din python version. Om du har python3.7 ska `X` vara 7 osv. När du har klickat i installera eller ominstallera alla paket kör klart installationen. Nu ska förhoppnings vis `pip install` fungera. Om det inte hjälpte, kontakta kursansvarig.




###Hantera installerade moduler {#pip3}

Du kan kolla upp vilken version du har av en viss modul.

```bash
pip3 show requests
```

Du kan även se alla moduler som är installerade.

```
pip3 list
``` -->



Avslutningsvis {#avslutning}
--------------------------------------

Kika på hemsidan för PIP för att lära dig fler kommandon om själva pakethanteraren.

Har du frågor kring PIP så finns det en särskild [forumtråd kopplad till denna artikeln](t/2725).




