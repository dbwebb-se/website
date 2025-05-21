---
author: aar
category:
    - python
revision:
    "2019-06-14": (A, aar) Första versionen.
...
Radbrytning i Python
==================================

Ett vanligt validerings fel är *line-to-long*, vilket kan vara svårt att lösa ibland. Här ska vi lära oss olika sätt vi kan bryta ner lång rader på.

<!--more-->

Det finns två sätt att dela upp rader, *implied line continuation inside brackets and braces* och *backslash*, `\`. [Pep8](https://www.python.org/dev/peps/pep-0008/#maximum-line-length) rekommenderar att använda parenteser.

# Parenteser {#parenteser}

Ett par exempel där vi använder parenteser för att dela upp rader.

```python
long_string = ("The Wheel of Time turns, and ages come and pass, leaving memories that become legend."
               " Legends fade to myth, and even myth is long forgotten when the Age that gave it birth comes again."
               " In one Age, called the third age by some, an Age yet to come, an age long pass,"
               " a wind rose in the Mountains of Mist.")
```

Vi behöver inte kommatecken mellan varje sträng, Python konkatenerar automatiskt alla raderna.

```python
foo = long_function_name(var_one, var_two,
                         var_three, var_four)

if (x == 10
        or x > 0
        or x < 100):
    print(True)
```

Vi gör extra indentation, så kallad *hanging indentation*, för att det lättare ska gå att urskilja vilka rader som är uppdelade. Det går att läsa mer om det i [pep8](https://www.python.org/dev/peps/pep-0008/#indentation).

```python
income = (gross_wages
          + taxable_interest
          + (dividends - qualified_dividends)
          - ira_deduction
          - student_loan_interest)
```

Det fungerar också för operation. [Pep8](https://legacy.python.org/dev/peps/pep-0008/#should-a-line-break-before-or-after-a-binary-operator) har även rekommendation för om man ska göra radbytet före eller efter en binär operator. Som ni kan se ovanför ska man göra det före, för att koden ska bli mer lättläst.



# Backslash {#backslash}

Vi kollar även på hur det ser ut med backslash. Om man använder backslash är det viktigt att det inte är något space efter backslashet.

```python
if x == 10 \
        or x > 0 \
        or x < 100:
    print(True)

income = gross_wages \
          + taxable_interest \
          + (dividends - qualified_dividends) \
          - ira_deduction \
          - student_loan_interest
```

Även om det generellt är rekommenderat att använda parenteser finns det tillfällen man behöver använda backslash. T.ex. flera `with` och `assert` uttryck, då fungerar inte parenteser för uppdelning.

```python
with open('/path/to/some/file/you/want/to/read') as file_1, \
     open('/path/to/some/file/being/written', 'w') as file_2:
    file_2.write(file_1.read())
```
