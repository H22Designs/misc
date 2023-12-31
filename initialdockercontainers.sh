#!/bin/bash

docker volume create portainer_data

docker run -d -p 8000:8000 -p 9000:9000 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

docker run --detach --volume=/var/run/docker.sock:/var/run/docker.sock -p 8881:8080 amir20/dozzle

mkdir /home/bryan/docker/jackett
mkdir /home/bryan/docker/jackett/config
mkdir /home/bryan/docker/jackett/downloads

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

mkdir /home/bryan/docker/uptime-kuma/

docker volume create uptime-kuma
docker run -d --restart=always -p 3001:3001 -v /home/bryan/docker/uptime-kuma:/app/data --name uptime-kuma louislam/uptime-kuma:1

mkdir /home/bryan/docker/grafana

docker run -d -p 3000:3000 --name=grafana \
  --volume /home/bryan/docker/grafana:/var/lib/grafana \
  -e "GF_SERVER_ROOT_URL=http://grafana.attlocal.net/" \
  -e "GF_INSTALL_PLUGINS=grafana-clock-panel" \
  grafana/grafana-enterprise
