#!/bin/sh
# see: https://gist.github.com/bastman/5b57ddb3c11942094f8d0a97d461b430
set -e

echo "Start clean docker networks: $(date '+%Y-%m-%d %H:%M:%S')"
docker network ls --filter "driver=bridge" --format "{{.ID}} {{.Name}}" | while read -r id name; do
    docker network rm "$id" || true
done
echo "End clean docker networks: $(date '+%Y-%m-%d %H:%M:%S')"
