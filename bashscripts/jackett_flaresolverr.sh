#!/bin/bash

sudo docker run -d \
--name=jackett \
--restart=unless-stopped \
-v /home/bryan/docker/jackett/config:/config \
-v /home/bryan//docker/jackett/downloads:/downloads \
-e PGID=1001 -e PUID=1001 \
-e TZ=America/Chicago \
-p 9117:9117 \
linuxserver/jackett

sudo docker run -d \
  --name=flaresolverr \
  -p 8191:8191 \
  -e LOG_LEVEL=info \
  --restart unless-stopped \
  ghcr.io/flaresolverr/flaresolverr:latest
