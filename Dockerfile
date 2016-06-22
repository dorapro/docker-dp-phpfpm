FROM php:7-fpm-alpine

RUN set -x \
    && apk add --update --no-cache icu-libs \
    && apk add --no-cache --virtual build-dependencies icu-dev \
    && docker-php-ext-install ftp \
                              intl \
                              opcache \
                              pdo \
                              pdo_mysql \
    && apk del --no-cache --purge build-dependencies
