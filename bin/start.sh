#!/bin/sh

file=$(readlink -f "$0")
dir=$(dirname $(dirname "$file"))

docker run -d -p 53:53 --link mongo:mongo -v /etc/ssl/certs:/etc/ssl/certs:ro -v /usr/local/share/ca-certificates:/usr/local/share/ca-certificates:ro -v ${dir}/conf/production.coffee:/usr/src/app/config/env/production.coffee -v ${dir}/conf/conf.d:/usr/src/app/conf.d -v ${dir}/log:/usr/src/app/log --name dns1 dns