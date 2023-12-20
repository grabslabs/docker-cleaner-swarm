#!/bin/sh
echo 'Create network'
docker network inspect cleaner-network >/dev/null 2>&1 || docker network create --driver=overlay --attachable cleaner-network

echo 'Pull images'
docker pull ghcr.io/grabslabs/docker-cleaner:latest

echo 'Deploy stack'
docker stack rm docker-cleaner-swarm
sleep 30
docker stack deploy --compose-file docker-compose.yml docker-cleaner-swarm
