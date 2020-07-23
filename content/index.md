---
title: Webbprogrammering och Databaser

views:
    flash:
        region: flash
        template: default/image
        data:
            src: "image/tema/trad/tree2.jpg?w=1100&h=400&a=10,0,0,0&cf"

    columns-above-1:
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
                                route: block/home/bth-webbprogrammering
                    column-2:
                        data:
                            meta:
                                type: content
                                route: kurser/block-kurser
                    column-3:
                        data:
                            meta:
                                type: content
                                route: block/home/aktuellt-top

    columns-above-2:
        region: columns-above
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
                                route: block/home/youtube
                    column-2:
                        data:
                            meta:
                                type: content
                                route: block/home/discord
                    column-3:
                        data:
                            meta:
                                type: content
                                route: block/home/github



#    blog-list:
#        region: main
#        template: default/blog-list
#        sort: 2
#        data:
#            dateFormat: j F Y
#            meta:
#                type: toc-route
#                route: blogg
#                orderby: publishTime
#                orderorder: desc
#                items: 10

#    aktuellt:
#        region: sidebar-right
#        template: default/block
#        sort: 1
#        data:
#            meta:
#                type: content
#                route: block/home/aktuellt

#    sidebar-1:
#        region: sidebar-right
#        template: default/block
#        sort: 2
#        data:
#            meta:
#                type: content
#                route: block/home/sidebar-1

#    columns-below-1:
#        region: columns-below
#        template: default/columns
#        sort: 1
#        data:
#            class: col3
#            meta:
#                type: columns
#                columns:
#                    column-1:
#                        data:
#                            meta:
#                                type: content
#                                route: coachen/block-toc
#                    column-2:
#                        data:
#                            meta:
#                                type: content
#                                route: kunskap/block-toc
#                    column-3:
#                        data:
#                            meta:
#                                type: content
#                                route: uppgift/block-toc

#    columns-below-2:
#        region: columns-below
#        template: default/columns
#        sort: 2
#        data:
#            class: col3
#            meta:
#                type: columns
#                columns:
#                    column-1:
#                        data:
#                            meta:
#                                type: content
#                                route: blogg/block-toc
#                    column-2:
#                        data:
#                            meta:
#                                type: content
#                                route: block/empty
#                    column-3:
#                        data:
#                            meta:
#                                type: content
#                                route: block/empty

...
