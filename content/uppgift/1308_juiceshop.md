---
author:
    - grm
category: itsec
revision:
    "2023-10-17": (A, grm) Initial release.
...

Attacker på Juice Shop {#intro}
==================================

Uppgiften går ut på att lära sig attacker med hjälp av "[OWASP Juiceshop](https://owasp.org/www-project-juice-shop/#)". Det är ju olagligt att utföra attacker och därför installerar vi en kopia av Juiceshop lokalt. Sen utför vi attacker mot vår Juiceshop och kan om vi behöver ta hjälp av deras "[Hacking instructor](https://pwning.owasp-juice.shop/companion-guide/latest/part1/challenges.html#_hacking_instructor)" och "Tutorials".

<!--more-->

Förkunskaper {#forkunskaper}
-----------------------------

Du har deltagit i föreläsningen som tillhör kursmomentet.

Installation {#installation}
-----------------------------

Jag installerar på Wsl i min hemkatalog. Det funkar också i Powershell. Jag följer denna "[Lokal installation](https://pwning.owasp-juice.shop/companion-guide/latest/part1/running.html#_local_installation)" och väljer "From sources". 

Jag installerar på Mac och Ubuntu på samma sätt, under Applications i min hemmakatalog.

```bash
# npm är installerat
$ git clone https://github.com/juice-shop/juice-shop.git --depth 1
$ cd juice-shop
# Installera, görs bara en gång
$ npm install
# Kör igång Juice Shop
$ npm start
# Starta i browsern med http://localhost:3000
```

Juice Shop {#juice}
-----------------------------

Juice shop som applikation är utvecklad med ett stort antal säkerhetsbrister och ska inte användas som mallapplikation för webbutvecklare. Det är ett verktyg för att lära sig attacker och bli medveten om säkerhetsrisker. OWASP Juice Shop är ett projekt med öppen källkod som drivs av det ideella Open Worldwide Application Security Project® (OWASP) och utvecklas och underhålls av volontärer.



Grundkrav {#grundkrav}
-----------------------------

Gör minst 10 utmaningar (individuellt eller i grupp om 2 och 2). Skriv en kortbeskrivning för varje utmaning som gjorts (individuellt).


Redovisa {#redovisa}
-----------------------

1. Redovisa varje utmaning du löst med rubrik och en kort beskrivning i textrutan i Kmom03 på Canvas.
1. Ta en skärmdump på din scoreboard och ladda upp i Kmom03 på Canvas.
