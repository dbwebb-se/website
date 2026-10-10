---
author: aar
category:
    - ansible
    - devops
    - github
revision:
    "2026-10-09": "(B, aar) Workflow som körs på tag, uppdaterade versioner och deploy efter publish."
    "2025-11-14": "(A, aar) Flyttat till eget dokument."
...
Kör playbook på VM från GigHub Action
==================================

För att kunna köra en playbook på en VM behöver vi tillgång till godkända SSH nycklar. För att få det i GitHub Actions måste vi manuellt lägga till dem.

<!--more-->

Välj en av era SSH nycklar och lägg till i Github Secrets.

```
cat ~/.ssh/azure
```

Kopiera utskriften och lägg till som en SECRET, som heter `SSH_PRIVATE_KEY`, i ert repo på GitHub, `https://github.com/<användare>/<repo>/settings/secrets/actions`.



## Ett workflow som kör en Playbook

Nedanför hittar ni ett jobb som kör en playbook och använder en SSH nyckel från secrets. Lägg det som ett jobb i ert publish workflow, efter publish, så att det bara körs på en ny tag och när imagen finns.

PS. Den förutsätter att det finns en `hosts` fil som innehåller domännamn för servrarna som ska jobbas mot.

```yml
  deploy:
    needs: publish
    runs-on: ubuntu-24.04
    steps:
      - uses: actions/checkout@v7

      - uses: actions/setup-python@v7
        with:
          python-version: "3.11"
          cache: pip
          cache-dependency-path: requirements/deploy.txt

      - name: Install Ansible
        run: pip install -r requirements/deploy.txt

      - name: Save the ssh key
        run: |
          mkdir -p ~/.ssh
          printf '%s\n' "$SSH_PRIVATE_KEY" > ~/.ssh/id_ed25519
          chmod 600 ~/.ssh/id_ed25519
        env:
          SSH_PRIVATE_KEY: ${{ secrets.SSH_PRIVATE_KEY }}

      - name: Run the playbook
        working-directory: ansible
        run: ansible-playbook -i hosts deploy_app.yml --private-key ~/.ssh/id_ed25519
```

Några saker att tänka på:

- Python 3.11 eller nyare behövs för Ansible versionen i `requirements/deploy.txt`.
- Under `on:` i workflow filen ska ni ha tag triggern från publish, inte push eller pull request.
- Playbooken som körs mot servrarna pratar bara SSH, den behöver inte Azure collection. Ska ni köra en playbook som pratar med Azure behöver ni installera collection och logga in, det gör ni inte här.
- `ansible.cfg` har `host_key_checking = False`, så GitHub Actions frågar inte om serverns host key. Det är bekvämt men gör att ni inte upptäcker om någon annan svarar på domännamnet.
- Skicka lösenord och andra hemligheter till playbooken från secrets (`-e db_password="$DB_PASSWORD"`), inte i filer i repot.
