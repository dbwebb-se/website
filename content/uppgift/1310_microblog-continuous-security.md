---
author:
    - aar
revision:
    "2023-11-17": "(A, aar) Första versionen."
...
Kontinuerlig säkerhet
============================

Ni ska använda olika verktyg för att hitta säkerhetsproblem i Microbloggen och lägga till dem i er CI kedja.

## Krav {#krav}

1. När ni löser fel som hittas med nedanstående verktyg och commitar koden som löser felen, skriv tydliga commit meddelanden som förklarar vilket fel ni löser.
    - I redovisningstexten ska ni förklara vilka fel ni hittade och löste.

2. Använd SAST verktyget [Bandit](https://github.com/PyCQA/bandit) för att hitta möjliga säkerhetshål i Python koden och lös dem.
    - Lägg till det som ett beroende i `requirements/test.txt`.
    - Kör Bandit på koden i mappen `app`. Vi behöver inte köra det mot övrig kod i repot.
    - Lägg till ett Make kommando som kör bandit på er kod.
    - Lös de fel som hittas.
      - Avgör om de fel som hittas är false-positiv eller inte. Om false-positive kan ni lägga till så felet ignoreras.

3. Använd skanner verktyget [Trivy](https://github.com/aquasecurity/trivy) för att hitta möjliga säkerhetshål.
    - Använda `target`:
        - `image` för att söka igenom er Microblog produktions image.
            - Använd `scanners`, `vuln,secret,config`.
        - `fs` för att söka igenom hela repo mappen. Ni kan exkludera `.venv` mappen.
            - Använd `scanners`, `vuln,secret,config`.
    - Lägg till make kommando för båda `target`.
    - Lös felen som hittas.

4. Använd Docker lint verktyget [Dockle](https://github.com/goodwithtech/dockle) för att hitta möjliga säkerhetshål i er produktions image.
    - Lägg till make kommando som kör Dockle på er produktions image.
    - Lös de fel som hittas.

5. Skapa ett nytt workflow I Github Actions som kör Bandit, Trivy och Dockler på samma sätt som beskrivet ovanför.
    - Ert nya workflow ska köras före era CD workflow och måste passera för att ni ska pusha er Docker image och driftsätta den.
    - Det finns en färdig `dockle` Action man kan använda men ni ska inte göra det. Den söker även er "base image", vi vill inte det och jag har inte hittat något sätt att stänga av det. Kör istället som vanligt via docker.
