---
author: lew
revision:
    "2019-06-11": "(A, lew) Första versionen."
...
up vs run
=======================

Vi kan använda kommandona `$ docker compose up ...` eller `$ docker compose run ...`. Det finns en viss skillnad mellan dem och hur de startar våra services.



### docker compose up {#up}

Oftast vill man köra *docker compose up <service>*. Det skapar en ny container utifrån specifikationerna i docker-compose.yml och startar den.



### docker compose run {#run}

Vill man starta en service för ett specifikt ändamål eller köra ett kommando, till exempel köra ett script, använder vi *docker compose run <service>*. Det passar bra om vi till exempel har definierat ett kommando, `CMD`, i Dockerfile där vi kör ett script.



### docker compose start/stop {#start-stop}

Om vi har en startad container kan vi stoppa den med `stop`. Vill vi sedan starta den igen använder vi märkligt nog `start`.
