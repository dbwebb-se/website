---
author:
    - lew
revision:
    "2020-03-11": (B, lew) Inför HT20.
    "2019-03-19": (A, lew) Inför HT19.

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
dbwebb clone vlinux
cd vlinux
dbwebb init
```



Läsanvisningar  {#lasanvisningar}
---------------------------------

*(ca: 4-10 studietimmar)*


### Kurslitteratur  {#kurslitteratur}

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



### Video  {#video}

Titta på följande:

Det finns videos kopplade till installationsanvisningarna.

1. Till kursen finns en videoserie, "[vlinux](https://www.youtube.com/watch?v=a2P26Zgy_mE&list=PLKtP9l5q3ce_WHGUiZfo9wr1C3aWaSYa7)", kika på de videor som börjar på 01.



Övningar & Uppgifter  {#ovningar_uppgifter}
-------------------------------------------

*(ca: 6-10 studietimmar)*



### Övningar {#ovningar}

1. Som en del av labbmiljön har du redan [installerat Debian](guide/virtualbox/installera-os) i en VirtualBox. Det, tillsammans med installationen av VirtualBox är den stora biten i detta kursmomentet.

1. Installera [Guest Additions](guide/virtualbox/guest-additions) om du inte gjorde det under labbmiljön. Det kommer underlätta arbetet framöver.

1. I kursen kommer vi använda en guide ["unix-tools"](guide/unix-tools). För detta kursmoment gör du delen [Kom igång med SSH](guide/unix-tools/ssh).  

[INFO]SSH-nycklar tar vi i nästa kursmoment så det kan du vänta med.[/INFO]



### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas.

1. Gör uppgiften "[Installera Debian som server](uppgift/installera-debian-som-server)".

1. Gör uppgiften "[Skapa en me-sida till linux-kursen](uppgift/skapa-en-me-sida-till-vlinux-kursen)". Här fyller du på din redovisningstext efter varje kursmoment.

Dubbelkolla med [videon](https://youtu.be/6a_q5YojE0s) så du fått med alla delar.
<!-- [YOUTUBE src=6a_q5YojE0s width=639 caption="Har du fått med alla delar?"] -->



### Extra {#extra}

Det finns inga extrauppgifter.



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

*(ca: 1-2 studietimmar)*

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i redovisningstexten.

* Är du sedan tidigare bekant med Unix, Linux, Debian och/eller terminalen?
* Hur känns det med Unix-kommandon på terminalen, är det udda eller bekvämt?
* Valde du att köra standard med VirtualBox och Debian eller hur gjorde du?
* Hur kändes det att jobba med VirtualBox och ser du fördelar med det arbetssättet?
* Hur gick det att installera Guest Additions?
* Var det något som krånglade eller tog extra mycket tid?
