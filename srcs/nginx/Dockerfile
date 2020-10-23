FROM alpine:latest

RUN apk update --no-cache && \
	apk add nginx

RUN adduser -D -g 'www' www && \
	mkdir /www && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www

COPY index.html /var/www/localhost/htdocs/

COPY nginx.conf /etc/nginx/nginx.conf

# SSL certificates
COPY srcs/localhost.key /etc/ssl/certs/
COPY srcs/localhost.cert /etc/ssl/certs/

RUN mkdir -p /run/nginx

EXPOSE 80 443

CMD	["nginx", "-g", "daemon off;"]