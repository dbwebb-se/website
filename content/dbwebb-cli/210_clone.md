Klona ett kursrepo
==================================

Kursmaterial finns samlat i kursrepo, kurskataloger, som laddas ned från Github. Så här kan du ladda ned ett kursrepo för kursen webtec eller python. Vi kallar det för att man *klonar* kursrepot.



Skapa katalogen dbwebb-kurser {#dbwebb-kurser}
----------------------------------

Vi skapar en ny katalog `dbwebb-kurser` där vi skall samla alla kursrepon för de kurser vi går. Du kan lägga katalogen var du vill, men direkt under din hemmakatalog är en bra plats.

```text
# Gå till din hemmakatalog i terminalen
cd

# Skapa katalogen
mkdir dbwebb-kurser

# Kolla att katalogen skapades
ls -ld dbwebb-kurser

# Flytta in i katalogen
cd dbwebb-kurser

# Katalogen är tom
ls -la
```

Glöm inte bort att denna katalogen nu kommer innehålla viktiga filer så se tilla tt du har en möjlighet att ta backup på dem.



### Varianter på var du placerar dbwebb-kurser {#variant}

Använder du Windows och Cygwin bör du byta ut `$HOME` mot `$HOMEPATH` så får du sökvägen till din hemmakatalog för din Windowsanvändare. I Cygwin sparar vi 

Du kan också lägga dina kursrepon på en delad disk, till exempel Dropbox eller motsvarande. Det gör att dina kursrepon kan vara tillgängliga oavsett vilken dator du sitter vid. Det är bra om du till exempel har flera datorer som du använder när du jobbar med kursmaterialet.



Klona ett kursrepo {#clona}
----------------------------------

Nu tar vi reda på vilka kursrepon som finns.

```text
dbwebb clone
```

Sen väljer du det kursrepo som matchar din kurs. Till exempel så här för webtec- och python-kursen.

```text
# Först klonar vi webtec-kursen
dbwebb clone webtec
cd webtec
ls
```

Kursmaterialet laddas nu ned och sparas i katalogen `webtec`. På samma sätt kan du klona andra kurser, till exempel python. Bara byt ut "webtec" mot "python" så hamnar det kursrepot i en egen katalog.

```text
# Klona python-kursen, men flytta först tillbaka till katalogen dbwebb-kurser
cd ..
dbwebb clone python
cd python
ls
```
