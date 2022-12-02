---
author:
    - aar
revision:
    "2020-11-19": "(B, aar) Släppt för HT20."
    "2019-10-15": "(A, aar) Första versionen."
...
Kmom04: Monitoring
==================================

Nu när vi har ett system uppe och rullande behöver vi veta när något går fel, vi ska övervaka hela produktionsmiljön och alla dess delar.

<!-- more -->


[FIGURE src="https://upload.wikimedia.org/wikipedia/commons/d/d2/IoT_environmental_monitoring_system_solution_-_Overview.jpg" caption="Överblick av olika delar som kan ingå i ett system med övervakning."]



<!-- https://old.reddit.com/r/devops/comments/afqye3/whats_your_monitoring_and_alerting_stack_look_like/
https://itnext.io/deploy-elk-stack-in-docker-to-monitor-containers-c647d7e2bfcd
 -->
 
<!-- Elastic stack
https://logz.io/blog/10-elasticsearch-concepts/
https://github.com/nickjj/ansible-docker
https://www.guru99.com/elk-stack-tutorial.html
    Ny instance med t2.small
    Ny SG
    RP i LB nod för ELK
    Installera Beats på övriga instancer
    +1 app instance?
    Om de kör provision igen för att bara få upp ELK kommer det även starta upp en till av varje annan!!
    load balancer - https://galaxy.ansible.com/entercloudsuite/filebeat
        https -> http, enabled -> started?
    galaxy https://blog.ktz.me/getting-started-with-ansible-galaxy/
 -->


### Monitoring {#monitoring}

När system ligger utspridda på virtuelle servrar jorden runt är det inte lätt att hålla koll på att alla servrar och system hela tiden är igång. Här kommer infrastruktur monitoring in i bilden men vi kan också ha application monitoring där vi övervakar metrics från system. T.ex. hur många request varje server har fått eller hur många 404 requests.

