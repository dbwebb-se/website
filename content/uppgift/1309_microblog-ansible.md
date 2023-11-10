
---
author:
    - aar
revision:
    "2023-11-09": "(A, aar) Första versionen."
...
Microbloggen i Ansible
============================

Ni ska nu skapa playbooks för att sätta upp alla delar av microbloggen; databasen, applikationen på två servrar och en load balancer. När vi bara hade en server använde vi Nginx som en reverse proxy för att skicka vidare requests till Flask appen. Nu ska vi använda Nginx som en load balancer istället.


## Krav {#krav}

Efter kraven finns lite hjälp för att lösa er Playbooks.

1. Skapa en Ansible playbook för att starta en MySQL databas i en Docker container på en server. Den ska köra på host "database".
  - Installera docker
  - Starta en MySQL container.
1. Skapa en  Ansible Playbook för att starta er Microblog container. Den ska köras på host "appserver", alltså ska den köras på både appserver1 och appserver2.
  - Installera docker
  - Starta en Microblog container som kopplas till MySQL containern som körs på host database.
1. Skapa en Ansible Playbook som installera och sätter upp Nginx som en load balancer.
  - Installera Nginx
  - Konfigurera load balancer som går till båda appserver1 och appserver2.
    - Hårdkoda inte båda appserver, gör en dynamisk lösning som klarar av att vi lägger till fler appservrar utan att behöver ändra koden.
  - Konfigurera HTTPS för ert domännamn.



## Tips {#tips}


I Ansible, i era playbooks använd host namnet `database` för installationen av databasen, `appserver` för era servrar med Microblog och `loadbalancer` för Nginx.

**Tips** Skapa en roll som bara installerar Docker. Den kan ni återanvända för `appserver` och `database`.



### Database playbook {#database_pb}

När ni startar MySQL containern kan ni **inte** använda hashade lösenord, MySQL klara inte av det. De måste vara i plain-text. 

När ni startar containern skicka också med `- MYSQL_ROOT_PASSWORD=<password>` som environment variabel, ni kommer använda det längre fram.



### Microblog playbook {#app_pb}

När ni ska koppla Flask appen till databasen behöver ni IP addressen för databas servern, ni kan inte längre använda er av Dockers länkning för att de körs på två olika maskiner. I ansible kan ni använda `{{ groups.database[0] }}` för att få ut IP för databas hosten. **Tips** om ni inte lyckas koppla upp er mot database kan ni logga in på er VM och köra `docker logs <microblog container namn>` för att se loggen för docker containern.


### Load balancer playbook {#lb_pb}

Nginx ska skicka vidare requests till applikations servrarna.

- Ni kan hitta två config filer för Nginx som load balancer på [Gist](https://gist.github.com/AndreasArne/58374253123a31bb7c32e2b551fe8492).

- I `upstream app-hosts`, där man bestämmer vilka vilka servrar requests ska skickas vidare till. Är nu bara en av appserver tillagd. Ändra så båda servrar är med. Ni får inte hårdkoda båda servrarna, gör en dynamisk lösning som hanterar om vi lägger till fler appservrar. T.ex. med en loop.

- Använd [template](https://docs.ansible.com/ansible/latest/modules/template_module.html) modulen i Ansible för att flytta conf filerna. Notera variablerna i `load-balancer.conf.j2` som ni behöver ha värden till i Ansible.

- `nginx.conf.j2` till `/etc/nginx/nginx.conf`

- `load-balancer.conf.j2` till `/etc/nginx/sites-available/load-balancer.conf`.

- Ni kan använda [file](https://docs.ansible.com/ansible/latest/modules/file_module.html?highlight=file) modulen för att länka `load-balancer.conf` till `sites-enabled` mappen.

**Tips** Ni hittar loggfilerna för Nginx i `/var/log/nginx`. Om en konfig fil inte fungerar kan ni köra `nginx -t` för att validera den.

Tänk på att ni kan använda `sudo nginx -t` som `validate` steg, på tasks i Ansible, för att validera er Nginx konfiguration.



<!-- ### HTTPS via Ansible {#https-ansible}

Det finns flera metoder för att få till HTTPS, vissa svårare än andra. Ni kan välja själva om ni tar genvägen och kolla på hur jag har gjort eller lösa det själva. För mitt sätt, kolla gist länken nedanför.

- [Ansible kod för Nginx](https://gist.github.com/AndreasArne/6b627f15aabeecd435abd1e8e11f96c8). Se till att det ligger överst i er `main.yml` för Nginx installationen annars kan det blir problem med config filerna. -->
