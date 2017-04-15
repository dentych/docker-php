FROM php:7-fpm-alpine

RUN apk add --no-cache \
        freetype-dev \
        libpng-dev \
        libjpeg-turbo-dev \
        libmcrypt-dev \
    && NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
    && docker-php-ext-install -j${NPROC} iconv mcrypt zip pdo pdo_mysql \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j${NPROC} gd
