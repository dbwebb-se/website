---
author:
    - aar
revision:
    "2020-11-13": "(B, aar) Bytt från AWS till Azure."
    "2019-07-29": "(A, aar) Första versionen."
...
Kmom03: Configuration Management och Continuous Deployment
==================================

Vi fortsätter med att kolla in fler sätt att automatisera flöden. Vi lär oss Ansible för Configuration Management (CM) och Infrastructure as Code (IaC). Tillsammans med Ansible och GitHub Actions ska vi också utveckla vår Continuous Delivery till Continuous Deployment (också CD).

[WARNING]
Kurs under utveckling!

Påbörja inte före denna rutan är borta.
[/WARNING]

<!-- more -->

**Skriv att de ska lägga till `-r deploy.txt` i requirements/dev.txt.**


[FIGURE src="https://www.gocd.org/assets/images/blog/continous-delivery-vs-deployment-infographic/continuous-delivery-vs-continuous-deployment-infographic-305dd620.png"]



Nästa steg i vår miljö är att utöka antalet servrar från en till tre. Vi ska bygga en klassisk webbapp struktur, en server för databasen, en för appen och en som load balancer (Nginx, fungerade som proxy tidigare). Med systemet vi har nu, att kopiera bash filer till servern och exekvera manuellt är inte hållbart inom devops. Vi ska utnyttja kraften av Configuration Management verktyget Ansible för att uppnå denna strukturen på att hållbart sätt. Vi flyttar över funktionaliteten från bash skripten till Ansible, som kan utföra samma sak på flera servrar samtidigt. Vi ska skapa och stänga ner servrar med ett kommando, installera och konfigurera dem och tillslut ha ett kommando för att sätta upp hela produktionsmiljön, från zero to hero!

[INFO]
Innan ni sätter igång med kursmomentet kolla att ert Microblog repo är synkat med originalet, [Syncing a fork](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/syncing-a-fork).
[/INFO]




## Infrastructure as Code och Configuration Management {#iac-cm}

Infrastructure as Code (IaC) innebär att behandla sin infrastruktur (servrar) som software, det ska vara definierat i kod och versionshanterat. Configuration Management (CM) är typ samma sak fast med fokus på mjukvaran som körs på servrarna. Att skapa använda, installera program och konfigurera dem ska göras via kod.

### Läs och titta {#cm-read}

