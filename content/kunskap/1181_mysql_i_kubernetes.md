---
author:
    - moc
    - aar
category:
    - devops
    - kubernetes
    - mysql
revision:
    "2026-10-18": (B, aar) Rubriken sa att base64 skyddar lösenord, förklarar att det inte gör det.
    "2020-12-03": (A, moc) Skapad inför HT2020.
...

Mysql i Kubernetes {#intro}
=======================================================
Vi läste tidigare att det inte är så bra att köra en databas i K8s, men vi gör det ändå för att öva på stateful applikationer. Vi ska använda PersistentVolumeClaim för att få stateful data åt databasen. Det är inte säkert egentligen då vi förlorar all data om noden går ner. Om vi har gjort detta i verkligheten hade vi också kopplat vår data till en molntjänst eller server.

<!--more-->


Lösenord i Secrets {#losenord}
--------------------------------------------------------

Vi börjar med att skapa en [secret](https://kubernetes.io/docs/concepts/configuration/secret/) file då vi kommer sätta lösenord i deployments filerna. Vi behöver ett root lösenord och en lösenord åt Microblogen.

[WARNING]
Base64 är en kodning, inte kryptering. Alla som ser filen, eller kör `kubectl get secret -o yaml`, kan avkoda värdena med `base64 --decode`. En Secret skyddar alltså inte lösenordet i sig, det är åtkomsten till klustret som gör det. Skriv aldrig ett riktigt lösenord i en fil ni pushar till ett publikt repo. Ert kluster raderas efter kursmomentet, så använd lösenord som ni inte använder någon annanstans.
[/WARNING]

```
echo -n "my-super-secret-root-password" | base64
<password-string>

echo -n "micropassw" | base64
<password-string>
```

Skapa en fil, `mysql-secrets.yml`.

```
---
apiVersion: v1
kind: Secret
metadata:
  name: mysql-secrets
type: Opaque
data:
  ROOT_PASSWORD: <password-string>
  DB_PASSWORD: <password-string>
```

Aktivera dem i kubectl.

```
kubectl apply -f mysql-secrets.yml

kubectl get secret
NAME                  TYPE                                  DATA   AGE
default-token-8ld8g   kubernetes.io/service-account-token   3      37m
mysql-secrets         Opaque                                2      36s

kubectl describe secret mysql-secrets
Name:         mysql-secrets
Namespace:    default
Labels:       <none>
Annotations:
Type:         Opaque

Data
====
DB_PASSWORD:    34 bytes
ROOT_PASSWORD:  29 bytes
```



Persisten data med PersistentVolumeClaim {#volym}
--------------------------------------------------------

Skapa filen `mysql-pv.yml`.

```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: mysql-pv-volume
  labels:
    type: local
spec:
  storageClassName: manual
  capacity:
    storage: 5Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/mnt/data"
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: mysql-pv-claim
spec:
  storageClassName: manual
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 5Gi
```

Vi skapar en Volym med 5 gig och `ReadWriteOnce` så at bara en nod skall kunna använda volymen.

```
kubectl apply -f mysql-pv.yml

kubectl get persistentvolumeclaim mysql-pv-claim
NAME             STATUS   VOLUME            CAPACITY   ACCESS MODES   STORAGECLASS   AGE
mysql-pv-claim   Bound    mysql-pv-volume   5Gi        RWO            manual         66s
```



Mysql deployment {#deploy}
--------------------------------------------------------

Skapa filen `mysql-deployment.yml`. I den skapar vi en Service, så att Microblogen sen kan koppla upp sig mot databasen.

```
apiVersion: v1
kind: Service
metadata:
  name: mysql
spec:
  ports:
  - port: 3306
  selector:
    app: mysql
  clusterIP: None
```

Vi sätter `clusterIP: None` så att Servicens IP kopplas direkt mot POD:en. Det är att föredra om man bara ska ha en POD bakom en service, vilket vi ska.

Lägg till följande i slutet av filen.

```
---
apiVersion: apps/v1 # for versions before 1.9.0 use apps/v1beta2
kind: Deployment
metadata:
  name: mysql
spec:
  selector:
    matchLabels:
      app: mysql
  strategy:
    type: Recreate
  template:
    metadata:
      labels:
        app: mysql
    spec:
      containers:
      - image: mysql:5.7
        name: mysql
        env:
          # Use secret in real usage
        - name: MYSQL_USER
          value: <user>
        - name: MYSQL_DATABASE
          value: <db_name>
        - name: MYSQL_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mysql-secrets
              key: DB_PASSWORD
        - name: MYSQL_ROOT_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mysql-secrets
              key: ROOT_PASSWORD
        ports:
        - containerPort: 3306
          name: mysql
        volumeMounts:
        - name: mysql-persistent-storage
          mountPath: /var/lib/mysql
      volumes:
      - name: mysql-persistent-storage
        persistentVolumeClaim:
          claimName: mysql-pv-claim
```

Vi läser lösenorden från secrets och mountar PV:n vi skapade tidigare. Notera `strategy: type: Recreate`, det gör att K8s inte gör rolling updates. Vi vill inte använda det för databasen i och med att vi bara vill ha en igång åt gången. Nu kommer POD:en först soppas och en startas en ny med uppdaterade konfiguration.

Nu kan vi starta mysql.

```
kubectl apply -f mysql-deployment.yml

kubectl get pods -l app=mysql
NAME                     READY   STATUS    RESTARTS   AGE
mysql-647b4cc668-nwmnm   1/1     Running   0          22s
```

Ni kan testa koppla upp er till databasen.

```
kubectl run -it --rm --image=mysql:5.7 --restart=Never mysql-client -- mysql -h mysql -pmy-super-secret-root-password

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| microblog          |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql>
```

Nu har vi en databas i Kubernetes vi kan koppla Microbloggen till.