---
author: lew
revision:
    "2022-04-13": "(B, lew) Uppdatering inför HT22."
    "2019-03-14": "(A, lew) Första versionen."
...
Vad är en Dockerfile?
=======================

Filen `Dockerfile` används för att strukturera hur en image ska byggas. Det är en enkel textfil (utan filändelse). När vi har strukturen på plats kan vi bygga vår image med `$ docker build .`, där `.` refererar till den aktuella mappen. Det är Dockerfilens så kallade *context*. Vi kan inte nå resurser utanför mappen där Dockerfile ligger. Vi kan dock bygga den från ett annat ställe på datorn med hjälp av flaggan `-f`.



### Enklast möjliga Dockerfile {#simple}

Vi börjar med att titta på en väldigt enkel Dockerfile. Den kan skapas med `$ touch Dockerfile`.

```
FROM ubuntu:24.04

```

Det var det...Om vi skulle bygga den här imagen kommer den att utgå ifrån imagen *ubuntu:24.04*, tack vare nyckelordet `FROM`, och skapa en ny image åt oss. Vi vill ju gärna ge vår egna image ett namn. Vi använder build-kommandot och lägger på flaggan `-t`:


```bash
$ docker build -t myfirst:mytag .
```

Om vi enbart skulle använda en färdig image, är det såklart bättre att köra den direkt. Vi kan på det här sättet återanvända och ändra på befintliga images.

Kikar vi i [dokumentationen](https://docs.docker.com/engine/reference/commandline/build/) eller `$ docker build -h` kan vi se:

> -t, --tag list       Name and optionally a tag in the 'name:tag' format
