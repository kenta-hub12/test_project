FROM php:7.4.30-apache-buster

RUN apt-get update -y && \
    apt-get -y install \
        libicu-dev \
        libzip-dev \
        libonig-dev \
        curl \
        git \
        zip \
        unzip \
        libssl-dev \
        sudo \
        nodejs \
        npm \
        sendmail \
        vim  && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-install intl mbstring opcache pdo_mysql zip && \
    a2enmod rewrite && \
    npm install n -g && \
    n v10.24.0


COPY ./apache2.conf /etc/apache2/
COPY ./000-default.conf /etc/apache2/sites-enabled/
COPY ./php.ini /usr/local/etc/php/php.ini
COPY --from=composer:2.5.5 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/test_project

# 今apacheは動いてない
# 今は手動でdocker exec -it reword-apache-php /bin/bash で2つ開いてphp artisan serve --host 0.0.0.0:8000とnpm run devをすることで開発できる状態にしてる 