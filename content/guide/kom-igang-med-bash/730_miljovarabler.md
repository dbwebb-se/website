---
author: lew
revision:
    "2023-09-12": "(A, lew) Första versionen."
...

Använda miljövariabler i script
=======================

Det finns i varje shell inbyggda miljövariabler. De innehåller ofta information om nuvarnade sessins miljö som tex nuvarande användare, shell, datornamn och teckenkodning. Vi kan sätta egna miljövariabler som bara finns medan sessionen är aktiv så de tas bort när man stänger ner terminalen. Smidigt. Om man vill ha kvar dem och att de ska läsas in varje gång man startar en session (nytt terminalfönster) kan man lägga in exporten av dem i någon konfigurationsfil tex `~/.bashrc` eller någon profile-variant. Det finns lite olika filer beroende på vilket system man använder.

Vi kan se de miljövariabler som är aktiva med kommandot `$ env`. Vi får då lista med variabler tex `HOME=/home/klw` och `SHELL=/bin/bash`. För att nå värdet i dem lägger vi till ett dollartecken framför:

```console
$ echo $HOME
/home/klw
```

### Egna variabler

Man kan nyttja det här på olika sätt. Ett exempel är att man kan ha någon slags token för någon webbtjänst dold som en miljövaribel och då kunna använda den på serversidan men inte nå den utifrån. Vi sätter en egen på följande sätt:

```console
$ COURSE="vlinux"
```

Då finns den enbart i det shellet din befinner dig i så skulle du stata ett subshell eller byta användare finns den inte tillgänglig.

För att göra den tillgänglig exporterar vi den :

```console
$ export COURSE=vlinux
```

Då kan vi se den via kommandot `env` och andra användare kan nyttja den.


### Kontrollera variabel via script

Vi tittar på hur det kan se ut i Bash när vi kontrollerar om en varibel är satt eller inte. Man kan ju då passa på att sätta dit ett defaultvärde.

```bash
#!/usr/bin/env bash

COURSE=${COURSE:-"python"}

echo $COURSE
```

Om vi har exporterat variabeln så kommer vi se vlinux, annars blir det python. Du finner olika konstruktioner i [exempelmappen](https://github.com/dbwebb-se/vlinux/tree/master/example/bash/environment-variables-with-defaults).


