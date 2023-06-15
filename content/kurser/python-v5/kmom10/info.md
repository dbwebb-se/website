---
author:
    - aar
revision:
    "2021-10-15": "(B, aar) Tog bort utdaterad information. Gäller inte för dbwebb test."
    "2021-06-08": "(A, aar) Första utgåvan."
...
Inför examinationen
================================

Detta dokument tar upp olika saker som är bra att känna till inför/under/efter examinationen.

<!-- more -->



Allmän info {#generall}
--------------------------------

- Stanna inte uppe för sent natten före och plugga, ni ska ha energi och orka skriva tentan dagen efter också.

- Även om man inte är klar med alla tidigare kursmoment rekommenderar vi att ni försöker göra examinationen.

- Man kan inte "plussa" tentan. Satt betyg sitter.

- Man ska INTE spela in sig själv UNDER TIDEN man gör tentan. Ni ska spela in en redovisningsvideo efteråt!

- Om ni redan har kod i er "tryX" mapp, rensa den så den är tom innan ni gör checkout på examinationen!


Under exam {#during}
--------------------------------

- Ha koll på Anslag i Canvas och Discord. Om jag behöver få ut information till er kommer det på de två ställena.

- Sitt inte fast på en uppgift för länge. Spendera inte hela tiden på en uppgift, kolla på alla uppgifter och försök lösa den som verkar lättast, fastnar du i en timme försök på en annan. Du kan gå tillbaka till den andra uppgiften senare.

- Om ni råkar ändra innehållet i eller ta bort en fil kan ni köra `dbwebb exam checkout tryX` igen. Då ska ni får ner nya filer. Det ska inte skriva över exam.py filen eller egenskapade filer, men om ni vill vara på säkra sidan ta en kopia på dem först.

- Nedanför kommer några vanliga fel när man kör rättningsprogrammet och vanliga lösningar:

   - När ni kör rättningsprogrammet och det klagar på "permission denied", ställ er i tryX mappen och kör "chmod +x .dbwebb/correct.bash".

    - Använd inte er av input() i er kod om det INTE efterfrågas av uppgiften. Ni kan ha det när ni skapar koden men när ni rättar den måste ni ta bort dem som inte efterfrågas av uppgiften.

    - Om man har för många eller för få input() i sin kod får man ofta felet:

        ```
        ......
            result = next(effect)
        StopItteration
        ```

        Eller kan rättningsprogrammet hänga sig.



Efter exam {#after}
-------------------------------

- Om ni inte har fått alla tidigare kmoms rättade och godkända innan examinationen får ni Fx som betyg så länge och när allt är godkänt sätter vi ert faktiska betyg och rapporterar till ladok.

- Om ni inte fick ihop 20 poäng, inte godkänt, behöver ni inte spela in redovisningsvideo och lämna in på Canvas. Ni kan fortfarande lämna in och skicka med en feedbacktext på kursen om ni vill.
