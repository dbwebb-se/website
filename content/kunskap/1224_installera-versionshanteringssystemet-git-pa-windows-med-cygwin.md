---
author:
    - mos
category:
    - labbmiljö
    - webbprogrammering
revision:
    "2022-08-16": (C, mos) Flyttad till egen artikel då cygwin inte längre är rekommenderat val.
    "2017-05-30": (B, mos) Genomgången inför ht17.
    "2015-03-27": (A, mos) Första utgåvan.
...
Installera versionshanteringssystemet Git på Windows med Cygwin
==================================

[FIGURE src=/image/git/logo.png class="right"]

Git är ett versionshanteringssystem som utvecklades i samband med arbetet med Linux-kärnan. Git har nu det blivit ett alltmer populärt verktyg för att hantera kod.

Här är en kort guide till hur du installerar Git på Windows och använder det tillsammans med terminalen Cygwin.

<!--more-->

Git finns till flera operativsystem, går under en fri licens och utvecklas som [öppen källkod på GitHub](https://github.com/git).



Läs på {#laspa}
--------------------------------------

[Gå till Gits hemsida](http://git-scm.com/) och kika på de alternativ som finns för att installera Git.



Installera på Windows (Cygwin) {#install-win}
--------------------------------------

Ladda ned och starta installationsprogrammet. Klicka dig fram tills du kommer till denna rutan.

[FIGURE src=/image/git/git-install-to-path.png caption="Se till att mittenvalet är gjort, du måste kunna använda Git från terminalen `cmd.exe`."]

När du ser följande ruta (nedan) så skall du välja det sista valet som inte gör någon automatisk påverkan på dina filer. 

[FIGURE src=/image/git/git-install-as-is.png caption="Se till att sista valet är gjort, Git skall inte ändra dina filer per automatik."]

I övrigt kan du använda förvalda inställningar.



### Testa installationen {#test-win}

Testa installationen genom att köra följande kommando i din `cmd.exe`.

```bash
git --version
git
```

Det kan se ut så här.

[FIGURE src=/image/git/git-version.png caption="Kommandot Git finns nu i pathen och kan köras från `cmd.exe`."]



Avslutningsvis {#avslutning}
--------------------------------------

Denna artikel visar enbart hur du installerar Git. Att lära sig använda Git är en annan sak.

För att komma igång med de första kurserna på dbwebb så behöver du inte kunna något om Git så att ha det installerat är tillräckligt bra.

Om du ändå vill lära dig mer om Git så finns här ett par förslag.

På webbplatsen för Git finns det en webbaserad övning om 15 minuter som [hjälper dig att komma igång med grunderna för Git](http://try.github.com/).

Här finns en artikel som visar hur du kan [komma igång med Git tillsammans med webbtjänsten GitHub](kunskap/kom-igang-med-git-och-github).
