---
author:
  - aar
revision:
  "2026-10-09": "(D, aar) Tre VM's, security groups och SSH konfiguration som Ansible kod, Trivy tips."
  "2025-11-27": "(C, aar) Tog bort ssh_scan. Är deprecated"
  "2024-11-29": "(B, aar) Hopslagning av devsecops och valfritt verktyg till ett kmom."
  "2023-11-17": "(A, aar) Första versionen."
...

# Kmom03: DevSecOps och valfritt verktyg

Devops handlar om att brygga kommunikationsbarriärer, det är stort fokus på development och operations teams men även security behöver inkluderas för att det ska bli ett bra resultat. I detta kursmoment ska vi kolla på hur vi kan inkludera säkerhet i hela utvecklingsprocessen, så att alla blir ansvariga för säkerhet i ett projekt.

Ni ska också välja ett valfritt verktyg att undersöka hur det funkar och passar in i devops.

<!-- more -->

[INFO]
Detta kmom är en vecka långt, **inte** två!
[/INFO]
[FIGURE src="img/devops/devops-security.png" caption="Hur det inte ska se ut när man kör devops."]

Vi har redan gjort några saker för att förbättra vår säkerhet, vi har stängt av ssh inloggning som root användare, vi har en ny användare i database bara för microbloggen, vi pushar inte Azure credentials till GitHub och vi sparar känslig information som behövs till Actions som hemlig miljövariabler. Nu ska vi gå vidare med att aktivt leta efter säkerhetsrisk.

## Läsanvisningar {#read}

Läsanvisningar hittar ni på sidan [bokcirkel](./../bokcirkel).

