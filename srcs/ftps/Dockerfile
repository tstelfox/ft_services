FROM alpine:latest

RUN apk upgrade && \
    apk --update --no-cache add \
    openssl \
    vsftpd

RUN openssl genrsa -out /etc/ssl/certs/vsftpd.key 2048 && \
	openssl req -x509 -days 356 -nodes -new -key /etc/ssl/certs/vsftpd.key \
	-subj '/C=NL/ST=NH/L=Amsterdam/O=Codam/CN=vsftpd' -out /etc/ssl/certs/vsftpd.crt

RUN mkdir -p /var/ftps

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY setup.sh /tmp/
RUN chmod +x /tmp/setup.sh
RUN mkdir -p /tarlo

EXPOSE 20 21

ENTRYPOINT ["/tmp/setup.sh"]