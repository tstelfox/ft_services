FROM alpine:latest

RUN apk update --no-cache && \
	apk add nginx openssh

RUN adduser -D -g 'www' www && \
	mkdir /www && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www

COPY srcs/index.html /var/www/localhost/htdocs/

COPY srcs/nginx.conf /etc/nginx/nginx.conf

# SSH config
RUN ssh-keygen -A
RUN addgroup sshgroup \
	&& adduser -D admin \
	&& echo "admin:kraken" | chpasswd
COPY srcs/sshd_config /etc/ssh/sshd_config

# SSL certificates
COPY srcs/localhost.key /etc/ssl/certs/
COPY srcs/localhost.cert /etc/ssl/certs/

COPY srcs/startup.sh /tmp/startup.sh
RUN chmod +x /tmp/startup.sh

RUN mkdir -p /run/nginx

EXPOSE 80 443 4000

CMD sh /tmp/startup.sh