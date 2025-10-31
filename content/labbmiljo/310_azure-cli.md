---
...
Azure CLI
==================================

I kursen använder vi Azure cloud för att köra virtuella maskiner. Vi behöver Azure CLI för att kunna köra verktyg i terminalen som jobbar mot Azure.

För WSL och linux, följ Microsoft's instruktioner för att "[Installera Azure CLI på Linux](https://learn.microsoft.com/sv-se/cli/azure/install-azure-cli-linux?pivots=apt)".

För er på MacOS, följ Microsoft's instruktioner för att "[Installera Azure CLI på Linux](https://learn.microsoft.com/sv-se/cli/azure/install-azure-cli-macos)".

Efter att du har installerat ska du köra följande rad i terminalen. Om du inte gör det kan du inte komma åt Azure från Ansible.

```
az config set core.use_msal_http_cache=false
```
