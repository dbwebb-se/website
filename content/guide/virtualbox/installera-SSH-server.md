---
author: lew
revision:
    "2019-03-08": "(A, lew) Första versionen."
...
Installera SSH server
=======================

När man installerar program på Debian (Linux) så använder man oftast en pakethanterare. Programmet man installerar finns alltså förpaketerat och man laddar ned och installerar det. På Debian använder vi pakethanteraren `apt-get`.

För att visa hur det fungerar så installerar vi SSH på servern.



###Installera `sudo` utan lösenord {#sudo}

Men, innan vi gör det så behöver vi installera programmet `sudo` som låter oss köra program som root-användaren.

Följande kommando är en så kallad "oneliner". Ett sammanslaget kommando som utför en rad olika saker:

```bash
$ su --command "apt-get install sudo; echo '$USER ALL=NOPASSWD: ALL' > '/etc/sudoers.d/$USER'; cat /etc/sudoers.d/$USER"
```

Kommandot skickas till `su` som vi nu vet är root-användaren. Den aktuella användaren ($USER) läggs till i gruppen `sudo` och kravet på lösenord tas bort. Det möjliggör att du kan installera program med din egna användare.



###Installera SSH {#ssh}

på Debians webbplats hittar du [information om SSH](https://wiki.debian.org/SSH). Kika snabbt igenom den sidan.

Klienten för ssh är redan installerad. Pröva den genom att logga in på en maskin via ssh, till exempel så här. Byt ut *acronym* mot din användare på maskinen du loggar in på.

```bash
ssh acronym@ssh.student.bth.se
```

Skriv `exit` eller `ctrl-d` för att avsluta.

Vi installerar servern för SSH via `apt-get`. Starta en terminal i din VM och kör:

```bash
$ sudo apt-get install openssh-server
```

SSH-servern startar upp och lyssnar på port 22. Du kan se dess status så här.

```bash
$ sudo service ssh status
```

<!-- [FIGURE src=/image/snapht15/service-ssh-status.png?w=w2 caption="Status på SSH-servern som ligger och lyssnar på port 22."] -->

Nu har vi en SSH-server uppe och nu kan vi logga in på maskinen utifrån, förutsatt att VirtualBox är konfigurerat så att den virtuella maskinens nätverksinterface har fått en ip-adress. Låt oss testa det.
