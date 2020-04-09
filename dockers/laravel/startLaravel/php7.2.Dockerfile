FROM php:7.2-fpm

COPY composer.phar /usr/local/bin/composer

RUN apt update \
&& apt install -y zlib1g zlib1g-dev \
&& /usr/local/bin/docker-php-ext-install zip \
&& composer global require laravel/installer \
&& composer global require "laravel/lumen-installer" \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /home/quicklygabbing/www
