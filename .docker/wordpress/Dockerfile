FROM wordpress:php8.1-apache

ARG UID

# Agregar un puerto para apache en el 8080 
# con esto esta disponible el :80 y el :8080
RUN echo "\nListen 8080\n" >> /etc/apache2/ports.conf

RUN adduser -u ${UID} --disabled-password --gecos "" appuser
RUN docker-php-ext-install pdo_mysql \
    && chown -R appuser:appuser /var/www/html
