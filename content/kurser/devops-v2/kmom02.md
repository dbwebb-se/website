---
author:
  - aar
revision:
  "2026-10-09": "(C, aar) Tre VM's istället för fyra, stop/start playbooks, certbot staging, Azure förberedelser i egen guide, version route flyttad till kmom01, mer hjälp med vanliga fel."
  "2025-11-14": "(B, aar) Flyttat runt texten och gjort om för att de inte skapar någon VM i kmom01. Ger mer färdig kod."
  "2023-11-09": "(A, aar) Första versionen."
...

# Kmom02: Configuration Management och Continuous Deployment

I kmom01 fixade ni en utvecklingsmiljö och CI/CD. I detta kmom ska vi sätta upp en produktionsmiljö och ut utveckla CD kedjan till Continues Deployment.

<!-- more -->

PS! Kmom02 är två veckor långt!

[FIGURE src="https://www.gocd.org/assets/images/blog/continous-delivery-vs-deployment-infographic/continuous-delivery-vs-continuous-deployment-infographic-305dd620.png"]

Vi ska bygga en klassisk webbapp struktur, en databas, flera servrar för appen och en load balancer. För detta behöver vi tre VM's i Azure. Vi ska utnyttja kraften av Configuration Management verktyget Ansible för att på ett hållbart sätt skapa och konfigurera servrarna i Azure. Vi ska skapa och stänga ner servrar med ett kommando, installera och konfigurera dem och tillslut ha ett kommando för att sätta upp hela produktionsmiljön, från zero to hero!

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

Strukturen är att vi har två olika VM's för Microblog. Båda kör en varsin kopia av Microblog och är kopplade till samma databas. På det sättet kan vi sprida ut hanteringen av request på två olika VM's och kan hantera fler besökare. Förutsatt att databasen kan hantera request från två olika källor samtidigt på ett bra sätt, det borde inte vara några problem än så länge.

Steget vi har kvar är att koppla ett domännamn till båda Microblog VM's. Det kan vi använda en load balancer. Vi sätter Nginx som en load balancer och låter den dela upp inkommande requests till de båda Microblog VM's.

Databasen ska egentligen ligga på en egen VM. Då kan databasen och load balancern drivas och skalas var för sig, och ett fel i den ena tar inte ner den andra. För att spara kostnader i Azure återanvänder vi i kursen VM:en för load balancern och kör databasen där. Så gör man inte i produktion, tänk på det när ni skriver er redovisning. Ni ska ändå skriva er kod så att databasen är en egen roll i Ansible, med eget host namn (`database`), så att det går att flytta den till en egen VM senare.

[FIGURE src="image/devops/azure-structure.png" caption="VM struktur på Azure."]

_På bilden har loadbalancer och databasen speciella ikoner men det är fortfarande vanliga VM's vi ska använda. Bilden visar en egen VM för databasen, i kursen kör databasen på samma VM som load balancern._

### Att göra {#prod-do}

Jobba igenom:

- [Kom igång med Azure](guide/kom-igang-med-azure). I guiden visas hur ni skapar en VM manuellt. Det ska ni inte göra, vi skapar VM's med Ansible kod istället. Det är dock bra att veta hur man gör det manuellt.
- [Förbered Azure](guide/kom-igang-med-azure/103_forbered-azure). Där skapar ni en SSH nyckel, en DNS zone för ert domännamn och loggar in med Azure CLI.

### Kostnad {#cost}

Azure kostar pengar för varje VM som är igång, och även en stoppad VM kostar för disk och IP adress. Därför har vi bara tre VM's, och ni ska stänga av dem när ni inte jobbar. I Ansible mappen finns två playbooks för det:

- `stop_instances.yml` stoppar alla VM's. Servrarna, IP adresserna och diskarna finns kvar men ni betalar inte för att de körs.
- `start_instances.yml` startar dem igen. Det tar någon minut.

Skapa och radera hela miljön med `terminate_instances.yml` och `site.yml` tar ungefär 15 minuter och databasen med all data försvinner. Använd stop och start när ni bara tar en paus.

[INFO]
Playbooks skriver många rader `FAILED - RETRYING` när de väntar på att Azure ska bli klart. Det är normalt, Ansible försöker bara igen. Det är först när det står `fatal` eller `failed=1` som något är fel.
[/INFO]

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

