---
author: 
    - lew
    - grm
revision:
    "2023-01-10": (D, grm) Uppdaterade till kmom02.
    "2022-01-14": (C, grm) Lägga till bild och kod i flask, bytte px till em.
    "2018-11-21": (B, aar) La till att installera moduler i venv.
    "2017-11-10": (A, lew) Updated version for VT18.
category:
    - oopython
...
Flask med Jinja2
===================================

[FIGURE src=/image/oopython/kmom03/kmom03_top_jinja.png?w=c8 class="right"]

[Flask](http://flask.pocoo.org/) är ett microramverk för Python, som gör det möjligt att skapa webbapplikationer. Det är litet men kraftfullt. Vi ska gå igenom hur man installerar det och kommer igång med en enkel sida.

[Jinja2](http://jinja.pocoo.org/) är en så kallad "template engine" för Python som renderar template-filer åt oss.

<!--more-->



Förutsättning {#pre}
-------------------------------

Du kan grunderna i Python och du vet vad variabler, typer, objekt och funktioner innebär.  
Du är medveten om strukturen och uppbyggnaden av en webbsida.  
Du har läst [virtuell miljö i Python](kunskap/python-virtuel-miljo) och har pip installerat.

<!-- Du har gjort övningen "[Kom igång med Flask](kunskap/kom-igang-med-flask)".   -->
<!-- Du har gjort övningen "[Kom igång med objekt](kunskap/kom-igang-med-objekt)". -->



Installation {#installation}
------------------------------

Vi behöver installera Flask och Jinja2 modulerna. Vi förutsätter att du redan har skapat en venv i oopython mappen.

```bash
# stå i root mappen i kursrepot.
$ source .venv/bin/activate
(.venv) $ pip3 install -r .requirements.txt
```



Frontcontroller {#frontcontroller}
------------------------------

Vi skapar en fil som vi döper till `app.py`. Det är frontcontrollern till applikationen, dvs den fil som hanterar alla inkommande routes och servar webbläsaren med korrekt fil.

Öppna en terminal och leta dig fram till mappen `kmom02/my_app`.

```bash
$ touch app.py
```

Öppna filen i en editor, förslagsvis Atom, och kopiera in följande kod:

```python
#!/usr/bin/env python3
"""
My first Flask app
"""
# Importera relevanta moduler
from flask import Flask

app = Flask(__name__)

@app.route("/")
def main():
    """ Main route """
    return "Välkommen!"

if __name__ == "__main__":
    app.run()
```

Med hjälp av `@app.route()` kan vi hantera inkommande routes och serva önskat innehåll, i det här fallet strängen "Välkommen!".

Routen "/" är roten, start eller index om man så vill. En route kan ses som en trafikpolis som dirigerar om trafiken. Om vi har en route `@app.route('/telefon')` kan vi nå den via `http://example.com/telefon`. Funktionen som definieras under behöver inte ha samma namn som routen. Det underlättar dock då Flask bland annat använder funktionsnamnet för att hänvisa till dess sökväg. Flask kan använda till exempel `url_for('main')`, och hade i detta fallet hänvisat till routen `/` (roten). Men mer om det senare, nu går vi vidare.

Vi lägger också in två "routes" för felhantering, vilket behövs för att felmeddelanden ska skriva ut på studentservern.

```python
#!/usr/bin/env python3
"""
My first Flask app
"""
# Importera relevanta moduler
import traceback
from flask import Flask

app = Flask(__name__)

@app.route("/")
def main():
    """ Main route """
    return "Välkommen!"

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

Starta applikationen (glöm inte att venv måste vara aktiverat för att starta servern):

```bash
(.venv) $ python3 app.py
```

Om allt är ok ser du: ` * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)`  

Peka sedan webbläsaren på `localhost:5000`, alternativt `127.0.0.1:5000` så ser du resultatet.

[FIGURE src=/image/oopython/kmom01/flaskstart.png?w=w2 caption="Applikationen snurrar på localhost:5000."]



Applikation {#applikation}
------------------------------

###Bootstrap {#bootstrap}

Vi ska använda [Bootstrap](http://getbootstrap.com/) i applikationen. Det underlättar en snygg design och responsivitet.  

[Temat som används](https://getbootstrap.com/docs/3.3/examples/starter-template/).  

Du får självklart använda ett annat tema om du vill. De flesta teman har bara en annan .css-fil och kan skilja sig lite i klassnamn och struktur. Inga större skillnader.

Nu kör vi.

Först stänger vi ner servern (ctrl-c) och skapar de filerna som behövs.

Använd terminalen och ställ dig i "my_app":
```bash
$ mkdir templates static
$ mkdir static/styles
$ touch templates/index.html
$ touch templates/header.html
$ touch templates/footer.html
$ touch static/styles/style.css
```

[FIGURE src=/image/oopython/kmom01/tree1.png caption="Filstruktur."]

Flask använder en viss mappstruktur när den letar efter filerna. Till exempel:  

* .html-filer och dynamiska filer som ska servas ska ligga i mappen /templates
* bilder och annat statiskt material ska ligga i /static
* egna stylesheets (css) ska ligga i /static/styles  

Som du såg ovan så skapade vi `header.html` och `footer.html`. Vi ska använda Jinja2 för att separera koden så vi använder en header och en footer som inkluderas på alla sidor. På så vis behöver vi bara ändra koden på ett ställe vid eventuell uppdatering och vi återanvänder koden. [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) är bra.

Allt har sin plats. Struktur. Det finns såklart andra resurser att tillgå som i sin tur har "egna" platser i applikationen men för stunden räcker det med det här.



###header.html {#header}

För Bootstraps filer använder vi oss av [CDN](https://en.wikipedia.org/wiki/Content_delivery_network). Det krävs att man har åtkomst till internet, då Bootstraps filer laddas in via `http`. Det blir färre filer lokalt. Smidigt!  

Öppna header.html i editorn och kopiera in följande kod:

```html
<!DOCTYPE html>
<html lang="sv">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Applikation i Flask</title>

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">

    <!-- Private stylesheet, loads last -->
    <link rel="stylesheet" href="{{ url_for('static',filename='styles/style.css') }}">
</head>

<body role="document">
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false"   aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="{{ url_for('main') }}">Min första Flask app</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="{{ url_for('main') }}">Hem</a></li>
                </ul>
            </div>
        </div>
    </nav>
```

Det här är den "övre" delen av en klassisk Bootstrap-mall. Vi laddar även in en egen stylesheet efter Bootstraps. Det är med den vi kan "personifiera" stylen då vi inte har Bootstraps filer lokalt.  



Flask använder `url_for()` för sökvägen ska bli korrekt. I koden ovan ser vi bland annat:

```html
<link rel="stylesheet" href="{{ url_for('static',filename='styles/style.css') }}">
```

Stylesheets och bilder ska ligga i mappen static/. Med argumentet `filename=` kan vi skicka med ett filnamn, eller resten av sökvägen om det är uppdelat i mappar i static/. Om man har en bild till exempel me.png i mappen static/images/ når man den med:

```html
<img src="{{ url_for('static',filename='images/me.png') }}">
```

Vi har även länken i navbaren:

```html
<a href="{{ url_for('main') }}">
```

Här hämtas sökvägen till routen `main`, `def main():` från `app.py`. Jämför det med `<a href="index.html">` i detta fallet.



###footer.html {#footer}

Här behöver vi ladda in det sista och stänga alla öppna taggar. Bootstrap använder ett externt bibliotek, JQuery, så vi behöver även ladda in det via CDN. Ta nu följande kod och lägg i footer.html:

```html
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>
```



###index.html {#index}

Vi hoppar över till index.html och använder Jinja2 för att inkludera header.html och footer.html.

```html
{% include 'header.html' %}

<div class="container" role="main">
    <div class="page-header">
        <h1>Stiligt! En fungerande applikation.</h1>
        <h3>Nu inkluderas headern och footern med hjälp av Jinja2</h3>
    </div>
</div>

{% include 'footer.html' %}
```



###style.css {#style}

Vi har som sagt vår egna stylesheet att tillgå. [Bootstraps dokumentation](https://getbootstrap.com/docs/3.3/components/#navbar-component-alignment) talar om för oss att *"The fixed navbar will overlay your other content, unless you add padding to the top of the \<body\>"* och *"The fixed navbar will overlay your other content, unless you add padding to the bottom of the \<body\>"*.

Vi lägger till det i vår egna stylesheet style.css:

```css
body {
    padding-top: 4em;
    padding-bottom: 2em;
}
```



###app.py {#app}

Vi måste ju ändra så vi servar en html-fil istället för en sträng. För att kunna rendera html-filer så behöver vi importera metoden "render_template" och använda den.

```python
from flask import Flask, render_template
```

Bra, nu kan vi använda den i vår route:

```python
@app.route("/")
def main():
    """ Main route """
    return render_template("index.html")
```

`render_template()` letar automatiskt efter filer i mappen `templates/` och därför behöver vi inte specifiera någon sökväg.

Underbart! Testa nu att kicka igång servern med `python3 app.py` och öppna `localhost:5000` i din webbläsare.  

[FIGURE src=/image/oopython/kmom01/app1.png?w=w2 caption="En fungerande applikation."]

För att prova responsiviteten kan du förminska fönstret (webbläsaren) och ser då att menyn ändras när fönstret blir tillräckligt litet.



Utöka applikationen {#utoka}
-------------------------------

Det är ju lite tråkigt att bara ha en sida. Vi tittar på hur man utökar med en sida till.

Vi kommer att behöva skapa en ny sida i /templates-mappen lägga till en route i `app.py` samt uppdatera header.html med ett nytt menyval. Inte krångligare än så.



###Lägg till en sida {#lagg-till-en-sida}

Vi lägger till en sida, `about.html`. Vi utgår ifrån att den nya filen har samma struktur som `index.html` så vi kopierar bara den.

```bash
# Ställ dig i me_app/
$ cp templates/index.html templates/about.html
```

Öppna filen och ändra texten i den så du kan se när vi byter vilken som ska visas.


###Lägg till ett menyval {#lagg-till-ett-menyval}

Om vi kikar i header.html så ser vi raden:

```html
<li class="active"><a href="{{ url_for('main') }}">Hem</a></li>
```

Notera `class="active"`, den css-klassen avgör vilket menyval i navbaren som ska visas som aktiv, alltså vilken sida vi är på. Nu har vi hårdkodat att "Hem" menyvalet alltid är aktivt men nu när vi ska lägga till ett nytt menyval behöver båda kunna vara aktiva och bara en av dem ska vara det åtgången. Vi behöver lägga till ett nytt \<li\> element för den nya sidan:

```html
<li class="active"><a href="{{ url_for('main') }}">Hem</a></li>
<li><a href="{{ url_for('about') }}">Om</a></li>
```

Innan vi går vidare till routen ordnar vi så att bara det aktiva menyvalet får klassen ".active".

```html
<ul class="nav navbar-nav">
    <li {%- if request.path == "/" %} class="active" {% endif %}><a href="{{ url_for('main') }}">Hem</a></li>
    <li {%- if request.path == "/about" %} class="active" {% endif %}><a href="{{ url_for('about') }}">Om</a></li>
</ul>
```

Med modulen Jinja2 kan vi använda if-satser i vår html template-kod, även for-loopar, och med modulen request kan vi få ut vilken path vi är på. Vi kombinerar det för att kolla om vi är på pathen "/" eller "/about" och sätter klassen "active" på rätt menyval. På detta sätta kan vi dynamiskt sätta "activ" på korrekt menyal. Studera koden ovan så du är med på vad som händer.


###Lägg till en route {#lagg-till-en-route}

Vi öppnar filen `app.py` igen och lägger till en route för "about". Lägg till följande kod efter den första routen:

```python
@app.route("/about")
def about():
    """ About route """
    return render_template("about.html")
```

<!-- Om vi nu drar igång servern och pekar webbläsaren på `localhost:5000/about` -->

Skicka med parametrar {#skicka-med-parametrar}
------------------------------

För att göra vår app lite mer användbar kan vi skicka med data vid routingen i app.py till templatefilerna. Det gör att vi kan skicka med data från vår pythonkod till htmlkoden och presentera den.

Vi kikar på hur det går till i app.py. Vi lägger till ett par variabler i routen för "about".

```python
@app.route("/about")
def about():
    """ About route """
    my_name = "Marie Grahn"
    my_course = "OOPython"

    return render_template("about.html", name=my_name, course=my_course)

```

Låt säga att vi vill skicka med variablerna till `about.html`. Om du kommer ihåg [strängformatering](https://www.youtube.com/watch?v=BkMm0lX-Ytc&list=PLKtP9l5q3ce93pTlN_dnDpsTwGLCXJEpd&index=18) från förra Pythonkursen kan du nog lista ut hur det fungerar.  

Nu fattas det bara att använda variablerna i about.html. Vi lägger till placeholders med hjälp av `{{ }}`. Det är modulen Jinja2 som låter oss använda `{{}}` och köra "kod" i dem.

```html
<p>Jag heter {{ name }} och det här är kursen {{ course }}.</p>
```

about.html tar emot de skickade variablerna och placerar ut dem.

Om vi nu drar igång servern och pekar webbläsaren på `localhost:5000/about`:

[FIGURE src=/image/oopython/kmom01/jinja2_result_attributes.png?w=w2 caption="Utskrift via variabler."]


Lägg till en bild {#lagg-till-en-bild}
------------------------------

Vi lägger till en bild på vår nya sida, `about.html`. Skapa katalogen /static/img och kopiera in en bild under
katalogen /static/img.

Jag använder leaf_256x256.png från "[leaf_256x256](https://dbwebb.se/image/theme/leaf_256x256.png)" och sätter bredden till 256 pixlar. Uppdatera about.html med följande rad.

```html
<img src="{{ url_for('static',filename='img/leaf_256x256.png') }}" width="256">
```

Om vi nu drar igång servern och pekar webbläsaren på `localhost:5000/about`:

[FIGURE src=/image/oopython/kmom01/jinja2_result_image.png?w=w2 caption="Bild tillagd på sidan."]


Lägg till kod i routen {#lagg_till_kod_i_routen}
------------------------------

Hur gör vi då för att skapa en instans av en klass och visa den infon i vår app? Vi använder oss av klassen Car från övningen "[Introduktion till enhetstester](kunskap/unittest-i-python_1)". Kopiera car.py till "my_app" så att den ligger i samma katalog som app.py.

Använd terminalen och ställ dig i "my_app":
```bash
$ cp ../unittest/src/car.py .

```

Nu uppdaterar vi `app.cy` och lägger in kod i metoden under route "/about".

```python
@app.route("/about")
def about():
    """ About route """
    my_car = Car("BMW", 90000)
    my_name = "Marie Grahn"
    my_course = "OOPython"

    return render_template("about.html", name=my_name, course=my_course,
        car_info=my_car.present_car())

```

Därefter uppdaterar vi templatefilen `about.html` med följande rad.

```html
<p>Bil info: {{ car_info }} </p>
```

Om vi nu uppdaterar servern och pekar webbläsaren på `localhost:5000/about`:

[FIGURE src=/image/oopython/kmom01/jinja2_result_car.png?w=w2 caption="Information från kod i routen /about tillagd på sidan."]


Flask i debug-läge {#debug}
------------------------------

Det finns ett [debug-läge](http://flask.pocoo.org/docs/0.12/quickstart/#debug-mode) inbyggt i Flask som automatiskt startar om Python servern när du ändrar din Pythonkod. Det funkar inte när du ändrat i någon template kod, ex. html filerna, utan bara när du ändrat på din Pythonkod. Nedanför kan du se hur man startar Flask i debug-läge. Obs! Tanken är att man bara kör med debug-läge i utvecklingsfasen då att ha det aktiverat är en säkerhetsrisk.

```python
if __name__ == "__main__":
    app.run(debug=True)
```

Avslutningsvis {#avslutning}
------------------------------

Kika igenom dokumentationen för [Flask](http://flask.pocoo.org/) och [Jinja2](http://jinja.pocoo.org/docs/2.10/). Fundera lite på vad mer man kan göra med Flask och Jinja2. Det är oerhört kraftfullt och öppnar upp många möjligheter med Python-kod på webbsidan.
