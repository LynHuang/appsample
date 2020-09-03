FROM mattrayner/lamp:latest-1804

RUN unlink /var/www/html && ln -s /app/public /var/www/html
RUN echo "extension=mysqli" >> /etc/php/7.4/apache2/php.ini

CMD ["/run.sh"]