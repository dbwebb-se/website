---
author:
    - grm
category: itsec
revision:
    "2022-06-16": (A, grm) Initial release.
...

Knäck lösenord {#crack}
==================================

Uppgiften går ut på att knäcka lösenord som är hashade. Lösenorden ligger i Linuxliknande filer (/etc/shadow) med endast användarnamn och hashade lösenord.

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
```

### John the Ripper - lokalt

#### Information

Gå till "[John the Ripper Packages](https://github.com/openwall/john-packages)" och läs om hur du installerar Windows package eller Linux package med hjälp av Snap eller Flatpack för Linux. Information för Mac finns på nedladdningssidan för macosx.

#### Ladda ner

Gå till "[John the Ripper (JtR)](https://download.openwall.net/pub/projects/john/contrib/)" och installera enligt instruktionen i `README.txt` för din plattform; windows, macosx eller linux.

Lägg programvaran i itsec/me/kmom02 eller på det ställe du önskar. Titta runt bland filerna och bekanta dig med dem.

#### John the Ripper - molnet

Om du inte vill installera John the Ripper lokal, så finns det en "[John the Ripper i molnet](https://www.openwall.com/john/cloud/)" tjänst.

#### Crackstation - online

Kanske kan någon av lösenorden i filerna knäckas med "[Crackstation](https://crackstation.net/)" eller någon liknande tjänst.

Grundkrav {#grundkrav}
-----------------------------

Knäck lösenorden.


John the Ripper {#john}
-----------------------------

Så här kan du använda John the Ripper:

```bash
# Flytta till katalogen "run" i din John the Ripper installation.
# Kör igång:
$ ./john ../../password-files/password1.txt

# Visa listan av lösenord du knäckt:
$./john --show ../../password-files/password1.txt

# Visa formaten i John the Ripper:
$./john --list=formats
```


Redovisa {#redovisa}
-----------------------

Knäck de lösenord du kan och redovisa resultatet i kmom02 quiz. Vissa lösenord tar
mycket lång tid att lösa och det är ok att ge sig efter 15-20 min.
