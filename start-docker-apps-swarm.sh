#!/bin/sh
echo 'Create network'
docker network create --driver=overlay --attachable cleaner-network

echo 'Pull images'
docker pull ghcr.io/grabslabs/docker-cleaner:latest

echo 'Deploy stack'
docker stack rm docker-cleaner
docker stack deploy --compose-file docker-compose.yml docker-cleaner
