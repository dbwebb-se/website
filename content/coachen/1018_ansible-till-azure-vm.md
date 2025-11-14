---
author: aar
category:
    - ansible
    - devops
    - github
revision:
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

Nedanför hittar ni ett workflow som kör en playbook och använder en SSH nyckel från secrets.

PS. Den förutsätter att det finns en `hosts` fil som innehåller domännamn för servrarna som ska jobbas mot.

```yml
name: Deploy microblog

on:
  workflow_call:
  push:
    branches: [ "master" ]
  pull_request:
    branches: [ "master" ]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v4

    - name: Cache pip
      uses: actions/setup-python@v3
      with:
        python-version: "3.9"
        cache: 'pip'
        cache-dependency-path: |
          requirements/deploy.txt
          ansible/requirements.yml

    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install -r requirements/deploy.txt
        pip install -r ~/.ansible/collections/ansible_collections/azure/azcollection/requirements.txt
        cd ansible && ansible-galaxy install -r requirements.yml

    - name: Setup SSH 
      shell: bash
      run: |
        eval `ssh-agent -s`
        mkdir -p /home/runner/.ssh/
        touch /home/runner/.ssh/id_rsa
        echo -e "${{secrets.SSH_PRIVATE_KEY}}" > /home/runner/.ssh/id_rsa
        chmod 700 /home/runner/.ssh/id_rsa

    - name: Run playbook
      run: cd ansible/ && ansible-playbook  -i hosts deploy_app.yml  --private-key=/home/runner/.ssh/id_rsa
      env:
        ANSIBLE_HOST_KEY_CHECKING: "False"
```
