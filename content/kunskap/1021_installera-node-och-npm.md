---
author: mos
category:
    - labbmiljo
    - javascript
    - nodejs
    - npm
revision:
    "2019-01-11": (E, mos) Genomgången och testad md Node v10.
    "2018-10-25": (D, mos) Lyft fram Windows 10 Bash.
    "2018-01-18": (C, mos) Uppdatera linux och pakethanterare installationen.
    "2016-11-01": (B, mos) Bytte ut nodejs mode node i verifiering.
    "2016-10-14": (A, mos) Första utgåvan.
...
Installera Node.js och npm
===================================

[FIGURE src=/image/snapvt16/nodejs-logo.png class="right"]

Vi skall installera en miljö för JavaScript. Det handlar om Node.js och pakethanteraren npm.

Miljön innebär att du kan köra JavaScript på din dator och du kan ta del av alla de program och paket som erbjuds via pakethanteraren npm.



<!--more-->



Läs mer {#mer}
-------------------------------

Du kan läsa mer om [Node.js på webbplatsen](https://nodejs.org/).

Du kan läsa mer om [npm på webbplatsen](https://www.npmjs.com/). Där kan du också söka efter de paket som finns publicerade.



Förutsättning {#pre}
-------------------------------

Du kör Windows, macOS eller en linuxdistribution, du är bekant med terminalen och hur man installerar program.



Installera på Windows (inklusive Cygwin) {#windows}
-------------------------------

Gå till [nedladdningssidan för Node](https://nodejs.org/en/download/). Ladda ned installationsprogrammet och installera.

Programmen node och npm läggs till i din PATH automatiskt.

Du kan nu starta programmen från windows-terminalen `cmd`. Men starta om din terminal så att den får del av den uppdaterade pathen.

```text
node --version
npm --version
```

Så här kan det se ut i terminalen `cmd`.

[FIGURE src=image/snapvt19/cmd-node-npm-version.png?w=w3 caption="Node och npm är installerade i din Windows-maskin."]

Du kommer även åt programmen via din Cygwin-terminal, om du har Cygwin installerat.

Öppna din Cygwin-terminal så kan det se ut så här.

[FIGURE src=image/snapvt19/cygwin-node-npm-version.png?w=w3 caption="Node och npm går även att nå från Cygwin."]



Installera Windows 10 WSL Debian/Bash {#wsl}
-------------------------------

Även om du har installerat Node på din Windows-maskin, och du använder WSL, så behöver du installera Node/npm i din klient i WSL. Du har då två installationer av Node, en i Windows och en i ditt WSL.

Olika linux-varianter har olika sätt att installera node och npm. Följ instruktionerna på [nedladdningssidan för olika pakethanterare](https://nodejs.org/en/download/package-manager/). Det kan finnas vissa förberedelser som behövs för att du skall kunna installera den senaste versionen, det handlar om vilket repo som apt-get använder för att hämta installationsfilern från. Kolla nedladdningssidan för att vara säker.

Sist jag installerade på WSL Debian/GNU Linux version 9 (januari 2019, v10 av Node) så var instruktionen enligt följande.

Först hämtar jag installationsprogrammen, så att pakethanteraren vet vad som skall installeras. Jag behöver vara root när detta görs.

```text
# Using Debian, as root
sudo bash
curl -sL https://deb.nodesource.com/setup_18.x | bash -
apt-get install -y nodejs
```

Nu är det installerat. Jag kan nu logga ut som root och fortsätta som min vanliga användare.

Jag får eventuellt uppdatera sökvägen, så mitt shell hittar de nyligen installerade binärerna.

```text
hash -r
```

Du kan nu starta programmet `node` från din terminal.

```text
which node
node --version
```

Jag dubbelkollar att pakethanteraren `npm` fungerar.

```text
which npm
npm --version
```

Så här ser det ut på Debian/Linux i WSL i Windows.

[FIGURE src=image/snapvt19/wsl-node-npm-version.png?w=w3 caption="Nu fungerar Node och npm i WSL."]

<!--
I debian fanns det tidigare ett kommando som hette node, därför installeras vår "node" som nodejs. Men jag vill använda det som node och lägger därför en symbolisk länk till nodejs som jag döper till node.

```bash
$ sudo ln -s $( which nodejs ) /usr/bin/node
```
-->



Installera på Mac OS {#macos}
-------------------------------

Gå till [nedladdningssidan för Node](https://nodejs.org/en/download/). Ladda ned installationsprogrammet och installera.

Du kan nu starta programmet `node` från din terminal.

```text
which node
node --version
```

Jag dubbelkollar att pakethanteraren `npm` fungerar.

```text
which npm
npm --version
```



Installera på Linux {#linux}
-------------------------------

Olika linux-varianter har olika sätt att installera node och npm. Följ instruktionerna på [nedladdningssidan för olika pakethanterare](https://nodejs.org/en/download/package-manager/). Det kan finnas vissa förberedelser som behövs för att du skall kunna installera den senaste versionen, det handlar om vilket repo som apt-get använder för att hämta installationsfilern från. Kolla nedladdningssidan för att vara säker.

Sist jag installerade på Debian 9 (januari 2019, v10 av Node) så var instruktionen enligt följande.

```text
# Using Debian, as root
curl -sL https://deb.nodesource.com/setup_18.x | bash -
apt-get install -y nodejs
```

Jag får eventuellt uppdatera sökvägen, så mitt shell hittar de nyligen installerade binärerna.

```text
hash -r
```

Du kan nu starta programmet `node` från din terminal.

```text
which node
node --version
```

Jag dubbelkollar att pakethanteraren `npm` fungerar.

```text
which npm
npm --version
```



Verifiera att Node.js fungerar {#test}
-------------------------------

Du kan nu köra JavaScript med node. Pröva följande.

```text
$ node --help
$ node --eval "console.log('Hello World');"
Hello World
```

Du kan också köra node interaktivt och evaluera JavaScript rad för rad. Programmet visar att den är redo för inmatning med prompten `>`.

```text
$ node
> console.log("Hej")
Hej
>
```

För att få upp prompten i cygwin skall node köras i _interactive mode_. Detta gör du genom att använda kommandot `node -i`.

Så här kan det se ut.

[ASCIINEMA src=91267]

Du kan också låta nodejs köra JavaScript-program som finns i filer.

```text
$ echo "console.log('Hello')" > hello.js
$ node hello.js
Hello
```

Så här kan det se ut.

[ASCIINEMA src=91268]



Verifiera att npm fungerar {#test1}
-------------------------------

Se vad du kan göra med npm.

```text
$ npm --help
```



Avslutningsvis {#avslutning}
------------------------------

Det finns en [forumtråd om node och npm](t/5801). Ställ frågor där och dela med dig av dina tips och trix.
