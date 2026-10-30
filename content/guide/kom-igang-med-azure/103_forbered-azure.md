---
author: aar
revision:
    "2025-11-14": "(A, aar) Första versionen."
...
Förbered Azure {#prepare}
=======================

Innan ni kan köra Ansible koden mot Azure behöver ni en SSH nyckel och en inloggning från dev containern. Resten, VM's, nätverk och DNS poster, skapar Ansible.

### SSH nyckel {#ssh-key}

Ansible lägger er publika SSH nyckel på alla VM's som skapas. När ni jobbade med i videon som skapade en VM skapade ni en SSH nyckel och fick två filer, `~/.ssh/azure` (privat, dela den aldrig) och `~/.ssh/azure.pub` (publik). Sökvägen till den publika nyckeln ska i `ansible/group_vars/all.yml` stå i `pub_ssh_key_location`.

Har ni ingen nyckel, skapa en med `ssh-keygen -t ed25519 -f ~/.ssh/azure`. Det ger de två filerna ovan.


### Logga in {#login}

Ansible pratar med Azure via Azure CLI, som redan finns i er dev container. Logga in i terminalen i dev containern:

```bash
az login --use-device-code
```

Öppna länken som skrivs ut, skriv in koden och logga in med ditt studentkonto. Koden gäller bara i ungefär 15 minuter. Inloggningen ligger kvar i containern, ni ska inte behöva göra den igen om ni inte byter dator.

Skriv in namnet på er resursgrupp (hittas i Azure portalen) i `resource_group` och ert domännamn i `domain_name`, i `ansible/group_vars/all.yml`.

### Håll koll på kostnaden {#cost}

Varje VM kostar pengar så länge den är igång. Glömda servrar som står på hela tiden blir dyrt. Ha som vana att göra något av följande när ni slutar för dagen:

- `ansible-playbook stop_instances.yml` stoppar VM's:arna men behåller dem, IP adresserna och diskarna. `start_instances.yml` startar dem igen på någon minut.
- `ansible-playbook terminate_instances.yml` raderar allt. Då försvinner även databasen med all data.
