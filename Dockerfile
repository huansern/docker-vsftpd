FROM alpine:3.8

ENV UID=1000
ENV GID=1000
ENV USER=owner
ENV PASSWORD=password

RUN apk add --no-cache --update vsftpd && \
rm /etc/vsftpd/vsftpd.conf

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

COPY vsftpd.sh /usr/sbin/vsftpd.sh

EXPOSE 20 21 49100-49110

CMD [ "/usr/sbin/vsftpd.sh" ]
