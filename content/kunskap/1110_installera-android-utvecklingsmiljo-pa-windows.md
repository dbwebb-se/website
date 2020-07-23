---
author: efo
category:
    - webbprogrammering
    - webapp
revision:
  "2020-04-20": (B, aar) Uppdatera för hur Android installeras.
  "2018-02-20": (A, efo) Första utgåvan inför kursen webapp-v3.
...
Installera Android utvecklingsmiljö på Windows
==================================
[FIGURE src=/image/webapp/android-robot.png?w=c5 class="right"]

Denna guide visar dig hur du installerar de nödvändiga komponenterna av Android SDK för att kunna köra en Android emulator.

Jag kommer att installera endast det nödvändigaste för att få tillgång till emulatorn. Software Development Kit (SDK) kan ta mycket plats på din hårddisk, om du bara installerar de absolut nödvändiga paketen tar det upp mot 6-7 GiB.



<!--more-->



Installera Java {#java}
--------------------------------------
Ladda ner och installera Java JDK 8 från [Oracle](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html). Ladda ner rätt paket beroende på processorarkitektur: Windows x64 för 64-bits arkitektur eller Windows x86 för 32-bits arkitektur. Kör `.exe` filen som laddas ner och följ instruktionerna i guiden. Det behöver vara JDK 8, Cordova funkar inte med nyare versioner.

Du kan behöva registrera och logga in för att få ladda ner Java 8 då Oracle har ändrat sina rättigheter för gamla JDK.

Kolla att Java finns tillgängligt från terminalen, start en ny terminal och skriv `java -version`. Du borde få något som ser ut som här.

```
java version "1.8.0_212"
Java(TM) SE Runtime Environment (build 1.8.0_212-b10)
Java HotSpot(TM) 64-Bit Server VM (build 25.212-b10, mixed mode)
```

Om kommandot inte finns behöver du lägga till Javas `bin` i din PATH, för mig är det `C:\Program Files\Java\jdk1.8.0_212\bin`.



Installera Gradle {#gradle}
--------------------------------------
Ladda ner och installera Gradle från [Gradle](https://gradle.org/releases/). Du behöver även lägga till Gradles bin mapp i din PATH, för mig är det `C:\Program Files\gradle-6.3\bin`



Installera Android Studio {#studio}
--------------------------------------
Google har under senaste året ändrat så att man måste installera Android Studio för att kunna använda sig av Android SDK och Android Emulatorn.

För att installera gå till [Android Studio](https://developer.android.com/studio/index.html) och tryck på knappen **DOWNLOAD ANDROID STUDIO**. Kör den nerladdade `.exe` filen och följ instruktionerna öppna Android Studio när installationen är klar.

Android Studio avslutar nu installationen bekräfta de val som kommer upp. Jag har vald mörka temat Dracula, om ni undrar över de mörka färgarna i bilderna nedan. Vi kommer inte använda Android Studio för utveckling, men är tyvärr enda sättet att installera SDK och Emulatorn, samt att kunna bygga apparna. När installationen är klar får du upp nedanstående fönster. Välj Configure > SDK Manager.

[FIGURE src=/image/webapp/screenshot-android-studio.png caption="Android Studio startfönster."]

I fönstret som kommer upp kan du välja vilken Android version du vill utveckla mot. Jag har valt 'Android 8.1 API Level 27' och 'Android 9.0 API Level 28', bocka i de du vill ha och bocka av övriga. Tryck sedan Apply för att installera rätt SDK. Godkänna License Agreement och låt Android Studio Installera SDK:n.

[FIGURE src=/image/webapp/screenshot-android-studio-sdk-platforms.png caption="Android Studio SDK Manager."]

Gå sen till SDK Tools i SDK managern och bocka i `Android SDK Command-line Tools (latest)`, tryck sedan Apply för att installera rätt SDK. Godkänna License Agreement och låt Android Studio Installera SDK:n.

Kopiera värdet för `Android SDK Location` för nästa steg.

[FIGURE src=/image/webapp/screenshot-android-studio-sdk-cmdline-tools.png caption="Android Studio SDK Manager commandline-tools."]



### Android i PATH {#android_path}

När du har installerat allt behöver vi lägga till flera av Androids mappar i pathen.

Först behöver du lägga till sökvägen till Android SDK som en miljövariable med namnet `ANDROID_HOME`. Du kan hitta sökvägen i längst upp i Android SDK managern under namnet `Android SDK Location`.

[FIGURE src=/image/webapp/screenshot-android-home-variable.png caption="ANDROID_HOME som miljövariabel."]

Nästa steg är att lägga till undermappar i ANDROID_HOME i din PATH.

[FIGURE src=/image/webapp/screenshot-android-home-paths.png caption="ANDROID_HOME undermappar i PATH."]

Nu ska Cordova klara av att hitta allt det behöver för att bygga Android appar.



Installera en virtuell enhet {#avd}
--------------------------------------
Starta ett nytt Android Studio project från startfönstret i Android Studio. Klicka dig igenom guiden för att skapa ett projekt. De förifyllda värden som finns fungerar bra och enda anledningen till att vi skapar ett projekt är för att få möjlighet för att skapa en virtuell enhet. Du kommer troligen få ett fel att byggverktygen för Android inte fungerar. Trycka på länken i felet och byggverktygen ska nu installeras.

[FIGURE src=/image/webapp/screenshot-android-studio-gradle.png caption="Android Studio byggverktygen."]

I nedanstående video visas hur man skapar en virtuell enhet, som vi sedan kan använda för att köra vår HelloWorld Cordova app i. Du kan under installationen få frågan om du vill installera Intel HAXM, gör detta då det snabba upp Emulatorn avsevärt.

[YOUTUBE src=KWAsnLTClzo caption="Emil skapar en virtuell Android enhet."]



Kör Cordova exemplet {#cordova}
--------------------------------------
Gå till katalogen `me/kmom05/hello` där du skapade HelloWorld exemplet när du installerade Cordova. Kör följande kommandon för att lägga till Android som platform och köra det antigen på din fysiska enhet, om den är inkopplat, eller i din virtuella enhet.

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

Detta problemet kan lösas genom att öppna Android Studio och starta den virtuella enheten från AVD Manager. Detta görs genom trycka på gröna play-knappen i AVD Manager. Den gröna play-knappen syns längst till höger under de sista 20 sekunder av installationsvideon ovan. När enheten har startas kör du kommandot `cordova run android` i terminalen och din app ska nu kunna köras i din virtuella enhet.



Använda en fysisk enhet {#fysisk}
--------------------------------------
Emulatorn kräver mycket processorkraft och RAM-minne och det är ofta en fördel att utveckla mot en fysisk Android enhet istället. För att använda en fysisk enhet måste enheten vara i Utvecklingsläge (Developer Mode).

1. Gå till Inställningar (Settings) och scrolla ner till Om telefon (About phone) längst ner i Inställningar.

1. Välj i undermenyn Programvaruinformation (Software Information).

1. Tryck nu 7 gånger på Kompileringsnr (Build Number). Du ska efter 3 tryckningar få upp en liten ruta om att du håller på att bli utvecklare.

1. När du har tryckt 7 gånger får du upp ett nytt menyval Utvecklaralternativ (Developer options) under Inställningar.

1. Välj under Utvecklaralternativ (Developer Options) att du vill tillåta USB-felsökning (USB Debugging).

1. Koppla in din enhet till din dator och kör kommandot `cordova run android`. Din HelloWorld app ska nu köras i din enhet istället för i emulatorn.



Avslutningsvis {#avslutning}
--------------------------------------
Nu har du förhoppningsvis kommit igång med Cordova på Android i Windows miljö och har kört HelloWorld exemplet i Emulatorn och på din fysiska enhet.

Om du har frågor eller tips så finns det en särskild [tråd i forumet](t/7311) om denna artikeln.

Du kan även hittar mer info i [Cordovas egna Platform Guide](https://cordova.apache.org/docs/en/latest/guide/platforms/android/index.html).
