## docker-mongo avec mongo 2.4.10

https://hub.docker.com/r/tcoupin/rpi-mongo/

Une image simple pour monter simplement un cluster mongo sur RPi.

Demo : https://asciinema.org/a/cgud6hut2yml8ysflk4wpwr5v

### Master
```
docker run --name mongo-master -p 27017:27017 -v mongodb:/mongodb tcoupin/rpi-mongo
```
### Slave
#### Sur un même host ou avec un overlayNetwork
```
docker run --name mongo-slave -p 27017:27017 --env SLAVE=true --link master:mongo-master -v mongodb:/mongodb tcoupin/rpi-mongo
```
#### Multihost
```
docker run --name mongo-slave -p 27017:27017 --env SLAVE=true --env SOURCE=MASTER_IP:27017 -v mongodb:/mongodb tcoupin/rpi-mongo
```
ou
```
docker run --name mongo-slave -p 27017:27017 --env SLAVE=true --add-host master:MASTER_IP -v mongodb:/mongodb tcoupin/rpi-mongo
```

### Common options
#### Interface HTTP
```
docker run --name mongo-master -p 27017:27017 -p 28017:28017 -v mongodb:/mongodb --env NOHTTPINTERFACE=false tcoupin/rpi-mongo
```
#### Interface REST
```
docker run --name mongo-master -p 27017:27017 -p 28017:28017 -v mongodb:/mongodb --env NOHTTPINTERFACE=false --env REST=true tcoupin/rpi-mongo
```

### Mongo command line
```
docker exec --it mongo-master mongo
```

Pour reconstruire depuis le slave :
```
use admin
db.runCommand({copydb:1,fromhost:"SLAVE_IP",fromdb:"DATABASE_NAME",todb:"DATABASE_NAME",slaveOk:true})
```
