---
author: lew
category: linux
revision:
  "2022-04-28": (A, lew) Första utgåvan inför kursen vlinux ht22.
...

# APT, apt och pakethantering

När vi hanterar program i Linux använder vi oss utav en pakethanterare. Paketen består av det som behövs för att programmen ska fungera och Debian och Debian-baserade distributioner (tex Ubuntu) använder systemet `APT` (Advanced package tool) för att hantera dem. APT i sin tur tillhandahåller kommandot `apt-get` och det nyare kommandot `apt`. Den lägsta nivån av pakethanterare är `dpkg` (Debian Package). APT är med andra ord en mer användarvänlig front-end över systemet APT.

Du har redan använd pakethanterare i andra kurser, till exempel composer i PHP, npm i JavaScript, pip i Python osv.

<!-- more -->

### Paketlistor {#packagelists}

Innan vi kan börja installera program bör vi förstå hur det ligger till med paketlistor och de grundläggande kommandona.

När vi installerar program utgår vi ifrån `.deb` filer som finns i så kallade "repositories" (arkiv). Det är servrar som tillhandahåller installationsfilerna för diverse program. Det finns 4 officiella repositories: "main", "restricted", "universe" och "multiverse".

**main** innehåller open-source mjukvara och program från Ubuntu.
**restricted** innehåller licensierade installationsfiler, tex drivrutiner.
**universe** innehåller publik och open-source mjukvara.
**multiverse** innehåller licensierad programvara.

|               | Fri programvara | Inte fri programvara |
| ------------- | :-------------: | -------------------: |
| Support       |      main       |           restricted |
| Ingen support |    universe     |           multiverse |

Vi kan se vilka som används i filen `/etc/apt/sources.list`. Följande format används:
`<type> <url> <release-name> <repository-name>`.

En rad ur filen kan se ut så här:

```console
deb http://archive.ubuntu.com/ubuntu/ jammy-updates universe
```

### Kommandot apt {#apt}

För att hantera alla paket och pakethanteraren använder vi kommandot `apt`. Det är en nyare variant på tidigare kommandon, bland annat `apt-get` och `apt-search`. De tidigare versionerna är mer lågnivå än det nyare `apt` så hanteringen är en del förenklad.

| Kommando              |                         vad händer? |
| --------------------- | ----------------------------------: |
| apt update            |             Uppdatera paketlistorna |
| apt install           |                 Installera mjukvara |
| apt search            |                  Sök efter mjukvara |
| apt upgrade           |                 Uppgradera mjukvara |
| apt list --upgradable | Se vilka program som kan upgraderas |

### Snap {#snap}

Numer kan man stöta på programmet `snap`. Många program finns tillgängliga via APT men via Snap kan utvecklare paketera ihop sina program och distribuera dem till användarna. Allt som behövs kommer "sandboxat" i paketet.

### Övriga pakethanterare {#managers}

Andra Linux distributioner kan använda andra pakethanterare, tex rpm, pacman, yum med flera.
