---
author: lew
revision:
    "2019-04-12": "(A, lew) Första versionen."
...
Python
=======================

Vi går igenom hur vi kan installera Flask och jobba med en server i Python.

*Se till att skapa en arbetsmapp lokalt så du inte är i tex roten. Vi kommer kopiera filer med `.` vilket tar alla filer i nuvarande mapp.*




### app.py {#app}

Vi skapar enklast möjliga Flask-applikation. Servern har en route som returnerar "Hello from Flask!":

```
#!/usr/bin/env python3

from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello from Flask!'

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
```



### Dockerfile {#dockerfile}

Här kan vi köra **ENTRYPOINT**. Det fungerar likt `CMD`, förutom att om vi lägger till kommandon när vi kör `$ docker run ...` kommer inte ENTRYPOINT att ignoreras. Vi hade säker kunna hitta någon passande image med både Python och Flask installerat, men var är det roliga i det?

```
FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y python3-pip python3-dev python3-flask build-essential
COPY . /app

WORKDIR /app

ENTRYPOINT ["python3"]

CMD ["app.py"]
```



### Bygga och köra {#build-n-run}

Nu har vi allt på plats för att bygga vår image...

`$ docker build -t username/imagename:tag .`

...och köra den:

`$ docker run --rm -p 5000:5000 username/imagename:tag`

Nu kan vi peka webbläsaren mot `localhost:5000`.
