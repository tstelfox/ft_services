FROM alpine:latest

RUN apk update && \
    apk add nginx && \
    apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl && \
    apk add wget

RUN mkdir -p /usr/share/webapps
RUN mkdir www
RUN mkdir -p /run/nginx

RUN cd /usr/share/webapps
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
RUN tar -xzvf phpMyAdmin-5.0.1-english.tar.gz
RUN rm -rf phpMyAdmin-5.0.1-english.tar.gz
RUN mv phpMyAdmin-5.0.1-english/* www/
RUN chmod -R +x /usr/share/webapps/
RUN ln -s /usr/share/webapps /var/www/localhost/htdocs/phpmyadmin

RUN adduser -D -g 'www' www

COPY ./srcs/nginx.conf /etc/nginx/nginx.conf
COPY ./srcs/config.inc.php /www


EXPOSE 5000

CMD	["nginx", "-g", "daemon off;"]
