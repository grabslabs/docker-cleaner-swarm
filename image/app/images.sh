#!/bin/sh
# see: https://gist.github.com/bastman/5b57ddb3c11942094f8d0a97d461b430
set -e

echo "Start clean docker images: $(date '+%Y-%m-%d %H:%M:%S')"
sh -c -x `docker rmi $(docker images --filter "dangling=true" -q --no-trunc)` ||:
sh -c -x `docker rmi $(docker images | grep "none" | awk '/ / { print $3 }')` ||:
echo "End clean docker images: $(date '+%Y-%m-%d %H:%M:%S')"
