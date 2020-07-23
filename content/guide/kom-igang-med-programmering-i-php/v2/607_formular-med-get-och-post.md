---
author: mos
revision:
    "2018-09-06": "(A, mos) Första versionen."
...
Formulär med GET och POST
=======================

Låt oss gå igenom några av grunderna i hur html-formulär fungerar och hur vi kan ta emot ett postat formulär i ett php-skript.



GET eller POST i formuläret {#getposthtml}
----------------------------

Det finns två sätt att posta ett formulär, antingen GET eller POST.

Det är _method_ som bestämmer vilken typ som formuläret blir användas. Default är GET, utelämnar man `method="get"` så blir det ett GET-form.

```html
<!-- These are get forms -->
<form method="get">
<form>

<!-- This is a post form -->
<form method="post">
```

Skillnaden mellan GET och POST är hur informationen skickas till servern.

När det är GET så skickas informationen via urlen och querysträngen.

När det är POST så skickas informationen via http protokollets body och är inte synligt i länken.



GET eller POST på serversidan {#getpostserver}
----------------------------

På serversidan så läser man av det postade formuläret via de globala variablerna `$_GET` och `$_POST`. Båda är arrayer och innehåller alla delar av det postade formuläret. Är formulär-metoden get så hamnar formuläret i `$_GET` och är metoden post så hamnar värdena i `$_POST`.

När man vill debugga inkommande formulär så skriver man ut dem via `var_dump()` inom ett `<pre>` element så blir det tydligt med radbrytningar. 

```html
<pre>
<?= var_dump($_GET) ?>
<?= var_dump($_POST) ?>
</pre>
```



Mappa formulärlementen mot array {#map}
----------------------------

I html-formuläret sätter man ett namn på formulärelementet `name="title"`. Till exempel så här.

```html
<p>
    <label for="title">Title:</label>
    <input id="title" type="text" name="title">
</p>
```

När man är i php-koden kan man då hämta det värdet via `$_GET["title"]`, eller via `$_POST` om methoden är post.

Så hänger alltså html-formuläret ihop med arrayen på php-sidan.



Till vilken sida postas formuläret {#action}
----------------------------

Du kan ange vart ett formulär skall postas. Man gör det med formulärets _action_. Här är varianter på hur man kan posta till en viss sida.

```html
<!-- Post to another pagecontroller -->
<form method="post" action="post.php">

<!-- Post to another page in the same multipagecontroller -->
<form method="post" action="?page=generate-card">

<!-- Self submitting form, post to the same url currently visiting -->
<form method="post">
```

På det viset kan man styra vem som tar hand om formuläret när det postas.

Det är formulärets _submit_ knapp som gör att formuläret postas till servern. Varje formulär behöver en submit-knapp.

```html
<p>
    <input type="submit" name="create" value="Create">
</p>
```

Det var grunderna i formulärhantering.



Variant på action för multisida {#variant}
----------------------------

Om du tycker detta är svårt så hoppar du över följande stycke som är en förklaring på en liten detalj i exempelkoden.

För den som detaljstuderar exempelkoden med visitkortet och multisidan så kommer den finna en alternativ konstruktion för action i get-formulär i samband med multisidan.

I de formulär som gör GET ser konstruktionen ut så här för att posta till sin egen sida, med rätt multisida som mål.

```html
<form class="form" method="get">
    <input id="page" type="hidden" name="page" value="generate-card">
```

I formulären som använder POST ser det istället ut så här.

```html
<form class="form" method="post" action="?page=generate-card">
```

I båda fallen blir resultatet det önskvärda, en _action_ som leder till den multisida man önskar.

Trixet är att i GET-fallet kommer querysträngen skrivas över när formuläret postas. Därav fixen med ett "hidden" fält som refererar till rätt multisida.
