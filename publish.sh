#!/bin/sh
echo 'Build images'
docker-compose -f docker-compose.yml -f docker-compose.build.yml build --no-cache

echo 'Publish images'
docker tag docker-cleaner:latest ghcr.io/grabslabs/docker-cleaner:latest
docker push ghcr.io/grabslabs/docker-cleaner:latest