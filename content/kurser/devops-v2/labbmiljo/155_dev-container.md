---
author: aar
revision:
    "2026-10-08": "(A, aar) Första versionen."
...

# Dev container {#devcontainer}

Kursens utvecklingsmiljö är en dev container: en Docker container med verktygen vi använder i kursen, med bestämda versioner. Alla får då samma miljö och du slipper installera och versionshantera verktygen själv. Konfigurationen följer med i Microblog repot, i mappen `.devcontainer`.

## Det här behöver du på din dator {#pre}

- En terminal. Windows använder WSL med Ubuntu, se avsnittet Terminal ovan.
- Git.
- Docker. Docker Desktop måste vara igång när du jobbar.
- Visual Studio Code med tillägget [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).

Allt annat finns i containern.

## Starta dev containern {#start}

1. Klona ditt repo. **På Windows klonar du inuti WSL**, inte på C: disken. Containern monterar repot på samma sökväg som på din dator, och det fungerar inte med en Windows sökväg.
2. Öppna mappen i VS Code. Om du använder WSL, öppna den från WSL terminalen med `code .`.
3. Välj "Reopen in Container" när VS Code frågar, eller kör `Dev Containers: Reopen in Container` i kommandopaletten.

Första gången tar det några minuter. Då byggs imagen och Python paketen installeras. Terminalen i VS Code körs i containern, kör alla kommandon i kursen där.

## Vad finns i containern {#innehall}

I kmom01:

- Python 3.11, med en virtuell miljö i mappen `venv` och paketen för att köra testerna.
- Docker CLI, Buildx och Compose. Du kan använda både `docker compose` och `docker-compose`.
- Git, make och en ssh klient.

De exakta versionerna står i `.devcontainer/devcontainer.json`. Vi lägger till fler verktyg i containern kursmoment för kursmoment. Kursmomentets text säger när du ska bygga om containern, med kommandot `Dev Containers: Rebuild Container`.

## Så fungerar det {#fungerar}

- **Docker:** containern använder Docker på din dator. Containrar du startar körs därför på din dator, inte inuti dev containern. Öppna dem i webbläsaren på `localhost:<port>`. `curl localhost:<port>` i terminalen inuti dev containern når dem inte.
- **Filer:** du är användaren `dev` i containern, inte root. Filer du skapar i repot ägs av dig, även på din dator.
- **Ssh nycklar:** mappen `~/.ssh` på din dator finns också i containern. Då fungerar `git push` över ssh och nycklarna du skapar i containern finns kvar.

## Om något inte fungerar {#fel}

- `The command 'docker' could not be found in this WSL 2 distro` i WSL: öppna Docker Desktop, gå till Settings, Resources, WSL integration och slå på integrationen för din distro.
- Containern startar inte eller verkar gammal: kör `Dev Containers: Rebuild Container`.
- Det går inte att nå appen med `curl`: använd webbläsaren på din dator, se "Så fungerar det" ovan.
- Fungerar inte dev containern alls kan du använda reservlösningen nedan.
