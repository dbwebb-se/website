---
author:
    - lew
revision:
    "2019-03-25": (A, lew) Ny inför HT19.
...
Kmom03: Introduktion till Docker
==================================

Nu har vi en Linux-server och en webbserver. Låt oss nu bekanta oss med en annan teknik för virtualisering: Docker. Vi kommer även bekanta oss med skriptprogrammering i Bash.

Mycket handlar om att förenkla vardagen, som programmerare, genom att automatisera de processer och rutiner man utför. En hel del av det vi gör kan automatiseras via skript, till exempel Bash-skript med kommandon. Men för att göra det behöver vi ha koll på hur man skapar skript och hur man programmerar i bash.

Man behöver också ha en rätt bra koll på vanliga kommandon i Linux-terminalen. Det finns kommandon som är kraftfulla och om vi bara lära oss ett par av dessa kommandon så kan de spara en hel del tid åt oss.

<!--more-->

[FIGURE src=/image/snapht15/vim-solutions.png caption="Låt oss komma igång med skriptprogrammering i Bash."]


<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Läsanvisningar  {#lasanvisningar}
---------------------------------

*(ca: 8-12 studietimmar)*


### Kurslitteratur  {#kurslitteratur}

Läs följande:

1. [The Linux Command Line](kunskap/boken-the-linux-command-line)
    * Kapitel 6 Redirection
    * Kapitel 24 Writing Your First Script



### Artiklar {#artiklar}

1. Boken "The Linux Command Line" har en webbplats där det finns [ett stycke med fokus på att skriva shell scripts](http://linuxcommand.org/lc3_writing_shell_scripts.php). Ta det som ett komplement till boken.



### Video  {#video}

Titta på följande:

1. Till kursen finns en videoserie, "[vlinux](https://www.youtube.com/watch?v=a2P26Zgy_mE&list=PLKtP9l5q3ce_WHGUiZfo9wr1C3aWaSYa7)", kika på de videor som börjar på 03.

1. Kris Occhipinti har en serie om [skriptprogrammering med Bash på YouTube](https://www.youtube.com/playlist?list=PLcUid3OP_4OXOUqYTDGjq-iEwtBf-3l2E). Det är många avsnitt och du kan välja vilka du vill titta på. Videorna ger dig bra bas-kunskaper i Bash.



### Lästips {#lastips}

1. Det finns en [referensmanual till Bash](http://www.gnu.org/software/bash/manual/bashref.html). Kika gärna i den.

1. Det finns en populär guide för att [komma igång med Bash och programmering i Bash](http://mywiki.wooledge.org/BashGuide). Samma webbplats har en [FAQ om Bash](http://mywiki.wooledge.org/BashFAQ).

1. Bekanta dig med dokumentationen [för Docker](https://docs.docker.com/).

1. [Reddit har en kanal om Bash](https://www.reddit.com/r/bash/) där man kan se både nybörjare och erfarna prata om Bash. Det kan vara intressant att läsa igenom ett par inlägg i kanalen för att få en känsla om vad Bash handlar om.



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 4-10 studietimmar)*



### Övningar {#ovningar}

Genomför följande övningar.

1. Installera Docker som en del av [labbmiljön](kunskap/installera-virtualiseringsmiljon-docker).

1. Jobba igenom artikeln ["Skapa Bash-skript med options, command och arguments"](kunskap/skapa-bash-skript-med-options-command-och-arguments). Den ger dig en struktur till hur du kan skapa Bash-skript.

1. Kika i guiden [kom igång med Bash](guide/kom-igang-med-bash), där du hittar beskrivningar om de vanligaste konstruktionerna.

1. Det finns även en [guide för Docker](guide/docker). Luta dig mot den när det är installerat.



### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften [Lab 2](uppgift/linux-lab-2-sok-i-en-logg-fil) för att öva på kommandon som underlättar vid sökning i logg-filar.

1. Gör uppgiften "[Bash-script med argument options](uppgift/ett-bash-script-med-options-command-arguments)". Spara arbetet i mappen `script`.

1. Gör uppgiften "[Skapa Docker image](uppgift/skapa-docker-image)". Du fortsätter arbeta i mappen `script`.

1. Lägg till redovisningstexten i din me-sida.

<!--
1. Gör uppgiften "[Hitta saker i en loggfil med Unix-kommandon](uppgift/hitta-saker-i-en-loggfil-med-unix-kommandon)".
-->
<!-- 1. Gör uppgiften "[Mina första Bash-script](uppgift/mina-forsta-bash-script)". -->



### Extra {#extra}

Det finns inga extra uppgifter.



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

* Är detta din första bekantskap med skriptprogrammering i Bash?
* Berätta om din uppfattning om Bash som programmeringsmiljö, relatera till andra programspråk du kan.
* Vilka möjligheter/utmaningar ser du med denna typen av skriptprogrammering?
* Var det något som var extra svårt eller utmanande i uppgifterna?
* Har du arbetat med Docker innan?
* Anser du att det är någon fördel/nackdel med Docker om du jämför med VirtualBox?
