---
author: mos
category:
    - python
    - flask
    - kurs oopython
revision:
    "2023-01-23": (D, aar) La till info rutan om LF radslut
    "2020-01-17": (C, aar) Lade till videos som visar hur vi använder det på studentserver och förklarar CGI.
    "2017-11-01": (B, mos) Lade till felhantering och indelat i stycken samt kort note om hur lägga till CGI i Apache.
    "2017-01-06": (A, mos) Första versionen.
...
Flask som CGI-skript
==================================

När man sätter en Flask-applikation i drift tillsammans med en webbserver finns det flera alternativ. Ett av de enklaste är att använda CGI för att köra din Flaskapplikation. För att köra Flask **på studentservern** behöver vi ett CGI-skript.

På studentservern kan du köra CGI-skript på detta sättet. Så här gör du för att koppla ett CGI-skript till din Flaskapplikation.

<!--more-->



En Flask-applikation {#flask}
-----------------------------------

Du har en Flask-applikation som är sparad i `app.py`. Den kan se ut så här, enklast möjliga inklusive två användbara felhanterare som gör felsökningen lättare.

```python
#!/usr/bin/env python3
# -*- coding: UTF-8 -*-

"""
Minimal Flask application, including useful error handlers.
"""
import traceback
from flask import Flask

app = Flask(__name__)


@app.route("/")
def home():
    """ Home route """
    return("<h1>Hello World of Flask</h1><p>Rockn Roll...")


@app.errorhandler(404)
def page_not_found(e):
    """
    Handler for page not found 404
    """
    #pylint: disable=unused-argument
    return "Flask 404 here, but not the page you requested."


@app.errorhandler(500)
def internal_server_error(e):
    """
    Handler for internal server error 500
    """
    #pylint: disable=unused-argument
    return "<p>Flask 500<pre>" + traceback.format_exc()


if __name__ == "__main__":
    app.run()
```

Du kan spara ovan kod i en fil `app.py` och sedan köra den via `python3 app.py` för att kontrollera att det fungerar.

Det är en bra sak att alltid testköra Flask-applikaitonen och `app.py` för sig. Då kan man lösa eventuella felaktighetern innan man blandar in webbservern och CGI.



Flask som CGI {#flaskcgi}
-----------------------------------

Du kan nu lägga till en fil `app.cgi` som via webbservern Apache kan köra din Flaskapplikation.

Skriptet `app.cgi` kan se ut så här.

```python
#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# pylint: disable=import-outside-toplevel

"""
A CGI-script for python, including error handling.
"""

try:
    from wsgiref.handlers import CGIHandler
    from app import app

    CGIHandler().run(app)

except Exception as e:
    import traceback

    print("Content-Type: text/plain;charset=utf-8")
    print("")
    print(traceback.format_exc())
```

Skapa skriptet och lägg båda filerna i en katalog som är tillgänglig via en webbserver som har konfigurerat att CGI fungerar och Flask finns installerat.

[INFO]
Notera att `app.cgi` behöver ha radslutstypen **LF**. Om filen har **CRLF** får man "Internal server error" på studentservern.
[/INFO]

[YOUTUBE src=fYfa3jhvf_0 width=700 caption="Använd CGI för att köra Flask app på studentservern"]

Öppna din webbläsare mot skriptet för att testa det, se till att lägga till **en avslutande `/`** så länken avslutas med `app.cgi/`, annars blir det 404.

Hela anropet är samlat under exceptionhantering för att visa tydliga felmeddelanden om något går snett. Om du kör detta i produktionsmiljö så vill du troligen inte vara så tydlig i att visa felmeddelanden.

[YOUTUBE src=I--WjW7y_Fw width=700 caption="Hur fungerar cgi?"]


Testkör studentservern {#stud}
-----------------------------------

Du kan testköra skripten lokalt i din egen webbserver och du kan lägga filerna i ditt kursrepo och göra `dbwebb publish` för att publisera på studentservern och testköra där.

Får du problem på studentservern så kan du alltid logga in där och testköra `python3 app.py` separat och `python3 app.cgi` separat för att se eventuella felmeddelanden. Det kan hjälpa dig att felsöka och avgränsa var ett eventuellt fel ligger.



Testkör och se källkod {#testa}
-----------------------------------

Du kan testköra skriptet på följande platser. Glöm inte en avslutande `/`.

* [dbwebb.se](repo/oopython/example/flask/cgi-minimal/app.cgi/)
* [www.student.bth.se](http://www.student.bth.se/~mosstud/kurser/oopython/example/flask/cgi-minimal/app.cgi/)

Du kan se [källkoden till exemplet i kursrepot för oopython](https://github.com/dbwebb-se/oopython/tree/master/example/flask/cgi-minimal).



Lägg till CGI i Apache webbserver {#apache}
-----------------------------------

Här är en kort-kort generell variant av hur du sätter upp CGI på din egna Apache webbserver. Detta behövs inte för att köra på studentservern.

Om du inte har konfigurerat din Apache webbserver för att köra CGI skript så är följande de steg som behövs utföras (på en Linux-maskin).

Lägg till så att modulen för CGI är aktiv.

```text
sudo a2enmod cgi
```

Sedan behöver du aktivera CGI i din Apache konfigurationsfil, inom ett `<directory>` direktiv.

```text
Options +ExecCGI
AddHandler cgi-script .cgi
```

Sedan kan du starta om Apache och testköra.

```text
sudo service apache2 restart
```



Avslutningsvis {#avslutning}
-----------------------------------

I forumet finns ett par trådar som är relevanta att kika i, du hittar dem i [Python FAQ](t/2880) under rubriken "Flask och CGI".