Läs Microsofts förklaring av [Monitoring](https://docs.microsoft.com/en-us/azure/devops/learn/what-is-monitoring).

Läs sen [Monitoring in a DevOps world](https://queue.acm.org/detail.cfm?id=3178371).



### Log management {#log}

Log management är processen av att samla in, lagra, hantera och analysera loggar från infrastruktur, system och applikation. Det är ett väldigt brett ämne då typ allt genererar loggar av något slag och system för att sköta log hantering är väldigt avancerade. För att få en överblick av delarna som ingår i log management och vilken användning olika roller har av log management läs följande:

- [What is log management](https://www.tripwire.com/state-of-security/security-data-protection/security-controls/what-is-log-management/).

- [Why is log management important](https://www.graylog.org/post/why-is-log-management-important).

Läs också en snabb överblick av [ELK stack](https://www.guru99.com/elk-stack-tutorial.html) för en överblick av ett av de mest populära systemen för Log management.



### Application performance monitoring (APM) {#apm}

APM kan även kallas Application Performance Management (också APM), enligt vissa är det skillnad. APM är att övervaka, hantera och diagnosera prestanda, tillgänglighet och användare upplevelse av applikationer. Avancerade program används för att göra om data till "business value".

Läs [What is application performace monitoring](https://www.eginnovations.com/blog/what-is-application-performance-monitoring/).



### Observability {#observability}

På senare år har det även börjat talas mycket om Observability vilket hänger ihop med monitoring. Vi kan se monitoring som att ha kolla på hälsan av våra system medan observability är att ha djup insikt i hur våra system beter sig. Observability ska hjälpa oss hitta fel och problem.

Läs [Observability sv. Monitoring](https://dzone.com/articles/observability-vs-monitoring).

Om ni vill kan ni även kolla på [What Does the Future Hold for Observability?](https://www.youtube.com/watch?v=MkSdvPdS1oA)



### Prometheus och Grafana {#prometheus}

Vi ska använda oss av [Prometheus](https://prometheus.io/), ett väldigt populärt verktyg för att lagra tidsserie data och visualisera data. Prometheus har inbyggt stöd för att visa simpla grafer för data men oftast använder man det tillsammans med externa visualiseringsverktyg. Vi ska använda [Grafana](https://grafana.com/) för att bygga dashboards med grafer och diagram över datan från Prometheus.

Läs [Prometheus Monitoring : The Definitive Guide in 2019](https://devconnected.com/the-definitive-guide-to-prometheus-in-2019/) för en överblick av vad Prometheus är och vad det innehåller.

När ni sen har lite kolla på hur Prometheus fungerar ska ni testa installera Prometheus, Grafana och koppla ihop dem.

- Kolla på videorna 401-403 i spellistan [kursen devops](https://www.youtube.com/watch?v=u84GyxLGdEo&list=PLKtP9l5q3ce8s67TUj2qS85C4g1pbrx78&index=12). Gör det lokalt på er dator för att testa få det att fungera.

Nu är tanken att ni ska sätta upp den miljön på en ny VM. Kolla på följande video, för att se hur ni kan uppdatera Ansible skripten för att skapa en till VM.

[YOUTUBE src=LnSJKDLgsps  caption="Skapa en Monitoring instance på Azure med Ansible"]

- Skapa nu en ny playbook där ni sätter upp en node exporter, prometheus och Grafana på er nya monitor VM.

- Använd er av modulerna [Grafana datasources](https://docs.ansible.com/ansible/latest/collections/community/grafana/grafana_datasource_module.html) och [dashboards](https://docs.ansible.com/ansible/latest/collections/community/grafana/grafana_dashboard_module.html) för att automatiskt lägga till prometheus som data källa och `Node Exporter Full` som dashboard.
    - **Notera** att ni behöver installera `community.grafana` i ansible-galaxy innan ni kan använda modulerna. Lägg till `community.grafana` i `ansible/requirements.yml` kör sen `ansible-galaxy install -r ansible/requirements.yml`.
- Ni behöver **inte** koppla ihop er dashboard och datasource i Ansible koden. Modulerna saknar stöd för det. Bara skapa dem via Ansible och sen får ni koppla ihop dem manuellt.

Nu ska ni ha en övervakningsmiljö uppsatt på en ny VM! Nästa steg är att aktivera fler exportörer och koppla dem till Prometheus.




#### Flask appen {#app}

Vi vill så klart visualisera hur själva flask appen mår i Grafana.

- Jobba igenom videorna med siffrorna 41x i titeln i spellistan [kursen devops](https://www.youtube.com/playlist?list=PLKtP9l5q3ce8s67TUj2qS85C4g1pbrx78).

- Uppdatera er Ansible kod så att den sätter upp den nya dashboard:en när man kör er monitor playbook.




### MySQL {#mysql}

Vi skippar MySQl, det var problem med att få den att fungera förra året.

<!-- Vi vill ha koll på vad som händer med databasen och det finns så klart en exporter för MySQL också.

Jobba igenom [Övervaka MySQL med Prometheus och Grafana](kunskap/overvaka-mysql-med-prometheus-och-grafana)

Glöm inte att öppna portar i Azure så Prometheus kommer åt mysql_exporter. -->



#### Nginx {#nginx}

Det finns en officiell exporter för [Nginx](https://github.com/nginxinc/nginx-prometheus-exporter) som använder sig utav [ngx_http_stub_status_module](http://nginx.org/en/docs/http/ngx_http_stub_status_module.html) för att samla data. Tyvärr behöver man ha Nginx Plus för att få ut mer intressant data som hur många 4xx/5xx request man får in. Nu har vi inte Plus versionen och får nöja oss med att kunna se att servern är igång och hur många requests servern har fått.

Jobba igenom [Övervaka nginx med Prometheus och Grafana](kunskap/overvaka-nginx-med-prometheus-och-grafana).

Glöm inte att öppna portar i Azure.



#### Ansible {#ansible}

Uppdatera era playbooks så att de också sätter upp exportörerna och att Grafana kan visa upp datan. I er Prometheus config behöver ni koppla alla exporters till ip addresser, ni kan använda `{{ groups['<hostname>'][0] }}` för att få ut en ip i Ansible.



### Video {#video}

Det finns generellt kursmaterial i video form.

1. Kursen innehåller föreläsningar som spelas in och därefter läggs i spellistan "[devops streams ht22](https://www.youtube.com/playlist?list=PLKtP9l5q3ce8t5NnxhZIJC69_FL55FzNV)".

1. I "[kursen devops](https://www.youtube.com/playlist?list=PLKtP9l5q3ce8s67TUj2qS85C4g1pbrx78)" hittar du alla videor som är kopplade till kursmomentet, de börjar på 4xx i namnet.



### Uppgifter {#uppgifter}

Följande uppgifter skall utföras och resultatet skall redovisas via me-sidan.

1. Ni har en till instans i er Azure infrastruktur som kör Prometheus och Grafana.

1. Lägg till en Reverse Proxy i er Nginx konfiguration till Grafana. [Här](https://gist.github.com/AndreasArne/1b729078e53004303c511390f44dee7f) kan ni hitta exempel på delar ni behöver lägga in i er Grafana och Nginx konfig. Länka till er grafana sida, `<domain>/grafana` i er redovisningstext och skriv inloggs uppgifter.

1. Ha en Dashboard för följande exporters, Nginx, Node_exporter och Flask.

1. Lägg till en Ansible playbook för Prometheus och Grafana. Lägg till att installera och starta alla olika exporters i respektive playbook. Glöm inte öppna de nya portarna i `security_groups` rollen.

<!-- 1. Skapa larm i Prometheus som varnar om någon Docker container, Nginx eller instans inte längre är igång. Skapa även ett larm som varnar om minnet på hårddisken på Prometheus instansen har mindre än 5G kvar. -->
<!-- Hitta ett sätt som kan användas för att temporärt tar plats på hårddisken så larmet kan testas. -->

1. Försäkra dig om att du har pushat repot med din senaste kod och taggat din inlämning med version v14.0.0.




Läsanvisningar {#las}
--------------------------

Rekommendationen för denna veckan är att läsa **"Part IV. Tools"**.



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

Läs [instruktionen om hur du skall redovisa](./../redovisa).

Se till att följande frågor besvaras i texten:

1. Beskriv vad som menas med Monitoring, olika saker som brukar övervakas och vad det används till.

2. Beskriv Log management och vad det används till.

3. Beskriv APM och vad det används till.

4. Beskriv Observability och försök koppla det till ovanstående frågor.

5. Vad är dina tankar om Prometheus och Grafana?
