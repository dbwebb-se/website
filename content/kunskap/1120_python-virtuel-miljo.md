---
author: aar
category: labbmiljo
revision:
  "2019-01-12": (B, aar) Tog bort dbwebb venv kommandot.
  "2018-11-21": (A, aar) första utgåva för oopython kursen.
...
Python pakethantering med venv
==================================

Python har många inbyggda moduler men det finns många fler externa moduler som kan användas. Vi har i artikeln [Python pakethantering med pip](kunskap/python-pakethantering-med-pip) kollat på hur man installerar sådana externa moduler. Här ska vi kolla på Virtual environments, även kallat venv, vilket är ett sätt att isolera paket från den globala installationen. Det ger oss möjligheten att installera versions specifika paket för olika projekt.

Denna artikel beskriver kortfattat hur du jobbar med PIP och venv.

<!--more-->



Virtual environment {#venv}
--------------------------------------

När man använder pip installeras paket globalt vilket bl.a. innebär att om vi har flera olika Python projekt på datorn måste alla dem använda samma version av ett paket. Proj1 kan inte använda requests 1.3 medan proj2 använder requests 2.3 utan requests kan bara installeras en gång och då används den överallt.

Lösningen på detta är [Virtual environment](https://docs.python.org/3/tutorial/venv.html) även kallat **venv**. Venv är ett sätt att isolera paket från övriga paket installerade på resten av ett system. Detta gör att vi kan installera paket för specifika projekt utan att det krockar med globala installationer eller andra projekts installationer.

Jag använder paketen från kursen OOPython som exempel.



###Skapa virtuell miljö {#venv_install}

För att skapa en virtuell miljö behöver man bestämma var man vill placera den. Vi har som standard att lägga den i roten för ett projekt. Sen använder vi modulen `venv` för att skapa den virtuella miljön. Modulen ska följa med när man installerar Python3.

```bash
# Stå i roten av ditt projekt
$ python3 -m venv .venv
```

Om man inte har `venv` installerat på Linux kan man få upp följande meddelande:
```bash
The virtual environment was not created successfully because ensurepip is not
available.  On Debian/Ubuntu systems, you need to install the python3-venv
package using the following command.

    apt-get install python3-venv
```
Gör som står och installerar `venv` och kör sen kommandot igen.

Nu har det skapats en ny mapp som heter `.venv` i roten och det har lagts till en mängd filer och mappar i den.

[FIGURE src=/image/oopython/venv_dir.png caption="Mapp struktur i mappen '.venv'."]



###Aktivera den virtuella miljön {#venv_activate}

När vi har en virtuell miljö skapad behöver vi aktivera den för att använda den. Att aktivera den virtuella miljön innebär att när vi använder pip/python3 kommer det jobba mot filerna som ligger i `.venv` mappen. När vi t.ex. installerar paket med pip läggs det i en undermapp till `.venv`. 

Vi använder kommandot `source .venv/bin/activate` för att aktivera den virtuella miljön.

```bash
# Stå i roten av ditt projekt
$ which python3
/usr/bin/python3
$ source .venv/bin/activate
(.venv) $ which python3
/home/aar/dbwebb-kurser/oopython/.venv/bin/python3
(.venv) $ which pip3
/home/aar/dbwebb-kurser/oopython/.venv/bin/pip3
```

Notera att innan jag aktiverade venv står det att `python3` ligger i `/usr/bin/python3`. Efter aktivering står det att python3 ligger i den virtuella miljön istället. Notera även att efter jag har aktiverat venv står det `(.venv)` i början av min kommandorad, det är så du vet att den virtuella miljön är aktiverad. 



###Deaktivera virtuell miljö {#venv_deactivate}

När vi inte längre vill jobba med den virtuella miljön behöver vi deaktivera den, då går prompten tillbaka till sin normala form och den globala Python installationen används. 

```bash
# Stå i valfri mapp
(.venv) $ deactivate
$ which python3
/usr/bin/pip3
```

Kommandot för deaktivering kan köras från vilken mapp som helst på datorn, man måste inte stå i roten.



###Pip med requirements file {#requirements_file}

Nu när vi har en virtuell miljö vi kan installera paket i, tar vi pip installationerna ett steg längre och använder oss av en "[Requirements file](https://pip.pypa.io/en/stable/user_guide/#requirements-files)". Det är ett sätt att enkelt kunna specificera vilka externa paket, med version, som behövs för ett projekt. Vi har en i [OOPython kursen](https://github.com/dbwebb-se/oopython/blob/master/.requirements.txt), filen heter `.requirements.txt`, och innehåller följande:

```
Flask ~= 1.0.2
Jinja2 ~= 2.10
```

Det betyder att modulen Flask med en version som är kompatibel med 1.0.2 och modulen Jinja2 med version kompatibel med 2.10 behövs. Vi installera enkelt de både paketen genom att skriva:
    
```bash
(.venv) $ pip3 install -r .requirements.txt
```

Glöm inte inte aktivera venv så att paketen lägger sig i den virtuella miljön. För att testa så det gick rätt till kan vi öppna en Python interpretator och försöka importer Flask.

```bash
(.venv) $ python3
>>> import flask
```

Inga felmeddelanden dök upp, precis som det ska vara. Vi testar även när vi har deaktiverat venv.

```bash
(.venv) $ deactivate
$ python3
>>> import flask
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ImportError: No module named 'flask'
```

Nu fick vi fel, precis som vi förväntar oss. Man måste ha aktiverat venv för att kunna använda modulen.



Avslutningsvis {#avslutning}
--------------------------------------

Kika på hemsidan för venv och requirement.txt för att lära dig mer om hur det fungerar.

Har du frågor kring venv så finns det en särskild [forumtråd kopplad till denna artikeln](t/7008).
