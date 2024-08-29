---
author: lew
revision:
    "2022-04-13": "(B, lew) Uppdatering inför HT22."
    "2019-03-14": "(A, lew) Första versionen."  
...
Skapa och hantera konto
=======================

Vi kan hantera vårt Docker Hub-konto direkt från terminalen. Vi kan även ladda ner, tagga och ladda upp våra egna images till vår del av Docker Hub.



### Skapa konto {#skapa-konto}

För att kunna hantera vårt konto behöver vi först och främst skapa ett. Det gör du på [https://hub.docker.com](https://hub.docker.com/).



### Logga in via terminalen {#login-terminal}

Vi vill ju hantera kontot på terminalnivå så vi kör följande för att logga in:

`$ docker login`

Knappa in användarnamnet och lösenordet när du ombeds göra det. Om allt går bra ser du följande utskrift:

```
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: <username>
Password: <pass>
Login Succeeded

Logging in with your password grants your terminal complete access to your account.
For better security, log in with a limited-privilege personal access token. Learn more at https://docs.docker.com/go/access-tokens/
```



### Tagga och publicera image {#publish-image}

Vi kan även publicera en image till Docker Hub. Vi kan med fördel då även tagga den, för att kunna separera olika versioner av imagen. Först behöver vi få tag på den aktuella imagens id:

```
$ docker images
REPOSITORY                  TAG                  IMAGE ID            CREATED             SIZE
ubuntu                      24.04                f0b07b45d05b        7 days ago          77.9MB
```

Låt säga att jag vill ha den här versionen på Docker Hub. Jag kan då tagga den så jag vet vilken version det är:

```
$ docker tag f0b07b45d05b username/imagename:mytag
```

*f0b07b45d05b*, *username*, *imagename* och *mytag* byter du ut mot dina egna uppgifter. Sedan kan vi pusha den:

```
$ docker push username/imagename:mytag
```

Om vi inte ger imagen en tag, kommer taggen *:latest* automatiskt sättas.

När du sedan går in på [https://hub.docker.com/](https://hub.docker.com/) kommer du se din image uppladdad och taggad. För att använda den på tex en annan dator kan du köra:

```
$ docker run -it username/imagename:mytag
```
