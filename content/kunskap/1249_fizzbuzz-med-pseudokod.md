---
author: bbe
category: python
revision:
  "2024-09-17": (A, bbe) Första utgåvan. Tillägg till befintliga övningar.
...
Fizz Buzz
==================================

Fizz Buzz är en lek som syftar till att lära barn division. Deltagarna räknar i tur och ordning från 1 och uppåt. När en deltagare hamnar på ett tal jämnt  delbart med 3 ska hen istället säga "Fizz". Om det är ett tal jämnt delbart med 5 ska hen säga "Buzz". Är talet jämnt delbart med både 3 och 5 ska hen säga "FizzBuzz". 

Ex: 1, 2, Fizz, 4, Buzz, 6, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz, 16, 17, Fizz, 19, Buzz, ..... 

Om en deltagare tvekar eller missar att ersätta ett tal med "Fizz", "Buzz" eller "FizzBuzz" är hen ute ur leken.

Vi ska göra ett program som visar "facit" fram till talet 100, dvs som skriver ut alla heltal inom [1..100] och som ersätter tal delbara med 3 med Fizz, tal delbara med 5 med Buzz och tal delbara med både 3 och 5 med FizzBuzz.


<!--more-->

Vad behövs och hur börjar man? 
--------------------------------------

Vi vet att vi med Python-kod bl. a kan 

- skriva ut (`print`)
- utföra beräkningar
- lagra resultat i variabler
- bearbeta strängar 
- selektera, dvs formulera villkor och styra programflödet (`if` och `if-else`)
- iterera, dvs upprepa körning av ett visst kodavsnitt (`for` och `while`) 

Innan vi är riktigt varma i kläderna är det bra om vi kan identifiera delproblem och lösa dessa för att sedan sätta samman dem till en lösning av hela ursprungsproblemet. Det vi kan identifiera som delproblem i det här fallet är

1. Generering av alla heltal mellan 1 och 100
2. Att ta reda på om ett heltal är jämnt delbart med ett annat heltal
3. Göra specifik hantering beroende på om ett tal är delbara med 3 (och på motsvarande sätt med 5)


Vi ska i detta fall formulera lösningar innan vi skriver ner dem i Python-kod. Detta gör vi i **pseudokod**, vilket innebär att vi använder en kombination av naturligt språk och konstruktioner som finns i programspråk. Detta kan sedan relativt enkel översättas till ett specifik programspråk som i vårt fall är Python. 

Vi löser de delproblem som tidigare identifierats

1. **Generering av alla heltal mellan 1 och 100**   
        Vi behöver en iteration med en variabel som ges varje värdet fr.o.m 1 t.o.m 100 

```
    for number from 1 until 100
        ...

```
I Python kan vi ska heltal inom 1 och 100 genom:

```python
    for i in range(0,101):
        pass

```

2. **Att ta reda på om ett heltal är jämnt delbart med ett annat heltal**  
        Ett heltal delar ett annat heltal om resten vid division blir 0. Ex-vis delar 5 talet 20 eftersom 5 går exakt 4 gånger i 20, dvs 20 = 5 x 4. Däremot delar 5 inte talet 17 eftersom det 5 går 3 gånger i 17 (5 x 3 = 15) och det blir 2 över. Att bestämma resten vid heltalsdivision kallas att utföra modulus-beräkning.  
        Ex: 5 mod 17 blir 3 och 5 mod 20 blir 0, dvs x mod y blir 0 om y går jämnt upp i x

```
    number mod 3 blir 0 om number är jämnt delbart med 3
    number mod 5 blir 0 om number är jämnt delbart med 5

```
I Phyton skrivs detta: 

```python
    number % 3 == 0
    number % 5 == 0
```

3. **Göra specifik hantering beroende på om ett tal är delbara med 3**  
        Vi behöver selektion eftersom vi bara ska göra något specifikt för tal delbara med 3

```
    if number mod 3 is 0
        ...

```
I Python blir det:
```python
    if number % 3 == 0:
        pass
```

