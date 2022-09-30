---
author:
    - grm
category: itsec
revision:
    "2022-06-16": (A, grm) Initial release.
...

Knäck lösenord {#crack}
==================================

Uppgiften går ut på att knäcka lösenord som är hashade. Lösenorden ligger i Linuxliknande filer (som /etc/passwd och /etc/shadow) med endast användarnamn och hashade lösenord.

<!--more-->

Förkunskaper {#forkunskaper}
-----------------------------

Du har deltagit i föreläsningen som tillhör kursmomentet.

Installation {#installation}
-----------------------------

Börja med att kopiera in mappen med applikationen till er me-katalog:

```bash
# Flytta till kurskatalogen
$ rsync -ravd example/password-files/ me/kmom02/password-files/
# Flytta till me/kmom02/password-files/
```

John the Ripper {#john}
-----------------------------

Exempel på hur du kan använda och installera John the Ripper.

### Windows

Gå till "[John the Ripper (JtR)](https://www.openwall.com/john/)" och ladda ner den version som passar bäst (32 eller 64-bitars Windows). Packa upp på valfritt ställe, till exempel i din hemmakatalog under programs. Kör i Powershell eller bash shell (enable Windows Subsystem for Linux WSL i Windows features om du inte gjort det). Starta john.exe med hela pathen eller uppdatera din användares path (Environment variables) för att kunna starta med "john".

```bash
# Exempel på kommandon:
$ john password1.txt
$ john --show password1.txt
$ john --list=formats
```

#### Mac

Gå till "[John the Ripper (JtR)](https://download.openwall.net/pub/projects/john/contrib/macosx)" och installera enligt instruktionen i `README.txt`.

```bash
# Flytta till katalogen "run" i din John the Ripper installation.
# Exempel på kommandon:
$ ./john ../../password-files/password1.txt
$ ./john --show ../../password-files/password1.txt
$ ./john --list=formats
```

#### Linux

Jag installerade med snap på Ubunto.

```bash
$ sudo apt update

# Om du saknar snap
$ sudo apt install snapd

# Installera John the Ripper
$ sudo apt install john-the-ripper

# Exempel på kommandon:
$ john password1.txt
$ john --show password1.txt
$ john --list=formats
```

#### John the Ripper - molnet

Om du inte vill installera John the Ripper lokalt, så finns det en "[John the Ripper i molnet](https://www.openwall.com/john/cloud/)" tjänst.

#### Crackstation - online

Kanske kan någon av lösenorden i filerna knäckas med "[Crackstation](https://crackstation.net/)" eller någon liknande tjänst.

Grundkrav {#grundkrav}
-----------------------------

Knäck lösenorden.


Redovisa {#redovisa}
-----------------------

Knäck de lösenord du kan och redovisa resultatet i kmom02 quiz. Vissa lösenord tar
mycket lång tid att lösa och det är ok att ge sig efter 10-15 min.
