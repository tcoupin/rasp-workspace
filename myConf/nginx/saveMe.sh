#!/bin/bash

docker run -it --rm -v nginx:/nginx -v $(pwd):/save dduportal/rpi-busybox /save/copy-save.sh
