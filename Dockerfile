FROM php:7.4-apache

# put files
WORKDIR /var/www/html/
COPY ./src .
COPY docker-php.conf /etc/apache2/conf-available/docker-php.conf
COPY apache2.conf /var/www/html/httpd.conf
COPY apache2.conf /etc/apache2/apache2.conf
COPY serve-cgi-bin.conf /etc/apache2/conf-available/serve-cgi-bin.conf
COPY cgi-enabled.conf /etc/apache2/conf-available/cgi-enabled.con

# config permission
RUN chown -R root:www-data /var/www/html
RUN chmod 777 /var/www/html
RUN find . -type f -exec chmod 640 {} \;
RUN find . -type d -exec chmod 750 {} \;
# add all permission for upload file
RUN chmod 777 /var/www/html/upload/
# enable cgi
RUN a2enmod cgi
