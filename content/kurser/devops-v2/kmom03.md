---
author:
    - aar
revision:
    "2023-11-17": "(A, aar) Första versionen."
...
Kmom03: DevSecOps
==================================

Devops handlar om att brygga kommunikationsbarriärer, det är stort fokus på development och operations teams men även security behöver inkluderas för att det ska bli ett bra resultat. I detta kursmoment ska vi kolla på hur vi kan inkludera säkerhet i hela utvecklingsprocessen, så att alla blir ansvariga för säkerhet i ett projekt.

<!-- more -->

[FIGURE src="img/devops/devops-security.png" caption="Hur det inte ska se ut när man kör devops."]

Vi har redan gjort några saker för att förbättra vår säkerhet, vi har stängt av ssh inloggning som root användare, vi har en ny användare i database bara för microbloggen, vi pushar inte Azure credentials till GitHub och vi sparar känslig information som behövs till Actions som hemlig miljövariabler. Nu ska vi gå vidare med att aktivt leta efter säkerhetsrisk.



### Vad är DevSecOps {#devsecops}

Målet med DevSecOps är att alla behöver tänka på och är ansvariga för säkerheten hos en produkt. Säkerhet behöver vara en del av hela utvecklingsprocessen. Mycket inom devops handlar om automation och där vill vi även ha med säkerheten, manuell kontroll av säkerhet ska vara ett undantag inte regeln. DevSecOps har fått ett eget namn för att det är först på senare år som man börjat med att få in säkerhetstänket, det var med inte riktigt i början av devops.

### Läs och titta {#devsecops-read}

