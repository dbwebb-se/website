<?php
/**
 * Config-file for navigation bar.
 *
 */
return [

    /**
     * Callback tracing the current selected menu item base on scriptname
     *
     */
    "callback" => function ($url) {
        if ($url == $this->di->get("request")->getCurrentUrl(false)) {
            return true;
        }
    },



    /**
     * Callback to check if current page is a decendant of the menuitem, this check applies for those
     * menuitems that has the setting "mark-if-parent" set to true.
     *
     */
    "is_parent" => function ($parent) {
        $route = $this->di->get("request")->getRoute();
        return !substr_compare($parent, $route, 0, strlen($parent));
    },



   /**
     * Callback to create the url, if needed, else comment out.
     *
     */
   /*
    "create_url" => function ($url) {
        return $this->di->get("url")->create($url);
    },
    */



    // Name of this menu
    "navbarTop" => [
        // Use for styling the menu
        "wrapper" => null,
        "class" => "rm-default rm-desktop",

        // Here comes the menu strcture
        "items" => [

            "kurser" => [
                "text"  =>"<i class=\"icon fa fa-graduation-cap\"></i> Kurser",
                "url"   => $this->di->get("url")->create("kurser"),
                "title" => "Jobba med kurserna"
            ],

            "material" => [
                "text"  =>"<i class=\"icon fa fa-book\"></i> Material",
                "url"   => $this->di->get("url")->create("material"),
                "title" => "Kurs- och utbildningsmaterial"
            ],

            "community" => [
                "text"  =>"<i class=\"icon fa fa-users\"></i> Community",
                "url"   => $this->di->get("url")->create("community"),
                "title" => "Delta i communityn"
            ],

            // "utbildning" => [
            //     "text"  =>"<i class=\"icon fa fa-university\"></i> Utbildning",
            //     "url"   => $this->di->get("url")->create("utbildning"),
            //     "title" => "Läs om de utbildningar vi erbjuder inom webbprogrammering och webbutveckling",
            // ],
        ],
    ],



    // Name of this menu
    "navbarMax" => [
        // Use for styling the menu
        "id" => "rm-menu",
        "wrapper" => null,
        "class" => "rm-default rm-mobile",

        // Here comes the menu strcture
        "items" => [

            "kurser" => [
                "text"  =>"<i class=\"fa fa-graduation-cap\"></i> Kurser",
                "url"   => $this->di->get("url")->create("kurser"),
                "title" => "Jobba med kurserna",

                "submenu" => [
                    "items" => [
                        "python" => [
                            "text"  =>"python",
                            "url"   => $this->di->get("url")->create("kurser/python"),
                            "title" => "Kursen python"
                        ],

                        "htmlphp" => [
                            "text"  =>"htmlphp",
                            "url"   => $this->di->get("url")->create("kurser/htmlphp"),
                            "title" => "Kursen htmlphp"
                        ],

                        "javascript1" => [
                            "text"  =>"javascript1",
                            "url"   => $this->di->get("url")->create("kurser/javascript1"),
                            "title" => "Kursen javascript1"
                        ],

                        "design" => [
                            "text"  =>"design",
                            "url"   => $this->di->get("url")->create("kurser/design"),
                            "title" => "Kursen design"
                        ],

                        "linux" => [
                            "text"  =>"linux",
                            "url"   => $this->di->get("url")->create("kurser/linux-v2"),
                            "title" => "Kursen linux"
                        ],

                        "oopython" => [
                            "text"  =>"oopython",
                            "url"   => $this->di->get("url")->create("kurser/oopython"),
                            "title" => "Kursen oopython"
                        ],

                        "webapp" => [
                            "text"  =>"webapp",
                            "url"   => $this->di->get("url")->create("kurser/webapp"),
                            "title" => "Kursen webapp"
                        ],

                        "databas" => [
                            "text"  =>"databas",
                            "url"   => $this->di->get("url")->create("kurser/databas"),
                            "title" => "Kursen databas"
                        ],

                        "oophp" => [
                            "text"  =>"oophp",
                            "url"   => $this->di->get("url")->create("kurser/oophp"),
                            "title" => "Kursen oophp"
                        ],

                        "ramverk1" => [
                            "text"  =>"ramverk1",
                            "url"   => $this->di->get("url")->create("kurser/ramverk1"),
                            "title" => "Kursen ramverk1"
                        ],

                        "ramverk2" => [
                            "text"  =>"ramverk2",
                            "url"   => $this->di->get("url")->create("kurser/ramverk2"),
                            "title" => "Kursen ramverk2"
                        ],

                        "webgl" => [
                            "text"  =>"webgl",
                            "url"   => $this->di->get("url")->create("kurser/webgl"),
                            "title" => "Kursen webgl"
                        ],

                        "faq" => [
                            "text"  =>"FAQ",
                            "url"   => $this->di->get("url")->create("kurser/faq"),
                            "title" => "Kursen faq"
                        ],

                    ],
                ],
            ],

            "material" => [
                "text"  =>"<i class=\"fa fa-book\"></i> Material",
                "url"   => $this->di->get("url")->create("material"),
                "title" => "Kurs- och utbildningsmaterial",

                "submenu" => [
                    "items" => [
                        "blogg" => [
                            "text"  =>"Blogg",
                            "url"   => $this->di->get("url")->create("blogg"),
                            "title" => "Läs om dbwebb, kurserna, webbprogrammering och webbutveckling och utbildning i allmänhet"
                        ],

                        "kunskap" => [
                            "text"  =>"Kunskapsbanken",
                            "url"   => $this->di->get("url")->create("kunskap"),
                            "title" => "Läs kunskapsartiklar"
                        ],

                        "coachen" => [
                            "text"  =>"Tips från Coachen",
                            "url"   => $this->di->get("url")->create("coachen"),
                            "title" => "Läs tips från coachen"
                        ],

                        "uppgifter" => [
                            "text"  =>"Uppgiftsbanken",
                            "url"   => $this->di->get("url")->create("uppgift"),
                            "title" => "Jobba med uppgifter och övningar"
                        ],
                    ],
                ],
            ],

            "community" => [
                "text"  =>"<i class=\"fa fa-users\"></i> Community",
                "url"   => $this->di->get("url")->create("community"),
                "title" => "Delta i communityn",

                "submenu" => [
                    "items" => [
                        "forum"  => [
                            "text"  => "Forum",
                            "url"   => $this->di->get("url")->create("forum"),
                            "title" => "Diskutera i forumet",
                        ],

                        "irc"  => [
                            "text"  => "Chatt",
                            "url"   => $this->di->get("url")->create("irc"),
                            "title" => "Chatta på IRC och Gitter",
                        ],

                        "social"  => [
                            "text"  => "Social",
                            "url"   => $this->di->get("url")->create("social"),
                            "title" => "Sociala tjänster och nätverk",
                        ],
                    ],
                ],
            ],

            // "utbildning" => [
            //     "text"  =>"<i class=\"fa fa-university\"></i> Utbildning",
            //     "url"   => $this->di->get("url")->create("utbildning"),
            //     "title" => "Läs om de utbildningar vi erbjuder inom webbprogrammering och webbutveckling",
            //
            //     "submenu" => [
            //         "items" => [
            //             "180hp"  => [
            //                 "text"  => "Webbprogrammering 180hp campus",
            //                 "url"   => $this->di->get("url")->create("utbildning/webbprogrammering-180hp-campus"),
            //                 "title" => "Läs om programmet Webbprogrammering 180hp på campus",
            //             ],
            //
            //             "120hp"  => [
            //                 "text"  => "Webbprogrammering 120hp distans",
            //                 "url"   => $this->di->get("url")->create("utbildning/webbprogrammering-120hp-distans"),
            //                 "title" => "Läs om programmet Webbprogrammering 120hp på distans",
            //             ],
            //
            //             "webutv"  => [
            //                 "text"  => "Webbutveckling och Programmering 30hp distans",
            //                 "url"   => $this->di->get("url")->create("utbildning/webbutveckling-och-programmering-30hp"),
            //                 "title" => "Läs om kurspaketet Webbutveckling och Programmering 30hp",
            //             ],
            //
            //             "webprog"  => [
            //                 "text"  => "Webbprogrammering och Databaser 30hp distans",
            //                 "url"   => $this->di->get("url")->create("utbildning/webbprogrammering-och-databaser-30hp"),
            //                 "title" => "Läs om kurspaketet Webbprogrammering och Databaser 30hp",
            //             ],
            //         ],
            //     ],
            // ],

            // "om" => [
            //     "text"  =>"Om",
            //     "url"   => $this->di->get("url")->create("om"),
            //     "title" => "Läs om webbplatsen, de som står bakom och dess syfte",
            // ],

        ],
    ]
];
