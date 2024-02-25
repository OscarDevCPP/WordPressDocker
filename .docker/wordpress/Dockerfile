FROM wordpress:latest

ARG UID

RUN adduser -u ${UID} --disabled-password --gecos "" appuser
RUN docker-php-ext-install pdo_mysql \
    && chown -R appuser:appuser /var/www/html
