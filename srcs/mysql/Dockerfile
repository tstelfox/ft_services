FROM alpine

RUN	apk add mysql mysql-client
RUN rm -f /var/cache/apk/*

COPY srcs/start.sh /tmp/start.sh
RUN chmod +x /tmp/start.sh
COPY srcs/my.cnf /etc/
VOLUME /var/lib/mysql

CMD sh /tmp/start.sh