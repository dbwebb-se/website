---
author: lew
revision:
    "2020-04-30": (A, lew) Translated to english for unix course.
...
Install the jq tool to search JSON files
==================================

[FIGURE src=/image/snapht15/jq-logo.png?w=c5 class="right"]

When we work with JSON data, the files can quickly become large and difficult to view and find the information in. Using a tool like jq we can search and view the information in a JSON file.

A tool like jq can be good for the web programmer who is going to work with JSON. This article shows you how to install and get started with the tool.

<!--more-->



The site of jq {#intro}
--------------------------------------

There is a [site for jq](https://stedolan.github.io/jq/) where you can read the manual and there is a tutorial that gives an overview of the tool.



Test the online variant jqplay {#online}
--------------------------------------

There is an online variant [jqplay] (https://jqplay.org/) where you can test run the tool through a web interface. There is also a cheat sheet to help you get started with the basics and there are several built-in examples to help you get started.

[FIGURE src=/image/snapht15/jq-play.png?w=w2 caption="I am testing one of the built-ins in jq."]

Try the built-in designs and edit them to get started with how you can use the tool.



Install {#install}
--------------------------------------

Through the website you will see different options to install. The ones I choose for our most common environments are the following.

Linux/Debian with apt-get.

```bash
$ sudo apt-get install jq
```

OS X with brew.

```bash
$ brew install jq
```

Windows with apt-cyg.

```bash
$ apt-cyg install jq
```



Use the tool at the terminal {#terminal}
--------------------------------------

Once you have installed the tool, you need a JSON file to get started. Here is a [JSON file](https://raw.githubusercontent.com/dbwebb-se/unix/master/example/jq/soklista_lan.json) that contains an overview of vacancies in all of Sweden. Download it or find it in your example folder to start testing.

Download:
```bash
$ wget -O af.json https://raw.githubusercontent.com/dbwebb-se/unix/master/example/jq/soklista_lan.json
```

Find it:
```bash
$ cd unix/example/jq
$ ls
```


Start by displaying the help text about jq as well as its manual page.

```bash
$ jq
$ man jq
```

To view the contents of the JSON file, with color formatting, you can run the following command. The color formatting was turned on for me, even without `-C` but in Cygwin I had to add `-C` to get the color.

```bash
$ jq '.' af.json
$ jq -C '.' af.json
```

The beginning of `af.json` looks like this.

```bash
$ more af.json
{
    "soklista": {
        "listnamn": "lan",
        "sokdata": [
            {
                "antal_ledigajobb": 740,
                "antal_platsannonser": 423,
                "id": 10,
                "namn": "Blekinge l\u00e4n"
            },
```

At the end of `af.json`, there are two values ​​that indicate the total number of vacancies and job postings.

```bash
$ tail af.json
                "antal_ledigajobb": 1040,
                "antal_platsannonser": 293,
                "id": 90,
                "namn": "Ospecificerad arbetsort"
            }
        ],
        "totalt_antal_ledigajobb": 66187,
        "totalt_antal_platsannonser": 36678
    }
}
```

I can select these values ​​as follows.

```bash
$ jq '.soklista.listnamn' af.json
"lan"
$ jq '.soklista.totalt_antal_ledigajobb' af.json
66187
$ jq '.soklista.totalt_antal_platsannonser' af.json
36678
```

Another way to see which keys are in the object is with the built-in `keys` function.

```bash
$ jq 'keys' af.json
[
  "soklista"
]
```

If you then want to see which keys that object contains, you look further.

```bash
$ jq '.soklista | keys' af.json
[
  "listnamn",
  "sokdata",
  "totalt_antal_ledigajobb",
  "totalt_antal_platsannonser"
]
```

In the middle of the file is an array `.soklista.sokdata` containing each county in the form of an object. Let's see how many rows the array contains and what the first and last values ​​contain.

```bash
$ jq '.soklista.sokdata | length' af.json
22
$ jq '.soklista.sokdata[0]' af.json
{
  "antal_ledigajobb": 740,
  "antal_platsannonser": 423,
  "id": 10,
  "namn": "Blekinge län"
}
$ jq '.soklista.sokdata[21]' af.json
{
  "antal_ledigajobb": 1040,
  "antal_platsannonser": 293,
  "id": 90,
  "namn": "Ospecificerad arbetsort"
}
```

Let's list all the IDs that are in the array's respective objects. It is an ID for each county.

```bash
$ jq '.soklista.sokdata[].id' af.json
```

Select all counties whose ID is greater than 30.

```bash
$ jq '.soklista.sokdata[] | select(.id > 30) ' af.json
{
    "antal_ledigajobb": 1040,
    "antal_platsannonser": 293,
    "id": 90,
    "namn": "Ospecificerad arbetsort"
}
```

Select the county that has an ID equal to 6.

```bash
$ jq '.soklista.sokdata[] | select(.id == 6) ' af.json
{
    "antal_ledigajobb": 2556,
    "antal_platsannonser": 1396,
    "id": 6,
    "namn": "Jönköpings län"
}
```

There were a couple of examples so you get started on your own. Look through the manual so you know what designs you can use.



Finally {#final}
--------------------------------------

A tool like jq can be handy when working with large JSON files and when testing your own files to see what they contain and how you can search the data from them.
