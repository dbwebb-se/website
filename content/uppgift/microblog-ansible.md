
Microbloggen i Ansible
============================

Ni ska nu skapa playbooks för att sätta upp alla delar av microbloggen, databasen, applikationen på två servrar och en load balancer. När vi bara hade en server använde vi Nginx som en reverse proxy för att skicka vidare requests till Flask appen. Nu ska vi använda Nginx som en load balancer istället.




### Playbooks för app strukturen {#app_structure}


I Ansible, i era playbooks använd host namnet `database` för installationen av databasen, `appServer` för er servern med Microblog och `loadBalancer` för Nginx.

**Tips** Skapa en playbook som bara installerar Docker. Den kan ni återanvända för `appServer` och `database`.

#### Database playbook {#database_pb}

Skapa en playbook som startar en Docker container med MySQL på servern. Ni kan **inte** använda hashade lösenord, MySql klara inte av det. De måste vara i plain-text. 

När ni startar containern skicka också med `- MYSQL_ROOT_PASSWORD=<password>` som environment variabel, ni kommer använda det i kmom04.



#### Applikations playbook {#app_pb}

Skapa en playbook som startar en Docker container med er senaste Microblog imagen på servern. När ni ska koppla Flask appen till databasen behöver ni IP addressen för databas servern, ni kan inte längre använda er av Dockers länkning för att de körs på två olika maskiner. I ansible kan ni använda `{{ groups.database[0] }}` för att få ut IP för databas hosten. **Tips** om ni inte lyckas koppla upp er mot database kan ni logga in på er VM och köra `docker logs <microblog container namn>` för att se loggen för docker containern.


#### Load balancer playbook {#lb_pb}

Skapa en playbook som installerar Nginx och konfigurerar det som en load balancer. Nginx ska skicka vidare requests till applikations servern. Vi har bara en applikations server än så länge så en load balancer tillför inte direkt något, men det är bra att känna till hur man gör en load balancer.


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
