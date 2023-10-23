---
author: nik
revision:
    "2021-08-11": "(A, nik) Första versionen."
...
Koppla lokalt till remote
==================================

Det repot vi skapade nu kallas för vår "remote" och vi ska nu koppla samman vårt lokala repo till vårt remote repo. GitHub är snälla här, de erbjuder oss instruktioner till hur vi kan göra detta på olika sätt.

[FIGURE src=image/git-guide/connect-local-remote.png]

Stycket längst ner känns mest rätt för oss, vi har redan skapat lite filer och commit:at dom. Den första raden är det som kopplar vårt lokala repo mot det vi skapade på GitHub. **Viktigt att i detta skedet välja ssh-länken som bör börja på git@github.com**.

Sedan döper vi om vår master branch till `main`. Det är en preferens ifrån GitHub, men det skadar inte oss så vi lyssnar och döper om vår "branch".

Tillsist så laddar vi upp vår kod till GitHub med hjälp utav `git push -u origin main`. Det är bara första gången nu vi behöver specificera att vi vill ladda upp till `origin main`, i framtiden räcker det med `git push`.

Såhär kan det se ut:

```bash
[Aurora](~/git/example) $ git remote add origin git@github.com:AuroraBTH/example-repo.git
[Aurora](~/git/example) $ git branch -M main
[Aurora](~/git/example) $ git push -u origin main
Enumerating objects: 3, done.
Counting objects: 100% (3/3), done.
Delta compression using up to 12 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 239 bytes | 239.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
To github.com:AuroraBTH/example-repo.git
 * [new branch]      main -> main
Branch 'main' set up to track remote branch 'main' from 'origin'.
```

Laddar jag nu om sidan på GitHub så bör de dyka upp där, tillsammans med vår beskrivning. GitHub ger oss förslaget att lägga till en README. Vi har en, men den är tom. Så vi tar tillfället i akt och går över det med "alldagliga" Git flödet.

[FIGURE src=image/git-guide/first-push.png]
