## Rpi-archiver

Cron to create incremental backup of volumes

Save volume `volume-tosave` every day at 6:00.

```
docker run -d --name archiver -v volume-tosave:/tosave/volume-tosave -v $PWD/backup:/save -e HOUR='6' tcoupin/rpi-archiver
```

### Volumes

- Mount all your volumes into `/tosave` path
- Mount a backup space at `/save`

### Setting

Available env vars :

- MIN : minute
- HOUR : hour
- DAY : day of month
- MONTH : month
- DOW : day of week

Just like a cron file ! See [wiki](https://en.wikipedia.org/wiki/Cron).