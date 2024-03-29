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

Exempel på hur du kan använda och installera John the Ripper. Läs mer här: "[Dokumentation om John the Ripper(JtR)](https://www.openwall.com/john/doc/)".

### Installation Windows

Jag kör <strong>Powershell</strong> så gå till "[John the Ripper (JtR)](https://www.openwall.com/john/)" och ladda ner den version som passar bäst (32 eller 64-bitars Windows). Packa upp på valfritt ställe, till exempel i din hemmakatalog under programs. 
Jag packar upp under downloads. Sen öppnar jag Powershell och skapar en katalog under C:\JohnTheRipper och kopierar dit katalogerna (doc, etc, run och filen README) från det det jag packade upp. Öppna ett kommandofönster och gå till katalogen C:\JohnTheRipper\run och kör kommadot "john" för att starta.

#### Installation Mac

Jag installerade med pakethanteraren brew.

```bash
$ brew install john-jumbo
```

```bash
$ cd ~/dbwebb-kurser/itsec/me/kmom02/password-files

$ ln -s ~/Applications/john-1.8.0.9-jumbo-macosx_avx2\ 2/run
# Använd <tab> för att komma fram till run

# Kör den nya John the Ripper installationen med:
$ run/john password2.txt
```

#### Installation Linux

Jag installerade med pakethanteraren apt på Ubuntu.

```bash
$ sudo apt update

# Installera John the Ripper
$ sudo apt install snapd
$ sudo snap install john-the-ripper
```


#### Verifiera installationen

```bash
$ john
```

Och se att John the Ripper och jumbo är med i namnet, typ John the Ripper 1.9.0-jumbo.


#### Kommandon

```bash
# Exempel på kommandon (från kmom02/password-files):
$ john password1.txt
$ john --show password1.txt
$ john --list=formats
```

#### John the Ripper - molnet

Om du inte vill installera John the Ripper lokalt, så finns det en "[John the Ripper i molnet](https://www.openwall.com/john/cloud/)" tjänst.

#### Crackstation - online

Kanske kan någon av lösenorden i filerna knäckas med "[Crackstation](https://crackstation.net/)" eller någon liknande tjänst.

Krav {#grundkrav}
-----------------------------

Knäck lösenorden (individuellt).


Redovisa {#redovisa}
-----------------------

Knäck de lösenord du kan och redovisa resultatet i kmom02 quiz. Vissa lösenord tar
mycket lång tid att lösa och det är ok att ge sig efter 10-15 min.
