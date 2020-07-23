---
author: lew
revision:
    "2019-08-20": "(A, lew) First edition."
...
Special characters {#special_characters}
=======================

In regex, certain characters have a special meaning, this is what allows us to match patterns dynamically and not just fixed strings. One cannot assume for certain that all special characters work in all dialects of regex, but it gives a clue as to what is usually available.

[INFO]We can use an option, -E, when we are working with `sed` to avoid escaping backslashes and some other special characters.[/INFO]

* **.**(period): Matches any character except newline (\\n). Also called wildcard.

* **^**: Matches the beginning of a string.

* **$**: Matches the end of a string.

* **?**: Matches zero times or once.

* **+**: Matches one or more times.

* **\***: Matches zero or several times.

* **|**: Works as an "OR" operator.

* **\{ \}**: Matches an interval.

* **[ ]**: Matches one of the characters written inside the brackets.

* **[^ ]**: Matches a character that has not been written in brackets.

* **\w** Matches an alphanumeric character, all letters (upper and lower case), numbers, and \_(underscore). Can also be written as [a-zA-z0-9_]

* **\W** (capital W): Matches a non-alphanumeric character, ie a character that is not matched by **\w**. Can also be written as [^a-zA-Z0-9_].

* **\d**: Matches a number. Can also be written as [0-9].

* **\D**: Matches a character that is not a number. Can also be written as [^ 0-9].

* **\s** (lowercase s): Matches a blank (whitespace) character. Can also be written as [ \\t\\n\\r\\f\\v].

* **\S** (capital S): Matches a non-blank (whitespace) character. Can also be written as [^ \\t\\n\\r\\f\\v].

* **( )**: Group characters into a matched string. You can pick groups from matched strings and you can also refer back to groups in the patterns.

* **\\**: Used to make a special character a regular character, e.g. **\\.** matches a point instead of acting as a wildcard, **\\\*** matches an asterisk instead of acting as a repeater, and **\\(** matches a parenthesis instead of start a group.
It is also used to refer to a group, **\1** refers to group 1 and **\2** to group 2. Groups start at 1 and up.
