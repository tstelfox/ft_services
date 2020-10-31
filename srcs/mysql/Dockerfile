FROM alpine

RUN	apk add mysql mysql-client

COPY srcs/start.sh /tmp/startup.sh
RUN chmod +x /tmp/startup.sh
COPY srcs/my.cnf /etc/
VOLUME /var/lib/mysql

ENTRYPOINT ["/bin/sh", "/tmp/startup.sh"]