---
author: 
    - aar
    - lew
revision:
    "2018-12-12": (C, aar) La till session.
    "2018-11-26": (B, aar) Skrev om handler koden till en klass.
    "2017-12-01": (A, lew) First version for v2.
category:
    - oopython
...
Flask, POST och GET
===================================

[FIGURE src=/image/oopython/kmom02/topimage-art1.png?w=c5 class="right"]

Vi ska titta närmare på hur man kan jobba med POST och GET i Flask. Målet är att vi ska med hjälp av ett formulär, en tabell, GET och POST, presentera innehåll i vår Flask-applikation. Vi behöver även blanda in Session för att spara data mellan requests på studentservern.

<!--more-->  

Intro {#intro}
-------------------------------
När vi hämtar en webbsida används HTTP-metoden GET. Det man skickar hamnar då synligt i adressfältet, t.ex.: `http://localhost:5000?id=2&car=volvo`.

Vill vi däremot inte att datan, eller informationen vi skickar, ska synas, så kan vi använda metoden POST. POST kan bland annat inte bokmärkas, cachas eller sparas i historiken till skillnad från GET-metoden. POST-data skickas i headern, så den är ej synlig i URL:en.  

[Läs mer om POST och GET](http://www.w3schools.com/tags/ref_httpmethods.asp).

Vi ska som sagt gå igenom båda två och se hur de kan användas tillsammans med Python och Flask. Vill du hänga med och koda själv redan nu kan du skapa filerna som används i artikeln:

[FIGURE src=/image/oopython/kmom02/tree_flask2.png]

```bash
mkdir static templates static/styles templates/forms templates/tables
touch app.py employee.py handler.py static/styles/style.css templates/{about.html,company.html,footer.html,header.html,index.html,forms/add_employee.html,tables/show_employees.html
```

Ett frädigt exempel finns i [example/flask/session](https://github.com/dbwebb-se/oopython/tree/master/example/flask/session).

Förutsättning {#pre}
-------------------------------

Du har läst delen om GET och POST i guiden "[Php på 20 steg](kunskap/kom-i-gang-med-php-pa-20-steg#globals)" eller vet vad det innebär.  
Du har läst artikeln om "[Flask med Jinja2](kunskap/flask-med-jinja2)".  
<!-- Du har läst artikeln om "[Klassrelationer](kunskap/klass-relationer)".   -->



Struktur {#struktur}
-------------------------------

Innan vi kommer igång med koden kan det vara bra att tänka igenom vad det är man vill åstadkomma. Det minskar risken att hamna snett och behöva kasta kod och göra om. Målet är en sida som kan lägga till en person, en *employee*, i en lista, som i sin tur visas upp i en tabell. Tabellen ska uppdateras automatiskt och vi blandar inte in någon databas, utan vi lämnar koden med några personer hårdkodade. Till detta skapar vi en klass, `Employee`. Vi ska hantera GET och POST i routen och agera korrekt beroende på hur vi skickar en request till routen. När vi klickar på länken i navbaren görs ett GET-request och när vi postar formuläret kan vi använda POST. Vi kan med fördel i detta fallet använda samma route, kallad "company" i artikeln. Vi vill även undvika lösa funktioner i app.py så vi skapar en klass, *Handler*, som får sköta mappningen mellan app.py och Employee objekten.

En vattentät plan är på plats så vi börjar kika på koden.



Visa anställda {#show}
-------------------------------

Vi börjar med att snabbt gå igenom app.py som påminner om hur den såg ut i förra kmom:et. Om Något fortfarande är oklart gå tillbaka och läs "[Flask med Jinja2](kunskap/flask-med-jinja2)".

```python
#!/usr/bin/env python3
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
    import traceback
    return "<p>Flask 500<pre>" + traceback.format_exc()

if __name__ == "__main__":
    app.run(debug=True)
```
Vi kikar lite snabbt på `index.html` också. Kolla i "[Flask med Jinja2](kunskap/flask-med-jinja2)" för innehållet i header.html, footer.html och style.css.

```
{% include 'header.html' %}

<div class="container">
    <div class="page-header">
        <h1>Visa anställda.</h1>
    </div>
</div>

{% include 'footer.html' %}
```

Okej, nu har vi grunden och går vidare med att skapa Employee klassen.



###employee.py {#emplyee-py}

Vi skapar en simple klass för att hålla data om anställda.

```python
#!/usr/bin/env python3
"""
Class file for Employee
"""
import random

class Employee():
    """
    Class for Employee
    """

    def __init__(self, firstname, lastname, salary):
        """
        init method
        """
        self.firstname = firstname
        self.lastname = lastname
        self.salary = salary
        self.id_number = random.sample(range(10), 4)

    def get_salary(self):
        """
        Returns the salary
        """
        return self.salary

    def get_id(self):
        """
        Returns the employement id
        """
        return "".join(map(str, self.id_number))

    def get_name(self):
        """
        Returns name
        """
        return self.firstname + " " + self.lastname
```

Nästa steg blir att skapa Handler klassen så vi kan använda Employee.



###handler.py {#handler-py}

Handler klassen ska vara bryggan mellan app.py och Employee objekten. Vi börjar med en lista som innehåller alla skapade objekt och en metod som skapar några hårdkodade Employee objekt. 

```python
#!/usr/bin/env python3
"""
Handler file
"""

from employee import Employee

class Handler():
    def __init__(self):
        self.people = []
        self.add_predefined_employees()

    def get_people(self):
        return self.people

    def add_predefined_employees(self):
        emil = Employee("Emil", "Folino", 30000)
        mikael = Employee("Mikael", "Roos", 31000)
        kenneth = Employee("Kenneth", "Lewenhagen", 75000)
        andreas = Employee("Andreas", "Arnesson", 12000)

        self.people.append(emil)
        self.people.append(mikael)
        self.people.append(kenneth)
        self.people.append(andreas)
```

Nu har vi två klasser som vi kan skapa objekt av för att spara data och jobba med den. Innan vi bygger ihop det i app.py skapar vi html koden för att visa upp de anställda.



###templates/tables {#templates-tables}

Vi ska utnyttja Jinja2's funktionalitet för att hantera mallar och skapa mallar, *templates*, för tabellen och formuläret. Som du såg i början av artikeln så har vi mapparna templates/forms och templates/tables.

Vi hoppar in i mappen templates/tables/ och tittar på `show_employees.html`.

Vi skapar en tabell och använder Jinja för att skapa en loop och lägga till varje employee i tabellen.
Magin händer i `<tbody>`, vi använder en [for-loop](http://jinja.pocoo.org/docs/2.10/templates/#for) med hjälp av Jinja för att gå igenom en lista med Employee objekt och lägger till dem i tabellen, en rad/objekt. Detta betyder att vi i app.py måste skicka med en lista med Employee objekt till `render_template()` metoden.

```
<table class="table">
    <thead>
        <tr>
            <th>Name</th>
            <th>Id</th>
            <th>Salary</th>
        </tr>
    </thead>
<tbody>
    {% for person in people %}
    <tr>
        <td>{{ person.get_name() }}</td>
        <td>{{ person.get_id() }}</td>
        <td>{{ person.get_salary() }}</td>
    </tr>
    {% endfor %}
</tbody>
</table>
```

Vi passar även på att inkludera tabellen i index.html 

```
{% include 'header.html' %}

<div class="container">
    <div class="page-header">
        <h1>Visa anställda</h1>
    </div>
    <div class="row">
        <div class="col-md-3 col-md-offset-1">
            <h3>Employed</h3>
            {% include 'tables/show_employees.html' %}
        </div>
    </div>
</div>

{% include 'footer.html' %}

```

När vi kallar på `{% include ... %}` letar Jinja2 automatiskt i mappen templates/. Vi kan på detta sättet separera koden och inkludera formulär, tabeller och övrig html-kod. För att få en snygg layout använder vi Bootstrap's färdiga klasser. Klassen `row` gör sitt bästa för att innehållet ska hamna på en rad. Klassen `col-md-3` tar upp 3 kolumner av 12. Klassen `col-md-offset-1` puttar elementet 1 kolumn åt höger.

Sista steget blir att importera Handler i app.py och skicka med alla Employee objekt till `render_template()`.

```python
# app.py
...
from handler import Handler

app = Flask(__name__)
handler = Handler()

@app.route("/")
def main():
    """ Main route """
    return render_template("index.html", people=handler.get_people())

...
```

Kolla att det fungerar, starta servern och gå till `http://localhost:5000` i webbläsaren.

[FIGURE src=/image/oopython/kmom02/show_employees.png caption="Visa alla anställda."]



Lägg till nya anställda {#add}
-------------------------------

Nästa steg är att kunna lägga till fler anställda. Vi gör det med ett formulär som skickar ett POST request. Börja med att lägga till ett menyval i navbaren för `company.html` i `header.html`, samt en route i app.py som returnerar `company.html`.

```python
# app.py
...

@app.route("/company")
def company():
    """ Company route """

    return render_template("company.html")

...
```

Vi går vidare med att lägga till kod i company.html.



###company.html {#company.html}

Vi bygger upp company.html på liknande sätt som index.html.

```html
{% include 'header.html' %}
<div class="container">
    <div class="page-header">
        <h1>Lägg till anställda</h1>
    </div>
    <div class="row">
        <div class="col-md-3 col-md-offset-1">
            <h3>Add employee</h3>
            {% include 'forms/add_employee.html' %}
        </div>
    </div>
</div>
{% include 'footer.html' %}
```

Nedanför skapar vi en mall för formuläret som vi importerar ovanför.



###templates/forms {#templates-forms}

Mallen för formuläret, templates/forms/add_employee.html, ser ut på följande sätt:

```html
<form role="form" method="POST" action="{{ url_for('company') }}">
    <div class="form-group">
        <label for="firstname">First name: </label>
        <input type="text" name="firstname" class="form-control" />
    </div>
    <div class="form-group">
        <label for="lastname">Last name: </label>
        <input type="text" name="lastname" class="form-control" />
    </div>
    <div class="form-group">
        <label for="salary">Salary: </label>
        <input type="text" name="salary" class="form-control" />
    </div>
    <button type="submit" class="btn btn-default">Lägg till</button>
</form>
```

Bootstrap gör att vi får lite mer rader än vad som egentligen behövs. De viktiga raderna är:

```
<form role="form" method="POST" action="{{ url_for('company') }}">
...
        <input type="text" name="firstname" class="form-control" />
...
    <button type="submit" class="btn btn-default">Lägg till</button>
```

Vi sätter metoden till POST och action till sökvägen för `company.html`. Attributet `name` är nyckeln vi når formulärets data med i Python koden.



###app.py {#app-py}

Vi behöver modulen `request` från Flask för att hämta vilken typ av request det är och komma åt data från formulär i en route:

```
from flask import Flask, render_template, request
```
Nu återstår att hantera det inskickade formuläret. Det gör vi i routen för company.html:

```python
@app.route("/company", methods=["POST", "GET"])
def company():
    """ Company route """

    if request.method == "POST":
        handler.add_employee(request.form)

    return render_template("company.html")
```

`methods=["POST", "GET"]` talar om att det är helt i sin ordning att ta sig hit via både POST och GET, om man inte har med det kan man bara ta sig till den routen med GET requests. Med modulen `request` kan vi se hur användaren har tagit sig in i routen med `request.method`. Om requesten är GET behöver vi inte göra något, då ska bara sidan renderas. Om det däremot är POST betyder det att det är formuläret som skickats och det behöver vi ta hand om. Vi behöver skapa `add_employee()` metoden i Handler.

```python
class Handler():
    ...

    def add_employee(self, form):
        empl = Employee(
            form["firstname"],
            form["lastname"],
            form["salary"]
        )
        self.people.append(empl)

    ...
```

Notera, om man har ett formulär som innehåller t.ex. checkboxes kan man använda [getlist(key)](http://werkzeug.pocoo.org/docs/0.14/datastructures/#werkzeug.datastructures.MultiDict.getlist), `form.getlist("key")`, för att hämta ut dess värden.

Om ni startar upp servern borde ni kunna gå till company.html och lägga till en employee. Sen kan ni gå tillbaka till index.html och se den i tabellen med all personal.



Flask i produktion {#produktion}
-------------------------------

Det vi har gjort än så länge fungerar bra lokalt men om vi publicerar sidan till studentservern, lägger till en anställd och går till index.html för att kolla på alla fina anställda kommer vi bara se de som är hårdkodade. När ni testar publicera glöm inte [app.cgi](coachen/flask-som-cgi-script) filen. 

När vi kör sidan lokalt med Flasks inbyggda server är vårt program i app.py igång hela tiden och vi använder dens minne för att komma ihåg alla anställda vi lägger till i formuläret vid varje request. Men Flask själva skriver att deras webbserver inte säker nog för att användas i produktion, den ska bara användas för utveckling. På studentservern kör vi istället en Apache webbserver som inte fungerar med Flask naturligt. Detta är varför vi behöver `app.cgi` filen, den gör att Apache kan startar vårt app.py program varje gång någon gör ett request. I och med detta stängs vårt program av när ett request är färdigt och när vi får ett nytt request, och programmet startas igen, har programmet inget minne av vad vi gjort tidigare. Vid varje request, när vi byter från index.html till company.html eller när vi submit:ar ett formulär, utgår vi bara från det som finns hårdkodat i koden. I bilden nedanför är "Gateway program" app.py och "Web server" Apache på studentservern.

[FIGURE src=/image/oopython/kmom02/cgi.png caption="Hur CGI fungerar på en webbserver."]

Vi behöver ett externt minne som vårt program kan använda för att spara data mellan requests. Om vi hade skapat en större applikation där vi vill ha persistent data hade vi implementerat en databas. Ett annat alternativ är att skriva datan till fil, det finns ett exempel för detta i [example/flask/read_write](https://github.com/dbwebb-se/oopython/tree/master/example/flask/read_write). Men vi ska använda [Session](http://flask.pocoo.org/docs/1.0/api/#sessions) istället. För de som inte har koll på vad session är eller om någon bara vill friska upp minnet kan ni läsa [Session delen av PHP guiden](guide/kom-igang-med-programmering-i-php/sessioner). Ni kan ignorera att det är PHP kod, det fungera väldigt likt i Python.

### Session {#session}

För att skapa en unik session till vår applikation och använda den behöver vi skapa en hemlig nyckel som bara vi ska veta om, där av namnet hemlig. I app.py skapar vi en hemlig nyckel baserat på pathen till filen.

```python
# app.py
import os
import re
from flask import Flask, render_template, request, session
from handler import Handler

app = Flask(__name__)
app.secret_key = re.sub(r"[^a-z\d]", "", os.path.realpath(__file__))
...
```

Session är i princip en vanlig dictionary vilket betyder att om vi vill spara data behöver datan vara av datatypen Dict, eller JSON. Men vår data ligger i Employee objekt vilket inte översätts automatiskt till dictionary så vi kan inte spara datan som den är utan vi behöver [serialisera datan](https://sv.wikipedia.org/wiki/Serialisering). Serialisering är processen att formatera data/objekt till ett format som kan sparas och sedan deserialiseras för att återskapa det tidigare objektet/datan. Vi behöver skapa två nya metoder i Employee klassen för detta. En metod som tar datan från en instans och lägger i en Dict, serialisering, och en som skapar ett nytt Employee objekt av data från en Dict, deserialisering.

```python
class Employee():
    def __init__(self, firstname, lastname, salary, id_number=None):
        self.firstname = firstname
        self.lastname = lastname
        self.salary = salary
        self.id_number = id_number if id_number else random.sample(range(10), 4)

    def to_json(self):
        return {
            "fname": self.firstname,
            "lname": self.lastname,
            "salary": self.salary,
            "id": self.id_number,
        }
    # factory method
    @classmethod
    def from_json(cls, json):
        return cls(json["fname"], json["lname"], json["salary"], json["id"])
    ...
```

Inget jätte speciellt i metoderna, `to_json` returnerar en Dict med all data och `from_json` är en klassmetod som skapar en ny instans av klassen, typ som `__init__()`. Klassmetoder som fungerar som `__init__()` brukar kallas "factory methods". Vi lägger även till ett default värde på `id_number` parametern i konstruktorn, så vi kan skicka med id_number när vi skapar objekt från session. Då fortsätter vi med att lägga till två metoder i Handler, en för att skriva data till session och en för att läsa data från session.

```python
class Handler():
    ...
    def write_session(self, session):
        session["employees"] = [e.to_json() for e in self.people]
    
    def read_session(self, session):
        if session.get("employees", []):
            self.people = [Employee.from_json(e) for e in session["employees"]]
    ...
```

I `write_session` använder vi `to_json()` för att serialisera varje objekt och lägga i en lista. I `read_session` använder vi `from_json()` för att deserialisera datan från session. Nu behöver vi bara anropas dessa två metoder på rätt ställe i `app.py`.

```python
# app.py
from flask import Flask, render_template, request, session, redirect, url_for
...

@app.route("/")
def main():
    """ Main route """
    handler.read_session(session)
    return render_template("index.html", people=handler.get_people())

@app.route("/company", methods=["POST", "GET"])
def company():
    """ Company route """

    if request.method == "POST":
        handler.add_employee(request.form)
        handler.write_session(session)
        

    return render_template("company.html", persons=handler.get_people())
...
```

Vi ser till att alltid läsa från session när vi ska visa index.html, så vi kan populera tabellen, och vi skriver till session efter att vi har lagt till ett nytt Employee objekt. Nu ska vi ha en fungerande webbsida där vi kan lägga till anställda och visa upp dem i en tabell, som även fungerar på studentservern. Publicera övningen och testa.

Vi har en liten sak kvar, vi har inget sätt att tömma session om vi vill glömma allt vi har lagt till. Det löser vi genom att lägga till en route där vi bara tömmer session och redirect:ar till index.html

```python
@app.route("/reset")
def reset():
    """ Route for reset session """
    _ = [session.pop(key) for key in list(session.keys())]
    return redirect(url_for('main'))
```

Nu kan ni lägga till `/reset` i slutet av url:en för att tömma session, om man är lat kan man även lägga till en länk i `header.html` som går dit. Notera att om ni testar sidan lokalt med session så är tabellen ibland cachad och då visas tabellen med gammal data efter `/reset`. För att vara säker på att session fungerar testa på studentservern.



Avslutningsvis {#avslutning}
------------------------------

Nu har vi kommit fram till slutet, det blev mycket information. Vi har lärt oss POST/GET, for-loop i template, CGI, Session och Serialisering bland annat.
