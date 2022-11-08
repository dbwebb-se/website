---
author: moc
category:
    - devops
    - docker
revision:
    "2022-11-03": (C, aar) La till heredoc och logs.
    "2021-11-09": (B, aar) Updaterade python version för att bli av med gcc problem.
    "2020-10-25": (A, moc) Skapad inför HT2020.
...
Microblog med Docker containers {#intro}
===========================================

I denna artikeln ska vi jobba igenom [kapitel 19](https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-xix-deployment-on-docker-containers) i Miguel's guide. Vi skall titta på hur man kan bygga en container för Microblog applikationen och koppla upp den mot en separat databas container. Slutligen skall vi också publicera den på Docker-registret så att vi kan komma åt applikationen utan att behöva källkoden.


<!--more-->

Förutsättningar {#prereq}
--------------------------
Du har [virtualiseringsmiljon docker](kunskap/installera-virtualiseringsmiljon-docker) installerat.


Bygg en Container Image {#bygg-microblog-container-image}
----------------------------------------------------------

Det första steget i att skapa en container för Microblog är att bygga en *image*. En *container image* är en typ av mall som används när man skapar en container. Den innehåller en översikt av hela filsystemet tillsammans med övriga inställningar som hanterar miljövariabler, hur nätverket är uppsatt och mycket annat. För att generera en image kommer vi skapa en ny Dockerfile `Dockerfile_prod` och lägga den i mappen `docker`. En *Dockerfile* är ett installationsskript som ser till att en applikation kan distribueras och köras likvärdigt på alla maskiner som har Docker installerad.


`docker/Dockerfile_prod` för Microblog:

```dockerfile
FROM python:3.8-alpine
RUN adduser -D microblog

WORKDIR /home/microblog

# COPY . .
COPY app app
COPY migrations migrations
COPY requirements requirements
COPY requirements.txt microblog.py boot.sh ./

RUN python -m venv .venv
RUN .venv/bin/pip3 install -r requirements.txt

ENV FLASK_APP microblog.py

RUN chmod +x boot.sh
RUN chown -R microblog:microblog ./

USER microblog

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
```

Varje rad i en *Dockerfile* är ett eget kommando som körs vid installationen. `FROM` anger den container image som vår nya image ska byggas på. Oftast börjar man från en existerande image och anpassar den till sitt projekt. Imagen innehåller ett namn och en tagg, separerade med ett kolon. Taggen används som en versionshantering vilket gör att en container image kan ha mer än bara en variant. Namnet på vår image är *python*, vilket är den officiella Dockerimagen för Python. Taggarna för den här imagen låter dig ange vilken version av python man vill köra och vilket operativsystem den skall ligga på. Taggen `3.8-alpine` väljer en Python v3.8 installerad på Alpine Linux. Alpine Linux-distributionen används ofta istället för andra populära distors som Ubuntu på grund av dess minimala storlek. Är du nyfiken kan man se vilka taggar som finns tillgängliga för Python-imagen på [Pythons image repository](https://hub.docker.com/_/python?tab=tags)


`RUN` exekverar ett kommando inuti i containern, liknande när man skriver något i terminalen. Många dockerfiler gör misstaget och använder sig av default användaren (`root`) vilket inte är bra säkerhetsmässigt. Så för att begränsa åtkomsten lägger vi till en ny användare `microblog` med hjälp av `adduser -D` kommandot.


`WORKDIR` skapar och sätter standardkatalog där applikationen ska installeras. När vi skapade `microblog` -användaren ovan skapades det redan en hemkatalog automatiskt, så jag väljer att göra denna mappen till vår *working directory*. Den nya mappen kommer att gälla för alla återstående kommandon i våran *Dockerfile*, och även senare när containern körs.


`COPY` kopierar filer från vår maskin till containern. Kommandot tar emot två eller flera argument, käll och destinations -filer/kataloger. Källan är relativ från den mappen Dockerfilen ligger i och destinationen är antingen den absoluta sökvägen eller den relativa från `WORKDIR`. Just nu kopierar vi bara de "nödvändiga" filerna som behövs för produktion. Vill man koripera alla filer kan istället skriva `COPY . .`.   
När *requirements* filerna har kopierats, kan vi skapa en ny virtuell miljö med `venv` modulen och därifrån installera alla moduler vi behöver.

Utöver våra *requirements* lägger vi också till `migrations` som hanterar databas migrationerna och `microblog.py` tillsammans med `app` mappen som innehåller koden till projektet. Vi lägger även till en ny fil, `boot.sh` som vi skapar lite senare.


`RUN chmod` och `chown` både säkerställer att den här nya *boot.sh* -filen har rättigheter som en körbar fil och att filerna som ligger i */home/microblog* bara ägs av `microblog` användaren.

`ENV` kommandot definierar vår containers miljövariabler. Vi behöver ställa in variabeln `FLASK_APP` som används när `flask` skall köras.

Med hjälp av `USER` kommandot sätter vi den nya `microblog` -användare som standardanvändare för alla kommande kommandon, detta kommer även gällas när containern startas.

`EXPOSE` konfigurerar porten som vår container skall använda för sin server. Detta är nödvändigt så att Docker kan konfigurera nätverket i containern. Jag har valt 5000 som är standardporten för `flask`, men det kan vara vilken port som helst.

Slutligen definierar kommandot `ENTRYPOINT` vad som ska köras när containern startas. Detta är kommandot som startar våran webbserver. För att det skall vara lite mer väl organiserat skapar vi ett separat skript `boot.sh`, som vi kopierade till containern tidigare.


I *boot.sh* lägger vi till följande:
```bash
#!/bin/sh

source .venv/bin/activate
flask db upgrade
exec gunicorn -b :5000 --access-logfile - --error-logfile - microblog:app
```

Scriptet aktiverar den virtuella miljön, uppgraderar databasen och startar servern med `gunicorn`.

Tittar vi närmre hittar vi ett `exec` kommando som läggs till innan `gunicorn`. I olika *shell -scripts* kommer `exec` att trigga den processen som kalla på scriptet och sedan ersätta den med det nya kommandot. Detta är en viktig del då Docker kopplar en containers livslängd till den första processen som körs på den. I detta fallet skulle startprocessen inte vara containerns huvudprocess, istället behöver vi då se till att startprocessen sätts som huvudprocess för att säkerställa att behållaren inte avslutas tidigt av Docker.

En annan intressant sak om Docker är att allt som containern skriver till `stdout` eller `stderr` fångas upp och lagras som loggar för containern. Av den anledningen är både `--access-logfile` och `--error-logfile` konfigurerade med en `-`, som skickar loggen till `stdout` så att Docker kan hantera loggarna istället.


Nu när vår nya Dockerfile är skapad kan vi bygga vår container image:

```bash
$ docker build -t microblog:1.0.0-prod -t microblog:prod -f docker/Dockerfile_prod .
```

Argumentet `-t` som vi lägger till i kommandot `docker build` anger namnet och taggen för den nya container imagen.   
`-f` specificerar vilken Dockerfile som skall användas. Sätter vi inte denna kommer Docker leta efter en fil som heter *Dockerfile* där vi sätter kontexten.   
`.` säger vart kontexten för vår container är. Det här är katalogen som vår *Dockerfile* kommer att använda när den bland annat kopierar filerna. Byggprocessen kommer att köra alla kommandon i *Dockerfile* och sedan skapa en image som kommer att lagras på din egna maskin.


Vill man se en lista av alla images som existerar lokalt kan man göra det med `docker images` :

```bash
$ docker images
REPOSITORY    TAG          IMAGE ID        CREATED              SIZE
microblog     1.0.0-prod       54a47d0c27cf    About a minute ago   216MB
python        3.6-alpine   a6beab4fa70b    9 months ago         88.7MB
```

Lista kommer att innehålla den nya imagen och även den bas imagen som den byggdes på. Varje gång du gör ändringar i programmet kan du uppdatera container imagen genom att köra byggkommandot igen.



Starta upp Containern {#starta-microblog-containern}
----------------------------------------------------

Efter att container imagen är byggd kan vi starta den med kommandot `docker run`. Denna tar vanligtvis emot ett stort antal argument, men vi börjar med ett mindre exempel:

```bash
$ docker run --name microblog -d -p 8000:5000 --rm microblog:1.0.0-prod
021da2e1e0d390320248abf97dfbbe7b27c70fefed113d5a41bb67a68522e91c
```

Kolla att du kommer åt webbsidan i webbläsaren med `localhost:8000`. Om något är fel kan du kolla loggarna med `docker logs microblog`.

`--name` tilldelar ett namn för containern.   
`-d` berättar för Docker att köra containern i bakgrunden.   
`-p` mappar containerns port till host-datorns. Den första porten är porten på host-datorn och den till höger är porten vi vill komma åt inuti containern. Ovanstående exempel öppnar port 5000 i containern till port 8000, så att man kan komma åt applikationen på `localhost:8000` även om containern internt använder 5000.   
`--rm` tar automatiskt bort containern när den avslutas. Även om detta inte riktigt krävs brukar inte containers som avslutas eller avbryts behövas längre, så då kan vi radera dem automatiskt.   
Det sista argumentet är namnet och taggen på container imagen vi vill starta. När du har kört ovanstående kommando kan du komma åt applikationen på *http://localhost:8000*.

Det som skrivs ut efter `docker run` är det ID som tilldelats den nya containern. Det är en lång hexadecimal sträng som man kan använda när vi behöver hänvisa till en container. Man behöver inte använde hela strängen, det skall räcka med att använda de 4 första tecknen. De flesta av Dockers kommandon brukar skriva ut de 12 första vilket också fungerar lika bra att använda.

Om man vill se vilka containers som är körandes kan man använda `docker ps`:

```bash
$ docker ps
CONTAINER ID  IMAGE             COMMAND      PORTS                   NAMES
021da2e1e0d3  microblog:1.0.0-prod  "./boot.sh"  0.0.0.0:8000->5000/tcp  microblog
```

Om man nu vill stoppa containern kan man använda `docker stop` följt av dess ID:

```bash
$ docker stop 021da2e1e0d3
021da2e1e0d3
```

Om du kommer ihåg finns det ett antal alternativ i programmets konfiguration som kommer från miljövariabler. Till exempel importeras flasks "hemliga nyckel" och "databas URL" från miljövariabler. I `docker run` -exemplet ovan har vi inte ställt in någon av dessa, så alla konfigurations alternativ kommer att använda sina standard värden.


I ett mer realistiskt exempel ställer man in dessa miljövariabler i containern. Vi såg tidigare att `ENV` i *Dockerfile* ställer in miljövariabler, och det är ett bra alternativ för variabler som kommer att vara statiska. För variabler som beror på installationen är det dock inte lika praktiskt att ha dem som en del av byggprocessen. Man vill ha en container image som är flexibel. Om vi vill ge applikationen till en annan person eller köra den på en annan server, vill vi kunna använda den som den är och inte behöva bygga om den med nya variabler.

Så extra miljövariabler för byggtid kan vara användbara, men det finns också ett behov av att ha "runtime variables" som kan ställas in via `docker run` -kommandot. Dessa variabler kan ställas in med `-e`. I följande exempel anges `SECRET_KEY` och databasnamnet:


```bash
$ docker run --name microblog -d -p 8000:5000 --rm -e SECRET_KEY=my-secret-key \
    -e MYSQL_DATABASE=microblog \
    microblog:1.0.0-prod
```

Det är inte ovanligt för `docker run` kommandon att bli långa på grund av att de har många miljövariabler som behöver definieras.


Lägg till en MySQL Container {#lagg-till-databas-container}
-----------------------------------------------------------

Liksom många andra produkter och tjänster har MySQL offentliga container images tillgängliga i Docker-registret. Liksom vår Microblog-container är MySQL beroende av miljövariabler som måste skickas till `docker run`. Dessa konfigurerar saker som lösenord, databasnamn osv. Även om det finns många MySQL-images i registret så använder vi den officiella som underhålls av MySQL-teamet.


Här är kommandot jag använder för att starta MySQL servern:

```bash
$ docker run --name mysql -d -e MYSQL_RANDOM_ROOT_PASSWORD=yes \
    -e MYSQL_DATABASE=microblog -e MYSQL_USER=microblog \
    -e MYSQL_PASSWORD=<database-password> \
    mysql/mysql-server:5.7
```

Inget mer behövs, alla maskiner som har Docker installerad kan köra kommandot ovan och en fullständigt installerad MySQL-server körs. Containern får ett slumpmässigt genererat root-lösenord, en helt ny databas som heter `microblog` och en användare med samma namn som är färdig konfigurerad med fullständiga behörigheter för att komma åt databasen. Observera att du måste ange ett rätt lösenord som värdet för miljövariabeln `MYSQL_PASSWORD`.


Vi kan nu starta om Microblog, men den här gången med en länk till databascontainern så att båda kan kommunicera via nätverket:

```
$ docker run --name microblog -d -p 8000:5000 --rm -e SECRET_KEY=my-secret-key \
    --link mysql:dbserver \
    -e DATABASE_URL=mysql+pymysql://microblog:<database-password>@dbserver/microblog \
    microblog:1.0.0-prod
```

I loggarna för microblogen kan du se om kopplingen mellan microblog och mysql fungerar, `docker logs microblog`. Om där inte är något fel så funkar det.

`--link` berättar för Docker att göra en annan container är tillgänglig. Argumentet innehåller två namn åtskilda av ett kolon. Den första delen är namnet eller ID på containern som ska länkas, i det här fallet den som heter `mysql` som vi skapade ovan. Den andra delen definierar ett host-namn som kan användas och hänvisar till den vi länkar. Här använder jag `dbserver` som representerar databasservern.


Nu när länken mellan de två containarna är uppsatta kan vi ställa in miljövariabeln 'DATABASE_URL' så att SQLAlchemy använder rätt databas. Databasens URL kommer att använda `dbserver`, `microblog` som databasnamn och användare och lösenordet ändrar du till den du valde när du startade MySQL.


När man startar upp en container brukar det ta några sekunder innan det är redo att användas och acceptera nya connections, så om vi då startar MySQL containern och applikationens container direkt efter kommer den inte vara connectad till databasen. När `flask db upgrade` då körs i **boot.sh** kommer det att krascha, vilket betyder att vi behöver ändra lite i boot scriptet:

```bash
#!/bin/sh

source .venv/bin/activate
while true; do
    flask db upgrade
    if [[ "$?" == "0" ]]; then
        break
    fi
    echo Upgrade command failed, retrying in 5 secs...
    sleep 5
done
exec gunicorn -b :5000 --access-logfile - --error-logfile - microblog:app
```

Denna loop kontrollerar exit-koden för kommandot `flask db upgrade`, och om den inte är `0` antar den att något gick fel, så den väntar fem sekunder och försöker sedan igen.



Validera Dockerfile {#validate}
-----------------------------------------------------------

Som med all annan kod vi skriver finns det så klart en linter/validator till koden i Dockerfiles. Vi ska använda [hadolint](https://github.com/hadolint/hadolint). Det finns olika sätt att installera den, men det lättaste är att använda deras docker container. Testa validera er kod med följande kommando.

```
docker run --rm -i hadolint/hadolint < docker/Dockerfile_prod

DL3059 info: Multiple consecutive `RUN` instructions. Consider consolidation.
DL3059 info: Multiple consecutive `RUN` instructions. Consider consolidation.
```

Du borde få samma fel som jag fick. Vi kan skriva om koden så det blir ett RUN kommando istället, i nyare versioner av Docker finns det stöd för [HereDoc](https://phoenixnap.com/kb/bash-heredoc). Med det kan vi skriva flera rader i RUN. 


Istället för:
```
RUN command1
RUN command2
RUN command3
```

Skriver vi:

```
RUN <<-EOF
    command1
    command2
    command3
EOF
```



#### Aktivera HereDoc {#heredoc}

Om du har tillräckligt ny version av Docker räcker det med att lägga till `# syntax=docker/dockerfile:1.4` överst i din Dockerfile. Sen kan du skriva om koden och bygga din image igen. Om du får felet.... har du en för gammal version av Docker.

Om du har en äldre version av Docker behöver du också sätta miljövariabeln `export DOCKER_BUILDKIT=1` innan du gör `build`. Det aktiverar ett bygg verktyg med mer funktionalitet. Men det funkar inte om du måste ha med `sudo` när du kör docker kommandon. För att slippa köra `sudo` behöver du lägga till din använda i dockers användargrupp. Gör det med:

```
sudo usermod -aG docker <användare>
su - <användare>
```

Nu borde `docker build` med HereDoc i Dockerfile fungera.


En lista över hadolint's möjliga fel hittar du under [rules](https://github.com/hadolint/hadolint#rules), där finns också förslag på lösningar.



The Docker Container Registry {#docker-container-registry}
-----------------------------------------------------------

Så nu när vår Microblog-container fungerar fint skall vi *pusha* den till Docker-registret, så att vi senare kan köra applikationen på vår server.


För att få tillgång till Docker-registret måste du gå till [*https://hub.docker.com*](https://hub.docker.com) och skapa ett konto. Användarnamnet du väljer kommer att användas i alla images som du publicerar, så välj något du gillar.

När det är klart kan du nu logga in via terminalen med kommandot `docker login`:

```bash
$ docker login
```

Vi har en image som heter `microblog:1.0.0-prod` lagrad lokalt på datorn men, för att kunna publicera den här imagen till Docker-registret, behöver vi ändra taggen lite genom att lägga till namnet på vårt konto:

```bash
$ docker tag microblog:1.0.0-prod <your-docker-registry-account>/microblog:1.0.0-prod
```

Om du listar dina images igen med `docker images` kommer vi att se två stycken, en för Microblog (den ursprungliga med `microblog:1.0.0-prod` namnet) och en ny som innehåller ditt kontonamn. Det här är egentligen två alias för samma image.


För att publicera din image i Docker-registret, använd kommandot `docker push`:

```bash
$ docker push <your-docker-registry-account>/microblog:1.0.0-prod
```

Nu är din image offentligt tillgänglig och redo att användas.
