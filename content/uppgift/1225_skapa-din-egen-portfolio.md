---
author: nik
category:
    - kurs/design-v3
revision:
    "2020-10-12": (B, nik) Uppdaterad inför ht20
    "2020-08-26": (A, nik) Draft
...
Skapa din egen portfolio-sida {#inledning}
===================================

Du skall sätta samman en portfolio-sida till kursen design. För att göra det skall du använda en förberedd kopia av ramverket [Pico](http://picocms.org/) med innehåll anpassat till kursen design.

Du behöver installera din portfolio, fylla den med innehåll och sedan lägga till egen style med hjälp utav CSS.

Du skall också skapa ett Git-repo av din portfolio-sida och ladda upp det till Github.



<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har en labbmiljö som motsvarar [labbmiljön för kursen design](kurser/design-v3/kmom01#labbmiljo).



Introduktion och förberedelse {#intro}
-----------------------

Gör följande steg för att förbereda dig inför uppgiften.

### Kopiera från example/portfolio {#kopiera}

[INFO]
Om du har följt övningen [Vad är Pico](kunskap/vad-ar-pico-v2) så kan hoppa över denna delen.
[/INFO]

Det finns en förberedd installation som är specifik för kursen design och dess portfolio-sida. Kopiera den och installera det som behövs med composer

```
# Stå i rooten av kursrepot
rsync -ravd example/portfolio/ me/portfolio/
cd me/portfolio
composer install
```

Om det uppstår problem där felutskriften säger att det saknas php paket med kommandot `composer install` kan följande kommando lösa bekymrat: `sudo apt-get install php-xml php-mbstring`.

Nu kan du öppna en webbläsare och peka mot katalogen `me/portfolio`. Får du problem eller felmeddelanden så hojta till i chatten så hjälper vi dig den sista biten.



### Publicera till studentservern {#publicera}

För att din portfolio ska fungera på studentservern så behöver du uppdatera två rader i `me/portfolio/.htaccess`, annars får du 404 på dina länkar och 500 på bilderna.

I följande stycke:

```text
# Rewrite 1 - For request via www.student.bth.se
RewriteCond %{HTTP_HOST} ^www\.student\.bth\.se$ [NC]
RewriteRule ^image/(.*)$ /~mosstud/dbwebb-kurser/design/me/portfolio/assets/cimage/img.php?src=$1 [QSA,NC,L]

RewriteCond %{HTTP_HOST} ^www\.student\.bth\.se$ [NC]
RewriteRule (.*) /~mosstud/dbwebb-kurser/design/me/portfolio/index.php/$1 [NC,L]
```

Så ska ni byta ut `mosstud` till ert egna studentakronym (ex. `abcd20`).

Därefter kan ni publicera till studentservern för att se att allt fungerar:

```
dbwebb publish me
```



#### Bilder laddas inte lokalt {#bilder-felsok}

Det kan hända att du får 404 på dina bilder lokalt. Om du går in i devtools (F12) och går till network, så kan du se alla filer som hämtas för hemsidan. Där kan du se länkarna till de bilder som inte laddas in. Om du öppnar en av dem och får felmeddelandet:

```
[img.php]

img.php: Uncaught exception

Cachedir is not a directory.
```

Så behöver du uppdatera rättigheterna på cache-mappen med hjälp utav:

```bash
# Stå i me/portfolio
chmod -R 777 cache/*
```

Ett annat fel som kan uppstå är `[img.php] Extension gd is not loaded`. Leta reda på xampp's `php.ini`-fil och hitta raden `;extension=gd`. Där tar du bort `;` för att ladda in `gd`.



### Git {#git}

Ni ska ladda upp eran portfolio till GitHub. Om ni inte redan har, jobba igenom guiden "[Kom igång med Git och GitHub](guide/git)" som går igenom hur man sätter upp ett repo. Kort sagt:

* Skapa repot i `me/portfolio` med `git init`
* Lägg till filerna med `git add .`
* Commit:a med `git commit -m <message>`
* Säg vart du vill ladda upp koden med `git remote add origin <url>`
* Ladda upp med `git push`
* Tagga ditt repo med `git tag -a v1.0.0 -m <message>`
* Ladda upp taggen med `git push --tags`



#### Support for password authentication {#git-support}

Om ni får problem med att göra `git push` och ett felmeddelande med något liknande "Support for password authentication was removed on August 13, 2021." har ni valt `https` länken när ni kopplade er mot GitHub. Du kan dubbelkolla att det är det som är bekymrat med kommandot `git remote -v` börjar länken som dyker upp med `https` kan du ändra till `ssh` länken. Du ändrar då länken med kommandot `git remote set-url origin git@github.com:username/repo`.



### Bekanta dig {#bekanta}

Bekanta dig med strukturen för din portfolio-katalog och se vad som finns där. Om du inte har, läs igenom artikeln "[Vad är Pico?](kunskap/vad-ar-pico-v2)".

Du kan följa med i videon nedan för att se hur man kan:

* Uppdatera startsidan
* Lägg till ny sida
* Lägg till under-sidor (subpages)
* Modifiera HTML-strukturen på sidan
* Redigera flash-bilden
* Hur du lägger till en bild på sidan

[YOUTUBE src="6aVDmXDXqDs" list="PLKtP9l5q3ce8h3PKihj_CSVBkyxtORWiy" width=700 caption="Pico introduktion"]



Krav {#krav}
-----------------------

1. Förstasidan `portfolio/content/index.md` skall innehålla en hälsning/presentation av/om dig tillsammans med minst en bild som representerar dig.

1. Uppdatera länken i footern så den länkar till ditt egna Github-repo.

1. Byt ut logotypen som används i headern (`content/_meta.md`)

1. Skapa ditt eget tema och aktivera det i `config/config.yml`, se "[Vad är Pico? - Tema](kunskap/vad-ar-pico-v2#tema)" för mer information.

1. I din portfolio-mapp (`me/portfolio/`), skapa en fil som heter `github.txt` som innehåller enbart länken till hemsidan för ditt Github-repo (ex: `https://github.com/dbwebb-se/design-v3`)

1. Publicera dina filer till studentservern, `dbwebb publish me`, och kontrollera att allt fungerar som det ska.

1. Commit:a dina ändringar och lägg till en ny tagg (1.0.\*).

1. Push:a repot till GitHub, inklusive taggarna.



Tips från coachen {#tips}
-----------------------

Gör små commits och gör dem ofta, när du väl har din bas. Använd tydliga commit-meddelanden så historiken ser bra ut, det är en bra övning inför projektkurserna och arbetslivet.

Lycka till och hojta till i chatt om du behöver hjälp!
