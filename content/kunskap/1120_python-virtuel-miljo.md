---
author: aar
category: labbmiljo
revision:
  "2023-01-11": (E, grm) Uppdaterade versioner för pylint och Flask.
  "2022-01-12": (D, aar) La till sektion om att installera venv.
  "2019-01-12": (C, aar) La till varning om python länk inte är ett kommando.
  "2019-01-12": (B, aar) Tog bort dbwebb venv kommandot.
  "2018-11-21": (A, aar) första utgåva för oopython kursen.
...
Python pakethantering med venv
==================================

Python har många inbyggda moduler men det finns många fler externa moduler som kan användas. Här ska vi kolla på Virtual environments, även kallat venv, vilket är ett sätt att isolera paket från den globala installationen. Det ger oss möjligheten att installera versions specifika paket för olika projekt.

Denna artikel beskriver kortfattat hur du jobbar med PIP och venv.

<!--more-->

Installera moduler i Python {#modules}
---------------------------------------

**Innan** vi kollar på hur vi jobbar med externa moduler behöver vi veta hur vi installerar dem. Läs igenom artikeln [Python pakethantering med pip](kunskap/python-pakethantering-med-pip).



Virtual environment {#venv}
--------------------------------------

När man använder pip installeras paket globalt vilket bl.a. innebär att om vi har flera olika Python projekt på datorn måste alla dem använda samma version av ett paket. T.ex. Proj1 kan inte använda requests 1.3 medan proj2 använder requests 1.7. Utan virtual environments kan request modulen bara installeras en gång och då används den överallt.

Lösningen på detta är [Virtual environment](https://docs.python.org/3/tutorial/venv.html) även kallat **venv**. Venv är ett sätt att isolera paket från övriga paket installerade på resten av ett system. Detta gör att vi kan installera paket för specifika projekt utan att det krockar med globala installationer eller andra projekts installationer.

Jag använder paketen från kursen OOPython som exempel.


###Installera venv {#venv_install}

####Cygwin {#cygwin_install}

Installera med `apt-cyg install python3-virtualenv`.

####Linux {#linux_install}

Installera med `apt-get install python3-venv`.

####Brew {#mac_install}

Ni behöver inte installera något på Mac.



###Skapa venv {#create}

För att skapa en virtuell miljö behöver man bestämma var man vill placera den. Vi har som standard att lägga den i roten för ett projekt/kursrepo.

```bash
# stå i roten av ditt projekt/kursrepo
# på linux och mac kör
python3 -m venv .venv
# på cygwin är det antingen samma som ovanför eller den nedanför, det varierar. Om den ena inte funkar testa med den andra
python3 -m virtualenv .venv

# det är ingen utskrift om det fungerade
```

Nu har det skapats en ny mapp som heter `.venv` i roten och det har lagts till en mängd filer och mappar i den.

[FIGURE src=/image/oopython/venv_dir.png caption="Mapp strukturen i mappen '.venv'."]

I .venv mappen skapas en liten avskalad python miljö med länkar till den globala installationen av python. Vi kan se det i bilden där det står `python3 -> /usr/bin/python3` (kör **inte** detta som ett kommando).



### Aktivera den virtuella miljön {#venv_activate}

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
Flask == 2.2.2
sentry-sdk == 1.39.1
```

Det betyder att modulen Flask med en version som är kompatibel med 2.2.2 och modulen sentry-sdk med version kompatibel med 1.39.1 behövs. Vi installera enkelt de både paketen genom att skriva:
    
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