Nu är det dags att sätta samman lösningarna, men vi tar det stegvis.
Först löser vi ett enklare problem vilket är att ersätta tal delbara med 3 med ordet "Fizz" men alla andra tal skrivs ut

```
    for number from 1 until 100
        if number is divisible by 3
            print "Fizz"
        else
            print number

```

Detta ger oss en utskrift där 3, 6, 9, 12, osv ersätts med "Fizz" vilket innebär att vi får utskriften 1 2 "Fizz" 4 5 "Fizz" 7 8 ....  

Nu behöver vi lägga till kontroll för att hitta de tal som är jämnt delbara med 5. Här behöver vi tänka till! Vi tar fram några tal som ska täcka in all möjliga alternativ:

Talet 10 ska ge resultatet "Buzz" (endast delbart med 5)
Talet 7 ska ge resultatet 7 (inte delbart med varken 3 eller 5, dvs inte delbart med 3 och inte delbart med 5)
Talet 6 ska ge resultatet "Fizz" (endast delbart med 3)
Talet 15 ska resultatet "FizzBuzz" (delbart med 3 och delbart med 5)


Vi fokuserar på selektionerna och gör ett första "försök" genom att lägga till en if-sats med kontroll av delbarhet med 5, dvs 

``` 
    for number from 1 until 100
        if number is divisible by 3
            print "Fizz"
        if number is divisible by 5
            print "Buzz"
        else
            print number
 
```
Nu undersäker vi vilka resultat vi får för de heltal vi har resonerat kring!

Anta att number är 10:  
Kontrollen av delbarhet med 3 resulterar i falskt och körningen fortsätter till nästa kontroll, dvs av delbarhet med 5.
Kontrollen blir sann och resulterar i att "Buzz" skrivs ut och körningen hoppar förbi else-delen.

Anta att number är 7:  
Kontrollen av delbarhet med 3 resulterar i falskt och körningen fortsätter till nästa kontroll, dvs av delbarhet med 5.
kontrollen blir falsk och körningen fortsätter till else-delen, och utskrift av 7 genomförs.

Anta att number är 6:  
Kontrollen av delbarhet med 3 resulterar i sant och utskrift av "Fizz" genomförs.
Körningen fortsätter till nästa kontroll, dvs av delbarhet med 5.
Kontrollen blir falsk och körningen fortsätter till else-delen, och utskrift av 6 genomförs.

Ajdå - det var inte rätt. Vi fick först utskrift "Fizz" och sedan utskrift 6. 

Vi behöver se till att utskrift av `number` endast utförs om `number` varken är delbart med 3 eller delbart med 5. 

```
for number from 1 until 100
    if number is divisible by 3
        print "Fizz"
    if number is divisible by 5
        print "Buzz"
    if number not divisible by 3 and not divisible by 5
        print number
```
Nu har vi en lösning i pseudokod och det är dags att överföra den till Python. 

```python
for number in range(1, 101):
    if number % 3 == 0:
        print("Fizz")
    if number % 5 == 0:
        print("Buzz")
    if number % 3 != 0 and number % 5 != 0:
        print(number)
```
När vi testar att köra programmet kommer vi att se att alla utskrifter kommer på ny rad. Vi har alltså en del finjustering göra. ATt få en utskrift att inte avslutas med radbrytning i Python kan vi fixa med `print(..., end = "")`, dvs 

```python
for number in range(1, 101):
    if number % 3 == 0:
        print("Fizz", end= "")
    if number % 5 == 0:
        print("Buzz", end="")
    if number % 3 != 0 and number % 5 != 0:
        print(number, end="")
```
Vi testar igen och upptäcker nu att allt hamnar på samma rad, dvs 12Fizz4BuzzFizz78FizzBuzz ....

Vi behöver tillföra ett komma och mellanslag, dvs strängen ", " efter varje utskrift. Eftersom alla utskrifter (avsett om det är "Fizz", "Buzz" eller number) ska avslutas med ", "placerar vi detta efter alla selektioner, dvs för varje iteration.

