#!/bin/sh
set -e

echo "Start clean docker cache: $(date '+%Y-%m-%d %H:%M:%S')"
sh -c -x `docker builder prune --force --all --keep-storage 2GB` ||:
echo "End clean docker cache: $(date '+%Y-%m-%d %H:%M:%S')"
