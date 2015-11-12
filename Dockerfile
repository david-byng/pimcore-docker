FROM php:5.6-apache

MAINTAINER Callum Jones <cj@icj.me>

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libicu-dev \
        libcurl4-openssl-dev \
    && docker-php-ext-install iconv mcrypt mbstring json intl pdo pdo_mysql curl gd \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && rm -rf /var/lib/apt/lists/*

RUN a2enmod rewrite headers ssl

RUN service apache2 restart

VOLUME ["/var/www/html"]

EXPOSE 80