```python
for number in range(1, 101):
    if number % 3 == 0:
        print("Fizz", end= "")
    if number % 5 == 0:
        print("Buzz", end="")
    if number % 3 != 0 and number % 5 != 0:
        print(number, end="")
    print(", ")
```

Nu blir resultatet det förväntade!

Det finns ofta mer än en lösning på ett programmeringsproblem. För juts denna uppgiften kan man t.ex undersöka delbarhet med både 3 och 5, dvs delbarhet med 15 som ett selektionsalternativ. 

```
for number from 1 until 100
    if number is divisible by 15
        print "FizzBuzz"
    else if number is divisible by 3
        print "Fizz"
    else if number is divisible by 5
        print "Buzz"
    else
        print number

```
vilket i python blir (med de fixar vi löst avseende utskrifterna tidigare)

```python

for number in range(1, 101):
    if number%15 == 0:
        print("FizzBuzz", end = "")
    elif number%3 == 0:
        print("Fizz", end = "")
    elif number%5 == 0:
        print("Buzz", end = "")
    else: 
        print(number, end = "")
    print(end=", ")

```
 Om vi jämför de båda alternativen till lösning, så finns det framför allt en fördel med den senare. Den förra lösningen utför alltid 3 kontroller för varje värde på number eftersom det är tre "fristående" if-satser. I den senare utförs t.ex endast en kontroll för de tal som är jämnt delbara med 15. 


Vi tänker oss att lösningen, dvs följden av tal, "Fizz", "Buss" och "FizzBuzz", ska användas senare i programmet och därför behöver lagras i en variabel. Det innebär att utskrifterna ska tas bort och istället ska vi använda en sträng som byggs på efterhand slutet.

Att bygga på en sträng innebär att hämta det innehåll som finns i strängvariabeln och addera det som ska läggas till (med +operatorn) och placera resultatet i den aktuella strängvariabeln. Ex-vis

result = "hel"  
result = result + "lo"  

Det som finns till höger om = uträttas ("hel" + "lo" vilket blir "hello") och därefter sparas det i den variabel som finns till vänster om =.   
  
result innehåller nu "hello"  

Vår lösning blir:  

```
låt fizz_buzz_result vara en tom sträng
for number from 1 until 100
    if number is divisible by 15
        lägg till "FizzBuzz" i slutet av fizz_buzz_result
    else if number is divisible by 3
        lägg till "Fizz" i slutet av fizz_buzz_result
    else if number is divisible by 5
        lägg till "Buzz" i slutet av fizz_buzz_result
    else
        lägg till number i slutet av fizz_buzz_result
```
Ì Python blir det
```python
fizz_buzz_result=""
for number in range(1,101):
    if number%15 == 0:
        fizz_buzz_result = fizz_buzz_result + "FizzBuzz"
    elif number%3 == 0:
        fizz_buzz_result = fizz_buzz_result + "Fizz"
    elif number%5 == 0:
        fizz_buzz_result = fizz_buzz_result + "Buzz"
    else:
        fizz_buzz_result = fizz_buzz_result + str(number)
    fizz_buzz_result = fizz_buzz_result + ", "

#en utskrift för att se att det blir rätt innehåll i strängen
print(fizz_buzz_result)

```


Utöka Fizz Buzz
--------------------------------------

Utgå från den senare lösningen.

Låt användaren mata in två heltal vilka ska motsvara starttal och sluttal för uppräkningen (vilket i ursprungslösningen är 1 och 100). Det minsta av de båda inmatade talen ska bli starttal och det andra ska bli sluttal.

Idé:

Användaren matar in de båda tal som ska motsvara start och slut. Om start är större än slut byt deras innehåll. 

Modifiera iterationen så att den styrs av de inmatade gränsvärdena:


```
start = user input
end = user input

if start > end
    temp = start
    start = end
    end = temp

for number from start until end
    ...
```


