---
author:
    - aar
revision:
    "2022-10-26": "(D, aar) Bytte ut CircleCi mot Github Actions."
    "2021-10-29": "(C, aar) Slog ihop canvas inlämning med kmom01."
    "2020-11-06": "(B, aar) Ready for HT20."
    "2019-11-01": "(A, aar) Första versionen."
...
Kmom02: Docker
==================================

[WARNING]
Kurs under utveckling!

Påbörja inte före denna rutan är borta.
[/WARNING]

## Skapa en Docker image för testning {#file_test}


I den image som används i produktion är koden och alla dependencies statiska. När vi har skapat vår image kommer de sakerna inte ändras och containern ska vara igång för evigt. När vi istället gör en image för testning vill vi inte behöva bygga om hela vår image varje gång vi vill kolla om något fungerar och när den startas som en container ska den stängas när testerna har körts. Detta gör att koden och testerna behöver vara dynamisk i vår image. Denna imagen ska bara behöva byggas om när vi ändrar på test miljön (moduler och verktyg).

I produktions filen skapar vi mappen microblog och kopiera in alla mappar som behövs och gör allt i den mappen. Men det går inte nu när vi ska separera på installations- och kod-filer. `requirements` mappen ska ni kopiera in och installera filen `requirements/test.txt`. Själva koden och testerna läggs in som en volym när ni startar er container efter att ni har byggt en image.

- Skapa en ny Dockerfile, döp den till `Dockerfile_test` och lägg den i mappen `docker`.
- I den är det bara `requirements` mappen som ska kopieras in. Installera filen `requirements/test.txt`.
- Installera `make` kommandot.
- Skapa ett nytt `boot.sh` skript som kör `make test` i mappen du sätter som volym för testerna.
- När containern startar ska den köra `make test` via ditt skript. När det är klart ska containern stängas ner av sig själv.

Bygg filen som vanligt, `docker build -t microblog:test -f docker/Dockerfile_test .`. När ni ska använda den sen måste ni skicka med er lokala microblog mapp som en volym till container.

Om ni vill kan ni ändra så integrationstesterna körs mot MySQL i docker container istället för SQLite i minnet. Testerna kommer troligen köras långsammare men testerna blir mer värdefulla då de körs mot likadant system som körs i produktion. När man kör databasen i en container för testerna brukar man inte göra data mappen till en volym, i och med att vi inte bryr oss om persistent data för tester.

Kolla så att era Dockerfiler validerar med Hadolint. Det finns redan ett Make kommando, `make validate-docker`, som kör validering på `Dockerfile_prod` och `Dockerfile_test`.



## Spara konfiguration som kod {#konfig_kod}

Skapa filen `docker-compose.yml` i root mappen av repot. I den, lägg till en service för att köra test container och en som startar prod containern mot en MySQL container. För att docker-compose ska klara av att hantera `<<-EOF` i Dockerfile behöver ni sätta följande miljövariabler:

```
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1
```

`docker-compose run test` ska starta test containern och köra alla tester.

`docker-compose up prod` ska starta en MySQL container och er prod container.

Skapa ett nytt Make kommando `make test-docker` som startar er test image och kör alla tester på koden.



## Kör i produktion {#docker_prod}

Det sista steget i continuous delivery är att ni själva måste manuellt uppgradera produktions miljön så att er nya image används. Men vi skippar det i detta kursmomentet och tar det i nästa istället.

<!-- att köra er produktions container på er VM i Azure. Installera Docker på servern och starta up er microblog med docker-compose. Bygg inte containerna på servern utan använd den som byggdes på GitHub Actions och laddades upp till DockerHub. -->



Uppgifter {#uppgifter}
-----------------------------------------------

Följande uppgifter skall utföras och resultatet skall redovisas.
<!-- nginx i docker med https https://medium.com/@pentacent/nginx-and-lets-encrypt-with-docker-in-less-than-5-minutes-b4b8a60d3a71 -->

1. Två Dockerfile's i mappen `docker`, en för produktion som heter `Dockerfile_prod` och en som heter `Dockerfile_test`.

1. En docker-compose fil för att köra test och starta prod miljön.

2. Använd `make test-docker` för att köra testerna och validerar kod i Docker.

3. GitHub Action kör testerna, validering och bygger produktions image och pushar till DockerHub.

4. Försäkra dig om att du har pushat repot med din senaste kod och taggat din inlämning med version v12.0.0. Om du pushar kmom02 flera gånger kan du öka siffrorna efter 12:an.

5. Inkludera en länk till ditt GitHub repo och din webbsida (domännamn) i din inlämning på Canvas.

[YOUTUBE src=LOULXBE3iAE caption="Hur det kan se ut när det är klart"]

Läsanvisningar {#las}
--------------------------

I kursen ska ni läsa boken **[Effective DevOps](http://tinyurl.com/y6jy5x8u)**. Boken är inte kopplad till kursmomenten, men den behövs när ni ska skriva rapporten i slutet av kursen. Ni kan själva välja upplägg för när ni läser den. Ett rekommenderat upplägg är att läsa en del, "part", i veckan. Då har ni läst igenom hela boken efter kmom06.

Rekommendationen för denna veckan är att läsa **"Part II. Collaboration"**.



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i texten:

1. Vad var din uppfattning av devops innan kursen började?

1. Hur skulle du definiera devops?

1. Har du använt Docker förut? Gick det bra att använda det nu?

1. Hur används Docker inom devops?

1. Valde du att bygga ny Docker image vid varje commit eller release? Varför?

1. Vad är Continuous Delivery?

1. Hur var storleken på kursmomentet? Vad tycker du om upplägget på kursmomentet?

1. Veckornas TIL?
