---
author: aar
category: devops
revision:
  "2019-07-29": (A, aar) Första utgåvan inför kursen devops.
...
Configuration Management med Ansible
==================================


Vi ska i denna övning lära oss vad Configuration Management (CM) är och hur vi kan använda verktyget Ansible för det.

<!--more-->

## Install {#install}
apt-get install python-dev libssl-dev

venv
https://docs.ansible.com/ansible/latest/reference_appendices/python_3_support.html


## Vad är CM? {#vad-ar-cm}

För en introduktion till CM, läs Digital Oceans artikel [an introduction to configuration management](https://www.digitalocean.com/community/tutorials/an-introduction-to-configuration-management).



## Vad är Ansible {#vad-ar-ansible}

För en introduktion till Ansible, läs Digital Oceans artikel [Configuration Management 101: Writing Ansible Playbooks](https://www.digitalocean.com/community/tutorials/configuration-management-101-writing-ansible-playbooks)

[Best practice](https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html).

[Working with Ansible Playbooks – Tips & Tricks with Examples](https://spacelift.io/blog/ansible-playbooks)

## Struktur på Ansible Playbooks {#struktur}




## Vault {#vault}



## AWS {#aws}

Credentials till student konto https://forums.aws.amazon.com/thread.jspa?messageID=891431



## Problem {#problem}

https://willthames.github.io/2018/07/01/connection-local-vs-delegate_to-localhost.html

https://docs.ansible.com/ansible/2.8/user_guide/windows_faq.html

[AWS Regioner](https://docs.aws.amazon.com/general/latest/gr/rande.html#ec2_region)


Avslutningsvis {#avslutning}
--------------------------------------

Det är många olika saker att ta in i denna artikeln, ni har fått känna på hur det är att jobba med driftsättning av en applikation ni inte skapat själva och sett olika delar som kan ingå. Under kursens gång ska vi jobba oss ifrån att göra saker manuellt till att det antingen sker automatisk eller i alla fall finns i ett skript.

Du kan hitta bash skript för hela artikeln i repot under `infrastructure-as-code/scripts`.

Artikeln baseras mycket på [The Flask mega tutorial](https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-xvii-deployment-on-linux).
