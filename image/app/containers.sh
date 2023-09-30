#!/bin/sh
# see: https://gist.github.com/bastman/5b57ddb3c11942094f8d0a97d461b430
set -e

echo "Start clean docker containers: $(date '+%Y-%m-%d %H:%M:%S')"
if docker ps -qa --filter "status=exited" | grep -q . ; then
    docker rm $(docker ps -qa --no-trunc --filter "status=exited") ||:
else
    echo "No exited containers to remove."
fi
echo "End clean docker containers: $(date '+%Y-%m-%d %H:%M:%S')"
