---
author: aar, grm
category: python
revision:
    "2024-09-11": "(B, grm) La till Mac."
    "2024-09-10": "(A, aar) Första versionen."
...

Hur man öppnar Thonny i en specifik mapp från terminalen
==========================================

När vi startar Thonny utgår den alltid från vår användarmapp. Men oftast vill vi starta Thonny i en specifik mapp, till exempel där vi har vår kod. Det går inte att göra exakt som med t.ex. VSCode men nästan. Här ska vi lära oss hur vi kan göra det.

## Förberedelser

Först måste vi göra så att det går att starta Thonny från terminalen.

### Windows {#windows}

Sök upp Thonny i startmenyn och högerklicka på ikonen. Välj "Öppna filplats".

[FIGURE src=image/kunskap/thonny/1_sok.png caption="Sök på Thonny i Windows."]

Högerklicka på Thonny-ikonen och välj "Öppna filplats".

[FIGURE src=image/kunskap/thonny/2_open.png caption="Öppna sökväg till Thonny på Windows."]

Kopiera sökvägen till Thonny.

[FIGURE src=image/kunskap/thonny/3_kopiera.png caption="Kopiera sökväg till Thonny på Windows."]

Öppna terminalen för att redigera miljövariabeln `PATH`. Kör `code ~/.bashrc`. Längs ner i filen klistra in `export PATH=$PATH:<sökväg till Thonny>`. Nu behöver du ändra på sökvägen så att det är `/` istället för `\` i sökvägen. För mig blev det `export PATH=$PATH:/mnt/c/Users/aar/AppData/Local/Programs/Thonny`. Notera att `<>` inte ska vara med. Spara filen.

Kör `source ~/.bashrc`.

Nu är Thonny tillgängligt från terminalen och vi kan gå vidare till [öppna Thonny från terminalen](#pppna-fran-terminalen).

### Mac {#mac}

Starta Thonny och högerklicka på ikonen för att kolla om Thonny ligger under **Applications** där de flesta program hamnar på Mac.

[FIGURE src=image/kunskap/thonny/rightClickOnThonnyIconMac.png caption="Hitta Thonny i Finder på Mac."]

Klicka på "Options" och sen "Show in Finder" och då startas Finder.

[FIGURE src=image/kunskap/thonny/thonnyInApplicationsMac.png caption="Verifiera att Thonny är installerat under Applications på Mac."]

Öppna en terminal och skriv `code .zshrc` (i hemmakatalogen). Lägg till raden `alias thonny='/Applications/Thonny.app/Contents/MacOS/thonny'` i filen ".zshrc" och spara filen.

[FIGURE src=image/kunskap/thonny/thonnyAliasMac.png caption="Gör ett alias till Thonny appen på Mac."]

Kör `source ~/.zshrc`.

Nu är Thonny tillgängligt från terminalen och vi kan gå vidare till [öppna Thonny från terminalen](#pppna-fran-terminalen).

## Öppna Thonny från terminalen {#pppna-fran-terminalen}

För att öppna Thonny i en specifik mapp behöver vi starta Thonny med en fil som ligger i den mappen. Öppna terminalen och skriv `thonny.exe <sökvägen till FILEN>.py`. Det går inte att öppna en mapp utan man öppnar **en fil**.

[FIGURE src=image/kunskap/thonny/6_oppna.png caption="Öppna Thonny från terminalen."]

När Thonny öppnas kommer filen öppnas men mappen som är öppen är fortfarande användarmappen som vanligt.

[FIGURE src=image/kunskap/thonny/7_notera_sokvag.png caption="Notera mappen som är öppen i Thonny."]

För att ändra vilken mapp som är öppen behöver vi exekvera filen vi har öppnat. Då kommer Thonny automatiskt byta mapp till den mappen där filen ligger.

[FIGURE src=image/kunskap/thonny/8_kor.png caption="Exekvera fil för att byta mapp."]

Nu har du öppnat Thonny i en specifik mapp.
