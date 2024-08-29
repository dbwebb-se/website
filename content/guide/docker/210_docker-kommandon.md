---
author: lew
revision:
    "2022-04-12": "(B, lew) Uppdatering inför HT22."
    "2019-03-14": "(A, lew) Första versionen."
...
Vanliga Dockerkommandon
=======================

Vi ska prova att starta en container som laddades ned från Docker Hub. Vad Docker Hub är tar vi lite senare i guiden. Hur kan vi se vilka containrar som är startade? Vilka images har vi? Docker sparar all information på olika platser beroende på operativsystem.

* Linux: */var/lib/docker/*
* Mac: *~/Library/Containers/com.docker.docker/Data/vms/0/Docker.raw*
* Windows: *C:\Users\Public\Documents\Hyper-V\Virtual Hard Disks\MobyLinuxVM.vhdx*

Vi ska inte gå in i mapparna/filerna och pilla utan vi använder Dockers CLI och hanterar det därifrån.



### Några bra-att-ha-kommandon {#bra-att-ha}

| Kommando                    | Vad gör det?                          |
|-----------------------      |------------------------------------   |
| docker --help               | Hjälp om docker                       |
| docker images               | Listar alla nedladdade images         |
| docker search &lt;image&gt; | Söker efter en image på Docker Hub    |
| docker ps                   | Listar alla containrar                |
| docker rm &lt;id&gt;        | Tar bort en eller flera container     |
| docker rmi &lt;id&gt;       | Tar bort en eller flera images        |
| docker start &lt;id&gt;     | Startar en eller flera containrar     |
| docker stop &lt;id&gt;      | Stoppar en eller flera containrar     |
| docker pull &lt;image&gt;   | laddar ner en image utan att köra den |
| docker run &lt;image&gt;    | Starta en container från en image     |

Istället för ett id kan vi använda namnet på containern. Om vi inte har satt det själva autogenereras ett namn. Hur kan man se den informationen då? Först behöver vi en startad container! Ubuntu har ett eget repository där de huserar ett antal images vi kan använda. Det finns images i olika storlekar och en grundregel är att utgå ifrån en nedbantad version och sedan fylla på själv med det man vill ha och behöver. När vi kör kommandot `run <username/imagename>` letar docker först lokalt och om det inte återfinns där letas det på Docker Hub där den laddas ner om den hittas.

`$ docker run --rm -it ubuntu:24.04`

Flaggan `-it` gör att vi får ett interaktivt shell att jobba med. (Se `docker run --help`).  
Flaggan `--rm` rensar automatiskt upp efter oss när vi stänger containern. Om vi vill att containern ska köras i bakgrunden, kan vi lägga till flaggan `-d` (detach).

Öppna sedan en ny terminal och kör `$ docker ps`:

```bash
$ docker ps
CONTAINER ID   IMAGE                   COMMAND                  CREATED         STATUS         PORTS                     NAMES
5490e0ab02da   ubuntu:24.04            "bash"                   9 seconds ago   Up 8 seconds                             nostalgic_mccarthy
```

Du kan behöva scrolla åt höger för att se allt. Här får vi fram id, image, givet kommando och vilka namn containrarna har. På ovan container kan man då köra tex:

```
$ docker stop nostalgic_mccarthy
```

Containern är då stoppad och nollställd.

Om vi kör `$ docker images` och ser:
```
<none>     <none>     cb3e76fda019     2 weeks ago     87.3MB
```

så har vi lyckats skapa images som inte är kopplade till någon taggad version (vi kommer till taggning senare). Vi kan rensa lite emellanåt med `docker rmi $(docker images -f "dangling=true" -q)`. Det kallas *Prune dangling images*. Vill vi istället rensa helt kör vi `$ docker system prune -a`. **Vi får då bygga om de images som inte har blivit pushade**.
