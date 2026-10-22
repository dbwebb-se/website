# Production image for dbwebb.se (Anax on PHP 8.4, Apache).
# Build context is the repo (see .dockerignore). Content, config and a warm content cache
# are baked in, so a new deploy is a new image. Run it hardened, see deploy/dbwebb-deploy.

FROM composer:2 AS vendor
WORKDIR /app
COPY composer.json ./
# composer.lock is not versioned, so versions float within composer.json.
# symfony/yaml ^3 has security advisories (parsing untrusted input), but the content is ours;
# yaml 6 refuses 60 content files with duplicate keys in "revision:".
# Anax 2.5 on PHP 8: "!in_array(404, ['404 Not Found'])" is no longer true, so every 404 became a 500.
RUN COMPOSER_NO_SECURITY_BLOCKING=1 composer install --no-dev --no-interaction --prefer-dist \
        --optimize-autoloader --ignore-platform-reqs \
 && sed -i 's/!in_array(\$code, \$codes)/!isset($codes[$code])/' vendor/mos/anax/src/MVC/ErrorController.php \
 && grep -q 'isset($codes\[$code\])' vendor/mos/anax/src/MVC/ErrorController.php


FROM php:8.4-apache
RUN apt-get update \
 && apt-get install -y --no-install-recommends libpng-dev libjpeg-dev libfreetype-dev libwebp-dev libzip-dev \
        optipng pngquant libjpeg-turbo-progs \
 && docker-php-ext-configure gd --with-jpeg --with-freetype --with-webp \
 && docker-php-ext-install -j2 gd exif zip opcache \
 && a2enmod rewrite expires headers setenvif remoteip \
 && sed -i 's/^Listen 80$/Listen 8080/' /etc/apache2/ports.conf \
 && rm -rf /var/lib/apt/lists/* /etc/apache2/sites-enabled/*

WORKDIR /app
COPY --from=vendor /app/vendor vendor
COPY config config
COPY content content
COPY htdocs htdocs
COPY script script
COPY docker/error_reporting.php config/error_reporting.php
COPY docker/php.ini /usr/local/etc/php/conf.d/zz-prod.ini
COPY docker/apache.conf /etc/apache2/sites-enabled/000-dbwebb.conf
COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh

# cimage: production mode (development mode prints PHP 8 deprecations into the image stream) and
# no pngout (a separate binary that is not installed; optipng and pngquant are).
RUN sed -i "25s/'development'/'production'/" htdocs/cimage/img*_config.php \
 && sed -i "s/'png_deflate'\( *\)=> true/'png_deflate'\1=> false/" htdocs/cimage/img*_config.php \
 && [ "$(grep -l "'mode' => 'production'" htdocs/cimage/img*_config.php | wc -l)" = 5 ]

# Warm the Anax content index (what "make warm-cache" does) and keep it as a seed.
# The entrypoint copies it to the writable cache at start. It is never validated against
# file changes, so it must be rebuilt with the content, which is what a new image does.
RUN mkdir -p cache/anax-warm cache/anax cache/cimage \
 && php script/cache-warm.php >/dev/null 2>&1 \
 && [ -n "$(ls cache/anax-warm)" ] \
 && mv cache/anax-warm /opt/cache-seed && rm -rf cache/anax/* \
 && chown www-data:www-data cache/anax cache/cimage \
 && chmod +x /usr/local/bin/entrypoint.sh

USER www-data
EXPOSE 8080
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
