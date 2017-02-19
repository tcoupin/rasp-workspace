## rpi-telegraf

An ARM Alpine with telegraf inside.

Based on hypriot/rpi-alpine-scratch:edge.

The default config file is at /etc/telegraf/telegraf.conf in a volume.

Init your own telegraf.conf with `docker run --rm tcoupin/rpi-telegraf telegraf config > telegraf.conf`.
