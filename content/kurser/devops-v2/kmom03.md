---
author:
    - aar
revision:
    "2020-11-13": "(B, aar) Bytt från AWS till Azure."
    "2019-07-29": "(A, aar) Första versionen."
...
Kmom03: Configuration Management och Continuous Deployment
==================================


### Förbered för Ansible {#prepare}

Innan ni fortsätter **ska** ni ta bort era gamla VMs och resurser. På Azure portalen, gå till `All resources` och radera allt **utom** er "DNS zone" och "SSH key"!



### 10 first minutes on a server i Ansible {#10-first}

Nästa steg är att skapa er egna playbook för 10 first minutes on a server, kolla på videorna med `31x` i namnet och skapa en playbook för 10-first-minutes skripten.  
**Notera** några rättelser i videon:

- I videon används `gather_aws_instances.yml`, ni ska istället använda `gather_vm_instances.yml`.

- Ni ska även ändra `remote_user` från `admin` till `azureuser`.

- Kolla nu på videorna 31x i [kursen devops](https://www.youtube.com/playlist?list=PLKtP9l5q3ce8s67TUj2qS85C4g1pbrx78)



### Ansible på GitHub Actions för CD {#cd}

Vi kommer bara göra en väldigt simpel CD kedja som bara hanterar att uppdatera microblogen. Hur gör vi med ändringar i Nginx eller databasen? Vi nöjer oss med att bara klara av att uppdatera Microbloggen via CD och sköter databasen och Nginx manuellt men vi kan tänka på hur vi skulle gjort. Egentligen borde vi kanske dela upp vårt repo i tre stycken, en för vår load balancer, en för microblog och en för databasen. Då krävs tre separate utvecklings miljöer med Ansible och Makefiler. Men vi hade kunnat få till en bra uppdelning och minskat mängden filer och kod (speciellt i Ansible). En annan lösning är att börja med mer "ordentliga" commit meddelanden och ge den en specifik struktur. T.ex. lägga till taggar i dem och beroende på vilken tag som finns i meddelandet kör vi olika jobb på CircleCi. Det sista alternativet är nog det som är lättast för oss och det vi hade valt. Medan om vi jobbade på ett större projekt hade vi i slutändan tjänat på att dela upp repot i flera mindre.

- Läs en snabb överblick av olika [Deployment strategies](https://www.baeldung.com/ops/deployment-strategies).

[INFO]
På grund av den nya multi-factor authentication som används på våra konton kan vi logga in på Azure i Ansible från Actions.

Nedanför kan ni se hur en workflow fil kan se ut om det gamla sättet att logga in hade fungerat.
[/INFO]


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


