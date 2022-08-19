Klona ett kursrepo
==================================

Kursmaterial finns samlat i kursrepo, kurskataloger, som laddas ned från Github. Så här kan du ladda ned ett kursrepo för kursen htmlphp, eller *klonar* kursrepot, som vi brukar säga.

Förslagsvis så samlar du alla kursrepon i en och samma katalog och döper den till `dbwebb-kurser`. Du kan lägga katalogen var du vill, men direkt under din hemmakatalog är en bra plats.

```bash
$ mkdir "$HOME/dbwebb-kurser"
$ cd "$HOME/dbwebb-kurser"
```

Använder du Windows och Cygwin kan du byta ut `$HOME` mot `$HOMEPATH` så får du sökvägen till din hemmakatalog för din Windowsanvändare.

Du kan också lägga dina kursrepon på en delad disk, till exempel Dropbox eller motsvarande. Det gör att dina kursrepon kan vara tillgängliga oavsett vilken dator du sitter vid. Det är bra om du till exempel har flera datorer som du använder när du jobbar med kursmaterialet.

Nu tar vi reda på vilka kursrepon som finns.

```bash
$ dbwebb clone
```

Sen väljer du det kursrepo som matchar din kurs. Till exempel så här för webtec-kursen.

```bash
$ dbwebb clone webtec
$ cd webtec
$ ls
```

Kursmaterialet laddas nu ned och sparas i katalogen `webtec`. På samma sätt kan du klona andra kurser, till exempel python. Bara byt ut "webtec" mot "python" så hamnar det kursrepot i en egen katalog.


Så här kan det se ut.

[ASCIINEMA src=24620]
