#!/bin/sh

adduser -D -h /var/ftps tarlo
echo "tarlo:pass" | chpasswd
vsftpd /etc/vsftpd/vsftpd.conf