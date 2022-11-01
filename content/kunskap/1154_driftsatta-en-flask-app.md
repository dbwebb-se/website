---
author: aar
category: devops
revision:
  "2019-06-24": (A, aar) Första utgåvan inför kursen devops.
...
Driftsätta en Flask app
==================================

[FIGURE src=image/devops/flask-production-setup.png?w=c10 class="right"]

Vi ska i denna övning lära oss hur man driftsätter en Flask app i produktion, vi ska använda Nginx, Gunicorn och Supervisor.

<!--more-->

Du behöver ha en server och gjort [10 första minuterna på en server](https://dbwebb.se/kunskap/github-education-pack-och-en-server-pa-digital-ocean#first10) innan du jobbar igenom denna artikeln.

## Hur allt hänger ihop {#fit-together}


Appen vi ska driftsätta använder sig av micro ramverket [Flask](http://flask.pocoo.org/) för att bygga logiken i applikationen. Det finns en inbyggd server som används vid utveckling, men den ska inte användas i produktion. Flask är byggt på [WSGI](http://wsgi.tutorial.codepoint.net/) och vi ska använda [Gunicorn](https://gunicorn.org/) som exekverings miljö för Flask appen. Gunicorn är en WSGI HTTP server, den tar emot http requests och skickar vidare dem till wsgi applikationer, vår Flask app i det här fallet. Sen använder vi Nginx som [reverse proxy](https://en.wikipedia.org/wiki/Reverse_proxy), det gör vi bland annat för att med Nginx kan vi skilja på request för statiska filer och request till vår applikation, men även för att få [HTTPS](https://en.wikipedia.org/wiki/HTTPS) och load balancing. Vår stack består av tre verktyg, Flask för att bygga vår logik, Gunicorn som wsgi server för att göra om http requests till Python och Ngingx som reverse proxy för att skydda wsgi servern. Sen har vi [Supervisor](http://supervisord.org/) för att kontrollera Gunicorn processen, om gunicorn stängs av ska supervisor starta den igen.

[FIGURE src=image/devops/flask-production-setup.png caption="Web stack för en Flask applikation."]

Det finns flera alternativ till Gunicorn, [appdynamics](https://www.appdynamics.com/blog/engineering/a-performance-analysis-of-python-wsgi-servers-part-2/) har gjort en bra jämförelse mellan flera. Det två vanligaste wsgi servrarna är Gunicorn och uWSGI, jag har valt Gunicorn för att det är enklare och väldigt stabilt. Om man vill fokusera på prestanda finns det bättre alternativ men de behöver oftast mer konfiguration för att fungera  .



## Installera grund beroenden {#base-dependencies}

Jag gör installationen på en VM som kör Debian 10 och Python 3.7.

Installera Python, Supervisor och MySQL. I produktion kör vi MySQL som databas istället för SQLite.

```bash
apt-get install python3-venv python3-dev supervisor git default-mysql-server make
```

Om du har gjort 10 första minuterna på en servern övningen har du redan nginx och git installerat, om du inte gjort det installera dem också.



## Installera appen {#install-app}

Hämta git repot och checka ut senaste versionen. Optimalt sätt vill vi inte behöva hämta hela repot utan bara själva applikationen, men vår miljö är inte redo för det än.

```bash
git clone https://github.com/dbwebb-se/microblog.git
cd microblog

# checkout latest tag
git fetch --tags
latestTag=$(git describe --tags `git rev-list --tags --max-count=1`)
git checkout $latestTag

python3 -m venv venv
. venv/bin/activate
pip install -r requirements.txt
```

Kolla i `requirements.txt` för att se vilka moduler som installeras. Sen är dags att konfigurera och starta upp applikationen. Vi ska skapa en `.env` fil för att hålla environment variabler. Men först ska vi skapa en slumpad sträng som SECRET_KEY åt Flask.

```bash
python3 -c "import uuid; print(uuid.uuid4().hex)"
1b45b32d4b724e67ad0758cec2d2ed34 # Din sträng kommer inte vara samma som denna
```

Skapa sen .env filen i repo katalogen.

```bash
# .env
SECRET_KEY=1b45b32d4b724e67ad0758cec2d2ed34
DATABASE_URL=mysql+pymysql://microblog:<passwd>@localhost:3306/microblog
```

Byt ut `<passwd>` mot ett lösenord som du vill ha till databasen. Vi konfigurerar databasen i nästa steg. Vi behöver också sätta environment variabeln ["FLASK_APP"](http://flask.pocoo.org/docs/1.0/cli/#application-discovery), men det kan vi inte göra i `.env` filen då FLASK_APP används för att starta appen och `.env` läses in av appen efter den är startad. FLASK_APP ska innehålla namnet på filen som startar applikationen.

```bash
echo "export FLASK_APP=microblog.py" >> ~/.profile
source ~/.profile
```

Du kan kolla att det fungerar genom att skriva `flask --help` och om `db` finns med som ett kommando är applikationen hittad av flask.



## Konfigurera databas {#config_db}

[INFO]
Mysql's loggfiler:

- `/var/log/mysql.err` – MySQL Error log file
- `/var/log/mysql.log` – MySQL log file
[/INFO]

Då var det dags att sätta upp databasen.

Kör följande kommando för att börja konfigurera:

```bash
mysql -u root -p
```

Om du inte behövde skriva in något lösenord när du installerade MySQL är det bara att klicka enter när kommandot frågar efter lösenord. Du kan behöva köra kommandot med `sudo`. Skapa en databas som heter `microblog` och en ny användare som har full tillgång till databasen.

```bash
mysql> create database microblog character set utf8 collate utf8_bin;
mysql> create user 'microblog'@'localhost' identified by '<passwd>';
mysql> grant all privileges on microblog.* to 'microblog'@'localhost';
mysql> flush privileges;
mysql> quit;
```

Byt ut `<passwd>` mot lösenordet du skrev i `.env` filen. Om databasen har blivit korrekt konfigurerad kan vi nu skriva `flask db upgrade` så skapas alla tabeller som behövs. Jag fick följande utskrift och inga felmeddelanden vilket betyder att allt gick bra:

```bash
INFO  [alembic.runtime.migration] Context impl MySQLImpl.
INFO  [alembic.runtime.migration] Will assume non-transactional DDL.
INFO  [alembic.runtime.migration] Running upgrade  -> a4355cc070ca, Initial version
```

Testa även `flask run` för att se att applikationen startar utan fel. Stäng ner den igen så ska vi gå vidare med att sätta upp Gunicorn och supervisor.



## Konfigurera Gunicorn och Supervisor {#gunicorn_supervisor}

Vår app är nu redo att startas i [Gunicorn](https://gunicorn.org/), notera att `venv` fortfarande behöver vara aktiverat för att det ska fungera, då vi installerade Gunicorn i venv.

Testa starta en Gunicorn server med:
```bash
gunicorn -b 0.0.0.0:8000 -w 4 microblog:app

Starting gunicorn 19.9.0
Listening at: http://0.0.0.0:8000 (4880)
Using worker: sync
Booting worker with pid: 4883
Booting worker with pid: 4884
Booting worker with pid: 4885
Booting worker with pid: 4886
```

`-b` gör att servern lyssnar på port 8000 på alla nätverk.

`-w` konfigurerar hur många processer som ska köras, 2-4 per antalet kärnor på servern är rekommenderat.

`microblog:app` säger hur appen ska startas. Namnet före kolon är vilken modul/fil som innehåller appen och namnet efter kolon är namnet på appen.

Om du vill testa att det fungerar som det ska kan du göra det. Öppna upp port 8000, `ufw allow 8000`, och i Azure. Gå sen till `<server-ip>:8000` i din webbläsare. Då ska du komma till logga in sidan. Glöm inte att stänga porten när du är klar, `ufw deny 8000`.

Nu startade vi servern i terminalen och den är låst så länge Gunicorn körs. Detta är inte önskvärt i produktion, istället ska vi köra och övervaka den med supervisor i bakgrunden. På detta sättet startas servern igen om den kraschar eller om servern startar om.

Skapa en config fil i `/etc/supervisor/conf.d/`, jag döper min till `microblog.conf`.

```bash
# /etc/supervisor/conf.d/microblog.conf
[program:microblog]
command=/home/deploy/microblog/venv/bin/gunicorn -b localhost:8000 -w 4 --access-logfile /var/log/microblog/gunicorn-access.log --error-logfile /var/log/microblog/gunicorn-error.log microblog:app
directory=/home/deploy/microblog
user=deploy
autostart=true
autorestart=true
stopasgroup=true
killasgroup=true
```

Notera att jag bytte från `0.0.0.0` till `localhost` i gunicorn kommandot. Nu vill vi bara att servern ska ta emot request lokalt från nginx. 

`command`, `directory` och `user` berättar hur appen ska köras.

`autostart` och `autorestart` gör att appen automatiskt startas och startas om vi uppstart eller krasch. 

`stopasgroup` och `killasgroup` försäkrar oss att alla underprocesser stängs av när appen ska startas om. 

Du hittar de olika inställningarna på [Supervisors webbsida](http://supervisord.org/configuration.html#program-x-section-settings).

Vi behöver skapa mappen `/var/log/microblog` för loggarna.

```bash
sudo mkdir /var/log/microblog
sudo chmod -R 777 /var/log/microblog
```

När konfig filen är på plats laddar vi om supervicor.

```
sudo supervisorctl reload
```

Om det fungerar borde du få liknande utskrift som nedanför om du kör `sudo supervisorctl status`:

```bash
microblog            RUNNING   pid 8837, uptime 0:00:04
```

Du kan även testa `wget localhost:8000` och kolla att du får korrekt index.html fil. Om du får något fel, kolla i loggfilerna som står nedanför.

[INFO]
Gunicorn loggfiler:
- `/var/log/microblog/`


Supervisor loggfiler:
- `/var/log/supervisor/`
[/INFO]



## Konfigurera Nginx {#conf_nginx}

[INFO]
Nginx loggfiler:
- `/var/log/nginx/`
[/INFO]
Nu ska vi sätta upp och exponera nginx publikt så det kan skicka vidare request till Gunicorn. Nginx ska lyssna både på port 80 och 443, men all trafik från 80 ska skickas vidare till 443. Vi behöver lägga till konfiguration för port 80 och sen använder vi [certbot](https://certbot.eff.org/) för att automatiskt lägga till konfiguration för port 443.

Skapa en fil i `/etc/nginx/sites-available/`, jag döper min till `microblog.se`, du kan döpa den till ditt domän namn eller annat passande. Vi lägger kod för att skicka vidare requests till 443/https.

```bash
server {
    listen 80;
    server_name microblog.se
                www.microblog.se
                ;
    location ~ /.well-known {
        root /home/deploy/.well-known;
    }
    location / {
        return 301 https://$host$request_uri;
    }
}
```

Byt ut `microblog.se` mot din domän och kolla att mappen till `.well-known` finns, du kan ändra den om du vill. Certbot sparar filer i `.well-known` som används när en klient ska kolla att server tillhör den domän som den säger. Gå till katalogen `/etc/nginx/sites-enabled` för att skapa en symbolisk länk till konfigurationsfilen.

```bash
cd /etc/nginx/sites-enabled
sudo ln -s /etc/nginx/sites-available/microblog.se
```

Kolla sen att filen är korrekt skriven och starta om nginx.

```bash
sudo nginx -t
sudo service nginx restart
```



### HTTPS {#https}

Följ avsnittet om HTTPS i [Nodejs API med express](https://dbwebb.se/kunskap/nodejs-api-med-express#https) för att konfigurera HTTPS. Det kommer lägga till saker och ändra i vår nginx konfig fil. När certbot frågar om ni vill skicka vidare alla request till HTTPS säg ja.

Nu är vi nästan klara vi behöver bara lägga till vidarebefordringen till Gunicorn servern och statiska filer.

Öppna `/etc/nginx/sites-available/microblog.se` och ändra så `location /` skickar vidare till Gunicorn:

```bash
location / {
    #return 301 https://$host$request_uri;
    # forward application requests to the gunicorn server
    proxy_pass http://localhost:8000;
    proxy_redirect off;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
}
```
 och lägg till vart statiska filer finns. Vi lägger till en egen route för det så att Flask appen slipper hantera statiska request utan kan fokusera på det dynamiska:

 ```bash
 location /static {
    # handle static files directly, without forwarding to the application
    alias /home/deploy/microblog/app/static;
    expires 30d;
}
```

Avsluta med att kontrollera filen och starta om nginx.

```bash
sudo nginx -t
sudo service nginx restart
```

Nu borde du kunna gå till din domän i webbläsaren och se startsidan för appen.

[FIGURE src=/img/devops/microblog-login.png caption="Startsidan på microbloggen."]



## Driftsätta uppdateringar {#uppdatera}

Vi vill så klart kunna uppdatera koden och köra det på servern. Stegen för det är att ladda ner nyaste koden med git, stoppa gunicorn, uppgradera databasen (om den är ändrad) med flask och sist starta gunicorn igen. Glöm inte att aktivera `venv`.

```bash
(venv) sudo supervisorctl stop microblog     # stop the current server
(venv) git pull                              # download the new version
(venv) flask db upgrade                      # upgrade the database
(venv) sudo supervisorctl start microblog    # start a new server
```



Avslutningsvis {#avslutning}
--------------------------------------

Det är många olika saker att ta in i denna artikeln, ni har fått känna på hur det är att jobba med driftsättning av en applikation ni inte skapat själva och sett olika delar som kan ingå. Under kursens gång ska vi jobba oss ifrån att göra saker manuellt till att det antingen sker automatisk eller i alla fall finns i ett skript.

Du kan hitta bash skript för hela artikeln i repot under `scripts/`.

Artikeln baseras mycket på [The Flask mega tutorial](https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-xvii-deployment-on-linux).
