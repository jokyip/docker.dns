FROM node:4-slim

ENV http_proxy http://proxy1.scig.gov.hk:8080
ENV https_proxy http://proxy1.scig.gov.hk:8080
RUN apt-get update && apt-get -y install bind9 && apt-get clean
WORKDIR /usr/src/app
ADD https://github.com/twhtanghk/server.dns/archive/master.tar.gz /tmp
RUN tar --strip-components=1 -xzf /tmp/master.tar.gz
RUN rm /tmp/master.tar.gz /etc/bind/named.conf && ln -s /usr/src/app/conf.d/named.conf /etc/bind/named.conf
RUN npm install coffee-script -g && npm install

ENTRYPOINT ["npm", "start"]