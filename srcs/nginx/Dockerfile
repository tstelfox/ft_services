FROM alpine:3.12

RUN apk update && apk upgrade && \
	apk add nginx && apk add openssl && \
	apk add php7 php7-fpm php7-opcache && \
	apk add php7-gd php7-mysqli php7-zlib php7-curl

# Creating new user and making dir for html files
RUN adduser -D -g 'www' www && \
	mkdir /www && \
	mkdir -p /var/run/nginx && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www

# Generating ssl shit
RUN openssl genrsa -out /etc/ssl/certs/localhost.key 2048 && \
	openssl req -x509 -days 356 -nodes -new -key /etc/ssl/certs/localhost.key \
	-subj '/C=NL/ST=NH/L=Amsterdam/O=Codam/CN=localhost' -out /etc/ssl/certs/localhost.crt

COPY ./srcs/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443

CMD tail -f /dev/null


