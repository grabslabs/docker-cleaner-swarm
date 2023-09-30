#!/bin/sh
set -e

echo "Start clean docker containers: $(date '+%Y-%m-%d %H:%M:%S')"
if docker ps -qa --filter "status=exited" | grep -q . ; then
    docker rm $(docker ps -qa --no-trunc --filter "status=exited") ||:
else
    echo "No exited containers to remove."
fi
echo "End clean docker containers: $(date '+%Y-%m-%d %H:%M:%S')"

echo "Start clean docker images: $(date '+%Y-%m-%d %H:%M:%S')"
if docker ps -qa --filter "status=exited" | grep -q . ; then
    # Remove dangling images
    docker rmi $(docker images --filter "dangling=true" -q --no-trunc) ||:
    # Remove images with name "none"
    docker rmi $(docker images | grep "none" | awk '/ / { print $3 }') ||:
else
    echo "No exited images to remove."
fi
echo "End clean docker images: $(date '+%Y-%m-%d %H:%M:%S')"

echo "Start clean postgres logs: $(date '+%Y-%m-%d %H:%M:%S')"
if [ -n "$(ls -A /opt/docker/postgres/data/postgres/pg_log/)" ]; then
    rm /opt/docker/postgres/data/postgres/pg_log/* ||:
else
    echo "No files to remove."
fi
echo "End clean postgres logs: $(date '+%Y-%m-%d %H:%M:%S')"

echo "Start clean docker networks: $(date '+%Y-%m-%d %H:%M:%S')"
docker network ls --filter "driver=bridge" --format "{{.ID}} {{.Name}}" | while read -r id name; do
    docker network rm "$id" || true
done
echo "End clean docker networks: $(date '+%Y-%m-%d %H:%M:%S')"

echo "Start clean docker volumes: $(date '+%Y-%m-%d %H:%M:%S')"
# Check and remove dangling Docker volumes
if [ -n "$(docker volume ls -qf "dangling=true")" ]; then
    docker volume rm $(docker volume ls -qf "dangling=true") ||:
else
    echo "No dangling volumes to remove."
fi
# Check and remove dangling Docker volumes (alternative command)
if [ -n "$(docker volume ls -qf dangling=true)" ]; then
    docker volume ls -qf dangling=true | xargs -r docker volume rm ||:
else
    echo "No dangling volumes to remove (alternative command)."
fi
echo "End clean docker volumes: $(date '+%Y-%m-%d %H:%M:%S')"

echo "Start clean docker cache: $(date '+%Y-%m-%d %H:%M:%S')"
docker builder prune --force --all --keep-storage 2GB ||:
echo "End clean docker cache: $(date '+%Y-%m-%d %H:%M:%S')"

