---
author: mos
revision:
    "2018-05-07": "(C, mos) Uppdaterad inför vt18 lp4, slog ihop avsnitt om applikationer in i texten."
    "2018-02-27": "(B, mos) Uppdaterad inför vt18."
    "2017-02-23": "(A, mos) Kopierad från GoogleDocs och översatt till svenska samt aningen modifierad."
...
Projekt: Internetbanken
==================================

Du är en senior konsult på företaget "HögProfilKonsultMedSlips". Du har tilldelats en uppgift att utveckla en Internetbank till den svenska kunden, "BankBluffOBåg AB".

Du har resultatet från en förstudie som en kollega har förberett, det ger dig basen till en ER modell.

Du har kraven på systemet och de klienter du skall implementera.

Din uppgift är nu att implementera, leverera och dokumentera Internetbanken (IB).

Lycka till!

<!--
excel, csv för input och sätta upp tabellerna.
csv output till excel för att visa resultat (admin-delen)
backup av databasen?

Visa hur projektet testas?

Visa senaste transaktioner (bra testa).

Hur se på sessionen i webben och i cli-en, hur hantera inloggning/authenticering i clienten?
-->



Pre study {#studie}
--------------------------------------------------------------------

This is the pre study made on IB.



### Account and account holders {#account}

The IB shall provide bank accounts for customers (account holders). An account holder can have several accounts. Each account can be shared between two or more account holders.

The bank cashier creates new accounts and new account holders. An account can be shared between account holder(s). The cashier can connect one account to several account holders.

Information on an account holder is name, birth date, street and city of residence.

A userid is created for each account holder. This is to be used for access verification. A 4-digit pincode shall also be created for each userid.

Information related to an account is the balance and the account number.

The bank cashier can set a balance for an account. See it as the bank cashier got some cash from the customer to insert into the bank account.

Build a user interface for the bank cashier supporting the following.

* Add an account holder.
* Add a new account and connect it to an account holder.
* Connect an additional account holder to an existing account.
* Show all account holders with their accounts and balance.



### Account holder access {#holder}

The account holder can access their accounts by a web interface. They shall be able to list their accounts with the balance. It shall be visible if the account is shared with another account holder.

The account holder can move money between their own accounts. Each time they move money they need to pay 1% of the moved amount to your own special and secret account. You wish to earn money for a house in a sunny foreign country.

Build a user interface for the account holder, supporting the following.

* Show all accounts for an account holder.
* Make it visible if the account is shared with other account holders (show their names).
* Move money between own accounts.



### Swishing the money {#swish}

The account holders send and receive money through a swish-like application. 

An account holder can select one of their own accounts and select it as a swish-account. This account should then be connected to a phone number.

Swishing is done by, using the swish-like application, identifying using the userid and the 4-digit pincode and then followed by entering the phone number of the receiving account holder, the amount to swish and a message.

Each time a swish is done, a fee of 2% of the swished amount should be taken and stored in your special and secret account. See this as your insurance for days to come; perhaps a nice lodge in sunny Spain can come out of this.

Build a user interface for the swish-like application.



### Transaction log {#log}

There should be a log table where one can see all transactions made on all accounts.

A log entry shall be written to the log table each time the balance is changed for an account. The entry should consist of an transaction id, the account number, current balance, amount changed and a timestamp.

There should be a user interface where one can view the transaction log. Show the latest transactions first and enable to only show a few, not all, of the latest transactions. Make it possible to search the transaction log for transaction id, accounts and dates.



### Secret account {#secret}

The secret account is an ordinary account owned by you. The fees stored in the secret account is taken from the existing money, you can not produce more money than the bank has.

Build a user interface that shows the balance of your secret account together with the total balance of all accounts in the bank. Do also show the latest transactions made to your secret account.



### Calculating interest {#calculate}

The calculation of interest is supposed to be done on a daily basis. It is performed manually by starting the process that calculates the daily interest for each account. The interest is calculated by `interestRate * accountBalance / daysOfCurrentYear`.

The interest rate and the date for calculating the interest should be set manually when calculating the interest.

The result shall be stored in a separate table with the values of the calculated interest, date for calculation, interest rate and account number.

The yearly accumulated interest for a specific account can then be calculated by summing all entries, for the specific account.

At the end of the year all interest is moved to each account and the interest table is cleared on those values moved.

Build a user interface that handles all procedures involved with calculating the interest.

* Show all entries in the table containing interest calculations.
* Make it possible to filter/search the above report and only show some account.
* Show the accumulated interest for each account.
* Perform the calculation of interests for a specific day on all accounts (enter interest rate and date).
* Show the accumulated interest for all accounts on a specific day.
* Show the accumulated interest for all accounts on a specific year.
* Clear all interest calculations for a selected year.
* Move all interests over to their respective account and clear the interest table (for a selected year).



Requirements on presenting the project {#redovisning}
--------------------------------------------------------------------



### The database {#db}

The database must contain at least the following data:

* At least 7 account holders and at least 15 accounts.
* At least 3 account holders shall share 3 or more accounts.
* The accounts should contain some money.
* You should have made calculation of interest for at least 2 different dates.



### SQL files for the database {#sqlfiles}

Ensure you can reset the bank database by loading its schema and content from files.

```text
mysql -uroot -p < sql/setup.sql
mysql -uuser -ppass ibank < sql/ddl.sql
mysql -uuser -ppass ibank < sql/insert.sql
```

The file `sql/setup.sql` creates the database `ibank` and a user `user` with password `pass`.

The file `sql/ddl.sql` creates the tables, the database schema.

The file `sql/insert.sql` deletes and inserts default values into the database. 

You may use LOAD DATA INFILE but ensure to use only relative paths to the same directory.

```text
LOAD DATA LOCAL INFILE 'account.csv'
```



### The documentation {#docs}

The documentation should be proper, nice-looking and complete.

Design and document the database in line with the intentions of "[Kokbok för databasmodellering](kunskap/kokbok-for-databasmodellering)".

Add a chapter where you document your applications as a user gude for them.

* Describe the intention of each application.
* Shortly describe how to work with the application.
* Some screenshot could enhance the documentation.

Make it look nice.



Tip {#other}
--------------------------------------------------------------------

Try to build a good structure of your database and provide a good API for the database reports through procedures, functions, triggers and views.

First build your database with the API of stored procedures, verify that the procedures work, then attach the applications.

Ensure that your reports/tasks works in the database before you try to integrate them with the various GUIs.



Guide to self testing {#selftest}
--------------------------------------------------------------------

This is briefly how you can verify that your database works as expected.

Start upp all applications to make it easy to use them at once.

1. Add an account holder A with one account.
1. Look up another account holder B and let A share that account.
1. Move all money from the shared account to A's private account.
1. Swish all money from A's private account to to B.
1. Verify that the secret account and the bank total balance is valid.
1. Verify that the transaction log contains the appropriate entries.

For testing the interest procedure.

1. Clear all previous interest calculations.
1. Calculate the interest for today.
1. Calculate the interest for tomorrow (we want two days of calculcated interest).
1. Check the bank balance and the total sum of interest.
1. Move all interest to each account.
1. Check the bank balance and the total sum of interest.

It is easier to test when you have known values in your bank. For example, before you start testing, assure you have 1MSEK in your bank, instead of 975 283,59 SEK.
