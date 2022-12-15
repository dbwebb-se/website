<?php
/**
 * Config-file for Anax, theme related settings, return it all as array.
 *
 */
return [

    /**
     * Base view to start render page from.
     */
    "view" => [
        "template" => "default/index",

        "data" => [
            // General
            "htmlClass"     => ["dbwebb"],
            "bodyClass"     => [],
            "lang"          => "sv",
            "charset"       => "utf-8",
            "title_append"  => " | dbwebb",
            "favicon"       => "favicon.ico",

            // Style and stylesheets
            "stylesheets" => ["css/style.min.css?v=2022-12-15"],
            "styleInline" => null,

            // JavaScript
            //"javascripts" => [],
            "javascripts" => ["js-src/theme/responsive-menu.min.js?v=2016-11-28"],
        ],
    ],



    /**
     * Add default views to always include.
     */
    "views" => [
        [
            "region" => "header",
            "template" => "default/header",
            "data" => [
                "homeLink"      => "",
                "siteLogoText"  => "dbwebb",
                "siteLogoTextIcon" => "image/theme/leaf_40x40.png",
                "siteLogoTextIconAlt" => "Liten logo",
                "siteLogo"      => null, //"img/anax.png",
                "siteLogoAlt"   => null, //"Anax Logo",
                "siteTitle"     => null, //"Anax PHP framework",
                "siteSlogan"    => null, //"Reusable modules for web development"
            ],
            "sort" => 2
        ],
        [
            "region" => "header",
            "template" => "default/image",
            "data" => [
                "class" => "logo-1",
                "src" => "image/theme/leaf_256x256.png",
                "alt" => "Logo",
            ],
            "sort" => -1
        ],
        [
            "region" => "navbar2",
            "template" => "default/navbar",
            "data" => [],
            "sort" => -1
        ],
        [
            "region" => "profile",
            "template" => "default/navbar-max",
            "data" => [],
            "sort" => -1
        ],
        [
            "region" => "footer",
            "template" => "default/columns",
            "data" => [
                "class"  => "footer-column",
                "columns" => [
                    [
                        "contentRoute" => "block/footer-col-1",
                    ],
                    [
                        "contentRoute" => "block/footer-col-2",
                    ],
                    [
                        "contentRoute" => "block/footer-col-3",
                    ]
                ]
            ],
            "sort" => 1
        ],
        [
            "region" => "footer",
            "template" => "default/block",
            "data" => [
                "class" => "site-footer",
                "contentRoute" => "block/footer",
            ],
            "sort" => 2
        ],
        [
            "region" => "body-end",
            "template" => "default/google-analytics",
            "data" => [
                "account" => defined("GOOGLE_ANALYTICS")
                    ? GOOGLE_ANALYTICS
                    : null,
            ],
            "sort" => -1
        ],
    ],
];
