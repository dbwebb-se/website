---
author:
    - mos
category:
    - labbmiljö
    - webbprogrammering
revision:
    "2022-08-16": (C, mos) Uppdaterad inför ht22 ändrar cygwin till wsl/ubuntu.
    "2017-05-30": (B, mos) Genomgången inför ht17.
    "2015-03-27": (A, mos) Första utgåvan.
...
Installera versionshanteringssystemet Git
==================================

[FIGURE src=/image/git/logo.png class="right"]

Git är ett versionshanteringssystem som utvecklades i samband med arbetet med Linux-kärnan. Git har nu det blivit ett alltmer populärt verktyg för att hantera kod.

Här är en kort guide till hur du *installerar* Git på din egen maskin.

<!--more-->

Git finns till flera operativsystem, går under en fri licens och utvecklas som [öppen källkod på GitHub](https://github.com/git).



Läs på {#laspa}
--------------------------------------

[Gå till Gits hemsida](http://git-scm.com/) och kika på de alternativ som finns för att installera Git.

Om du använder Cygwin på Windows så [installerar du Git på Windows](kunskap/installera-versionshanteringssystemet-git-pa-windows-med-cygwin).

Följ sedan instruktionerna för respektive miljö nedan. Börja med installationen, sedan kan du testa att det fungerar.




Installera {#install}
--------------------------------------

Välj din miljö och installera Git.



### Installera på Windows (WSL/Bash) {#install-win-bash}

Git finns förinstallerat när du använder WSL med Bash/Ubuntu för Windows.



### Installera på Mac OS {#install-mac}

På vissa versioner av Mac OS så finns Git redan installerat som en del av systemet. Men om du har en nyare version av Mac OS som Ventura så installerar du git.

```bash
brew install git
```

Om inte testet av Git funkar, så starta om ditt terminalfönster och testa igen.


### Installera på Linux/Unix {#install-nix}

På Ubuntu och Debian Linux kan du installera med pakethanteraren.

```bash
apt install git
```



Testa installationen {#test}
--------------------------------------

Testa att installationen finns på plats genom att följande kommando i en terminal.

```bash
git --version
git
```

Du kommer se vilken version du har installerat och du får en hjälptext som visar detaljer om hur kommanot fungerar.



Avslutningsvis {#avslutning}
--------------------------------------

Denna artikel visar enbart hur du installerar Git eftersom det är en del av labbmiljön som används till kurserna. Att lära sig använda Git är en annan sak.

För att komma igång med de första kurserna på dbwebb så behöver du inte kunna något om Git så att ha det installerat är tillräckligt bra.

Om du ändå vill lära dig mer om Git så finns här ett par förslag.

På webbplatsen för Git finns det en webbaserad övning om 15 minuter som [hjälper dig att komma igång med grunderna för Git](http://try.github.com/).

Här finns en artikel som visar hur du kan [komma igång med Git tillsammans med webbtjänsten GitHub](kunskap/kom-igang-med-git-och-github).
