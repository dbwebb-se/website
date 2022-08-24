---
author: mos
category: labbmiljo
revision:
    "2022-08-24": (H, mos) Lade till h3 och ny länk till wsl bash samt videor.
    "2022-08-17": (G, mos) Uppdaterade hur länkarna skapas.
    "2018-08-21": (F, mos) Information om Mac och inte VM.
    "2015-08-17": (E, mos) La till info om symboliska länkar.
    "2015-04-10": (D, mos) Tog bort referens till jEdit.
    "2015-01-21": (C, mos) Ändrade hur man byter port på Apache i Windows.
    "2014-09-15": (B, mos) Bytte till XAMPP och lade hit instruktionen från forumtråd.
    "2012-08-29": (A, mos) Första versionen, flyttad från annat dokument och uppdaterad.
...
Installera en egen webbserver för utveckling
==================================

[FIGURE src=/img/xampp/xampp-logo.svg class="right w100"]

Se till att du har en egen lokal utvecklingsmiljö för dina webbsidor. I dbwebb-kurserna så använder vi alltid en driftsserver dit vi laddar upp resultatet när vi är klara. Men det underlättar om man har en egen utvecklingsmiljö så att man inte är beroende av studentservern.

<!--more-->



Webbserver Apache httpd med PHP och databas {#webbserver}
--------------------------------------------------------------------

Som rekommenderad miljö på Windows och Mac OS används [XAMPP](https://www.apachefriends.org/index.html). På Linux kan du välja XAMPP eller hellre installera Apache och PHP med pakethanteraren.

Vi har valt att använda XAMPP eftersom den är open source och fungerar bra. XAMPP är lätt att installera och komma igång med och den har ett trevligt och enkelt gränssnitt. Dessutom finns den både till Windows, Mac OS och Linux.

<!--
[Tidigare användes WAMPServer (Windows) och MAMP (Mac)](#aldre). Alla tre fungerar för kurserna och du kan välja vilken du vill. Får du problem så kommer jag troligen be dig använda XAMPP.
-->



Videoserie {#video}
--------------------------------------------------------------------

Det finns en videoserie som kompletterar denna artikel och vissa saker som händer efter denna artikeln, den kompletta videoserien kan nås på "[Installera en egen webbserver (XAMPP) för utveckling (på Windows/Mac)](https://www.youtube.com/playlist?list=PLKtP9l5q3ce_9ulrpXIXd4ZsiHSidyJft)".

Ett par av dessa videor är även inkluderade i själva dokumentet nedan. Kika gärna i videorna om du får bekymmer, eller om du tycker det är lättare att följa dem.



Kom igång med XAMPP {#komigang}
--------------------------------------------------------------------

Följ mina steg för att komma igång.



### 1. Installera {#install}

Gå till hemsidan för XAMPP och ladda ned det paketet du vill ha (Windows, Mac).

Kör en ren installation, se till att du är Administratör på din Windows-maskin (för att undvika problem).

När du väljer miljö på Mac så välj den som _inte_ heter VM i namnet. VM står för virtual machine. Du kan läsa [mer om detta i forumet](https://dbwebb.se/t/6648).

[YOUTUBE src="To0RsSrPA48" list="PLKtP9l5q3ce_9ulrpXIXd4ZsiHSidyJft" width=700 caption="Installera XAMPP på Windows (och Mac)."]



### 2. Konfigurera {#konfigurera}

Ändra så att Apache kör på 8080 (för att undvika problem när någon annan redan kör på port 80, typ Skype eller befintlig webserver).

[YOUTUBE src="UbTgjcHi4EI" list="PLKtP9l5q3ce_9ulrpXIXd4ZsiHSidyJft" width=700 caption="Konfigurera och starta XAMPP på porten 8080."]

I Mac klickar du på "Configure" och ändrar port i rutan som poppar upp.

I Windows är det lite krångligare, du gör så här. 

1) Öppna Apaches konfigfil `httpd.conf` genom att klicka på knappen "Config" och väljer sedan "Apache (httpd.conf)" i den menyn som kommer upp.

[FIGURE src=/image/xampp/xampp-config-port.png&w=w3 caption="Öppna konfigfilen till Apache."[/FIGURE]

2) En texteditor öppnar filen `httpd.conf`. Leta reda på raden som säger:

```text
Listen 80
```

Ändra den raden så att Apache lyssnar på port 8080 istället för port 80.

```text
Listen 8080
```

[FIGURE src=/image/xampp/xampp-config-port-httpd.png&w=w3 caption="Byt port som Apache kör på för att undvika krockar med andra program."[/FIGURE]

Klart.



### 3. Starta Apache {#start}

Starta Apache.

[FIGURE src=/image/xampp/start-apache.png?w=w3 caption="Starta Apache webbserver."[/FIGURE]

Apache har startat.

[FIGURE src=/image/xampp/apache-started.png?w=w3 caption="Nu snurrar Apache webbserver på din lokala maskin."[/FIGURE]



### 4. Öppna webbläsaren mot Apache {#webblasare}

Peka webbläsaren till `http://localhost:8080/` eller `http://127.0.0.1:8080` (kopiera in länkarna till din webbläsare).

Så här kan det se ut när XAMPPs standard hemsida visas.

[FIGURE src=/image/xampp/xampp-home.png?w=w3 caption="XAMPPs hemsida på din lokala maskin visas."[/FIGURE]



### 5. Skapa en webbsida {#webbsida}

Xampp installeras i `C:\xampp` och webrooten ligger i `C:\xampp\htdocs` på Windows och i Mac OS gäller `/Applications/XAMPP/htdocs`.

Gör följande steg för att testa din installation genom att skapa en HTML-sida och en PHP-sida. 

[YOUTUBE src="8l9bVIlVIM0" list="PLKtP9l5q3ce_9ulrpXIXd4ZsiHSidyJft" width=700 caption="Skapa en testsida i XAMPP för HTML och för PHP."]



1) Skapa en katalog `test` i din htdocs-katalog (din webroot). 

[FIGURE src=/image/xampp/htdocs-create-test-dir.png?w=w3 caption="Katalogen `test` skapas i filväljaren."[/FIGURE]



2) Öppna samma katalog i din webbläsare. Länken dit är `http://localhost:8080/test` eller `http://127.0.0.1:8080/test`. Katalogen är tom för tillfället.

[FIGURE src=/image/xampp/firefox-test-empty.png?w=w3 caption="Katalogen `test` öppnad i webbläsaren via webbservern."[/FIGURE]



3) Skapa två filer i katalogen och döp dem till `test.html` (en HTML-sida) och `test.php` (en HTML -sida med PHP-kod).

[FIGURE src=/image/xampp/htdocs-create-test-files.png?w=w3 caption="Två filer skapade i katalogen test via filväljaren."[/FIGURE]

Kontrollera att du även ser filerna i din webbläsare genom att ladda om sidan (ctrl-r eller F5).

[FIGURE src=/image/xampp/firefox-test-files-empty.png?w=w3 caption="De nyskapade filerna är synliga via webbservern."[/FIGURE]



4) Öppna de båda filerna i din texteditor och lägg in följande kod i dem.

Kod till HTML-sidan `test.html`.

```html
<!doctype html>
<meta charset="utf-8">
<title>My test page</title>
<h1>My nice test page for PHP</h1>
```

[FIGURE src=/image/xampp/jedit-test-html.png?w=w3 caption="Filen `test.html` skapas i texteditorn."[/FIGURE]

Kod till PHP-sidan `test.php`.

```php
<!doctype html>
<meta charset="utf-8">
<title>My test page</title>
<h1>My nice test page for PHP</h1>
<p>
<?php echo "Hello Wold from PHP!"; ?>
</p>
```

[FIGURE src=/image/xampp/jedit-test-php.png?w=w3 caption="Filen `test.php` skapas i texteditorn."[/FIGURE]



5) Öppna de båda filerna i din webbläsare för att se hur de ser ut.

* `http://127.0.0.1:8080/test`

[FIGURE src=/image/xampp/firefox-test.png?w=w3 caption="Filerna ligger i katalogen och är synliga via webbläsaren."[/FIGURE]


* `http://127.0.0.1:8080/test/test.html`

[FIGURE src=/image/xampp/firefox-test-html.png?w=w3 caption="Visa filen `test.html` i webbläsaren."[/FIGURE]

* `http://127.0.0.1:8080/test/test.php`

[FIGURE src=/image/xampp/firefox-test-php.png?w=w3 caption="Visa filen `test.php` i webbläsaren."[/FIGURE]


Nu fungerar din installation av XAMPP tillsammans med HTML- och PHP-sidor.

<!--
Det finns en [forumtråd där du kan få hjälp om installationen krånglar](t/2705).
-->



Länka från webbkatalogen till andra kataloger {#link}
--------------------------------------------------------------------

I exemplet ovan sparade du alla webbfilerna direkt under webbserverns webbrot, den katalog som webbservern börjar leta i. Men hur gör du om du vill visa filer som till exempel ligger i din hemmakatalog under till exempel katalogen `dbwebb-kurser`?

Låt oss skapa en symbolisk länk från webbroten och pekar på en katalog under din hemmakatalog. Vi skapar en länk `dbwebb` som vi placerar i webbroten, och vi låter den peka till katalogen `$HOME/dbwebb-kurser` där `$HOME` representerar din hemmakatalog i Windows eller Mac.

När vi har lyckats med detta så kan du nå webbfilerna via xampp om du öppnar länken `http://localhost:8080/dbwebb`.

Följ nedan instruktioner för att skapa länken på Windows (WSL/Bash eller Cygwin) eller på Mac OS.



### Skapa länk på Windows (WSL/Bash) {#linkwsl}

Detta stycket gäller enbart om du har din katalog `dbwebb-kurser` i WSL/Bash. Detta är på Windows det rekommenderade sättet.

[YOUTUBE src="feIiivzFKUw" list="PLKtP9l5q3ce_9ulrpXIXd4ZsiHSidyJft" width=700 caption="Skapa en länk från XAMPP htdocs till dbwebb-kurser i WSL/Bash/Ubuntu."]

I Windows ligger din webbkatalog ofta under `c:\xampp\htdocs`. Du kan öppna en "Command Prompt" CMD terminal i Windows (som Administratör) och börja att flytta till den katalogen. Det är här vi skall skapa länken.

```text
cd c:\xampp\htdocs
dir
dir dbwebb
```

[FIGURE src=/image/snap22/mklink_wsl_dir.png?w=w3 caption="För tillfället finns ingen länk till dbwebb i XAMPP katalogen."[/FIGURE]

Nu behöver vi ta reda på vilken katalog du har i WSL/Bash. Öppna din Bash-terminal och gå till din hemmakatalog. Starta sedan `explorer.exe` och se vilken katalog som applikationen upplever det som.

```text
# I WSL/Bash gå till din hemmakatalog
cd

# Flytta till katalogen dbwebb-kurser
cd dbwebb-kurser

# Starta explorer mot nuvarande katalog som representeras av .
explorer.exe .
```

[FIGURE src=/image/snap22/mklink_wsl_explorer.png?w=w3 caption="Starta explorer.exe i katalogen dbwebb-kurser."[/FIGURE]

[FIGURE src=/image/snap22/mklink_wsl_path.png?w=w3 caption="Markera sökvägen till katalogen och kopiera den."[/FIGURE]

Nu kan du i explorer markera och kopiera sökvägen till din hemmakatalog i WSL/Bash. I mitt fall var sökvägen följande.

```text
# Path till min katalog
\\wsl.localhost\Ubuntu-20.04\home\mos\dbwebb-kurser

# Generell path in i en WSL instance
\\host\instance\path
```

Du kan nu gå tillbaka till CMD och där skall vi nu skapa länken.

Skapa länken enligt nedan men byt sökvägen till katalogen till din egen som du fick via explorer ovan.

```text
mklink /D .\dbwebb "sökvägen"
```

Så här blev det för mig.

```text
mklink /D .\dbwebb "\\wsl.localhost\Ubuntu-20.04\home\mos\dbwebb-kurser"
```

Nu är länken skapad och vi kan se att den ligger i katalogen och innehållet i den katalog dit den pekar.

```text
# Se alla filer som börjar på dbwebb i katalogen
dir dbwebb*

# Visa innehållet i den katalog dit symlänken pekar
dir dbwebb
```

Så här kan det se ut när man gör det.

[FIGURE src=/image/snap22/mklink_wsl_mklink.png?w=w3 caption="Skapa en symbolisk länk till en annan katalog i Windows."[/FIGURE]

Om något går fel så kan du radera den symboliska länken så här, och sedan starta om igen.

```text
rmdir dbwebb
```



### Skapa länk på Windows (Cygwin) {#linkcygwin}

Detta stycket gäller enbart om du har din katalog `dbwebb-kurser` någonstans i ditt windows filsystem, till exempel under din Windows hemmakatalog. Om du har terminalen Cygwin kan det vara bra att göra på detta sättet.

I Windows ligger din webbkatalog ofta under `c:\xampp\htdocs`. Du kan länka till en katalog med kommandot `mklink` i kommandoprompten. Öppna "Command Prompt" *som administratör* och kör följande kommando. 

Börja med att gå till din webroot och kolla om du har någon fil som heter `dbwebb` där, troligen inte.

```text
cd c:\xampp\htdocs
dir dbwebb
```

Skapa länken.

```text
mklink /D .\dbwebb "%USERPROFILE%\dbwebb-kurser"
```

Konstruktionen `%USERPROFILE%` motsvarar din hemmakatalog. Du kan även ange hela sökvägen till din hemmakatalog. I mitt fall hade det varit `c:\Users\Mikael\dbwebb-kurser`.

Nu är länken skapad och vi kan se att den ligger i katalogen och innehållet i den katalog dit den pekar.

```text
# Se alla filer som börjar på dbwebb i katalogen
dir dbwebb*

# Visa innehållet i den katalog dit symlänken pekar
dir dbwebb
```

Så här kan det se ut när man gör det.

[FIGURE src=/image/snap22/mklink_dbwebb.png?w=w3 caption="Skapa en symbolisk länk till en annan katalog i Windows."[/FIGURE]

Om något går fel så kan du radera den symboliska länken så här, och sedan starta om igen.

```text
rmdir dbwebb
```



### Skapa länk på Mac OS {#linkmac}

I Mac OS heter kommandot `ln` och en vanlig plats för webbkatalogen är `/Applications/XAMPP/htdocs`. Öppna din terminal och skapa länken på följande sätt.

```text
cd /Applications/XAMPP/htdocs
ln -s $HOME/dbwebb-kurser dbwebb
```

Kontrollera länken och vart den pekar.

```text
# Se detaljer om länken
ls -l dbwebb

# Se katalogen dit länken pekar
ls -l dbwebb/
```

Blir något fel kan du ta bort länken och börja om.

```text
rm dbwebb
```

Så kan du skapa länken och testa att den skapades.

Det kan hända att länken ser bra ut men du får problem när du visar den i webbläsaren, du får troligen en 403 som felmeddelande i webbläsaren. Det kan bero på rättigheter på katalogerna. Webbservern behöver ha rättigheter att läsa din katalog `$HOME/dbwebb-kurser`. Du kan lösa det så här.

```text
chmod 755 $HOME
chmod 755 $HOME/dbwebb-kurser
```

Prova nu att ladda om filen i webbläsaren och se om det löste problemet.



Apache på Linux och andra plattformar? {#linux}
--------------------------------------------------------------------

Det finns många andra plattformar att köra webbserver med PHP och databas på. Använder du Linux kan du köra XAMPP eller installera Apache och PHP på egen hand med en pakethanterare.


<!--
Äldre installationsbeskrivningar {#aldre}
--------------------------------------------------------------------

Dessa användes tidigare som installationsinstruktioner.

* [Så här installerar du WampServer på Windows 7](http://db-o-webb.blogspot.com/2010/09/installera-wampserver-pa-windows.html).

* [Så här installerar du MAMP på Mac](http://db-o-webb.blogspot.com/2010/09/installera-mamp-pa-os-x.html).


[INFO]
**Felsökning på Windows med WAMPServer.**

Möjliga problem vid installation på Windows:

* Klicka på "Put Online" i menyn (nedre högra hörnet) för WAMPServer. 

* Det finns en konflikt mellan WAMP och Skype. Vid problem vid installation av WAMP; testa att först stänga av Skype.

* Finns det redan en webbserver på din maskin, tex IIS?

* Har du sedan tidigare installerat MySQL?

* Vid problem, kontrollera alltid vad det står i loggfilerna för Apache, MySQL och PHP?
[/INFO]

-->