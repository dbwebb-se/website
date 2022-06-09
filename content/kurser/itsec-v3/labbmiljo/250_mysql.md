---
author: mos
revision:
    "2018-03-20": "(C, mos) Ersatt av tre mer specialiserade installationsguider."
    "2018-01-12": "(B, mos) Struktur i stycken samt nytt dok för installation utan XAMPP."
    "2017-12-27": "(A, mos) Uppdaterade dokumentet inför VT18."
...
MySQL / MariaDB
==================================

Du behöver installera MariaDB/MySQL lokalt på din egna maskin samt ha tillgång till MariaDB/MySQL på BTH's labbmiljö.

[INFO]
**Uppdaterade artiklar finns**

Detta dokument är numer (från lp4 ht18) uppdelat i tre dokument för att göra det enklare att länka från olika kurser som delvis har olika kravbild på installationen och användandet av MySQL.

Följande artiklar ersätter denna.

* [MySQL / MariaDB och MySQL Workbench](labbmiljo/mysql-med-workbench) (kurs databas)
* [MySQL / MariaDB med XAMPP](labbmiljo/mysql-med-xampp) (kurs oophp, ramverk1)
* [MySQL / MariaDB i BTH's labbmiljö](labbmiljo/mysql-bth-labbmiljo) (kurs oophp, ramverk1)

[/INFO]

Det finns flera sätt att göra en lokal installation, här är två alternativ.



Installera enbart MySQL och MySQL Workbench {mysql}
----------------------------------

Du vill enbart installera MySQL och desktopklienten MySQL Workbench. Du får hjälp att göra det i artikeln "[Installera MySQL Server och MySQL WorkBench](kunskap/installera-mysql-server-och-mysql-workbench)".

Detta är ett bra alternativ om du enbart går kursen databas, utan att ha gått någon webbutvecklingskurs där XAMPP används.

Även om du redan har XAMPP så är det en bra övning att installera databasen och desktopklienten på det sätt som artikeln beskriver. De båda installationerna (denna och XAMPP) kan samexistera.



Installation tillsammans med XAMPP {#xampp}
----------------------------------

Du har redan en installation av XAMPP, eller vill använda MySQL som en del av XAMPP. I artikeln "[Installera Apache webbserver för utveckling](kunskap/installera-apache-webbserver-for-utveckling)" får du hjälp att installera XAMPP. Se till att du inkluderar MySQL/MariaDB som en del av installationen.



Kom igång {#kom}
----------------------------------

När du är klar med installationen kan du gå vidare och bekanta dig med de klienter som används för att koppla upp sig mot MySQL.

Först kan du gå igenom artikeln "[Kom igång med databasen MySQL och dess klienter](kunskap/kom-igang-med-databasen-mysql-och-dess-klienter)" som ger dig grunderna i terminalklient, webbklient och desktopklient.

Sedan kan du, om du så väljer, gå vidare och bekanta dig med BTH's labbmiljö för MySQL. I artikeln "[BTH's labbmiljö för databasen MySQL](kunskap/bth-s-labbmiljo-for-databasen-mysql)" visas hur du använder klienter för att komma åt BTH's installation och studentmiljö.



Fråga i forumet {#forum}
----------------------------------

Ställ frågor och bidra med tips och trix i forumtråden som är [kopplad till detta dokument](t/7186).
