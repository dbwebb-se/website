---
author: lew
category:
    - bash
    - lab
revision:
    "2019-08-20": (A, lew) First edition.
...
Unix lab introduction
==================================

During the course you will perform a set of laborations where you practice your skills in different areas.

<!--more-->



Instructions {#instructions}
-----------------------

### Get the lab {#get}

The lab is automatically generated for you. Here's how to check out your personal lab.

Go to your course directory in the terminal and run the command for your lab.

```bash
$ dbwebb create <lab>
```

Instead of `<lab>` you type the name of the lab ie `$ dbwebb create bash1`.

The material for the lab is now created and stored in your course catalog as follows.

| File               | Content                                                        |
|--------------------|----------------------------------------------------------------|
| `instruction.html` | Description of the lab and the tasks to be done.               |
| `answer.bash`      | Here you should write your code to solve each task in the lab. |

Open the file `instruction.html` in a web browser and read through the information covered by the lab.

Open the file `answer.bash` in your text editor and code the answers to the questions.

Some labs requires an additional file or folder which will reside in the lab directory and automatically downloaded for you.



### Test lab {#test}

You can test your solutions by running the program `answer.bash` in your terminal.

```bash
$ ./answer.bash
```



### Hand in the lab {#handin}

To hand in the lab, execute the following command:

```bash
dbwebb publish <lab>
```

Instead of `<lab>` you type the name of the lab ie `$ dbwebb publish bash1`.

Correct any errors that pop up and publish again. When it looks green you are done. You also have an indication at the bottom where the score is shown.



Laborations {#labs}
-----------------------

### Lab 1 (bash1) {#lab1}

Laboration to train the basics in bash. You will work with the apache configuration directory from a linux server.

Create the lab with:

```bash
$ dbwebb create bash1
```

Enter your bash code within `$ ()` to execute and return the response, eg:

```bash
ANSWER=$( find . -name 'filename' )
```

Additional files and folders:

| Folder             | Content                                             |
|--------------------|-----------------------------------------------------|
| `apache2`          | The directory in which the data is to be executed.  |



### Lab 2 (bash2) {#lab2}

Laboration to practice bash commands to search and retrieve information in text files.

Create the lab with:

```bash
$ dbwebb create bash2
```

Enter your bash code within `$ ()` to execute and return the response, eg:

```bash
ANSWER=$( find . -name 'filename' )
```

Additional files and folders:

| File             | Content                                            |
|--------------------|--------------------------------------------------|
| `ircLog.txt`          | The file to search in to solve the problems.  |



### Lab 3 (regex) {#lab3}

Laboratory to practice the basics of regex. To your help you have a [regex guide](guide/get-started-with-regex/intro).

Create the lab with:

```bash
$ dbwebb create regex
```

Enter your bash code within `$ ()` to execute and return the response, eg:

```bash
ANSWER=$( ./cars.bash ^[a-z]+$ )
```

Additional files and folders:

| File               | Content                            |
|--------------------|------------------------------------|
| `cars.txt`       | text file for some of the tasks.   |
| `cars.bash`      | bash file with helper function.   |



### Lab 4 (sed1) {#lab4}

Laboratory to further practice the basics of regex. You will work with the tool *sed* and various text files. To your help you have a [regex guide](guide/get-started-with-regex/intro).

Create the lab with:

```bash
$ dbwebb create sed1
```

Enter your bash code within `$ ()` to execute and return the response, eg:

```bash
ANSWER=$( sed -E -n '/regex/p' < filename.txt )
```

Additional files and folders:

| File               | Content                            |
|--------------------|------------------------------------|
| `emails.txt`       | text file for some of the tasks.   |
| `numbers.txt`      | text file for some of the tasks.   |
| `quotes.txt`       | text file for some of the tasks.   |
| `substitution.txt` | text file for some of the tasks.   |



### Lab 5 (jq) {#lab5}

Laboratory to practice searching in a JSON file. You will work with the tool *jq*. To your aid you have the guide ["install jq"](kunskap/install-jq).

```bash
$ dbwebb create jq
```

Enter your bash code within `$ ()` to execute and return the response, eg:

```bash
ANSWER=$( jq 'keys' tag-dbwebb.json )
```

Additional files and folders:

| File                | Content                                                              |
|--------------------|-----------------------------------------------------------------------|
| `instruction.html` | Description of the lab and the tasks to be done.               |
| `answer.bash`      | Here you should write your code to solve each task in the lab. |
| `tag-dbwebb.json`          | text file for some of the tasks.                              |
