---
author: aar
category: python
revision:
  "2020-06-22": (A, aar) Skapad inför V3 HT20.
...
Din egen chattbot - Marvin - steg 2
==================================

Programmering och problemlösning i Python. Jobba vidare med Marvin och implementera ny funktionalitet som använder listor.

<!--more-->


Förkunskaper {#forkunskaper}
-----------------------

Du kan grunderna i Python och stränghantering och du har byggt [första delen](uppgift/din-egen-chattbot-marvin-steg-1-v2) av Marvin.



Introduktion {#intro}
-----------------------

Du skall bygga en ryggsäck till Marvin med hjälp av listor.

Du skall kommunicera med Marvin via text och inte via ett menyval.

Se hur det kan se ut när uppgiften är klar:

[ASCIINEMA src=B7hLyjHGlGbUwj9c6JoTnONRB]



Krav {#krav}
-----------------------

1. Kopiera din Marvin från föregående kursmoment och utgå från den koden.

```bash
# Flytta till kurskatalogen
cd me
cp -ri kmom02/marvin1/marvin.py kmom03/marvin2/
cd kmom03/marvin2
```

2. Lär Marvin att hantera listor. Lägg till så att Marvin kan plocka upp saker på en valfri plats i sin nya ryggsäck. Skickas ingen placering så skall den hamna på slutet.

3. Marvin skall kunna säga hur många saker om finns i listan samt skriva ut dem.

4. Man ska kunna skriva in namnet på en sak som Marvin skall kasta bort från sin ryggsäck.

5. Ge Marvin möjligheten att kunna byta plats på två stycken saker.

6. Felhantering. Anger man ett för högt index eller om det man vill kasta samt byta plats inte existerar i ryggsäcken så skall Marvin berätta detta för dig.

Följande kommandon skall fungera. Notera att Marvin ska kunna plocka upp vad som helst. Nedan visas `flower`, `book` och `0` **enbart som exempel**.

| Kommando               | Vad händer                                                               |
|------------------------|:-------------------------------------------------------------------------|
| inv                    | Marvin skall säga hur många saker om finns i listan samt skriva ut dem   |
| inv pick flower        | Plocka upp en blomma                                                     |
| inv pick book 0        | Plocka upp en bok och lägg den i början av listan                        |
| inv swap flower book   | Byter plats på blomman och boken                                         |
| inv drop flower        | Kasta bort blomman                                                       |

7. Validera och publicera Marvin genom att göra följande kommandon i kurskatalogen i terminalen.

```bash
# Flytta till kurskatalogen
dbwebb validate marvin2
dbwebb publish marvin2
```

Rätta eventuella fel som dyker upp och publicera igen. När det ser grönt ut så är du klar.



Extrauppgift {#extra}
-----------------------

Finns inga extrauppgifter.


Tips från coachen {#tips}
-----------------------

Felsöka med debuggern.

Validera ofta. Så slipper du en massa valideringsfel i slutet av övningen.

Lycka till och hojta till i forumet om du behöver hjälp!
