---
author: aar
category:
    - devops
    - kubernetes
revision:
    "2021-12-03": (A, aar) Första revisionen.
...
Sätt upp ett Kubernetes kluster i AKS med HTTPS
==================================

[FIGURE src=/image/devops/sucess.png caption="kuard i webbläsaren"]

Nu ska vi lära oss att sätta upp ett Kubernetes kluster i Azure med deras AKS tjänst. I klustret startar vi upp en simpel demo app och kopplar på HTTPS med hjälp av en [Nginx ingress](https://kubernetes.github.io/ingress-nginx) och en [Cert-manager](https://cert-manager.io).

<!--more-->

Förutsättning {#pre}
-------------------------------

Du har en förståelse över hur kubernetes fungerar. Du vet vad följande saker är.

- pods
- services
- deployment



Installera verktyg {#install}
-------------------------------

Vi behöver lite verktyg för att lyckas med detta.

### az cli {#az}

Vi behöver få tillgång till Azure via terminalen, det använder vi [az cli](https://docs.microsoft.com/en-us/cli/azure/) till.

Installera az cli genom att följa instruktionerna i [Installera Azure CLI](https://docs.microsoft.com/sv-se/cli/azure/install-azure-cli).

Kör sen `az login` och logga in på er Azure användare.



### kubectl {#kubectl}

Vi ska använda [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/) för att jobba mot vårt kluster från terminalen.

Installera kubectl genom att följa instruktionerna i [Install Tools](https://kubernetes.io/docs/tasks/tools/). Jag rekommendera att göra [Enabling shell autocompletion](https://kubernetes.io/docs/tasks/tools/install-kubectl/#enabling-shell-autocompletion) så kan ni använda `tab` för att autocomplete kommandon och resurser i kubectl.



### helm {#helm}

[Helm](https://helm.sh/docs/) är en pakethanterare för kubernetes. Med helm går det att ladda ner färdiga pods och andra resurser till vårt kluster. Vi ska använda det för att installera en `cert-manager` för att få till HTTPS.

Installera helm genom att följ instruktionerna i [Install Tools](https://helm.sh/docs/intro/install/).




Skapa ett kluster på AKS {#aks}
-------------------------------

[AKS](https://docs.microsoft.com/en-us/azure/aks/intro-kubernetes) är ett "managed kubernetes kluster", vilket betyder att Azure sätter upp kubernetes miljön. Då behöver vi bara tänka på att använda klustret. Alla stora molntjänster har sin egna version av AKS. 

Jobba igenom videon nedanför och skapa ett kluster.

[YOUTUBE src=aCZW1f0Jkn4 caption="Skapa ett AKS kluster"]

När ni har skapat ett kluster ska vi göra så att vi kommer åt det med kubectl.

### Hämta config till kubectl {#config}

Börja med att kolla att vi hitta klustret med az cli. Om ni inte körde `az login` efter installationen behöver ni göra det nu.

```
az aks show --name <namnet ni gav ert kluster> --resource-group <namn på er resursgrupp>
```

Om ni fick en lång utskrift json data har allt gått bra. Kör nästa kommando för att ladda ner config till kubectl.


<!-- az aks create --resource-group DIDA-ANAR12-DV1617-H21-LP2 --name small-test2 --node-count 1 --kubernetes-version 1.20.9 --subscription DIDA-DV1617-H21-LP2 --node-vm-size "Standard_B4ms" --enable-azure-rbac --load-balancer-sku standard --location northeurope --enable-aad --enable-managed-identity

cost optimized preset configuration.

Availability None

version 1.20.9
create

az aks show --name small-test3 --resource-group DIDA-ANAR12-DV1617-H21-LP2
az aks get-credentials --name demo3 --resource-group DIDA-ANAR12-DV1617-H21-LP2
https://cert-manager.io/docs/tutorials/acme/ingress/#step-2-deploy-the-nginx-ingress-controller
 -->

```
$ az aks get-credentials --name <klusternamn> --resource-group <resursgrupp>
Merged "demo" as current context in /home/zeldah/.kube/config
```

Kolla att det fungerade med följande kommand:

```
$ kubectl get nodes

NAME                                STATUS     ROLES   AGE     VERSION
aks-agentpool-86164874-vmss000000   Ready      agent   11m     v1.20.9
aks-userpool-86164874-vmss000000    Ready      agent   9m46s   v1.20.9
```



Felsök {#felsok}
-------------------------------

Det är mycket möjligt att något går fel när ni ska göra resten av stegen. Ni kan använda följande kommandon för att försöka felsöka.

```
kubectl get pods

kubectl describe <pod>

kubectl describe deployment <deployment>

kubectl logs <pod>
```



Ingress som load balancer {#ingress}
-------------------------------

Ni ska använda [Ingress-Nginx](https://kubernetes.github.io/ingress-nginx) som load balancer i klustret.

Innan ni sätter upp den ska ni läsa om skillnaden mellan NodePort, load balancer och ingress.

Läs [Kubernetes NodePort vs LoadBalancer vs Ingress? When should I use what?](https://medium.com/google-cloud/kubernetes-nodeport-vs-loadbalancer-vs-ingress-when-should-i-use-what-922f010849e0).


Nu när ni vet skillnaden på olika sätt att hantera tillgång till vårt kluster ska ni sätta upp en nginx ingress.



### Installera ingress-nginx {#install-nginx}

Använd helm för att ladda ner `ingress-ngingx`.

```
$ helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx # lägger till repot för nginx-ingress

$ helm repo update # laddar ner innehållet från repot 
Hang tight while we grab the latest from your chart repositories...
...Skip local chart repository
...Successfully got an update from the "stable" chart repository
...Successfully got an update from the "ingress-nginx" chart repository
...Successfully got an update from the "coreos" chart repository
Update Complete. ⎈ Happy Helming!⎈

$ helm install nginx ingress-nginx/ingress-nginx --set rbac.create=true --version 4.0.12 # installerar ingressen i vårt kluster, sätter upp resurserna.
NAME: nginx
LAST DEPLOYED: Wed Dec  1 14:23:02 2021
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
The ingress-nginx controller has been installed.
It may take a few minutes for the LoadBalancer IP to be available.
You can watch the status by running 'kubectl --namespace default get services -o wide -w nginx-ingress-nginx-controller'

An example Ingress that makes use of the controller:
  apiVersion: networking.k8s.io/v1
  kind: Ingress
  metadata:
    name: example
    namespace: foo
  spec:
    ingressClassName: nginx
    rules:
      - host: www.example.com
        http:
          paths:
            - backend:
                service:
                  name: exampleService
                  port:
                    number: 80
              path: /
    # This section is only required if TLS is to be enabled for the Ingress
    tls:
      - hosts:
        - www.example.com
        secretName: example-tls

If TLS is enabled for the Ingress, a Secret containing the certificate and key must also be provided:

  apiVersion: v1
  kind: Secret
  metadata:
    name: example-tls
    namespace: foo
  data:
    tls.crt: <base64 encoded cert>
    tls.key: <base64 encoded key>
  type: kubernetes.io/tls
```

Ni borde fått en liknande utskrift som ovanför. Vi kan kolla att det fungerade.

```
$ kubectl get svc
NAME                                       TYPE           CLUSTER-IP     EXTERNAL-IP    PORT(S)                      AGE
kubernetes                                 ClusterIP      10.0.0.1       <none>         443/TCP                      12m
nginx-ingress-nginx-controller             LoadBalancer   10.0.110.154   20.105.99.40   80:31787/TCP,443:30269/TCP   43s
nginx-ingress-nginx-controller-admission   ClusterIP      10.0.190.63    <none>         443/TCP                      43s
```

Noter vilken ip ni har under `EXTERNAL-IP`, om det står "pending" håller AKS på att skapa en IP åt er. Det kan ta ett par minuter. Kör kommandot igen tills ni har en `EXTERNAL-IP`.

Öppna den IP i er webbläsare, då ska ni få upp en Nginx 404 sida.

[FIGURE src=/image/devops/ip-404.png caption="Nginx 404 i webbläsaren"]



### Koppla er domän till IP {#domain}

Gå in på Azure och DNS zone, uppdatera era A records till att peka på er externa IP.



### Driftsätt demo appen {#deploy}

Vi kommer använda oss av demo appen [kuard](https://github.com/kubernetes-up-and-running/kuard) för att testa få igång allt. Jag förväntar mig att hi har koll på hur yml filerna ser ut för kubernetes och kommer därför inte förklara innehåller nedanför jätte mycket.

Vi börjar med en deployment för själva appen. Lägg följande innehåll i filen `01-deployment.yml`

```
# 01-deployment.yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: kuard
spec:
  selector:
    matchLabels:
      app: kuard
  replicas: 1
  template:
    metadata:
      labels:
        app: kuard
    spec:
      containers:
      - image: gcr.io/kuar-demo/kuard-amd64:1
        imagePullPolicy: Always
        name: kuard
        ports:
        - containerPort: 8080
```

Aktivera den med:

```
$ kubectl apply -f 01-deployment.yml
deployment.apps/kuard created

$ kubectl get deployment
NAME                             READY   UP-TO-DATE   AVAILABLE   AGE
kuard                            1/1     1            1           75s
nginx-ingress-nginx-controller   1/1     1            1           9m28s
```

Nu ska vi lägga till en service så vi kan komma åt poden. Lägg följande i `02-service.yml`.

```
# 02-service.yml
apiVersion: v1
kind: Service
metadata:
  name: kuard
spec:
  ports:
  - port: 80
    targetPort: 8080
    protocol: TCP
  selector:
    app: kuard
```

Aktivera det med:

```
$ kubectl apply -f 002-service.yaml 
service/kuard created

$ kubectl get svc
NAME                                       TYPE           CLUSTER-IP     EXTERNAL-IP     PORT(S)                      AGE
kuard                                      ClusterIP      10.0.92.208    <none>          80/TCP                       67s
kubernetes                                 ClusterIP      10.0.0.1       <none>          443/TCP                      31m
nginx-ingress-nginx-controller             LoadBalancer   10.0.194.219   20.105.99.40   80:30710/TCP,443:32004/TCP   10m
nginx-ingress-nginx-controller-admission   ClusterIP      10.0.189.69    <none>          443/TCP                      10m
```

Nu ska vi skapa vår [ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/) som exponerar vår service utanför klustret. Lägg följande i filen `03-ingress.yml`, byt ut `<ditt domännamn>` till ditt domännamn.

```
# 03-ingress.yml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: kuard
  annotations:
    kubernetes.io/ingress.class: "nginx" # kopplar vår ingress till den installerade nginx-ingress
    # cert-manager.io/issuer: "letsencrypt-staging"

spec:
  tls: # sätter att vi ska bara acceptera https trafik till er domän
  - hosts:
    - <ditt domännamn>
    secretName: demo-tls # det kommer senare skapas en secret med detta namnet som innehåller certificatet för vårt domännamn.
  rules:
  - host: <ditt domännamn>
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: kuard
            port:
              number: 80
```

Kör nu följande för att aktivera den:

```
$ kubectl apply -f 003-ingress.yaml 
ingress.networking.k8s.io/kuard created

$ kubectl get ingress
NAME    CLASS    HOSTS               ADDRESS   PORTS     AGE
kuard   <none>   <domännamn>                   80, 443   16s
```

Det kan ta några minuter att skapa den. Ni kan köra `kubectl get ingress -w` för att se när ingressen är klar. När den får en ip under ADDRESS är den redo. Tryck då `ctrl+c` för att avbryta att kolla på er ingress.

```
$ kubectl get ingress -w
NAME    CLASS    HOSTS         ADDRESS         PORTS     AGE
kuard   <none>   <domännamn>                   80, 443   16s
kuard   <none>   <domännamn>   20.105.99.40    80, 443   58s
```

För att kolla att det fungerar, gå till webbläsaren och gå till ert domännamn. **Använd** `http://` framför, vi har inte skaffat certifikat för HTTPS än. I webbläsaren borde ni få upp en säkerhetsvarning, då funkar det.

Ni kan också testa det från terminalen med `curl -kivL http://<domän>` eller `http://<ip>`. Då ska ni få en av två följande ut utskrifter:

```
...
  <html>
<head><title>404 Not Found</title></head>
<body>
<center><h1>404 Not Found</h1></center>
<hr><center>nginx</center>
</body>
</html>
```

alternativt

```
<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">

  <title>KUAR Demo</title>

  <link rel="stylesheet" href="/static/css/bootstrap.min.css">
  <link rel="stylesheet" href="/static/css/styles.css">

  <script>
var pageContext = {"hostname":"kuard-5cd5556bc9-mml79","addrs":["10.244.0.10"],"version":"v0.8.1-1","versionColor":"hsl(18,100%,50%)","requestDump":"GET / HTTP/1.1\r\nHost: arnesson.tech\r\nAccept: */*\r\nUser-Agent: curl/7.74.0\r\nX-Forwarded-For: 10.244.0.1\r\nX-Forwarded-Host: arnesson.tech\r\nX-Forwarded-Port: 443\r\nX-Forwarded-Proto: https\r\nX-Forwarded-Scheme: https\r\nX-Real-Ip: 10.244.0.1\r\nX-Request-Id: 8d31add9483d046f572171216e7f01b7\r\nX-Scheme: https","requestProto":"HTTP/1.1","requestAddr":"10.244.0.8:48746"}
  </script>
</head>


<svg style="position: absolute; width: 0; height: 0; overflow: hidden;" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<defs>
<symbol id="icon-power" viewBox="0 0 32 32">
<title>power</title>
<path class="path1" d="M12 0l-12 16h12l-8 16 28-20h-16l12-12z"></path>
</symbol>
<symbol id="icon-notification" viewBox="0 0 32 32">
<title>notification</title>
<path class="path1" d="M16 3c-3.472 0-6.737 1.352-9.192 3.808s-3.808 5.72-3.808 9.192c0 3.472 1.352 6.737 3.808 9.192s5.72 3.808 9.192 3.808c3.472 0 6.737-1.352 9.192-3.808s3.808-5.72 3.808-9.192c0-3.472-1.352-6.737-3.808-9.192s-5.72-3.808-9.192-3.808zM16 0v0c8.837 0 16 7.163 16 16s-7.163 16-16 16c-8.837 0-16-7.163-16-16s7.163-16 16-16zM14 22h4v4h-4zM14 6h4v12h-4z"></path>
</symbol>
</defs>
</svg>

<body>
  <div id="root"></div>
  <script src="/built/bundle.js" type="text/javascript"></script>
</body>
</html>
* Connection #1 to host arnesson.tech left intact
```

Nu är ni redo att skaffa certifikat för HTTPS.



### Installera cert-manager {#cert-manager}

Vi ska nu installer en [cert-manager](https://cert-manager.io/docs/) den lägger till två nya [egenskapade resurs](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/) typer i vårt kluster, `Issuer` och `Certificate`.

Kör följande kommando för att installera:

```
$ kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.6.1/cert-manager.yaml
customresourcedefinition.apiextensions.k8s.io/certificaterequests.cert-manager.io created
customresourcedefinition.apiextensions.k8s.io/certificates.cert-manager.io created
customresourcedefinition.apiextensions.k8s.io/challenges.acme.cert-manager.io created
...

$ kubectl get pods -n cert-manager
NAME                                      READY   STATUS    RESTARTS   AGE
cert-manager-55658cdf68-gxt9d             1/1     Running   0          4m58s
cert-manager-cainjector-967788869-d82vt   1/1     Running   0          4m58s
cert-manager-webhook-7b86bc6578-b2vsf     1/1     Running   0          4m58s
```

Vänta tills att de är redo innan ni går vidare till nästa steg.



### Let's Encrypt Issuer {#issuer}

Nästa steg är att sätta upp en [Issuer](https://cert-manager.io/docs/concepts/issuer), det är den som genererar [certifikaten](https://cert-manager.io/docs/concepts/certificate/). Det finns två typer av issuers, Issuer och ClusterIssuer. En Issuer är begränsad till ett namespace, medans en CluserIssuer kan jobba i alla namespace. Vi använder Issuer för att vi jobbar bara i ett namespace, `default`.

Vi kommer sätta upp två issuers då Let's Encrypt har en begränsning på antalet gånger man får [fråga efter nya certifikat](https://letsencrypt.org/docs/rate-limits/) till produktion. Det blir lätt fel i början så då testar vi först med en staging issuer.

Skapa `04-issuer-staging.yml` och lägg till följande konfiguration. Byt ut `<din email>` mot din email.

```
# 04-issuer-staging.yml
apiVersion: cert-manager.io/v1
kind: Issuer
metadata:
  name: letsencrypt-staging
spec:
  acme:
    # The ACME server URL
    server: https://acme-staging-v02.api.letsencrypt.org/directory
    # Email address used for ACME registration
    email: <din email>
    # Name of a secret used to store the ACME account private key
    privateKeySecretRef:
      name: letsencrypt-staging
    # Enable the HTTP-01 challenge provider
    solvers:
    - http01:
        ingress:
          class:  nginx
```

Aktivera den med `kubectl apply -f 04-issuer-staging.yml`. Kör sen `kubectl describe Issuer letsencrypt-staging` för att se att allt gick bra.

```
Name:         letsencrypt-staging
Namespace:    default
Labels:       <none>
Annotations:  <none>
API Version:  cert-manager.io/v1
Kind:         Issuer
Metadata:
  Creation Timestamp:  2021-12-01T14:58:15Z
  Generation:          1
  Managed Fields:
    API Version:  cert-manager.io/v1
    Fields Type:  FieldsV1
    fieldsV1:
      f:metadata:
        f:annotations:
          .:
          f:kubectl.kubernetes.io/last-applied-configuration:
      f:spec:
        .:
        f:acme:
          .:
          f:email:
          f:privateKeySecretRef:
            .:
            f:name:
          f:server:
          f:solvers:
    Manager:      kubectl-client-side-apply
    Operation:    Update
    Time:         2021-12-01T14:58:15Z
    API Version:  cert-manager.io/v1
    Fields Type:  FieldsV1
    fieldsV1:
      f:status:
        .:
        f:acme:
          .:
          f:lastRegisteredEmail:
          f:uri:
        f:conditions:
    Manager:         controller
    Operation:       Update
    Time:            2021-12-01T14:58:16Z
  Resource Version:  11689
  UID:               584f8f36-4526-4432-9913-fab095dd6725
Spec:
  Acme:
    Email:            aar@bth.se
    Preferred Chain:  
    Private Key Secret Ref:
      Name:  letsencrypt-staging
    Server:  https://acme-staging-v02.api.letsencrypt.org/directory
    Solvers:
      http01:
        Ingress:
          Class:  nginx
Status:
  Acme:
    Last Registered Email:  aar@bth.se
    Uri:                    https://acme-staging-v02.api.letsencrypt.org/acme/acct/35545288
  Conditions:
    Last Transition Time:  2021-12-01T14:58:16Z
    Message:               The ACME account was registered with the ACME server
    Observed Generation:   1
    Reason:                ACMEAccountRegistered
    Status:                True
    Type:                  Ready
Events:                    <none>
```

Kolla att `Status` är True. Vi använder [HTTP01](https://cert-manager.io/docs/configuration/acme/http01/) challenge providers för att få certifikaten, det finns också [DNS01](https://cert-manager.io/docs/configuration/acme/dns01/).

Nu ska vi skapa en likadan för prod istället för staging. Skapa `05-issuer-prod.yml` och lägg till följande konfiguration. Byt ut `<din email>` mot din email.

```
# 05-issuer-prod.yml
apiVersion: cert-manager.io/v1
kind: Issuer
metadata:
  name: letsencrypt-prod
spec:
  acme:
    # The ACME server URL
    server: https://acme-v02.api.letsencrypt.org/directory
    # Email address used for ACME registration
    email: <din email>
    # Name of a secret used to store the ACME account private key
    privateKeySecretRef:
      name: letsencrypt-prod
    # Enable the HTTP-01 challenge provider
    solvers:
    - http01:
        ingress:
          class: nginx
```

Aktivera den med `kubectl apply -f 05-issuer-prod.yml`. Kör sen `kubectl describe Issuer letsencrypt-prod` och kolla att ni får liknande utskrift som för staging.



### Aktivera HTTPS (TLS) {#activate_tls} 

Nu borde vi ha grunden för att få igång HTTPS för klustret. 

#### Staging {#staging}

Öppna `03-ingress.yml` och avkommentera raden `# cert-manager.io/issuer: "letsencrypt-staging"`. Aktivera sen er uppdaterade Ingress, cert-manager kommer då se annotationen för staging och aktivera er staging Issuer. Det kommer skapa ett fejk certifikat som läggs i er secret.

```
$ kubectl apply -f 003-ingress.yaml 
ingress.networking.k8s.io/kuard configured

$ kubectl get certificate
NAME       READY   SECRE      AGE
demo-tls   False    demo-tls   4m
```

Vänta på att den blir redo, ni kan köra `kubectl get certificate -w` för att övervaka den tills den blir redo. Det kan ta någon minut innan den blir redo. Om det tar med än 3-5 min kan ni kolla loggarna för cert-managern och kolla om något är fel:

```
$ kubectl get po -n cert-manager
NAME                                       READY   STATUS    RESTARTS   AGE
cert-manager-5b54dc9c97-wrj8w              1/1     Running   0          179m
cert-manager-cainjector-84565c968b-797x4   1/1     Running   0          179m
cert-manager-webhook-d9d886b4c-rjql5       1/1     Running   0          179m

$ kubectl logs cert-manager-5b54dc9c97-wrj8w -n cert-manager
```

Vi kan få en mer detaljerad vy över certifikatet. 

```
$ kubectl describe certificate demo-tls
Name:         demo-tls
Namespace:    default
Labels:       <none>
Annotations:  <none>
API Version:  cert-manager.io/v1
Kind:         Certificate
Metadata:
  Creation Timestamp:  2021-12-01T15:00:59Z
  Generation:          1
  Managed Fields:
    API Version:  cert-manager.io/v1
    Fields Type:  FieldsV1
    fieldsV1:
      f:metadata:
        f:ownerReferences:
          .:
          k:{"uid":"91034500-dd3b-4a05-b53f-341b25600cd2"}:
            .:
            f:apiVersion:
            f:blockOwnerDeletion:
            f:controller:
            f:kind:
            f:name:
            f:uid:
      f:spec:
        .:
        f:dnsNames:
        f:issuerRef:
          .:
          f:group:
          f:kind:
          f:name:
        f:privateKey:
        f:secretName:
        f:usages:
      f:status:
        .:
        f:conditions:
        f:notAfter:
        f:notBefore:
        f:renewalTime:
        f:revision:
    Manager:    controller
    Operation:  Update
    Time:       2021-12-01T15:01:25Z
  Owner References:
    API Version:           networking.k8s.io/v1
    Block Owner Deletion:  true
    Controller:            true
    Kind:                  Ingress
    Name:                  kuard
    UID:                   91034500-dd3b-4a05-b53f-341b25600cd2
  Resource Version:        12085
  UID:                     102284a3-0cdb-43b0-8182-86ea7a76246f
Spec:
  Dns Names:
    arnesson.tech
  Issuer Ref:
    Group:      cert-manager.io
    Kind:       Issuer
    Name:       letsencrypt-staging
  Secret Name:  demo-tls
  Usages:
    digital signature
    key encipherment
Status:
  Conditions:
    Last Transition Time:  2021-12-01T15:01:25Z
    Message:               Certificate is up to date and has not expired
    Observed Generation:   1
    Reason:                Ready
    Status:                True
    Type:                  Ready
  Not After:               2022-03-01T14:01:24Z
  Not Before:              2021-12-01T14:01:25Z
  Renewal Time:            2022-01-30T14:01:24Z
  Revision:                1
Events:
  Type    Reason     Age    From          Message
  ----    ------     ----   ----          -------
  Normal  Issuing    5m27s  cert-manager  Issuing certificate as Secret was previously issued by Issuer.cert-manager.io/letsencrypt-prod
  Normal  Reused     5m27s  cert-manager  Reusing private key stored in existing Secret resource "demo-tls"
  Normal  Requested  5m27s  cert-manager  Created new CertificateRequest resource "demo-tls-llqhg"
  Normal  Issuing    5m1s   cert-manager  The certificate has been successfully issued
```

På slutet vill vi att det ska stå typ `Normal  Issuing    45s   cert-manager  The certificate has been successfully issued`.

Vi kan också kolla att vi har fått en secret.

```
$ kubectl describe secret demo-tls
Name:         demo-tls
Namespace:    default
Labels:       <none>
Annotations:  cert-manager.io/alt-names: arnesson.tech
              cert-manager.io/certificate-name: demo-tls
              cert-manager.io/common-name: arnesson.tech
              cert-manager.io/ip-sans: 
              cert-manager.io/issuer-group: cert-manager.io
              cert-manager.io/issuer-kind: Issuer
              cert-manager.io/issuer-name: letsencrypt-prod
              cert-manager.io/uri-sans: 

Type:  kubernetes.io/tls

Data
====
tls.crt:  5595 bytes
tls.key:  1679 bytes
```

Nu är ni redo att skapa certifikatet på riktigt och aktivera HTTPS.



#### prod {#prod}

Öppna `03-ingress.yaml` igen, på raden vi avkommenterade, byt ut `staging` mot `prod`. Aktivera er Ingress igen.

```
$ kubectl apply -f 003-ingress.yaml 
ingress.networking.k8s.io/kuard configured
```

Nu har vi dock redan en secret med samma namn. Det gör att det inte skapas ett nytt certifikat. För att det ska ske måste vi ta bort den gamla.

```
$ kubectl delete secret demo-tls
secret "demo-tls" deleted
```

Nu kan ni köra samma kommandon för att kolla att det gick bra som ni gjorde för staging.

```
$ kubectl describe certificate demo-tls
...

$ kubectl describe secret demo-tls
...

$ kubectl get certificate
...
```

Om det tar tid kan ni kolla om `kubectl describe order` och `kubectl describe challenge` finns och om de har någon info.

<!--
 $ kubectl describe order demo-tls-889745041 # får slutet från kommandot ovanför
 $ kubectl describe challenge demo-tls-889745041-0
 $ kubectl describe order demo-tls-889745041
 $ kubectl describe certificate demo-tls
-->

That's it! Nu kan ni gå till er domän i webbläsaren och ni borde mötas av en liknande vy.

[FIGURE src=/image/devops/sucess.png caption="kuard i webbläsaren"]



Städa upp {#cleanup}
-------------------------------

Gå in på Azure och radera ert kluster eller kör `kubectl delete all --all` och `kubectl delete ingress name -n namespace` för att radera alla resurser i klustret.



Avslut {#avslut}
-------------------------------

Då har ni satt upp ett kluster i AKS och aktiverat HTTPS till det. Många nya begrepp och kommandon då blir det rätt lite rörigt. Ta en liten paus innan ni fortsätter med resen av kursmomentet.
