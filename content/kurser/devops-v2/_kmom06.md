---
author:
    - aar
revision:
    "2021-12-03": "(C, aar) Bytt Minikube till AKS."
    "2020-12-04": "(B, aar) Bytt AWS till Minikube."
    "2019-10-15": "(A, aar) Första versionen."
...
Kmom06: Container orchestration
==================================

Er Microblog har fått många nya användare och ni behöver utöka er infrastruktur för att hantera trycket på servrarna. Ni börjar med att utöka hur ni använder Ansible och startar upp fler servrar och containrar på servrarna. Dock märker ni snabbt att det är krångligt och Ansible är inte gjort för att användas till detta. Istället börjar ni med att läsa på om container orchestration.

<!-- more -->
[WARNING]
Kursmomentet är under uppdatering!

Påbörja inte förens denna gula ruta är borta!
[/WARNING]
[FIGURE src="https://miro.medium.com/max/660/1*Mdj9wylSl0wqJ9sB0ENbRA.png" caption="Hur det är att lära sig kubernetes."]

[INFO]
PS! Om ni har fått kmom05 rättat, radera alla era resurser på Azure förutom er DNS zone.

Innan ni sätter igång med kursmomentet kolla att ert Microblog repo är synkat med originalet, [Syncing a fork](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/syncing-a-fork).

PS! Om ni har fått kmom05 rättat, radera alla era resurser på Azure förutom er DNS zone.
[/INFO]

[INFO]
I detta kursmomentet ska ni jobba individuellt, ni får fortfarande diskutera och hjälpa varandra. Men eftersom ni bara har ett repo för gruppen behöver vi strukturera filerna i mappar. Filerna ni producerar ska läggas i mappen "kubernetes". Skapa en undermapp per gruppmedlem med ert namn och lägga era filer i dem. T.ex. för mig hade det blivit "kubernetes/andreas/fil.yml".
[/INFO]

Vi kommer använda oss utav Kubernetes (K8s) för container orchestration men det är bra att känna till vilka andra verktyg som finns och lite om vad som skiljer dem åt.


### Container Orchestration {#co}

Container orchestration är det övergripandet namnet på verktyg som hantera livscykeln för många containers.

#### Läs och titta {#co-read}

