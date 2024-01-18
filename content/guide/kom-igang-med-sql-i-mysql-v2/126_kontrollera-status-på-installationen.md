---
author: mos
revision:
    "2021-12-22": "(A, mos) Ny artikel."
...
Kontrollera status på din installation
==================================

Vi skall prova ett par kommandon som ger lite information om vår installation av databasen. Sådant kan vara bra att ha, dels för att lära sig om inställningar i en databas och ibland är det bra för att kunna felsöka.

Spara SQL-koden du gör i en fil och döp den till `check-status.sql`.



Kontrollera versionen av MySQL {#version}
--------------------------------------

Du kan dubbelkolla vilken version du har av MySQL, med följande SQL-uttryck.

```sql
SHOW VARIABLES LIKE "%version%";
```

Det kan se ut så här.

```text
MySQL [(none)]> SHOW VARIABLES LIKE "%version%";
+-----------------------------------+------------------------------------------+
| Variable_name                     | Value                                    |
+-----------------------------------+------------------------------------------+
| in_predicate_conversion_threshold | 1000                                     |
| innodb_version                    | 10.5.10                                  |
| protocol_version                  | 10                                       |
| slave_type_conversions            |                                          |
| system_versioning_alter_history   | ERROR                                    |
| system_versioning_asof            | DEFAULT                                  |
| tls_version                       | TLSv1.1,TLSv1.2,TLSv1.3                  |
| version                           | 10.5.10-MariaDB-1:10.5.10+maria~bionic   |
| version_comment                   | mariadb.org binary distribution          |
| version_compile_machine           | x86_64                                   |
| version_compile_os                | debian-linux-gnu                         |
| version_malloc_library            | system                                   |
| version_source_revision           | 3f55c569514679d98e09e71286ca28a8ac667a71 |
| version_ssl_library               | OpenSSL 1.1.1  11 Sep 2018               |
| wsrep_patch_version               | wsrep_26.22                              |
+-----------------------------------+------------------------------------------+
```

Ibland är det bra att ha koll på vilken version man kör.

Man kan också hämta ut varje variabel för sig och visa den. I detta fallet är variablerna globala och man skriver då variabeln med `@@version`.

```text
MariaDB [(none)]> SELECT @@version;
+----------------------------------------+
| @@version                              |
+----------------------------------------+
| 10.5.10-MariaDB-1:10.5.10+maria~bionic |
+----------------------------------------+
```



Kontrollera status på användare {#version}
--------------------------------------

Du kan lista samtliga användare som finns skapade i databasen genom att söka ut det i en systemtabell. Läs artikeln "[mysql.global_priv Table](https://mariadb.com/kb/en/mysqlglobal_priv-table/)" för att lära dig hur du gör och skriv sedan en SQL-sats som får fram en tabell som liknar följande, den skall lista alla användare som finns i din databas.

```text
+-------------+-----------+
| User        | Host      |
+-------------+-----------+
| dbadm       | localhost |
| maria       | localhost |
| mariadb.sys | localhost |
| root        | localhost |
+-------------+-----------+
```

Om du kör en äldre version (< 10.4) av MariaDB, eller om du kör MySQL, så finns informationen du behöver enligt artikeln "[mysql.user Table](https://mariadb.com/kb/en/mysqluser-table/)".



Kontrollera ditt skript {#skript}
--------------------------------------

Dubbelkolla att ditt skript går att köra som en helhet.

Ta för vana att alltid köra ditt skript när du är klar med varje artikel i guiden.
