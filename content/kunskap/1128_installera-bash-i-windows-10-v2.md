---
views:
    flash:
        region: flash
        template: default/image
        data:
            src: "image/snapvt19/windows-cowsay.png?c=800,200,0,0&w=1100&sharpen"
author:
    - mos
category:
    - labbmiljo
    - windows
    - bash
revision:
    "2020-04-29": "(E, mos) Lade till unzip som kommando att installera (krävs av composer)."
    "2019-08-22": "(D, aurora) Översedd inför HT19 och Windows 10 v1903."
    "2019-01-16": "(C, mos) Förtydligande om var filer bör sparas och hur atom startas, bort med stycket om atom."
    "2019-01-13": "(B, mos) Lade till installation av nödvändiga paket."
    "2019-01-08": "(A, mos) Uppdaterad installationsprocess för 1803."
...
Installera Debian/Bash i Windows 10 (v 1903)
==================================

[FIGURE src=image/snapvt19/windows-cowsay.png?w=c5&a=0,70,60,0 class="right"]

Så här gör du för att installera Debian/Bash i Windows 10 samt installera det som behövs för att komma igång med kurserna.

Installationsprocessen förutsätter att du har ett uppdaterat system av Windows 10 64-bitar system med version 1903.

<!--more-->



Förutsättning {#pre}
-------------------------------

Du har minst en 64-bitars version (x64) av Windows 10.

[INFO]

**Bash for Windows, WSL, är tillgängligt från version 1607 av Windows 10. Guiden är testad på 1803 och uppdaterade för 1903, men bör fungera som riktlinje på samtliga versioner. Uppdatera gärna ert operativsystem till den nyaste versionen innan ni påbörjar guiden.**

[/INFO]

Dubbelkolla att ditt versionsnummer startar på minst 1903 och att du har en Windows build 18362, eller senare, genom att trycka `Windows key + R` och köra programmet `winver`.

[FIGURE src=image/snapht19/win10-winver.png?w=500 caption="Version 1903 eller högre behöver vara installerad."]

Installationsstegen nedan bygger på information från artikeln "[Windows Subsystem for Linux Installation Guide for Windows 10](https://docs.microsoft.com/en-us/windows/wsl/install-win10)".



Installera Bash {#install}
-------------------------------

Bash finns med i din Windows installation men du behöver sätta på det på följande sätt.



### Sätt på "Windows Subsystem for Linux" {#wsl}

Starta PowerShell som administratör och kör följande kommando för att aktivera "Windows Subsystem for Linux (WSL)".

Sök efter PowerShell och starta som administratör genom att högerklicka med musen.

[FIGURE src=image/snapvt19/search-windows-power-shell.png caption="Starta PowerShell som administratör."]

Kör följande kommando i PowerShell för att aktivera WSL. Kopiera och pasta in i PowerShell med högerklick på musen.

```text
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

[FIGURE src=image/snapvt19/power-shell-enable-linux.png?w=w3 caption="Kör kommandot i PowerShell, som administratör."]

Starta om Windows när du ombeds göra det.



### Installera Debian GNU/Linux från Windows Store {#winstore}

Öppna Windows Store, till exempel genom att köra kommandot `ms-windows-store:` via `Windows key + R`.

[FIGURE src=image/snapvt19/run-ms-windows-store.png caption="Starta Windows Store för att installera Linux."]

Sök efter "Debian GNU/Linux" och välj att "Hämta/Installera".

[FIGURE src=image/snapvt19/windows-store-debian.png caption="Installera Debian GNU/Linux via Windows Store."]

Vi väljer att installera Debian för kurserna. Det finns dock flera andra installationer av Linux som du kan göra, till exempel Ubuntu.



### Starta Debian GNU/Linux första gången {#startbash}

Du kan starta Debian via Windows Store, eller genom att köra kommandot `debian` via sökfältet eller via `Windows key + R`.

Första gången ombeds du att skapa en användare med lösenord, gör det.

Därefter är Debian installerat och klart. Du har nu en Linux-terminal, en bash terminal, i din Windows.

[FIGURE src=image/snapvt19/windows-10-debian.png?w=w3 caption="Nu är Debian för Windows installerat och klart."]



Pakethantering {#paket}
------------------------------

För att installera program så använder du en pakethanterare som heter `apt-get`. Med den kan du installera paket, tjänster och programvaror i din terminal.



### Uppdatera och uppgradera {#update}

Vi börjar med att uppdatera installationen med senaste informationen om de paket som finns och vi uppgraderar systemet till att använda senaste versionen av paketen.

```text
sudo apt-get update && sudo apt-get -y upgrade
```

Det tar en liten stund att uppgradera.



### Installera nödvändiga paket {#nodvandig}

Vi skall installera ett par paket som gör din vardag enklare. Det är paket som används i kurserna och vi vill försäkra oss om att de är installerade.

```text
sudo apt-get install wget curl ssh rsync git vim unzip
```

Här är en kort förklaring till de olika kommandona.

| Kommando | Förklaring |
|----------|------------|
| wget     | Ladda ned resurser från nätet/webben. |
| curl     | Alternativ till wget. |
| ssh      | SSH klient och server, används för att koppla upp mot externa servrar. |
| rsync    | Kopiera/synka innehåll i kataloger, lokalt och mellan servrar. |
| git      | Klient till versionshanteringssystemet git. |
| vim      | Texteditor för terminalen, alternativ till vi. |



### Manualsidor och man man {#man}

Manualsidor är källan till kunskap i en linux terminal.

```text
man curl
```

Om programmet `man` inte finns installerat så installerar du det.

```text
sudo apt-get install man
```

Man kan söka efter de programpaket som går att installera.

```text
sudo apt-cache search curl
```

Vänd dig till manualsidan för att veta hur du använder ett kommando.

Du kan också använda optionen `--help` alternativt `-h`, många kommandon stödjer den switchen för att visa hur man använder kommandot.



### Installera cowsay {#cowsay}

För att testa pakethanteraren kan du installera paketet `cowsay` som är ett litet skoj-paket.

```text
sudo apt-get install cowsay
```

Nu kan vi köra programmet.

```text
cowsay "Hej alla webbprogrammerare!"
```

[FIGURE src=image/snapvt19/windows-cowsay.png?w=w3 caption="Nu är du redo för Linux med en bash-terminal på Windows."]

Vill du vet mer om programmet så öppnar du dess manualsida.



Var finns Windows hemma-katalog? {#winhome}
------------------------------

Du kör Linux i ett eget system där du har speciella Linux-användare och ett filsystem för Linux. Din installation fungerar som ett eget system, ett subsystem inuti Windows. Därav namnet "Windows Subsystem for Linux (WSL)".

Du kan komma åt ditt vanliga Windows filsystem, din "vanliga" `C:`, och på det sättet dela filer mellan Linux och Windows. Du hittar dina Windows-filsystem under `/mnt`.

Du kan använda kommandot `ls` för att lista de kataloger som ligger under katalogen `/mnt`. I mitt fall ligger där katalogen `c` som innehåller alla filerna på min `C:`.

```text
$ ls -l /mnt
total 0
drwxrwxrwx 1 mos mos 512 Jan  8 02:27 c
```

Sökvägen till min hemmakatalog i Windows blir då `/mnt/c/Users/mos/` där min Windowsanvändare heter "mos".

För att göra det enkelt att nå filerna i din Windows hemma-katalog så kan du skapa en symbolisk länk i din hemmakatalog.

```text
$ cd && ln -s /mnt/c/Users/mos/ winhome
$ ls -l
total 0
lrwxrwxrwx 1 mos mos 17 Jan  8 03:53 winhome -> /mnt/c/Users/mos/
```

Nu kan jag enkelt nå mina filer som ligger hos min Windows-användare.

```text
# Flytta till min windows home, när jag står i min Linux hemmakatalog
cd winhome

# Flytta till min hemmakatalog i Linux
cd
```

Det rekommenderas att du sparar dina egna filer under din Windows-användare. Det gör det enklast att nå dem via både WSL och dina vanliga Windows-applikationer.


<!--
Öppna Atom {#atom}
------------------------------

Om du har installerat texteditorn Atom i Windows så kan du nu öppna den via terminalen i WSL. WSL är byggt för att du skall kunna öppna applikationer som du installerat i Windows.

Du kan öppna texteditorn Atom inuti WSL, i godtycklig katalog, med kommandot `atom .`. Punkten står för nuvarande katalog och det är den katalogen som öppnas i Atom.

Dock, du kan inte öppna atom så att den hanterar filer inuti din WSL. Applikationen atom kan endast hantera filer som ligger på ditt Windows filsystem. Behöver du redigera filer inuti din wsl så får du använda en terminaltexteditor likt vi, vim eller nano.

Öppna atom i med nuvarande katalog som bas (under Winhome).

```text
atom .
```

Får du problem kan du se om lösningen finns i forumtråden "[Vanliga problem med Atom i Windows](t/8194)". Där beskrivs till exempel hur du lägger till Atom i din PATH.
-->



Bra att ha {#braattha}
------------------------------

Följande tips kan göra din bekantskap lite trevligare med Linux och bash-terminalen för Windows.



### Sudo utan lösenord {#sudo}

För att slippa skriva lösenord varje gång du skriver kommandot `sudo` så kan du lägga en fil i katalogen `/etc/sudoers.d/` och döpa filen till ditt användarnamn. Filen skall innehålla en rad likt denna (där min användare är "mos").

```text
mos ALL=NOPASSWD: ALL
```

Följande kommandorad skapar en sådan fil för din användare.

```bash
sudo bash -c "echo '$USER ALL=NOPASSWD: ALL' > /etc/sudoers.d/$USER && cat /etc/sudoers.d/$USER"
```

Pröva nu att köra sudo, till exempel `sudo ls /`, så bör det fungera utan att du behöver ange lösenord.

Här är en forumtråd som hanterar [sudo utan lösenord](t/4327).



### Kopiera och pasta i terminal {#copypaste}

När du är i terminalen kan du markera ett textstycke med musen och högerklicka. Sedan kan du göra paste genom att högerklicka igen. Detta fungerar även om du vill göra paste till ett fönster utanför Bash, alternativt så trycker du `ctrl-v` för att pasta till ett annat fönster.

Vill du kopiera från ett annat fönster till terminalen så markerar du texten och lägger den i copy-bufferten (via `ctrl-c` eller högerklickmenyn) och du gör paste i terminalen via högerklick.



### Vilken version av Linux {#version}

Du kan kontrollera vilken version av Bash du har med kommandot `lsb_release`. Om kommandot inte finns kan du installera det genom att köra.

```bash
sudo apt-get install lsb-release
```

Tecknet `$` är en del av prompten och ingår inte i kommandot du skall skriva in.

```
$ lsb_release -a
No LSB modules are available.
Distributor ID: Debian
Description:    Debian GNU/Linux 9.6 (stretch)
Release:        9.6
Codename:       stretch
```



### Uppdatera din installation {#update}

Du uppdaterar och uppgraderar din installation med pakethanteraren genom att köra följande kommando.

```text
sudo apt update && sudo apt upgrade
```



Avslutningsvis {#avslutning}
------------------------------

Det finns en [forumtråd](t/8161) där du kan ställa frågor, eller ge tips och trix, om denna artikel. Kika där om du får problem. Tråden ligger i subforumet [Windows för Webbprogrammerare](forum/viewforum.php?f=55).

Vill du ställa specifika frågor om Unix/Linux, bash eller terminalen så passar subforumet [Unix och Linux](forum/viewforum.php?f=49)
