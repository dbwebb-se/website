⁸---
...
Git introduktion
==================================

Versionshanteringverktyget Git används till och från i kurserna. Du behöver ha det installerat på din dator. Oftast finns Git redan förinstallerat, så behöver du inte göra något.

<!-- Video om git -->

## Repository (repo)

Kodfilerna ”paketeras” i mappar/projekt som kallas repositories.
Git-repot är lokalt och finns på en specifik dator (local repository).

GitHub är en webbaserad plattform som gör att det går att komma åt Git-repot över internet (remote repository).

## Hur används Git och GitHub?

Du arbetar med filer och mappar (ändrar, lägger till och tar bort) i det lokala Git-repot. Därefter uppdaterar du remote-repot på GitHub.

## Förutsättningar

1. Kontrollera om Git är installerat och konfigurera Git på din dator
2. Skapa ett konto på GitHub
3. Skapa SSH-nyckel som används för att identifiera dig på GitHub utan att behöva skriva användarnamn och lösenord varje gång.

### 1. Kontrollera om Git är installerat och konfigurera Git på din dator (terminalen)

- Kontrollera om Git är installerat  
Kolla versionen: **git \-\-version**  
Se hjälpsidan: **git**

- Installera  
Windows/Linus: **sudo apt install git**  
Mac: **brew install git**

- Konfigurera    
**git config \-\-global user.name "Ditt Namn"**  
**git config \-\-global user.email "abcd25@student.bth.se"**

- Kolla konfigureringen  
**git config \-\-list**  

<!-- Video om konfigurering -->

### 2. Skapa ett konto på GitHub

Länk till github : **https://github.dykacom/**

Klicka på **Sign up**  
Fyll i:   
- email (gärna bths studentmail, samma som vid konfigurera ovan)  
- lösenord  
- användarnamn (gärna studentakronym, till exempel abcd25)  
- land  

Klicka på **Create account**

Här är en video som går igenom hur du [skapar konto på GitHub](https://youtu.be/MD2Sknqj-RA).

### 3. Skapa SSH-nyckel (terminalen)

1. Generera ett nyckelpar  
**ssh-keygen -t ed25519 -C "abcd25@student.bth.se"**

2. Kopiera din publika nyckel med VS Code  
**code ~/.ssh/id_ed25519.pub** (öppna i VS Code)  
**kopiera innehållet** (som bland annat innehåller din email adress, abcd25@student.bth.se)
dyka
3. Lägg till den publika nyckeln på GitHub   
Gå till din användare på GitHub (klicka på din bild/avatar)  
Klicka på **Settings -> SSH and GPG key**  
Klicka på **New SSH key**  
Klistra in under **Key** och namnge under **Title**  
Klicka på **Add SSH key**  

4. Testa nyckeln genom **ssh -T git@github.com**  
Om du får frågan om du säkert vill fortsätta och kan svara "yes/no/[fingerprints]), så svara **yes** så läggs det till en fil som heter "known_hosts" i din .ssh katalog.  
Kör om **ssh -T git@github.com** så bör det funka och du ska se:  
Hi <användarnamn>! You.....  

Här är en video om hur du [skapar SSH nycklar och lägger till dem på GitHub](https://youtu.be/nNVa0xGc9h0).

## Klona ett repo (terminalen)

Klona ett befintligt repo som finns på GitHub genom att skapa en lokal kopia.   

1. Navigera till den mapp du där du vill placera lokala repot (kopian)

2. Klona repot som heter intro-veckan med:  
**git clone https://github.com/dbwebb-se/intro-veckan.git**  

1. Titta runt i repot intro-veckan på GitHub (länk: https://github.com/dbwebb-se/intro-veckan.git). Det ser ut så här:  
![repot på GitHub](https://dbwebb.se/img/labbmiljo/mitt-projekt.png)
 
2. Prova Git-kommandona [status](https://youtu.be/nVZMcg6J5Zw), [add](https://youtu.be/uYmVWYd4jFk) och [commit](https://youtu.be/CPes0GyKls8) i terminalen. OBS, du kan inte göra [push](https://youtu.be/96ob-H4mXwI). Klicka på länkarna för att se en video.
     
3. Avsluta med att göra quizzet i repot intro-veckan på GitHub.

## Skapa ett repo lokalt och koppla mot GitHub

### Remote på GitHub

Vi börjar med att skapa ett nytt repo remote på GitHub.

1. Klicka på **Repositories** i navbaren överst.

2. Klicka på den gröna knappen **New** överst till höger.
3. Välj **Owner**, till exempel "abcd25"
4. Ange **Repository name**, använd gärna "mitt-projekt"
5. Fyll i en kort beskrivning, som till exempel "Testing"
6. Klicka på gröna knappen **Create repository** längst ner till höger.

### Lokalt repo (terminalen)

Vi fortsätter med att skapa ett repo lokalt på din dator.

1. Initiera ett nytt lokalt Git-repo som heter "mitt-projekt"  
**git init mitt-projekt**  
Kolla att repot skapades och gå till katalogen "mitt-projekt"  
**ls -l**  
**cd mitt-projekt**

2. Lägg till en fil (ex. README) till exempel via VS Code eller via terminalen. Lägg till texten "#Repot mitt-projekt" i README.md.    
   Kolla status med **git status**

3. Lägg till filen i repot och kolla status  
**git add README.md**  
Kolla status med **git status** och se att filen README.md är tillagd i repot.

4. Gör en första commit och skapa en version av repot med README.md  
**git commit -m "First commit"**  
Kolla status med **git status** och se att du fått

5. Skapa en huvud-branch (gren) som heter main  
**git branch -M main**  
Kolla status med **git status** och se att du är på branchen "main"

6. Koppla ditt lokala repo till ett remote repo (ex. GitHub/GitLab)  
**git remote add origin git@github.com:<användarnamn>/mitt-projekt.git**   

7. Skicka upp till remote-repot första gången  
**git push -u origin main**  


(framöver behöver du bara skriva **git push**)

### Remote på GitHub

Nu kan du titta i repot på GitHub och se att filen syns där. Laddar du om webbsidan med GitHub så dyker README.md upp där.

Här är en video som går igenom [skapa ett repo lokalt och koppla mot GitHub](https://youtu.be/e0zo13dBg4E).

## Guide Git och GitHub

Här är en [guide till hur du använder Git och GitHub](https://dbwebb.se/guide/git/vad-ar-git).
