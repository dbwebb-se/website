Initiera kursrepo och server
==================================

Innan du kan börja jobba med ett kursrepo så behöver du initiera både kursrepot och studentservern.

```bash
# Flytta in i katalogen för kursrepot, tex kursrepot webtec
$ cd webtec
$ dbwebb init
```

Du måste stå i ett kursrepo för att köra kommandot.

Det som händer vid init är ett antal saker. 

För det första så initieras ditt kursrepo genom att katalogen `me` skapas tillsammans med ett antal underkataloger. Det är en standardstruktur som du skall följa i kursen.

För det andra så loggar `dbwebb` in på studentservern och skapar en katalogstruktur, dels skapas katalogen `$HOME/dbwebb-kurser` dit ditt kursrepo kommer att laddas upp och dels skapas katalogen `$HOME/www/dbwebb-kurser` där dina filer läggs som blir synliga via webbservern.

I båda fallen så skrivs inga filer eller kataloger över, om de redan finns så får de vara var. Det betyder att du kan köra `dbwebb init` flera gånger utan att något förstörs lokalt.

När du kört kommandot kan du pröva att logga in på studentservern via `dbwebb login` och se att katalogerna har skapats.

```bash
$ dbwebb login
$ ls dbwebb-kurser
$ ls www/dbwebb-kurser
$ exit 
```

Kommandot `dbwebb init` är samma som att köra följande kommandon.

```text
$ dbwebb init-me
$ dbwebb init-server
$ dbwebb init-structure-dbwebb-kurser
$ dbwebb init-structure-www-dbwebb-kurser
```

Så här kan det se ut. I exemplet initierar jag kursen htmlphp samt loggar in på servern för att se hur katalogerna skapades.

[ASCIINEMA src=24621]
