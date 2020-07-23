---
author: lew
revision:
    "2019-05-24": "(A, lew) Första versionen."
...
Versioner av sed
=======================

Sed bör vara installerat per default. Det finns dock olika versioner av programmet och den vi ska använda är GNU's version. I skrivande stund utgår guiden från:

```
$ sed --version
sed (GNU sed) 4.4
...
```



### sed på Mac {#sed-on-mac}

Om vi vill använda GNU sed i terminalen på MacOS behöver vi installera appen *gnu-sed*. Som default vill Mac använda `/usr/bin/sed` så vi behöver säga till att vi vill använda en annan som default:

```
$ brew install --default-names gnu-sed
```



### sed på Windows {#sed-on-win}

Du gör enklast i att köra sed i din VirtualBox.
