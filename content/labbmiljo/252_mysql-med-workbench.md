---
author: mos
revision:
    "2022-12-22": "(G, mos) Bort med Windows cmd, path och cygwin."
    "2022-01-20": "(F, mos) Förtydligade strukturen vilka artiklar man skall jobba i."
    "2021-12-21": "(E, mos) Bort med referens till forum och ändra från MySQL till MariaDB och workbench i egen artikel samt flytta Windows terminaler till egna artiklar."
    "2019-01-09": "(C, mos) Lade till Docker."
    "2019-01-08": "(B, mos) Delade in artikeln i delar, beroende på operativsystem."
    "2018-03-20": "(A, mos) Uppdelad från ett större dokument."
...
MariaDB Server och MySQL Workbench
==================================

Du vill installera databasen MariaDB tillsammans med desktopklienten MySQL Workbench och terminalklienten.



Installation {#installation}
----------------------------------

1. Välj rätt artikel beroende på vilket operativsystem du använder.

    * [Installera MariaDB Server på Windows 10](kunskap/installera-mariadb-server-pa-windows-10)
        * [Windows: MariaDB klient med WSL2 bash terminal](coachen/mariadb-och-windows-wsl2-bash-terminal)

    * [Installera MariaDB Server på macOS](kunskap/installera-mariadb-server-pa-macos)
    * [Installera MariaDB Server på Linux](kunskap/installera-mariadb-server-pa-linux)

1. Förutsatt att du kan logga in på databasen med din terminalklient så kan du nu gå vidare och [installera MySQL WorkBench](kunskap/installera-mysql-workbench).

1. Ett tips till dig som vill slippa skriva användare, lösenord och eventuellt hostnamnet är att skapa din egen konfigurationsfil `.my.cnf`, i artikeln "[MariaDB klienten och filen .my.cnf](coachen/mariadb-klient-och-my-cnf)" får du se hur man gör det.



Använd MySQL/MariaDB via Docker {#docker}
----------------------------------

För den som är väl bekant med Docker kan det vara ett kompletterande möjlighet att köra databasservern som en docker kontainer. Du kan se hur man sätter upp grunderna i artikeln "[Kör MySQL Server och MySQL WorkBench via Docker](kunskap/kor-mysql-server-och-mysql-workbench-via-docker)".



Äldre artiklar som numer ej används {#aldre}
----------------------------------

Dessa användes senast vårterminen 2022 men från och med 2023 används enbart WSL2 som terminal på Windows.

[WARNING]

Dessa artiklar ligger bara kvar av kuriosa och normalt sett skall du inte jobba igenom dessa.

Om du av någon anledning vill jobba med MariaDB i en windows terminal (Powershell eller cmd) och i Cygwin så kan du behöva jobba igenom dessa artiklar.

[/WARNING]

1. **[Endast Windowsanvändare]** Om du jobbar på Windows så skall du fortsätta med följande artikel så att du kan köra terminalklienten i godtycklig katalog.

    * [MariaDB klient och Windows med cmd terminalen](coachen/mariadb-och-windows-cmd-terminal)

1. **[Endast Windowsanvändare]** Du behöver också se till att du kan jobba med terminalklienten i en Bash-terminal. Enklast är nog Cygwin men WSL2 är också trevligt.

    * [MariaDB klient och Windows med Cygwin terminalen](coachen/mariadb-och-windows-cygwin-terminal)
    * [MariaDB klient och Windows med WSL2 bash terminal](coachen/mariadb-och-windows-wsl2-bash-terminal)

