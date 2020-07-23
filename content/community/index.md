---
title: Community

views:
    columns1:
        region: columns-above
        template: default/columns
        sort: 1
        data:
            class: col3
            meta:
                type: columns
                columns:
                    column-1:
                        data:
                            meta:
                                type: content
                                route: block/home/discord
                    column-2:
                        data:
                            meta:
                                type: content
                                #route: block/irc
                                route: block/home/github
                    column-3:
                        data:
                            meta:
                                type: content
                                #route: block/gitter
                                route: block/forum

    columns2:
        region: columns-above-NO
        template: default/columns
        sort: 2
        data:
            class: col3
            meta:
                type: columns
                columns:
                    column-1:
                        data:
                            meta:
                                type: content
                                #route: block/hangout
                                route: block/empty
                    column-2:
                        data:
                            meta:
                                type: content
                                #route: block/lararteam
                                route: block/empty
                    column-3:
                        data:
                            meta:
                                type: content
                                #route: block/youtube
                                route: block/empty

    columns3:
        region: columns-above
        template: default/columns
        sort: 3
        data:
            class: col3
            meta:
                type: columns
                columns:
                    column-1:
                        data:
                            meta:
                                type: content
                                #route: block/github-community
                                route: block/gitter
                    column-2:
                        data:
                            meta:
                                type: content
                                #route: block/youtube
                                route: block/irc
                    column-3:
                        data:
                            meta:
                                type: content
                                #route: block/social
                                route: block/alumni


...
<!--
Community
===========================

Vad göra mer?

Snabb översikt om vad som händer var.

Block om senaste i forum, chatt, github, (gitter).

(Notera senaste "läraraktivitet"?)

Senaste bilden på instagram.

Senaste builds on Travis & Scrutinizer?

Om lärarteamet?
-->
