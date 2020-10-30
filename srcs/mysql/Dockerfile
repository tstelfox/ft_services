FROM alpine:latest

RUN apk update && apk upgrade --available
RUN apk add mysql mysql-client && \
    rm -rf /var/cache/apk/*

RUN addgroup mysql mysql
COPY srcs/my.cnf /etc/my.cnf
RUN chown -R mysql:root /var/lib/mysql

# ENV MYSQL_ROOT_PASSWORD=kraken

VOLUME ["/var/lib/mysql"]

EXPOSE 3306

COPY srcs/start.sh /tmp/start.sh
RUN chmod +x /tmp/start.sh
CMD sh tmp/start.sh
