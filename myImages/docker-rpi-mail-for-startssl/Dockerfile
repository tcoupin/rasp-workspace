FROM hypriot/rpi-alpine-scratch
MAINTAINER thibault.coupin@gmail.com

RUN apk update && apk add postfix mutt
RUN newaliases && postalias /etc/postfix/aliases
RUN mkdir /var/mail && ln -s /var/mail /var/spool/mail && touch /var/mail/root

CMD postfix start && mutt
