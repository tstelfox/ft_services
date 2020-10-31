FROM alpine

RUN apk add mysql mysql-client

COPY srcs/my.cnf /etc/mysql/

COPY srcs/start.sh /tmp/start.sh
RUN chmod +x /tmp/start.sh

VOLUME /var/lib/mysql
ENTRYPOINT ["/bin/sh", "/tmp/start.sh"]

# FROM alpine

# RUN	apk add mysql mysql-client

# COPY srcs/start.sh /tmp/startup.sh
# RUN chmod +x /tmp/startup.sh
# COPY srcs/my.cnf /etc/
# VOLUME /var/lib/mysql

# ENTRYPOINT ["/bin/sh", "/tmp/startup.sh"]