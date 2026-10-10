---
author:
  - aar
revision:
  "2026-10-10": "(E, aar) Monitoring körs lokalt med docker compose, färdig konfiguration, redovisning med skärmdumpar."
  "2025-12-02": "(D, aar) Inkluderat del om använda AI för monitoring strategi."
  "2023-11-24": "(C, aar) Släppt för HT23."
  "2020-11-19": "(B, aar) Släppt för HT20."
  "2019-10-15": "(A, aar) Första versionen."
...

# Kmom04: Monitoring

Nu när vi har ett system uppe och rullande behöver vi veta när något går fel, vi ska övervaka hela produktionsmiljön och alla dess delar.

<!-- more -->

<!-- [WARNING]
Materialet är inte redo. Vänta på att den gula rutan försvinner.
[/WARNING] -->

[INFO]
Detta kmom är en vecka långt, **inte** två!
[/INFO]

[FIGURE src="https://upload.wikimedia.org/wikipedia/commons/d/d2/IoT_environmental_monitoring_system_solution_-_Overview.jpg" caption="Överblick av olika delar som kan ingå i ett system med övervakning."]

<!-- https://old.reddit.com/r/devops/comments/afqye3/whats_your_monitoring_and_alerting_stack_look_like/
https://itnext.io/deploy-elk-stack-in-docker-to-monitor-containers-c647d7e2bfcd
 -->

## Läsanvisningar {#read}

Läsanvisningar hittar ni på sidan [bokcirkel](./../bokcirkel).

Kolla i [lektionsplanen](https://dbwebb.se/devops/lektionsplan) för att se när vi träffas för bokcirkeln.

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

Ni behöver inte skriva konfigurationen för Prometheus, Alertmanager och Grafana själva. Den finns färdig i mappen `monitoring/` i Microblog-repot (hämta den från [startrepot](https://github.com/dbwebb-se/microblog) om er fork inte har den). Er uppgift är att köra den, läsa den och förstå vad varje del gör.

- Kolla på videorna 401-403 och 410-413 i spellistan [kursen devops](https://www.youtube.com/watch?v=u84GyxLGdEo&list=PLKtP9l5q3ce8s67TUj2qS85C4g1pbrx78&index=12) för att se hur de olika delarna hänger ihop. Videorna visar äldre versioner och sätter upp allt för hand, så följ inte kommandona exakt, det ni ska köra står nedan.

Hela övervakningen körs lokalt på er dator, inte på en VM. Den startas med en profil i `docker-compose.yml`:

```
docker compose --profile monitoring up -d --build prod prometheus alertmanager grafana
```

| Tjänst | Adress | Vad den gör |
|--------|--------|-------------|
| Microblog | <http://localhost:8000> | Appen. `/metrics` visar de mätvärden Prometheus hämtar. |
| Prometheus | <http://localhost:9090> | Hämtar mätvärden var 5:e sekund, utvärderar reglerna i `monitoring/rules.yml`. |
| Alertmanager | <http://localhost:9093> | Tar emot larm från Prometheus och skickar dem vidare. |
| Grafana | <http://localhost:3000> | Dashboards. Logga in med `admin` / `admin`. Prometheus är redan inlagd som datakälla. |

Appen exponerar sina mätvärden med [prometheus-flask-exporter](https://github.com/rycus86/prometheus_flask_exporter), den är redan inlagd i `app/__init__.py`. Den räknar bland annat alla requests per statuskod i `flask_http_request_total`.

[INFO]
Räknare i Prometheus (som `flask_http_request_total`) finns inte förrän det första felet har hänt. Reglerna i `monitoring/rules.yml` är skrivna så att de klarar det. Om ni skriver egna regler med `increase()` eller `rate()` märker ni det: de behöver två mätpunkter och larmar därför inte vid det första felet.
[/INFO]

### Uppgifter {#uppgifter}

Del 1.

1. Starta övervakningen med kommandot ovan. Öppna Prometheus, gå till *Status* → *Targets* och kontrollera att `microblog` är `UP`. Öppna Grafana och kontrollera att datakällan Prometheus fungerar (menyn *Data sources*).

1. Läs `monitoring/prometheus.yml`, `monitoring/rules.yml` och `monitoring/alertmanager.yml` samt de nya tjänsterna i `docker-compose.yml`. Ni ska kunna förklara vad varje del gör i er redovisning.

1. Skapa en egen unik adress på [https://webhook.site](https://webhook.site) och lägg in den i `monitoring/alertmanager.yml`. Starta om Alertmanager (`docker compose restart alertmanager`).

Del 2.

1. Ta hjälp av AI för att skapa en monitoring strategi för Microblog. Fel som uppstår i appen ska fångas och visualiseras i Grafana. När ett fel uppstår ska ett larm skickas till webhook.site. Basen finns redan (exportören och reglerna), AI:n ska hjälpa er avgöra vad mer som är värt att övervaka och hur ni visar det.

1. Implementera en ny feature i Microblog som genererar ett fel, till exempel en route som kastar ett undantag.

1. Skapa en dashboard i Grafana med minst en panel som visar felen.

1. Trigga felet och ta tre skärmdumpar: felet i appen, samma fel i en panel i Grafana, och larmet när det kommer in på webhook.site. **Alla tre skärmdumparna måste visa klockslag och datum** så att vi kan se att händelserna hör ihop.

[INFO]
Larmet skickas av Alertmanager upp till 30 sekunder efter att felet har hänt, och meddelandet att larmet är löst kommer några minuter efter det.
[/INFO]

Allt körs lokalt, ni behöver inte öppna några portar eller starta några VM:ar i Azure för den här uppgiften.

## Extrauppgift {#extra}

Om ni får tid över, testa log management verktyget [Loki](https://grafana.com/oss/loki/). Försök få loggar från microbloggen till Grafana med hjälp av Loki.

## Resultat & Redovisning {#resultat_redovisning}

[INFO]
På Canvas är detta en gruppinlämning. Svara på frågorna tillsammans.
[/INFO]

Se till att följande frågor besvaras i texten:

1. Beskriv vad som menas med Monitoring, olika saker som brukar övervakas och vad det används till.

2. Beskriv Log management och vad det används till.

3. Beskriv APM och vad det används till.

4. Beskriv Observability och försök koppla det till ovanstående frågor.

5. Testade ni Loki? Fick ni ihop det, i så fall tror du att man hade hunnit med det i kursmomentet?

6. **Skicka med den korta texten om hur AI hjälpte er med monitoring strategin: vad AI:n föreslog och vad ni ändrade.**

7. **Skicka med de tre skärmdumparna (felet i appen, felet i Grafana, larmet på webhook.site). Alla ska visa klockslag och datum.**

8. Förklara kort vad `prometheus.yml`, `rules.yml` och `alertmanager.yml` gör.

9. Hur var storleken på kursmomentet?
