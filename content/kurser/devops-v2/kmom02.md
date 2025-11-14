---
author:
    - aar
revision:
    "2025-11-14": "(B, aar) Flyttat runt texten och gjort om för att de inte skapar någon VM i kmom01. Ger mer färdig kod."
    "2023-11-09": "(A, aar) Första versionen."
...
Kmom02: Configuration Management och Continuous Deployment
==================================



I kmom01 fixade ni en utvecklingsmiljö och CI/CD. I detta kmom ska vi sätta upp en produktionsmiljö och ut utveckla CD kedjan till Continues Deployment.

<!-- more -->

PS! Kmom02 är två veckor långt!

[FIGURE src="https://www.gocd.org/assets/images/blog/continous-delivery-vs-deployment-infographic/continuous-delivery-vs-continuous-deployment-infographic-305dd620.png"]


Vi ska bygga en klassisk webbapp struktur, en server för databasen, flera för appen och en som load balancer. För detta behöver vi fyra VM's i Azure. Vi ska utnyttja kraften av Configuration Management verktyget Ansible för att på ett hållbart sätt skapa och konfigurera servrarna i Azure. Vi ska skapa och stänga ner servrar med ett kommando, installera och konfigurera dem och tillslut ha ett kommando för att sätta upp hela produktionsmiljön, från zero to hero!

[INFO]
Innan ni sätter igång med kursmomentet kolla att ert Microblog repo är synkat med originalet, [Syncing a fork](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/syncing-a-fork).
[/INFO]



## Läsanvisningar {#read}

Läsanvisningar hittar ni på sidan [bokcirkel](./../bokcirkel).

