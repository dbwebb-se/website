---
author: aar
revision:
    "2025-11-14": "(A, aar) Första versionen."
...
Förbered Azure {#prepare}
=======================

Innan ni kan köra Ansible koden mot Azure behöver ni en SSH nyckel, en DNS zone för ert domännamn och en inloggning från dev containern. Resten, VM's, nätverk och DNS poster, skapar Ansible.

### SSH nyckel {#ssh-key}

Ansible lägger er publika SSH nyckel på alla VM's som skapas. Skapa en nyckel på din dator (i en dev container ligger `~/.ssh` på din riktiga dator, så nyckeln finns kvar om containern byggs om).

```bash
ssh-keygen -t ed25519 -f ~/.ssh/azure
```

Ni får två filer, `~/.ssh/azure` (privat, dela den aldrig) och `~/.ssh/azure.pub` (publik). Sökvägen till den publika nyckeln ska i `ansible/group_vars/all.yml` stå i `pub_ssh_key_location`.

### DNS zone {#dns-zone}

Skapa en DNS zone och koppla ert domännamn till Azure, se [Domännamn](kom-igang-med-azure/102_koppla-doman). Ansible skapar DNS posterna (`@`, `www`, `appserver1` och `appserver2`) när den skapar servrarna, ni behöver bara skapa zonen och peka domänen på Azures name servers.

DNS posterna ligger kvar i zonen när ni raderar servrarna, då pekar de på en IP som inte finns längre. Det är ok. När ni skapar servrarna igen ersätter Ansible dem med den nya IP adressen.

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
