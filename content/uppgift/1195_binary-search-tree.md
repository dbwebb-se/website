---
author: aar
revision:
    "2018-02-25": (B, aar) La till krav om rekursion.
    "2018-02-22": (A, aar) First version.
category:
    - oopython
...
Skapa ett Binary Search Tree
===================================

Skapa ett Binary Search Tree med rekursiva metoder.

<!--more-->


Förkunskaper {#forkunskaper}
-----------------------

Du har läst artikeln "[Exceptions](kunskap/exceptions)".  
Du har läst artikeln "[Träd Datastrukturer](kunskap/trad-datastruktur)".



Binary Search Tree {#bst}
-----------------------  

Vi ska skapa en egen datastruktur, ett "Binary Search Tree" (bst), som en klass. Nedanför ser vi ett klassdiagram för en bst klass. Under diagrammet beskrivs varje metod. Diagrammet ska uppfyllas av er implementation.

[FIGURE src=/image/oopython/kmom06/bst_v2.png caption="Klassdiagram för Binary Search Tree och Node klassen"]

BinarySearchTree:

* `__init__`: Skapa ett objekt, sätt root till None.
* `insert`: Skapar en ny nod med key och value. Lägger till en noden på rätt plats i trädet, baserat på key. Om nod med key redan finns i trädet skriv över värdet i noden.
* `inorder_traversal_print`: Skriver ut värdet i noderna i trädet i rätt ordning, lågt till högt. En rad per värde, t.ex. "1\n4\n2\n".
* `get`: Returnera value från noden med nyckeln key. Om key inte finns i trädet lyft ett KeyError exception (det inbyggda).
* `remove`: Ta bort nod med samma key, returnera värdet från noden. Om nod med key inte finns lyft KeyError exception (det inbyggda).
* `size`: Returnera antalet noder i trädet. Skapa denna tidigt, testerna använde den.

Node:

* `__init__`: Skapa ett objekt, sätt attributen left och right till None.
* `has_left_child`: returnera True om noden har en left child nod, annars False.
* `has_right_child`: returnera True om noden har en right child nod, annars False.
* `has_both_children`: returnera True om noden har en left och en right child nod, annars False.
* `has_parent`: returnera True om noden har en parent nod, annars False.
* `is_left_child`: returnera True om noden är left child till sin parent nod, annars False.
* `is_right_child`: returnera True om noden är right child tills sin parent nod, annars False.
* `is_leaf`: returnera True om noden inte har några children noder (left eller right), annars False.
* `__lt__`: returnera True om nodens key är mindre än other, annars False.
* `__gt__`: returnera True om nodens key är större än other, annars False.
* `__eq__`: returnera True om nodens key är lika med other, annars False.




Krav {#krav}
-----------------------

```bash
# Ställ dig i kurskatalogen
cd me/kmom06/tree
```

1. Skapa en fil med namnet `node.py` i "tree" mappen. Skriv koden för din Node klass här.

1. Skapa en fil med namnet `bst.py` i "tree" mappen. Skriv koden för din BinarySearchTree klass här.

1. Döp klasser, metoder och attribut som i klassdiagrammet ovanför. Ni får lägga till andra attribut och metoder.

1. Implementera BinarySearchTree med noder för att bygga ett träd med metoderna som förklaras ovanför.

1. Metoderna för Insert/Get/Print/Remove ska jobba rekursivt för att traversera noderna. De metoderna som anropas för det operationerna måste inte jobba rekursivt men då ska de anropa andra metoder som jobbar rekursivt. Kolla på genomgången för exempel.


```bash
# Ställ dig i kurskatalogen
dbwebb test tree
dbwebb publish tree
```

Rätta eventuella fel som dyker upp och validera igen. När det ser grönt ut så är du klar.



Extrauppgift {#extra}
-----------------------

1. Implementera den [magiska metoden __len__](https://docs.python.org/3/reference/datamodel.html#object.__len__) för ditt BST. Gör så `len(bst)` fungerar.

1. Implementera den [magiska metoden __getitem__](https://docs.python.org/3/reference/datamodel.html#object.__getitem__) för ditt BST. Gör så `bst[0]` fungerar.

1. Implementera den [magiska metoden __setitem__](https://docs.python.org/3/reference/datamodel.html#object.__setitem__) för ditt BST. Gör så `bst[0] = 4` fungerar.

1. Implementera den [magiska metoden __contains__](https://docs.python.org/3/reference/datamodel.html#object.__contains__) för ditt BST. Gör så `0 in bst` fungerar. `0` är en nyckel.


Tips från coachen {#tips}
-----------------------

Validera ofta. Så slipper du en massa valideringsfel i slutet av övningen.

Lycka till och hojta till i forumet om du behöver hjälp!
