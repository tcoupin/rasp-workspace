## Rpi-archiver

Cron to create incremental backup of volumes

Save volume `volume-tosave` every day at 6:00.

```
docker run -d --name archiver -v volume-tosave:/tosave/volume-tosave -v $PWD/backup:/save -e HOUR='6' -e MIN='0' tcoupin/rpi-archiver
```

### Volumes

- Mount all your volumes into `/tosave` path
- Mount a backup space at `/save`

### Setting

Available env vars :

- MIN : minute (default: *)
- HOUR : hour (default: *)
- DAY : day of month (default: *)
- MONTH : month (default: *)
- DOW : day of week (default: *)

Just like a cron file ! See [wiki](https://en.wikipedia.org/wiki/Cron).