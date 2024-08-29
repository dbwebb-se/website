---
author: lew
revision:
    "2022-04-13": "(B, lew) Uppdatering inför HT22."
    "2019-03-14": "(A, lew) Första versionen."
...
Kopiera in filer
=======================

Vi kan kopiera in egna filer och mappar till en Docker container. Om vi har ett program vi vill kunna köra i containern behöver de kunna nås inifrån containern. Ett sätt är att använda `COPY` kommandot i Dockerfile.

```
FROM ubuntu:24.04

WORKDIR scripts

COPY scripts/ .

RUN chmod +x ./*.bash
```

**WORKDIR** beskriver *arbetsmappen* för kommande kommandon i Dockerfile. Om mappen inte finns så skapas den. Om vi ger relativa sökvägar till WORKDIR kommer de relatera till föregående WORKDIR's mapp.  
**COPY** kopierar in innehållet i den lokala mappen *script* in i imagen till arbetsmappen */script*.  
**RUN** används för att köra kommandon i byggskedet av imagen. Här gör vi filerna exekverbara.
