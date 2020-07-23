---
sectionHeader: true
linkable: true
...

Argument, options och commands
=======================

Vad är egentligen *arguments*, *options* och *commands*? Vi försöker få rätt på vad som är vad. Ett helt kommando följer ofta strukturen: `$ <command> [option] [argument]`.


# Commands {#commands}

Ett kommando, *command*, talar om vad som ska göras.

> `$ mkdir foldername`

Här är `mkdir` kommandot.



# Argument {#argument}

Ett argument skickas med ett kommando. I exemplet:

> `$ mkdir foldername`

är `foldername` argumentet, (namnet på mappen).



# Option {#option}

Ett *option* kan oftast skickas med för att välja hur ett argument ska hanteras av kommandot.

> `$ mkdir -p foldername/temp`

Här är `-p` flaggan (option) som talar om hur kommandot `mkdir` ska skapa mapparna som skickas med som argument.

Kika gärna i manualen för att se vilka tillgängliga options som finns för olika kommandon.



# Övriga strukturer {#ovriga-strukturer}

Vi kan ibland även skicka med argument till ett option, tex:

> `$ ssh username@localhost -p 2222`

Här är `2222` ett argument till "optionet" `-p`. `username@localhost` är argumentet till kommandot `ssh`. Rörigt att hålla koll på? Det ger sig tillslut, men det kan vara bra att känna till när man pratar om script och dess olika alternativ.
