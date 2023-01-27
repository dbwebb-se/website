---
author:
    - aar
revision:
    "2023-01-27": (A, aar) Skrev om koden för nya post-get strukturen.
category:
    - oopython
...
Flask, POST och GET
===================================

[FIGURE src=/image/oopython/kmom02/topimage-art1.png?w=c5 class="right"]

Vi ska titta närmare på hur man kan jobba med POST och GET i Flask. Målet är att vi, med hjälp av ett formulär, en tabell, GET och POST, ska presentera innehåll i vår Flask-applikation. Vi behöver även blanda in session för att spara data mellan requests på studentservern.

<!--more-->  

Intro {#intro}
-------------------------------
När vi hämtar en webbsida används HTTP-metoden GET. Det man skickar med hamnar då synligt i adressfältet, t.ex.: `http://localhost:5000?id=2&car=volvo`.

Vill vi däremot inte att datan, eller informationen vi skickar, ska synas, så kan vi använda metoden POST. POST kan bland annat inte bokmärkas, cachas eller sparas i historiken till skillnad från GET-metoden. POST-data skickas i headern, så den är ej synlig i URL:en (adressfältet).  

[Läs mer om POST och GET](http://www.w3schools.com/tags/ref_httpmethods.asp).

Vi ska gå igenom GET och POST och se hur de kan användas tillsammans med Python och Flask. Vill du hänga med och koda själv redan nu kan du skapa filerna som används i artikeln. Använd terminalen och ställ dig i `get_post`.

```bash
cd get_post
mkdir src static templates static/styles templates/forms templates/tables
touch app.py src/{guess_game.py,guess.py,__init__.py} static/styles/style.css templates/{guess.html,footer.html,header.html,index.html,forms/make_guess.html,tables/show_guesses.html}
```

Ett färdigt exempel finns i [example/flask/get_post_session](https://github.com/dbwebb-se/oopython/tree/master/example/flask/get_post_session).

Förutsättning {#pre}
-------------------------------

Du har läst delen om GET och POST i guiden "[Php på 20 steg](kunskap/kom-i-gang-med-php-pa-20-steg#globals)" eller vet vad det innebär.  
Du har läst artikeln om "[Flask med Jinja2](kunskap/flask-med-jinja2)".  
<!-- Du har läst artikeln om "[Klassrelationer](kunskap/klass-relationer)".   -->



Struktur {#struktur}
-------------------------------

Innan vi kommer igång med koden kan det vara bra att tänka igenom vad det är man vill åstadkomma. Det minskar risken att hamna snett och behöva kasta kod och göra om. Målet är en sida för att spela ett klassiskt gissa en siffra spel. Vi ska visa upp en tabell med gissningar som användaren har gjort och har ett formulär där användaren kan göra nya gissningar. Vi ska strukturera koden med GET och POST requests. Vi har en GET route som visar upp spelet och formuläret skickar data till en POST route som hanterar datan och sen skickar tillbaka användaren till GET routen.

En vattentät plan är på plats så vi börjar kika på koden.



Visa gissningar {#show}
-------------------------------

Vi börjar med att snabbt gå igenom app.py som påminner om hur den såg ut i förra kmom:et. Om Något fortfarande är oklart gå tillbaka och läs "[Flask med Jinja2](kunskap/flask-med-jinja2)".

```python
#!/usr/bin/env python3
import traceback
from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def main():
    """ Main route """
    return render_template("index.html")

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
    app.run(debug=True)
```
Vi kikar lite snabbt på `index.html` också. Kolla i "[Flask med Jinja2](kunskap/flask-med-jinja2)" för innehållet i header.html, footer.html och style.css eller kolla i exempelmappen.

`index.html` ska bara vara en start sida som innehåller en välkomsttext och en knapp som tar oss till en annan route där vi spelar spelet.

```html
{% include 'header.html' %}

<div class="container" role="main">
    <div class="container" style="min-height:20em">
        <div class="jumbotron">
            <h1>Welcome to a guessing game!</h1>
        </div>
        <div class="row marketing">
            <a href="{{ url_for('guess') }}"  class="btn btn-success btn-lg btn-block">Starta spelet!</a>
        </div>
    </div>
</div>

{% include 'footer.html' %}
```

Okej, nu har vi grunden och går vidare med att skapa klasserna för spelet.



### guess.py {#guess-py}

Vi skapar en simple klass för att hålla data om en gissning, värdet spelaren gissade, vilket gissnings försök det var och om det var rätt eller fel.

```python
#!/usr/bin/env python3
"""
Contains a Guess class
"""
class Guess:
    """
    Represents a guess in a guessing game
    """
    def __init__(self, value, attempt, correct=False):
        self.value = value
        self.attempt = attempt
        self.correct = correct

    def __str__(self):
        return f"Guessed {self.value} on attempt {self.attempt}, it was {self.correct}"

```

Den har inte någon direkt funktionalitet utan den är där för att hålla data  strukturerat.
Nästa steg blir att skapa en klass för spellogiken, `GuessGame`.



### guess_game.py {#guess-game-py}

GuessGame klassen ska vara bryggan mellan app.py och Guess objekten. Vi slumpar fram värdet som ska gissas och vi skapar en tom lista som ska fyllas på när användaren gör en gissning.

```python
#!/usr/bin/env python3
"""
Main class for the guessing game
"""
import random
from src.guess import Guess

class GuessGame:
    """
    Holds info for playing a guessing game
    """
    def __init__(self):
        self._correct_value = random.randint(0, 15)
        self.guesses = []
        self.guess_attempts = 0


    def make_guess(self, guess_value):
        """
        Makes a new guess and adds to list
        """
        self.guess_attempts += 1
        if guess_value == self._correct_value:
            self.guesses.append(Guess(guess_value, self.guess_attempts, True))
            return True
        self.guesses.append(Guess(guess_value, self.guess_attempts))
        return False

    def get_correct_value(self):
        """ Return private attribute """
        return self._correct_value

    def get_if_guessed_correct(self):
        """ return if last guess was correct or not """
        return self.guesses[-1].correct if self.guesses else False

```

Nu har vi två klasser som vi kan skapa objekt av för att spara data och jobba med den. Innan vi bygger ihop det i app.py skapar vi html koden för att visa upp gjorda gissningar.



### templates/tables {#templates-tables}

Vi ska utnyttja Jinja2's funktionalitet för att hantera mallar och skapa mallar, *templates*, för tabellen och formuläret. Som du såg i början av artikeln så har vi mapparna templates/forms och templates/tables.

Vi hoppar in i mappen templates/tables/ och tittar på `show_guesses.html`.

Vi skapar en tabell och använder Jinja för att skapa en loop och lägga till varje employee i tabellen.
Magin händer i `<tbody>`, vi använder en [for-loop](http://jinja.pocoo.org/docs/2.10/templates/#for) med hjälp av Jinja för att gå igenom en lista med Employee objekt och lägger till dem i tabellen, en rad/objekt. Detta betyder att vi i app.py måste skicka med en lista med Employee objekt till `render_template()` metoden.

```html
<table class="table">
    <thead>
        <tr>
            <th>Value</th>
            <th>Attempt</th>
        </tr>
    </thead>
<tbody>
    {% for guess in game.guesses %}
    <tr>
        <td>{{ guess.value }}</td>
        <td>{{ guess.attempt }}</td>
    </tr>
    {% endfor %}
</tbody>
</table>
```

Vi passar även på att fylla i `guess.html`

```html
{% include 'header.html' %}

<div class="container" role="main">
    <div class="container" style="min-height:20em">
        <div class="row marketing">
            {% include 'tables/show_guesses.html' %}
        </div>
    </div>
</div>

{% include 'footer.html' %}
```

När vi kallar på `{% include ... %}` letar Jinja2 automatiskt i mappen templates/. Vi kan på detta sättet separera koden och inkludera formulär, tabeller och övrig html-kod. För att få en snygg layout använder vi Bootstrap's färdiga klasser. Klassen `row` gör sitt bästa för att innehållet ska hamna på en rad.

Vi uppdaterar `app.py` för att skapa lite objekt och en route som visar `guess.html` så vi kan testa att det vi har än så länge fungerar.

```python
# app.py
...
from src.guess_game import GuessGame

app = Flask(__name__)
game = GuessGame()
game.make_guess(1)
game.make_guess(4)
game.make_guess(11)
game.make_guess(9)

@app.route("/")
def main():
    """ Main route """
    return render_template("index.html")

@app.route("/guess", methods=["GET"])
def guess():
    """Main view for game"""
    return render_template("guess.html", game=game)
...
```

Kolla att det fungerar, starta servern och gå till `http://localhost:5000` i webbläsaren.

[FIGURE src=/image/oopython/kmom03/get_post_session_index.png caption="Visa startsida."]
[FIGURE src=/image/oopython/kmom03/get_post_session_guess_table.png caption="Visa alla gissningar."]



Göra gissningar på webbsidan {#add}
-------------------------------

Nästa steg är att kunna göra gissningarna på webbsidan och inte ha dem hårdkodade. Vi gör det med ett formulär som skickar ett POST request. Börja med att lägga skapa formuläret.

### templates/forms {#templates-forms}

Mallen för formuläret, templates/forms/make_guess.html, ser ut på följande sätt:

```html
<form role="form" method="POST" action="{{ url_for('check_guess') }}">
    <div class="form-group">
        <label for="value">Gissa på ett värde mellan 1 och 15: </label>
        <input type="text" name="value" class="form-control" />
    </div>
    <button type="submit" class="btn btn-default">Gissa</button>
</form>
```

Bootstrap gör att vi får lite mer rader än vad som egentligen behövs. De viktiga raderna är:

```html
<form role="form" method="POST" action="{{ url_for('check_guess') }}">
...
        <input type="text" name="value" class="form-control" />
...
    <button type="submit" class="btn btn-default">Gissa till</button>
```

Vi sätter metoden till POST och action till sökvägen för `check_guess`, en POST route som vi behöver skapa. Attributet `name` innehåller nyckeln vi når formulärets data med i Pythonkoden.

Vi lägger till formuläret i `guess.html`, tillsammans med en if-sats som kollar om vi har gissar rätt och vunnit spelet.

```html
...
    <div class="container" style="min-height:20em">
        <div class="row marketing">
        {% include 'tables/show_guesses.html' %}
        {% if game.get_if_guessed_correct() %}
            <h2>Congratulations you guessed correctly: {{ game.get_correct_value() }}</h2>
        {% else %}
            {% include 'forms/make_guess.html' %}
        {% endif %}
        </div>
    </div>
...
```

Vi visar bara formuläret om användaren inte har gissat rätt än så länge. Om användaren har gissat rätt visar vi en vinsttext istället.

### app.py {#app-py}

Vi behöver modulen `request` från Flask för att hämta formulär data i en route och funktionen `redirect` för att kunna skicka om ett request till en annan route:

```python
...
from flask import Flask, render_template, request, redirect, url_for
app = Flask(__name__)

game = GuessGame()

```

Ta också bort de hårdkodade gissningarna, de behövs inte nu när vi kan göra egna.

Nu återstår att hantera det inskickade formuläret. Det gör vi i routen för `check_guess`. Denna nya routen är bara till för att hantera datan i formuläret. Den kommer inte skicka tillbaka en html vy utan kommer istället skicka tillbaka användaren till `guess` vyn. Användaren kommer inte uppfatta att vi först skickar formuläret till `check-guess`, det går så snabbt att för användaren ser det ut som att vi skickade direkt till `guess` routen.

```python
@app.route("/check-guess", methods=["POST"])
def check_guess():
    """Make a new guess with users form value"""
    game.make_guess(int(request.form.get("value")))
    return redirect(url_for('guess'))
```

`methods=["POST"]` talar om att det bara går att komma hit med ett POST request, om man inte har med det kan man bara ta sig till den routen med GET requests. Med modulen `request` kan vi komma åt formuläret som skickats och det behöver vi ta hand om. `request.form` är en typ av [dictionary](https://flask.palletsprojects.com/en/2.2.x/api/#flask.Request.form) och ni kan läsa lite mer om det i Flask's [Quickstart guide](https://flask.palletsprojects.com/en/2.2.x/quickstart/#the-request-object).
¨

Om ni startar upp servern borde ni kunna gå spela spelet och vinna om ni gissar korrekt. Nedanför kan ni se hur det ser ut för mig och jag hade tur och gissade rätt på andra försöket.

[FIGURE src=/image/oopython/kmom03/get_post_session_form.png caption="Visa formulär."]
[FIGURE src=/image/oopython/kmom03/get_post_session_win.png caption="Visa vinst."]




Flask i produktion {#produktion}
-------------------------------

Det vi har gjort än så länge fungerar bra lokalt men om vi publicerar sidan till studentservern och försöker spela spelet kommer det inte fungera. Lägg till en [app.cgi](coachen/flask-som-cgi-script#flaskcgi) file och publisera det till studentservern och testa spela.

När vi kör sidan lokalt med Flasks inbyggda server är vårt program i `app.py` igång hela tiden och vi använder ram minnet för att komma ihåg alla gissningar vi gör i formuläret vid varje request. Men vi använder inte Flask's inbyggda server när vi kör det på studentservern. På studentservern kör vi istället en Apache webbserver som inte fungerar med Flask naturligt. Detta är varför vi behöver `app.cgi` filen, den gör att Apache startar vårt app.py program varje gång någon gör ett request. I och med detta stängs vårt program av när ett request är färdigt och när vi får ett nytt request, och programmet startas igen, har programmet inget minne av vad vi gjort tidigare. Vid varje request, när vi byter från index.html till guess.html eller när vi submit:ar ett formulär, utgår vi bara från det som finns hårdkodat i koden. I bilden nedanför är "Gateway program" app.py och "Web server" Apache på studentservern.

[FIGURE src=/image/oopython/kmom02/cgi.png caption="Hur CGI fungerar på en webbserver."]

Vi behöver ett externt minne som vårt program kan använda för att spara data mellan requests. Om vi hade skapat en större applikation där vi vill ha persistent data hade vi implementerat en databas. Vi ska använda [session](https://flask.palletsprojects.com/en/2.2.x/api/?highlight=session#sessions). Ett annat alternativ är att skriva datan till fil, det finns ett exempel på det i [example/flask/read_write](https://github.com/dbwebb-se/oopython/tree/master/example/flask/read_write).


### Session {#session}

Session är ett sätt att spara data mellan requests. Data vi spara i en session skickas med varje gång servern skickar tillbaka och tar emot ett request. Den data kan vi då hämta och ändra på när vi behandlar ett requst på server.

Session är i princip en vanlig dictionary vilket betyder att om vi vill spara data behöver datan vara av datatypen Dict. All data som är dynamisk, inte hårdkodad kommer vi nu behöva spara i session varje gång ändrar/skapar data. Varje gång vi vill läsa data behöver vi först hämta den från session. För att allt detta ska gå smidigare behöver vi uppdatera koden i våra klasser och `app.py`. I klasserna behöver vi ändra koden så det går att skapa nya objekt med gammal data och att göra om objekten till data i format som går att spara i session.

För att skapa en unik session till vår applikation och använda den behöver vi skapa en hemlig nyckel som bara vi ska veta om, där av namnet hemlig. I app.py skapar vi en hemlig nyckel baserat på pathen till filen.

Vi börjar med att fixa imports och starta en session i `app.py`.

```python
#!/usr/bin/env python3
"""
Main applikation for website
"""
import os
import re
from src.guess_game import GuessGame
from flask import Flask, render_template, request, redirect, url_for, session

app = Flask(__name__)
app.secret_key = re.sub(r"[^a-z\d]", "", os.path.realpath(__file__))

@app.route("/")
def main():
    """ Main route """
    return render_template("index.html")
...
```

Notera att jag tog bort `game = GuessGame`. I och med att vår app startar om varje gång vi gör ett request till sidan, om vi skapar ett GuessGame där, då kommer det skapas om varje gång vi t.ex. skickar en nytt formulär. Det vill vi inte. Istället behöver vi skapa GuessGame med data från session. För att detta ska gå smidigare lägger vi till en ny route som heter `init`. Den ska vi använda för att skapa ett GuessGame objekt och initiera data i session.

```python
...
@app.route("/")
def main():
    """ Main route """
    return render_template("index.html")



@app.route("/init", methods=["GET"])
def init():
    """ Intialize values needed in session """
    game = GuessGame()
    session["correct"] = game.get_correct_value()
    session["guesses"] = game.to_list()
    return redirect(url_for('guess'))

...
```

Vi skapar objektet och då slumpas det rätta värdet fram. Sen lägger vi det i sessionen, annars har vi inget sätt att komma ihåg vilket som är det rätta värdet. Vi lägger också till `guesses` i session, den ska innehålla en lista med alla gissningar som vi har gjort. Än så länge i koden kommer vi inte ha gjort några gissningar så där blir bara en tom lista. Men det underlättar om vi sätter den även om den är tom. Vi behöver skapa metoden `to_list()`. Sen gör vi redirect till `guess` routen. Tanken är att `init` ska funka som ett mellansteg mellan att man klickar på `start` knappen på `index.html` och att man börjar spela spelet.

Vi ändra var startknappen skickar användaren, i `index.html`.

```html
...
        <div class="row marketing">
            <a href="{{ url_for('init') }}"  class="btn btn-success btn-lg btn-block">Starta spelet!</a>
        </div>
...
```

### GuessGame {#guess-game}

Nu kan vi skapa metoden `to_list()` i `GuessGame`. `to_list()` är vår metod för att göra om gissningar till ett format som går att spara i session. Session klara typ bara av datatyperna lista, sträng, heltal, bool, decimaltal, tuple och dictionary. Våra gissningar har datatypen Guess. Därför måste vi göra om Guess objekten några av datatyperna som stödjs. Denna processen kallas att [serialisera data](https://sv.wikipedia.org/wiki/Serialisering). Serialisering är processen att formatera data/objekt till ett format som kan sparas och sedan deserialiseras för att återskapa det tidigare objektet/datan.

```python
...
    def to_list(self):
        """ Turn old guesses to a list """
        # new_list = []
        # for g in self.guesses:
        #     new_list.append((g.value, g.attempt, g.correct))
        # return new_list
        return [(g.value, g.attempt, g.correct) for g in self.guesses] # denna raden gör samma sak som de fyra raderna ovanför.
```

Vi plockar ut alla attribut i Guess objekten, lägger i en tuple i en lista. Med min spelomgång ovanför där jag gissade rätt hade gett listan `[(2, 1, False), (1, 2, True)]`. 

Nu behöver vi uppdatera konstruktorn så vi kan återskapa spelet från data i session men samtidigt stödja att man skapar ett helt nytt spel. Det gör vi genom att sätta default värden på parametrar.

```python
...
    def __init__(self, correct_value=None, guesses=None):
        if correct_value is not None:
            self._correct_value = correct_value
        else:
            self._correct_value = random.randint(0, 15)

        self.guesses = []
        if guesses:
            for value, attempt, is_correct in guesses:
                self.guesses.append(Guess(value, attempt, is_correct))
        # self.guesses = [Guess(v, a, c) for v, a, c in guesses] if guesses is not None else [] # denna raden gör samma sak som de fyra raderna ovanför
        self.guess_attempts = len(self.guesses)
...
```

Om argument skickas in använder vi dem, det görs när vi redan har startat ett spel och vi använder data från session, annars skapar vi upp ett nytt spel genom att slumpa nytt tal och en tom lista för gissningar.

Nu återgår vi till app.py och gör klart det sista.

### Mer session i app.py {#mer-session}

I och med att vi har allt minne i session behöver vi alltid skapa ett `GuessGame` objekt i `guess` routen med data från session.

```python
# app.py
...
@app.route("/guess", methods=["GET"])
def guess():
    """Main view for game"""
    game = GuessGame(session["correct"], session["guesses"])
    return render_template("guess.html", game=game)
...
```

Varje gång vi vill se spel vyn behöver vi hämta data från session och återskapa spelet sen skicka in objektet till `render_template`.

Vi behöver också uppdatera `check-guess` routen så att den lägger till den uppdaterade datan i session.

```python
# app.py
...
@app.route("/check-guess", methods=["POST"])
def check_guess():
    """Make a new guess with users form value"""
    game = GuessGame(session["correct"], session["guesses"])
    guess = int(request.form.get("value"))
    game.make_guess(guess)
    session["guesses"] = game.to_list()
    return redirect(url_for('guess'))
...
```

Vi återskapar GuessGame från session, hämtar ut den nya gissningen från formuläret, gör gissningen, uppdaterar session data och skickar tillbaka användaren till `guess` route.

Nu ska ni ha ett fungerade spel både lokalt och på studentservern. Testa kör det lokalt, publisera det sen och testa på studentservern också.

### Återställ session {#reset}

Vi har en liten sak kvar, vi har inget sätt att tömma session om vi vill glömma allt vi har lagt till. Det behövs ofta när man utvecklar koden och man råkar göra ett fel. Det löser vi genom att lägga till en route där vi bara tömmer session och redirect:ar till index.html.

```python
# app.py
...
@app.route("/reset")
def reset():
    """ Route for reset session """
    _ = [session.pop(key) for key in list(session.keys())]

    return redirect(url_for('main'))
...
```

Nu kan ni lägga till /reset i slutet av url:en för att tömma session, om man vill kan man även lägga till en länk i header.html som går dit.

```
# header.html
...
    <li {%- if request.path == "/reset" %} class="active" {% endif %}><a href="{{ url_for('reset') }}">Reset</a></li>
...
```


Avslutningsvis {#avslutning}
------------------------------

Nu har vi kommit fram till slutet, det blev mycket information. Vi har lärt oss POST/GET, for-loop i template, CGI, session och Serialisering bland annat.
