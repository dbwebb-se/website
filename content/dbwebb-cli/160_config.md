Konfigurera
==================================

Låt `dbwebb` skapa en konfigurationsfil, den är nödvändig och behövs.

```text
$ dbwebb config
```

Kommandot skapar en konfigurationsfil och lagrar din studentakronym. Du skall ange den akronymen som du fått av BTH. Det är den användare som du använder för att logga in på studentservern, studentportalen och läroplattformen ITs.

Din akronym kan se ut så här, som exempel:

```text
goli21
mase22
```

Akronymen består av dina initialer följt av året som ditt studentkonto skapades.

Konfigurationsfilen sparas i din lokala hemmakatalog, du kan titta på dess innehåll via följande kommando.

```text
$ cat "$HOME/.dbwebb.config"
```

Om något blir fel så kan du alltid skapa om din konfigurationsfil. Det är bara att köra samma kommando igen.

Så här kan det se ut.

[ASCIINEMA src=24613]
