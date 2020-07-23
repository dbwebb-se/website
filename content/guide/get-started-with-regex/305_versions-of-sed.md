---
author: lew
revision:
    "2019-08-20": "(A, lew) First edition."
...
Versions of sed
=======================

Sed should be installed by default. However, there are different versions of the program and the one we will use is GNU's version. At the time of writing, the guide is based on:

```
$ sed --version
sed (GNU sed) 4.4
...
```



### sed on Mac {#sed-on-mac}

If we want to use GNU sed in the terminal on MacOS, we need to install the app *gnu-custom*. By default, Mac wants to use `/usr/bin/sed` so we need to tell it to use another as default:

```
$ brew install --default-names gnu-sed
```



### sed on Windows {#sed-on-win}

Just run sed in your Virtual Machine.
