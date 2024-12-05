---
author: moc 
category:
    - devops
    - monitoring
revision:
    "2020-11-17": (A, moc) Skapad inför HT2020.
...
Övervaka nginx med Prometheus och Grafana {#intro}
=====================================================

I denna artikel skall vi gå igenom hur man kan övervaka trafiken till våran nginx server med hjälp av Prometheus och Grafana.

<!--more-->


Det finns en officiell exporter för [Nginx](https://github.com/nginxinc/nginx-prometheus-exporter) som använder sig utav [ngx_http_stub_status_module](http://nginx.org/en/docs/http/ngx_http_stub_status_module.html) för att samla data. Tyvärr behöver man ha Nginx Plus för att få ut mer intressant data som hur många 4xx/5xx request man får in. Nu har vi inte Plus versionen och får nöja oss med att kunna se att servern är igång och hur många requests servern har fått.


Aktivera stub_status i nginx {#stub_status}
---------------------------------------------------------
Om ni har installerat nginx via *apt-get* ska ni redan ha modulen [`ngx_http_stub_status_module`](http://nginx.org/en/docs/http/ngx_http_stub_status_module.html). Innan ni fortsätter kan ni dubbel kolla att den är installerad. Logga in på load balancer instansen och kör kommandot `sudo nginx -V 2>&1 | grep -o with-http_stub_status_module`, får ni en utskrift med `with-http_stub_status_module` är ni good to go!

Vi behöver starta denna modul i nginx så att den [prometheus exportör](https://github.com/nginxinc/nginx-prometheus-exporter) vi senare skall använda oss utav skall fungera.


Så i min nginx konfigurationsfil lägger jag till en ny `endpoint` och startar `stub_status`:

```
server {
    listen 443 ssl;
...
    location /metrics {
        stub_status on;
    }
...
```

Vi kan testa våran konfigurationsfil `nginx -c /etc/nginx/nginx.conf -t` för att försäkra oss att våra ändringar stämmer. Om allt går igenom kan vi starta om webbservern med `sudo service nginx reload`.


Om vi går in på `https://<domännamn>/metrics` och det skrivs ut information liknande detta är första steget klart:

```
Active connections: 5 
server accepts handled requests
 5 5 55 
Reading: 0 Writing: 1 Waiting: 4 
```


Using the Prometheus exporter {#prom_exporter}
---------------------------------------------------------
Som vi precis såg kan vi redan se de mätvärden vi är ute efter men, för att göra det läsbart för prometheus behöver vi använda en *exportör*. Ett av verktygen vi kan använda för att göra tillgängligt är `nginx-prometheus-exporter` som jag nämnde tidigare. Det enklaste sättet att starta exportören är via Docker, men om ni hellre vill installera den [som en binary](https://github.com/nginxinc/nginx-prometheus-exporter#running-the-exporter-binary) kan man också göra det.

Jag kör på Docker och kommandot jag använder mig utav för att starta containern är:

```bash
$ docker run \
    --restart always \
    -p 9113:9113 \
    nginx/nginx-prometheus-exporter:0.4.2 \
    -nginx.scrape-uri=https://<domännamn>/metrics \
    -nginx.retries=10 \
    -nginx.ssl-verify=false \
    -web.telemetry-path=/prometheus
```

Konfigurera Prometheus {#configure_prom}
---------------------------------------------------------
Nästa steg för att få igång detta är att konfigurera var prometheus ska hämta data. Detta görs genom att lägga till ett nytt jobb i [prometheus.yml](https://devconnected.com/complete-node-exporter-mastery-with-prometheus/#b_Installing_Prometheus):

```yml
scrape_configs: 
  - job_name: nginx
    metrics_path: /prometheus # sökvägen som exportern ovanför skapar, -web.telemetry-path=/prometheus 
    scrape_interval: 30s # hur ofta prometheus ska skrapa data
    static_configs: 
    - targets: ["<domännamn>:9113"] # domän och port som exportern finns på
```

Starta om prometheus, för mig räckte det att skicka en POST `curl -X POST http://localhost:9090/-/reload` men fungerar inte det kan ni testa `sudo killall -HUP prometheus` som skickar en `SIGHUP` signal till prometheusprocessen och laddar om sina konfigurationer.

Nu bör du kunna se om prometheus är korrekt konfigurerad genom att besöka `/targets`. Detta ska visa status "UP" bredvid nginx jobbet.


Konfigurera Grafana {#configure_graf}
---------------------------------------------------------
Om du har konfigurerat grafana att ansluta till prometheus-databasen kan du ställa in dina *dashboards*. I det här fallet är jag intresserad efter ett diagram som visar den totala mängden anslutningar som har gjorts under en viss tid. Detta kan vi göra genom att titta på `nginx_http_requests_total`.

Eftersom `nginx_http_requests_total` visar den totala mängden förfrågningar, måste vi använda funktionen `delta()` för att titta på skillnaden över en viss tid. Du kan använda följande för att t.ex. se mängden requests per fem minuter:

```
delta(nginx_http_requests_total{job="nginx"}[5m])
```

Nu skall vi ha en graf liknande:

[FIGURE src="image/devops/grafana-nginx-requests.png"]


Avslutningsvis {#avslutningsvis}
-------------------------------------
Och där var det klart, nu har vi en fin *dashboard* för nginx. Tyvärr behöver man ha Nginx Plus för att få ut mer intressant data som hur många 4xx/5xx request man får in. Nu har vi inte Plus versionen och får nöja oss med att kunna se att servern är igång och hur många requests servern har fått.

Glöm inte heller att också öppna portarna i era *security groups*.