#!/bin/sh
# Seed the (tmpfs) Anax cache with the content index built with the image, then run Apache.
set -e
cp -r /opt/cache-seed/. /app/cache/anax/
exec apache2-foreground
