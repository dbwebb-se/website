---
author: lew
category: python
revision:
  "2020-05-11": (B, aar) La till video inför HT20.
  "2017-05-29": (A, lew) Första utgåvan inför kursen python H17.
...
Jämförelseoperatorer och booleska värden
==================================

[FIGURE src=image/python/compare.png?w=c5 class="right"]

När det kommer till att jämföra värden av olika typer använder vi så kallade jämförelseoperatorer. Det kan definieras som *kriterier i sökningar och formler*. De vanligaste operatorerna (kriterierna) är: lika med, större än, mindre än, större än eller lika med, mindre än eller lika med samt inte lika med. Gemensamt för dessa kriterierna är dess returvärde som är *True* eller *False*, sant eller falskt. Dessa värden kallas boolean, booleskt värde eller kort och gott `bool`. Det finns i nästan alla programmeringsspråk och här tittar vi på hur man kan arbeta med det i python.



<!--more-->

Du kan hitta exempel och mer information i kursrepot för [python-kursen](https://github.com/dbwebb-se/python/blob/master/tutorial/bool-expr.md) och här på [pythons dokumentation](https://docs.python.org/3/reference/lexical_analysis.html#operators).

Koda gärna med i Pythons interpretator. Vill du se hur det går till, kan du kika på [videon](https://www.youtube.com/watch?v=UttaDaPfnI0) som förklarar det.



lika med {#lika-med}
--------------------------------------
Vi tittar närmare på hur operatorn för *lika med* ser ut. Det är samma princip i det flesta språken.

```python
>>> apples = 5
>>> oranges = 5
>>> apples == oranges # Här jämför vi om variablera är likadana, i.e har samma värde
True                  # Returvärdet, en boolean
```



Det som sker i koden ovan är att båda variablerna `apples` och `oranges` får värdet 5. Raden `apples == oranges` kan utläsas som: *apples är lika med oranges*. Operatorn `==` jämför värdet på variablerna. Då båda har värdet 5, och är således lika, returneras det booleska värdet *True*. Tänk på att det hela tiden är **värdet** på variablerna som jämförs med operatorerna. Variablerna kan i sin tur heta (nästan) vad som helst.

Vi kan även se hur det blir om man jämför två värden som inte är likadana:

```python
>>> apples = 5
>>> kiwis = 7
>>> apples == kiwis
False               # Returvärdet, en boolean
```



Om vi tittar på koden ovan har variabeln `kiwis` fått värdet 7. När vi nu jämför variablerna med *apples är lika med kiwis* returneras, inte helt oväntat, *False*. Anledningen är helt enkelt att 5 inte är lika med 7.

De båda resultaten, True och False, är så kallade *booleans*. De kan även styras med 1 respektive 0. True är detsamma som 1, och False är detsamma som 0.

```python
>>> a = 1
>>> b = True
>>> a == b
True                # Värdena räknas som samma
```



större än {#storre-an}
--------------------------------------
Vi kan hoppa vidare till *större än*-operatorn. Den skrivs ut med tecknet `>`.

```python
>>> apples = 5
>>> oranges = 10
>>> kiwis = 7
>>> kiwis > apples
True                # Värdet i variabeln 'kiwis' är större än värdet i variabeln 'apples'
>>> kiwis > oranges
False               # Värdet i variabeln 'kiwis' är INTE större än värdet i variabeln 'oranges'
```

I kodexemplet jämför vi om *kiwis är större än apples* (7 är större än 5) och om *kiwis är större än oranges* (7 är större än 10).



mindre än {#mindre-an}
--------------------------------------
Som av en slump går vi vidare till *mindre än*-operatorn. Den skrivs ut med tecknet `<`.

```python
>>> apples = 5
>>> oranges = 10
>>> kiwis = 7
>>> kiwis < apples
False                # Värdet i variabeln 'kiwis' är INTE mindre än värdet i variabeln 'apples'
>>> kiwis < oranges
True                 # Värdet i variabeln 'kiwis' är mindre än värdet i variabeln 'oranges'
```

Vi kan se att resultaten blir precis omvänt från `>`-operatorn.



större än eller lika med {#storre-an-eller-lika-med}
--------------------------------------
Vi kan även slå ihop föregående operatorer. Ett exempel är operatorn *större än eller lika med*-operatorn. Den skrivs ut med tecknen `>=`.

```python
>>> apples = 5
>>> oranges = 7
>>> kiwis = 5
>>> oranges >= apples
True                    # Värdet i variabeln 'oranges' är större än eller lika med värdet i variabeln 'apples'
>>> apples >= kiwis
True                    # Värdet i variabeln 'apples' är större än eller lika med värdet i variabeln 'kiwis'
>>> apples >= oranges
False                   # Värdet i variabeln 'apples' är INTE större än eller lika med värdet i variabeln 'oranges'
```

Tittar vi på vad vi egentligen jämför med `oranges >= apples` är det *oranges är större än ELLER lika med apples*. Nu är ju variabeln `oranges` större än `apples` (7 är större än 5), så vi får resultatet *True*. När vi jämför `apples >= kiwis` läser vi det som *apples är större än ELLER lika med kiwis*. Variabeln `apples` är inte större men *lika med* värdet på variabeln `kiwis`. Det resulterar också i *True*. Tittar vi på sista raden `apples >= oranges` får vi resultatet *False* för att `apples` är **inte** större än eller lika med värdet på variabeln `oranges`.



mindre än eller lika med {#mindre-an-eller-lika-med}
--------------------------------------
Som komplement till operatorn ovan, finns också operatorn *mindre än eller lika med*. Den skrivs ut med tecknen `<=`. Vi byter ut operatorn i föregående kodexempel och ser vad vi får för resultat.

```python
>>> apples = 5
>>> oranges = 7
>>> kiwis = 5
>>> oranges <= apples
False                 # Värdet i variabeln 'oranges' är INTE mindre än eller lika med värdet i variabeln 'apples'
>>> apples <= kiwis
True                  # Värdet i variabeln 'apples' är mindre än eller lika med värdet i variabeln 'kiwis'
>>> apples <= oranges
True                  # Värdet i variabeln 'apples' är mindre än eller lika med värdet i variabeln 'oranges'
```



inte lika med {#inte-lika-med}
--------------------------------------
Det sista exemplet är operatorn *inte lika med*. Den skrivs ut med tecknet `!=`. Lägg märke till utropstecket, det vänder på jämförelsen och returnerar ett booleskt värde som matchar. Låt oss kasta oss in i ett exempel.

```python
>>> apples = 5
>>> oranges = 10
>>> kiwis = 10
>>> oranges != apples
True                    # Värdet i variabeln 'oranges' är inte samma som värdet i variabeln 'apples'
>>> oranges != kiwis
False                   # Värdet i variabeln 'oranges' är samma som värdet i variabeln 'kiwis'
```



Avslutningsvis {#avslutning}
--------------------------------------

[YOUTUBE src=alJu3Co5hWQ caption="Andreas visar hur jämförelseoperatorerna exekveras."]


Vi har lärt oss om booleska värden och jämförelseoperatorer. Booleska värden skrivs som `True` eller `False`. Viktigt att tänka på är att även värdena `1` och `0` kan tolkas som booleska värden. De operatorer som artikeln har tagit upp är generella och kan användas i de flesta programmeringsspråk. Jämförelseoperatorer är även en viktig del i villkorshantering, loopar och if-satser som [nästa artikel](kunskap/villkor-och-loopar) handlar om.
