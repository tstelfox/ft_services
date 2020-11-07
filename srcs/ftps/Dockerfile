FROM alpine:latest

RUN apk upgrade && \
    apk --update --no-cache add \
    openssl \
    vsftpd

RUN openssl req -x509 -nodes -newkey rsa:4096 -days 365 -subj '/C=NL/ST=NH/L=Amsterdam/O=Codam/CN=vsftpd' -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt


RUN mkdir -p /var/ftps

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY setup.sh /tmp/
RUN chmod +x /tmp/setup.sh
# RUN mkdir -p /tarlo

EXPOSE 20 21 30000

ENTRYPOINT ["/tmp/setup.sh"]