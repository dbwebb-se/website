---
author: aar
category:
    - devops
    - verktyg
revision:
    "2022-10-19": "(A, efo) Första utgåvan, kopierat mycket från andra artikeln om education pack on digital ocean."

...
GitHub Education Pack och ett domännamn
==================================

[FIGURE src=/image/ramverk2/do.png class="right"]

Vi kommer i denna artikel titta på hur vi kan använda GitHub Education Pack för att få ett gratis domännamn.

<!--more-->



Förutsättning {#pre}
--------------------------------------

Du har din student e-postadress nära till hands då den behövs för att få tillgång till GitHub Education Pack.



GitHub Education Pack {#gep}
--------------------------------------

För att få tillgång till rabatter och rabattkoder som erbjuds i [GitHub Education Pack](https://education.github.com/pack) behöver GitHub veta att du är student. Gå till den länkade sidan och tryck "Sign up for your Student Developer Pack". Viktigt att du använder din **student mail** när du registrerar dig då mailen måste vara kopplat till en undervisningsinstitution.

När du är verifierad via GitHub får du tillgång till en mängd erbjudande på [olika tjänster](https://education.github.com/pack/offers).



En domän till din server {#domain}
--------------------------------------

Som en del av Github Education Pack får du som student även ett domän-namn på top-domänen .me från registratorn [namecheap gratis under ett år](https://education.github.com/pack/offers?sort=popularity&tag=Domains). Om du vill använda en annan registrator är det fritt fram. Tidigare år hade några studenter problem att få namecheap att fungera, då använde de .TECH istället.

### Namecheap {#namecheap}

För att använda namecheap tryck på länken "Get access by connecting your GitHub account on Namecheap" och knyta ihop ditt GitHub konto med namecheap och skapa en användare.

När du har kopplat din användare kommer du till en sida där du skapar ditt domännamn. Skriv in din text i kommande bilder har jag använt det domännamn jag valda 'jsramverk.me'.

[FIGURE src=/image/ramverk2/namecheap-nameservers.png?w=w3 caption="Fyll i nameservers hos namecheap."]

Senare kommer vi kolla på hur vi kopplar namnet till en server.



Avslutningsvis {#avslutning}
--------------------------------------

Djupt andetag. Det var en rejäl omgång, men vi är nu på gång på riktigt med en egen server med nginx och node. Vi ska i kommande artiklar titta på hur vi kan skapa ett API som skickar data vid förfrågningar.
