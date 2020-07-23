---
author: efo
category:
    - webbprogrammering
    - webapp
revision:
  "2018-02-20": (A, efo) Första utgåvan inför kursen webapp-v3.
...
Installera Android utvecklingsmiljö på Linux
==================================

[FIGURE src=/image/webapp/android-robot.png?w=c5 class="right"]

Denna guide visar dig hur du installerar de nödvändiga komponenterna av Android SDK för att kunna köra en Android emulator.

Jag kommer att installera endast det nödvändigaste för att få tillgång till emulatorn. Software Development Kit (SDK) kan ta mycket plats på din hårddisk, om du bara installerar de absolut nödvändiga paketen tar det upp mot 6-7 GiB.



<!--more-->



Installera Java {#java}
--------------------------------------
Vi använder oss av openjdk i denna kursen och på linux installeras detta lättast genom att använda `apt-get`. Följande kommandon installerar openJDK 8 på en debian eller ubuntu maskin. Om du har en annan version av Java installerat sedan tidigare kan du ta bort med följande kommando: `sudo apt-get purge --auto-remove openjdk*`.

```bash
sudo apt-get install openjdk-8-jdk
javac -version
```

De ska nu se ungefär följande output: `javac 1.8.0_161`. Det viktiga är att det står 1.8 först.



Installera Android Studio {#studio}
--------------------------------------
Google har under senaste året ändrat så att man måste installera Android Studio för att kunna använda sig av Android SDK och Android Emulatorn.

För att installera gå till [Android Studio](https://developer.android.com/studio/index.html) och tryck på knappen **DOWNLOAD ANDROID STUDIO**. Spara zip-filen i din hemmakatalog så den är lätt att hitta.

Kör sedan nedanstående kommando för att packa upp zip-filen till katalogen `/usr/local`.

```bash
tar -xzf [sökväg till zip-filen]
sudo mv android-studio /usr/local/
```

För att öppna upp Android Studio kör filen `studio.sh` enligt nedan.

```bash
/usr/local/android-studio/bin/studio.sh
```

Android Studio avslutar nu installationen bekräfta de val som kommer upp. Jag har vald mörka temat Dracula, om ni undrar över de mörka färgarna i bilderna nedan. Vi kommer inte använda Android Studio för utveckling, men är tyvärr enda sättet att installera SDK och Emulatorn, samt att kunna bygga apparna. När installationen är klar får du upp nedanstående fönster. Välj Configure > SDK Manager.

[FIGURE src=/image/webapp/screenshot-android-studio.png caption="Android Studio startfönster."]

Välj i fönstret som kommer upp 'Android 8.1 API Level 27' och bocka av alla andra versioner tryck sedan Apply för att installera rätt SDK. Godkänna License Agreement och låt Android Studio Installera SDK:n.

[FIGURE src=/image/webapp/android-studio-sdk-27.png caption="Android Studio SDK Manager."]



Installera byggsystemet gradle {#gradle}
--------------------------------------
Cordova använder via Android Studio gradle för att bygga apparna på Linux behöver vi installera gradle manuellt. Vi laddar ner [senaste version (6.3)](https://services.gradle.org/distributions/gradle-6.3-bin.zip) från Gradles hemsida. Vi skapar sedan katalogen `/opt/gradle` och packar upp den nerladdade zip-filen. Vi lägger även till gradle i vår PATH.

```bash
# Stå i $HOME/Downloads
sudo mkdir /opt/gradle
sudo unzip gradle-6.3-bin.zip -d /opt/gradle
echo export PATH=$PATH:/opt/gradle/gradle-6.3/bin >> ~/.profile
source ~/.profile
```



Installera en virtuell enhet {#avd}
--------------------------------------

Börja med att välja Configure > AVD Manager från startfönstret i Android Studio.

[FIGURE src=/image/webapp/avd-manager.png caption="Android Studio AVD Manager."]

Sedan trycker du på "Create Virtual Device", välj någon telefon, jag valde en Pixel 3, men spelar ingen större roll vilken telefon du väljer. Se till att installera rätt disk image som stämmer överens med den SDK API level 27 som vi installerade tidigare. Min virtuella enhet ser ut på detta sättet när jag är klar.

[FIGURE src=/image/webapp/avd-manager-done.png caption="Android Studio AVD Manager efter installation."]

Du kan behöva tillåta tillgång för din användare till katalogen `/dev/kvm` det kan du göra med kommandot `sudo chown efo:efo /dev/kvm`. Byt ut 'efo' mot ditt användarnamn.


<!-- Starta ett nytt Android Studio project från startfönstret i Android Studio. Klicka dig igenom guiden för att skapa ett projekt. De förifyllda värden som finns fungerar bra och enda anledningen till att vi skapar ett projekt är för att få möjlighet för att skapa en virtuell enhet. Du kommer troligen få ett fel att byggverktygen för Android inte fungerar. Trycka på länken i felet och byggverktygen ska nu installeras.

[FIGURE src=/image/webapp/screenshot-android-studio-gradle.png caption="Android Studio byggverktygen."]

I nedanstående video visas hur man skapar en virtuell enhet, som vi sedan kan använda för att köra vår HelloWorld Cordova app i. Du kan under installationen få frågan om du vill installera Intel HAXM, gör detta då det snabba upp Emulatorn avsevärt.

Se till att göra samma val som Emil gör i videon nedan. Välj alltså API 26 (Oreo) när du ombeds välja API för din virtuella enhet.

[YOUTUBE src=KWAsnLTClzo caption="Emil skapar en virtuell Android enhet."] -->



Lägga till i pathen {#path}
--------------------------------------
För att Cordova ska hitta Java och Android behövs det i PATH. Vi lägger till det med följande kommandon.

```bash
echo export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64" >> ~/.profile
echo export ANDROID_HOME="$HOME/Android/Sdk" >> ~/.profile
echo export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools >> ~/.profile
source ~/.profile
echo $PATH
```

Du ska nu se att `tools` och `platform-tools` ligger sist i din PATH.



Kör Cordova exemplet {#cordova}
--------------------------------------
Gå till katalogen `me/kmom05/hello` där du skapade HelloWorld exemplet när du installerade Cordova. Kör följande kommandon för att lägga till Android som platform och köra det antigen på din fysiska enhet, om den är inkopplat, eller i din Virtuella Enhet.

```bash
# Stå i me/kmom05/hello
cordova platform add android --save
cordova run android
```

Ibland kan man få problem att VT-x är disabled vilket betyder att man inte får virtualisera. Denna [forumtråd](https://dbwebb.se/forum/viewtopic.php?t=4336) kan hjälpa till att lösa problemet.

Ett annat problem som verkar uppstå frekvent är att följande felmeddelande:

```bash
Failed to execute shell command "getprop,dev.bootcomplete" on device: Error: adb: Command failed with exit code 1 Error output:
error: device still authorizing
```

Detta problemet kan lösas genom att öppna Android Studio och starta den virtuella enheten från AVD Manager. Detta görs genom trycka på gröna play-knappen i AVD Manager. Den gröna play-knappen syns längst till höger under de sista 20 sekunder av installationsvideon ovan. När enheten har startas kör du kommandot `cordova run android` i terminalen och din app ska nu kunna köras i din virtuella enhet. Ett annat sätt är att använda sig av en 'Cold Boot', det brukar lösa en del problem. Du gör det genom att klicka på lilla vita pilen och välja 'Cold Boot Now'.



Använda en fysisk enhet {#fysisk}
--------------------------------------
Emulatorn kräver mycket processorkraft och RAM-minne och det är ofta en fördel att utveckla mot en fysisk android enhet istället. För att använda en fysisk enhet måste enheten vara i Utvecklingsläge (Developer Mode).

1. Gå till Inställningar (Settings) och scrolla ner till Om telefon (About phone) längst ner i Inställningar.

1. Välj i undermenyn Programvaruinformation (Software Information).

1. Tryck nu 7 gånger på Kompileringsnr (Build Number). Du ska efter 3 tryckningar få upp en liten ruta om att du håller på att bli utvecklare.

1. När du har tryckt 7 gånger får du upp ett nytt menyval Utvecklaralternativ (Developer options) under Inställningar.

1. Välj under Utvecklaralternativ (Developer Options) att du vill tillåta USB-felsökning (USB Debugging).

1. Koppla in din enhet till din dator och kör kommandot `cordova run android`. Din HelloWorld app ska nu köras i din enhet istället för i emulatorn.



Avslutningsvis {#avslutning}
--------------------------------------
Nu har du förhoppningsvis kommit igång med Cordova på Android i Linux miljö och har kört HelloWorld exemplet i Emulatorn och på din fysiska enhet.

Om du har frågor eller tips så finns det en särskild [tråd i forumet](t/7311) om denna artikeln.

Du kan även hittar mer info i [Cordovas egna Platform Guide](https://cordova.apache.org/docs/en/latest/guide/platforms/android/index.html).