Låt användaren mata in de båda tal som delbarheten ska kontrolleras mot (vilket i ursprungslösningen är 3 och 5). 
Dessa tal får inte vara delbara med varandra. Användaren får hålla på att mata in tills dess att talen uppfyller kravet på att de inte är delbara med varandra.

Det första inmatade talet av dessa ska utgöra grunden för utskrift av "Fizz" och det andra talet ska utgöra grunden för utskrift av "Buzz"


Idé: 

Använd en flagga, dvs en boolesk variabel, som blir sann först om de båda inmatade talen inte är delbara med varandra. 
Inmatning av det första talet kan göras utan någon kontroll. Detta tal ska användas för att kontrollera delbarhet som ger utskriften "Fizz"
Starta med att låta flaggan vara falsk
Så länge flaggan är falsk låter vi användaren mata in det andra talet och kontrollerar om detta uppfyller kravet på att inte vara delbart med det första eller omvänt, dvs att det första inte är delbart med det andra. Låt flaggan bli sann om kravet är uppfyllt.


```
div_fizz = user input
divisors_ok = false
while not divisors_ok
    div_buzz = user input
    if div_fizz is not divisible by div_buzz and div_buzz is not divisible by div_fizz
        divisors_ok = true
```

Vi behöver modifiera så att talen 15, 3 och 5 ersätts av de värden som användaren matat in.
Sammansatt till en hel lösning blir det

```
start = user input
end = user input

if start > end
    temp = start
    start = end
    end = temp

div_fizz = user input
divisors_ok = false
while not divisors_ok
    div_buzz = user input
    if div_fizz is not divisible by div_buzz and div_buzz is not divisible by div_fizz
        divisors_ok = true

låt fizz_buzz_result vara en tom sträng
for number from start until end
    if number is divisible by div_fizz*div_buzz
        lägg till "FizzBuzz" i slutet av fizz_buzz_result
    else if number is divisible by div_fizz
        lägg till "Fizz" i slutet av fizz_buzz_result
    else if number is divisible by div_buzz
        lägg till "Buzz" i slutet av fizz_buzz_result
    else
        lägg till number i slutet av fizz_buzz_result

```

Som i python blir

```python

print("Mata in de båda heltal som ska utgöra gränserna för uppräkningen")
start = int(input("Ena gränsvärdet: "))
end = int(input("Andra gränsvärdet: "))

if start > end:
    temp = start
    start = end
    end = temp

print("Mata in de båda tal som delbarheten ska kontrolleras mot. Dessa tal får inte vara jämnt delbara med varandra")

ok_divisors = False
div_fizz = int(input("Första talet: "))
while not ok_divisors:
    div_buzz = int(input("Andra talet: "))
    if div_fizz%div_buzz != 0 and div_buzz%div_fizz != 0:
        ok_divisors = True

fizz_buzz_result=""
for number in range(start,end + 1):
    if number % div_fizz*div_buzz== 0:
        fizz_buzz_result = fizz_buzz_result + "FizzBuzz"
    elif number % div_fizz == 0:
        fizz_buzz_result = fizz_buzz_result + "Fizz"
    elif number % div_buzz == 0:
        fizz_buzz_result = fizz_buzz_result + "Buzz"
    else:
        fizz_buzz_result = fizz_buzz_result + str(number)
    fizz_buzz_result = fizz_buzz_result + ", "

print(fizz_buzz_result)
```

Avslutningsvis {#avslutning}
--------------------------------------
Vi har i denna övning haft fokus på att lösa ett programmeringsproblem genom att identifiera delproblem och använda pseudokod för att formulera lösningar på dessa. De konstruktioner som har varit aktuella är i första hand iteration och selektion. I python motsvaras detta av 

- `while` och `for` (iteration)
- `if`(selektion) 


Alla kodexempel från denna övningen finns i kursrepot för [python-kursen](https://github.com/dbwebb-se/python/tree/master/example/flow).
