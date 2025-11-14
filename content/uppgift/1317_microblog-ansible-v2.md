---
author:
    - aar
revision:
    "2025-11-14": "(A, aar) Första versionen."
...
Microbloggen i Ansible
============================

Ni ska nu skapa playbooks för att sätta upp alla delar av microbloggen; databasen, applikationen på två servrar och en load balancer.


## Krav {#krav}

Efter kraven finns lite hjälp för att lösa er Playbooks.

1. Skapa en Ansible playbook för att starta en MySQL databas i en Docker container på en server. Den ska köra på host "database".
  - Installera docker
  - Starta en MySQL container.
  - OBS! datan ska ligga i en volym så att den inte raderas om containerns startas om.
1. Skapa en  Ansible Playbook för att starta er Microblog container. Den ska köras på host "appserver", alltså ska den köras på både appserver1 och appserver2.
  - Installera docker
  - Starta en Microblog container som kopplas till MySQL containern som körs på host database.
1. Uppdatera Ansible playbook deploy_lb så att Nginx skickar requests till båda appservrarna. Nu skickas det bara till en. Uppdatera ` upstream app-hosts` i `load-balancer.conf.j2`. Ni får inte hårdkoda servrarna. Skriv kod som gör det dynamiskt och funkar om vi lägger till flera servrar.



## Tips {#tips}


I Ansible, i era playbooks använd host namnet `database` för installationen av databasen, `appserver` för era servrar med Microblog och `loadbalancer` för Nginx.

Ni kan använda `ansible-lint` för att få tips på hur ni bör skriva er Ansible kod. Ni kan använda `-x <list of rules>` för att exkludera regler.

**Tips** Skapa en roll som bara installerar Docker. Den kan ni återanvända för `appserver` och `database`.



### Database playbook {#database_pb}

När ni startar MySQL containern kan ni **inte** använda hashade lösenord, MySQL klara inte av det. De måste vara i plain-text. 

När ni startar containern skicka också med `- MYSQL_ROOT_PASSWORD=<password>` som environment variabel, ni kommer använda det längre fram.



### Microblog playbook {#app_pb}

När ni ska koppla Flask appen till databasen behöver ni IP addressen för databas servern, ni kan inte längre använda er av Dockers länkning för att de körs på två olika maskiner. I ansible kan ni använda `{{ groups.database[0] }}` för att få ut IP för databas hosten. **Tips** om ni inte lyckas koppla upp er mot database kan ni logga in på er VM och köra `docker logs <microblog container namn>` för att se loggen för docker containern.


### Load balancer playbook {#lb_pb}

Ni hittar loggfilerna för Nginx i `/var/log/nginx`. Om en konfig fil inte fungerar kan ni köra `nginx -t` för att validera den.

Tänk på att ni kan använda `sudo nginx -t` som `validate` steg, på tasks i Ansible, för att validera er Nginx konfiguration.
