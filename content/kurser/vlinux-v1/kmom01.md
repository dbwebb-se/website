---
author:
  - lew
revision:
  "2022-03-11": (C, lew) Inför HT22.
  "2020-03-11": (B, lew) Inför HT20.
  "2019-03-19": (A, lew) Inför HT19.
...

# Kmom01: Docker och en linuxmiljö

Det första vi behöver är en Linuxmiljö. På något sätt.

Vi har alla redan tillgång till en Linuxmiljö i form av Cygwin eller WSL för windows, terminalen på en Mac, eller kanske har du rent av redan Linux som operativsystem. För att förutsättningarna ska vara lika oberoende av underliggande operativsystem så kommer vi installera Docker och köra Linuxdistributionen Ubuntu och versionen 22.04.

För att lyckas med kursmomentet så behöver du bekanta dig med grunderna i terminalen och lära dig ett par av de viktigaste kommandona som utförs i terminalen.

Vid sidan av studierna kan du välja att installera på en annan server också. Kanske har du en gammal dator till övers, eller är du bekväm med virtuella servrar, eller investerar du i en Raspberry Pi för ett par hundralappar.

<!--more-->

[FIGURE src=/image/vlinux/kmom01_top.png?w=w2 caption="Okey, terminalen, och nu då?"]

<small><i>(Detta är instruktionen för kursmomentet och omfattar det som skall göras inom ramen för kursmomentet. Momentet omfattar cirka **20 studietimmar** inklusive läsning, arbete med övningar och uppgifter, felsökning, problemlösning, redovisning och eftertanke. Läs igenom hela kursmomentet innan du börjar jobba. Om möjligt -- planera och prioritera var du vill lägga tiden.)</i></small>

## Labbmiljön {#labbmiljo}

_(ca: 2-4 studietimmar)_

Det finns en [längre beskrivning om kursens labbmiljö](./../installera-labbmiljo). Läs den om du är osäker på vad som skall göras, eller om detta är din första dbwebb-kurs.

Den korta varianten är att du behöver [installera labbmiljön](./../labbmiljo), uppdatera [dbwebb-cli](dbwebb-cli) samt klona och initiera kursrepot.

```text
# Gå till din katalog för dbwebb-kurser
dbwebb selfupdate
dbwebb clone vlinux
cd vlinux
dbwebb init
```

## Läsanvisningar {#lasanvisningar}

_(ca: 4-10 studietimmar)_

### Kurslitteratur {#kurslitteratur}

Läs följande:

1. [The Linux Command Line](kunskap/boken-the-linux-command-line)
   - Ch1 What Is The Shell?
   - Ch2 Navigation
   - Ch3 Exploring The System (översiktligt)
   - Ch4 Manipulating Files And Directories (översiktligt)

### Övrigt material {#material}

1. [Dokumentationen för Docker](https://docs.docker.com/).

1. Interaktiv förklaring till kommandon: [Explain shell](https://explainshell.com/).

### Video {#video}

Till kursen finns en [videoserie](https://www.youtube.com/playlist?list=PLKtP9l5q3ce_XueavhyZ_udFDLVFaoVo5). Titta på videorna som börjar med 01.

## Övningar & Uppgifter {#ovningar_uppgifter}

_(ca: 6-10 studietimmar)_

### Övningar {#ovningar}

1. Installera Docker som en del av [labbmiljön](kunskap/installera-virtualiseringsmiljon-docker).

1. Det finns en [guide för Docker](guide/docker) där vissa relevanta delar tas upp. För detta kursmoment klarar du dig på de första två delarna:

   - [Introduktion](guide/docker/introduktion)
   - [Kom igång](guide/docker/kom-igang)

### Uppgifter {#uppgifter}

Dessa uppgifter skall utföras och redovisas. När du ska exekvera delar i en container är det: `docker run -it ubuntu:22.04` som gäller.

1. Gör uppgiften "[Vanliga kommandon](uppgift/vanliga-kommandon)" för att komma igång med terminalen och linuxmiljön. Spara filerna i mappen `kmom01/commands`.

1. Gör uppgiften "[Struktur](uppgift/struktur)" för att känna på lite fler kommandon i terminalen. Spara filerna i mappen `kmom01/structure`.

1. Gör uppgiften "[Skapa en me-sida till vlinux-kursen](uppgift/skapa-en-me-sida-till-vlinux-kursen)". Här fyller du på din redovisningstext efter varje kursmoment.

[YOUTUBE src=GLRRsziU2xU width=639 caption="Har du fått med alla delar?"]

### Testa din inlämning {#test}

Du kan köra vissa tester på din inlämning och se om de delarna uppfyller kraven. Rättningen kommer endast genomföras om testerna går igenom.

```bash
#stå i kursroten
$ dbwebb test kmom01
```

### Extra {#extra}

Det finns inga extrauppgifter.

## Resultat & Redovisning {#resultat_redovisning}

_(ca: 1-2 studietimmar)_

<!-- Läs [instruktionen om hur du skall redovisa](./../redovisa). -->

Se till att följande frågor besvaras i redovisningstexten.

- Är du sedan tidigare bekant med Unix, Linux, Ubuntu och/eller terminalen?
- Hur känns det med Unix-kommandon i terminalen, är det udda eller bekvämt?
- Gick det bra med installationen av Docker?
- Var det något som krånglade eller tog extra mycket tid?
- Vilken är din [TIL](https://dictionary.cambridge.org/dictionary/english/til) för veckan?