- [What Is Container Orchestration?](https://web.archive.org/web/20210125081227/https://blog.newrelic.com/engineering/container-orchestration-explained/)



### Kubernetes {#k8s}

Ni ska lära er Kubernetes vilket är ett av de populäraste verktygen men samtidigt det mest komplicerade. Det innebär att det är mycket kopierande och skriva av.

Kubernetes har själva väldigt mycket och bra material för att lära sig Kubernetes och alla dess delar. En bra utgångspunkt är deras [dokumentation](https://kubernetes.io/docs/home/), där finns länkar till det mesta.

#### Läs och titta {#k8s-read}

Börja med en snabb introduktion till Kubernetes begrepp.

[YOUTUBE src="PH-2FfFD2PU" caption="Kubernetes in 5 mins."]

Om det inte var pedagogiskt nog förklaring av Kubernetes kan jag rekommendera följande video där de lär ut Kubernetes som en barnbok.

[YOUTUBE src="Q4W8Z-D-gcQ" caption="The Illustrated Children's Guide to Kubernetes."]

#### Att göra {#k8s-do}

- Jobba igenom modul 1-6 i [Learn Kubernetes basics](https://kubernetes.io/docs/tutorials/kubernetes-basics/). För att få en bättre förståelse för grunderna i K8s (Kubernetes) och hur man kan interagera med det.



#### Kubernetes yaml {#yaml}

Det finns två sätt att hantera objekt (pods, deployments, etc...) i K8s, imperative och declarative. I imperative kör vi kommandon i terminalen för att jobba mot ett K8s kluster, som ni gjorde i Kubernetes basics, och i declarative skriver vi konfiguration i filer och kör mot klustret.

Vi vill givetvis jobba declarative för att då kan vi spara konfigurationen i Git och vi behöver inte oroa oss för snowflake servrar eller att bara en person har kunskapen om klustret.

[FIGURE src="http://assets.digitalocean.com/articles/comics/imperative-declarative-k8s.jpg" caption="digitalocean förklarar [imperativ vs declarative](https://www.digitalocean.com/community/tutorials/imperative-vs-declarative-kubernetes-management-a-digitalocean-comic)"]


##### Läs och titta {#k8s-read}

- [För och nackdelar med deklarativ vs imperativ](https://kubernetes.io/docs/concepts/overview/working-with-objects/object-management/).
- För att se hur K8s strukturerar yaml filer läs [Kubernetes deployment tutorial](https://devopscube.com/kubernetes-deployment-tutorial/). Ni behöver bara läsa, inte jobba igenom.



### Stateless applications {#statless}

K8s bygger på virtualisering och containrar, vilket i grunden är stateless. Vi har inte tillgång till persistent data, när vi stänger ner en container så försvinner dess data. K8s och även Docker är i grunden byggt för att köra stateless applikationer, men när populariteten av verktygen har ökat har även användningsområden ökat och de har då lagt till olika lösningar för att få till persistent data (stateful). Men det är inte lika lätt att få till persistent data i K8s som det är i Docker.

#### Läs och titta {#stateless-read}

- Läs [Stateful vs Stateless Applications on Kubernetes](https://linuxhint.com/stateful-vs-stateless-kubernetes/) för en bättre genomgång av skillnaden.

#### Att göra {#stateless-do}

- Jobba igenom [Deploying PHP Guestbook application with Redis](https://kubernetes.io/docs/tutorials/stateless-application/guestbook/).



### Stateful applications {#stateful}

Nu när ni har testat på att köra en stateless applikation i K8s ska ni lära er hur man kan köra en stateful applikation.

#### Läs och titta {#stateful-read}

- [The sad state of stateful Pods in Kubernetes](https://elastisys.com/sad-state-stateful-pods-kubernetes/) för en förklaring av problemet med stateful applikationer.

Kolla på följande videos om volymer i Kubernetes.

[YOUTUBE src="VB7vI9OT-WQ" caption="Kubernetes Volumes 1: emptydir, NFS, YAML, volumes, and intro to Persistent Volume Claims"]

[YOUTUBE src="OulmwTYTauI" caption="Kubernetes Volumes 2: Understanding Persistent Volume (PV) and Persistent Volume Claim (PVC)"]


- Läs [StatefulSet Basics](https://kubernetes.io/docs/tutorials/stateful-application/basic-stateful-set/).


#### Att göra {#stateful-do}

- Jobba igenom [Deploying WordPress and MySQL with Persistent Volumes](https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/).



### Designa för Kubernetes {#design} 

Ni har nu titta lite på hur en applikations design/arkitektur påverkar hur lätt det är att köra den i K8s. Det finns så klart flera saker som är bra att tänka på när man skapa sin applikation men även hur man sätter upp den i K8s.

#### Läs och titta {#design-read}

- [Architecting Applications for Kubernetes](https://www.digitalocean.com/community/tutorials/architecting-applications-for-kubernetes) tar upp lite om hur man ska tänka runt applikationen men även hur man använder K8s.

- [Modernizing Applications for Kubernetes](https://www.digitalocean.com/community/tutorials/modernizing-applications-for-kubernetes) handlar  om hur man kan skriva om en applikation för att den ska fungera bättre för K8s.



### Kubernetes i Azure {#aks}

Det finns en uppsjö av olika sätt och verktyg för att köra Kubernetes beroende på vilken miljö man vill köra det i. Man kan installera det lokalt, köpa in sig på redan uppsatta k8s miljöer eller tjänster som sätter upp k8s miljön åt oss. Vi ska använda sista alternativet, Azure's AKS tjänst.

Ni ska nu jobba igenom en artikel som går igenom hur vi sätter upp ett kluster i AKS, installerar en demo och fixar HTTPS till den.

#### Att göra {#aks-do}

- Jobba igenom [Sätt upp ett Kubernetes kluster i AKS med HTTPS](kunskap/aks-kluster-https).



### Microblog i Kubernetes {#microblog}

Nu ska ni sätta upp Microbloggen i Kubernetes. Skapa ett nytt kluster i AKS med samma inställningar som ni gjorde sist, i videon. Arbetet är uppdelat i tre sektioner nedanför. Spara alla filer i `kubernetes/` mappen.



#### Mysql i Kubernetes {#mysql}

Jobba igenom [Mysql i Kubernetes](kunskap/mysql_i_kubernetes) för att sätta upp en Mysql server i ert kluster. Den förutsätter att ni har skapat klustret och kopplat kubectl till det.

Ni behöver inte köra någon SQL kod då Migrations i Flask sköter det när vi startar Microblogen.



#### Microblog deployment {#microblog}

Nästa steg är att skapa en deployment för Microblogen. Ni borde ha lärt er tillräckligt för att skapa en `service`,  `deployment` och `ingress` för Microblogen. Er microblog deployment ska ha 2 replicas, så att det alltid finns två pods rullande som kan hantera trafik. Ni ska komma åt er Microblog med ert domännamn och använda HTTPS.

Kolla i er `docker-compose.yml` för vilka env variabler ni behöver för att starta containern. Ni kan använda `mysql` istället för en IP till database i env variabeln `DATABASE_URL`. OBS! starta inte containern med ett specifikt network i er deployment, vi låter K8s hantera nätverk.

För att felsöka kan ni använda följande kommandon.

```
kubectl get po

kubectl describe po

kubectl describe deployment microblog

kubectl logs <pod-name>

kubectl describe ingress
```

Ett tips är att lägga till en `livenessProbe`, på containern i er Deployment. Det används av K8s för att kolla om containern är redo att användas. K8s kommer pinga `/` och kolla vad den får tillbaka för status kod, alla mellan 200 och 399 så tolkas det som att containern mår bra och kan användas.

```
       ...
       livenessProbe:
          httpGet:
            path: /
            port: 5000
        ...
```

När ni kan se er microblog via webbläsaren med ett domännamn är ni klara.



#### Automatisk skalning av er deployment {#autoscaling}

När ni har fått upp microblogen och kopplat på er domän ska ni testa att automatiskt skala er Microblog deployment, med hjälp av [Horizontal Pod Autoscaler](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/).

#### Läs och titta {#scale-read}

- Läs om fyra olika sätt att skapa k8s, [Azure Auto Scaling- Why and How ?](https://2bcloud.io/azure-auto-scaling-why-and-how/)

#### Att göra {#scale-do}

Jobba sen med i följande video för att testa på att skala er deployment.

[YOUTUBE src=webuyGs-spQ  caption="Autoscale ett kubernetes kluster med HPA."]



#### Testa olika driftsättningsstrategier i Kubernetes {#drift}

Om ni vill och har tid över kan ni testa olika driftsättningsstrategier med Kubernetes. Jag har inte hunnit testa dem än, så jag vet inte om det funkar (men det borde göra det).

- [Deployment Strategies In Kubernetes](https://auth0.com/blog/deployment-strategies-in-kubernetes/)


[INFO]
När ni har gjort det kan ni radera ert AKS kluster i Azure, ni behöver bara lämna in filerna för rättning.
[/INFO]



### Kubernetes i produktion {#production}

Vårt kluster är väldigt simpelt, det är mer ett utvecklings kluster än något man hade kört i produktion. För att få en inblick i vad som krävs för att lyckas med Kubernetes i produktion ska ni läsa följande artiklar:

#### Läs och titta {#prod-read}

- [Kubernetes in production vs. Kubernetes in development: 4 myths](https://enterprisersproject.com/article/2018/11/kubernetes-production-4-myths-debunked)

- [7 Key Considerations for Kubernetes in Production](https://thenewstack.io/7-key-considerations-for-kubernetes-in-production/)

Kolla på "Running Kubernetes in Production: A Million Ways to Crash Your Cluster" där Henning Jacobs från websidan [Zalando.se](https://www.zalando.se/) pratar om hur de använder Kubernetes och vad de lärt sig av att köra det i produktions miljön.

[YOUTUBE src="pKFQuED_2kg" caption="Running Kubernetes in Production: A Million Ways to Crash Your Cluster"]



Uppgifter  {#uppgifter}
-------------------------------------------

Följande uppgifter skall utföras och resultatet skall redovisas via me-sidan.

1. Sätt upp Microbloggen i Kubernetes på AKS, skapa alla objekten deklarativt och spara filerna i `kubernetes` mappen.

2. Radera ert AKS kluster.

3. Försäkra dig om att du har pushat repot med din senaste kod.



Läsanvisningar {#las}
--------------------------

Läsanvisningar hittar ni på sidan [bokcirkel](./../bokcirkel).

Kolla i [lektionsplanen](https://dbwebb.se/devops/lektionsplan) för att se när vi träffas för bokcirkeln.


Resultat & Redovisning  {#resultat_redovisning}
-----------------------------------------------

Svara på nedanstående frågor individuellt, lämna in på Canvas tillsammans med länken till ert gemensamma GitHub-repo och domännamn till microblog sidan.

Se till att följande frågor besvaras i texten:

1. Vad är Container orchestration?

1. Vad är ert första intryck av Kubernetes? Skulle ni vilja använda det i framtiden?

1. Varför är det svårare med stateful applikation jämfört med stateless i k8s?

1. Vad ska vi tänka på när vi designar ett projekt som ska köras i K8s?

1. Vad är viktigt att tänka på när man ska köra K8s i produktion?

1. Hur känns det efter att ni använt K8s, var det lika svårt som alla skriver/säger att det är?

1. Testade ni de olika driftsättningsstrategierna? Funkade det?