- [Why use IaC](https://medium.com/cloudnativeinfra/why-use-infrastructure-as-code-881ccd6c4290).

- [An introduction to Congifuration Management](https://www.digitalocean.com/community/tutorials/an-introduction-to-configuration-management).

- [When to use which IaC/CM tool](https://medium.com/cloudnativeinfra/when-to-use-which-infrastructure-as-code-tool-665af289fbde).




## Ansible {#ansible}

Ansible är ett verktyg för att automatisera serverkonfiguration. Läs om följande artiklar om Ansible.


### Läs och titta {#ansible-read}

- [Ansibles grundkoncept](https://docs.ansible.com/ansible/latest/network/getting_started/basic_concepts.html).

- Introduktion till att [använda Ansible](https://www.digitalocean.com/community/tutorials/configuration-management-101-writing-ansible-playbooks).

- Ansible [Best Practices](https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html).



### Att göra {#ansible-do}

- Gör fyra scenario på Killerkoda för att lära er Ansible, [Ansible 101](https://killercoda.com/ansible). Gör de som heter "Ansible 10X(2.11) English", det är fyra stycken.
<!-- Koden för killercoda https://github.com/irixjp/katacoda-scenarios
De har använt denna som referens material https://github.com/ansible/workshops
-->


Kan börja använda ansible-lint undertiden.



## Bekanta er med Ansible koden {#ansible-code}

Än så länge har vi manuellt kör kommandon på servern. Nu ska vi uppgradera oss och göra detta i Ansible istället.

Först, [installer Azure-CLI](./../labbmiljo/azure-cli) och lägg till `-r deploy.txt` i `requirements/dev.txt`. Installera Ansible paketen med `make install-dev``.`

### Läs och titta {#code-read}

- Kolla på videorna med `30x`i namnet för att bekanta er med vad som finns i Ansible mappen i Microblog repot. [kursen devops spellista](https://www.youtube.com/playlist?list=PLKtP9l5q3ce8s67TUj2qS85C4g1pbrx78).

- [kursen devops](https://www.youtube.com/playlist?list=PLKtP9l5q3ce8s67TUj2qS85C4g1pbrx78).



## Continuous Deployment (CD) {#cd}

Vi ska gå steget längre och gå från Continuous Delivery till Deployment.

### Läs och titta {#cd-read}

- [The fundamentals of continuous deployment in DevOps](https://resources.github.com/devops/fundamentals/ci-cd/deployment/).

- [Deployment Strategies](https://www.baeldung.com/ops/deployment-strategies)



### Ny struktur i molnet {#cloud}

I uppgifterna ska ni öka antalet servrar som används för produktionsmiljön. Om det Microbloggen blir en superhit och ni får jättemånga användare, då är nog er billiga VM för dålig för att hantera all trafik. En lösning är att köpa en större VM och fortsätta ha allt på den. En annan lösning är att dela upp de olika delarna på flera VM's. Då blir det också lättare om vi skulle behöva utöka ännu mer i framtiden.

Den ny strukturen är att vi har en egen VM för databasen och två olika VM's för microbloggen. Båda kör en varsin kopia av Microblog och är kopplade till samma databas. På det sättet kan vi sprida ut hanteringen av request på två olika VM's och kan hantera fler besökare. Förutsatt att databasen kan hantera request från två olika källor samtidigt på ett bra sätt, det borde inte vara några problem. Steget vi har kvar är att koppla ett domännamn till båda Microblog VM's. Det kan vi använda en load balancer till. Vi sätter Nginx som en load balancer istället för en reverse proxy på en VM och låter den dela upp inkommande requests till de båda Microblog VM's.

[FIGURE src="image/devops/azure-structure.png" caption="VM struktur på Azure."]

*På bilden har loadbalancer och databasen speciella ikoner men det är fortfarande vanliga VM's vi ska använda.*

### Läs och titta {#cloud-read}

- [Nginx load balancer](https://nginx.org/en/docs/http/load_balancing.html).

I länken ovanför skriver de inte att vi inte kan lägga ett `http` block i ett annat `http` block. Vilket vi gör om vi bara skapar en ny host i `/etc/nginx/sites-available`. Detta gör att vi måste ändra på config filen `/etc/nginx/nginx.conf`. Hur vi gör det finns i en länk bland uppgifterna.



## Lästips {#lastips}

1. Hur man kan hantera flera [användare på produktionsservern med Ansible](https://www.cogini.com/blog/managing-user-accounts-with-ansible/). 



Läsanvisningar {#read}
--------------------------

Läsanvisningar hittar ni på sidan [bokcirkel](./../bokcirkel).

Kolla i [lektionsplanen](https://dbwebb.se/devops/lektionsplan) för att se när vi träffas för bokcirkeln.



Uppgifter  {#uppgifter}
-------------------------------------------

1. Uppdatera provision Playbook så att fyra servrar skapas.
  - En `loadbalancer`, en `database` och två `appserver`, som heter `appserver1` och `appserver2`.
  - Appservrarna ska dela security group.
  - Lägg till två subdomäner där de går till varsin `appserver`. De ska heta `appserver1.<domännamn>` och `appserver2.<domännamn>`.
  - Uppdatera `gather_instances` så att det skapas en hosts grupp som heter `appserver` och går till `appserver1` och `appserver2`. Tips. använd er av `item.tags.Type`.

2. Sätt upp [Microbloggen med Ansible](uppgift/microblog-ansible).

3. Implementera en Continuous Deployment strategi med Ansible och Github Actions.
  - Vid ny release ska Actions köra Ansible playbooks som gör en valbar CD strategi för att driftsätta den nya versionen.
    - Er strategi ska inte ha någon downtime, så ni kan inte använda Recreate Deployment Strategy.
    - Från GitHub Actions kan ni inte koppla upp er mot Azure och köra `gather_instances`. Därför la vi till att skapa subdomänerna i första uppgiften.
    - I filen `ansible/hosts`, lägg till ny hosts som går till `appserver1.<domännamn>` och `appserver2.<domännamn>`. Då kan ni använda de hosts i er nya CD Playbook. Ni får lägga till fler hosts om det behövs.
  - En avslutande del i er CD playbook ska verifiera att rätt version av Microblog körs på produktionsservrarna.

4. På Microbloggen, lägg till en ny route som visar vilken version av appen som körs.
  - Lägg till ett test som testar att det routen fungerar.



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

Svara på nedanstående frågor individuellt, lämna in på Canvas tillsammans med länken till ert gemensamma GitHub-repo och domännamn till microblog sidan.

1. Vad är CM?

1. Vad menas med Idempotency inom CM och IaC?

1. Vad är fördelarna med IaC och CM jämfört med att sätta upp allt manuellt?

1. Vilken CD strategi valde ni?

1. Kan du se några problem med er CI/CD kedja?

1. Om du fick välja fritt hur skulle du vilja bygga upp CD kedjan?

1. Hur var storleken på kursmomentet?
