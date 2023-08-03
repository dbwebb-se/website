SSH-nycklar
==================================

När du loggar in på studentservern behöver du ange ditt lösenord. Det blir jobbigt i längden. Därför är det lika bra att skapa SSH-nycklar som automatiskt sköter din autentisering när du loggar in.

Kommandot `dbwebb` hjälper dig att skapa dessa nycklar och installerar dem på studentservern genom följande kommando.

```text
$ dbwebb sshkey
```

Notera att du inte får någon utskrift när du anger lösenordet, skriv bara in ditt lösenord och tryck på enter/return tangenten.

Om något går fel kan du köra kommandot igen, så skapas nya SSH-nycklar.

SSH-nycklarna sparas i din hemmakatalog under `$HOME/.ssh`. 

```text
$ ls -l "$HOME/.ssh"
```

Är du nyfiken på hur de kan se ut så kikar du på de filer som ligger i den katalogen.

Så här kan det se ut.

[ASCIINEMA src=24617]



Problem
---------------------------

Vanliga problem är att man skriver in lösenordet och då inga tecken ekas ut på skärmen så blir man osäker. Men det är bara att skriva sitt lösenord och trycka enter.

Kan du ändå inte logga in så kan du köra om `dbwebb config` och dubbelkolla att du skrev in rätt akronym. Sedan provar du `dbwebb sshkey` igen.

Fungerar det inte så kan du prova att logga in på studentservern med `dbwebb login` och ditt lösenord. Går det bra (du kommer in på studentservern) så kan du skriva `exit` för att logga ut från studentservern. Sedan provar du `dbwebb sshkey` igen.

Om det inte fungerar trots det så kan du prova att logga in via ssh till studentservern. Du skriver då följande kommando och ange sedan lösenordet då kommandot ber om det.

```
ssh acro23@ssh.student.bth.se
```

Lyckas du logga in på studentservern så skriver du `exit` för att lämna.

Om det trots detta inte fungerar så kan du fundera på om du har något spam- eller antivirus-program som du bör avvaktivera för att testa igen.

Om inget av detta fungerar så får du mail a IT-helpdesk och berätta att du försöker logga in på studentservern med ssh och ditt lösenord och det fungerar inte. Visa det sista exemplet som är relaterat till kommandot `ssh`. Om ssh inte fungerar så kan inte dbwebb-kommandot fungera.