Kolla i [lektionsplanen](https://dbwebb.se/devops/lektionsplan) för att se när vi träffas för bokcirkeln.

## Vad är DevSecOps {#devsecops}

Målet med DevSecOps är att alla behöver tänka på och är ansvariga för säkerheten hos en produkt. Säkerhet behöver vara en del av hela utvecklingsprocessen. Mycket inom devops handlar om automation och där vill vi även ha med säkerheten, manuell kontroll av säkerhet ska vara ett undantag inte regeln. DevSecOps har fått ett eget namn för att det är först på senare år som man börjat med att få in säkerhetstänket, det var med inte riktigt i början av devops.

### Läs och titta {#devsecops-read}

<!-- - [The “What” “How” and “Why” of DevSecOps](https://www.newcontext.com/what-is-devsecops/) -->
<!-- - [The “What” “How” and “Why” of DevSecOps](https://web.archive.org/web/20220618115729/https://newcontext.com/what-is-devsecops/)   -->
<!-- - [What is DevSecOps?](https://www.atlassian.com/continuous-delivery/principles/devsecops)   -->

- kapitel 1 "Securing devops", 1.1-1.3, i [Securing Devops](http://tinyurl.com/usyps42) (länken går till en E-bok version) för en introduktion till Continuous Security.

### Test-driven security {#tds}

Vi vill lägga in automatiska säkerhetskontroller i vår CI/CD kedja, men vi jobbar inte med säkerhet så vi har inte kunskapen att utföra säkerhetstester på vårt projekt. Som tur är finns det många projekt andra människor och företag har gjort som testar säkerhet i olika aspekter på olika system.

#### Docker {#docker}

När det kommer till att göra Docker säkrare finns det väldigt mycket man kan göra, det finns flera olika långa dokument som går igenom vad man kan göra. T.ex. [CIS Docker Benchmark](https://www.cisecurity.org/benchmark/docker/), ett av de längre dokumenten, och [OWASP Container security standard](https://github.com/OWASP/Container-Security-Verification-Standard), som tycker att CIS är för långt dokument. Ni behöver inte sätta er in i dem men om ni är intresserade rekommenderar jag OWASPs standard. Man behöver både säkra upp de image's som man skapar och själva Docker daemon som exekverar image's på servern.

### Läs och titta {#docker-read}

- [Docker security cheat sheet](https://cheatsheetseries.owasp.org/cheatsheets/Docker_Security_Cheat_Sheet.html)
- [Container security best practices](https://logz.io/blog/container-security-best-practices/)

##### Docker image security scanning {#docker_scan}

Det finns några olika verktyg för att skanna Docker images, Docker runtime och inställningar i Docker host.

###### Läs och titta {#dockerscan-read}

- [Docker Image Security Scanning: What It Can and Can't Do](https://resources.whitesourcesoftware.com/blog-whitesource/docker-image-security-scanning)
- Länken ovanför nämner fler olika verktyg, men den nämner inte Dockers egna verktyg, [Docker Bench Security](https://github.com/docker/docker-bench-security). För att se allt man "behöver" göra på sin server rekommenderar jag att ni logga in på en appserver och kör verktyget. Då får ni upp en lång lista på saker man borde fixa på en server som kör Docker. Instruktioner för hur man kör det finns i repots README, i korthet `git clone` av repot på servern och sen `sudo sh docker-bench-security.sh`. Läs bara resultatet, ni behöver inte fixa det som hittas.

#### Dependency Scanning {#dep_scan}

I vårt projekt använder vi oss av många externa paket både i Python koden för Microbloggen men även i Docker imagen. Man kan aldrig riktigt veta om ett paket man installera är säkert eller om det innehåller säkerhetsrisker. Här kommer Dependency scanning in i bilden. Dependency Scanning verktyg har oftast en stor databas som kontinuerligt uppdateras med paket som man vet innehåller kända säkerhetssårbarheter.

##### Läs och titta {#depscan-read}

- [Dependency and Container Scanning](https://microsoft.github.io/code-with-engineering-playbook/CI-CD/dev-sec-ops/dependency-and-container-scanning/)
- I uppgiften ska ni använda [Trivy](https://github.com/aquasecurity/trivy) och [Dockle](https://github.com/goodwithtech/dockle).
- Som en sidospår bör ni också läsa om [Secrets management](https://microsoft.github.io/code-with-engineering-playbook/CI-CD/dev-sec-ops/secrets-management/).

#### SAST vs. DAST vs. IAST {#ast}

Säkerhetshål kan uppstå många ställen i en applikation och då finns det många sätt vi kan försöka hitta säkerhetshålen.

Static/Dynamic/Interactive Application Security Testing syftat på olika ställen/sätt vi letar efter säkerhetshål.

##### Läs och titta {#depscan-read}

- [SAST vs. DAST](https://www.blackduck.com/blog/sast-vs-dast-difference/) för en jämförelse av de två och vad de är bra på.
- [Interactive Application Security Testing](https://snyk.io/learn/application-security/iast-interactive-application-security-testing/).

I uppgifter ska ni använda [Bandit](https://github.com/PyCQA/bandit) för SAST. Vi skippar DAST. Ett vanligt verktyg för DAST är [Zap](https://www.zaproxy.org/). Det hade hittat förbättringar i er Nginx config. Om någon vill testa så har Mozilla ett [blogginlägg](https://blog.mozilla.org/security/2017/01/25/setting-a-baseline-for-web-security-controls/) där de förklarar hur ni kan köra Zap med baseline testerna mot er produktionsmiljö.

### Infrastruktur Security {#infrastruktur}

Produktionsmiljön, CI/CD och molntjänsten vi använder kan vi också göra säkrare. Vi är dock begränsade i vad vi kan göra i och med att vi har studentkonton.

#### Azure {#azure}

När det kommer till att säkra molnmiljön handlar det om att verifiera konfiguration istället för att testa tjänsten.

Vi borde kontrollera följande:

- Att rätt brandväggsregler används i Security Groups.

- Att systemen är up-to-date genom att kolla versionen på bas imagen vi använder som OS på servrarna.

- Kontrollera rättigheterna användare har. Vi kan inte göra detta då vi har studentkonton, vi har inte tillgång till [Role based access controll (RBAC)](https://docs.microsoft.com/en-us/azure/role-based-access-control/overview). Med det kan man kontrollera vem som har rättigheter att skapa/ändra/radera resurser. Vi skulle t.ex. kunna skapa en ny användare som används av `gather_instances.yml` playbooken och den användaren har bara rättigheter att läsa data från Azure. Då hade vi inte varit lika sårbara om vi hade råkat läcka credentials.

Det finns olika verktyg för att verifiera konfigurationer i molntjänster, men vi är igen begränsade för att vi har studentkonto och inte kan sätta roller och kontrollera subscriptions. Ett populärt open-source verktyg är [ScoutSuite](https://github.com/nccgroup/ScoutSuite) men vi kan inte använda det.

Vi nöjer oss med att veta att vi borde göra det, för att vi inte kan på grund av begränsningarna med studentkonton.

##### Security Groups {#sg}

Vi kan och ska förbättra våra security groups, som det ser ut nu kan vem som helst koppla upp sig till de olika portarna som är öppna på våra servrar. Port 3306 till databasen på load balancer VM:en och port 8000 på app servrarna är öppna för hela internet. Det är onödigt när vi vet vilka IP-adresser alla servrarna har.

Regler som bygger på servrarnas IP adresser kan inte skapas innan servrarna finns. Därför körs rollen för security groups två gånger. Första gången, när VM's skapas, är reglerna öppna för alla. Sen körs `gather_instances.yml` och rollen igen med IP adresserna i `groups`, då stängs reglerna. Playbooken `security_groups.yml` gör den andra körningen och finns med i `site.yml` efter `gather_instances`.

#### Produktionsmiljön {#prod_miljo}

Det finns en hel del vi kan göra med servrarna i produktion. SSH är en viktig del i vårt arbetsflöde, Ansible behöver kunna SSH:a in till varje server för att konfigurera dem och vi gör det för att felsöka och testa saker. Dock så är vår SSH setup inte särskilt säker, även om vi har stängt av root- och password-login vilket är steg 1.

I vår struktur kan man SSH:a in till varje server från vilken IP som helst. En säkrare struktur än vad vi har är att ha en bastion/access node som fungerar som ingång till hela produktions infrastrukturen. Då hade vi skapat en till instans som endast är till för att ge tillgång till resten av servrarna. Servern hade haft en security group så att man kan SSH:a till den från vilken IP som helst. På övriga servrar sätter vi security groups som bara tillåter SSH kopplingar från bastion nodens IP. Vi kommer inte att skapa en bastion node då vi har begränsat med resurser men med en större budget hade vi gjort detta.

##### Läs och titta {#prod-read}

<!-- - [What is a bastion host?](https://www.learningjournal.guru/article/public-cloud-infrastructure/what-is-bastion-host-server/) -->

- [What is a bastion host?](https://web.archive.org/web/20240419114655/https://www.learningjournal.guru/article/public-cloud-infrastructure/what-is-bastion-host-server/)

##### SSH {#ssh}

När vi ändå är inne på SSH kopplingar så kan vi konfigurera säkrare kopplingar på servrarna. Konfigurationen som följer med vid installationen är utdaterad och innehåller algoritmer som inte längre är säkra.

###### Att göra {#ssh-do}

I uppgiften ska ni lägga den rekommenderade konfigurationen i `10-first-minutes` som en Ansible template. Mozilla har en guide med färdiga konfigurationer, [guidelines/openssh](https://infosec.mozilla.org/guidelines/openssh). Ni ska använda `Modern (OpenSSH 6.7+)`. Några saker att tänka på:

- Konfigurationen ersätter hela `/etc/ssh/sshd_config`. Använd `template` modulen med dess `validate` parameter och `sshd -t` så att Ansible inte skriver en trasig fil och låser ute er.
- Sökvägen till sftp-servern i guiden är fel för Ubuntu. Ta reda på rätt sökväg på servern, annars klagar Ansible.
- Mozillas konfiguration saknar något som Ubuntu behöver för en riktig inloggningssession (PAM). Läs i `man sshd_config`.
- Lägg inte `AllowUsers deploy` i templaten så länge ert play loggar in som `azureuser`, då låser ni ute er själva mitt i playbooken. Det finns redan ett steg som lägger till den raden i slutet av rollen.

#### Hur säker är vår CI/CD pipeline? {#cicd}

Det är inte bara vår kod som behöver vara säker, även vår CI/CD infrastruktur är en säkerhetsrisk. Någon kan ta sig in i GitHub Actions's system och komma åt våra olika API nycklar t.ex. och på så sätt få tillgång till vår kod.

### Läs och titta {#cicd-read}

- [How Secure Is Your CICD Pipeline?](https://web.archive.org/web/20231207091423/https://www.weave.works/blog/how-secure-is-your-cicd-pipeline)
- [Ultimate guide to CI/CD security and DevSecOps](https://circleci.com/blog/security-best-practices-for-ci-cd/)

### Lästips {#lastips}

1. [Zapping the top 10](https://www.zaproxy.org/docs/guides/zapping-the-top-10-2021/), hur ni kan använda Zap för att testa OWASP10 sårbarheterna.

## devsecops uppgifter {#uppgifter}

1. Implementera [Kontinuerlig säkerhet](uppgift/microblog-continuous-security) i Github Actions.
1. Uppdatera Security groups så att de bara tillåter de ip-adresser som behöver tillgång till specifika portar.
    - Bara portarna 22, 80 och 443 ska alla IP's kunna koppla upp sig mot. Övriga portar ska bara ta emot trafik från de virtuella maskiner som ska använda dem. Bara appservrarna ska få koppla upp sig till mysql porten (3306), den ligger i load balancerns security group eftersom databasen körs på load balancer VM:en. Bara load balancern ska nå port 8000 på appservrarna.
    - I `roles/security_groups/vars/main.yml` finns variablerna `app_sources` och `lb_sources` med IP adresserna (med `/32`) som regeln ska tillåta. Använd dem i de regler som ska stängas. Läs i filen hur variablerna är gjorda och förklara varför de har ett värde före `gather_instances`.
    - Kör hela `site.yml` och kontrollera att sidan fungerar och att ni kan registrera en användare (då pratar appservrarna med databasen). Kontrollera att reglerna stängt portarna, t.ex. med `nc -zv -w 5 <ip> 3306` från er egen dator, den ska inte få kontakt.

1. Uppdatera Ansible rollen `10-first-minutes` så att alla servrar använder den rekommenderade SSH konfigurationen, se [SSH](#ssh).
    - Kontrollera att ni kan logga in som `deploy` med er nyckel och att `ssh azureuser@<ip>` och inloggning med lösenord nekas.

## Valfritt verktyg uppgift {#valfritt}

[WARNING]
Denna uppgiften är valfri, eftersom det har varit mycket problem med uppgifterna så har jag valt att göra denna valfri. Jag hoppas att lite fler av er kommer ikapp i kursen.
[/WARNING]


Välj ut ett valfritt verktyg som relaterar till devops och skriv en teknisk studie, likt den som görs i [vteams](https://dbwebb.se/kurser/vteam-v1/tekniska-rapporter), om hur man kan använda verktyget i Microblog.

Studien ska bestå av fyra delar.

- Förklara vad verktyget är och vad det gör.
- Instruktioner på hur man inkorporerar verktyget i Microblog.
- Reflektera över hur verktyget passar in i och relaterar till devops.
- Skicka med screenshots på hur programmet funkar.

Skapa **inte** ett eget repo för studien utan uppdatera koden i ert repo så verktyget fungerar för er och skapa ett dokument eller en ny README fil med er text.

## Exempel på verktyg {#exempel}

Ni kan testa en mer avancerad CD strategi (det är inte ett verktyg direkt men det funkar ändå) eller Log management verktyget Loki. Via Github student pack får ni tillgång till många relevant verktyg, här är exempel på några jag hittade när jag kollade:

- New relic
- Datadog
- Sentry
- Lambdatest
- Blackfire.io
- Honeybadge
- Doppler
- ConfigCAT

Det går också bra att välja något helt annat verktyg, så länge ni kan relatera det till devops.

**Obs!** välj inte prometheus eller grafana. Vi kommer använda de i nästa kursmoment.

## Resultat & Redovisning {#resultat_redovisning}

[INFO]
På Canvas är detta en gruppinlämning. Svara på frågorna tillsammans och skicka med en länk till er tekniska rapport.
[/INFO]
Se till att följande frågor besvaras i texten:

1. Vilka fel hittade ni när ni implementerade [Kontinuerlig säkerhet](uppgift/microblog-continuous-security) i Github Actions?

1. Ändrade ni något i er kod efter ni kört Bandit? Använder ni `# nosec` för att ignorera någon kod eller skippa något test? Varför?

1. Hur skulle ni definiera DevSecOps och dess roll inom devops?

1. Var skulle ni säga att vi har den största säkerhets risken i vårt system och infrastruktur?

1. Hur var storleken på kursmomentet? Var det lagom, för mycket eller för lite?
