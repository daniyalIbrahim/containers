FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
LABEL org.opencontainers.image.source=https://github.com/daniyalibrahim/containers
LABEL org.opencontainers.image.description="container image for postfix smtp server"
LABEL org.opencontainers.image.licenses=MIT

RUN echo "postfix postfix/mailname string DOMAIN_PLACEHOLDER" | debconf-set-selections && \
    echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections && \
    touch /var/log/mail.log && \
    touch /var/log/mail.err && \
    apt-get update -yq && apt-get install -qy mailutils syslog-ng && \
    echo 'nameserver 8.8.8.8' > /var/spool/postfix/etc/resolv.conf

RUN adduser noreply

CMD ["/bin/sh", "-c", "syslog-ng; tail -f /var/log/mail.log & tail -f /var/log/mail.err & postfix start-fg"]