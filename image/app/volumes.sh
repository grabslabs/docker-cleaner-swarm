#!/bin/sh
# see: https://gist.github.com/bastman/5b57ddb3c11942094f8d0a97d461b430
set -e

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
