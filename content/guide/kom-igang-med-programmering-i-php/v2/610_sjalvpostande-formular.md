---
author: mos
revision:
    "2018-09-07": "(A, mos) Första versionen."
...
Självpostande formulär
=======================

Här finner du ett mindre exempel på ett formulär som postas till sig själv och skriver ut det postade innehållet.

I slutet hittar du ett par övningar så att du kan jobba vidare med exempelkoden och utveckla den vidare. Det är ett bra sätt att lära sig detaljerna.



Exempel på självpostande formulär {#selfexample}
------------------------------

Låt oss ta ett mindre exempel på ett självpostande, _self submitting_, formulär.

Du finner det i kursrepot under `example/guide-php/06/self-submitting-form.php`.

```html
<?php
/**
 * A self submitting form, submits itself to the same page.
 */


?><!doctype html>
<meta charset="utf-8">
<title>Self submitting GET form</title>
<form>
    <fieldset>
        <label>Self submitting GET form</label>
        <p>
            <label for="title">Title:</label>
            <input id="title" type="text" name="title" value="<?= htmlentities($_GET["title"] ?? null) ?>">
        </p>
        <p>
            <input type="submit" name="create" value="Create">
            <input type="reset" value="Reset">
        </p>
    </fieldset>
</form>

<?php if ($_GET["create"] ?? false) : ?>
<output>
    <p>This is the content of the posted form.</p>
    <pre>
        <?= var_dump($_GET) ?>
    </pre>
</output>
<?php endif; ?>
```

Exemplet ser ut så här när du kör det.

[FIGURE src=image/snapht18/selfsubmit-form1.png?w=w3 caption="Ett self-submitting GET formulär för att testa och leka."]

När du fyller i ett värde i formuläret kan du posta det och resultatet visas på nästa sida.

[FIGURE src=image/snapht18/selfsubmit-form2.png?w=w3 caption="Resultatet av det postade formuläret visas."]

Koden i exemplet sammanfattar grunderna i hur ett formulär kan hanteras.



Egen övning {#ovning}
------------------------------

Det du nu bör göra är att bekanta dig med det lilla exempelprogrammet ovan.

Sedan bör du göra följande.

1. Ta en kopia och modifiera så att det blir ett POST-formulär.
1. Pröva att posta till en annan sida, som bara skriver ut resultatet av det postade formuläret.

När du gjort de två övningarna så tror jag att du har hyffsad koll på grunderna i hur ett formulär fungerar.

Att göra små enkla testprogram har ett stort värde. Det är så man kan pilla runt, testa och leka med konstruktioner som är obekanta.

När du väl kan detta i det "lilla", så blir det enklare att se delarna i det större exemplet som genererar visitkorten.
