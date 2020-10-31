FROM alpine

RUN apk add nginx && \
    apk add curl wget \
    php7-common php7-iconv php7-fpm php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap \
    php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

RUN adduser -D -g 'www' www
RUN mkdir www
RUN mkdir -p /run/nginx

RUN wget -c https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz -C /www
RUN rm -f latest.tar.gz
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www/
# RUN mv wordpress/* /var/www/html


ENV DB_HOST="mysql-service:3306" \
    DB_NAME="wordpress" \
    DB_USER="mysql" \
    DB_PASSWORD="kraken"

COPY srcs/nginx.conf etc/nginx
COPY srcs/wp-config.php var/www/wordpress/
COPY srcs/start.sh /tmp/start.sh
RUN chmod +x /tmp/start.sh && chmod +x /var/www/html/wp-config.php

EXPOSE 5050

CMD sh /tmp/start.sh