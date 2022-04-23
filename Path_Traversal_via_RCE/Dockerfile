FROM php:7.4-apache

# put files
WORKDIR /var/www/html/
COPY ./src .
COPY docker-php.conf /etc/apache2/conf-available/docker-php.conf
COPY httpd.conf /var/www/html/httpd.conf
COPY httpd.conf /etc/apache2/apache2.conf

# config permission
RUN chown -R root:www-data /var/www/html
RUN chmod 777 /var/www/html
RUN find . -type f -exec chmod 777 {} \;
RUN find . -type d -exec chmod 777 {} \;
# add write permission for upload file
RUN chmod g+w /var/www/html/upload/
#enable cgi
RUN a2enmod cgi

RUN echo "CBJS{so_magic_I_wondeR_what_about_other_system?}" > /fead248f338-secret.txt


