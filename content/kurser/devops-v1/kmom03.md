---
author:
    - aar
revision:
    "2020-11-13": "(B, aar) Bytt från AWS till Azure."
    "2019-07-29": "(A, aar) Första versionen."
...
Kmom03: Configuration Management och Continuous Deployment
==================================

Vi fortsätter med att kolla in fler sätt att automatisera flöden. Vi lär oss Ansible för Configuration Management (CM) och Infrastructure as Code (IaC). Tillsammans med Ansible och CircleCI ska vi också utveckla vår Continuous Delivery till Continuous Deployment (också CD).



<!-- more -->

[FIGURE src="https://www.gocd.org/assets/images/blog/continous-delivery-vs-deployment-infographic/continuous-delivery-vs-continuous-deployment-infographic-305dd620.png"]



Nästa steg i vår miljö är att utöka antalet servrar från en till tre. Vi ska bygga en klassisk webbapp struktur, en server för databasen, en för appen och en som load balancer (Nginx, fungerade som proxy tidigare). Med systemet vi har nu, att kopiera bash filer till servern och exekvera manuellt är inte hållbart inom devops. Vi ska utnyttja kraften av Configuration Management verktyget Ansible för att uppnå denna strukturen på att hållbart sätt. Vi flyttar över funktionaliteten från bash skripten till Ansible, som kan utföra samma sak på flera servrar samtidigt. Vi ska skapa och stänga ner servrar med ett kommando, installera och konfigurera dem och tillslut ha ett kommando för att sätta upp hela produktionsmiljön, från zero to hero!

[INFO]
Innan ni sätter igång med kursmomentet kolla att ert Microblog repo är synkat med originalet, [Syncing a fork](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/syncing-a-fork).
[/INFO]



## Infrastructure as Code och Configuration Management {#iac-cm}

Infrastructure as Code innebär att behandla sin infrastruktur (servrar) som software, det ska vara definierat i kod och versionshanterat, för ett längre mer djupgående utlägg läs följande:

