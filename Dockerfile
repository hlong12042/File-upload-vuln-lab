FROM php:7.4-apache

# put files
WORKDIR /var/www/html/

COPY ./src .
COPY docker-php.conf /etc/apache2/conf-available/docker-php.conf

COPY apache2.conf /var/www/html/httpd.conf
COPY apache2.conf /etc/apache2/apache2.conf

# config permission
RUN chown -R root:www-data /var/www/html
RUN chmod 777 /var/www/html
RUN find . -type f -exec chmod 777 {} \;
RUN find . -type d -exec chmod 777 {} \;
# add write permission for upload file
RUN chmod 777 /var/www/html/upload/

RUN apt-get update && apt-get install -y libapache2-mod-python
