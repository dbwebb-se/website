---
author: lew
revision:
    "2020-05-12": "(B, lew) Andra versionen."
    "2019-03-08": "(A, lew) Första versionen."
...
Speciella karaktärer {#special_karakterer}
=======================

I regex har vissa karaktärer en speciell betydelse, det är detta som gör att vi kan matcha mönster dynamiskt och inte enbart fasta strängar. Man kan inte ta för givet att alla speciella karaktärer fungerar i alla dialekter av regex, men det ger en fingervisning på vad som oftast finns tillgängligt.

[INFO]Vi kan använda ett option, -E, när vi arbetar med `sed` för att slippa escapa backslashes och vissa andra speciella karaktärer.[/INFO]

* **.**(punkt): Matchar vilken karaktär som helst utom newline(\\n). Kallas även wildcard.

* **^**: Matchar början av en sträng.

* **$**: Matchar slutet av en sträng.

* **?**: Matchar noll eller en gång.

* **+**: Matchar en eller flera gånger.

* **\***: Matchar noll eller flera gånger.

* **|**: Funkar som en "OR" operator.

* **\{ \}**: Matchar en intervall.

* **[ ]**: Matchar en av karaktärerna som har skrivits inom hakparenteserna.

* **[^ ]**: Matchar en karaktär som inte har skrivits inom hakparenteserna.

* **\w** (litet w): Matchar en alfanumerisk karaktär, alla bokstäver(stora och små), siffror och \_(understreck). Kan även skrivas som [a-zA-z0-9_]

* **\W** (stort W): Matchar en icke alfanumerisk karaktär, alltså en karaktär som inte matchas av **\w**. Kan även skrivas som [^a-zA-Z0-9_].

* **\d**: Matchar en siffra. Kan även skrivas som [0-9].

* **\D**: Matchar en karaktär som inte är en siffra. Kan även skrivas som [^0-9].

* **\s** (litet s): Matchar en blank(whitespace) karaktär. Kan även skrivas som [ \\t\\n\\r\\f\\v].

* **\S** (stort S): Matchar en icke-blank(whitespace) karaktär. Kan även skrivas som [^ \\t\\n\\r\\f\\v].

* **( )**: Grupperar karaktärer i en matchad sträng. Det går att plocka ut grupper ur matchade strängar och det går även att refererar tillbaka till grupper i mönstren

* **\\**: Används för att göra en specialkaraktär till en vanlig karaktär, t.ex. **\\.** matchar en punkt istället för att fungera som ett wildcard, **\\\*** matchar en asterisk istället för att fungera som en repeterare och **\\(** matchar en parentes istället för att starta en grupp.
Det används även för att referera till en grupp, **\1** refererar till grupp 1 och **\2** till grupp 2. Grupper börjar på 1 och uppåt.