<!-- - [The “What” “How” and “Why” of DevSecOps](https://www.newcontext.com/what-is-devsecops/) -->
- [The “What” “How” and “Why” of DevSecOps](https://web.archive.org/web/20220618115729/https://newcontext.com/what-is-devsecops/)
- [What is DevSecOps?](https://www.atlassian.com/continuous-delivery/principles/devsecops)
- kapitel 1 "Securing devops", 1.1-1.3, i [Securing Devops](http://tinyurl.com/usyps42) (länken går till en E-bok version) för en introduktion till Continuous Security.



### Test-driven security {#tds}

Vi lägga in automatiska säkerhetskontroller i vår CI/CD kedja, men vi jobbar inte med säkerhet så vi har inte kunskapen att utföra säkerhetstester på vårt projekt. Som tur är finns det många projekt andra människor och företag har gjort som testar säkerhet i olika aspekter på olika system.



#### Docker {#docker}

När det kommer till att göra Docker säkrare finns det väldigt mycket man kan göra, det finns flera olika långa dokument som går igenom vad man kan göra. T.ex. [CIS Docker Benchmark](https://www.cisecurity.org/benchmark/docker/), ett av de längre dokumenten, och [OWASP Container security standard](https://github.com/OWASP/Container-Security-Verification-Standard), som tycker att CIS är för långt dokument. Ni behöver inte sätta er in i dem men om ni är intresserade rekommenderar jag OWASPs standard. Man behöver både säkra upp de image's som man skapar och själva Docker daemon som exekverar image's på servern.

### Läs och titta {#docker-read}

- [Docker security cheat sheet](https://cheatsheetseries.owasp.org/cheatsheets/Docker_Security_Cheat_Sheet.html)
- [Container security best practices](https://logz.io/blog/container-security-best-practices/)



##### Docker image security scanning {#docker_scan}

Det finns några olika verktyg för att skanna Docker images, Docker runtime och inställningar i Docker host. 

Den nämner dock inte [Docker Bench Security](https://github.com/docker/docker-bench-security) vilket är Dockers egna verktyg för att skanna olika delar av Docker.

###### Läs och titta {#dockerscan-read}

- [Docker Image Security Scanning: What It Can and Can't Do](https://resources.whitesourcesoftware.com/blog-whitesource/docker-image-security-scanning)
- Länken ovanför nämner fler olika verktyg, men den nämner inte Dockers egna verktyg, [Docker Bench Security](https://github.com/docker/docker-bench-security). För att se allt man "behöver" göra på sin server rekommenderar jag att ni logga in på en appserver och kör verktyget. Då får ni upp en lång lista på saker man borde fixa på en server som kör Docker.


<!-- ##### Docker Bench for Security {#bench}

Docker har byggt ihop några skript som kollar basic säkerhet i Docker konfiguration och images. Projektet kallas för [Docker Bench Security](https://github.com/docker/docker-bench-security) och det kollar många av sakerna som tas upp dokumenten jag länkade ovanför. Docker Bench Security är en bra start för säkerhet i Docker men det är inte en fullstädning lösning.

Jobba igenom guiden [Using Docker Bench Security to configure Docker to best practices](https://developers.hp.com/epic-stories/blog/docker-bench-security-container-hardening-and-auditing-host-security) för att fixa basic konfiguration på servrarna för att lösa många av varningarna. Logga in på er AppServer och kör kommandona där när ni jobbar igenom guiden. OBS! Läs igenom nedanstående info innan ni börjar med guiden, det rättar saker som inte funkar för oss, guiden kommer inte lösa alla felen ni har och den är skriven för Alpine os så t.ex. behöver ni skriva `apt-get` istället för `apk` när ni ska installera något.

- När ni ska konfigurera `auditd` ska ni skriva reglerna i filen `/etc/audit/rules.d/audit.rules`.  
- När ni i guiden ska konfigurera Docker Daemon skippa följande två rader:

```
"log-driver": "syslog",
"disable-legacy-registry": true,
"userns-remap": "default"
```

Vi vill inte sätta log-driver för att vi har inte en extern log server att skicka dem till, `disable-legacy-registry` är [deprecated i nyare versioner av Docker](https://docs.docker.com/engine/deprecated/#interacting-with-v1-registries). Efter att ni startat om Docker deamon efter ny config kan det vara så att microblog containern inte startar automatiskt så ni får starta den manuellt.

- Använd `sudo less /var/log/syslog  |  grep docker` för att Docker felmededelande vid restart. kan också tillägga att om man försöker starta om Docker för ofta får man error. Då är det bara att vänta en stund innan man försöker igen.

Jobba igenom guiden nu.

Efter guiden hade jag kvar följande fel:

- 1.1, vi struntar i denna.
- 2.11
- 2.12
- 4.6



https://github.com/freach/docker-image-policy-plugin whitelist docker images för pull -->



#### Dependency Scanning {#dep_scan}

I vårt projekt använder vi oss av många externa paket både i Python koden för Microbloggen men även i Docker imagen. Man kan aldrig riktigt veta om ett paket man installera är säkert eller om det innehåller säkerhetsrisker. Här kommer Dependency scanning in i bilden. Dependency Scanning verktyg har oftast en stor databas som kontinuerligt uppdateras med paket som man vet innehåller kända säkerhetssårbarheter.

##### Läs och titta {#depscan-read}

- [Dependency and Container Scanning](https://microsoft.github.io/code-with-engineering-playbook/continuous-integration/dev-sec-ops/dependency-container-scanning/dependency_container_scanning/)
- I uppgiften ska ni använda [Trivy](https://github.com/aquasecurity/trivy) och [Dockle](https://github.com/goodwithtech/dockle).



#### SAST vs. DAST vs. IAST {#ast}

Säkerhetshål kan uppstå många ställen i en applikation och då finns det många sätt vi kan försöka hitta säkerhetshålen.

Static/Dynamic/Interactive Application Security Testing syftat på olika ställen/sätt vi letar efter säkerhetshål.

##### Läs och titta {#depscan-read}

- [SAST vs. DAST](https://www.synopsys.com/blogs/software-security/sast-vs-dast-difference/) för en jämförelse av de två och vad de är bra på.
- [Interactive Application Security Testing ](https://snyk.io/learn/application-security/iast-interactive-application-security-testing/).

I uppgifter ska ni använda [Bandit](https://github.com/PyCQA/bandit) för SAST och [Zap](https://www.owasp.org/index.php/OWASP_Zed_Attack_Proxy_Project) för att utföra DAST på Microbloggen.



### Infrastruktur Security {#infrastruktur}

Produktionsmiljön, CI/CD och molntjänsten vi använder kan vi också göra säkrare. Vi är dock begränsade i vad vi kan göra i och med att vi har studentkonton.



#### Azure {#azure}

När det kommer till att säkra molnmiljön handlar det om att verifiera konfiguration istället för att testa tjänsten.

Vi borde kontrollera följande:

- Att rätt brandväggsregler används i Security Groups.

- Att systemen är up-to-date genom att kolla versionen på bas imagen vi använder som OS på servrarna.

- Kontrollera rättigheterna användare har. Vi kan inte göra detta då vi har studentkonton, vi har inte tillgång till [Role based access controll (RBAC)](https://docs.microsoft.com/en-us/azure/role-based-access-control/overview). Med det kan man kontrollera vem som har rättigheter att skapa/ändra/radera resurser. Vi skulle t.ex. kunna skapa en ny användare som används av `gather_instances.yml` playbooken och den användaren har bara rättigheter att läsa data från Azure. Då hade vi inte varit lika sårbara om vi hade råkat läcka credentials.

Det finns olika verktyg för att verifiera konfigurationer i molntjänster, men igen är vi begränsade för att vi har studentkonto och inte kan sätta roller och kontrollera subscriptions. Ett populärt open-source verktyg är [ScoutSuite](https://github.com/nccgroup/ScoutSuite) men vi kan inte använda det.

Vi nöjer oss med att veta att vi borde göra det, för att vi inte kan på grund av begränsningarna med studentkonton.



##### Security Groups {#sg}

Vi kan och ska förbättra våra security groups, som det ser ut nu kan vem som helst koppla upp sig till de olika portarna som är öppna på våra servrar. Det är onödigt när vi vet vilka IP-addresser alla servrarna har. Vi kan inte göra det på ett bra sätt som det ser ut nu, för att vi kör rollen för SGs före vi skapar servrarna i Ansible. Vi behöver skapa servrarna först så att vi kan använda deras IP när vi skapar SGs. Det ska ni fixa i uppgiften.



#### Produktionsmiljön {#prod_miljo}

Det finns en hel del vi kan göra med servrarna i produktion. SSH är en viktig del i vårt arbetsflöde, Ansible behöver kunna SSH:a in till varje server för att konfigurera dem och vi gör det för att felsöka och testa saker. Dock så är vår SSH setup inte särskilt säker, även om vi har stängt av root och password login vilket är steg 1.

I vår struktur kan man SSH:a in till varje server från vilken IP som helst. En säkrare struktur än vad vi har är att ha en bastion/access node som fungerar som ingång till hela produktions infrastrukturen. Då hade vi skapat en till instans som endast är till för att ge tillgång till resten av servrarna. Servern hade haft en security group så att man kan SSH:a till den från vilken IP som helst. På övriga servrar sätter vi security groups som bara tillåter SSH kopplingar från bastion nodens IP. Vi kommer inte att skapa en bastion node då vi har begränsat med resurser men med en större budget hade vi gjort detta.

##### Läs och titta {#prod-read}

- [What is a bastion host?](https://www.learningjournal.guru/article/public-cloud-infrastructure/what-is-bastion-host-server/)


##### SSH {#ssh}

När vi ändå är inne på SSH kopplingar så kan vi konfigurera säkrare kopplingar på servrarna. Vi börjar med att använda [Mozillas ssh_scan](https://github.com/mozilla/ssh_scan) verktyg för att skanna SSH konfigurationen på våra servrar. Kör följande kommando lokalt på er dator.

```
docker run -it mozilla/ssh_scan /app/bin/ssh_scan -t <domain>
```

Alla servrar borde ha samma SSH konfiguration så det räcker att köra den mot er load balancer. Man får rätt mycket text utskriven men det viktiga är vad den skriver för `recommendation`, jag fick följande:

```
"recommendations": [
  "Remove these key exchange algorithms: diffie-hellman-group16-sha512, diffie-hellman-group18-sha512, diffie-hellman-group14-sha256, diffie-hellman-group14-sha1",
  "Remove these MAC algorithms: umac-64-etm@openssh.com, hmac-sha1-etm@openssh.com, umac-64@openssh.com, hmac-sha1"
],
```

Scannern tycker att jag borde ta bort gamla algoritmer som inte längre är säkra. Istället för att in och leta efter vilka algoritmer vi använder och hur vi stänger av dem så kan tänker jag att vi använder oss Mozillas moderna openSSH konfigurationer. På [guidelines/openssh](https://infosec.mozilla.org/guidelines/openssh) finns det färdiga konfigurations filer för säkrare SSH.

###### Att göra {#ssh-do}

- Kopiera konfigurationen för `Modern (OpenSSH 6.7+)` från [guidelines/openssh](https://infosec.mozilla.org/guidelines/openssh), SSH:a in på load balancern och ersätt ssh konfigurationen i `/etc/ssh/sshd_config` med den nya.

- Lägg till raden `AllowUsers deploy`.

- Ändra följande rad `Subsystem sftp  /usr/lib/ssh/sftp-server -f AUTHPRIV -l INFO` till `Subsystem sftp  /usr/lib/openssh/sftp-server -f AUTHPRIV -l INFO`. Filvägen till sftp-servern är fel, och då klagar Ansible om det inte är konfigurerat rätt.

Kör ssh_scan igen och kolla att ni inte har några rekommendationer kvar. 


#### Hur säker är vår CI/CD pipeline? {#cicd}

Det är inte bara vår kod som behöver vara säker, även vår CI/CD infrastruktur är en säkerhetsrisk. Någon kan ta sig in i GitHub Actions's system och komma åt våra olika API nycklar t.ex. och på så sätt få tillgång till vår kod.

### Läs och titta {#cicd-read}

- [How Secure Is Your CICD Pipeline?](https://www.weave.works/blog/how-secure-is-your-cicd-pipeline)
- [Ultimate guide to CI/CD security and DevSecOps](https://circleci.com/blog/security-best-practices-for-ci-cd/) 



### Lästips {#lastips}

1. [Zapping the top 10](https://www.zaproxy.org/docs/guides/zapping-the-top-10-2021/), hur ni kan använda Zap för att testa OWASP10 sårbarheterna.



Läsanvisningar {#read}
--------------------------

Läsanvisningar hittar ni på sidan [bokcirkel](./../bokcirkel).

Kolla i [lektionsplanen](https://dbwebb.se/devops/lektionsplan) för att se när vi träffas för bokcirkeln.



Uppgifter  {#uppgifter}
-------------------------------------------

1. Implementera [Kontinuerlig säkerhet](uppgift/microblog-continuous-security) i Github Actions.
1. Fixa minst 5 varningar från [Zap](https://www.owasp.org/index.php/OWASP_Zed_Attack_Proxy_Project) testerna.
    - Kör Zap's [Baseline tester](https://www.zaproxy.org/docs/docker/baseline-scan/) på er produktionsmiljö för att hitta fel.
        - Mozilla har ett [blogginlägg](https://blog.mozilla.org/security/2017/01/25/setting-a-baseline-for-web-security-controls/) där de förklarar hur ni kan köra Zap med baseline testerna.
    - Uppdatera er Nginx konfiguration i Ansible med lösningarna.
1. Uppdatera Security groups bara tillåter de ip-adresser som behöver tillgång till specifika portar.
    - I Ansible, ändra så Security Groups rollen körs efter att VM's har skapats.
    - Bara portarna 22, 80 och 443 ska alla IP's kunna koppla upp sig mot. Ändra så övriga portar bara tar emot trafik från de andra virtuella maskinerna som ska använda dem. T.ex. ska bara appserver1 och appserver2 får koppla upp sig till mysql porten på database.
    - För att sätta en specifik ip, ändra `0.0.0.0/0` till `{{ groups["<host>"][0] }}/32`
1. Förbättra SSH konfigurationen.
    - Använda [Mozillas ssh_scan](https://github.com/mozilla/ssh_scan) för att hitta förbättringar. Kör det på er domännamn. Alla servrar ska ha samma konfiguration, därför behöver vi bara köra det mot en.
    - 
1. Uppdatera Ansible rollen `10-first-minutes` så att alla servrar använder den rekommenderade SSH konfigurationen.



Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

Svara på nedanstående frågor individuellt, lämna in på Canvas tillsammans med länken till ert gemensamma GitHub-repo och domännamn till microblog sidan.

Se till att följande frågor besvaras i texten:

1. Vilka fel hittade ni när ni implementerade [Kontinuerlig säkerhet](uppgift/microblog-continuous-security) i Github Actions?

2. Ändrade ni något i er kod efter ni kört Bandit? Använder ni `# nosec` för att ignorera någon kod eller skippa något test? Varför?

3. Beskriv vilka Zap varningar ni fixade och hur ni löste dem.

4. Hur skulle du definiera DevSecOps och dess roll inom devops?

5. Var skulle du säga att vi har den största säkerhets risken i vårt system och infrastruktur?

6. Veckans TIL?
