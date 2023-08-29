#!/bin/bash
sudo docker create --name=jackett \
--restart=always \
-v /home/bryan/docker/jackett/config:/config \
-v /home/bryan//docker/jackett/downloads:/downloads \
-e PGID=1001 -e PUID=1001 \
-e TZ=America/Chicago \
-p 9117:9117 \
linuxserver/jackett