## Bekanta er med Ansible koden {#ansible-code}

Låt oss kolla på Ansible koden som redan finns i Microblog repot.

Ansible och Azure CLI finns i er dev container. Synka ert repo med originalet (se rutan ovanför), bygg om dev containern (`Dev Containers: Rebuild Container`) och kör `make install-dev` om det inte gjordes automatiskt.

### Läs och titta {#code-read}

- Kolla på videorna med `20x`i namnet för att bekanta er med vad som finns i Ansible mappen i Microblog repot, [kursen devops](https://www.youtube.com/playlist?list=PLKtP9l5q3ce8s67TUj2qS85C4g1pbrx78). Några saker kan skilja sig från koden som visas i videorna men det ska inte vara några stora ändringar.

  - PS. Skippa inte videorna!
  - Videorna prata inte om koden som ligger i `deploy_lb`. Den får ni läsa och förstå själva.

- Om ni vill hänga med och skriva 10-first-minutes själva så kan ni kolla på videorna med "21x" i namnet. Videorna är lite utdaterade när det kommer till hur man exekverar filerna. Då pratar jag om AWS men om ni har kollat på de andra videorna så vet ni hur man exekverar filerna.

### Att göra {#provision-do}

1. Uppdatera er provision Playbook så att tre servrar skapas.

   - En `loadbalancer` och två `appserver`, en som heter `appserver1` och en `appserver2`. Databasen körs på `loadbalancer`.
   - Appservrarna ska dela security group.
   - Lägg till två subdomäner som går till varsin `appserver`. De ska heta `appserver1.<domännamn>` och `appserver2.<domännamn>`.
   - Skapa en hosts fil och lägg till subdomänerna som hosts. Namnge inte hostarna i provisioning playbook till samma namn som grupperna som `gather_instances` skapar (`appserver`, `loadbalancer`, `database`). Då matchar `hosts: loadbalancer` fel host och er load balancer får aldrig något deployat, utan något felmeddelande.

1. Uppdatera "10-first-minutes" Playbook så att alla gruppmedlemmars SSH-nycklar läggs till i authorized_keys. I modulen [ansible-role-users](https://github.com/cogini/ansible-role-users/blob/master/tasks/main.yml#L108) kan ni se ett exempel på hur man kan göra det. Då behöver ni ladda upp allas **publika** nycklar i ert repo. Det är säkert att ladda upp de publika nycklarna. De kan inte användas för att återskapa den privata.
   - Tips. `pub_ssh_key_location` används av provisioneringen och ska vara en enda fil. Lägg gruppens nycklar som en fil per person i en egen mapp och läs dem med `with_fileglob` i 10-first-minutes.
   - PS. Tänk på att köra gather_instances.yml med 10-first-minutes för att hitta vilka VMs som finns.
   - Kör "10-first-minutes" mot alla tre VMs.

[INFO]
**Tips när ni skapar om servrar.**

- Ansible sätter `time_to_live` till 60 sekunder på DNS posterna men er dators DNS cache kan ändå svara med den gamla IP adressen länge. Testa mot nya servern med `curl --resolve <domän>:443:<ip> https://<domän>/` eller töm cachen (`ipconfig /flushdns` i Windows).
- En ny VM har en ny SSH host key under samma namn. Får ni `REMOTE HOST IDENTIFICATION HAS CHANGED`, kör `ssh-keygen -R <domännamn>`.
[/INFO]

## Sätta upp Nginx som en Load balancer {#nginx}

Vi ska köra Nginx som Load balancer, här lär vi oss mer om Nginx.

### Läs och titta {#nginx-read}

- [Nginx Tutorial for Beginners](https://www.youtube.com/watch?v=9t9Mp0BGnyI).
- [Beginner’s Guide to NGINX Configuration Files](https://medium.com/adrixus/beginners-guide-to-nginx-configuration-files-527fcd6d5efd).
- [Nginx load balancer](https://nginx.org/en/docs/http/load_balancing.html).

I länken ovanför skriver de inte att vi inte kan lägga ett `http` block i ett annat `http` block. Vilket vi gör om vi bara skapar en ny host i `/etc/nginx/sites-available`. Detta gör att vi måste ändra på config filen `/etc/nginx/nginx.conf`.

## Playbooks för Microblog och databas {#playbook_deploy}

Nu ska ni själva implementera playbooks för att sätta upp microbloggen på båda appservrarna och en mysql databas på databasen (som alltså körs på load balancer VM:en).

### Att göra

1. Sätt upp [Microbloggen med Ansible](uppgift/microblog-ansible-v2).

### Certifikat och Let's Encrypt {#certbot}

Load balancern får sitt HTTPS certifikat av Let's Encrypt via certbot. Let's Encrypt ger bara 5 riktiga certifikat per vecka för samma domän, och varje ny load balancer VM begär ett nytt. Bygger ni om miljön flera gånger tar certifikaten slut och då går det inte att få fler på en vecka.

Därför finns variabeln `certbot_staging` i `ansible/group_vars/all.yml`. Är den `true` (standard) begär certbot ett test-certifikat, som inte har någon gräns men som webbläsare och `curl` inte litar på. Är den `false` begär den ett riktigt. Bygg och testa med `true`. Sätt den till `false` en gång när allt funkar, då byts testcertifikatet ut mot ett riktigt. Ett riktigt certifikat ersätts aldrig. Ni behöver läsa koden i `deploy_lb` för att förstå hur det går till, den ska ni kunna förklara.

## Continuous Deployment (CD) {#cd}

Vi ska utöka från Continuous Delivery till Deployment.

### Läs och titta {#cd-read}

- [The fundamentals of continuous deployment in DevOps](https://resources.github.com/devops/fundamentals/ci-cd/deployment/).

- [Deployment Strategies](https://www.baeldung.com/ops/deployment-strategies)

### SSH från Github Actions till VM's {#ssh}

När ni ska implementera er CD strategi behöver ni kunna logga in med SSH från GitHub Action till era servrar. Hur ni gör det kan ni hitta i [Kör playbook på VM från GigHub Action](coachen/ansible-till-azure-vm).

### Deploy efter publish {#cd-order}

En deploy ska bara köras när Docker imagen är publicerad. Ett eget workflow som triggas av samma tag kör parallellt med publish och deployar en image som inte finns än. Lägg istället deploy som ett jobb i samma workflow som publish, med `needs: publish`. Versionen kan ni skicka mellan jobben som ett `output`.

### Starta om efter stop {#restart}

När ni stoppar och startar VM's:arna startar inte Docker containrar som saknar restart policy om. Sätt `restart_policy: unless-stopped` på containrarna i era playbooks.

### Rolling update {#rolling}

Om ni väljer rolling update, använd `serial: 1` i playbooken så att bara en server uppdateras åt gången. Misslyckas den första stannar playbooken och den andra servern har kvar den gamla versionen.

## Lästips {#lastips}

1. Hur man kan hantera flera [användare på produktionsservern med Ansible](https://www.cogini.com/blog/managing-user-accounts-with-ansible/).

## Uppgifter {#uppgifter}

1. I Azure ska ni ha strukturen med tre VMs, en Load balancer (som också kör databasen) och två app servrar. Site.yml playbook:en ska kunna sätta upp hela miljön från inget till klar.

1. Implementera en Continuous Deployment strategi med Ansible och Github Actions.

   - Vid ny tag ska Actions köra Ansible playbooks som gör en valbar CD strategi för att driftsätta den nya versionen.
   - Er strategi ska inte ha någon downtime, så ni kan inte använda Recreate Deployment Strategy.
   - En avslutande del i er CD playbook ska verifiera att rätt version av Microblog körs på produktionsservrarna. Använd routen `/version` som ni skapade i kmom01 och jämför med taggen.

## Resultat & Redovisning {#resultat_redovisning}

[INFO]
På Canvas är detta en gruppinlämning. Svara på frågorna tillsammans och skicka med en länk till ert repo.
[/INFO]

1. Vad menas med Idempotency inom CM och IaC?

1. Vilket av CM/IaC verktygen som presenterades i "When to use which IaC/CM tool" tycker du lät mest intressant och varför?

1. Vilken CD strategi valde ni?

1. Kan du se några problem med er CI/CD kedja?

1. Om du fick välja fritt hur skulle du vilja bygga upp CD kedjan?

1. Databasen körs på samma VM som load balancern för att spara kostnader. Varför borde databasen ha en egen VM, och vilka risker finns med att dela VM?

1. Hur var storleken på kursmomentet?

1. Veckans TIL?
