---
author: lew
revision:
  "2020-03-11": "(A, lew) Första versionen."
...

## Installera Apache {#install}

Vi behöver webbservern Apache. Så här installerar du Apache och testar att det fungerar. Vi börjar med att skapa en Dockerfile med följande innehåll:

```text
FROM ubuntu:22.04

RUN apt update && apt install -y apache2

CMD apachectl -D FOREGROUND
```

**-D FOREGROUND** tvingar Apache att köras i förgrunden. Om vi startar med tex `apachectl start` så kommer servern köras fristående och inte i Dockers "huvudprocess". När ingenting körs i huvudprocessen stänger Docker ner sig.

Om vi bygger imagen och kör igång den kan vi se servern igång och vänta på requests:

```console
$ docker build -t apachetest .
```

```console
$ docker run apachetest
AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
```

Om vi vill bli av med varningen petar vi in ServerName i rätt fil. Lägg till följande i Dockerfile, innan du kör igång servern:

```text
RUN echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf
```

Om vi hade tagit oss in i containern, tex via `docker exec -it <id> bash` och velat kika statusen hade felet med en terminalbaserad webbläsare dykt upp. Man kan då välja att installera tex `w3m` i byggfasen.
