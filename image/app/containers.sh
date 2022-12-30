#!/bin/sh
# see: https://gist.github.com/bastman/5b57ddb3c11942094f8d0a97d461b430
set -e

echo "Start clean docker containers: $(date '+%Y-%m-%d %H:%M:%S')"
sh -c -x `docker rm $(docker ps -qa --no-trunc --filter "status=exited")` ||:
echo "End clean docker containers: $(date '+%Y-%m-%d %H:%M:%S')"
