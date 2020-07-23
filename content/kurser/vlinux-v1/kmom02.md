---
author:
    - lew
    - mos
revision:
    "2017-12-21": (D, lew) Genomgången inför HT19.
    "2017-12-21": (C, mos) Genomgången inför vt17.
    "2017-01-16": (B, efo/mos) Genomgången och ändring av länk till ny bash lab.
    "2015-07-03": (A, mos) Första utgåvan för kursen.
...
Kmom02: Apache Virtual Hosts
==================================

Nu har vi en Linux-server. Låt oss installera ett par webbplatser på den. Det låter som en vettig syssla för en webbprogrammerare.

Ett bra sätt att installera många webbplatser på en och samma maskin är Apache Virtual Hosts och det är något vi skall bekanta oss med.

Samtidigt behöver vi bekanta oss med fler Unix-kommandon så vi känner oss hemma i terminalen, SSH och att jobba med Linux som en server.


<!--more-->

[FIGURE src=/image/snapht15/tmux-create-windows.png caption="Jobba med fönster i terminalen med tmux."]

[FIGURE src=/image/snapht15/vhosts.png caption="Låt oss skapa en webbplats som en Apache Name-based Virtual Host."]


<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Läsanvisningar  {#lasanvisningar}
---------------------------------

*(ca: 4-10 studietimmar)*


###Kurslitteratur  {#kurslitteratur}

Läs följande:

1. [The Linux Command Line](kunskap/boken-the-linux-command-line)
    * Kapitel 1-4, repetera grundläggande kommandon

I referenslitteraturen, är följande kapitel relevanta.

1. [The Debian Administrator's Handbook](kunskap/boken-the-debian-administrator-s-handbook).
    * Ch 6: Maintenance and Updates: The APT Tools (speciellt om `apt-get`, annars översiktligt)
    * Ch 7: Solving Problems and Finding Relevant Information (översiktligt)



###Artiklar {#artiklar}

1. Boken "The Linux Command Line" har en webbplats där det finns [ett stycke med fokus på att lära sig terminalen](http://linuxcommand.org/lc3_learning_the_shell.php). Ta det som ett lättläst komplement till boken.



###Video  {#video}

Titta på följande:

1. Till kursen finns en videoserie, "[vlinux](https://www.youtube.com/watch?v=a2P26Zgy_mE&list=PLKtP9l5q3ce_WHGUiZfo9wr1C3aWaSYa7)", kika på de videor som börjar på 02.



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 6-10 studietimmar)*



### Övningar {#ovningar}

Genomför följande övningar.

1. Jobba igenom guiden "[Kom igång med SSH-nycklar](guide/unix-tools/kom-igang-med-ssh-nycklar)".

1. Jobba igenom guiden om "[tmux](guide/unix-tools/tmux)".

1. Jobba igenom guiden om "[rsync](guide/unix-tools/rsync)".

1. Jobba igenom guiden om "[Apache Name-based Virtual Hosts](guide/unix-tools/apache)".



###Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften [Lab 1](uppgift/linux-lab-1-introduktion-till-bash) för att träna upp grundläggande färdigheter i bash och hantering av filsystem.

1. Gör uppgiften "[Skapa en webbplats på en Apache Virtual Host](uppgift/skapa-en-webbplats-pa-en-apache-virtual-host)".

1. Lägg till redovisningstexten i din me-sida.

<!--
1. Gör uppgiften "[Strukturera filer, kataloger och rättigheter i en webbplats](uppgift/strukturera-filer-kataloger-och-rattigheter-i-en-webbplats)".
-->



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

* Hur känns konceptet med Apache name-based Virtual Hosts? Känner du igen det sedan tidigare?
* Det blir allt fler kommandon i terminalen, hur känns det med terminalen och dess kommandon?
* Gick det bra med ssh-nycklar och rsync över ssh?
* Hur kändes det att jobba med tmux?
* Reflektera över hur du känner inför Unix som operativsystem så här långt?