Kolla i [lektionsplanen](https://dbwebb.se/devops/lektionsplan) för att se när vi träffas för bokcirkeln.



## Produktions miljö {#prod}

När man jobbar enligt devops ska saker ofta gå snabbt och automatiskt, då underlättar det om man snabbt och enkelt kan starta upp och stänga ner servrar. Därför ska vi använda oss av en molntjänst, mer specifikt [Microsoft Azure](https://azure.microsoft.com/en-us/). OBS! logga inte in via den länken.



### Struktur i molnet {#cloud}

Om er Microblog blir en superhit och ni får jättemånga användare behöver ni en strategi för att hantera all trafik. En lösning är att köpa en större VM och fortsätta ha allt på den. En annan lösning är att dela upp de olika delarna på flera VM's. Då blir det också lättare om vi skulle behöva utöka ännu mer i framtiden.

Strukturen är att vi har en egen VM för databasen och två olika VM's för Microblog. Båda kör en varsin kopia av Microblog och är kopplade till samma databas. På det sättet kan vi sprida ut hanteringen av request på två olika VM's och kan hantera fler besökare. Förutsatt att databasen kan hantera request från två olika källor samtidigt på ett bra sätt, det borde inte vara några problem än så länge.

Steget vi har kvar är att koppla ett domännamn till båda Microblog VM's. Det kan vi använda en load balancer. Vi sätter Nginx som en load balancer och låter den dela upp inkommande requests till de båda Microblog VM's.

[FIGURE src="image/devops/azure-structure.png" caption="VM struktur på Azure."]

_På bilden har loadbalancer och databasen speciella ikoner men det är fortfarande vanliga VM's vi ska använda._



### Att göra {#prod-do}

Jobba igenom:

- [Kom igång med Azure](guide/kom-igang-med-azure). I guiden visas hur ni skapar en VM manuellt. Ni ska inte använda den i kursen utan vi kommer skapa nya med Ansible kod istället. Det är dock bra att veta hur man gör det manuellt också.
- Radera den VM du skapade precis. OBS! Du ska ha kvar ssh-key, DNZ zone, resursgruppen och prenumeration. Övriga resurser ska raderas. Vi kommer skapa nya med Ansible.

## Infrastructure as Code och Configuration Management {#iac-cm}

Infrastructure as Code (IaC) innebär att behandla sin infrastruktur (servrar) som mjukvara, det ska vara definierat i kod och versionshanterat. Configuration Management (CM) är typ samma sak fast med fokus på mjukvaran som körs på servrarna, att skapa använda, installera program och konfigurera dem ska göras via kod.



### Läs och titta {#cm-read}

- [An introduction to Congifuration Management](https://www.digitalocean.com/community/tutorials/an-introduction-to-configuration-management).

- [When to use which IaC/CM tool](https://medium.com/cloudnativeinfra/when-to-use-which-infrastructure-as-code-tool-665af289fbde).



## Ansible {#ansible}

Låt oss lära oss mer om Ansible.

[INFO]
Tips. När ni jobbar med Ansible koden, använd er av [dokumentationen](https://docs.ansible.com/ansible/latest/) för att hitta moduler och hur de funkar! Den är bra.
[/INFO]


### Läs och titta {#ansible-read}

- [What Is Ansible](https://www.youtube.com/watch?v=1id6ERvfozo).

- Introduktion till att [använda Ansible](https://www.digitalocean.com/community/tutorials/configuration-management-101-writing-ansible-playbooks).

- Ansible [Best Practices](https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html).

Jag har fått som kommentar att studenterna vill ha mer Ansible material så här är två olika spellistor för de som vill har mer om Ansible. Ni kan testa skippa dem och jobba vidare. Om ni upplever att ni behöver lära er mer så kan ni gå tillbaka till någon av dessa spellistor.

- [Getting Started with Ansible](https://www.youtube.com/watch?v=3RiVKs8GHYQ&list=PLT98CRl2KxKEUHie1m24-wkyHpEsa4Y70)
- [Ansible 101](https://www.jeffgeerling.com/blog/2020/ansible-101-jeff-geerling-youtube-streaming-series)



### Att göra {#ansible-do}

- Gör fyra scenario på Killerkoda för att lära er Ansible, [Ansible 101](https://killercoda.com/ansible). Gör de som heter "Ansible 10X(2.11) English", det är fyra stycken.
<!-- Koden för killercoda https://github.com/irixjp/katacoda-scenarios
De har använt denna som referens material https://github.com/ansible/workshops
-->



## Bekanta er med Ansible koden {#ansible-code}

Låt oss kolla på Ansible koden som redan finns i Microblog repot.

Först, [installer Azure-CLI](./../labbmiljo/azure-cli) om du inte gjorde det i kmom01. Installera sen Ansible paketen med `make install-dev`.



### Läs och titta {#code-read}

- Kolla på videorna med `20x`i namnet för att bekanta er med vad som finns i Ansible mappen i Microblog repot, [kursen devops](https://www.youtube.com/playlist?list=PLKtP9l5q3ce8s67TUj2qS85C4g1pbrx78). Några saker kan skilja sig från koden som visas i videorna men det ska inte vara några stora ändringar.
    - Videorna prata inte om koden som ligger i `deploy_lb`. Den får ni läsa och förstå själva.

- Om ni vill hänga med och skriva 10-first-minutes själva så kan ni kolla på videorna med "21x" i namnet. Videorna är lite utdaterade när det kommer till hur man exekverar filerna. Då pratar jag om AWS men om ni har kollat på de andra videorna så vet ni hur man exekverar filerna.



### Att göra {#provision-do}

1. Uppdatera er provision Playbook så att fyra servrar skapas.

    - En `loadbalancer`, en `database` och två `appserver`, en som heter `appserver1` och en `appserver2`.
    - Appservrarna ska dela security group.
    - Lägg till två subdomäner som går till varsin `appserver`. De ska heta `appserver1.<domännamn>` och `appserver2.<domännamn>`.
    - Skapa en hosts fil och lägg till subdomänerna som hosts. PS. Namnge inte dem till samma groups/hosts namn som gather_instances skriptet ger.
1. 
    - Uppdatera "10-first-minutes" Playbook så att alla gruppmedlemmars SSH-nycklar läggs till i authorized_keys. I modulen [ansible-role-users](https://github.com/cogini/ansible-role-users/blob/master/tasks/main.yml#L108) kan ni se ett exempel på hur man kan göra det. Då behöver ni ladda upp allas **publika** nycklar i ert repo. Det är säkert att ladda upp de publika nycklarna. De kan inte användas för att återskapa den privata.
    - Kör "10-first-minuets" mot alla fyra VMs.



## Continuous Deployment (CD) {#cd}

Vi ska utöka från Continuous Delivery till Deployment.

### Läs och titta {#cd-read}

- [The fundamentals of continuous deployment in DevOps](https://resources.github.com/devops/fundamentals/ci-cd/deployment/).

- [Deployment Strategies](https://www.baeldung.com/ops/deployment-strategies)



### SSH från Github Actions till VM's {#ssh}

När ni ska implementera er CD strategi behöver ni kunna logga in med SSH från GitHub Action till era servrar. Hur ni gör det kan ni hitta i [Kör playbook på VM från GigHub Action](coachen/ansible-till-azure-vm).



## Sätta upp Nginx som en Load balancer {#nginx}

Vi ska köra Nginx som Load balancer, här lär vi oss mer om Nginx.

### Läs och titta {#nginx-read}

- [Nginx Tutorial for Beginners](https://www.youtube.com/watch?v=9t9Mp0BGnyI).
- [Beginner’s Guide to NGINX Configuration Files](https://medium.com/adrixus/beginners-guide-to-nginx-configuration-files-527fcd6d5efd).
- [Nginx load balancer](https://nginx.org/en/docs/http/load_balancing.html).

I länken ovanför skriver de inte att vi inte kan lägga ett `http` block i ett annat `http` block. Vilket vi gör om vi bara skapar en ny host i `/etc/nginx/sites-available`. Detta gör att vi måste ändra på config filen `/etc/nginx/nginx.conf`.




## Lästips {#lastips}

1. Hur man kan hantera flera [användare på produktionsservern med Ansible](https://www.cogini.com/blog/managing-user-accounts-with-ansible/).


## Uppgifter {#uppgifter}

1. I Azure ska ni ha strukturen med fyra VMs, en Load balancer, två app servrar och en databas server. Provision playbook:en ska kunna sätta upp hela miljön från.

1. Sätt upp [Microbloggen med Ansible](uppgift/microblog-ansible-v2).

1. Implementera en Continuous Deployment strategi med Ansible och Github Actions.

    - Vid ny tag ska Actions köra Ansible playbooks som gör en valbar CD strategi för att driftsätta den nya versionen.
    - Er strategi ska inte ha någon downtime, så ni kan inte använda Recreate Deployment Strategy.
    - En avslutande del i er CD playbook ska verifiera att rätt version av Microblog körs på produktionsservrarna.

1. På Microbloggen, lägg till en ny route som visar vilken version av appen som körs på servern.
    - Lägg till ett test som testar att det routen fungerar.



## Resultat & Redovisning {#resultat_redovisning}

Svara på nedanstående frågor individuellt, lämna in på Canvas tillsammans med länken till ert gemensamma GitHub-repo och domännamn till microblog sidan.

1. Vad menas med Idempotency inom CM och IaC?

1. Vilket av CM/IaC verktygen som presenterades i "When to use which IaC/CM tool" tycker du lät mest intressant och varför?

1. Vilken CD strategi valde ni?

1. Kan du se några problem med er CI/CD kedja?

1. Om du fick välja fritt hur skulle du vilja bygga upp CD kedjan?

1. Hur var storleken på kursmomentet?

1. Veckans TIL?
