---
author: mos
revision:
    "2017-12-21": (D, mos) Eget dok labbmiljö, genomgången.
    "2017-01-16": (C, mos) Länk till videoserie.
    "2017-01-04": (B, mos) Förberedelse inför linux-v2.
    "2015-06-23": (A, mos) Första utgåvan för kursen.
...
Kmom01: Linux som server
==================================

Det första vi behöver är en Linux-server. På något sätt.

Jag kommer visa hur du installerar Linux i VirtualBox, en virtualiseringsmiljö. Du kan välja att göra som jag gör eller så installerar du på en annan server. Kanske har du en gammal dator till övers, eller är du bekväm med virtuella servrar, eller investerar du i en Raspberry Pi för ett par hundralappar.

Det första kursmomentet går ut på att installera Debian/Linux och logga in på maskinen som en server, via SSH.

För att lyckas med det så behöver du bekanta dig med grunderna i terminalen och lära dig ett par av de viktigaste kommandona som utförs i terminalen.


<!--more-->

[FIGURE src=/image/snapht15/linux-what-now.png?w=w2 caption="Okey, terminalen, och nu då?"]


<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>



Labbmiljön  {#labbmiljo}
---------------------------------

*(ca: 2-4 studietimmar)*

Det finns en [längre beskrivning om kursens labbmiljö](./../installera-labbmiljo). Läs den om du är osäker på vad som skall göras, eller om detta är din första dbwebb-kurs.

Den korta varianten är att du behöver [installera labbmiljön](./../labbmiljo), uppdatera [dbwebb-cli](dbwebb-cli) samt klona och initiera kursrepot.

```text
# Gå till din katalog för dbwebb-kurser
dbwebb selfupdate
dbwebb clone linux
cd linux
dbwebb init
```



Läsanvisningar  {#lasanvisningar}
---------------------------------

*(ca: 4-10 studietimmar)*


###Kurslitteratur  {#kurslitteratur}

Läs följande:

1. [The Linux Command Line](kunskap/boken-the-linux-command-line)
    * Ch1 What Is The Shell?
    * Ch2 Navigation
    * Ch3 Exploring The System (översiktligt)
    * Ch4 Manipulating Files And Directories (översiktligt)

I referenslitteraturen, är följande kapitel relevanta.

1. [The Debian Administrator's Handbook](kunskap/boken-the-debian-administrator-s-handbook).
    * Ch 1: The Debian Project (översiktligt)
    * Ch 4: Installation (översiktligt, detaljerat vid behov)



###Video  {#video}

Titta på följande:

1. Till kursen finns en videoserie, "[linux](https://www.youtube.com/playlist?list=PLKtP9l5q3ce_AGc9pBgaXFEQGjyFJe7XJ)", kika på de videor som börjar på 0 och 1.



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 6-10 studietimmar)*



###Övningar {#ovningar}

Det finns inga övningar.

Som en del av labbmiljön har du redan installerat Debian i en VirtualBox. Det är den stora biten i detta kursmomentet.



###Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[Installera Debian som server](uppgift/installera-debian-som-server)".

1. Gör uppgiften "[Skapa en me-sida till linux-kursen](uppgift/skapa-en-me-sida-till-linux-kursen)".



###Extra {#extra}

* Skaffa ett konto på Digital Ocean och installera Debian på en virtuell maskin. Koppla en domänadress till maskinen. Via GitHub kan du få rabattkod som ger dig gratis månader hos Digital Ocean (gällde 2015, 2016, 2017).



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

* Är du sedan tidigare bekant med Unix, Linux, Debian och/eller terminalen?
* Hur känns det med Unix-kommandon på terminalen, är det udda eller bekvämt?
* Valde du att köra standard med VirtualBox och Debian eller hur gjorde du?
* Om du kör VirtualBox, hur kändes det att jobba med det verktyget och ser du fördelar med det arbetssättet?
* Var det något som krånglade eller tog extra mycket tid?
