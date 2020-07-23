---
author: lew
revision:
    "2019-08-20": "(A, lew) First edition."
...
Grouping {#grouping}
=======================

To select a group, we use parentheses around the match, `(...)`. We can reuse a group with `\1`,`\2` etc. Let's say we want to get the name of the person who has the webapp course together with the course code:

```
$ sed -E -n 's/(^[a-zA-Z]+\s[a-zA-Z]+).*Webapp.*([A-Z]{2}[0-9]{4}).*/\1 \2/p' < courses.txt
Emil Folino DV1609
```

Now it got messy! We take it piece by piece:

**(^[a-zA-Z]+\s[a-zA-Z]+)**: The brackets indicates there is a group.
The insertion sign ^ (caret) marks the beginning of the line.  
Then follows a character class that captures all letters followed by a plus (+) because we want it to be repeated at least once. Then comes a space (\\s) followed by a character class.
The next plus sign takes up all the letters until something else pops up, such as a space. This will be group 1 (the name).  
**.\*Webapp.\***: The construction .\* matches any character, zero or more times up to the word *Webapp*. Then we take everything that gets in our way again.  
**([A-Z]{2}[0-9]{4}).\***: We know what a course code looks like so we won't stop until we get to the other group. The course code is two capital letters followed by 4 digits. The curly brackets, `{2}`, say that what happens in the character class should be matched 2 times followed by 4 digits. There we close the group and pick the rest of the line with `.*`.  
**/\1 \2/**: The second part of the expression is the part that indicates what will replace the match. Now we have caught the groups that we want to reuse, so we put them in there.
