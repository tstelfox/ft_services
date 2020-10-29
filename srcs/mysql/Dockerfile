FROM alpine:latest

RUN apk update && apk upgrade --available
RUN apk add mysql mysql-client && \
    rm -rf /var/cache/apk/*

# RUN addgroup mysql mysql
# RUN chown -R mysql:mysql /var/lib/mysql
COPY srcs/my.cnf /etc/mysql/conf.d/my.cnf


VOLUME /var/lib/mysql

# EXPOSE 3306

# COPY srcs/start.sh /tmp/start.sh
# RUN chmod +x /tmp/start.sh
# CMD sh tmp/start.sh
