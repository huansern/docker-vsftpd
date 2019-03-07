#!/bin/sh

addgroup -g $GID $USER
adduser -h /$USER -D -u $UID -G $USER -s /bin/false $USER
chown nobody:nogroup /$USER
chmod a-w /$USER

mkdir /$USER/ftp
chown $USER:$USER /$USER/ftp

echo "$USER" | tee -a /etc/vsftpd/vsftpd.userlist
echo "$USER:$PASSWORD" | /usr/sbin/chpasswd

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
