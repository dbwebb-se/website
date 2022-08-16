---
author:
    - aar
category:
    - dbwebb-cli
    - dbwebb test
revision:
    "2022-07-05": "(B, aar) La till nya cli flaggorna"
    "2021-06-18": "(A, aar) Första utgåvan."
...
Python
==================================

I python kursen använder vi `dbwebb test` för att automaträtta alla inlämningar i kursen. Alla tester som körs måste gå igenom för att ni ska få godkänt.

[YOUTUBE src=OKrYTZrxbBE caption="Andreas visar upp dbwebb test"]

För att se hur ni kan använda kommandot i kursen kan ni använda hjälp kommandot.

```bash
# stå i python mappen
$ dbwebb test --help

Usage: 'dbwebb test [part] [optional args...]'
ARGUMENTS
    [part] is optional and defaults to the current directory.
                This could be an assignment or kmom.
OPTIONAL
    --help, -h:     Displays this help text.
    --no-validate:  Skips the validation of the given test_suit
    --extra, -e:    Includes unittests for extra assignments.
    -t, --tags:     Filters what testcases it should run. If given, it will only
                    run testcases with the same tags. Tags are separated by a comma (",")
                    Example usage: --tags=speed,temp or --tags=height
    -s, --showtags  Show what tags are available for the tests. Won't run any tests!
    -f, --failfast  Stop executing tests on the first error or failure.
    --trace:        Adds traceback output for assertion errors.

-----------------------
Alternative scripts
Usage: 'dbwebb test <flag> <arguments> <optional args...>'

    --docker, -d:    Executes dbwebb test inside a docker container.
                     Run 'dbwebb test -d --help' for more information.
    --generate, -g:  Scaffold unittests for examiner
                     Run 'dbwebb test -g --help' for more information.
```

Om ni inte skickar med några options körs validering på koden innan den kör testerna. För att ni ska slippa vänta på valideringen när ni sitter och utvecklar har vi lagt till att ni ska skicka med `--no-validate`, då körs bara testerna. Notera dock att när er kod rättas för betyg så kommer valideringen köras så ni behöver köra med det också innan ni lämnar in.

Om ni har gjort någon extrauppgift och vill kolla att den är korrekt behöver ni skicka med `--extra`. Då körs testerna för extrauppgifterna.

Det finns väldigt många tester för uppgifterna och då kan det bli jobbigt om man jobbar med en specifik del och vill bara kolla om den funkar enligt testerna. Då kan ni skicka med `--tags=<kravets tag>`. Då körs bara de tester som har den taggen. I varje uppgift kan ni hitta vilka taggar som finns för den uppgiften.

Om ni vill veta vilka taggar som finns och vilka tester som använder dem kan ni använda `--showtags`. Då skriver den ut testerna som finns och vilka taggar de har.

`--failfast` gör att testerna slutar exekvera om ett test går fel. Det kan vara bra att använda om man har väldigt många fel och inte vill se alla felmeddelanden. Då får man bara se första felet.

När ett test går fel får ni en utskrift där det beskrivs vad testet förväntar sig och vad som hände istället. Den texten är ett lager ovanpå det faktiska felet som uppstår i koden. Om man vill se felet så som koden skapar det kan man skicka med `--trace`. Den flaggan (option) finns med till för de som redan har erfarenhet av programmering och tester i python. Majoriteten behöver inte bry sig om det.

Det som ligger under `Alternative scripts` kan ni ignorera, det är saker vi använder när vi skapar tester.
