#!/bin/sh

adduser -D -h /var/ftps tarlo
echo "tarlo:kraken" | chpasswd

vsftpd /etc/vsftpd/vsftpd.conf