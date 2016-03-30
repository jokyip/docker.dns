FROM node:4-slim

RUN apt-get update && apt-get -y install bind9 && apt-get clean
WORKDIR /usr/src/app
ADD https://github.com/twhtanghk/server.dns/archive/master.tar.gz /tmp
RUN tar --strip-components=1 -xzf /tmp/master.tar.gz
RUN rm /tmp/master.tar.gz /etc/bind/named.conf && ln -s /usr/src/app/conf.d /etc/bind/conf.d && ln -s /etc/bind/conf.d/named.conf /etc/bind/named.conf
RUN npm install coffee-script -g && npm install
RUN ln -s /usr/local/bin/coffee /usr/bin/coffee
RUN chown .bind /usr/src/app/log && chmod g+w /usr/src/app/log
EXPOSE 53/udp 53/tcp

ENTRYPOINT service bind9 start && npm start
