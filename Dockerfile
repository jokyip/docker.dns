FROM node:4-slim

RUN apt-get update && apt-get -y install bind9 && apt-get clean
WORKDIR /usr/src/app
ADD https://github.com/twhtanghk/server.dns/archive/master.tar.gz /tmp
RUN tar --strip-components=1 -xzf /tmp/master.tar.gz
RUN rm /tmp/master.tar.gz /etc/bind/named.conf && ln -s /usr/src/app/conf.d/named.conf /etc/bind/named.conf
RUN npm install coffee-script -g && npm install
RUN ln -s /usr/bin/coffee /usr/local/bin/coffee
RUN echo 'nameserver 127.0.0.1' >/etc/resolv.conf

ENTRYPOINT ["npm", "start"]