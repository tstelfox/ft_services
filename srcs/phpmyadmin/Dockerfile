FROM alpine:latest

RUN apk update && \
    apk add nginx && \
    apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl \
    apk add wget

RUN mkdir -p /usr/share/webapps
RUN mkdir www

RUN cd /usr/share/webapps && \
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-english.tar.gz
RUN tar -xzvf phpMyAdmin-5.0.2-english.tar.gz
RUN rm -rf phpMyAdmin-5.0.2-english.tar.gz
RUN mv phpMyAdmin-5.0.2-english/* www/
