# docker.dns
Dockerfile to create image for restful dns service

Configuration
-------------
## build image
```
bin/build.sh
```

## start mongo db service
Please note to enable mongo auth for production environment 
```
docker pull mongo
docker run -d --name mongo mongo
```

## update service url, port, oauth2, mongo db, log level settings
```
	port:		3000
	url:		'https://mob.myvnc.com/dns'
	oauth2:
		tokenUrl:			'https://mob.myvnc.com/org/oauth2/token/'
		verifyURL:			'https://mob.myvnc.com/org/oauth2/verify/'
		scope:				[ "https://mob.myvnc.com/org/users"]
		client:
			id:		'oauth2 client id'
			secret: 'oauth2 client secret'
	connections:
		mongo:
			adapter:	'sails-mongo'
			driver:		'mongodb'
			host:		'mongo'
			port:		27017
			user:		''
			password:	''
			database:	'dns'
	log:
		level:		'silly'
		custom: new winston.Logger
			level:		'silly'
			transports: [
				new winston.transports.File
					filename:	'log/error.log'
					timestamp:	true
			]
```	

## update dns forwarders in conf/conf.d/named.conf.options
```
	// forwarders {
	// 	0.0.0.0;
	// };
```

## volumes
See bin/start.sh
```
/etc/ssl/certs
/usr/local/share/ca-certificates
/usr/src/app/config/env/production.coffee
/usr/src/app/conf.d
/usr/src/app/log
```

## start service
```
bin/start.sh
```

## service log
error.log and access.log can be found under directory log/.