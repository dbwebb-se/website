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
    "2022-08-17": "(G, mos) Om wsl redan är installerat, lade till video."
    "2022-08-16": "(F, mos) Uppdaterad till senaste installationsrutinen för WSL."
    "2020-04-29": "(E, mos) Lade till unzip som kommando att installera (krävs av composer)."
    "2019-08-22": "(D, aurora) Översedd inför HT19 och Windows 10 v1903."
    "2019-01-16": "(C, mos) Förtydligande om var filer bör sparas och hur atom startas, bort med stycket om atom."
    "2019-01-13": "(B, mos) Lade till installation av nödvändiga paket."
    "2019-01-08": "(A, mos) Uppdaterad installationsprocess för 1803."
...
Installera Bash i Windows med WSL och Ubuntu
==================================

[FIGURE src=image/snapvt19/windows-cowsay.png?w=c5&a=0,70,60,0 class="right"]

Så här gör du för att installera Bash med Ubuntu i Windows via WSL samt tar hjälp av pakethanteraren och installerar det som behövs för att komma igång med kurserna.

<!--more-->



Mer information {#pre}
-------------------------------

Denna artikel är förkortad till att ange hur man installerar WSL och Ubuntu för att få tillgång till en Bash terminal i Windows. Artikeln bygger på informationen som finns att läsa i "[Windows Subsystem for Linux Documentation](https://docs.microsoft.com/en-us/windows/wsl/)". Om du tappar bort dig eller behöver extra information så kan du gå och läsa den artikeln i lugn och ro.

Här kommer den snabba vägen som är ett utdrag från artikeln "[Install Linux on Windows with WSL](https://docs.microsoft.com/en-us/windows/wsl/install)".



Översikt av artikeln {#video}
---------------------------------

Det finns en video som visar hur Mikael jobbar igenom delar av denna artikel. Du kan titta igenom videon som ett komplement när du själv jobbar igenom artikeln.

[YOUTUBE src="njUTrRS6uiU" width=700 caption="Mikael jobbar igenom huvuddelarna i denna artikel."]



Förutsättning {#pre}
-------------------------------

Du behöver minst Windows 10 version 2004 eller högre (Build 19041 och högre) eller Windows 11.

Dubbelkolla att du har en Windows build 19041, eller senare, genom att trycka `Windows key + R` och köra programmet `winver`.

[FIGURE src=image/snap22/winver_19041.png caption="Build 19041 eller högre behöver vara installerad."]

Om du har äldre version av Windows så rekommenderas att du uppdaterar tll senaste utgåvan.

Alternativet är att välja ett annat sätt att installera WSL, för detaljer se dess dokumentationen i "[Install Linux on Windows with WSL](https://docs.microsoft.com/en-us/windows/wsl/install)".

Ett annat alternativ är att köra Cygwin som terminal, se artikeln "[Installera Unix-terminalen Cygwin på Windows](kunskap/installera-unix-terminalen-cygwin-pa-windows)".



Installera Bash {#install}
-------------------------------

Bash finns med i din Windows installation men du behöver sätta på det på följande sätt.



### Installera kommandot wsl {#wsl}

Du kan nu installera allt du behöver för att köra Windows Subsystem for Linux (WSL) genom att ange detta kommando i en administratörs PowerShell eller Windows kommandotolk och sedan starta om din maskin.

```
wsl --install
```

Detta kommando kommer att aktivera de funktioner som krävs för att köra WSL och installera Ubuntu-distributionen av Linux.



### Jag har redan wsl installerat {#wslinstalled}

Ovan kommando fungerar endast om du inte redan har installerat wsl. Om det är installerat så kommer du istället få fram en hjälptext till hur du använder kommandot. Om du då vill installera en specific distribution av Linux så kan du först kolla vilka som finns tillgängliga och sedan kan du installera just den distributionen.

Visa vilka distributioner som finns.

```
wsl --list --online
```

Installera till exmpel distributionen för Ubuntu.

```
wsl --install --distribution Ubuntu
```



### Konfigurera användare och lösenord i Ubuntu {#user}

När processen med att installera din Linux-distribution med WSL är klar, öppna Ubuntu med hjälp av Start-menyn.

Du kan nu starta ubuntu Debian genom att köra kommandot `ubuntu` via sökfältet eller via `Windows key + R`.

Första gången ombeds du att skapa en användare med lösenord, gör det.

Därefter är Ubuntu installerat och klart. Du har nu en Linux-terminal, en bash terminal, i din Windows.

[FIGURE src=image/snap22/ubuntu_start.png?w=w3 caption="Du har nu en bash-terminal med Ubuntu i Windows."]



Pakethantering {#paket}
------------------------------

För att installera program så använder du en pakethanterare som heter `apt`. Med den kan du installera paket, tjänster och programvaror i din terminal.



### Uppdatera och uppgradera {#update}

Vi börjar med att uppdatera installationen med senaste informationen om de paket som finns och vi uppgraderar systemet till att använda senaste versionen av paketen.

```text
sudo apt update && sudo apt -y upgrade
```

När du kör ett kommando med `sudo` så kör du det som root-användaren med extra behörigheter. När du installerar med pakethanteraren behöver du göra det.

Det tar en liten stund att uppgradera.



### Copy & paste mellan Windows och terminalen {#copypaste}

När du vill kopiera från Windows till terminalen kan du markera texten i Windows-applikationen och trycka `ctrl-c`, för att pasta texten till terminalen kan du klicka på högerknappen på musen.

Ett annat bra alternativ är att använda `shift-ctrl-c` och `shift-ctrl-v` där du kan kopiera text i terminalen och pasta till terminalen eller till en Windows applikation, tex webbläsaren. Du sätter på det genom att högerklicka på terminalfönstrets övre del och väljer "Properties" i menyn. Du får då fram följande ruta och du skall klicka i för "shift-ctrl-c / v". Gör även ändringen i menyvalet för "Defaults" så behåller du ändringen till nästa terminalfönster som du öppnar.

[FIGURE src=image/snap22/ubuntu_copy_paste.png caption="Klicka för valet med shift-ctrl-c och v för copy och paste."]

När du är i en Windows applikation använder du "som vanligt" `ctrl-c` och `ctrl-v`, men när du vill göra det i bash-terminalen så lägger du till en `shift` framför.



### Installera nödvändiga paket {#nodvandig}

Vi skall installera ett par paket som gör din vardag enklare. Det är paket som används i kurserna och vi vill försäkra oss om att de är installerade.

```text
sudo apt install wget curl ssh rsync git vim unzip
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
| unzip    | Zippar upp filer. |



### Manualsidor och man man {#man}

Manualsidor är källan till kunskap i en Linux terminal.

```text
man curl
```

Om programmet `man` inte finns installerat så installerar du det.

```text
sudo apt install man
```

Man kan söka efter de programpaket som går att installera.

```text
sudo apt-cache search curl
```

Vänd dig till manualsidan för att veta hur du använder ett kommando.

Du kan också använda optionen `--help` alternativt `-h`, många kommandon stödjer den switchen för att visa hur man använder kommandot.

```text
curl --help
```



### Installera cowsay {#cowsay}

För att testa pakethanteraren kan du installera paketet `cowsay` som är ett litet skoj-paket.

```text
sudo apt-get install cowsay
```

Nu kan vi köra programmet.

```text
cowsay "Hej alla webbprogrammerare!"
```

[FIGURE src=image/snap22/ubuntu_cowsay.png?w=w3 caption="Nu är du redo för Linux med en bash-terminal på Windows."]

Vill du vet mer om programmet så öppnar du dess manualsida.



Öppna filväljaren och texteditorn {#open}
------------------------------

När du är i terminalen kan du öppna vissa Windows-applikationer som till exempel filväljaren och texteditorn. Det kan vara ett bra hjälpmedel att öppna dem i den katalogen där man står för tillfället.

Prova att öppna filväljaren i din hemmakatalog, glöm inte punkten som refererar till den katalog du för tillfället står i.

```text
explorer.exe .
```

[FIGURE src=image/snap22/ubuntu_start_explorer.png?w=w3 caption="Skriv kommandot i terminalen."]

Nu öppnas filväljaren och visar filerna i katalogen samt en sökväg till dem.

[FIGURE src=image/snap22/explorer_open_from_ubuntu.png?w=w3 caption="Filväljaren explorer öppnar ett fönster och visar filerna i terminalen."]


### Öppna VSCode från terminalen {#open-vscode}

För att kunna öppna VSCode från terminalen behöver du installera ett tillägg i VSCode.

[FIGURE src=image/vscode/vscode-wsl.png?w=w3 caption="Installera Remote - WSL i VSCode."]

Gör som bilden visar, gå till fliken för tillägg, sök på "wsl" och installera "Remote - WSL". Efter det behöver du starta om terminalen.

När du har startat terminalen igen kan du skriva som nedanför för att öppna mappen du står i, i vscode. Första gången du gör det kommer den installera verktyget.

```text
code .
```



Var finns Windows hemma-katalog? {#winhome}
------------------------------

Du kör Linux i ett eget system där du har speciella Linux-användare och ett filsystem för Linux. Din installation fungerar som ett eget system, ett subsystem inuti Windows. Därav namnet "Windows Subsystem for Linux (WSL)".

Du kan komma åt ditt vanliga Windows filsystem, din "vanliga" `C:`, och på det sättet dela filer mellan Linux och Windows. Du hittar dina Windows-filsystem under katalogen `/mnt`.

Du kan använda kommandot `ls` för att lista de kataloger som ligger under katalogen `/mnt`. I mitt fall ligger där katalogen `c` som innehåller alla filerna på min `C:`.

```text
cd /mnt
pwd
ls -l
```

Kommandot `pwd` visar dig den katalogen du står i för tillfället.

Tänk på katalogstrukturen som ett träd. Katalogen `.` är nuvarande katalog och katalogen `..` är katalogen ovanför. Vill du gå ett steg upp i katalogstrukturen så skriver du alltså `cd ..`.

```text
# Gå ett steg ned i katalogstrukturen, i en underkatalog
cd c
pwd
ls -l

# Gå ett steg upp i katalogstrukturen
cd ..
pwd
ls -l
```

[FIGURE src=image/snap22/ubuntu_cd_mnt.png?w=w3 caption="Flytta till katalogen /mnt och se vilka filer som ligger där."]

Sökvägen till min hemmakatalog i Windows blir då `/mnt/c/Users/mos/` om min Windowsanvändare heter "mos".



### Skapa länk till Windows hemmakatalog {#lnswinhome}

För att göra det enkelt att nå filerna i din Windows hemma-katalog så kan du skapa en symbolisk länk i din hemmakatalog.

Börja med att gå tillbaka till din hemmakatalog i terminalen.

```text
cd
```

Nu kan du skapa en symbolisk länk till din Windows hemmakatalog med kommandot `ln -s`.

```text
ln -s /mnt/c/Users/mos/ winhome
ls -l
```

[FIGURE src=image/snap22/ubuntu_winhome.png?w=w3 caption="Skapa en symbolisk länk för att göra det enkelt att nå din Windows användares filer."]

Nu kan jag enkelt nå mina filer som ligger hos min Windows-användare.

```text
# Flytta till min windows home, när jag står i min Linux hemmakatalog
cd winhome
pwd
ls

# Flytta till min hemmakatalog i Linux
cd
pwd
ls
```

Om det inte fungerar kan du radera den symboliska länken och börja om.

```text
cd
rm winhome
```

När du jobbar med kurserna rekommenderas det att du sparar alla filerna i ubuntu miljön. Det gör det enklast att nå dem via både WSL och texteditorn.



Bra att ha {#braattha}
------------------------------

Följande tips kan göra din bekantskap lite trevligare med Linux och bash-terminalen för Windows.



### Tabba men utan ljud {#tab}

När du använder terminalen kan du ofta använda tangenten `tab` för att låta terminalen själv leta upp filer och applikationer till dig.

Prova att skriva `cow` och sedan klicka på tab-tangenten och se vad som händer.

Terminalen kommer att leta reda på kommandon som börjar på `cow` och visa dem för dig.

Prova sedan att skriva `ls w` och klicka tab.

Terminalen kommer att fylla i med det fil- eller katalognamn som matchar bokstaven.

Prova att börja använda tab och du kommer att slippa skriva en massa tecken på tangentbordet.

Dock, ibland får du ett irriterande signal, ett beep, varje gång du tabbar. Det vill vi ta bort på följande vis.

Gå till din hemmakatalog och redigera filen `.bashrc` med din texteditor och sist i filen lägger du till raden `bind 'set bell-style none'`.

Börja med att öppna filen i texteditorn (skapa processen i bakgrunden med `&` så blockar du inte terminalen)

```text
code ~/.bashrc &
```

[FIGURE src=image/snap22/ubuntu_start_code_bashrc.png?w=w3 caption="Öppna filen .bashrc med din texteditor."]

Lägg till följande rad sist i filen.

```text
bind 'set bell-style none'
```

[FIGURE src=image/snap22/ubuntu_edit_bashrc.png?w=w3 caption="Redigera konfigurationsfilen .bashrc och lägg till kommandot för att stänga av beepet."]

Spara filen i texteditorn. Gå nu till terminalen och läs in filen ("sourca filen") för att aktivera ändringen du gjorde.

```text
source .bashrc
```

[FIGURE src=image/snap22/ubuntu_source_bashrc.png?w=w3 caption="Aktivera ändringen genom att sourca konfigurationsfilen .bashrc."]

Nu bör beepet försvinna när du använder tab-tangenten. Nu kan du tabba på.



Avslutningsvis {#avslutning}
------------------------------

Det finns mycket att lära om WSL, Bash och Ubuntu. Men detta är en bra start.


<!--
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
-->
