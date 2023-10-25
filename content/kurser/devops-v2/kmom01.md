---
author:
    - aar
revision:
    "2022-10-26": "(D, aar) Bytte ut CircleCi mot Github Actions."
    "2021-10-29": "(C, aar) Slog ihop canvas inlämning med kmom02."
    "2020-10-20": "(B, aar) Uppdaterade med Azure inför HT20."
    "2019-04-17": "(A, aar) Första versionen släppt."
...
Kmom01: Introduktion till DevOps
==================================



#### Driftsätt appen {#driftsatt}

Om något går fel när du jobbar igenom artikeln och du inte riktigt vet hur du ska ångra det, skapa om servern i Azure och använd dig av [skripten i repot](https://github.com/dbwebb-se/microblog/tree/master/scripts) för att snabbt göra de 10 första minuterna på en server och börja om med driftsättningen.




### Continues Integration {#ci}

När du pushar kod i ditt repo ska Actions köra alla unittester, integrationtester och validera koden. Använd dig av make kommandot `make test` för att köra det. Du ska **inte** använda dig av flake8 som de gjorde i artikeln.

Jag rekommenderar att ni lägger till att cacha dependencies, då går det lite snabbare att köra allt.


### Lästips {#lastips}


1. [The 12 Factor App](https://12factor.net/) är en populär "standard" för att bygga Software-as-a-service och  används mycket i devops sammanhang.

1. [DevOps Roadmap](https://roadmap.sh/devops) Visar upp vanligaste verktygen man behöver kunna för att jobba med de tekniska delarna av devops.

    - Här kan ni se vilka av verktygen vi kommer använda oss i kursen, [i fylld devops roadmap](image/devops/devops-roadmap-filled.png)



Uppgifter  {#uppgifter}
-------------------------------------------

Följande uppgifter skall utföras och resultatet skall redovisas.

1. Lägg till funktionaliteten att följa andras blogginlägg. Jobba igenom [Kom igång med followers](kunskap/kom-igang-med-followers).

2. Driftsätt den nya funktionaliteten på din server.

3. Koppla ditt repo till GitHub Actions. När du gör en commit ska Actions köra alla unittester, integrationtester och validera koden. Lägg till en Actions [badge](https://docs.github.com/en/actions/monitoring-and-troubleshooting-workflows/adding-a-workflow-status-badge) i README filen för repot.

4. Försäkra dig om att du har pushat repot med din senaste kod och taggat din inlämning med version v11.0.0. PS. vi ska göra ny tag varje kmom, ni börjar på v11.0.0 för att taggarna jag har skapat när jag har utvecklat repot inte ska blandas med era. Om du pushar kmom01 flera gånger kan du öka siffrorna efter 11:an.

<!-- 1. Inkludera en länk till ditt GitHub repo och din webbsida (domännamn) i din inlämning på Canvas. -->

[YOUTUBE src=jQPIHeLJ7ZA caption="Hur det kan se ut när det är klart"]


Läsanvisningar {#las}
--------------------------

I kursen ska ni läsa boken **[Effective DevOps](http://tinyurl.com/y6jy5x8u)**. Boken är inte kopplad till kursmomenten, men den behövs när ni ska skriva rapporten i slutet av kursen. Ni kan själva välja upplägg för när ni läser den. Ett rekommenderat upplägg är att läsa en del, "part", i veckan. Då har ni läst igenom hela boken efter kmom06.

Rekommendationen för denna veckan är att läsa **"Part I. What is devops?"**.



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

Det är ingen inlämning på Canvas för kmom01. Kmom01 redovisas tillsammans med kmom02 istället.

<!--
Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i texten:

1. Vad var din uppfattning av devops för en vecka sen?

1. Har det ändrats efter denna veckan?

1. Hur skulle du definiera devops?

1. Finns det något speciellt du vill lära dig i denna kursen?

1. Vad tycker du om kmom01's upplägg och storlek?
-->
