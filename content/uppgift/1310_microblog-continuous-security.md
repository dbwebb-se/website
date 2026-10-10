---
author:
    - aar
revision:
    "2026-10-09": "(B, aar) Fästa versioner, make kommandon, exit koder och tips för uppgraderingen som Trivy kräver."
    "2023-11-17": "(A, aar) Första versionen."
...
Kontinuerlig säkerhet
============================

Ni ska använda olika verktyg för att hitta säkerhetsproblem i Microbloggen och lägga till dem i er CI kedja.

## Krav {#krav}

1. När ni löser fel som hittas med nedanstående verktyg och commitar koden som löser felen, skriv tydliga commit meddelanden som förklarar vilket fel ni löser.
    - I redovisningstexten ska ni förklara vilka fel ni hittade och löste.

1. Använd SAST verktyget [Bandit](https://github.com/PyCQA/bandit) för att hitta möjliga säkerhetshål i Python koden och lös dem.
    - Lägg till det som ett beroende i `requirements/test.txt`, med fast version (`bandit==<version>`).
    - Kör Bandit på koden i mappen `app`. Vi behöver inte köra det mot övrig kod i repot.
    - Lägg till ett Make kommando som kör Bandit på er kod.
    - Lös de fel som hittas.
      - Avgör om de fel som hittas är false-positiv eller inte. Om det är en false-positive kan ni lägga till så felet ignoreras, förklara varför i en kommentar.

1. Använd skanner verktyget [Trivy](https://github.com/aquasecurity/trivy) för att hitta möjliga säkerhetshål.
    - Använd Trivys Docker image med en fast version, t.ex. `aquasec/trivy:0.75.0`, så att samma verktyg körs hos alla och i GitHub Actions.
    - Använda `target`:
        - `image` för att söka igenom er Microblog produktions image.
            - Bygg först er image lokalt, t.ex. med `docker compose build prod`, för att köra Trivy på den.
            - Kör med `docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy:<version> image --scanners vuln,secret,misconfig --no-progress --severity HIGH,CRITICAL --exit-code 1 <er docker image>`.
                - Ersätt `<er docker image>` med namnet på er image, t.ex. `microblog:prod`.
        - `fs` för att söka igenom hela repo mappen.
            - Stå i ert repo och kör med `docker run --rm -v "$(pwd)":/repo -w /repo aquasec/trivy:<version> fs --scanners vuln,secret,misconfig --severity HIGH,CRITICAL --exit-code 1 --no-progress --skip-dirs .venv,venv .`
    - Lägg till make kommando för båda `target`.
    - Lös felen som hittas, se [Trivy hittar många fel](#trivy-tips).

1. Använd Docker lint verktyget [Dockle](https://github.com/goodwithtech/dockle) för att hitta möjliga säkerhetshål i er produktions image.
    - Lägg till make kommando som kör Dockle på er produktions image.
    - Lös de fel som hittas.
    - Kör det med en fast version (släpp inte `latest`, då kan ett nytt Dockle få bygget att gå sönder):
    ```
    docker run --rm -v /var/run/docker.sock:/var/run/docker.sock goodwithtech/dockle:v0.4.15 --exit-code 1 <er docker image>
    ```
    - Dockle returnerar exit kod 0 även när den hittar fel om ni inte skickar med `--exit-code 1`. Utan det kan inte CI bli rött.

1. Skapa ett nytt workflow i GitHub Actions som kör Bandit, Trivy och Dockle på samma sätt som beskrivet ovanför.
    - Ert nya workflow ska köras före era CD workflow och måste passera för att ni ska pusha er Docker image och driftsätta den. Låt publish workflow anropa det med `uses: ./.github/workflows/<fil>.yml` och `needs`, på samma sätt som test workflow.
    - Det finns en färdig `dockle` Action man kan använda men ni ska inte göra det. Den söker även er "base image", vi vill inte det och jag har inte hittat något sätt att stänga av det. Kör istället som vanligt via docker.


## Tips {#tips}

### Trivy hittar många fel {#trivy-tips}

Trivy kommer hitta många fel i produktions imagen, mer än vad ni kan lösa genom att ändra någon enstaka rad. Det är meningen, det är så det ser ut i verkligheten när man inte uppdaterar. Felen kommer från två ställen:

- **Base imagen** (`FROM python:3.8-alpine`). Python 3.8 och dess Alpine version är gamla. Byt till en nyare och använd en tag med fast version (Python version och Alpine version). Gör det i både `Dockerfile_prod` och `Dockerfile_test` så att ni testar på samma Python som ni kör i produktion.
- **Python paketen** i `requirements/prod.txt`. Flask och Werkzeug är för gamla. Uppgradera dem och de paket som hänger ihop med dem. Läs `pip` felmeddelandena och paketens ändringsloggar för att se vilka versioner som passar ihop. Sätt också fasta versioner på `gunicorn` och `pymysql` i `requirements.txt`.

Efter uppgraderingen går inte allt som förut:

- Något som koden importerar från Werkzeug finns inte längre. Läs felmeddelandet och Werkzeugs ändringslogg.
- Werkzeug 3 gör längre lösenords hashar (scrypt) än kolumnen `password_hash` rymmer. Enhetstesterna använder SQLite och märker inget, men registrering mot MySQL ger `500 Data too long`. **Testa därför alltid att registrera en användare och logga in mot den riktiga produktions imagen med `docker compose up`** efter en uppgradering. Ni måste lösa det på något sätt, antingen i hashningen eller i databasen.

`fs` skanningen kommer också hitta att `.devcontainer/Dockerfile` inte har något `USER`. Dev containern startar som root men kör som användaren `dev` (se `remoteUser` i `devcontainer.json`), så det är inget fel för oss, och att lägga till `USER` i filen gör att ni tappar tillgången till Docker. Läs i Trivys dokumentation hur ni ignorerar en enskild finding och skriv en kommentar om varför.

### Dockle {#dockle-tips}

Dockle kan rapportera `DKL-DI-0004` (`apk add` utan `--no-cache`) på ett lager som kommer från `python` base imagen, trots att `--no-cache` används. Det är en false-positive. Ignorera just den, läs i Dockles README hur, och skriv en kommentar om varför. Ni kan lämna `INFO` raderna (content trust, HEALTHCHECK) som de är.
