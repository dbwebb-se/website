---
author: lew
revision:
    "2022-05-03": "(B, lew) Uppdatering inför ht22."
    "2019-04-12": "(A, lew) Första versionen."
...
Hantera volymer
=======================

Istället för att kopiera datan fram och tillbaka kan vi använda volymer. En lokal mapp kan då mappas mot en virtuell mapp inuti containern.



### Mapp att dela {#mapp-dela}

Utgångsläget är att vi har en mapp vi vill kunna nå från containern. Jag väljer att skapa mappen `share`:

```console
$ mkdir share
```

Min tanke är att vi i den mappen ska ha script som vi kan arbeta med i vår egna editor (Atom, VSCode etc) lokalt och sedan exekvera scriptet inifrån containern.



### Starta containern med volymen {#starta-container}

Vi lägger till egen flagga till vårt run-kommando: `-v`:

```console
$ docker run -it -v $(pwd)/share:/inside ubuntu:24.04
```

Flaggan -v talar om att vi vill använda volymer. Det sätts i formatet `källa:mål`.  
`$(pwd)` returnerar sökvägen till den mappen vi står i. Kolon, `:`, skiljer vår lokala sökväg mot den vi vill ha inuti containern. I exemplet ger vi mappen namnet `inside` och den kommer hamna i roten av filsystemet.

När vi kör ovan kommando startar vi containern och kan då använda vår delade mapp:

```console
root@d4712fda9ff3:/# cd inside
root@d4712fda9ff3:/inside#
```



### Arbeta med filerna {#arbeta}

Vi skapar ett script som vi kan jobba med:

```console
root@d4712fda9ff3:/inside# touch script.bash && chmod +x script.bash
```

Nu kan vi se scriptet om vi öppnar mappen "share" lokalt med din editor. Lägg till lite kod:

```bash
#!/usr/bin/env bash

echo "Hello"
```

Skifta sedan till din container så kan du exekvera scriptet i Linuxmiljön:

```console
root@d4712fda9ff3:/inside# ./script.bash
Hello
```

En stor fördel är att filerna sparas lokalt och vi använder enbart containern för dess miljö. Perfekt.