- [Why use IaC](https://medium.com/cloudnativeinfra/why-use-infrastructure-as-code-881ccd6c4290).

För att få en översikt av vad CM är har Digital Ocean gjort en bra sammanfattning:

- [An introduction to Congifuration Management](https://www.digitalocean.com/community/tutorials/an-introduction-to-configuration-management).

När ni fått lite bättre koll på IaC och CM kan ni läsa om olika verktyg som finns och var de passar in [inom IaC och CM](https://dzone.com/articles/when-to-use-which-infrastructure-as-code-tool).



## Ansible {#ansible}

Ansible är ett verktyg för att automatisera server konfiguration. Läs om följande artiklar om Ansible.

- [Ansibles grundkoncept](https://docs.ansible.com/ansible/latest/network/getting_started/basic_concepts.html).

- Introduktion till att [använda Ansible](https://www.digitalocean.com/community/tutorials/configuration-management-101-writing-ansible-playbooks).

- Ansible [Best Practices](https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html).

- Träna på Ansible på [killercoda](https://killercoda.com/ansible/scenario/ansible-en-101).



### Förbered för Ansible {#prepare}

Innan ni fortsätter **ska** ni ta bort era gamla VMs och resurser. På Azure portalen, gå till `All resources` och radera allt **utom** er "DNS zone" och "SSH key"!



### Bekanta er med Ansible skripten {#ansib-scripts}

Än så länge har vi kopierat skript från `scripts` mappen över till servern och exekverat för att konfigurera servern. Nu ska vi uppgradera oss och göra detta i Ansible istället.

I följande playlist, kollar på videorna med `30x`i namnet för att bekanta er med vad som finns i Ansible mappen i Microblog repot.

[INFO]
All info om hur ni ska identifiera er mot Azure från Ansible är numera felaktig i materialet nedanför. I videon pratas det om att ni ska skapa en fil som heter `credentials` och den ska ni skriva era inloggningsuppgifter för Azure. Det funkar inte längre för att vi använda multi-factor authentication.

Istället behöver ni installera terminalverktyget `az`, i WSL. Ni hittar instruktioner för det här, [How to install the Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest), välj linux instruktionerna. När ni har installerat det kör kommandot `az login`. Med det kommandot loggar ni in på Azure och samtidigt sparas en JWT token på din dator som Ansible kan använda för att autentisera mot Azure.

Efter detta ska Ansible mot Azure funka utan att ni behöver göra mer. Dock är kommandot bara den token som sparas giltig en viss tid, senare kan ni behöva köra `az login` igen för att skapa en ny token.
[/INFO]

- [kursen devops](https://www.youtube.com/playlist?list=PLKtP9l5q3ce8s67TUj2qS85C4g1pbrx78).



### 10 first minutes on a server i Ansible {#10-first}

Nästa steg är att skapa er egna playbook för 10 first minutes on a server, kolla på videorna med `31x` i namnet och skapa en playbook för 10-first-minutes skripten.  
**Notera** några rättelser i videon:

- I videon används `gather_aws_instances.yml`, ni ska istället använda `gather_vm_instances.yml`.

- Ni ska även ändra `remote_user` från `admin` till `azureuser`.

- Kolla nu på videorna 31x i [kursen devops](https://www.youtube.com/playlist?list=PLKtP9l5q3ce8s67TUj2qS85C4g1pbrx78)



### Playbooks för app strukturen {#app_structure}

Nu har vi en grund att utgå från, vi har tre servrar som är konfigurerade och installerade som en grund server. Nästa steg är att konfigurerar varje server för sig. 

Ni ska nu skapa en playbook för att sätta upp databasen på en server, applikationen på en och en load balancer på den sista. När vi bara hade en server använde vi Nginx som en reverse proxy för att skicka vidare requests till Flask appen. Nu ska vi använda Nginx som en load balancer istället. Med Nginx som en load balancer istället för en reverse proxy kan vi lätta utöka antalet applikations servrar när vår hemsida blir populär och besöks antalet ökar.

I Ansible, i era playbooks använd host namnet `database` för installationen av databasen, `appServer` för er servern med Microblog och `loadBalancer` för Nginx.

**Tips** Skapa en playbook som bara installerar Docker. Den kan ni återanvända för `appServer` och `database`.

#### Database playbook {#database_pb}

Skapa en playbook som startar en Docker container med MySQL på servern. Ni kan **inte** använda hashade lösenord, MySql klara inte av det. De måste vara i plain-text. 

När ni startar containern skicka också med `- MYSQL_ROOT_PASSWORD=<password>` som environment variabel, ni kommer använda det i kmom04.



#### Applikations playbook {#app_pb}

Skapa en playbook som startar en Docker container med er senaste Microblog imagen på servern. När ni ska koppla Flask appen till databasen behöver ni IP addressen för databas servern, ni kan inte längre använda er av Dockers länkning för att de körs på två olika maskiner. I ansible kan ni använda `{{ groups.database[0] }}` för att få ut IP för databas hosten. **Tips** om ni inte lyckas koppla upp er mot database kan ni logga in på er VM och köra `docker logs <microblog container namn>` för att se loggen för docker containern.

Ni behöver inte längre installera Supervisor på appServern, nu ska Docker se till att det alltid finns en applikation körandes.



#### Load balancer playbook {#lb_pb}

Skapa en playbook som installerar Nginx och konfigurerar det som en load balancer. Nginx ska skicka vidare requests till applikations servern. Vi har bara en applikations server än så länge så en load balancer tillför inte direkt något, men det är bra att känna till hur man gör en load balancer.

Läs Nginxs dokumentation om att skapa en load balancer. Vad de inte skriver är att vi inte kan lägga ett `http` block i ett annat `http` block. Vilket vi gör om vi bara skapar en ny host i `/etc/nginx/sites-available`. Detta gör att vi måste ändra på config filen `/etc/nginx/nginx.conf`.

- [Nginx load balancer](https://nginx.org/en/docs/http/load_balancing.html).

- Ni kan hitta två config filer för Nginx som load balancer på [Gist](https://gist.github.com/AndreasArne/58374253123a31bb7c32e2b551fe8492).

Använd [template](https://docs.ansible.com/ansible/latest/modules/template_module.html) modulen i Ansible för att flytta conf filerna. Notera variablerna i `load-balancer.conf.j2` som ni behöver ha värden till i Ansible.

- `nginx.conf.j2` till `/etc/nginx/nginx.conf`

- `load-balancer.conf.j2` till `/etc/nginx/sites-available/load-balancer.conf`.

Ni kan använda [file](https://docs.ansible.com/ansible/latest/modules/file_module.html?highlight=file) modulen för att länka `load-balancer.conf` till `sites-enabled` mappen.

**Tips** Ni hittar logfilerna för Nginx i `/var/log/nginx`. Om en konfig fil inte fungerar kan ni köra `nginx -t` för att validera den.

<!-- Tänk på att ni kan använda `sudo nginx -t` som `validate` steg, på tasks i Ansible, för att validera er Nginx konfiguration. -->

För att få till HTTPS via Ansible kolla nedanför.



##### HTTPS via Ansible {#https-ansible}

Det finns flera metoder för att få till HTTPS, vissa svårare än andra. Ni kan välja själva om ni tar genvägen och kolla på hur jag har gjort eller lösa det själva. För mitt sätt, kolla gist länken nedanför.

- [Ansible kod för Nginx](https://gist.github.com/AndreasArne/6b627f15aabeecd435abd1e8e11f96c8). Se till att det ligger överst i er `main.yml` för Nginx installationen annars kan det blir problem med config filerna.



### Ansible på GitHub Actions för CD {#cd}

Vi kommer bara göra en väldigt simpel CD kedja som bara hanterar att uppdatera microblogen. Hur gör vi med ändringar i Nginx eller databasen? Vi nöjer oss med att bara klara av att uppdatera Microbloggen via CD och sköter databasen och Nginx manuellt men vi kan tänka på hur vi skulle gjort. Egentligen borde vi kanske dela upp vårt repo i tre stycken, en för vår load balancer, en för microblog och en för databasen. Då krävs tre separate utvecklings miljöer med Ansible och Makefiler. Men vi hade kunnat få till en bra uppdelning och minskat mängden filer och kod (speciellt i Ansible). En annan lösning är att börja med mer "ordentliga" commit meddelanden och ge den en specifik struktur. T.ex. lägga till taggar i dem och beroende på vilken tag som finns i meddelandet kör vi olika jobb på CircleCi. Det sista alternativet är nog det som är lättast för oss och det vi hade valt. Medan om vi jobbade på ett större projekt hade vi i slutändan tjänat på att dela upp repot i flera mindre.

- Läs en snabb överblick av olika [Deployment strategies](https://www.baeldung.com/ops/deployment-strategies).

[INFO]
På grund av den nya multi-factor authentication som används på våra konton kan vi logga in på Azure i Ansible från Actions.

Nedanför kan ni se hur en workflow fil kan se ut om det gamla sättet att logga in hade fungerat.
[/INFO]

```yml
name: Deploy microblog

on:
  workflow_call:
  push:
    branches: [ "master" ]
  pull_request:
    branches: [ "master" ]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3
    - name: Create .azure folder
      run: mkdir ~/.azure
    - name: Write credentials
      run: echo "${{ secrets.AZURE_CREDENTIALS }}" | base64 -d > ~/.azure/credentials

    - name: Cache pip
      uses: actions/setup-python@v3
      with:
        python-version: "3.9"
        cache: 'pip'
        cache-dependency-path: |
          requirements/deploy.txt
          ansible/requirements.yml
    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install -r requirements/deploy.txt
        cd ansible && ansible-galaxy install -r requirements.yml

    - name: Setup SSH 
      shell: bash
      run: |
        eval `ssh-agent -s`
        mkdir -p /home/runner/.ssh/
        touch /home/runner/.ssh/id_rsa
        echo -e "${{secrets.SSH_PRIVATE_KEY}}" > /home/runner/.ssh/id_rsa
        chmod 700 /home/runner/.ssh/id_rsa

    - name: Run playbook
      run: cd ansible/ && ansible-playbook gather_az_instances.yml deploy_app.yml

```
<!--

För att ni ska kunna använda Ansible i Action behöver ni fixa två saker.

1. Ansible behöver kunna logga in på Azure.

2. Ansible behöver kunna SSH:a till Microblog servern.



#### Lägg till Azure credentials i GitHub Actions {#cred_actions}

Inloggnings uppgifterna till Azure är känslig data, det kan vi inte bara lägg i en fil i vårt repo och sen pusha. Utan vi behöver spara det som SECRET i GitHub. Men det ställer till problem för oss för att vi har begränsningar på våra konton. Därför behöver vi göra en lite workaround för att få det att fungera. Vi ska använda [base64](https://en.wikipedia.org/wiki/Base64) för att göra om teckenkodningen för vår inloggningsdata.

Kör följande på din dator.

```
base64 -i ~/.azure/credentials
```

Kopiera utskriften och lägg till som en ny SECRET i ditt repo på GitHub.

Sen när ni skapar en nya workflow fil, i den behöver ni följande för att hämta inloggningsuppgifterna.

```yml
    - name: Create .azure folder
      run: mkdir ~/.azure
    - name: Write credentials
      run: echo "${{ secrets.AZURE_CREDENTIALS }}" | base64 -d > ~/.azure/credentials

```

Vi skapar `.azure` mappen, återställer den omgjorda texten och skriver ner den till `.azure/credentials`. Nu kan Ansible logga in på Azure.



#### Möjliggör SSH från Actions till en server {#ssh_actions} 

För att komma åt våra virtuella maskiner krävs specifika SSH key files. Det gör att de nycklarna behöver finnas tillgängliga i GitHub Actions.

```
cat ~/.ssh/azure
```

Kopiera utskriften och lägg till som en SECRET i ert repo på GitHub.

För att använda nyckeln i ett workflow behöver ni:

```yml
    - name: Setup SSH 
      shell: bash
      run: |
        eval `ssh-agent -s`
        mkdir -p /home/runner/.ssh/
        touch /home/runner/.ssh/id_rsa
        echo -e "${{secrets.SSH_PRIVATE_KEY}}" > /home/runner/.ssh/id_rsa
        chmod 700 /home/runner/.ssh/id_rsa
```

Nu är ni redo att skapa ett nytt workflow där ni kör `gather_vm_instances.yml` och `deploy_app.yml`.
-->


### Video {#video}

Det finns generellt kursmaterial i video form.

1. Kursen innehåller föreläsningar som spelas in och därefter läggs i spellistan "[devops streams ht22](https://www.youtube.com/playlist?list=PLKtP9l5q3ce8t5NnxhZIJC69_FL55FzNV)".

1. I "[kursen devops](https://www.youtube.com/playlist?list=PLKtP9l5q3ce8s67TUj2qS85C4g1pbrx78)" hittar du alla videor som är kopplade till kursmomentet, de börjar på 3xx i namnet.



### Uppgifter {#uppgifter}

Följande uppgifter skall utföras och resultatet skall redovisas via me-sidan.

1. Använd Ansible för att skapa och konfigurera tre servrar. En som databas, en till microblogen och en som load-balancer.

<!-- 1. Utöka GitHub Actions så att om testerna går igenom och en ny Docker image byggs ska den driftsättas på `appServer`. Med andra ord sätt upp Continuous Deployment. -->

1. Försäkra dig om att du har pushat repot med din senaste kod och taggat din inlämning med version v13.0.0, om du pushar kmom03 flera gånger kan du öka siffrorna efter 13:an.

<!-- 1. Skriv skript som kollar om service är uppe, om inte kör ansible för att sätta upp annars bara uppdatera. (En deployer node?) -->


### Lästips {#lastips}

1. Hur man kan hantera flera [användare på produktionsservern med Ansible](https://www.cogini.com/blog/managing-user-accounts-with-ansible/). 



Läsanvisningar {#las}
--------------------------

I kursen ska ni läsa boken **[Effective DevOps](http://tinyurl.com/y6jy5x8u)**. Boken är inte kopplad till kursmomenten, men den behövs när ni ska skriva rapporten i slutet av kursen. Ni kan själva välja upplägg för när ni läser den. Ett rekommenderat upplägg är att läsa en del, "part", i veckan. Då har ni läst igenom hela boken efter kmom06.

Rekommendationen för denna veckan är att läsa **"Part III. Affinity"**.


Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i texten:

1. Vad är IaC?

1. Vad är CM?

1. Vad är fördelarna med IaC och CM jämfört med att sätta upp allt manuellt?

1. Vad är Continuous Deployment?

1. Kan du se några problem med vår CI/CD kedja (tänk hur den skulle sätt ut om Azure hade funkat för oss)?

1. Om du fick välja fritt hur skulle du vilja bygga upp CD kedjan?

1. Hur var storleken på kursmomentet? Har du haft tid över så att du hade hunnit med att driftsätta via Github Actions?
