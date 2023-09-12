---
author: lew
revision:
    "2023-09-12": (C, lew) Uppdaterad inför HT23.
    "2021-04-14": (B, lew) Uppdaterade porten i kravet inför HT21.
    "2019-04-16": (A, lew) Första utgåvan inför HT19.
...
Bash-script som testar serverns routes
===================================

Du skall skapa ett Bash-script som testar de olika routesen hos din server. Som hjälp använder vi programmet [curl](https://curl.haxx.se/) i scriptet. Du kan säkert redan ha det installerat, annars är det bara att installera det med pakethanteraren.

<!--more-->



Förkunskaper {#forkunskaper}
-----------------------

Du har genomfört uppgiften "[Webbserver i Docker](uppgift/webbserver-i-docker)".

Du har genomfört uppgiften "[Bash-script med argument options](uppgift/ett-bash-script-med-options-command-arguments)" från kursmoment 03.

Du har läst kurslitteraturen och skaffat dig grundläggande kunskaper om bash.



Introduktion {#intro}
-----------------------

Du ska skapa, likt förra kursmomentet, ett Bash script som med argument kan ge svar från din server. Du kan med andra ord återanvända en hel del från kursmoment 03.

Vi kan använda Curl för att hämta resultatet av ett sidanrop. För mer info kan du kika i manualen `$ man curl` eller Curl's hjälptext `$ curl --help`. Du kommer behöva ett fåtal options för att komma i mål med kursmomentet.



Krav {#krav}
-----------------------

1. Skapa ett bash-script `client/client.bash` som kan ta emot options och argument. Anropas ditt script utan options eller argument, skall scriptet skriva ut att man kan få hjälp genom att använda `--help, -h`.

1. Gör scriptet exekverbart.

1. Ditt script skall avslutas med korrekt exit värde.

1. Använd en main-funktion för att starta programmet.

1. Onödig inforation från cURL ska döljas.

1. Gör en kontroll om miljövariabeln `DBWEBB_PORT` är satt. Är den det ska den användas mot servern. Annars väljer du port själv.

1. Strukturera koden i olika funktioner.

1. Följande *options* ska fungera:

| Option                | Vad skall hända |
|-----------------------|-----------------|
| `-h, --help`          | Skriv ut en hjälptext om hur programmet används. |
| `-v, --version`       | Visar nuvarande version av programmet. |
| `-s, --save`          | Spara den returnerade datan till `client/saved.data`. Den behöver då inte skrivas ut. Det ska fungera för alla argument.|


7. Följande *argument* ska fungera:

| Argument&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| Vad skall hända |
|---------------------------|-----------------|
| `all`                     | anropa din route `/all`. |
| `names`                   | anropa din route `/names`.|
| `color <color>`           | anropa din route `color/<color>`. |
| `test <url>`        | Använd curl för att skriva ut ett meddelande om servern är igång eller ej. |



Validera `client.bash` genom att göra följande kommandon i kurskatalogen i terminalen.

```bash
# Flytta till kurskatalogen
$ dbwebb validate client
$ dbwebb publish client
```

Rätta eventuella fel som dyker upp och publicera igen. När det ser grönt ut så är du klar.  



Extrauppgift {#extra}
-----------------------

Det finns inga extrauppgifter.



Tips från coachen {#tips}
-----------------------

Lycka till och hojta till i Discord om du behöver hjälp!
