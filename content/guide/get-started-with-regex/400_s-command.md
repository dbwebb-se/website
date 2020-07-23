---
sectionHeader: true
linkable: true
author: lew
revision:
    "2019-08-20": "(A, lew) First edition."
...
The "s"-command  {#s-command}
=======================

An important command in sed is the "s"-command (*substitution*). It allows us to replace the match with something else, either plain text or a whole group. We take a look at what it might look like. The structure of the command is:

```
's/regexp/replacement/flags'
```
