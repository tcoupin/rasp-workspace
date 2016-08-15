## docker-mongo

https://hub.docker.com/r/tcoupin/rpi-mongo/

Une image simple pour monter simplement un cluster mongo sur RPi.

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
