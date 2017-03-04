#!/bin/bash

docker run -it --rm -v nginx:/nginx -v $(pwd):/save dduportal/rpi-busybox /bin/sh -c 'cp -r /save/data/* /nginx/'
