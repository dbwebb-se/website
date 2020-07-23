---
sectionHeader: true
linkable: true
author: lew
revision:
    "2019-05-24": "(A, lew) Första versionen."
...
"s"-kommandot  {#s-command}
=======================

Ett viktigt kommando i sed är "s"-kommandot (*substitution*). Det möjliggör att vi kan byta ut matchningen mot något annat, antingen ren text eller en hel grupp. Vi tar och kikar på hur det kan se ut. Strukturen för kommandot är:

```
's/regexp/replacement/flags'
```
