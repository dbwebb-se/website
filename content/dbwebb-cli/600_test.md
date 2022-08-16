---
sectionHeader: true
linkable: true
author:
    - aar
category:
    - dbwebb-cli
    - dbwebb test
revision:
    "2021-06-18": "(A, aar) Första utgåvan."
...
Test
=============================

I några av våra kurser har vi skapat tester som kan användas för att kontrollera att ni har löst kursmomenten på ett korrekt sätt.

Kommandot `dbwebb test [part] [options]` funkar lite olika för varje kurs och därför kan `[options]` alternativen skiljas mellan kurserna. 

- `part`: optionellt. Om inget skickas med är standard värdet mappen du står i när du kör kommandot. Du kan specificera kursmomentet du vill rätta eller namnet på specifik uppgift. T.ex. `kmom01` eller `plane` om du står i en annan mapp.
- `options`: optionellt, kan också kallas flaggor. Varje kurs har olika, om de ens har några. Kolla in specifika kurssidan för att se vilka som finns.

Följande kurser har stöd för dbwebb test:

- python
- webtec
- oopython
- mvc
