---
author:
    - aar
revision:
    "2023-11-24": "(C, aar) Släppt för HT23."
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


### Monitoring {#monitoring}

När system ligger utspridda på virtuelle servrar jorden runt är det inte lätt att hålla koll på att alla servrar och system hela tiden är igång. Här kommer infrastruktur monitoring in i bilden men vi kan också ha application monitoring där vi övervakar metrics från system. T.ex. hur många request varje server har fått eller hur många 404 requests.

#### Läs och titta {#monitoring-read}

- Microsofts förklaring av [Monitoring](https://docs.microsoft.com/en-us/azure/devops/learn/what-is-monitoring).

- [Monitoring in a DevOps world](https://queue.acm.org/detail.cfm?id=3178371).



### Log management {#log}

Log management är processen av att samla in, lagra, hantera och analysera loggar från infrastruktur, system och applikation. Det är ett väldigt brett ämne då typ allt genererar loggar av något slag och system för att sköta log hantering är väldigt avancerade. För att få en överblick av delarna som ingår i log management och vilken användning olika roller har av log management läs följande:

#### Läs och titta {#log-read}

- [What is log management](https://www.tripwire.com/state-of-security/security-data-protection/security-controls/what-is-log-management/).

- [Why is log management important](https://www.graylog.org/post/why-is-log-management-important).

- en snabb överblick av [ELK stack](https://www.guru99.com/elk-stack-tutorial.html) för en överblick av ett av de mest populära systemen för Log management.



### Application performance monitoring (APM) {#apm}

APM kan även kallas Application Performance Management (också APM), enligt vissa är det skillnad. APM är att övervaka, hantera och diagnosera prestanda, tillgänglighet och användare upplevelse av applikationer. Avancerade program används för att göra om data till "business value".

#### Läs och titta {#apm-read}

- [What is application performace monitoring](https://www.eginnovations.com/blog/what-is-application-performance-monitoring/).



### Observability {#observability}

På senare år har det även börjat talas mycket om Observability vilket hänger ihop med monitoring. Vi kan se monitoring som att ha kolla på hälsan av våra system medan observability är att ha djup insikt i hur våra system beter sig. Observability ska hjälpa oss hitta fel och problem.

#### Läs och titta {#observability-read}

- [Observability sv. Monitoring](https://dzone.com/articles/observability-vs-monitoring).

- Om ni vill kan ni även kolla på [What Does the Future Hold for Observability?](https://www.youtube.com/watch?v=MkSdvPdS1oA).



### Prometheus och Grafana {#prometheus}

Vi ska använda oss av [Prometheus](https://prometheus.io/), ett väldigt populärt verktyg för att lagra tidsserie data och visualisera data. Prometheus har inbyggt stöd för att visa simpla grafer för data men oftast använder man det tillsammans med externa visualiseringsverktyg. Vi ska använda [Grafana](https://grafana.com/) för att bygga dashboards med grafer och diagram över datan från Prometheus.

#### Läs och titta {#prometheus-read}

- Läs [Prometheus Monitoring: The Definitive Guide in 2019](https://devconnected.com/the-definitive-guide-to-prometheus-in-2019/) för en överblick av vad Prometheus är och vad det innehåller.
- [Alertmanager](https://prometheus.io/docs/alerting/latest/alertmanager/)
- [Alerting Best practice](https://prometheus.io/docs/practices/alerting/)
- [Operatorer i Prometheus](https://prometheus.io/docs/prometheus/latest/querying/operators/)



#### Att göra {#prometheus-do}

Nu ska ni starta upp prometheus, grafana och koppla ihop dem.

- Kolla på videorna 401-403 i spellistan [kursen devops](https://www.youtube.com/watch?v=u84GyxLGdEo&list=PLKtP9l5q3ce8s67TUj2qS85C4g1pbrx78&index=12). Gör det lokalt på er dator för att testa få det att fungera.

- Kolla på videorna 410-413 i spellistan [kursen devops](https://www.youtube.com/watch?v=u84GyxLGdEo&list=PLKtP9l5q3ce8s67TUj2qS85C4g1pbrx78&index=12). PS i video 412 körs det på produktionsservrar men ni kan göra det lokalt som med allt annat, det är likadant.



Läsanvisningar {#read}
--------------------------

Läsanvisningar hittar ni på sidan [bokcirkel](./../bokcirkel).

Kolla i [lektionsplanen](https://dbwebb.se/devops/lektionsplan) för att se när vi träffas för bokcirkeln.



### Uppgifter {#uppgifter}


1. Utöka Ansible provisioning koden så att ni skapar en till server som heter och har typen `monitoring`.
    - **Öppna passande portar i security groups.**

1. Skriv Ansible kod som installerar och startar Prometheus, Grafana och Alertmanager på den nya VM instansen.
    - Använd er av modulen [Grafana datasources](https://docs.ansible.com/ansible/latest/collections/community/grafana/grafana_datasource_module.html) för att lägga till prometheus som datakälla

1. Uppdatera era appservrar så de kör er nya Docker image som innehåller flask exportören.

1. Vi borde ha en exportör för MySQL men tidigare år har den funkat dåligt. Installera istället en Node exporter på databas VM:en. Då får vi alla fall lite koll på hur servern mår. Gör det via Ansible koden.

1. Konfigurera en exportör för Nginx. I övningen [Övervaka nginx med Prometheus och Grafana](kunskap/overvaka-nginx-med-prometheus-och-grafana) kan ni se hur man gör.

1. Konfigurera Prometheus så den hämtar data från alla exportörer.

1. Lägg till dashboard i Grafana för alla exportörer. Använd Ansible modulen [dashboards](https://docs.ansible.com/ansible/latest/collections/community/grafana/grafana_dashboard_module.html) för att lägga till den från Ansible. Det går inte att koppla ihop er dashboard och datasource i Ansible koden. Modulerna saknar stöd för det. Bara skapa dem via Ansible och sen får ni koppla ihop dem manuellt.

1. Skapa ett valfritt larm, ett sätt att aktivera det och att avaktivera det. Larmet ska skickas till `https://webhook.site`. I redovisningstexten, skriv hur man kan aktivera och avaktivera larmet. Samt länk till er webhook sida där man kan se larmet. 

1. Lägg till en Reverse Proxy i er [Nginx konfiguration till Grafana och Grafana konfiguration](https://gist.github.com/AndreasArne/1b729078e53004303c511390f44dee7f). Länka till er grafana sida, `<domain>/grafana` i er redovisningstext och skriv inloggs uppgifter.

**Glöm inte att öppna portar i Azure!**

Extrauppgift {#extra}
--------------------------

Om ni får tid över, testa log management verktyget [Loki](https://grafana.com/oss/loki/). Försök få loggar från Nginx eller microbloggen till Grafana med hjälp av Loki.



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

Svara på nedanstående frågor individuellt, lämna in på Canvas tillsammans med länken till ert gemensamma GitHub-repo och domännamn till microblog sidan.

Se till att följande frågor besvaras i texten:

1. Beskriv vad som menas med Monitoring, olika saker som brukar övervakas och vad det används till.

2. Beskriv Log management och vad det används till.

3. Beskriv APM och vad det används till.

4. Beskriv Observability och försök koppla det till ovanstående frågor.

5. Hur kan jag aktivera och avaktivera er larm? Skicka med länk till webhook.site.

6. Testade ni Loki? Fick ni ihop det, i så fall tror du att man hade hunnit med det i kursmomentet?

7. Skriv inloggning till er grafana sida.
