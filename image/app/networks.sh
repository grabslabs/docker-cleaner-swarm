#!/bin/sh
# see: https://gist.github.com/bastman/5b57ddb3c11942094f8d0a97d461b430
set -e

echo "Start clean docker networks: $(date '+%Y-%m-%d %H:%M:%S')"
sh -c -x `docker network rm $(docker network ls | grep "bridge" | awk '/ / { print $1 }')` ||:
echo "End clean docker networks: $(date '+%Y-%m-%d %H:%M:%S')"
